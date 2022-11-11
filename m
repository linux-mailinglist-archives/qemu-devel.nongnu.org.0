Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B36254E6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:08:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOjd-0001Ve-KG; Fri, 11 Nov 2022 02:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOjV-0001Pe-NF
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:45:49 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOjT-00018N-Vi
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:45:49 -0500
Received: by mail-pl1-x62f.google.com with SMTP id b21so3620646plc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WRIZMZP9j9SPp1EX0fHgPhfmFfX9VpYNwtU5BnkhtFg=;
 b=Gk9KJFPQEzCagr6T2N754tZLBBzWJCmqprvYfaQ49S4xlAysH4FeBEJwr+WT2xRaBn
 VKlPTFfgNAfk3GtS/ZXJ2Ps3e2LhRA8lIn0xIMYlEebF/a1NS4J7jPhB/aGeyceYu0gO
 V+zd3n8iw8g+M2MO67xYmR2EfwTh1VKEnjVob6ziSa02Ri7vyAiij37AAy7Xinvphz+v
 2C48DWjBBlC2CMI6JVJLVMj1iMve862OklW3WqFfWsweew43Zyt3KEPHGQJrua4sIEfQ
 Fyx2nQvKb4bBjy/UE+16P+5A1oYGEV++ZzDFy8jUaKd/+VGzI1K0dGU6cMC+1vwrfTa3
 0tnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRIZMZP9j9SPp1EX0fHgPhfmFfX9VpYNwtU5BnkhtFg=;
 b=Cf8ANXuxTNyc/LdGqlkL6OWKxU7gcli3DGeFAl0C798v+S9cAiRw77YWMBRfk3FnWh
 qvq8R+7xJSGEb/gatRMN8sHwQqHj77gkzrqMswQemmPGx+2MnkTqh4uUadTC1TfDk+/X
 UGiUCMTXSV0gUACGAEnKUTFE3g10+k4wWj+MgUZ2DfEEQVT8YzWAHL254qO0WJq4D0hs
 TDIWaX4KZ2VmXdbVqlbQNEO+D1f9F941HZpzfmI43zn0VODoU7poWRdDDy+I59I22EYR
 fie4/YtrWaaTaDJuMye3pUy5ANhjz1aw+8HdNf34gjr5/UYgAK1qKRPnPtvFlsekO2tm
 bbmQ==
X-Gm-Message-State: ANoB5plHbvx9xs7c344eTLzP5pTKMN+nrlf/1opWJPd/DkL3rBh/wySW
 Jxysr7HTWmHHGoLD0AZ8gEhzCMkrBXC5F4em
X-Google-Smtp-Source: AA0mqf7aozVzxTFnMcbI7SceANCA0DgKnydDQgAoa1jpVSw1hmx24Y/XFvtGpL9dMUGCujOHbzUJJw==
X-Received: by 2002:a17:902:a60b:b0:17f:66ae:b84 with SMTP id
 u11-20020a170902a60b00b0017f66ae0b84mr1532090plq.32.1668152746695; 
 Thu, 10 Nov 2022 23:45:46 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e80d00b001869f2120a6sm983802plg.108.2022.11.10.23.45.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:45:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 42/45] tcg: Add basic data movement for TCGv_i128
Date: Fri, 11 Nov 2022 17:40:58 +1000
Message-Id: <20221111074101.2069454-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Add code generation functions for data movement between
TCGv_i128 (mov) and to/from TCGv_i64 (concat, extract).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ++++
 tcg/tcg-internal.h   | 13 +++++++++++++
 tcg/tcg-op.c         | 20 ++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 79b1cf786f..c4276767d1 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -712,6 +712,10 @@ void tcg_gen_extrh_i64_i32(TCGv_i32 ret, TCGv_i64 arg);
 void tcg_gen_extr_i64_i32(TCGv_i32 lo, TCGv_i32 hi, TCGv_i64 arg);
 void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg);
 
+void tcg_gen_mov_i128(TCGv_i128 dst, TCGv_i128 src);
+void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg);
+void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi);
+
 static inline void tcg_gen_concat32_i64(TCGv_i64 ret, TCGv_i64 lo, TCGv_i64 hi)
 {
     tcg_gen_deposit_i64(ret, lo, hi, 32, 32);
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 33f1d8b411..e542a4e9b7 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -117,4 +117,17 @@ extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
 extern TCGv_i32 TCGV_HIGH(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
 #endif
 
+static inline TCGv_i64 TCGV128_LOW(TCGv_i128 t)
+{
+    /* For 32-bit, offset by 2, which may then have TCGV_{LOW,HIGH} applied. */
+    int o = HOST_BIG_ENDIAN ? 64 / TCG_TARGET_REG_BITS : 0;
+    return temp_tcgv_i64(tcgv_i128_temp(t) + o);
+}
+
+static inline TCGv_i64 TCGV128_HIGH(TCGv_i128 t)
+{
+    int o = HOST_BIG_ENDIAN ? 0 : 64 / TCG_TARGET_REG_BITS;
+    return temp_tcgv_i64(tcgv_i128_temp(t) + o);
+}
+
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index cd1cd4e736..658cee7d6c 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2745,6 +2745,26 @@ void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
     tcg_gen_shri_i64(hi, arg, 32);
 }
 
+void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg)
+{
+    tcg_gen_mov_i64(lo, TCGV128_LOW(arg));
+    tcg_gen_mov_i64(hi, TCGV128_HIGH(arg));
+}
+
+void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi)
+{
+    tcg_gen_mov_i64(TCGV128_LOW(ret), lo);
+    tcg_gen_mov_i64(TCGV128_HIGH(ret), hi);
+}
+
+void tcg_gen_mov_i128(TCGv_i128 dst, TCGv_i128 src)
+{
+    if (dst != src) {
+        tcg_gen_mov_i64(TCGV128_LOW(dst), TCGV128_LOW(src));
+        tcg_gen_mov_i64(TCGV128_HIGH(dst), TCGV128_HIGH(src));
+    }
+}
+
 /* QEMU specific operations.  */
 
 void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
-- 
2.34.1


