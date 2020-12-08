Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1A62D31B5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:06:29 +0100 (CET)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhNc-0001uZ-Sf
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIw-0007aZ-Pp
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:38 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIr-0006Lq-KP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:38 -0500
Received: by mail-oi1-x243.google.com with SMTP id o25so20325614oie.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vv1BLXikhvXOC7shYMx2SJNp4mEHjfewjMXNyOaAtsI=;
 b=LQtZumpoD4FiWXM+q8BthmPzMJA1ijwPSx8M4BsEQprSIptE+9PXw3NGxCRhk/8Qjw
 FRgNaLgOhz3zie1nUQTYxqT7mXZrBubfc8SqyIQorCEglxo+KIiHP7sA4L/v4rFt4sIO
 OSAP82Z4AJj5da3x6tM1Yzd+Im0Ha7hTNCxs/NOpxfl6jNj9//RGNFO7n0MjcSUkVKpA
 dpVUsbSOmtM9UZkvag3TxkuVFRUDM72+hg8vL1WvdNR9EGBVnhSAHsvbfy6Zs00onhiY
 Psx+gNjOLUTX/qwZeGco2JMgf9yksqyxWrbmqWI2vFFsTZZZthqLT3x+FKGPHJQ/KhEu
 MXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vv1BLXikhvXOC7shYMx2SJNp4mEHjfewjMXNyOaAtsI=;
 b=rcPfjk0eYEmoUCDroI+NXkA9glqAzOyYqJHJBm4l8cJQADpIZyx+TNE2hXX+xJRsWW
 E7btMNwsiwismZpD0VVd9qVgQojrUg5/eEIH3g8BHfbzRWovhv0nvb0UckKuhavRbzU5
 vGeEv6/xPM54JevWM8X48gKVoVyR+/SLL/9yAk5Fjxr9BCeVLAO6QA6O7YlisQEWcYNX
 vHzvRXKRgPr2onwd9M2MTOPmi0ZPrSCaJt2bQxYotbxu0EGiavrONBbl+Yb211KuDImi
 KwkRtD3W71YDmFber1FFFHFnI7hQBHY9o6fvrJt9FDZAIvIP9rZfVfHQ87+4T3HdlIcU
 gjJw==
X-Gm-Message-State: AOAM533IQDD09MPdvhYWtphuT3F1mDtltE2P/8Z8nzTn6YSEplJOLqQp
 An9xfSXS50JKVeQpOnDbsJM/Bp9lXfnBk3Iq
X-Google-Smtp-Source: ABdhPJwFwOzh0i2EuoHA6nsUBsmoTfQcyPpIDQKFm0EGOggP98kLYwfMXzNRN2xhmh1jENp5opDYcQ==
X-Received: by 2002:aca:f1c1:: with SMTP id p184mr3745605oih.54.1607450492148; 
 Tue, 08 Dec 2020 10:01:32 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/24] target/arm: Enforce word alignment for LDRD/STRD
Date: Tue,  8 Dec 2020 12:01:01 -0600
Message-Id: <20201208180118.157911-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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

Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f6007c23a6..9ca06cb373 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6468,13 +6468,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6497,13 +6497,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6605,13 +6605,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6644,13 +6644,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
-- 
2.25.1


