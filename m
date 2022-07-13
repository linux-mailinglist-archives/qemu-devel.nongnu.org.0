Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6911657339F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 11:58:28 +0200 (CEST)
Received: from localhost ([::1]:46256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZ8V-00047O-7j
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 05:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBZ1X-0003KD-Q8
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 05:51:15 -0400
Received: from [114.242.206.163] (port=38474 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBZ1V-0005J2-Bf
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 05:51:15 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39Bslc5iXkcbAA--.18694S2; 
 Wed, 13 Jul 2022 17:50:36 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v2 0/5] Fix LoongArch coverity error and cpu name bug
Date: Wed, 13 Jul 2022 17:50:31 +0800
Message-Id: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx39Bslc5iXkcbAA--.18694S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF18Zr1Uuw4DWFWrGF4DArb_yoWDJwc_CF
 n3A34kCw47W3WYyFZIvryYv343GF48GFn8AFWDWr47Cry5Jrn3Xw4qg3s3ur10vF4Fqrs8
 Crs2qryrA3WYkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.242.206.163 (deferred)
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Make some changes following Richard's advice based on version v1. And the
v1 patches fix some coverity errors and loongarch_cpu_class_by_name function
for LoongArch virt machine.

1. Use MAKE_64BIT_MASK(shift, len) to replace 'xxx << shift'.
2. Use ARRAY_SIZE(arrqy) to get the array size.
3. Add the assertion that 'cpu_model' resolve to a class of the
   appropriate type.

Xiaojuan Yang (5):
  target/loongarch/cpu: Fix cpu_class_by_name function
  hw/intc/loongarch_pch_pic: Fix coverity errors in update irq
  target/loongarch/cpu: Fix coverity errors about excp_names
  target/loongarch/tlb_helper: Fix coverity integer overflow error
  target/loongarch/op_helper: Fix coverity cond_at_most error

 hw/intc/loongarch_pch_pic.c   | 19 ++++++++++++-------
 target/loongarch/cpu.c        | 15 ++++++++-------
 target/loongarch/op_helper.c  |  2 +-
 target/loongarch/tlb_helper.c |  4 ++--
 4 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.31.1


