Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CC2C1277
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 18:59:14 +0100 (CET)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khG7N-0006hR-6v
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 12:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khG5I-0005Yn-P9
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khG5H-00053Q-2q
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606154222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgaQvj4qf+ONQu7Fv0tJEto305ADMFH4fl6CW3nT8A0=;
 b=EgPJ4TJsEh0lRLUbck9ETbJsuHyIcIF0e3UVs6rEfZvZmdcfzl4b2CM9sDMNEl+VwiQDOz
 ZjhTOWlT6CdVKNoseX/UpqqnQg55Nb6N5IHOtBxTihwMQ9u235Ma6rcZf7uS0OZZFGu8WO
 CZRoYjV287GMtTKgnTw/+PYIGafeWtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-XSXOi7NmN1O_PU-7lYzGmA-1; Mon, 23 Nov 2020 12:57:00 -0500
X-MC-Unique: XSXOi7NmN1O_PU-7lYzGmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 995F71842151
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 17:56:59 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5047860875;
 Mon, 23 Nov 2020 17:56:56 +0000 (UTC)
Subject: [PULL 1/2] vfio: Make migration support experimental
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Nov 2020 10:56:55 -0700
Message-ID: <160615421579.26810.9866622962349309664.stgit@gimli.home>
In-Reply-To: <160615410107.26810.2586812803373008210.stgit@gimli.home>
References: <160615410107.26810.2586812803373008210.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for migration of vfio devices is still in flux.  Developers
are attempting to add support for new devices and new architectures,
but none are yet readily available for validation.  We have concerns
whether we're transferring device resources at the right point in the
migration, whether we're guaranteeing that updates during pre-copy are
migrated, and whether we can provide bit-stream compatibility should
any of this change.  Even the question of whether devices should
participate in dirty page tracking during pre-copy seems contentious.
In short, migration support has not had enough soak time and it feels
premature to mark it as supported.

Create an experimental option such that we can continue to develop.

[Retaining previous acks/reviews for a previously identical code
 change with different specifics in the commit log.]

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c           |    2 +-
 hw/vfio/pci.c                 |    2 ++
 include/hw/vfio/vfio-common.h |    1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 55261562d4f3..00daa50ed818 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -882,7 +882,7 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
     Error *local_err = NULL;
     int ret = -ENOTSUP;
 
-    if (!container->dirty_pages_supported) {
+    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
         goto add_blocker;
     }
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 58c0ce8971e3..1349b900e513 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3194,6 +3194,8 @@ static Property vfio_pci_dev_properties[] = {
                     VFIO_FEATURE_ENABLE_REQ_BIT, true),
     DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
                     VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
+    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
+                     vbasedev.enable_migration, false),
     DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
     DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
                      vbasedev.ram_block_discard_allowed, false),
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index baeb4dcff102..2119872c8af1 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -123,6 +123,7 @@ typedef struct VFIODevice {
     bool needs_reset;
     bool no_mmap;
     bool ram_block_discard_allowed;
+    bool enable_migration;
     VFIODeviceOps *ops;
     unsigned int num_irqs;
     unsigned int num_regions;


