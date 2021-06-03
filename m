Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38EF39A580
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:13:16 +0200 (CEST)
Received: from localhost ([::1]:60786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopy7-0002Id-Qx
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkc-0008Cs-KJ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopka-0006qS-Ca
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id f2so6354146wri.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LdNDwicn/e7UW7f5kbwzx9b+TmLTkd72n4ur6XKxILI=;
 b=EVkXuNWmIcWo2W1VjFfdp3Mj/LX1s9bRItnFrN6GG6e+2ZLjg1NjOCZ8fbbMHwjCOi
 38XpZDTE1IFbld/dx5L9hH0hhAGBbnTMNWbjPMgg/kGOdnP4BhYBaVvA7NeF6tdPXitc
 mW3mbeUosPwrj7h1KxR1UTDcFyU/XY4G2YrRaId9IWTooT3mChniPk1echDKGs0kbFdK
 /poCYi6VmROS7ytVoD89wZydS6bX/RFBQvD2KTmMxcCl3tQ/gZOvnYDVWFAtrErbEzb8
 O9jzEASoTzvc49CWtPj24GJEuEuXx2j8DE4Ktd5h4cG+csFj9feDc6MsAVjrxcXsZDwL
 GRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LdNDwicn/e7UW7f5kbwzx9b+TmLTkd72n4ur6XKxILI=;
 b=S6sSvHsepKrZCfbLyB7A7MlpaFCIxFw29BICWJoylrqmfAqzSRLCok8ZMLK6cmJ0XS
 k12mY4HL0ZYCmpRHqL7msKqcwk2jtfZv468LJsjRcmeBUQoCzXoRT4kHhBNfzs3K9Qy3
 x0qM+UrFeJztep+SEnwYB+acEO7+Tyh29GCAgp0KpWNSm8kDBuewA9PCfl3q/QRGt2sU
 AZDq+4/3RUvpiaBhJD4BtiP2Ofn5u1yhSjW+Y1ZqCFUqQpDy8fEOeKDPCKXTfx3hbWKu
 xcTeCyAounEbaor3avItRHNXQUaP2RSnIbfbh+q2oS7eCHss8eijK06E9wKAkHQO5BmB
 AvmA==
X-Gm-Message-State: AOAM5334qfNCNn+r+v29NcoDQllen5EJSBlgajXMDHl+m1Pb/RosZp7n
 pzbFWh6suGA0UgYn11/QDl/SsBblz1iIgW4N
X-Google-Smtp-Source: ABdhPJxlEDDPS+vXf3QIyZcoSm4aIYhzb3a2dgZZdr62+hUxwiyi71EdWfKWHgqOxE8P87AwIQ+whw==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr672551wrs.74.1622735954929;
 Thu, 03 Jun 2021 08:59:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/45] target/arm: Mark LDS{MIN,MAX} as signed operations
Date: Thu,  3 Jun 2021 16:58:30 +0100
Message-Id: <20210603155904.26021-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The operands to tcg_gen_atomic_fetch_s{min,max}_i64 must
be signed, so that the inputs are properly extended.
Zero extend the result afterward, as needed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/364
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210602020720.47679-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ceac0ee2bd6..d6906d9012c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3355,8 +3355,9 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     int o3_opc = extract32(insn, 12, 4);
     bool r = extract32(insn, 22, 1);
     bool a = extract32(insn, 23, 1);
-    TCGv_i64 tcg_rs, clean_addr;
+    TCGv_i64 tcg_rs, tcg_rt, clean_addr;
     AtomicThreeOpFn *fn = NULL;
+    MemOp mop = s->be_data | size | MO_ALIGN;
 
     if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
         unallocated_encoding(s);
@@ -3377,9 +3378,11 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
         break;
     case 004: /* LDSMAX */
         fn = tcg_gen_atomic_fetch_smax_i64;
+        mop |= MO_SIGN;
         break;
     case 005: /* LDSMIN */
         fn = tcg_gen_atomic_fetch_smin_i64;
+        mop |= MO_SIGN;
         break;
     case 006: /* LDUMAX */
         fn = tcg_gen_atomic_fetch_umax_i64;
@@ -3422,6 +3425,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     }
 
     tcg_rs = read_cpu_reg(s, rs, true);
+    tcg_rt = cpu_reg(s, rt);
 
     if (o3_opc == 1) { /* LDCLR */
         tcg_gen_not_i64(tcg_rs, tcg_rs);
@@ -3430,8 +3434,11 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     /* The tcg atomic primitives are all full barriers.  Therefore we
      * can ignore the Acquire and Release bits of this instruction.
      */
-    fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
-       s->be_data | size | MO_ALIGN);
+    fn(tcg_rt, clean_addr, tcg_rs, get_mem_index(s), mop);
+
+    if ((mop & MO_SIGN) && size != MO_64) {
+        tcg_gen_ext32u_i64(tcg_rt, tcg_rt);
+    }
 }
 
 /*
-- 
2.20.1


