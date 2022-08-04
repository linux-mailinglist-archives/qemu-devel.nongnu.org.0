Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E4E589C8F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:25:52 +0200 (CEST)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJarH-0006dJ-Bw
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJaUl-00009V-2z
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:02:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52744 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJaUf-0008AJ-VN
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:02:34 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axis1Vw+tiTugFAA--.19495S2; 
 Thu, 04 Aug 2022 21:02:13 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 0/5] Fix gdb bugs and update gdb-xml
Date: Thu,  4 Aug 2022 21:02:08 +0800
Message-Id: <20220804130213.1364164-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axis1Vw+tiTugFAA--.19495S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFy5uFyrAw1rAr4DWw4Durg_yoWDWFg_WF
 WfJFyUKr48W3WUXa4Yvr98W345GF48GFnIkFyDJF4xWFnxXr13Jr4jga15ZFy2qrWUXrnx
 ZrZrtr1rAr15JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,All

This series fiex LoongArch GDB get the wrong pc, because the xml missing
the register orig_a0, and update loongarch gdb-xml to match GDB[1]

[1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch

Please review!

Thanks.
Song Gao

Song Gao (5):
  target/loongarch: Fix GDB get the wrong pc
  target/loongarch: add gdb_arch_name()
  target/loongarch: update loongarch-base64.xml
  target/loongarch: Update loongarch-fpu.xml
  target/loongarch: Update gdb_set_fpu() and gdb_get_fpu()

 configs/targets/loongarch64-softmmu.mak |  2 +-
 gdb-xml/loongarch-base64.xml            | 13 +++---
 gdb-xml/loongarch-fpu.xml               | 50 ++++++++++++++++++++++
 gdb-xml/loongarch-fpu64.xml             | 57 -------------------------
 target/loongarch/cpu.c                  |  8 +++-
 target/loongarch/gdbstub.c              | 32 +++++++++-----
 6 files changed, 87 insertions(+), 75 deletions(-)
 create mode 100644 gdb-xml/loongarch-fpu.xml
 delete mode 100644 gdb-xml/loongarch-fpu64.xml

-- 
2.31.1


