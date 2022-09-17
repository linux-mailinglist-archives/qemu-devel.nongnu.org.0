Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49E5BB703
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 09:46:07 +0200 (CEST)
Received: from localhost ([::1]:51518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZSWc-0001c9-Ci
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 03:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oZSU6-0004e8-5c
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:43:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55876 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oZSU2-0006BB-Fy
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:43:29 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72uVeiVjfgQcAA--.38083S5; 
 Sat, 17 Sep 2022 15:43:19 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
Subject: [RISU PATCH 3/5] loongarch: Implement risugen module
Date: Sat, 17 Sep 2022 15:43:15 +0800
Message-Id: <20220917074317.1410274-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220917074317.1410274-1-gaosong@loongson.cn>
References: <20220917074317.1410274-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72uVeiVjfgQcAA--.38083S5
X-Coremail-Antispam: 1UD129KBjvAXoW3CryxtF1kKr1DGw1DtF1DZFb_yoW8JF18to
 Wfuw4xXF1rtw18Zrn5Crn7J347ZFZ5Gan8A3W5Gr4a9Fy8Xr1Yga4293sxur13Jay5CF18
 u34vq3WfJay8tas3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 risugen_loongarch64.pm | 502 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 502 insertions(+)
 create mode 100644 risugen_loongarch64.pm

diff --git a/risugen_loongarch64.pm b/risugen_loongarch64.pm
new file mode 100644
index 0000000..693fb71
--- /dev/null
+++ b/risugen_loongarch64.pm
@@ -0,0 +1,502 @@
+#!/usr/bin/perl -w
+###############################################################################
+# Copyright (c) 2022 Loongson Technology Corporation Limited
+# All rights reserved. This program and the accompanying materials
+# are made available under the terms of the Eclipse Public License v1.0
+# which accompanies this distribution, and is available at
+# http://www.eclipse.org/legal/epl-v10.html
+#
+# Contributors:
+#     based on Peter Maydell (Linaro) - initial implementation
+###############################################################################
+
+# risugen -- generate a test binary file for use with risu
+# See 'risugen --help' for usage information.
+package risugen_loongarch64;
+
+use strict;
+use warnings;
+
+use risugen_common;
+
+require Exporter;
+
+our @ISA    = qw(Exporter);
+our @EXPORT = qw(write_test_code);
+
+my $periodic_reg_random = 1;
+
+# Maximum alignment restriction permitted for a memory op.
+my $MAXALIGN = 64;
+
+my $OP_COMPARE = 0;        # compare registers
+my $OP_TESTEND = 1;        # end of test, stop
+my $OP_SETMEMBLOCK = 2;    # r4 is address of memory block (8192 bytes)
+my $OP_GETMEMBLOCK = 3;    # add the address of memory block to r4
+my $OP_COMPAREMEM = 4;     # compare memory block
+
+sub write_risuop($)
+{
+    my ($op) = @_;
+    insn32(0x000001f0 | $op);
+}
+
+sub write_set_fcsr($)
+{
+    my ($fcsr) = @_;
+    # movgr2fcsr r0, r0
+    insn32(0x0114c000);
+}
+
+# Global used to communicate between align(x) and reg() etc.
+my $alignment_restriction;
+
+sub set_reg_w($)
+{
+    my($reg)=@_;
+    # Set reg [0x0, 0x7FFFFFFF]
+
+    # $reg << 33
+    # slli.d  $reg, $reg, 33
+    insn32(0x410000 | 33 << 10 | $reg << 5 | $reg);
+    # $reg >> 33
+    # srli.d  $reg, $reg, 33
+    insn32(0x450000 | 33 << 10 | $reg << 5 | $reg);
+
+    return $reg;
+}
+
+sub align($)
+{
+    my ($a) = @_;
+    if (!is_pow_of_2($a) || ($a < 0) || ($a > $MAXALIGN)) {
+        die "bad align() value $a\n";
+    }
+    $alignment_restriction = $a;
+}
+
+sub write_sub_rrr($$$)
+{
+    my ($rd, $rj, $rk) = @_;
+    # sub.d rd, rj, rk
+    insn32(0x00118000 | $rk << 10 | $rj << 5 | $rd);
+}
+
+sub write_mov_rr($$$)
+{
+    my($rd, $rj, $rk) = @_;
+    # add.d rd, rj, r0
+    insn32(0x00108000 | 0 << 10 | $rj << 5 | $rd);
+}
+
+sub write_mov_positive_ri($$)
+{
+    # Use lu12i.w and ori instruction
+    my ($rd, $imm) = @_;
+    my $high_20 = ($imm >> 12) & 0xfffff;
+
+    if ($high_20) {
+        # lu12i.w rd, si20
+        insn32(0x14000000 | $high_20 << 5 | $rd);
+        # ori rd, rd, ui12
+        insn32(0x03800000 | ($imm & 0xfff) << 10 | $rd << 5 | $rd);
+    } else {
+        # ori rd, 0, ui12
+        insn32(0x03800000 | ($imm & 0xfff) << 10 | 0 << 5 | $rd);
+    }
+}
+
+sub write_mov_ri($$)
+{
+    my ($rd, $imm) = @_;
+
+    if ($imm < 0) {
+        my $tmp = 0 - $imm ;
+        write_mov_positive_ri($rd, $tmp);
+        write_sub_rrr($rd, 0, $rd);
+    } else {
+        write_mov_positive_ri($rd, $imm);
+    }
+}
+
+sub write_get_offset()
+{
+    # Emit code to get a random offset within the memory block, of the
+    # right alignment, into r4
+    # We require the offset to not be within 256 bytes of either
+    # end, to (more than) allow for the worst case data transfer, which is
+    # 16 * 64 bit regs
+    my $offset = (rand(2048 - 512) + 256) & ~($alignment_restriction - 1);
+    write_mov_ri(4, $offset);
+    write_risuop($OP_GETMEMBLOCK);
+}
+
+sub reg_plus_reg($$@)
+{
+    my ($base, $idx, @trashed) = @_;
+    my $savedidx = 0;
+    if ($idx == 4) {
+        # Save the index into some other register for the
+        # moment, because the risuop will trash r4.
+        $idx = 5;
+        $idx++ if $idx == $base;
+        $savedidx = 1;
+        write_mov_rr($idx, 4, 0);
+    }
+    # Get a random offset within the memory block, of the
+    # right alignment.
+    write_get_offset();
+
+    write_sub_rrr($base, 4, $idx);
+    if ($base != 4) {
+        if ($savedidx) {
+            write_mov_rr(4, $idx, 0);
+            write_mov_ri($idx, 0);
+        } else {
+            write_mov_ri(4, 0);
+        }
+    } else {
+	if ($savedidx) {
+            write_mov_ri($idx, 0);
+	}
+    }
+
+    if (grep $_ == $base, @trashed) {
+        return -1;
+    }
+    return $base;
+}
+
+sub reg_plus_imm($$@)
+{
+    # Handle reg + immediate addressing mode
+    my ($base, $imm, @trashed) = @_;
+
+    write_get_offset();
+    # Now r4 is the address we want to do the access to,
+    # so set the basereg by doing the inverse of the
+    # addressing mode calculation, ie base = r4 - imm
+    # We could do this more cleverly with a sub immediate.
+    if ($base != 4) {
+        write_mov_ri($base, $imm);
+        write_sub_rrr($base, 4, $base);
+        # Clear r4 to avoid register compare mismatches
+        # when the memory block location differs between machines.
+         write_mov_ri(4, 0);
+    }else {
+        # We borrow r1 as a temporary (not a problem
+        # as long as we don't leave anything in a register
+        # which depends on the location of the memory block)
+        write_mov_ri(1, $imm);
+        write_sub_rrr($base, 4, 1);
+    }
+
+    if (grep $_ == $base, @trashed) {
+        return -1;
+    }
+    return $base;
+}
+
+sub write_pc_adr($$)
+{
+    my($rd, $imm) = @_;
+    # pcaddi (si20 | 2bit 0) + pc
+    insn32(0x18000000 | $imm << 5 | $rd);
+}
+
+sub write_and($$$)
+{
+    my($rd, $rj, $rk)  = @_;
+    # and rd, rj, rk
+    insn32(0x148000 | $rk << 10 | $rj << 5 | $rd);
+}
+
+sub write_align_reg($$)
+{
+    my ($rd, $align) = @_;
+    # rd = rd & ~($align -1);
+    # use r1 as a temp register.
+    write_mov_ri(1, $align -1);
+    write_sub_rrr(1, 0, 1);
+    write_and($rd, $rd, 1);
+}
+
+sub write_jump_fwd($)
+{
+    my($len) = @_;
+    # b pc + len
+    my ($offslo, $offshi) = (($len / 4 + 1) & 0xffff, ($len / 4 + 1) >> 16);
+    insn32(0x50000000 | $offslo << 10 | $offshi);
+}
+
+sub write_memblock_setup()
+{
+    my $align = $MAXALIGN;
+    my $datalen = 8192 + $align;
+    if (($align > 255) || !is_pow_of_2($align) || $align < 4) {
+        die "bad alignment!";
+    }
+
+    # Set r4 to (datablock + (align-1)) & ~(align-1)
+    # datablock is at PC + (4 * 4 instructions) = PC + 16
+    write_pc_adr(4, (4 * 4) + ($align - 1)); #insn 1
+    write_align_reg(4, $align);              #insn 2
+    write_risuop($OP_SETMEMBLOCK);           #insn 3
+    write_jump_fwd($datalen);                #insn 4
+
+    for(my $i = 0; $i < $datalen / 4; $i++) {
+        insn32(rand(0xffffffff));
+    }
+}
+
+# Write random fp value of passed precision (1=single, 2=double, 4=quad)
+sub write_random_fpreg_var($)
+{
+    my ($precision) = @_;
+    my $randomize_low = 0;
+
+    if ($precision != 1 && $precision != 2 && $precision != 4) {
+        die "write_random_fpreg: invalid precision.\n";
+    }
+
+    my ($low, $high);
+    my $r = rand(100);
+    if ($r < 5) {
+        # +-0 (5%)
+        $low = $high = 0;
+        $high |= 0x80000000 if (rand() < 0.5);
+    } elsif ($r < 10) {
+        # NaN (5%)
+        # (plus a tiny chance of generating +-Inf)
+        $randomize_low = 1;
+        $high = rand(0xffffffff) | 0x7ff00000;
+    } elsif ($r < 15) {
+        # Infinity (5%)
+        $low = 0;
+        $high = 0x7ff00000;
+        $high |= 0x80000000 if (rand() < 0.5);
+    } elsif ($r < 30) {
+        # Denormalized number (15%)
+        # (plus tiny chance of +-0)
+        $randomize_low = 1;
+        $high = rand(0xffffffff) & ~0x7ff00000;
+    } else {
+        # Normalized number (70%)
+        # (plus a small chance of the other cases)
+        $randomize_low = 1;
+        $high = rand(0xffffffff);
+    }
+
+    for (my $i = 1; $i < $precision; $i++) {
+        if ($randomize_low) {
+            $low = rand(0xffffffff);
+        }
+        insn32($low);
+    }
+    insn32($high);
+}
+
+sub write_random_loongarch64_fpdata()
+{
+    # Load floating point registers
+    my $align = 16;
+    my $datalen = 32 * 16 + $align;
+    my $off = 0;
+    write_pc_adr(5, (4 * 4) + $align);       # insn 1  pcaddi
+    write_pc_adr(4, (3 * 4) + ($align - 1)); # insn 2  pcaddi
+    write_align_reg(4, $align);              # insn 3  andi
+    write_jump_fwd($datalen);                # insn 4  b pc + len
+
+    # Align safety
+    for (my $i = 0; $i < ($align / 4); $i++) {
+        insn32(rand(0xffffffff));
+    }
+
+    for (my $i = 0; $i < 32; $i++) {
+        write_random_fpreg_var(4); # double
+    }
+
+    $off = 0;
+    for (my $i = 0; $i < 32; $i++) {
+        my $tmp_reg = 6;
+        # r5 is fp register initial val
+        # r4 is aligned base address
+        # copy memory from r5 to r4
+        # ld.d r6, r5, $off
+        # st.d r6, r4, $off
+        # $off = $off + 16
+        insn32(0x28c00000 | $off << 10 | 5 << 5 | $tmp_reg);
+        insn32(0x29c00000 | $off << 10 | 4 << 5 | $tmp_reg);
+        $off = $off + 8;
+        insn32(0x28c00000 | $off << 10 | 5 << 5 | $tmp_reg);
+        insn32(0x29c00000 | $off << 10 | 4 << 5 | $tmp_reg);
+        $off = $off + 8;
+    }
+
+    $off = 0;
+    for (my $i = 0; $i < 32; $i++) {
+        # fld.d fd, r4, $off
+        insn32(0x2b800000 | $off << 10 | 4 << 5 | $i);
+        $off = $off + 16;
+    }
+}
+
+sub write_random_regdata()
+{
+    # General purpose registers, skip r2
+    write_mov_ri(1, rand(0xffffffff)); # init r1
+    for  (my $i = 3; $i < 32; $i++) {
+        write_mov_ri($i, rand(0xffffffff));
+    }
+}
+
+sub write_random_register_data($)
+{
+    my ($fp_enabled) = @_;
+
+    # Set fcc0 ~ fcc7
+    # movgr2cf $fcc0, $zero
+    insn32(0x114d800);
+    # movgr2cf $fcc1, $zero
+    insn32(0x114d801);
+    # movgr2cf $fcc2, $zero
+    insn32(0x114d802);
+    # movgr2cf $fcc3, $zero
+    insn32(0x114d803);
+    # movgr2cf $fcc4, $zero
+    insn32(0x114d804);
+    # movgr2cf $fcc5, $zero
+    insn32(0x114d805);
+    # movgr2cf $fcc6, $zero
+    insn32(0x114d806);
+    # movgr2cf $fcc7, $zero
+    insn32(0x114d807);
+
+    if ($fp_enabled) {
+        # Load floating point registers
+        write_random_loongarch64_fpdata();
+    }
+
+    write_random_regdata();
+    write_risuop($OP_COMPARE);
+}
+
+sub gen_one_insn($$)
+{
+    # Given an instruction-details array, generate an instruction
+    my $constraintfailures = 0;
+
+    INSN: while(1) {
+        my ($forcecond, $rec) = @_;
+        my $insn = int(rand(0xffffffff));
+        my $insnname = $rec->{name};
+        my $insnwidth = $rec->{width};
+        my $fixedbits = $rec->{fixedbits};
+        my $fixedbitmask = $rec->{fixedbitmask};
+        my $constraint = $rec->{blocks}{"constraints"};
+        my $memblock = $rec->{blocks}{"memory"};
+
+        $insn &= ~$fixedbitmask;
+        $insn |= $fixedbits;
+
+        if (defined $constraint) {
+            # User-specified constraint: evaluate in an environment
+            # with variables set corresponding to the variable fields.
+            my $v = eval_with_fields($insnname, $insn, $rec, "constraints", $constraint);
+            if(!$v) {
+                $constraintfailures++;
+                if ($constraintfailures > 10000) {
+                    print "10000 consecutive constraint failures for $insnname constraints string:\n$constraint\n";
+                    exit (1);
+                }
+                next INSN;
+            }
+        }
+
+        # OK, we got a good one
+        $constraintfailures = 0;
+
+        my $basereg;
+
+        if (defined $memblock) {
+            # This is a load or store. We simply evaluate the block,
+            # which is expected to be a call to a function which emits
+            # the code to set up the base register and returns the
+            # number of the base register.
+            # Default alignment requirement for ARM is 4 bytes,
+            # we use 16 for Aarch64, although often unnecessary and overkill.
+            align(16);
+            $basereg = eval_with_fields($insnname, $insn, $rec, "memory", $memblock);
+        }
+
+        insn32($insn);
+
+        if (defined $memblock) {
+            # Clean up following a memory access instruction:
+            # we need to turn the (possibly written-back) basereg
+            # into an offset from the base of the memory block,
+            # to avoid making register values depend on memory layout.
+            # $basereg -1 means the basereg was a target of a load
+            # (and so it doesn't contain a memory address after the op)
+            if ($basereg != -1) {
+                write_mov_ri($basereg, 0);
+            }
+            write_risuop($OP_COMPAREMEM);
+        }
+        return;
+    }
+}
+
+sub write_test_code($)
+{
+    my ($params) = @_;
+
+    my $condprob = $params->{ 'condprob' };
+    my $fcsr = $params->{'fpscr'};
+    my $numinsns = $params->{ 'numinsns' };
+    my $fp_enabled = $params->{ 'fp_enabled' };
+    my $outfile = $params->{ 'outfile' };
+
+    my %insn_details = %{ $params->{ 'details' } };
+    my @keys = @{ $params->{ 'keys' } };
+
+    open_bin($outfile);
+
+    # Convert from probability that insn will be conditional to
+    # probability of forcing insn to unconditional
+    $condprob = 1 - $condprob;
+
+    # TODO better random number generator?
+    srand(0);
+
+    print "Generating code using patterns: @keys...\n";
+    progress_start(78, $numinsns);
+
+    if ($fp_enabled) {
+        write_set_fcsr($fcsr);
+    }
+
+    if (grep { defined($insn_details{$_}->{blocks}->{"memory"}) } @keys) {
+        write_memblock_setup();
+    }
+    # Memblock setup doesn't clean its registers, so this must come afterwards.
+    write_random_register_data($fp_enabled);
+
+    for my $i (1..$numinsns) {
+        my $insn_enc = $keys[int rand (@keys)];
+        my $forcecond = (rand() < $condprob) ? 1 : 0;
+        gen_one_insn($forcecond, $insn_details{$insn_enc});
+        write_risuop($OP_COMPARE);
+        # Rewrite the registers periodically. This avoids the tendency
+        # for the VFP registers to decay to NaNs and zeroes.
+        if ($periodic_reg_random && ($i % 100) == 0) {
+            write_random_register_data($fp_enabled);
+        }
+        progress_update($i);
+    }
+    write_risuop($OP_TESTEND);
+    progress_end();
+    close_bin();
+}
+
+1;
-- 
2.31.1


