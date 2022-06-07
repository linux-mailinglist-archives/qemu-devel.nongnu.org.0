Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE7541C77
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:02:14 +0200 (CEST)
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhHB-0001fA-Ru
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5Z-000782-OT
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:09 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5U-0001JF-Eb
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:09 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 123so6615391pgb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+d9/jr06nswWZQd9Uw/cJzKLCMbhQR5Mz1vx++OuQjc=;
 b=oxa3mn+GxfVm296cfiN3atYUva8v4/CQoriD+HFveSiqJFKSaEmv3oVGmCDWjoTGxC
 XhQxxjjvJH+veVIQrkFsoIkDGZ9irSRh9dD89F9ffwhi5cofMalXclwZTXVu/Z4Qv8vz
 A0A4s1vaItTG+N0kL6oX25QL4LWMoFd4S3VXCv3zz1U1qolOntA/QfX8pPfemM2TYrsu
 GMFnc8qahdlCnRNj5xFY5Xz41stkqLy+OV9forniZhtUCsd2BN5yi+WGqs4YXjZgz9aV
 SKNfoOh3TkdXtb3H3xwKrrjfYldvOCeE5/MO20qIJq9u2Hrp47RfUj19pLL0GbPomp4j
 eiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+d9/jr06nswWZQd9Uw/cJzKLCMbhQR5Mz1vx++OuQjc=;
 b=32WtIWXQBMSUXtug+bwhutGlYjiTJAr2CMNmpc3a+KKvjcI65IEOPBCNTNpgLZF/Hl
 yZlg4/ZZOV2bqQMRhDS9zrSQkuh9Av4js09WdmEMGaoKVKrAlgWepB8FHIXuV63wXZVa
 rWzsdiGEn0WSg53+L1IJi2MLDTPXUgo9so6h2J1CEracUj/bh4H9Ww9bx20i2LZxytOZ
 akCwGpnuts+7MwZvWypq3iMyHLR6Wk1T8pQTKWE3YLdNJm130N7qtynaMriOFi/7/+IP
 xHOYhejgquLDPjx+kySPTrcLf7b0m4Gqff46YkVrh7+kUfakuSzbh9mg3FLIiD0wd75D
 BQ2w==
X-Gm-Message-State: AOAM532lBUB/qyWjXK5l3eeVUhC9r0QHDOxVr+vxSNgVgwonoaUn6IRu
 t8TR1tBNXcn2NccjLrbYl90ruPkuQsxFDg==
X-Google-Smtp-Source: ABdhPJx/49U2Xt+Qvfd4kbjJ36thByL1B3w5f7aABd6OkNZjYozUs22AkVcM6UiV03apTjfYq9sNPg==
X-Received: by 2002:a05:6a00:2403:b0:4fd:e84a:4563 with SMTP id
 z3-20020a056a00240300b004fde84a4563mr31429780pfh.60.1654634761933; 
 Tue, 07 Jun 2022 13:46:01 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 03/53] semihosting: Improve condition for config.c and
 console.c
Date: Tue,  7 Jun 2022 13:45:07 -0700
Message-Id: <20220607204557.658541-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While CONFIG_SEMIHOSTING is currently only set for softmmu,
this will not continue to be true.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index ea8090abe3..4344e43fb9 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
 ))
-- 
2.34.1


