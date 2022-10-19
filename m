Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D1603EDA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 11:21:56 +0200 (CEST)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol5Gs-00010x-TE
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 05:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ol5B8-00061K-Fb
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:15:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49416 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ol5B5-0000SC-GD
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:15:58 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxOdhCwE9jgLIAAA--.1773S3;
 Wed, 19 Oct 2022 17:15:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxLuJCwE9jcToBAA--.5106S2; 
 Wed, 19 Oct 2022 17:15:46 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn,
	f4bug@amsat.org
Subject: [PATCH v6 0/1] Fix LoongArch extioi coreisr accessing
Date: Wed, 19 Oct 2022 17:15:45 +0800
Message-Id: <20221019091546.2148418-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxLuJCwE9jcToBAA--.5106S2
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7try5uw1rArWUKry3Jr4rAFb_yoW8uryUpr
 Wa9FZ3Kr4UtrZxtasxC345GF1rZw4xJay7X347t3sY9F4Dur1jgFy0qFyru347G3s3J3W2
 qF4qy34DW3W5Z37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

When cpu read or write extioi COREISR reg, it should access
the reg belonged to itself, so the cpu index of 's->coreisr'
is current cpu number. Using MemTxAttrs' requester_id to get 
the cpu index.

Changes for v6:
Only using MemTxAttrs' requester_id to get the cpu index
in LoongArch extioi access function. we do not based on 
the 'MemTxAttrs requester_type patch' so far, and when that
patch merged we will apply it quickly.

Changes for v5: 
These changes are following Philippe Mathieu-Daude's advice.
1. Add trace_bad_read/write function when MemTxAttrs type is
   not MTRT_CPU in extioi_read/write().
2. Separate 'remove unused extioi system memory region' to a
   single patch.

Changes for v4: 
Add 'reviewed-by' tag in fixing ipi patch, and other changes
are the same as v3. 
1. Remove the memmap table patch in this series, it
   will apply until we have more than one machinestate.
2. Using MemTxAttrs' requester_type and requester_id
   to get current cpu index in loongarch extioi regs
   emulation.
   This patch based on: 
   20220927141504.3886314-1-alex.bennee@linaro.org
3. Rewrite the commit message of fixing ipi patch, and 
   add reviewed by tag in the patch.

Changes for v3: 
1. Remove the memmap table patch in this series, it
   will apply until we have more than one machinestate.
2. Using MemTxAttrs' requester_type and requester_id
   to get current cpu index in loongarch extioi regs
   emulation.
   This patch based on: 
   20220927141504.3886314-1-alex.bennee@linaro.org
3. Rewrite the commit message of fixing ipi patch, and 
   this patch has been reviewed.

Changes for v2: 
1. Adjust the position of 'PLATFORM' element in memmap table

Changes for v1: 
1. Add memmap table for LoongArch virt machine
2. Fix LoongArch extioi function
3. Fix LoongArch ipi device emulation

Xiaojuan Yang (1):
  hw/intc: Fix LoongArch extioi coreisr accessing

 hw/intc/loongarch_extioi.c      | 42 ++++++++++++++++++---------------
 hw/intc/trace-events            |  3 +--
 target/loongarch/iocsr_helper.c | 18 +++++++-------
 3 files changed, 34 insertions(+), 29 deletions(-)

-- 
2.31.1


