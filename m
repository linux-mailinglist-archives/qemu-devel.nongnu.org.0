Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6A53C0B1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:18:46 +0200 (CEST)
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt9Q-0007Ev-Uv
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgw-0004qC-NO
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:18 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgu-0000AC-Qa
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:18 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s68so5789327pgs.10
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXeHgaKxYRbNnut8rVp8kMGvsswCzp2UB1e+rQJPl1o=;
 b=MO/d19ACxCCoy6qsYYB+ai06R5Z1kKfPygOWzoX0b4fwX+iqTgUVSu9aCfolQkiDQ2
 XWqxHKAYAum7J1SaQ/WjsgxLSUZfxYkhv+ONWGK+5FhdnTT4HRxxHkbr1Q7z6YREcOcd
 Tz1UQ5w/QWklzKDmbf+lJIimzLQTbvAj5KJW6gcqiWw9hKZx17QEWtTNaaHW5BkFpPP2
 m53lbojSk/9TxRXIiQ5GaVDfOxUdGr1X10NA3y28ch8TlRnRuwkp9zxzZypV0UgjXfRu
 qt3HmWmi7or1h74gGABbkvSthE5B6bee84DnZCxCuhzxvGGIhQk9wSch+bSJu/iXEQte
 Nydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXeHgaKxYRbNnut8rVp8kMGvsswCzp2UB1e+rQJPl1o=;
 b=e3+q3Poxob2FrYmwbHSTq4EHfeFGKkQIoMOkH85/yEQcO9a6jRrArhXWYCe+h3SH9V
 9nRzdyGzxy8wDsU2Wg5TZzkVWGI4Qca3CD6gZz4DaZ56slPkRc+spml3QJXVcGT6FMdk
 7h/A5hiTbapL54r1yA4CPhuYj0Wsuk+HforOkD1El+SrxL1gB4+5M35solicDPJyHfMy
 U50ZAYOmcJpPvcZM5tS46sCPRRqwPLPydaQrOZg9Tv4mzRfqcMMp0YOTs1IQ6fPfXptO
 Ue6mSvKSx5VFLoTxfcG40Um0zBe+XQkh+PHstlRCTtcLaJAb1o+gPibw64ydrGyk+BSn
 ioIw==
X-Gm-Message-State: AOAM531nQWr3FJMJhe81f0IYcdP4x1lf/96C4XsPutFnmErTK8Q/rQx4
 muqRGfJj/QBwrgPQKn2kb9Vx1XIYTGy2vg==
X-Google-Smtp-Source: ABdhPJxhlLa9P4+H9bKJ3aAfqnBks//dBiug8TiH5vdMQRHZbsfatR6Qk3BGhMeEylBffQazkVQARg==
X-Received: by 2002:a05:6a00:170b:b0:51b:cf4b:9187 with SMTP id
 h11-20020a056a00170b00b0051bcf4b9187mr4038553pfc.15.1654206555248; 
 Thu, 02 Jun 2022 14:49:15 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 24/71] target/arm: Add ARM_CP_SME
Date: Thu,  2 Jun 2022 14:48:06 -0700
Message-Id: <20220602214853.496211-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
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

This will be used for controlling access to SME cpregs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h        |  5 +++++
 target/arm/translate-a64.c | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index d9b678c2f1..d30758ee71 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -113,6 +113,11 @@ enum {
     ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
     ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
     ARM_CP_EL3_NO_EL2_C_NZ       = 1 << 18,
+    /*
+     * Flag: Access check for this sysreg is constrained by the
+     * ARM pseudocode function CheckSMEAccess().
+     */
+    ARM_CP_SME                   = 1 << 19,
 };
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8bbd1b7f07..f51d80d816 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1186,6 +1186,22 @@ bool sve_access_check(DisasContext *s)
     return fp_access_check(s);
 }
 
+/*
+ * Check that SME access is enabled, raise an exception if not.
+ * Note that this function corresponds to CheckSMEAccess and is
+ * only used directly for cpregs.
+ */
+static bool sme_access_check(DisasContext *s)
+{
+    if (s->sme_excp_el) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_AccessTrap, false),
+                           s->sme_excp_el);
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
@@ -1958,6 +1974,8 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
         return;
+    } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
+        return;
     }
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-- 
2.34.1


