Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98158A50D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:37:33 +0200 (CEST)
Received: from localhost ([::1]:35350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJo9U-0004PZ-9G
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJo7Z-0000GE-Bc
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49394 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJo7W-00027Z-SS
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSs37j+xiQD4HAA--.15649S2; 
 Fri, 05 Aug 2022 11:35:24 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 v2 0/5] Fix gdb bugs and update gdb-xml 
Date: Fri,  5 Aug 2022 11:35:18 +0800
Message-Id: <20220805033523.1416837-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxSs37j+xiQD4HAA--.15649S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtFy5uFyDtrWfKryxtr4Dtwb_yoW8Jry7pr
 W3ur13Jw48KrZrXr9xXa4YqrZ8Xr4xGr4293Waqw1xCrW2vryUZr48J397WFW3Aa4rJryj
 vFy0yw1UWF1UZrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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


V2:
    - Update orig_a0 value to 0;
    - Update fcc type to uint64;
    - Share write_fcc()/read_fcc();
    - Update patch2 commit message.

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
 linux-user/loongarch64/signal.c         | 24 +----------
 target/loongarch/cpu.c                  |  8 +++-
 target/loongarch/gdbstub.c              | 43 ++++++++++++++-----
 target/loongarch/internals.h            |  3 ++
 8 files changed, 103 insertions(+), 97 deletions(-)
 create mode 100644 gdb-xml/loongarch-fpu.xml
 delete mode 100644 gdb-xml/loongarch-fpu64.xml

-- 
2.31.1


