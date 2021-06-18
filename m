Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D23ACF46
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:36:54 +0200 (CEST)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGY9-0008Hz-UA
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1luGWQ-0005po-2t
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:35:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1luGWN-0004Ni-BI
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624030502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4uqYtYkQcuUFVLSkepnppzeqiteFwmP3l09VgQcC/94=;
 b=aTT4S3cnNW6SU1tWSUfh7XwXe+fukb/Cyvc8jpc6rxynNS0idPYSNSaSVqeS3gnQYRtF8W
 4bn5lGg25v0P6UPa+ebDropHUVLArof+wNCjgNmae5iyTdu9E3cxDLXN4Fn2HEuOpr85ke
 bOFZA6bfEpiA195SCwn+JELcisESQeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-c0tdYkoVONSPWl-oT95VIA-1; Fri, 18 Jun 2021 11:35:01 -0400
X-MC-Unique: c0tdYkoVONSPWl-oT95VIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 285DC19057A0;
 Fri, 18 Jun 2021 15:35:00 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-112-106.phx2.redhat.com [10.3.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED3C55C225;
 Fri, 18 Jun 2021 15:34:59 +0000 (UTC)
Subject: [PULL 2/3] vfio: Fix unregister SaveVMHandler in
 vfio_migration_finalize
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jun 2021 09:34:59 -0600
Message-ID: <162403049979.1793226.9917806596521410205.stgit@omen>
In-Reply-To: <162403041204.1793226.16018359908572247606.stgit@omen>
References: <162403041204.1793226.16018359908572247606.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: alex.williamson@redhat.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 Qixin Gan <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kunkun Jiang <jiangkunkun@huawei.com>

In the vfio_migration_init(), the SaveVMHandler is registered for
VFIO device. But it lacks the operation of 'unregister'. It will
lead to 'Segmentation fault (core dumped)' in
qemu_savevm_state_setup(), if performing live migration after a
VFIO device is hot deleted.

Fixes: 7c2f5f75f94 (vfio: Register SaveVMHandlers for VFIO device)
Reported-by: Qixin Gan <ganqixin@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Message-Id: <20210527123101.289-1-jiangkunkun@huawei.com>
Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 201642d75e6b..ef397ebe6c09 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -892,6 +892,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
 
         remove_migration_state_change_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
+        unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
     }
 



