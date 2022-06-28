Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B70C55BF69
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:24:30 +0200 (CEST)
Received: from localhost ([::1]:50690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66WL-0000nx-GT
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jj-000240-7G
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jh-0000Xd-OS
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:14 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x4so10975568pfq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wM0GjsxkSw3jZSEeWPTbzsq2rsJJyzwSV/fI9isMOSA=;
 b=Q6X4+tVDZu542rRxiyXP/DmQEVgL3f8z2r9ZH6MiYFpjWSekZlA2qceoD9aO5bnvHw
 hmuXuvuQXFmOKnKZG7ExJt8SRLaqZcafVVvUmo/KHHoTZ4OEpSVuHTI5Z0wEh00hDe4b
 bybj/S158j3hKzIrrbjbt6TvEvoDXxJoe1j8cDTueJL2z1TsygxNglbJE19DH5zjL29R
 LFotj4Pa9DSvck+YheZWBh0BZLFDek+sLKebpN+1BHwv0pF5AZbqe2fWPYMpxFR0BdhC
 CjGJaWS+5sWxCiMx/awPAk4eiGGEqGe6QVqlRtq7MpUp2XTI0sPKc++9NZT89PBCy1IB
 gXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wM0GjsxkSw3jZSEeWPTbzsq2rsJJyzwSV/fI9isMOSA=;
 b=SRaB7s7BBLebzZV31cfsMJY2kUZvBUlX57DEaZFC0AG5NXcshR2zPb/mgSXdVY4J+J
 0a6HUyMtzitE/9slgUTgaWEJIXHlt/DeK1PuNWKr0UM3VIWCFciZvHhbZL5DSkkWNiCO
 pZt/h1PFy4/c8PhB7JHtcyen0P5bq2eTmrsq7y5qsKtlGHh44xiX6RbKCnoYpBSukqnL
 bUZbJ5SNFOgBWKbg+ONH4qTq4drouK/IRoW/7E80V6yEbYyebIubIfY/Wnk2/jKQlpBQ
 zWrysqlorua738/O+aT7GtnadXFzHbvO82NnOKZZP9r3lFP3PK7dtYCmws2KbdSIsh2e
 4PDw==
X-Gm-Message-State: AJIora+DAbEhOo5NWH63JmbEay0tXpJ9XPjfAexarnkdBYQmsXwaaXlw
 Piy6fyjxV0xPvvhnoLpk606KP3t+JPtiXA==
X-Google-Smtp-Source: AGRyM1voQQYryFq3weDp4BuKyttoPHhmo5fYtkH8TmtS3ZYweLhBFXoNmNyp7XJQc1DwlZnkdbERAQ==
X-Received: by 2002:a05:6a00:889:b0:510:91e6:6463 with SMTP id
 q9-20020a056a00088900b0051091e66463mr1708175pfj.58.1656392351360; 
 Mon, 27 Jun 2022 21:59:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 49/60] semihosting: Use console_out_gf for SYS_WRITEC
Date: Tue, 28 Jun 2022 10:23:52 +0530
Message-Id: <20220628045403.508716-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 9d4d6d2812..d61b773f98 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -228,6 +228,15 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * Use 0xdeadbeef as the return value when there isn't a defined
+ * return value for the call.
+ */
+static void common_semi_dead_cb(CPUState *cs, uint64_t ret, int err)
+{
+    common_semi_set_ret(cs, 0xdeadbeef);
+}
+
 /*
  * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
  * There is no error condition, other than returning the original length.
@@ -341,8 +350,7 @@ static const uint8_t featurefile_data[] = {
  * The specification always says that the "return register" either
  * returns a specific value or is corrupted, so we don't need to
  * report to our caller whether we are returning a value or trying to
- * leave the register unchanged. We use 0xdeadbeef as the return value
- * when there isn't a defined return value for the call.
+ * leave the register unchanged.
  */
 void do_common_semihosting(CPUState *cs)
 {
@@ -420,8 +428,12 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(env, args);
-        common_semi_set_ret(cs, 0xdeadbeef);
+        /*
+         * FIXME: the byte to be written is in a target_ulong slot,
+         * which means this is wrong for a big-endian guest.
+         */
+        semihost_sys_write_gf(cs, common_semi_dead_cb,
+                              &console_out_gf, args, 1);
         break;
 
     case TARGET_SYS_WRITE0:
-- 
2.34.1


