Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45CD6567C9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 08:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA4Gc-0004kv-8u; Tue, 27 Dec 2022 02:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pA4GM-0004hA-5h
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 02:20:38 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pA4GH-00078n-TQ
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 02:20:36 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Nh5cf1M1QzJqhv;
 Tue, 27 Dec 2022 15:19:14 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 27 Dec 2022 15:20:18 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <philmd@linaro.org>
CC: <cohuck@redhat.com>, <sgarzare@redhat.com>, <pbonzini@redhat.com>,
 <arei.gonglei@huawei.com>, <yechuan@huawei.com>, <huangzhichao@huawei.com>,
 <qemu-devel@nongnu.org>, Longpeng <longpeng2@huawei.com>
Subject: [PATCH v3 0/3] two optimizations to speed up the start time
Date: Tue, 27 Dec 2022 15:20:12 +0800
Message-ID: <20221227072015.3134-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

Changes v3->v2:
 - cleanup the code [Philippe]

Changes v2->v1:
 Patch-1:
  - remove vq_init_count [Jason]
 Patch-2:
  - new added. [Jason]

v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg922499.html

Longpeng (Mike) (3):
  vhost: simplify vhost_dev_enable_notifiers
  vhost: configure all host notifiers in a single MR transaction
  vdpa: commit all host notifier MRs in a single MR transaction

 hw/virtio/vhost-vdpa.c | 25 ++++++++++++++++++------
 hw/virtio/vhost.c      | 44 +++++++++++++++++++++++++++---------------
 2 files changed, 47 insertions(+), 22 deletions(-)

-- 
2.23.0


