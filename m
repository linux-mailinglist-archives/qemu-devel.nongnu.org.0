Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B3647BF3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slk-0005uI-7Y; Thu, 08 Dec 2022 21:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slh-0005ts-Oe
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:41 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slg-0001uc-4P
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:41 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so1974074otl.10
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26da5o9nlyxSfOnK98M7FqxwGpV7sc71vV3Cvt0qTgQ=;
 b=IW4Ig2jNKq+qMOe2Mcv802CjGrPXR4SSoK5VSeRLKDIVVVRLU9wxg9L/oMuIXetvc/
 w1lkfcjXWekx6uXwt+rKA+cjVc/CasZBCILe9WXw0VWxi9HXcF5gnYeAERXd411p+Rcr
 IIZt3i//vmAimv9HcZgriIczBROycP5/DGFgcXuKkaad4D9S9e0/eNCXQAqXucS5WSlS
 jqjPueCC1geyUIQ/hOITPonvXySQh5vaWi3O8gYyjcve9B7W7/u8hFaaXL9AnhFzPofm
 cZ4yeGtx3WlGPygf+TA5kh2xJdiO9ZW2YJKplYheqwmUK15hPZ1r6d+1V9MCp9W3Jn47
 /BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=26da5o9nlyxSfOnK98M7FqxwGpV7sc71vV3Cvt0qTgQ=;
 b=RucM4MA9YRICBLn1B5UWzOYAvfbJnF8eV1L4QwdY2KeliGDIVkNCAOQgDU1KrtLz8/
 PkFTLcopTdVeee1jB7JAFD4sEyUCRS6/PJwepOYJipnJ2VnNI5jzFB6X6d32y44poE0z
 Con2XpSXcdjzuiyH2JKtJQ2CEwr6kUZmGnsmV8AKYjaD8gqWtk+z6RxhcV9jfR4w9nDX
 N+OQxDNnn33vTnWQVXsh3fdi/0ATz2NWa+ft4hermw3gDA1sObeULmR+goTeTAjneSpT
 m+RwGHjqMaehF6q5EMtt93EZZneMx36ycgblhfpVdHODCW1SiE15mmuuPqEiUzTL1q6U
 AkFQ==
X-Gm-Message-State: ANoB5pne1P+7CJMCf3SWEj4O/cSmirQDnjVR1Gx3klHeYpvLNi1MU3Av
 UXRwPIETx6jR4cDi8Jt2mPYfMfNm/cLvBlk6gEc=
X-Google-Smtp-Source: AA0mqf4Qo/nW9RtbUEbXmP5V/hm0SX5r4H2+Pw0zypNPJvoo2jGBDfUtHFOeAg24Dvm463sP1YM+4g==
X-Received: by 2002:a9d:74d1:0:b0:66d:c4f:761f with SMTP id
 a17-20020a9d74d1000000b0066d0c4f761fmr1796301otl.15.1670551538980; 
 Thu, 08 Dec 2022 18:05:38 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 05/27] tcg/s390x: Check for long-displacement facility at
 startup
Date: Thu,  8 Dec 2022 20:05:08 -0600
Message-Id: <20221209020530.396391-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are already assuming the existance of long-displacement, but were
not being explicit about it.  This has been present since z990.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  6 ++++--
 tcg/s390x/tcg-target.c.inc | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 645f522058..7f230ed243 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -52,11 +52,13 @@ typedef enum TCGReg {
 
 #define TCG_TARGET_NB_REGS 64
 
-/* A list of relevant facilities used by this translator.  Some of these
-   are required for proper operation, and these are checked at startup.  */
+/* Facilities required for proper operation; checked at startup. */
 
 #define FACILITY_ZARCH_ACTIVE         2
 #define FACILITY_LONG_DISP            18
+
+/* Facilities that are checked at runtime. */
+
 #define FACILITY_EXT_IMM              21
 #define FACILITY_GEN_INST_EXT         34
 #define FACILITY_LOAD_ON_COND         45
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dea889ffa1..1fcefba7ba 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -3211,6 +3211,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 static void query_s390_facilities(void)
 {
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+    const char *which;
 
     /* Is STORE FACILITY LIST EXTENDED available?  Honestly, I believe this
        is present on all 64-bit systems, but let's check for it anyway.  */
@@ -3232,6 +3233,20 @@ static void query_s390_facilities(void)
     if (!(hwcap & HWCAP_S390_VXRS)) {
         s390_facilities[2] = 0;
     }
+
+    /*
+     * Check for all required facilities.
+     * ZARCH_ACTIVE is done via preprocessor check for 64-bit.
+     */
+    if (!HAVE_FACILITY(LONG_DISP)) {
+        which = "long-displacement";
+        goto fail;
+    }
+    return;
+
+ fail:
+    error_report("%s: missing required facility %s", __func__, which);
+    exit(EXIT_FAILURE);
 }
 
 static void tcg_target_init(TCGContext *s)
-- 
2.34.1


