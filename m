Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF373570514
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:08:13 +0200 (CEST)
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAu56-0004RK-Nq
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0006VC-JJ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtv9-0002fb-5R
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id ay25so3094421wmb.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=arOhUrEykX6T/wdn4c/Rfw9Py5CnhEHkSl6mPSXt/2Q=;
 b=PtyIRllweAUM8WqX0vdd4hE772d1r05p/MFAAdP5qCGfrPB/vUcBWCIV7RQHT0Rx/4
 kDgPpAh/xvIoGlcZpN6nKewUyUP8y8oaRJRHRq8MYgwAu8u3ZGuNzHkD12Lqg9EGwuhT
 KNxcGYTD2qxnufhszxZPwqTw2D+dy1e8Xdy80BHJLAPRqnYK/Aek/I3MnBIDlBJYxKrD
 XkJ7IMV3ag6a7c86nSywtJhp8Bu3lDV1rtuC+/Gclp0VQUpa7n0Z4TC1UoHgGLabPXg7
 Sm6WMSa6CJ4ViaT721dSHV5/3mFMjSD91DbGx7fdPeDYHA5vcHG3WuJ1Rm13CnwoZhPH
 6z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=arOhUrEykX6T/wdn4c/Rfw9Py5CnhEHkSl6mPSXt/2Q=;
 b=vqBOBVJXxcpCXNve4LQ0/yjMJ9G+v2z35EwyNiaBW8y8mOGoqXRZ8hMvdngGLYkgq3
 UZVkvhA5c/iGHMurD4Qwep/M92Mlc8bfjaxEGvv+UC6SQz0r7MmleVi9p7bK/rM4zKvW
 VTeSc0x900LOil68VyLmiWNVxrMDAWzZfa1VKlAVYjQjwJyw/wtu06Pb/y7acL3SWtrV
 ZB2T07OuExnmETtE2gFf5tVkaZUX8m8mGHsrA88pADNd48KUD7Kcpuj5fvkc0XsjgzQ9
 C+iDSrw/W8Z+5otONdVV2r6oTAClwuDy9akzXtrP2kOyZ56sgObrX3tZ4gq2bvdww+O9
 dauQ==
X-Gm-Message-State: AJIora8RoyvfTY6g8CWKdAA5enz72xwuzwq4i/be9T1D1HU9Iwe2j1XS
 FWk2YiZoAlM1jTjY/xywl8o2QAWI7Xu78g==
X-Google-Smtp-Source: AGRyM1uJ/2OoBt1cPEgCs/igfdEOUlEg68tct6pL6s4imVyPsL6H6/sqHzKMmIVDaNoz4CKr0oVfEw==
X-Received: by 2002:a05:600c:4e07:b0:3a1:8548:4dd7 with SMTP id
 b7-20020a05600c4e0700b003a185484dd7mr16441021wmq.170.1657547873710; 
 Mon, 11 Jul 2022 06:57:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.57.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:57:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/45] target/arm: Handle SME in aarch64_cpu_dump_state
Date: Mon, 11 Jul 2022 14:57:06 +0100
Message-Id: <20220711135750.765803-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Dump SVCR, plus use the correct access check for Streaming Mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae6dca2f010..9c58be8b146 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -878,6 +878,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     int i;
     int el = arm_current_el(env);
     const char *ns_status;
+    bool sve;
 
     qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
     for (i = 0; i < 32; i++) {
@@ -904,6 +905,12 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  el,
                  psr & PSTATE_SP ? 'h' : 't');
 
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        qemu_fprintf(f, "  SVCR=%08" PRIx64 " %c%c",
+                     env->svcr,
+                     (FIELD_EX64(env->svcr, SVCR, ZA) ? 'Z' : '-'),
+                     (FIELD_EX64(env->svcr, SVCR, SM) ? 'S' : '-'));
+    }
     if (cpu_isar_feature(aa64_bti, cpu)) {
         qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
     }
@@ -918,7 +925,15 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
-    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
+    if (cpu_isar_feature(aa64_sme, cpu) && FIELD_EX64(env->svcr, SVCR, SM)) {
+        sve = sme_exception_el(env, el) == 0;
+    } else if (cpu_isar_feature(aa64_sve, cpu)) {
+        sve = sve_exception_el(env, el) == 0;
+    } else {
+        sve = false;
+    }
+
+    if (sve) {
         int j, zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
-- 
2.25.1


