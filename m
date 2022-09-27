Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B18F5ED049
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 00:31:42 +0200 (CEST)
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odJ77-0000eK-93
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 18:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1odJ4g-00058S-Kk
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1odJ4d-0006Oe-OX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664317747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqizROy4T5G7gPBbSq3l0KrOthWsU+ke3X7Gin+EV9A=;
 b=H4Z/yuvPRu5QXCv+Nyv8Wv552rhcpsPmkUmuPDKq/8s473DZQO6Ey5uSsxrMn9bAuQyoKC
 ilQdh4hBcItzG8pMGvijlCKefb/9TPNRTjMbVxw4EGh1NcQPQtQ4IQno5ON3TVyB8JMa0V
 +27PG5zk2dHIfIMdh9CPScQx5fIWGvU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-m_k-4WyhOhej0YltfWvIOA-1; Tue, 27 Sep 2022 18:29:06 -0400
X-MC-Unique: m_k-4WyhOhej0YltfWvIOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF06880206D
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 22:29:05 +0000 (UTC)
Received: from [172.30.42.193] (unknown [10.22.8.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78EBA2027061;
 Tue, 27 Sep 2022 22:29:05 +0000 (UTC)
Subject: [PULL 1/2] vfio/migration: Fix incorrect initialization value for
 parameters in VFIOMigration
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com
Date: Tue, 27 Sep 2022 16:29:04 -0600
Message-ID: <166431773251.2571033.17308966326809405523.stgit@omen>
In-Reply-To: <166431760265.2571033.4930197108505513269.stgit@omen>
References: <166431760265.2571033.4930197108505513269.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

The structure VFIOMigration of a VFIODevice is allocated and initialized
in vfio_migration_init(). "device_state" and "vm_running" are initialized
to 0, indicating that VFIO device is_STOP and VM is not-running. The
initialization value is incorrect. According to the agreement, default
state of VFIO device is _RUNNING. And if a VFIO device is hot-plugged
while the VM is running, "vm_running" should be 1. This patch fixes it.

Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Link: https://lore.kernel.org/r/20220711014651.1327-1-jiangkunkun@huawei.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a6ad1f894561..3de4252111ee 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -806,6 +806,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     }
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
+    vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+    vbasedev->migration->vm_running = runstate_is_running();
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
                             info->index, "migration");



