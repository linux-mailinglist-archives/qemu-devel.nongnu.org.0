Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C212CB0B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 22:57:07 +0100 (CET)
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilgYc-0003Si-Al
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 16:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ilgUe-0007KB-A6
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:53:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ilgUc-0003DG-J5
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:53:00 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38367)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ilgUc-0003Bd-C3
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 16:52:58 -0500
Received: by mail-wr1-x441.google.com with SMTP id y17so31214924wrh.5
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 13:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F/o7IwiNFsEwiFfT38ljIfn/SREs3gYDBfPxeWuiqkA=;
 b=X/9Eb1SgYFVJ/lcAgLrt9j6Kzp9+wKXNs8LCQflEocZh1lGY91P6Suc96fQN5RlWRj
 33UI79X4zFNv9ScSfHNtT7+lmEW1JQKehiymDDfXyINQM5ECAhzLqkM6BE3jXQMnjKVm
 CqLLZgCuUjqY36K77Byw8apye4ynmCHAZHYJhjCD7N4eVWrhKRdYxRnEsQull7nU7nzr
 Nl6cfhfjwJukGWxnn2ZKC/XOtGxW2JVxc2iTtulFDlS6OOwC7bPaPgod/zAz7KQEfEnb
 OqhblUHHF3XIpuR7fw6EXjDb/kMVXImtNQlDf4IEKiduB6HE98abK9jnr/CxodBrKnxM
 9/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F/o7IwiNFsEwiFfT38ljIfn/SREs3gYDBfPxeWuiqkA=;
 b=sMIw4cHLRSsD2sXmKN/OvhQK4f+v6LprUPXhtSEzhv0qPS7OmGpDmwAF7erOpXAQSG
 WtZEvj/au012cGAYMVGta5mlYuogo7mpN9UF3mtitfcU8yjX5p0ImRUPziJhoMs9igDD
 Pp+JFSy+bsL/DFAyd8fprN3U7H1XKyaRylhjR2f6UVNfDIjds6P224Rq/f4eLw94GYpO
 m9hCeOaHTh3DpvSJNCKJOtfz3TL2WPRP9nK+c5qAgIVwELopV3tAy7FYIqFSZHlLn0QJ
 ecg2tufVWUBT/4ivaSxYscK8Boq4J74EekrIot+5Twp31i9eXA00rcu5qhzgFUCLut4g
 a+Og==
X-Gm-Message-State: APjAAAVPbVzlfxEJVa3VlAC+62erwUNaJwo7ymwUGdRu9ZTAUjoITtjs
 pG5ZA/+drPwa9fgZk4gVUSfaEfjU8a5DAw==
X-Google-Smtp-Source: APXvYqx86xzbncUCgJ4kyICqbDDuPOLCSIZ6tige+T/SSKU72IsC1M+hB0uT1OVg8ySRqiFSo9nkdQ==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr62316013wre.156.1577656377172; 
 Sun, 29 Dec 2019 13:52:57 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-183-93-3.red.bezeqint.net. [79.183.93.3])
 by smtp.gmail.com with ESMTPSA id 25sm18182850wmi.32.2019.12.29.13.52.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 29 Dec 2019 13:52:56 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v40 07/21] target/avr: Add instruction translation - Bit and
 Bit-test Instructions
Date: Sun, 29 Dec 2019 23:51:44 +0200
Message-Id: <20191229215158.5788-8-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191229215158.5788-1-mrolnik@gmail.com>
References: <20191229215158.5788-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 me@xcancerberox.com.ar, richard.henderson@linaro.org, dovgaluk@ispras.ru,
 imammedo@redhat.com, philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
    - LSR, ROR
    - ASR
    - SWAP
    - SBI, CBI
    - BST, BLD
    - BSET, BCLR

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/translate.c | 241 +++++++++++++++++++++++++++++++++++++++++
 target/avr/insn.decode |  14 +++
 2 files changed, 255 insertions(+)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 9c66734a19..55706c6b29 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2440,3 +2440,244 @@ static bool trans_LAT(DisasContext *ctx, arg_LAT *a)
 
     return true;
 }
