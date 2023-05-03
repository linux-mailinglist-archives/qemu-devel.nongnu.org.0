Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE06F523D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:50:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tx-0006G3-1P; Wed, 03 May 2023 03:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ti-000594-Re
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tg-0005dk-TQ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:34 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so29322655e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098852; x=1685690852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NrKz9CQ1mrfXFFvLfMfbFRywQxa/2+u5I9vubBHB+Is=;
 b=QGfgbV6lH7B6clKvomqga3XtezDOBrH5MpEAmcx+n0H1Fi0odOn3cWts98TwqYdkZv
 DRDrB+qcUTHuPnCknpfBKNptQRErTZ8PHrg1ngj+dibppRpri3FcCDSSdYT0ko3Tl76D
 17xfqOxNESTv7hPioE8eowGLUF8QOnW6yo861h2HShHS8z0I8ELgKYXkAjMNyqQ4X1Rw
 Vc9+9ZW1NGdSh6vTc6SG7rV7KTUQlXPjh3n4k0Fk5G6E7nDnat0xqnyRfiXd5Nq1CLLp
 FZltz2ntpkEgN4EEmy0VukaLv0zqDPcvoPqjZ2GAhukrhcuqwAM7S4FsSHQMvu+DGRBZ
 Tk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098852; x=1685690852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NrKz9CQ1mrfXFFvLfMfbFRywQxa/2+u5I9vubBHB+Is=;
 b=fd73/STVipsTciogaMoFMNCXPZ1dTONza4dNmiu3lFRIcIkEL2srUebhv1bkLhRcR3
 hblkC7tQj5pC2Kk2CATTIfujcwIUQsIrDrzcdTctgOkbxUTMIf/x4tlgAhEZZj7vu051
 rurgiJr0Hw5tcSHjTANLP6CNsAzcklkt43JCkU2TwRXjHxCfyDjMOQglOB3+UAVTNCTM
 EsADRKowTH2Tw+B7nYTraKd6cBcwlObbRRSd/e17hz8Nzc1axByvH4FPjjOr7VXrI4qE
 JZ2C5p2ZXzt/w8gKeDJ5Ph1uE/g0j1zFxF5NCAD2QG7m6fsGK89vdM3bf/TZf0yDg5sp
 3GMg==
X-Gm-Message-State: AC+VfDyeqVr3soiMSx0o0OgiB5Vs5E1iKOeD/3p76I4lBaNWtRvr4u1z
 oT080vb+ViHu7p1dkKP7Yq6YbbjbBGCLV+t5uT2c/A==
X-Google-Smtp-Source: ACHHUZ53SLa/wY5E1Z3lPJ6+Ph3N9wvKFEbq3QL+QdcxEtvaNil+iFJGHppLdaFBDTnLXdW7JTa+uw==
X-Received: by 2002:a05:600c:2209:b0:3f1:94fe:65e2 with SMTP id
 z9-20020a05600c220900b003f194fe65e2mr13465031wml.33.1683098852191; 
 Wed, 03 May 2023 00:27:32 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 79/84] disas: Move disas.c to disas/
Date: Wed,  3 May 2023 08:23:26 +0100
Message-Id: <20230503072331.1747057-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c => disas/disas.c | 0
 disas/meson.build        | 4 +++-
 meson.build              | 3 ---
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename disas.c => disas/disas.c (100%)

diff --git a/disas.c b/disas/disas.c
similarity index 100%
rename from disas.c
rename to disas/disas.c
diff --git a/disas/meson.build b/disas/meson.build
index c865bdd882..cbf6315f25 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -10,4 +10,6 @@ common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
-common_ss.add(when: capstone, if_true: files('capstone.c'))
+common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
+
+specific_ss.add(files('disas.c'), capstone)
diff --git a/meson.build b/meson.build
index 4bbdbcef37..e68b7c71b3 100644
--- a/meson.build
+++ b/meson.build
@@ -3161,9 +3161,6 @@ specific_ss.add(files('cpu.c'))
 
 subdir('softmmu')
 
-common_ss.add(capstone)
-specific_ss.add(files('disas.c'), capstone)
-
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
-- 
2.34.1


