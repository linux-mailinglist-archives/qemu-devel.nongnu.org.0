Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A069A20B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:03:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnGT-0001u2-RM; Thu, 16 Feb 2023 18:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGR-0001sf-4a
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGP-0005VA-DN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676588524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=857s7AC1o9Ddl3Egm9bSzaKXqSlKe9oyjZdSnctUAbs=;
 b=KwOCIVrfKp8+wdjoeqdTLVCWFINZfcjCnHhl4saBsggYRFO8g2yOiYQBwAJ/6avPm75Y8N
 SbxvuhM2GfyCmAF3w0NI13BJ/JHThOW4sB1rB1GRpHMD3GGggJSmKDYvz5Etpan7429HMd
 7qfg1DnhEAabBIjvxoQmCcYYQ7quo/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-pENo0osJPUKng0WJS7S7Jw-1; Thu, 16 Feb 2023 18:02:01 -0500
X-MC-Unique: pENo0osJPUKng0WJS7S7Jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2AD529324AA;
 Thu, 16 Feb 2023 23:02:00 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 923C82166B30;
 Thu, 16 Feb 2023 23:02:00 +0000 (UTC)
Subject: [PULL 02/12] vfio/migration: Fix NULL pointer dereference bug
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com
Date: Thu, 16 Feb 2023 16:02:00 -0700
Message-ID: <167658852016.932837.13243210499133474787.stgit@omen>
In-Reply-To: <167658846945.932837.1420176491103357684.stgit@omen>
References: <167658846945.932837.1420176491103357684.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Avihai Horon <avihaih@nvidia.com>

As part of its error flow, vfio_vmstate_change() accesses
MigrationState->to_dst_file without any checks. This can cause a NULL
pointer dereference if the error flow is taken and
MigrationState->to_dst_file is not set.

For example, this can happen if VM is started or stopped not during
migration and vfio_vmstate_change() error flow is taken, as
MigrationState->to_dst_file is not set at that time.

Fix it by checking that MigrationState->to_dst_file is set before using
it.

Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Link: https://lore.kernel.org/r/20230216143630.25610-3-avihaih@nvidia.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 83d2d44080a6..65f3f3bef795 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -741,7 +741,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          */
         error_report("%s: Failed to set device state 0x%x", vbasedev->name,
                      (migration->device_state & mask) | value);
-        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        if (migrate_get_current()->to_dst_file) {
+            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        }
     }
     vbasedev->migration->vm_running = running;
     trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),



