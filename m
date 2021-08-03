Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DE3DE8A0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:44:35 +0200 (CEST)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAq2M-0005pZ-Da
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mAq1O-0004WE-Br
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:43:34 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mAq1K-0002PE-Op
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:43:33 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Gf7Yy5KDcz81tg;
 Tue,  3 Aug 2021 16:38:30 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:43:20 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 16:43:20 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: [Question] Reduce the msix_load cost for VFIO device
Message-ID: <61e3fdd1-13a1-0675-b5c8-f7bfe3e6a042@huawei.com>
Date: Tue, 3 Aug 2021 16:43:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

We found that the msix_load() will cost 40~50ms if the VF has 60+ interrupts,
the following code cost too much for each interrupt:

msix_load:
  for (vector = 0; vector < 60; vector++)
    msix_handle_mask_update
      vfio_msix_vector_do_use
        vfio_add_kvm_msi_virq
          kvm_irqchip_add_msi_route
            kvm_irqchip_commit_routes <-- cost 0.8ms each time

In irq remapping mode, the VF interrupts are not routed through KVM irqchip
in fact, so maybe we can reduce this cost by "x-no-kvm-msix=ture", right?
Are there any risks if we do in this way ?

Looking forward to your reply, thanks.