+
+/*
+ * Bit and Bit-test Instructions
+ */
+static void gen_rshift_ZNVSf(TCGv R)
+{
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
+    tcg_gen_xor_tl(cpu_Vf, cpu_Nf, cpu_Cf);
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
+}
+
+/*
+ *  Shifts all bits in Rd one place to the right. Bit 7 is cleared. Bit 0 is
+ *  loaded into the C Flag of the SREG. This operation effectively divides an
+ *  unsigned value by two. The C Flag can be used to round the result.
+ */
+static bool trans_LSR(DisasContext *ctx, arg_LSR *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+
+    tcg_gen_andi_tl(cpu_Cf, Rd, 1);
+    tcg_gen_shri_tl(Rd, Rd, 1);
+    /* update status register */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, Rd, 0); /* Zf = Rd == 0 */
+    tcg_gen_movi_tl(cpu_Nf, 0);
+    tcg_gen_mov_tl(cpu_Vf, cpu_Cf);
+    tcg_gen_mov_tl(cpu_Sf, cpu_Vf);
+
+    return true;
+}
+
+/*
+ *  Shifts all bits in Rd one place to the right. The C Flag is shifted into
+ *  bit 7 of Rd. Bit 0 is shifted into the C Flag.  This operation, combined
+ *  with ASR, effectively divides multi-byte signed values by two. Combined with
+ *  LSR it effectively divides multi-byte unsigned values by two. The Carry Flag
+ *  can be used to round the result.
+ */
+static bool trans_ROR(DisasContext *ctx, arg_ROR *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_temp_new_i32();
+
+    tcg_gen_shli_tl(t0, cpu_Cf, 7);
+    /* update status register */
+    tcg_gen_andi_tl(cpu_Cf, Rd, 1);
+    /* update output register */
+    tcg_gen_shri_tl(Rd, Rd, 1);
+    tcg_gen_or_tl(Rd, Rd, t0);
+    /* update status register */
+    gen_rshift_ZNVSf(Rd);
+
+    tcg_temp_free_i32(t0);
+
+    return true;
+}
+
+/*
+ *  Shifts all bits in Rd one place to the right. Bit 7 is held constant. Bit 0
+ *  is loaded into the C Flag of the SREG. This operation effectively divides a
+ *  signed value by two without changing its sign. The Carry Flag can be used to
+ *  round the result.
+ */
+static bool trans_ASR(DisasContext *ctx, arg_ASR *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_temp_new_i32();
+
+    /* update status register */
+    tcg_gen_andi_tl(cpu_Cf, Rd, 1); /* Cf = Rd(0) */
+    /* update output register */
+    tcg_gen_andi_tl(t0, Rd, 0x80); /* Rd = (Rd & 0x80) | (Rd >> 1) */
+    tcg_gen_shri_tl(Rd, Rd, 1);
+    tcg_gen_or_tl(Rd, Rd, t0);
+    /* update status register */
+    gen_rshift_ZNVSf(Rd);
+
+    tcg_temp_free_i32(t0);
+
+    return true;
+}
+
+/*
+ *  Swaps high and low nibbles in a register.
+ */
+static bool trans_SWAP(DisasContext *ctx, arg_SWAP *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    tcg_gen_andi_tl(t0, Rd, 0x0f);
+    tcg_gen_shli_tl(t0, t0, 4);
+    tcg_gen_andi_tl(t1, Rd, 0xf0);
+    tcg_gen_shri_tl(t1, t1, 4);
+    tcg_gen_or_tl(Rd, t0, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+
+    return true;
+}
+
+/*
+ *  Sets a specified bit in an I/O Register. This instruction operates on
+ *  the lower 32 I/O Registers -- addresses 0-31.
+ */
+static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
+{
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_const_i32(a->reg);
+
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_ori_tl(data, data, 1 << a->bit);
+    gen_helper_outb(cpu_env, port, data);
+
+    tcg_temp_free_i32(port);
+    tcg_temp_free_i32(data);
+
+    return true;
+}
+
+/*
+ *  Clears a specified bit in an I/O Register. This instruction operates on
+ *  the lower 32 I/O Registers -- addresses 0-31.
+ */
+static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
+{
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_const_i32(a->reg);
+
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, ~(1 << a->bit));
+    gen_helper_outb(cpu_env, port, data);
+
+    tcg_temp_free_i32(data);
+    tcg_temp_free_i32(port);
+
+    return true;
+}
+
+/*
+ *  Stores bit b from Rd to the T Flag in SREG (Status Register).
+ */
+static bool trans_BST(DisasContext *ctx, arg_BST *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+
+    tcg_gen_andi_tl(cpu_Tf, Rd, 1 << a->bit);
+    tcg_gen_shri_tl(cpu_Tf, cpu_Tf, a->bit);
+
+    return true;
+}
+
+/*
+ *  Copies the T Flag in the SREG (Status Register) to bit b in register Rd.
+ */
+static bool trans_BLD(DisasContext *ctx, arg_BLD *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t1 = tcg_temp_new_i32();
+
+    tcg_gen_andi_tl(Rd, Rd, ~(1u << a->bit)); /* clear bit */
+    tcg_gen_shli_tl(t1, cpu_Tf, a->bit); /* create mask */
+    tcg_gen_or_tl(Rd, Rd, t1);
+
+    tcg_temp_free_i32(t1);
+
+    return true;
+}
+
+/*
+ *  Sets a single Flag or bit in SREG.
+ */
+static bool trans_BSET(DisasContext *ctx, arg_BSET *a)
+{
+    switch (a->bit) {
+    case 0x00:
+        tcg_gen_movi_tl(cpu_Cf, 0x01);
+        break;
+    case 0x01:
+        tcg_gen_movi_tl(cpu_Zf, 0x01);
+        break;
+    case 0x02:
+        tcg_gen_movi_tl(cpu_Nf, 0x01);
+        break;
+    case 0x03:
+        tcg_gen_movi_tl(cpu_Vf, 0x01);
+        break;
+    case 0x04:
+        tcg_gen_movi_tl(cpu_Sf, 0x01);
+        break;
+    case 0x05:
+        tcg_gen_movi_tl(cpu_Hf, 0x01);
+        break;
+    case 0x06:
+        tcg_gen_movi_tl(cpu_Tf, 0x01);
+        break;
+    case 0x07:
+        tcg_gen_movi_tl(cpu_If, 0x01);
+        break;
+    }
+
+    return true;
+}
+
+/*
+ *  Clears a single Flag in SREG.
+ */
+static bool trans_BCLR(DisasContext *ctx, arg_BCLR *a)
+{
+    switch (a->bit) {
+    case 0x00:
+        tcg_gen_movi_tl(cpu_Cf, 0x00);
+        break;
+    case 0x01:
+        tcg_gen_movi_tl(cpu_Zf, 0x00);
+        break;
+    case 0x02:
+        tcg_gen_movi_tl(cpu_Nf, 0x00);
+        break;
+    case 0x03:
+        tcg_gen_movi_tl(cpu_Vf, 0x00);
+        break;
+    case 0x04:
+        tcg_gen_movi_tl(cpu_Sf, 0x00);
+        break;
+    case 0x05:
+        tcg_gen_movi_tl(cpu_Hf, 0x00);
+        break;
+    case 0x06:
+        tcg_gen_movi_tl(cpu_Tf, 0x00);
+        break;
+    case 0x07:
+        tcg_gen_movi_tl(cpu_If, 0x00);
+        break;
+    }
+
+    return true;
+}
diff --git a/target/avr/insn.decode b/target/avr/insn.decode
index 3f9304f8b0..4ee55862b2 100644
--- a/target/avr/insn.decode
+++ b/target/avr/insn.decode
@@ -158,3 +158,17 @@ XCH             1001 001 rd:5 0100
 LAC             1001 001 rd:5 0110
 LAS             1001 001 rd:5 0101
 LAT             1001 001 rd:5 0111
+
+#
+# Bit and Bit-test Instructions
+#
+LSR             1001 010 rd:5 0110
+ROR             1001 010 rd:5 0111
+ASR             1001 010 rd:5 0101
+SWAP            1001 010 rd:5 0010
+SBI             1001 1010 reg:5 bit:3
+CBI             1001 1000 reg:5 bit:3
+BST             1111 101 rd:5 0 bit:3
+BLD             1111 100 rd:5 0 bit:3
+BSET            1001 0100 0 bit:3 1000
+BCLR            1001 0100 1 bit:3 1000
-- 
2.17.2 (Apple Git-113)


