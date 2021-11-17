Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA573454DCE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:21:09 +0100 (CET)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQUW-0006r9-Qv
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mnQRe-0005PE-1P
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:18:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mnQRb-0005SR-L9
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637176686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+UQl7XnIe5PKDU5XWhG1hV0XvoctWth49/WXOyYYqQ=;
 b=Izh0OS3sRbu89HZcTa8Y1Kux2FYp9LxTAW3XGtDqdl5wXhhmliMrheVoMxc1G5HGGvSoV4
 /Spw1GCmq5ubungCsoyxEBs2hUk7sTMRjfk01J3NWjv2gWje8ohURWqEf+zbVI2vOOfGz4
 H6FpRy+mG0eJj+q6aWz46bj0B1kmOo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-LgOxUsgPNX2fN2n-ud-g3g-1; Wed, 17 Nov 2021 14:18:02 -0500
X-MC-Unique: LgOxUsgPNX2fN2n-ud-g3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B44D9128C;
 Wed, 17 Nov 2021 19:18:01 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-113-228.phx2.redhat.com [10.3.113.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E5641B5C0;
 Wed, 17 Nov 2021 19:17:54 +0000 (UTC)
Subject: [PULL 1/1] vfio: Fix memory leak of hostwin
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 17 Nov 2021 12:17:54 -0700
Message-ID: <163717666134.2560806.2518245491214331461.stgit@omen>
In-Reply-To: <163717652748.2560806.10593927801828190496.stgit@omen>
References: <163717652748.2560806.10593927801828190496.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: liangpeng10@huawei.com, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peng Liang <liangpeng10@huawei.com>

hostwin is allocated and added to hostwin_list in vfio_host_win_add, but
it is only deleted from hostwin_list in vfio_host_win_del, which causes
a memory leak.  Also, freeing all elements in hostwin_list is missing in
vfio_disconnect_container.

Fix: 2e4109de8e58 ("vfio/spapr: Create DMA window dynamically (SPAPR IOMMU v2)")
CC: qemu-stable@nongnu.org
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Link: https://lore.kernel.org/r/20211117014739.1839263-1-liangpeng10@huawei.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index dd387b0d3959..080046e3f511 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -551,6 +551,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
     QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
         if (hostwin->min_iova == min_iova && hostwin->max_iova == max_iova) {
             QLIST_REMOVE(hostwin, hostwin_next);
+            g_free(hostwin);
             return 0;
         }
     }
@@ -2239,6 +2240,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
     if (QLIST_EMPTY(&container->group_list)) {
         VFIOAddressSpace *space = container->space;
         VFIOGuestIOMMU *giommu, *tmp;
+        VFIOHostDMAWindow *hostwin, *next;
 
         QLIST_REMOVE(container, next);
 
@@ -2249,6 +2251,12 @@ static void vfio_disconnect_container(VFIOGroup *group)
             g_free(giommu);
         }
 
+        QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
+                           next) {
+            QLIST_REMOVE(hostwin, hostwin_next);
+            g_free(hostwin);
+        }
+
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
         g_free(container);



