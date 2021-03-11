Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302D3381EA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:51:23 +0100 (CET)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKV5O-0001je-Iz
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUzT-0003Zg-S2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUzS-0003jO-1q
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615506313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qE+G3fG1crWQF3GdwdP2EbVv2gWbZwttd4FsaHhmy1w=;
 b=SoqKLXVsw+CnOuTEn+AIaqVCywJCXP/BeKP3T8xn+D61yNRFfSPL5KjXWt4LuoKWUV5Q1C
 KVfEJySu1lRSmN6ER0cqH+W32EyQTpUrUQSGSxP3RQFB5I5YLFcK066ik+U+AsS4PVYk22
 j3MfM0410EUV6v5twMsS3ElZr90UPEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-ZG2JG3kHPqimmlXQMReHcA-1; Thu, 11 Mar 2021 18:45:08 -0500
X-MC-Unique: ZG2JG3kHPqimmlXQMReHcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D02C219057D0;
 Thu, 11 Mar 2021 23:44:39 +0000 (UTC)
Received: from gimli.home (ovpn-112-255.phx2.redhat.com [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A297A60C03;
 Thu, 11 Mar 2021 23:44:20 +0000 (UTC)
Subject: [PULL 07/10] vfio: Set the priority of the VFIO VM state change
 handler explicitly
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Mar 2021 16:44:20 -0700
Message-ID: <161550626026.21070.14769998235485704661.stgit@gimli.home>
In-Reply-To: <161550593889.21070.5662039089881992714.stgit@gimli.home>
References: <161550593889.21070.5662039089881992714.stgit@gimli.home>
User-Agent: StGit/0.21-2-g8ef5
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shenming Lu <lushenming@huawei.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shenming Lu <lushenming@huawei.com>

In the VFIO VM state change handler when stopping the VM, the _RUNNING
bit in device_state is cleared which makes the VFIO device stop, including
no longer generating interrupts. Then we can save the pending states of
all interrupts in the GIC VM state change handler (on ARM).

So we have to set the priority of the VFIO VM state change handler
explicitly (like virtio devices) to ensure it is called before the
GIC's in saving.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210310030233.1133-3-lushenming@huawei.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 003786f3cd9a..eafb778947c3 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -862,7 +862,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
                          vbasedev);
 
-    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
+    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
+                                                           vfio_vmstate_change,
                                                            vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);


