Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F963A876
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 13:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozdHh-0005OU-6z; Mon, 28 Nov 2022 07:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ozdHD-0005KM-VE; Mon, 28 Nov 2022 07:30:25 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ozdGx-00020Y-0T; Mon, 28 Nov 2022 07:30:23 -0500
Received: from localhost.localdomain (unknown [180.175.30.174])
 by APP-05 (Coremail) with SMTP id zQCowAC3v_fCqYRj_UQNAw--.18159S2;
 Mon, 28 Nov 2022 20:29:55 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 0/9] support subsets of code size reduction extension
Date: Mon, 28 Nov 2022 20:29:04 +0800
Message-Id: <20221128122913.55611-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3v_fCqYRj_UQNAw--.18159S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryDKFW5KryrWw4xWF48JFb_yoW5JrW8pr
 WrC3yakrZ8tFWxJw4ftF1DJw15Ar4rWr45Awn7Jw1kJay3ArW5Jrn7K3W3G3WxJF18WrnF
 93WUCw13u3yUJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.175.30.174]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
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

This patchset implements RISC-V Zc* extension v1.0.0.RC5.7 version instructions.

Specification:
https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specification

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v6

To test Zc* implementation, specify cpu argument with 'x-zca=true,x-zcb=true,x-zcf=true,f=true" and "x-zcd=true,d=true" (or "x-zcmp=true,x-zcmt=true" with c or d=false) to enable Zca/Zcb/Zcf and Zcd(or Zcmp,Zcmt) extension support.


This implementation can pass the basic zc tests from https://github.com/yulong-plct/zc-test

v6：
* fix base address for jump table in Patch 7
* rebase on riscv-to-apply.next

v5:
* fix exception unwind problem for cpu_ld*_code in helper of cm_jalt

v4:
* improve Zcmp suggested by Richard
* fix stateen related check for Zcmt

v3:
* update the solution for Zcf to the way of Zcd
* update Zcb to reuse gen_load/store
* use trans function instead of helper for push/pop

v2:
* add check for relationship between Zca/Zcf/Zcd with C/F/D based on related discussion in review of Zc* spec
* separate c.fld{sp}/fsd{sp} with fld{sp}/fsd{sp} before support of zcmp/zcmt

Weiwei Li (9):
  target/riscv: add cfg properties for Zc* extension
  target/riscv: add support for Zca extension
  target/riscv: add support for Zcf extension
  target/riscv: add support for Zcd extension
  target/riscv: add support for Zcb extension
  target/riscv: add support for Zcmp extension
  target/riscv: add support for Zcmt extension
  target/riscv: expose properties for Zc* extension
  disas/riscv.c: add disasm support for Zc*

 disas/riscv.c                             | 287 +++++++++++++++++++-
 target/riscv/cpu.c                        |  56 ++++
 target/riscv/cpu.h                        |  10 +
 target/riscv/cpu_bits.h                   |   7 +
 target/riscv/csr.c                        |  38 ++-
 target/riscv/helper.h                     |   3 +
 target/riscv/insn16.decode                |  63 ++++-
 target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
 target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
 target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
 target/riscv/insn_trans/trans_rvzce.c.inc | 313 ++++++++++++++++++++++
 target/riscv/machine.c                    |  19 ++
 target/riscv/meson.build                  |   3 +-
 target/riscv/translate.c                  |  15 +-
 target/riscv/zce_helper.c                 |  55 ++++
 15 files changed, 893 insertions(+), 16 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
 create mode 100644 target/riscv/zce_helper.c

-- 
2.25.1


