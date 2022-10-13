Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811925FD64F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:39:39 +0200 (CEST)
Received: from localhost ([::1]:47556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oitkg-0004PB-2m
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oitaV-00060G-24
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:29:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53752 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oitaR-0004Qa-Hy
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:29:06 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxvmtGzEdjCdwsAA--.18330S7; 
 Thu, 13 Oct 2022 16:28:59 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
Subject: [RISU PATCH v2 5/5] loongarch: Add block 'safefloat' and nanbox_s()
Date: Thu, 13 Oct 2022 16:28:54 +0800
Message-Id: <20221013082854.878546-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221013082854.878546-1-gaosong@loongson.cn>
References: <20221013082854.878546-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxvmtGzEdjCdwsAA--.18330S7
X-Coremail-Antispam: 1UD129KBjvJXoWfJr1xGryxWF4fCw17JF4Dtwb_yoWDKFy5pr
 ZrtFWakr4xXr47Ar4kKr1Utay3Grn7Aa1UAryUtF12qr1UXr1kXryrZrW8trWkWr15Aryx
 Gr13tr10qr1UG3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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

Some LoongArch instructions don't care the high 32bit,
so use nanbox_s() set the high 32bit 0xffffffff.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 loongarch64.risu       | 119 +++++++++++++++++++++++++++--------------
 risugen                |   2 +-
 risugen_loongarch64.pm |  23 ++++++++
 3 files changed, 103 insertions(+), 41 deletions(-)

diff --git a/loongarch64.risu b/loongarch64.risu
index d059811..d625a12 100644
--- a/loongarch64.risu
+++ b/loongarch64.risu
@@ -62,7 +62,7 @@ mulw_d_wu LA64 0000 00000001 11111 rk:5 rj:5 rd:5 \
     !constraints { $rk != 2 && $rj != 2 && $rd != 2; }
 
 #div.{w[u]/d[u]} rd,rj,rk
-# the docement 2.2.13,  rk, rj, need in 32bit [0x0 ~0x7FFFFFFF]
+# div.w{u}, mod.w[u]  rk, rj, need in [0x0 ~0x7FFFFFFF]
 # use function set_reg_w($reg)
 div_w LA64 0000 00000010 00000 rk:5 rj:5 rd:5 \
     !constraints { $rk != 2 && $rj != 2 && $rd != 2; } \
@@ -436,47 +436,68 @@ crcc_w_d_w LA64 0000 00000010 01111 rk:5 rj:5 rd:5 \
 #
 # Floating point arithmetic operation instruction
 #
-fadd_s LA64 0000 00010000 00001 fk:5 fj:5 fd:5
+fadd_s LA64 0000 00010000 00001 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fadd_d LA64 0000 00010000 00010 fk:5 fj:5 fd:5
-fsub_s LA64 0000 00010000 00101 fk:5 fj:5 fd:5
+fsub_s LA64 0000 00010000 00101 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fsub_d LA64 0000 00010000 00110 fk:5 fj:5 fd:5
-fmul_s LA64 0000 00010000 01001 fk:5 fj:5 fd:5
+fmul_s LA64 0000 00010000 01001 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fmul_d LA64 0000 00010000 01010 fk:5 fj:5 fd:5
-fdiv_s LA64 0000 00010000 01101 fk:5 fj:5 fd:5
+fdiv_s LA64 0000 00010000 01101 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fdiv_d LA64 0000 00010000 01110 fk:5 fj:5 fd:5
-fmadd_s LA64 0000 10000001 fa:5 fk:5 fj:5 fd:5
+fmadd_s LA64 0000 10000001 fa:5 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fmadd_d LA64 0000 10000010 fa:5 fk:5 fj:5 fd:5
-fmsub_s LA64 0000 10000101 fa:5 fk:5 fj:5 fd:5
+fmsub_s LA64 0000 10000101 fa:5 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fmsub_d LA64 0000 10000110 fa:5 fk:5 fj:5 fd:5
-fnmadd_s LA64 0000 10001001 fa:5 fk:5 fj:5 fd:5
+fnmadd_s LA64 0000 10001001 fa:5 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fnmadd_d LA64 0000 10001010 fa:5 fk:5 fj:5 fd:5
-fnmsub_s LA64 0000 10001101 fa:5 fk:5 fj:5 fd:5
+fnmsub_s LA64 0000 10001101 fa:5 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fnmsub_d LA64 0000 10001110 fa:5 fk:5 fj:5 fd:5
-fmax_s LA64 0000 00010000 10001 fk:5 fj:5 fd:5
+fmax_s LA64 0000 00010000 10001 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fmax_d LA64 0000 00010000 10010 fk:5 fj:5 fd:5
-fmin_s LA64 0000 00010000 10101 fk:5 fj:5 fd:5
+fmin_s LA64 0000 00010000 10101 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fmin_d LA64 0000 00010000 10110 fk:5 fj:5 fd:5
-fmaxa_s LA64 0000 00010000 11001 fk:5 fj:5 fd:5
+fmaxa_s LA64 0000 00010000 11001 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fmaxa_d LA64 0000 00010000 11010 fk:5 fj:5 fd:5
-fmina_s LA64 0000 00010000 11101 fk:5 fj:5 fd:5
+fmina_s LA64 0000 00010000 11101 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fmina_d LA64 0000 00010000 11110 fk:5 fj:5 fd:5
-fabs_s LA64 0000 00010001 01000 00001 fj:5 fd:5
+fabs_s LA64 0000 00010001 01000 00001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fabs_d LA64 0000 00010001 01000 00010 fj:5 fd:5
-fneg_s LA64 0000 00010001 01000 00101 fj:5 fd:5
+fneg_s LA64 0000 00010001 01000 00101 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fneg_d LA64 0000 00010001 01000 00110 fj:5 fd:5
-fsqrt_s LA64 0000 00010001 01000 10001 fj:5 fd:5
+fsqrt_s LA64 0000 00010001 01000 10001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fsqrt_d LA64 0000 00010001 01000 10010 fj:5 fd:5
-frecip_s LA64 0000 00010001 01000 10101 fj:5 fd:5
+frecip_s LA64 0000 00010001 01000 10101 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 frecip_d LA64 0000 00010001 01000 10110 fj:5 fd:5
-frsqrt_s LA64 0000 00010001 01000 11001 fj:5 fd:5
+frsqrt_s LA64 0000 00010001 01000 11001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 frsqrt_d LA64 0000 00010001 01000 11010 fj:5 fd:5
-fscaleb_s LA64 0000 00010001 00001 fk:5 fj:5 fd:5
+fscaleb_s LA64 0000 00010001 00001 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fscaleb_d LA64 0000 00010001 00010 fk:5 fj:5 fd:5
-flogb_s LA64 0000 00010001 01000 01001 fj:5 fd:5
+flogb_s LA64 0000 00010001 01000 01001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 flogb_d LA64 0000 00010001 01000 01010 fj:5 fd:5
-fcopysign_s LA64 0000 00010001 00101 fk:5 fj:5 fd:5
+fcopysign_s LA64 0000 00010001 00101 fk:5 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fcopysign_d LA64 0000 00010001 00110 fk:5 fj:5 fd:5
-fclass_s LA64 0000 00010001 01000 01101 fj:5 fd:5
+fclass_s LA64 0000 00010001 01000 01101 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fclass_d LA64 0000 00010001 01000 01110 fj:5 fd:5
 
 #
@@ -490,43 +511,59 @@ fcmp_cond_d LA64 0000 11000010 cond:5 fk:5 fj:5 00 cd:3 \
 #
 # Floating point conversion instruction
 #
-fcvt_s_d LA64 0000 00010001 10010 00110 fj:5 fd:5
+fcvt_s_d LA64 0000 00010001 10010 00110 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fcvt_d_s LA64 0000 00010001 10010 01001 fj:5 fd:5
-ftintrm_w_s LA64 0000 00010001 10100 00001 fj:5 fd:5
-ftintrm_w_d LA64 0000 00010001 10100 00010 fj:5 fd:5
+ftintrm_w_s LA64 0000 00010001 10100 00001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
+ftintrm_w_d LA64 0000 00010001 10100 00010 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 ftintrm_l_s LA64 0000 00010001 10100 01001 fj:5 fd:5
 ftintrm_l_d LA64 0000 00010001 10100 01010 fj:5 fd:5
-ftintrp_w_s LA64 0000 00010001 10100 10001 fj:5 fd:5
-ftintrp_w_d LA64 0000 00010001 10100 10010 fj:5 fd:5
+ftintrp_w_s LA64 0000 00010001 10100 10001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
+ftintrp_w_d LA64 0000 00010001 10100 10010 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 ftintrp_l_s LA64 0000 00010001 10100 11001 fj:5 fd:5
 ftintrp_l_d LA64 0000 00010001 10100 11010 fj:5 fd:5
-ftintrz_w_s LA64 0000 00010001 10101 00001 fj:5 fd:5
-ftintrz_w_d LA64 0000 00010001 10101 00010 fj:5 fd:5
+ftintrz_w_s LA64 0000 00010001 10101 00001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
+ftintrz_w_d LA64 0000 00010001 10101 00010 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 ftintrz_l_s LA64 0000 00010001 10101 01001 fj:5 fd:5
 ftintrz_l_d LA64 0000 00010001 10101 01010 fj:5 fd:5
-ftintrne_w_s LA64 0000 00010001 10101 10001 fj:5 fd:5
-ftintrne_w_d LA64 0000 00010001 10101 10010 fj:5 fd:5
+ftintrne_w_s LA64 0000 00010001 10101 10001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
+ftintrne_w_d LA64 0000 00010001 10101 10010 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 ftintrne_l_s LA64 0000 00010001 10101 11001 fj:5 fd:5
 ftintrne_l_d LA64 0000 00010001 10101 11010 fj:5 fd:5
-ftint_w_s LA64 0000 00010001 10110 00001 fj:5 fd:5
-ftint_w_d LA64 0000 00010001 10110 00010 fj:5 fd:5
+ftint_w_s LA64 0000 00010001 10110 00001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
+ftint_w_d LA64 0000 00010001 10110 00010 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 ftint_l_s LA64 0000 00010001 10110 01001 fj:5 fd:5
 ftint_l_d LA64 0000 00010001 10110 01010 fj:5 fd:5
-ffint_s_w LA64 0000 00010001 11010 00100 fj:5 fd:5
-ffint_s_l LA64 0000 00010001 11010 00110 fj:5 fd:5
+ffint_s_w LA64 0000 00010001 11010 00100 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
+ffint_s_l LA64 0000 00010001 11010 00110 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 ffint_d_w LA64 0000 00010001 11010 01000 fj:5 fd:5
 ffint_d_l LA64 0000 00010001 11010 01010 fj:5 fd:5
-frint_s LA64 0000 00010001 11100 10001 fj:5 fd:5
+frint_s LA64 0000 00010001 11100 10001 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 frint_d LA64 0000 00010001 11100 10010 fj:5 fd:5
 
 #
 # Floating point move instruction
 #
-fmov_s LA64 0000 00010001 01001 00101 fj:5 fd:5
+fmov_s LA64 0000 00010001 01001 00101 fj:5 fd:5 \
+    !safefloat { nanbox_s($fd); }
 fmov_d LA64 0000 00010001 01001 00110 fj:5 fd:5
 fsel LA64 0000 11010000 00 ca:3 fk:5 fj:5 fd:5
 movgr2fr_w LA64 0000 00010001 01001 01001 rj:5 fd:5 \
-    !constraints { $rj != 2; }
+    !constraints { $rj != 2; } \
+    !safefloat { nanbox_s($fd); }
 movgr2fr_d LA64 0000 00010001 01001 01010 rj:5 fd:5 \
     !constraints { $rj != 2; }
 movgr2frh_w LA64 0000 00010001 01001 01011 rj:5 fd:5 \
@@ -549,7 +586,8 @@ movcf2gr LA64 0000 00010001 01001 10111 00 cj:3 rd:5 \
 #
 fld_s LA64 0010 101100 si12:12 rj:5 fd:5 \
     !constraints { $rj != 0 && $rj != 2; } \
-    !memory { reg_plus_imm($rj, sextract($si12, 12)); }
+    !memory { reg_plus_imm($rj, sextract($si12, 12)); } \
+    !safefloat { nanbox_s($fd); }
 fst_s LA64 0010 101101 si12:12 rj:5 fd:5 \
     !constraints { $rj != 0 && $rj != 2; } \
     !memory { reg_plus_imm($rj, sextract($si12, 12)); }
@@ -561,7 +599,8 @@ fst_d LA64 0010 101111 si12:12 rj:5 fd:5 \
     !memory { reg_plus_imm($rj, sextract($si12, 12)); }
 fldx_s LA64 0011 10000011 00000 rk:5 rj:5 fd:5 \
     !constraints { $rj != 0 && $rj != $rk && $rk != 2 && $rj != 2; } \
-    !memory { reg_plus_reg($rj, $rk); }
+    !memory { reg_plus_reg($rj, $rk); } \
+    !safefloat { nanbox_s($fd); }
 fldx_d LA64 0011 10000011 01000 rk:5 rj:5 fd:5 \
     !constraints { $rj != 0 && $rj != $rk && $rk != 2 && $rj != 2; } \
     !memory { reg_plus_reg($rj, $rk); }
diff --git a/risugen b/risugen
index e690b18..fa94a39 100755
--- a/risugen
+++ b/risugen
@@ -43,7 +43,7 @@ my @pattern_re = ();            # include pattern
 my @not_pattern_re = ();        # exclude pattern
 
 # Valid block names (keys in blocks hash)
-my %valid_blockname = ( constraints => 1, memory => 1 );
+my %valid_blockname = ( constraints => 1, memory => 1, safefloat =>1 );
 
 sub parse_risu_directive($$@)
 {
diff --git a/risugen_loongarch64.pm b/risugen_loongarch64.pm
index 98948a2..5394fdc 100644
--- a/risugen_loongarch64.pm
+++ b/risugen_loongarch64.pm
@@ -66,6 +66,21 @@ sub set_reg_w($)
     return $reg;
 }
 
+sub nanbox_s($)
+{
+    my ($fpreg)=@_;
+
+    # Set $fpreg register high 32bit ffffffff
+    # use r1 as a temp register
+    # r1 = r1 | ~(r0)
+    write_mov_ri(1, -1);
+
+    # movgr2frh.w   $fpreg ,$1
+    insn32(0x114ac00 | 1 << 5 | $fpreg);
+
+    return $fpreg;
+}
+
 sub align($)
 {
     my ($a) = @_;
@@ -379,6 +394,7 @@ sub gen_one_insn($$)
         my $fixedbitmask = $rec->{fixedbitmask};
         my $constraint = $rec->{blocks}{"constraints"};
         my $memblock = $rec->{blocks}{"memory"};
+        my $safefloat = $rec->{blocks}{"safefloat"};
 
         $insn &= ~$fixedbitmask;
         $insn |= $fixedbits;
@@ -415,6 +431,13 @@ sub gen_one_insn($$)
 
         insn32($insn);
 
+        if (defined $safefloat) {
+            # Some result only care about low 32bit,
+            # so we use nanbox_s() make sure that high 32bit is 0xffffffff;
+            my $resultreg;
+            $resultreg = eval_with_fields($insnname, $insn, $rec, "safefloat", $safefloat);
+        }
+
         if (defined $memblock) {
             # Clean up following a memory access instruction:
             # we need to turn the (possibly written-back) basereg
-- 
2.31.1


