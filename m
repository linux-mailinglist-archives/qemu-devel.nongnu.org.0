Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E96CB4B1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:14:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzfZ-0007BI-LL; Mon, 27 Mar 2023 23:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfW-0007Ab-O1
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:42 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfU-0000LB-77
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:42 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxJIS4WSJkOdoSAA--.28994S3;
 Tue, 28 Mar 2023 11:06:32 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S2; 
 Tue, 28 Mar 2023 11:06:32 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 00/44] Add LoongArch LSX instructions
Date: Tue, 28 Mar 2023 11:05:47 +0800
Message-Id: <20230328030631.3117129-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJFWfZrW3Xw1kur4kZrWkJFb_yoWrJr15pr
 W7Zr1DtFW8XrZ7XF1kXa9xZr9Iqr18G3y2v3Z3t348uw43Ar97ZF1kt39FgFyUXayUCry2
 qFy0kwn8XF45X37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x
 0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

This series adds LoongArch LSX instructions, Since the LoongArch
Vol2 is not open, So we use 'RFC' title.

About Test:
V2 we use RISU test the LoongArch LSX instructions.
No problems have been found so far.

QEMU:
    https://github.com/loongson/qemu/tree/tcg-old-abi-support-lsx
RISU:
    https://github.com/loongson/risu/tree/loongarch-suport-lsx

V2:
  - Use gvec;
  - Fix instructions bugs;
  - Add set_fpr()/get_fpr() replace to cpu_fpr.

Thanks.
Song Gao

Song Gao (44):
  target/loongarch: Add LSX data type VReg
  target/loongarch: CPUCFG support LSX
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

 fpu/softfloat.c                               |   55 +
 include/fpu/softfloat.h                       |   27 +
 linux-user/loongarch64/signal.c               |    4 +-
 target/loongarch/cpu.c                        |    5 +-
 target/loongarch/cpu.h                        |   37 +-
 target/loongarch/disas.c                      |  911 ++++
 target/loongarch/fpu_helper.c                 |    2 +-
 target/loongarch/gdbstub.c                    |    4 +-
 target/loongarch/helper.h                     |  593 +++
 .../loongarch/insn_trans/trans_farith.c.inc   |   72 +-
 target/loongarch/insn_trans/trans_fcmp.c.inc  |   12 +-
 .../loongarch/insn_trans/trans_fmemory.c.inc  |   37 +-
 target/loongarch/insn_trans/trans_fmov.c.inc  |   31 +-
 target/loongarch/insn_trans/trans_lsx.c.inc   | 3724 +++++++++++++++++
 target/loongarch/insns.decode                 |  811 ++++
 target/loongarch/internals.h                  |    1 +
 target/loongarch/lsx_helper.c                 | 3553 ++++++++++++++++
 target/loongarch/machine.c                    |   34 +-
 target/loongarch/meson.build                  |    1 +
 target/loongarch/translate.c                  |   38 +-
 20 files changed, 9901 insertions(+), 51 deletions(-)
 create mode 100644 target/loongarch/insn_trans/trans_lsx.c.inc
 create mode 100644 target/loongarch/lsx_helper.c

-- 
2.31.1


