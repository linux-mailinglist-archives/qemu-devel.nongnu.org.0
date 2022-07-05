Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF99566368
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 08:51:46 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8cPR-0003hI-Fk
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 02:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o8cN9-0002LK-Rj
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 02:49:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56860 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o8cN2-00056O-3j
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 02:49:23 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax+eDd3sNi_PcJAA--.31000S2; 
 Tue, 05 Jul 2022 14:49:01 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v3 0/2] Fix IPI device emulation for LoongArch machine
Date: Tue,  5 Jul 2022 14:48:59 +0800
Message-Id: <20220705064901.2353349-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax+eDd3sNi_PcJAA--.31000S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw1fJF4ftFy5CF1UXr4Dtwb_yoWxCFg_XF
 WSyF97Gw47WF1UAayUZr1UA34rCa1xAF43AFyDXr43Gr17Xrn8Xrn5t3yYvF1vqa4rX3s8
 Gr4rtr95AryavjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

Fix LoongArch IPI device emulation follwing Richard's advice based on v2 version:
1. Change ipi64_ops' valid.min_access_size to 8, as it only support 8 bytes writing.
2. Remove 'UL' prefix in send_ipi_data().
3. Add a condition to skip the method of geting write mask in send_ipi_data(), as the mask is 0 at most time.

Xiaojuan Yang (2):
  hw/intc/loongarch_ipi: Fix ipi device access of 64bits
  hw/intc/loongarch_ipi: Fix mail send and any send function

 hw/intc/loongarch_ipi.c         | 92 ++++++++++++++++++++++-----------
 hw/loongarch/loongson3.c        |  5 +-
 include/hw/intc/loongarch_ipi.h |  7 +--
 3 files changed, 70 insertions(+), 34 deletions(-)

-- 
2.31.1


