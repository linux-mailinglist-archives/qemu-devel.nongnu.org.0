Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D432E354F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 10:08:34 +0100 (CET)
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktoW1-0006Uf-GJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 04:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktoT5-0002cJ-7x; Mon, 28 Dec 2020 04:05:31 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktoSz-0002Xl-NC; Mon, 28 Dec 2020 04:05:31 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D4BSZ2zdSzj0HC;
 Mon, 28 Dec 2020 17:04:30 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 28 Dec 2020 17:05:09 +0800
From: g00517791 <gaojinhao@huawei.com>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/3] vmstate: Fix memory leak in vmstate_handle_alloc()
Date: Mon, 28 Dec 2020 17:00:53 +0800
Message-ID: <20201228090053.346-4-gaojinhao@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.2
In-Reply-To: <20201228090053.346-1-gaojinhao@huawei.com>
References: <20201228090053.346-1-gaojinhao@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.50]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=gaojinhao@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan
 Berger <stefanb@linux.vnet.ibm.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, wanghaibin.wang@huawei.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jinhao Gao <gaojinhao@huawei.com>

Some memory allocated for fields having a flag of VMS_ALLOC in SaveState
may not free before VM load vmsd in migration. So we pre-free memory before
allocation in vmstate_handle_alloc() to avoid memleaks.

Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 migration/vmstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/vmstate.c b/migration/vmstate.c
index e9d2aef66b..873f76739f 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -70,6 +70,7 @@ static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
         gsize size = vmstate_size(opaque, field);
         size *= vmstate_n_elems(opaque, field);
         if (size) {
+            g_free(*(void **)ptr);
             *(void **)ptr = g_malloc(size);
         }
     }
-- 
2.23.0


