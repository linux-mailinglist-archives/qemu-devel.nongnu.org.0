Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46A698B00
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUdt-0007Gh-Af; Wed, 15 Feb 2023 22:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdr-0007F8-1V
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:03 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdo-00004w-Na
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:02 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 24so424295pgt.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MWcfMPzd9PL4JEvdoqxUVWO14/+wVWQFzje3SFl6vk=;
 b=rrKM1dFKYaWD2B+eYgQhlwH5tqQxEIEHlQH/NS4evGCluACblzjNjn+Jz1CySwyXm4
 NRJXT0ARKrfx3YVH2Qq7YTT2msE7HW5ROMnWuBawqrwdTHsdONHi2mNcGqbF0E6jLvae
 Ig4iCJG8MGUxwwKsaJuN0+JoLvMeX09/+3lpJ8x3pR0x85gYSi2wkcUl2s7zXbhC9Vpx
 dQVoEFGC6zom0LF9R0YHPCxbBjIvdm/k7rUsOPBTz0ICmNLzbIfcb7fP/J8580i42ZIm
 FetJDS0WbRBTl6vS9c8PxZ7OqjoJ4eoXE2o6mWE7bt6vnYwnf0dVo5rarrhak701Hi4w
 nXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MWcfMPzd9PL4JEvdoqxUVWO14/+wVWQFzje3SFl6vk=;
 b=spa4XyiBY5CFgsFPUJdTemzCTjGZqLoNigw7alAL0fyxqBk6Zi0p1K9L6kB7i2FszP
 DvZwkRzbe4CZTB/XbsujoTvha3Mjy+Wm5x4fojg3x0VK6/8SlFv9kzLwkjsf1rids11e
 0HwVSpb7S357qRUxLSq4hln6qUvuwzKIGwZHveO8xH5YRqomwJSMm/2q8iwXGHvPmjEL
 quPoAbjKa6ICKVFx2MRHWohJdBgPqafQke9E9PsUVsV+KTYTbeC8v4sWqCDdBfVNdoaf
 VS9GSF4s4cdjGsWNUFcP2vTTU7owzhkTQy4imAGMU9rEEfTrhG3DTADS2rjqtqYgczA8
 9Shg==
X-Gm-Message-State: AO0yUKXBS2z46Xk87pR+pC7Ywo3D3rdfeXEdp744/UbfD7PSJZzdPQcx
 YK8Gk4tjVsapu68bq0Avxdj9JJZIw1fxhhioLH0=
X-Google-Smtp-Source: AK7set/S4HnBD+NTwGdEhGzI/ZmuHYgkCOxgumKwCPeABNfuEE7a7UdfWGuw0FGkYavqLYxDRTaQtA==
X-Received: by 2002:aa7:9ad1:0:b0:5a8:a82a:bd8b with SMTP id
 x17-20020aa79ad1000000b005a8a82abd8bmr3456896pfp.20.1676516939312; 
 Wed, 15 Feb 2023 19:08:59 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:08:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the high
 bits
Date: Wed, 15 Feb 2023 17:08:36 -1000
Message-Id: <20230216030854.1212208-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

We currently treat cpu_exclusive_high as containing the
second word of LDXP, even though that word is not "high"
in big-endian mode.  Swap things around so that it is.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 54 ++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index da9f877476..78a2141224 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2547,17 +2547,28 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         } else {
             /* The pair must be single-copy atomic for *each* doubleword, not
                the entire quadword, however it must be quadword aligned.  */
+            TCGv_i64 t0 = tcg_temp_new_i64();
+            TCGv_i64 t1 = tcg_temp_new_i64();
+
             memop |= MO_64;
-            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx,
-                                memop | MO_ALIGN_16);
+            tcg_gen_qemu_ld_i64(t0, addr, idx, memop | MO_ALIGN_16);
 
-            TCGv_i64 addr2 = tcg_temp_new_i64();
-            tcg_gen_addi_i64(addr2, addr, 8);
-            tcg_gen_qemu_ld_i64(cpu_exclusive_high, addr2, idx, memop);
-            tcg_temp_free_i64(addr2);
+            tcg_gen_addi_i64(t1, addr, 8);
+            tcg_gen_qemu_ld_i64(t1, t1, idx, memop);
 
-            tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
-            tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
+            if (s->be_data == MO_LE) {
+                tcg_gen_mov_i64(cpu_exclusive_val, t0);
+                tcg_gen_mov_i64(cpu_exclusive_high, t1);
+            } else {
+                tcg_gen_mov_i64(cpu_exclusive_high, t0);
+                tcg_gen_mov_i64(cpu_exclusive_val, t1);
+            }
+
+            tcg_gen_mov_i64(cpu_reg(s, rt), t0);
+            tcg_gen_mov_i64(cpu_reg(s, rt2), t1);
+
+            tcg_temp_free_i64(t0);
+            tcg_temp_free_i64(t1);
         }
     } else {
         memop |= size | MO_ALIGN;
@@ -2604,36 +2615,29 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         } else {
             TCGv_i128 t16 = tcg_temp_new_i128();
             TCGv_i128 c16 = tcg_temp_new_i128();
-            TCGv_i64 a, b;
+            TCGv_i64 lo, hi;
 
             if (s->be_data == MO_LE) {
                 tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt), cpu_reg(s, rt2));
-                tcg_gen_concat_i64_i128(c16, cpu_exclusive_val,
-                                        cpu_exclusive_high);
             } else {
                 tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt2), cpu_reg(s, rt));
-                tcg_gen_concat_i64_i128(c16, cpu_exclusive_high,
-                                        cpu_exclusive_val);
             }
+            tcg_gen_concat_i64_i128(c16, cpu_exclusive_val, cpu_exclusive_high);
 
             tcg_gen_atomic_cmpxchg_i128(t16, cpu_exclusive_addr, c16, t16,
                                         get_mem_index(s),
                                         MO_128 | MO_ALIGN | s->be_data);
             tcg_temp_free_i128(c16);
 
-            a = tcg_temp_new_i64();
-            b = tcg_temp_new_i64();
-            if (s->be_data == MO_LE) {
-                tcg_gen_extr_i128_i64(a, b, t16);
-            } else {
-                tcg_gen_extr_i128_i64(b, a, t16);
-            }
+            lo = tcg_temp_new_i64();
+            hi = tcg_temp_new_i64();
+            tcg_gen_extr_i128_i64(lo, hi, t16);
 
-            tcg_gen_xor_i64(a, a, cpu_exclusive_val);
-            tcg_gen_xor_i64(b, b, cpu_exclusive_high);
-            tcg_gen_or_i64(tmp, a, b);
-            tcg_temp_free_i64(a);
-            tcg_temp_free_i64(b);
+            tcg_gen_xor_i64(lo, lo, cpu_exclusive_val);
+            tcg_gen_xor_i64(hi, hi, cpu_exclusive_high);
+            tcg_gen_or_i64(tmp, lo, hi);
+            tcg_temp_free_i64(lo);
+            tcg_temp_free_i64(hi);
             tcg_temp_free_i128(t16);
 
             tcg_gen_setcondi_i64(TCG_COND_NE, tmp, tmp, 0);
-- 
2.34.1


