Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C323C10B53A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 19:08:43 +0100 (CET)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia1k1-00055i-EQ
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 13:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ia1Vg-0002G3-Sp
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:53:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ia1Vc-0006dj-Im
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:53:52 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42348)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ia1Vc-0006cU-41
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:53:48 -0500
Received: by mail-wr1-x443.google.com with SMTP id a15so27741405wrf.9
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 09:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4hOTtKrpf1sp7LNDpMnvQsB48i6IvLj4ifCAP6TELvE=;
 b=vXrnb+IwX8JebMMrftoXL4uooiEJUWGrvk1p5CfSFuHatWGeu9hi+46Q91w0INN2tb
 ttygHAN938KVqnAV2iCJw883XP3kMErS0Ko0AISzZN+Lx1z3jSoP8ANZQI5gjgPCCsNX
 vVkRWYdm5HNcHvpDUAnCVpHPzircNkdKrttsrQqJ3DwFk8RzljgpaljB+5crLhXU1RIR
 EoHoHWkC2pfUAXXe+k+qCI3JRMPi2FErcLDI++F+c1OnL4g5V5afl62yjMLdeN+HV/Yz
 KtBbQdddazu1skzx5g+kGxIDljNmc5tFhIyXEW6w2Yaq2YaUqTBPzHpXM3xz49FYIJU8
 4ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4hOTtKrpf1sp7LNDpMnvQsB48i6IvLj4ifCAP6TELvE=;
 b=rco/8WZOqZqfRNMpfcg2pizp9d2uoEIjJiKkkNwuzbLtX2ihGOIfnV4wuwyvLoynLR
 nLGtLAJLqraKKA2busutiHEKGpTHRcpfhr2m/BCRBmNzdTR36yRhQNO1e9zHH+Iok1Z2
 KaVTRL9WvoF8qsrya2vOh9IfVF8rzX6/IUKm3rGUdkhYA2gBz4LY4Aht2HKDbKLW16jj
 z3CVQBmTXyP7BCaO2iXxZpHschJEHyzwymzBjiujNQZ/9mxzeMjuWCp/Kz8d40a+XsyX
 ChoLJWIAl0bwMpqs2YuqhrfdJoNSSPsQ4ksbcmg9FAbmYHp/FK7zNJnd5URY5g1mWOis
 VB7Q==
X-Gm-Message-State: APjAAAVvUQYPkdoJnzpDRTC3NbgpNNrlnHMX1mYl4qAosxSuIUcY3I0E
 JTPO657uaqobiLCrf4odpoeE9sBmoqmBoEhB
X-Google-Smtp-Source: APXvYqy7kq6hbOghj8fJMfxTioZNtTxZ2YSKkrHhORfgT7wiG1BVdBkowHU2qghdfBc13RPhbAs/qA==
X-Received: by 2002:adf:f445:: with SMTP id f5mr21636687wrp.193.1574877226031; 
 Wed, 27 Nov 2019 09:53:46 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-178-2-87.red.bezeqint.net. [79.178.2.87])
 by smtp.gmail.com with ESMTPSA id b2sm20238295wrr.76.2019.11.27.09.53.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Nov 2019 09:53:45 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v37 07/17] target/avr: Add instruction translation - Bit and
 Bit-test Instructions
Date: Wed, 27 Nov 2019 19:52:47 +0200
Message-Id: <20191127175257.23480-8-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191127175257.23480-1-mrolnik@gmail.com>
References: <20191127175257.23480-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
 target/avr/translate.c | 1123 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1123 insertions(+)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 48a42c984a..dc6a1af2fc 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -317,6 +317,15 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 }
 
 
