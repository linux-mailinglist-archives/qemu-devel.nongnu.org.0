Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43580563072
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:41:55 +0200 (CEST)
Received: from localhost ([::1]:34238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7D9u-000064-9r
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D2e-0001j3-5f
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39354 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D2a-0003Eh-Sk
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:23 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S2;
 Fri, 01 Jul 2022 17:34:07 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v2 00/11] Fix bugs for LoongArch virt machine
Date: Fri,  1 Jul 2022 17:33:56 +0800
Message-Id: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrW5JF48uF1DWFW8Zw48Crg_yoWkZFc_CF
 WftFWkGw1UWa45ZayUtrW8Cr98Cw48uFy3AFn2qrWfKrW7Jws8Cws8KwsI9F10gr1aqFZ8
 tr48trZ5Aw13KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

This series fix some bugs for LoongArch virt machine. Including
RTC device emulation, ECFG reg emulation, timer clear function,
and IPI device function, etc.

Xiaojuan Yang (11):
  hw/rtc/ls7a_rtc: Fix uninitialied bugs and toymatch writing function
  hw/rtc/ls7a_rtc: Fix timer call back function
  hw/rtc/ls7a_rtc: Remove unimplemented device in realized function
  hw/rtc/ls7a_rtc: Add reset function
  hw/rtc/ls7a_rtc: Fix rtc enable and disable function
  hw/rtc/ls7a_rtc: Use tm struct pointer as arguments in
    toy_time_to_val()
  hw/rtc/ls7a_rtc: Fix 'calculate' spelling errors
  target/loongarch: Fix the meaning of ECFG reg's VS field
  target/loongarch: Add lock when writing timer clear reg
  hw/intc/loongarch_ipi: Fix ipi device access of 64bits
  hw/intc/loongarch_ipi: Fix mail send and any send function

 hw/intc/loongarch_ipi.c         |  83 +++++++++++++-------
 hw/loongarch/loongson3.c        |   5 +-
 hw/rtc/ls7a_rtc.c               | 131 +++++++++++++-------------------
 include/hw/intc/loongarch_ipi.h |   7 +-
 target/loongarch/cpu.c          |   4 +
 target/loongarch/csr_helper.c   |   2 +
 6 files changed, 122 insertions(+), 110 deletions(-)

-- 
2.31.1


