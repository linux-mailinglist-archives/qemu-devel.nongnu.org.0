Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4992D3212
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:25:44 +0100 (CET)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhgF-00042u-Mc
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJM-0008Fc-JC
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:04 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJK-0006Qx-Cs
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:04 -0500
Received: by mail-ot1-x341.google.com with SMTP id x13so9108707oto.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YevB6XxUr3y7N2xo8cdsW/ofLzNXY3bTUOzdECTRRM=;
 b=gZVBL7U/2m3jSDxR/JkjzdQi3og/2NIfsy0zIKm6sMqIGSNZ3gUhro9lzEVMWsDFPi
 uH8WvYFstBErhzmhgGkRJSm5pwhEcYgVmBCk/7KuW6NMekje6+J8nW7qoxrjOsYASve8
 QR6KRCY3FT7Cuo/0xIlVaBpg5GM5ev4D/7IhagkehgChXB0xG+HbJ1NltZh2KJF6uDGX
 LpZg6VCqxW5ZO2ZfaqJ6clUpZzYrlg75qrMhBIyMv5OgmKBKr58Sh31um1NKCQY1tQkX
 eGcRXM3YnHOXgfLPwPyCkktkZC8hAGHZ0wVYYE6zuETuxvQMrNV1WYI0RWM1lqsA92r9
 rr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YevB6XxUr3y7N2xo8cdsW/ofLzNXY3bTUOzdECTRRM=;
 b=C/SY4Lsi+sF0X3qrGW4xXOGYr8Ca3mOdGOHyghhqi9eZbyjCRrMhNdq/osKsNSREDc
 oIIGYL2PMqoQR/edtHEMsAM8c6Hfzfa1F8i6BoQKzTD40Xs1ZFZ/yZLtZowHh8AsUfm9
 /gsCeJam5hFk4CheQJd/5dM4TDiYrgITMJi6zqCnC+AxOCfsxKaZ3XCef3jl6o9OiFPC
 wS1AbonT6Mg4EC89sRJHaroidTSJkQ7fR6LuTvQJyPmmj9QOR/4uzYKmf815/81a59zS
 NmYuI0yY3RqNSFnIjeDyupUCTZWGVIybPgMIL0xMxL0sn6SLSRX/7cFYBwOFJPZZt7rw
 R/sg==
X-Gm-Message-State: AOAM531A6H+jqjfmzX0OdkPDoT0by/aLdXNRU0f/8f24lXXjGHxD2ekD
 tGfjXV0SbR2SCF6By2BnmhQ4qsMufIhSzpq4
X-Google-Smtp-Source: ABdhPJzu460Zt8R1XflaZ2ecJ1RsbeF2MPU21ZYE0l+c91ZV95gb2UToVJaGMDMTFlvbzXlxyD7fEA==
X-Received: by 2002:a05:6830:1253:: with SMTP id
 s19mr4193933otp.270.1607450520661; 
 Tue, 08 Dec 2020 10:02:00 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:02:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/24] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
Date: Tue,  8 Dec 2020 12:01:16 -0600
Message-Id: <20201208180118.157911-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 93065242cc..57042b8bb7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3786,6 +3786,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3847,6 +3848,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 scale, total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3854,8 +3856,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3863,9 +3864,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, mop);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_st(s, rt, index, clean_addr, mop);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1