+static void gen_rshift_ZNVSf(TCGv R)
+{
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
+    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
+    tcg_gen_xor_tl(cpu_Vf, cpu_Nf, cpu_Cf);
+    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
+}
+
+
 /*
  *  Adds two registers without the C Flag and places the result in the
  *  destination register Rd.
@@ -1508,3 +1517,1117 @@ static bool trans_BRBS(DisasContext *ctx, arg_BRBS *a)
     return true;
 }
 
+
+/*
+ *  This instruction makes a copy of one register into another. The source
+ *  register Rr is left unchanged, while the destination register Rd is loaded
+ *  with a copy of Rr.
+ */
+static bool trans_MOV(DisasContext *ctx, arg_MOV *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv Rr = cpu_r[a->rr];
+
+    tcg_gen_mov_tl(Rd, Rr);
+
+    return true;
+}
+
+
+/*
+ *  This instruction makes a copy of one register pair into another register
+ *  pair. The source register pair Rr+1:Rr is left unchanged, while the
+ *  destination register pair Rd+1:Rd is loaded with a copy of Rr + 1:Rr.  This
+ *  instruction is not available in all devices. Refer to the device specific
+ *  instruction set summary.
+ */
+static bool trans_MOVW(DisasContext *ctx, arg_MOVW *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_MOVW)) {
+        return true;
+    }
+
+    TCGv RdL = cpu_r[a->rd];
+    TCGv RdH = cpu_r[a->rd + 1];
+    TCGv RrL = cpu_r[a->rr];
+    TCGv RrH = cpu_r[a->rr + 1];
+
+    tcg_gen_mov_tl(RdH, RrH);
+    tcg_gen_mov_tl(RdL, RrL);
+
+    return true;
+}
+
+
+/*
+ * Loads an 8 bit constant directly to register 16 to 31.
+ */
+static bool trans_LDI(DisasContext *ctx, arg_LDI *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    int imm = a->imm;
+
+    tcg_gen_movi_tl(Rd, imm);
+
+    return true;
+}
+
+
+/*
+ *  Loads one byte from the data space to a register. For parts with SRAM,
+ *  the data space consists of the Register File, I/O memory and internal SRAM
+ *  (and external SRAM if applicable). For parts without SRAM, the data space
+ *  consists of the register file only. The EEPROM has a separate address space.
+ *  A 16-bit address must be supplied. Memory access is limited to the current
+ *  data segment of 64KB. The LDS instruction uses the RAMPD Register to access
+ *  memory above 64KB. To access another data segment in devices with more than
+ *  64KB data space, the RAMPD in register in the I/O area has to be changed.
+ *  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.
+ */
+static bool trans_LDS(DisasContext *ctx, arg_LDS *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_rampD;
+    a->imm = next_word(ctx);
+
+    tcg_gen_mov_tl(addr, H); /* addr = H:M:L */
+    tcg_gen_shli_tl(addr, addr, 16);
+    tcg_gen_ori_tl(addr, addr, a->imm);
+
+    gen_data_load(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  Loads one byte indirect from the data space to a register. For parts
+ *  with SRAM, the data space consists of the Register File, I/O memory and
+ *  internal SRAM (and external SRAM if applicable). For parts without SRAM, the
+ *  data space consists of the Register File only. In some parts the Flash
+ *  Memory has been mapped to the data space and can be read using this command.
+ *  The EEPROM has a separate address space.  The data location is pointed to by
+ *  the X (16 bits) Pointer Register in the Register File. Memory access is
+ *  limited to the current data segment of 64KB. To access another data segment
+ *  in devices with more than 64KB data space, the RAMPX in register in the I/O
+ *  area has to be changed.  The X-pointer Register can either be left unchanged
+ *  by the operation, or it can be post-incremented or predecremented.  These
+ *  features are especially suited for accessing arrays, tables, and Stack
+ *  Pointer usage of the X-pointer Register. Note that only the low byte of the
+ *  X-pointer is updated in devices with no more than 256 bytes data space. For
+ *  such devices, the high byte of the pointer is not used by this instruction
+ *  and can be used for other purposes. The RAMPX Register in the I/O area is
+ *  updated in parts with more than 64KB data space or more than 64KB Program
+ *  memory, and the increment/decrement is added to the entire 24-bit address on
+ *  such devices.  Not all variants of this instruction is available in all
+ *  devices. Refer to the device specific instruction set summary.  In the
+ *  Reduced Core tinyAVR the LD instruction can be used to achieve the same
+ *  operation as LPM since the program memory is mapped to the data memory
+ *  space.
+ */
+static bool trans_LDX1(DisasContext *ctx, arg_LDX1 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_xaddr();
+
+    gen_data_load(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_LDX2(DisasContext *ctx, arg_LDX2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_xaddr();
+
+    gen_data_load(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_xaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_LDX3(DisasContext *ctx, arg_LDX3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_xaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_load(ctx, Rd, addr);
+    gen_set_xaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_STX1(DisasContext *ctx, arg_STX1 *a)
+{
+    TCGv Rd = cpu_r[a->rr];
+    TCGv addr = gen_get_xaddr();
+
+    gen_data_store(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STX2(DisasContext *ctx, arg_STX2 *a)
+{
+    TCGv Rd = cpu_r[a->rr];
+    TCGv addr = gen_get_xaddr();
+
+    gen_data_store(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+    gen_set_xaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_STX3(DisasContext *ctx, arg_STX3 *a)
+{
+    TCGv Rd = cpu_r[a->rr];
+    TCGv addr = gen_get_xaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_store(ctx, Rd, addr);
+    gen_set_xaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  Loads one byte indirect with or without displacement from the data space
+ *  to a register. For parts with SRAM, the data space consists of the Register
+ *  File, I/O memory and internal SRAM (and external SRAM if applicable). For
+ *  parts without SRAM, the data space consists of the Register File only. In
+ *  some parts the Flash Memory has been mapped to the data space and can be
+ *  read using this command. The EEPROM has a separate address space.  The data
+ *  location is pointed to by the Y (16 bits) Pointer Register in the Register
+ *  File. Memory access is limited to the current data segment of 64KB. To
+ *  access another data segment in devices with more than 64KB data space, the
+ *  RAMPY in register in the I/O area has to be changed.  The Y-pointer Register
+ *  can either be left unchanged by the operation, or it can be post-incremented
+ *  or predecremented.  These features are especially suited for accessing
+ *  arrays, tables, and Stack Pointer usage of the Y-pointer Register. Note that
+ *  only the low byte of the Y-pointer is updated in devices with no more than
+ *  256 bytes data space. For such devices, the high byte of the pointer is not
+ *  used by this instruction and can be used for other purposes. The RAMPY
+ *  Register in the I/O area is updated in parts with more than 64KB data space
+ *  or more than 64KB Program memory, and the increment/decrement/displacement
+ *  is added to the entire 24-bit address on such devices.  Not all variants of
+ *  this instruction is available in all devices. Refer to the device specific
+ *  instruction set summary.  In the Reduced Core tinyAVR the LD instruction can
+ *  be used to achieve the same operation as LPM since the program memory is
+ *  mapped to the data memory space.
+ */
+static bool trans_LDY2(DisasContext *ctx, arg_LDY2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    gen_data_load(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_yaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_LDY3(DisasContext *ctx, arg_LDY3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_load(ctx, Rd, addr);
+    gen_set_yaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_LDDY(DisasContext *ctx, arg_LDDY *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
+    gen_data_load(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_STY2(DisasContext *ctx, arg_STY2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    gen_data_store(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+    gen_set_yaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_STY3(DisasContext *ctx, arg_STY3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_store(ctx, Rd, addr);
+    gen_set_yaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_STDY(DisasContext *ctx, arg_STDY *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_yaddr();
+
+    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
+    gen_data_store(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  Loads one byte indirect with or without displacement from the data space
+ *  to a register. For parts with SRAM, the data space consists of the Register
+ *  File, I/O memory and internal SRAM (and external SRAM if applicable). For
+ *  parts without SRAM, the data space consists of the Register File only. In
+ *  some parts the Flash Memory has been mapped to the data space and can be
+ *  read using this command. The EEPROM has a separate address space.  The data
+ *  location is pointed to by the Z (16 bits) Pointer Register in the Register
+ *  File. Memory access is limited to the current data segment of 64KB. To
+ *  access another data segment in devices with more than 64KB data space, the
+ *  RAMPZ in register in the I/O area has to be changed.  The Z-pointer Register
+ *  can either be left unchanged by the operation, or it can be post-incremented
+ *  or predecremented.  These features are especially suited for Stack Pointer
+ *  usage of the Z-pointer Register, however because the Z-pointer Register can
+ *  be used for indirect subroutine calls, indirect jumps and table lookup, it
+ *  is often more convenient to use the X or Y-pointer as a dedicated Stack
+ *  Pointer. Note that only the low byte of the Z-pointer is updated in devices
+ *  with no more than 256 bytes data space. For such devices, the high byte of
+ *  the pointer is not used by this instruction and can be used for other
+ *  purposes. The RAMPZ Register in the I/O area is updated in parts with more
+ *  than 64KB data space or more than 64KB Program memory, and the
+ *  increment/decrement/displacement is added to the entire 24-bit address on
+ *  such devices.  Not all variants of this instruction is available in all
+ *  devices. Refer to the device specific instruction set summary.  In the
+ *  Reduced Core tinyAVR the LD instruction can be used to achieve the same
+ *  operation as LPM since the program memory is mapped to the data memory
+ *  space.  For using the Z-pointer for table lookup in Program memory see the
+ *  LPM and ELPM instructions.
+ */
+static bool trans_LDZ2(DisasContext *ctx, arg_LDZ2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    gen_data_load(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_LDZ3(DisasContext *ctx, arg_LDZ3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_load(ctx, Rd, addr);
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_LDDZ(DisasContext *ctx, arg_LDDZ *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
+    gen_data_load(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_STZ2(DisasContext *ctx, arg_STZ2 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    gen_data_store(ctx, Rd, addr);
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_STZ3(DisasContext *ctx, arg_STZ3 *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
+    gen_data_store(ctx, Rd, addr);
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_STDZ(DisasContext *ctx, arg_STDZ *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
+    gen_data_store(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+
+/*
+ *  Stores one byte from a Register to the data space. For parts with SRAM,
+ *  the data space consists of the Register File, I/O memory and internal SRAM
+ *  (and external SRAM if applicable). For parts without SRAM, the data space
+ *  consists of the Register File only. The EEPROM has a separate address space.
+ *  A 16-bit address must be supplied. Memory access is limited to the current
+ *  data segment of 64KB. The STS instruction uses the RAMPD Register to access
+ *  memory above 64KB. To access another data segment in devices with more than
+ *  64KB data space, the RAMPD in register in the I/O area has to be changed.
+ *  This instruction is not available in all devices. Refer to the device
+ *  specific instruction set summary.
+ */
+static bool trans_STS(DisasContext *ctx, arg_STS *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_rampD;
+    a->imm = next_word(ctx);
+
+    tcg_gen_mov_tl(addr, H); /* addr = H:M:L */
+    tcg_gen_shli_tl(addr, addr, 16);
+    tcg_gen_ori_tl(addr, addr, a->imm);
+
+    gen_data_store(ctx, Rd, addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  Loads one byte pointed to by the Z-register into the destination
+ *  register Rd. This instruction features a 100% space effective constant
+ *  initialization or constant data fetch. The Program memory is organized in
+ *  16-bit words while the Z-pointer is a byte address. Thus, the least
+ *  significant bit of the Z-pointer selects either low byte (ZLSB = 0) or high
+ *  byte (ZLSB = 1). This instruction can address the first 64KB (32K words) of
+ *  Program memory. The Zpointer Register can either be left unchanged by the
+ *  operation, or it can be incremented. The incrementation does not apply to
+ *  the RAMPZ Register.  Devices with Self-Programming capability can use the
+ *  LPM instruction to read the Fuse and Lock bit values.  Refer to the device
+ *  documentation for a detailed description.  The LPM instruction is not
+ *  available in all devices. Refer to the device specific instruction set
+ *  summary
+ */
+static bool trans_LPM1(DisasContext *ctx, arg_LPM1 *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_LPM)) {
+        return true;
+    }
+
+    TCGv Rd = cpu_r[0];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_r[31];
+    TCGv L = cpu_r[30];
+
+    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
+    tcg_gen_or_tl(addr, addr, L);
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_LPM2(DisasContext *ctx, arg_LPM2 *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_LPM)) {
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_r[31];
+    TCGv L = cpu_r[30];
+
+    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
+    tcg_gen_or_tl(addr, addr, L);
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_LPMX(DisasContext *ctx, arg_LPMX *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_LPMX)) {
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = tcg_temp_new_i32();
+    TCGv H = cpu_r[31];
+    TCGv L = cpu_r[30];
+
+    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
+    tcg_gen_or_tl(addr, addr, L);
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    tcg_gen_andi_tl(L, addr, 0xff);
+
+    tcg_gen_shri_tl(addr, addr, 8);
+    tcg_gen_andi_tl(H, addr, 0xff);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  Loads one byte pointed to by the Z-register and the RAMPZ Register in
+ *  the I/O space, and places this byte in the destination register Rd. This
+ *  instruction features a 100% space effective constant initialization or
+ *  constant data fetch. The Program memory is organized in 16-bit words while
+ *  the Z-pointer is a byte address. Thus, the least significant bit of the
+ *  Z-pointer selects either low byte (ZLSB = 0) or high byte (ZLSB = 1). This
+ *  instruction can address the entire Program memory space. The Z-pointer
+ *  Register can either be left unchanged by the operation, or it can be
+ *  incremented. The incrementation applies to the entire 24-bit concatenation
+ *  of the RAMPZ and Z-pointer Registers.  Devices with Self-Programming
+ *  capability can use the ELPM instruction to read the Fuse and Lock bit value.
+ *  Refer to the device documentation for a detailed description.  This
+ *  instruction is not available in all devices. Refer to the device specific
+ *  instruction set summary.
+ */
+static bool trans_ELPM1(DisasContext *ctx, arg_ELPM1 *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_ELPM)) {
+        return true;
+    }
+
+    TCGv Rd = cpu_r[0];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_ELPM2(DisasContext *ctx, arg_ELPM2 *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_ELPM)) {
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+static bool trans_ELPMX(DisasContext *ctx, arg_ELPMX *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_ELPMX)) {
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+
+    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
+
+    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
+
+    gen_set_zaddr(addr);
+
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  SPM can be used to erase a page in the Program memory, to write a page
+ *  in the Program memory (that is already erased), and to set Boot Loader Lock
+ *  bits. In some devices, the Program memory can be written one word at a time,
+ *  in other devices an entire page can be programmed simultaneously after first
+ *  filling a temporary page buffer. In all cases, the Program memory must be
+ *  erased one page at a time. When erasing the Program memory, the RAMPZ and
+ *  Z-register are used as page address. When writing the Program memory, the
+ *  RAMPZ and Z-register are used as page or word address, and the R1:R0
+ *  register pair is used as data(1). When setting the Boot Loader Lock bits,
+ *  the R1:R0 register pair is used as data. Refer to the device documentation
+ *  for detailed description of SPM usage. This instruction can address the
+ *  entire Program memory.  The SPM instruction is not available in all devices.
+ *  Refer to the device specific instruction set summary.  Note: 1. R1
+ *  determines the instruction high byte, and R0 determines the instruction low
+ *  byte.
+ */
+static bool trans_SPM(DisasContext *ctx, arg_SPM *a)
+{
+    /* TODO */
+    if (!avr_have_feature(ctx, AVR_FEATURE_SPM)) {
+        return true;
+    }
+
+    return true;
+}
+
+
+static bool trans_SPMX(DisasContext *ctx, arg_SPMX *a)
+{
+    /* TODO */
+    if (!avr_have_feature(ctx, AVR_FEATURE_SPMX)) {
+        return true;
+    }
+
+    return true;
+}
+
+
+/*
+ *  Loads data from the I/O Space (Ports, Timers, Configuration Registers,
+ *  etc.) into register Rd in the Register File.
+ */
+static bool trans_IN(DisasContext *ctx, arg_IN *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv port = tcg_const_i32(a->imm);
+
+    gen_helper_inb(Rd, cpu_env, port);
+
+    tcg_temp_free_i32(port);
+
+    return true;
+}
+
+
+/*
+ *  Stores data from register Rr in the Register File to I/O Space (Ports,
+ *  Timers, Configuration Registers, etc.).
+ */
+static bool trans_OUT(DisasContext *ctx, arg_OUT *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+    TCGv port = tcg_const_i32(a->imm);
+
+    gen_helper_outb(cpu_env, port, Rd);
+
+    tcg_temp_free_i32(port);
+
+    return true;
+}
+
+
+/*
+ *  This instruction stores the contents of register Rr on the STACK. The
+ *  Stack Pointer is post-decremented by 1 after the PUSH.  This instruction is
+ *  not available in all devices. Refer to the device specific instruction set
+ *  summary.
+ */
+static bool trans_PUSH(DisasContext *ctx, arg_PUSH *a)
+{
+    TCGv Rd = cpu_r[a->rd];
+
+    gen_data_store(ctx, Rd, cpu_sp);
+    tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
+
+    return true;
+}
+
+
+/*
+ *  This instruction loads register Rd with a byte from the STACK. The Stack
+ *  Pointer is pre-incremented by 1 before the POP.  This instruction is not
+ *  available in all devices. Refer to the device specific instruction set
+ *  summary.
+ */
+static bool trans_POP(DisasContext *ctx, arg_POP *a)
+{
+    /*
+     * Using a temp to work around some strange behaviour:
+     * tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
+     * gen_data_load(ctx, Rd, cpu_sp);
+     * seems to cause the add to happen twice.
+     * This doesn't happen if either the add or the load is removed.
+     */
+    TCGv t1 = tcg_temp_new_i32();
+    TCGv Rd = cpu_r[a->rd];
+
+    tcg_gen_addi_tl(t1, cpu_sp, 1);
+    gen_data_load(ctx, Rd, t1);
+    tcg_gen_mov_tl(cpu_sp, t1);
+
+    return true;
+}
+
+
+/*
+ *  Exchanges one byte indirect between register and data space.  The data
+ *  location is pointed to by the Z (16 bits) Pointer Register in the Register
+ *  File. Memory access is limited to the current data segment of 64KB. To
+ *  access another data segment in devices with more than 64KB data space, the
+ *  RAMPZ in register in the I/O area has to be changed.  The Z-pointer Register
+ *  is left unchanged by the operation. This instruction is especially suited
+ *  for writing/reading status bits stored in SRAM.
+ */
+static bool trans_XCH(DisasContext *ctx, arg_XCH *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_RMW)) {
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv addr = gen_get_zaddr();
+
+    gen_data_load(ctx, t0, addr);
+    gen_data_store(ctx, Rd, addr);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  Load one byte indirect from data space to register and set bits in data
+ *  space specified by the register. The instruction can only be used towards
+ *  internal SRAM.  The data location is pointed to by the Z (16 bits) Pointer
+ *  Register in the Register File. Memory access is limited to the current data
+ *  segment of 64KB. To access another data segment in devices with more than
+ *  64KB data space, the RAMPZ in register in the I/O area has to be changed.
+ *  The Z-pointer Register is left unchanged by the operation. This instruction
+ *  is especially suited for setting status bits stored in SRAM.
+ */
+static bool trans_LAS(DisasContext *ctx, arg_LAS *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_RMW)) {
+        return true;
+    }
+
+    TCGv Rr = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
+    tcg_gen_or_tl(t1, t0, Rr);
+
+    tcg_gen_mov_tl(Rr, t0); /* Rr = t0 */
+    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  Load one byte indirect from data space to register and stores and clear
+ *  the bits in data space specified by the register. The instruction can
+ *  only be used towards internal SRAM.  The data location is pointed to by
+ *  the Z (16 bits) Pointer Register in the Register File. Memory access is
+ *  limited to the current data segment of 64KB. To access another data
+ *  segment in devices with more than 64KB data space, the RAMPZ in register
+ *  in the I/O area has to be changed.  The Z-pointer Register is left
+ *  unchanged by the operation. This instruction is especially suited for
+ *  clearing status bits stored in SRAM.
+ */
+static bool trans_LAC(DisasContext *ctx, arg_LAC *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_RMW)) {
+        return true;
+    }
+
+    TCGv Rr = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
+        /* t1 = t0 & (0xff - Rr) = t0 and ~Rr */
+    tcg_gen_andc_tl(t1, t0, Rr);
+
+    tcg_gen_mov_tl(Rr, t0); /* Rr = t0 */
+    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+
+/*
+ *  Load one byte indirect from data space to register and toggles bits in
+ *  the data space specified by the register.  The instruction can only be used
+ *  towards SRAM.  The data location is pointed to by the Z (16 bits) Pointer
+ *  Register in the Register File. Memory access is limited to the current data
+ *  segment of 64KB. To access another data segment in devices with more than
+ *  64KB data space, the RAMPZ in register in the I/O area has to be changed.
+ *  The Z-pointer Register is left unchanged by the operation. This instruction
+ *  is especially suited for changing status bits stored in SRAM.
+ */
+static bool trans_LAT(DisasContext *ctx, arg_LAT *a)
+{
+    if (!avr_have_feature(ctx, AVR_FEATURE_RMW)) {
+        return true;
+    }
+
+    TCGv Rd = cpu_r[a->rd];
+    TCGv addr = gen_get_zaddr();
+    TCGv t0 = tcg_temp_new_i32();
+    TCGv t1 = tcg_temp_new_i32();
+
+    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
+    tcg_gen_xor_tl(t1, t0, Rd);
+
+    tcg_gen_mov_tl(Rd, t0); /* Rd = t0 */
+    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
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
+
+    tcg_gen_shri_tl(Rd, Rd, 1);
+
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, Rd, 0); /* Zf = Rd == 0 */
+    tcg_gen_movi_tl(cpu_Nf, 0);
+    tcg_gen_mov_tl(cpu_Vf, cpu_Cf);
+    tcg_gen_mov_tl(cpu_Sf, cpu_Vf);
+
+    return true;
+}
+
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
+    tcg_gen_andi_tl(cpu_Cf, Rd, 1);
+    tcg_gen_shri_tl(Rd, Rd, 1);
+    tcg_gen_or_tl(Rd, Rd, t0);
+
+    gen_rshift_ZNVSf(Rd);
+
+    tcg_temp_free_i32(t0);
+
+    return true;
+}
+
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
+    /* Cf */
+    tcg_gen_andi_tl(cpu_Cf, Rd, 1); /* Cf = Rd(0) */
+
+    /* op */
+    tcg_gen_andi_tl(t0, Rd, 0x80); /* Rd = (Rd & 0x80) | (Rd >> 1) */
+    tcg_gen_shri_tl(Rd, Rd, 1);
+    tcg_gen_or_tl(Rd, Rd, t0);
+
+    gen_rshift_ZNVSf(Rd);
+
+    tcg_temp_free_i32(t0);
+
+    return true;
+}
+
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
-- 
2.17.2 (Apple Git-113)


