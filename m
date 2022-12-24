Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A1655934
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zik-0006Ko-8t; Sat, 24 Dec 2022 03:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zi5-00068D-Me
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zhy-0000G0-Rt
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:47 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxtfBitaZjBkkIAA--.18286S3;
 Sat, 24 Dec 2022 16:16:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S2; 
 Sat, 24 Dec 2022 16:16:33 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 00/43] Add LoongArch LSX instructions
Date: Sat, 24 Dec 2022 16:15:50 +0800
Message-Id: <20221224081633.4185445-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWF1xCr48Ar1kWry3tF4rGrg_yoW5Kw18pr
 W7Zr1DtFW8JrZ7Xr1kXasxZrnIqr1xG39Fv3Wft348uw43AryxZFn7t3sFgFyUXayUCry2
 qFyIkwn8XF45X37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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

Hi, Merry Christmas!

This series adds LoongArch LSX instructions, Since the LoongArch
Vol2 is not open, So we use 'RFC' title. 
 
About Test:
The new-abi gcc which support LSX is also not open, We use the old-abi gcc [1] build 
test code[2](tests/tcg/loongarch/vec/test_XXX*.c).

[1]:http://ftp.loongnix.cn/toolchain/gcc/release/loongarch/gcc8/loongson-gnu-toolchain-8.3-x86_64-loongarch64-linux-gnu-rc1.1.tar.xz 
[2]:https://github.com/loongson/qemu/commit/a4f03d68c0c60fcc5bf62114fd1f7a6a7cdf1070

e.g
   build:
   loongarch64-linux-gnu-gcc -mlsx tests/tcg/loongarch64/vec/test_bit.c -o test_bit
   run:
   ./build/qemu-loongarch64  test_bit   (qemu branch [2]: tcg-old-abi-support-lsx)

Thanks.
SOng Gao

Song Gao (43):
  target/loongarch: Add vector data type vec_t
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

 fpu/softfloat.c                             |   55 +
 include/fpu/softfloat.h                     |   27 +
 linux-user/loongarch64/signal.c             |    4 +-
 target/loongarch/cpu.c                      |    5 +-
 target/loongarch/cpu.h                      |   20 +-
 target/loongarch/disas.c                    |  911 ++++
 target/loongarch/fpu_helper.c               |    2 +-
 target/loongarch/gdbstub.c                  |    4 +-
 target/loongarch/helper.h                   |  748 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  960 ++++
 target/loongarch/insns.decode               |  811 +++
 target/loongarch/internals.h                |    1 +
 target/loongarch/lsx_helper.c               | 5375 +++++++++++++++++++
 target/loongarch/machine.c                  |    2 +-
 target/loongarch/meson.build                |    1 +
 target/loongarch/translate.c                |   11 +
 16 files changed, 8929 insertions(+), 8 deletions(-)
 create mode 100644 target/loongarch/insn_trans/trans_lsx.c.inc
 create mode 100644 target/loongarch/lsx_helper.c

-- 
2.31.1


