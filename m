Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824106DB879
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:06:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysO-0004Bt-3i; Fri, 07 Apr 2023 23:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys4-00046A-Nl
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:08 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys3-0004WW-40
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:08 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-62e62c2fbc3so273548b3a.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gzu1AS/Q0oolCiATqMvs9UIOuiHEvGAooRn6q/C3R8E=;
 b=U7LR/u4jCS4SDehGeBbXPyApjo1EoVdQthKRJSIDi5B4sZsoHnXBn/VmkRxxopSdAs
 fXNjwqIwKr/bMNsGnmaUlh0h4oadBKiCfdQgJ5ASRWNz9BrQqXwVI629oEZ6n8adNkx+
 nSmocfMq72ms79kDi7YxAWwCzB+dYOG468CgaHLbCb0bp8xv23KXayeLsTWZZeKntEFn
 amlRQUO6RhjxeIiLJYIvJIhH4kAQuN3vJaRQe7vrZ9yKSID+3LKb9Eyjo7KNW96h9xjW
 FBx+hIBJq3tKYTHNkid87Y0pcUNHEjFq05MKDpn9ta29gAacKAh15IylFJPjNIKFneJM
 c+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gzu1AS/Q0oolCiATqMvs9UIOuiHEvGAooRn6q/C3R8E=;
 b=ZffO+/cNA25M9G1xeW+UXxFq2FBEcHBP7Prp5SH9aj34L0O6+Ia98P23vXmuWw9FUw
 aiXqaPJvFNMP3Lv1w/uZtmvrSjOXIeHW+8PxjhxGO8dzEkrBDdhnG2xGmyJWXs/nkbMq
 e/ngrCLBcOhLZSZKi4Z6HbsxKIr6ULwx1BRXq51HkpR0skkwVXiuK7aHei/fc4y9AFiG
 Zk4hhqdGG1S9Xh9huWVgX2xy670nQplm+YBfdj7lq1zFNo2ooSBtvLwXT3Wdl79vLOys
 b15lf9SeJqunKN1jm9rHgzDDsCJm5imaGboruFT7fkIUneAZNTKq0Jk5lZ89huEWXTks
 0n1w==
X-Gm-Message-State: AAQBX9e3piIIrLE0QAt3q/nWgySJWrgB2wxHMEqqwLfVC2TrBKw5UzQs
 QWswW6nAaz6n0WRKO/JJu+w9fS/cJThj6GZRM9I=
X-Google-Smtp-Source: AKy350aAFRa39nW/RgZtPkq4H7HMQcOQSC5+uz5Y7B43V93iOotp1qwsUZS/Jq+gMjQFNi8vc6gUrQ==
X-Received: by 2002:a62:1c8c:0:b0:626:80f:7a0d with SMTP id
 c134-20020a621c8c000000b00626080f7a0dmr4027913pfc.8.1680923045697; 
 Fri, 07 Apr 2023 20:04:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 06/12] tcg/mips: Split out tcg_out_movi_two
Date: Fri,  7 Apr 2023 20:03:53 -0700
Message-Id: <20230408030359.3368868-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Emit all 32-bit signed constants, which can be loaded in two insns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index f0ae418ba6..78710a25bf 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -531,6 +531,22 @@ static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
     return false;
 }
 
+static bool tcg_out_movi_two(TCGContext *s, TCGReg ret, tcg_target_long arg)
+{
+    /*
+     * All signed 32-bit constants are loadable with two immediates,
+     * and everything else requires more work.
+     */
+    if (arg == (int32_t)arg) {
+        if (!tcg_out_movi_one(s, ret, arg)) {
+            tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
+            tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg & 0xffff);
+        }
+        return true;
+    }
+    return false;
+}
+
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
@@ -538,21 +554,18 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         arg = (int32_t)arg;
     }
 
-    if (tcg_out_movi_one(s, ret, arg)) {
+    /* Load all 32-bit constants. */
+    if (tcg_out_movi_two(s, ret, arg)) {
         return;
     }
 
-    if (TCG_TARGET_REG_BITS == 32 || arg == (int32_t)arg) {
-        tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
+    tcg_out_movi(s, TCG_TYPE_I32, ret, arg >> 31 >> 1);
+    if (arg & 0xffff0000ull) {
+        tcg_out_dsll(s, ret, ret, 16);
+        tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg >> 16);
+        tcg_out_dsll(s, ret, ret, 16);
     } else {
-        tcg_out_movi(s, TCG_TYPE_I32, ret, arg >> 31 >> 1);
-        if (arg & 0xffff0000ull) {
-            tcg_out_dsll(s, ret, ret, 16);
-            tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg >> 16);
-            tcg_out_dsll(s, ret, ret, 16);
-        } else {
-            tcg_out_dsll(s, ret, ret, 32);
-        }
+        tcg_out_dsll(s, ret, ret, 32);
     }
     if (arg & 0xffff) {
         tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg & 0xffff);
-- 
2.34.1


