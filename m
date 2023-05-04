Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F86F6B2C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:29:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4b-0001Ut-2z; Thu, 04 May 2023 08:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4O-0001Rk-CC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:24 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4K-0002yA-De
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:24 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxnOrbpFNkeaAEAA--.7399S3;
 Thu, 04 May 2023 20:28:11 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S2; 
 Thu, 04 May 2023 20:28:10 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 00/44] Add LoongArch LSX instructions
Date: Thu,  4 May 2023 20:27:26 +0800
Message-Id: <20230504122810.4094787-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWFWUZFWrtr4kAr4DAry7Wrg_yoWrAryfpr
 W7ZrnrtFW8XrZ7XF1kXa9xZrn0qr18G3y2v3Z3t348uw43AryxZF18t3sFgFyUXayUCry2
 qFy0kwn8XF43X37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b08Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xAC
 xx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx2
 6rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,

This series adds LoongArch LSX instructions.

About test:
V2 we use RISU test the LoongArch LSX instructions.

QEMU:
    https://github.com/loongson/qemu/tree/tcg-old-abi-support-lsx
RISU:
    https://github.com/loongson/risu/tree/loongarch-suport-lsx

Build test:
make docker-test-build@fedora-i386-cross

V5:
  - R-b and rebase;
  - vld/vst{x} Memop = MO_128 | MO_TE.

V4:
  - R-b and rebase;
  - Migrate the upper half lsx regs;
  - Remove tcg_gen_mulus2_*;
  - Vsetallnez use !do_match2;
  - Use tcg_gen_concat_i64_i128/tcg_gen_extr_i128_i64 to replace 
    TCGV128_LOW(val)/TCGV128_High(val);

V3:
  - R-b;
  - Add unsigned data type in vreg;
  - Add ctx->vl;
  - Use tcg_constant_vec_matching instead of dupi;
  - Use __typeof(Vd->E(0)) instead of the output type;
  - Tcg integer expansion;
  - Use tcg_gen_qemu_ld/st_i128 to implement vld/vst;
  - Fix some typos;
  - Optimize code based on Richard's comments.

V2:
  - Use gvec;
  - Fix instructions bugs;
  - Add set_fpr()/get_fpr() replace to cpu_fpr.

Song Gao (44):
  target/loongarch: Add LSX data type VReg
  target/loongarch: meson.build support build LSX
  target/loongarch: Add CHECK_SXE maccro for check LSX enable
  target/loongarch: Implement vadd/vsub
  target/loongarch: Implement vaddi/vsubi
  target/loongarch: Implement vneg
  target/loongarch: Implement vsadd/vssub
  target/loongarch: Implement vhaddw/vhsubw
  target/loongarch: Implement vaddw/vsubw
  target/loongarch: Implement vavg/vavgr
  target/loongarch: Implement vabsd
  target/loongarch: Implement vadda
  target/loongarch: Implement vmax/vmin
  target/loongarch: Implement vmul/vmuh/vmulw{ev/od}
  target/loongarch: Implement vmadd/vmsub/vmaddw{ev/od}
  target/loongarch: Implement vdiv/vmod
  target/loongarch: Implement vsat
  target/loongarch: Implement vexth
  target/loongarch: Implement vsigncov
  target/loongarch: Implement vmskltz/vmskgez/vmsknz
  target/loongarch: Implement LSX logic instructions
  target/loongarch: Implement vsll vsrl vsra vrotr
  target/loongarch: Implement vsllwil vextl
  target/loongarch: Implement vsrlr vsrar
  target/loongarch: Implement vsrln vsran
  target/loongarch: Implement vsrlrn vsrarn
  target/loongarch: Implement vssrln vssran
  target/loongarch: Implement vssrlrn vssrarn
  target/loongarch: Implement vclo vclz
  target/loongarch: Implement vpcnt
  target/loongarch: Implement vbitclr vbitset vbitrev
  target/loongarch: Implement vfrstp
  target/loongarch: Implement LSX fpu arith instructions
  target/loongarch: Implement LSX fpu fcvt instructions
  target/loongarch: Implement vseq vsle vslt
  target/loongarch: Implement vfcmp
  target/loongarch: Implement vbitsel vset
  target/loongarch: Implement vinsgr2vr vpickve2gr vreplgr2vr
  target/loongarch: Implement vreplve vpack vpick
  target/loongarch: Implement vilvl vilvh vextrins vshuf
  target/loongarch: Implement vld vst
  target/loongarch: Implement vldi
  target/loongarch: Use {set/get}_gpr replace to cpu_fpr
  target/loongarch: CPUCFG support LSX

 linux-user/loongarch64/signal.c               |    4 +-
 target/loongarch/cpu.c                        |    5 +-
 target/loongarch/cpu.h                        |   27 +-
 target/loongarch/disas.c                      |  911 ++++
 target/loongarch/fpu_helper.c                 |    2 +-
 target/loongarch/gdbstub.c                    |    4 +-
 target/loongarch/helper.h                     |  566 +++
 .../loongarch/insn_trans/trans_farith.c.inc   |   72 +-
 target/loongarch/insn_trans/trans_fcmp.c.inc  |   12 +-
 .../loongarch/insn_trans/trans_fmemory.c.inc  |   37 +-
 target/loongarch/insn_trans/trans_fmov.c.inc  |   31 +-
 target/loongarch/insn_trans/trans_lsx.c.inc   | 4400 +++++++++++++++++
 target/loongarch/insns.decode                 |  811 +++
 target/loongarch/internals.h                  |   23 +
 target/loongarch/lsx_helper.c                 | 3004 +++++++++++
 target/loongarch/machine.c                    |   79 +-
 target/loongarch/meson.build                  |    1 +
 target/loongarch/translate.c                  |   55 +-
 target/loongarch/translate.h                  |    1 +
 19 files changed, 9988 insertions(+), 57 deletions(-)
 create mode 100644 target/loongarch/insn_trans/trans_lsx.c.inc
 create mode 100644 target/loongarch/lsx_helper.c

-- 
2.31.1


