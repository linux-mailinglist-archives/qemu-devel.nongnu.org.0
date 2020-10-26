Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BAF2997D4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 21:19:33 +0100 (CET)
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX8xn-0006fO-7U
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 16:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kX8IX-0006sr-Lf
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 15:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kX8IU-0002Sp-QR
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 15:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603741010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pTJYrQcWoNUCvyzp4rJ9qbcRwtZ2fTZovZ/x+ugX04=;
 b=VAwnumMqMZwByWBndshkhHcT05MBLA4Z9PF9vhp5LfhaI+8wyCaphzDLKgPatnXIryHm/H
 rb2NCOyFDut6PKN9K6/0DPFhgYIm0WbhDu2iMrIBGB2EzU9AW4r2DlfjaNLRDSk0lxhOIV
 /l4IXg7IDoGS5nwiw4iS7BWkK+n3Ns4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-pntaj_I3NNCUatVH24OAHg-1; Mon, 26 Oct 2020 15:36:48 -0400
X-MC-Unique: pntaj_I3NNCUatVH24OAHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED0B8100746A;
 Mon, 26 Oct 2020 19:36:46 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91DCB5C1BB;
 Mon, 26 Oct 2020 19:36:43 +0000 (UTC)
Subject: [PULL 31/32] hw/vfio: Use lock guard macros
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Oct 2020 13:36:43 -0600
Message-ID: <160374100322.22414.18169895441559653969.stgit@gimli.home>
In-Reply-To: <160374054442.22414.10832953989449611268.stgit@gimli.home>
References: <160374054442.22414.10832953989449611268.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Amey Narkhede <ameynarkhede03@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amey Narkhede <ameynarkhede03@gmail.com>

Use qemu LOCK_GUARD macros in hw/vfio.
Saves manual unlock calls

Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/platform.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 869ed2c39dcd..cc3f66f7e44c 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -166,7 +166,7 @@ static void vfio_intp_mmap_enable(void *opaque)
     VFIOINTp *tmp;
     VFIOPlatformDevice *vdev = (VFIOPlatformDevice *)opaque;
 
-    qemu_mutex_lock(&vdev->intp_mutex);
+    QEMU_LOCK_GUARD(&vdev->intp_mutex);
     QLIST_FOREACH(tmp, &vdev->intp_list, next) {
         if (tmp->state == VFIO_IRQ_ACTIVE) {
             trace_vfio_platform_intp_mmap_enable(tmp->pin);
@@ -174,12 +174,10 @@ static void vfio_intp_mmap_enable(void *opaque)
             timer_mod(vdev->mmap_timer,
                       qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
                           vdev->mmap_timeout);
-            qemu_mutex_unlock(&vdev->intp_mutex);
             return;
         }
     }
     vfio_mmap_set_enabled(vdev, true);
-    qemu_mutex_unlock(&vdev->intp_mutex);
 }
 
 /**
@@ -289,7 +287,7 @@ static void vfio_platform_eoi(VFIODevice *vbasedev)
     VFIOPlatformDevice *vdev =
         container_of(vbasedev, VFIOPlatformDevice, vbasedev);
 
-    qemu_mutex_lock(&vdev->intp_mutex);
+    QEMU_LOCK_GUARD(&vdev->intp_mutex);
     QLIST_FOREACH(intp, &vdev->intp_list, next) {
         if (intp->state == VFIO_IRQ_ACTIVE) {
             trace_vfio_platform_eoi(intp->pin,
@@ -314,7 +312,6 @@ static void vfio_platform_eoi(VFIODevice *vbasedev)
         vfio_intp_inject_pending_lockheld(intp);
         QSIMPLEQ_REMOVE_HEAD(&vdev->pending_intp_queue, pqnext);
     }
-    qemu_mutex_unlock(&vdev->intp_mutex);
 }
 
 /**


