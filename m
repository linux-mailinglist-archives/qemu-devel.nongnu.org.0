Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1156FE1EE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:54:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwm7I-00030m-BM; Wed, 10 May 2023 11:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7F-0002zS-UK
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7B-0004T2-Nm
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so15465605e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683733948; x=1686325948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GuI9OnpIiD+w0k07S0dmYYpQrmGPfKuDmKUIYtzB2PA=;
 b=RPP39WSgX4rdWd1fca6h28WNNGUtyFNtMh9KJwGWiS3ejp9McbhhX4J4j7p1KU8NfM
 yWBRp0kRf9lHiCPPNqDFa4yKtnu6KJL8act1mO9mew20M1Zga3ObVGG3fOxj68l/2V/0
 6uBefTUt8+QJ/k9KMwAR1RB2G5COfghk+uwF4DeESHj6G9TZK/tDIbwZ3+3RZ1710Rcn
 OBknzqJOO1BGzJLZQxcWJ7IUAwXTXgFyY3Tvej7udZdyrwNajahoiux0Pp5Qxk9Cujjy
 TgrSBiIma+Li+FHp1ejdw5ePKTqOgPhcgeb2Qdaqv8p841xr3orfuiB5UM0PNZEkGdRX
 EVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683733948; x=1686325948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GuI9OnpIiD+w0k07S0dmYYpQrmGPfKuDmKUIYtzB2PA=;
 b=Chx42VW8s8zmEAoHkP2vF/VbuF2rOjNl/y8G3D/1dMNx4TFHn8VuXHseUnxNTKqBGM
 US/WZmp8rwyDT0GH1QcwT8/2/2MoyNy1tpoCgfd/slnJGZiOPgawgQCMMSevjF3/72G2
 xYKI3swvbL7PpcKxFhVvjLoOplq4MiFnxPAeO4miyyd4/uHVUn9WmLYNWV6HfPxV0UTi
 QBSC11PjMhCGUy9jISVSRWe8PSTtDFGtLmYbumaW0C+xBDvyNOTZ3BTKQ4/jq0h1ASbU
 FKvMBo6cg6s78rzYCd3AST9NDy8dHeAHU0/krnNO+aVMx7IVnhA1vDekC1+F8dn0sooT
 4c0Q==
X-Gm-Message-State: AC+VfDx5bTqGBEGm3qioYeae9msbqsgzwgCib581EaINyxi6O5OKHKjV
 DvZKt6nyHS/FGkWM47wCFBl+YtiyYuNe9JJDs40B1g==
X-Google-Smtp-Source: ACHHUZ6rRD/LvE2/RrWilz8bTPRhBKvePwVPVwpkqkxzx5Dc1r3HD5ytGi9jki6yAPYIf5/oSE7hPQ==
X-Received: by 2002:a05:600c:2059:b0:3f4:2492:a91f with SMTP id
 p25-20020a05600c205900b003f42492a91fmr8116849wmg.27.1683733947820; 
 Wed, 10 May 2023 08:52:27 -0700 (PDT)
Received: from stoup.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm23157946wmk.35.2023.05.10.08.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:52:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 1/5] disas: Move disas.c to disas/
Date: Wed, 10 May 2023 16:52:22 +0100
Message-Id: <20230510155226.647756-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510155226.647756-1-richard.henderson@linaro.org>
References: <20230510155226.647756-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230503072331.1747057-80-richard.henderson@linaro.org>
---
 meson.build              | 3 ---
 disas.c => disas/disas.c | 0
 disas/meson.build        | 4 +++-
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename disas.c => disas/disas.c (100%)

diff --git a/meson.build b/meson.build
index 0149bd634f..7c7799c9ee 100644
--- a/meson.build
+++ b/meson.build
@@ -3152,9 +3152,6 @@ specific_ss.add(files('cpu.c'))
 
 subdir('softmmu')
 
-common_ss.add(capstone)
-specific_ss.add(files('disas.c'), capstone)
-
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
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
-- 
2.34.1


