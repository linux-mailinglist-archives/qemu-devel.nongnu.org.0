Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11652CF26F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 17:56:38 +0100 (CET)
Received: from localhost ([::1]:58660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klENp-000835-Rr
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 11:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1klEMU-0006UX-A2
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1klEMN-0001sz-TA
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607100903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFzrWi1KSGeoMojfLT0qpp9LHnIy2PJoo8pvX0jeD0o=;
 b=ASvxpYGVYTksZM6KIAXOascwVuGw3O60652fHowobx1F/Ju3dQ0nwOviDdgRgi6ZFQjvSi
 oN6G2yxc+TKrBFuYmxVFG3yky3f9Jj1Td+2tzJ8NUj4U5kBhNT/o3Grj72DqHg4AGR1H9Y
 kSnpNKl3RK2ymqyAWuWs3+pJ9Ogr7To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-z_FT5ntGOtGSUP4aLv-z3w-1; Fri, 04 Dec 2020 11:54:00 -0500
X-MC-Unique: z_FT5ntGOtGSUP4aLv-z3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF862BBEE1;
 Fri,  4 Dec 2020 16:53:59 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-216.rdu2.redhat.com
 [10.10.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 122B660C04;
 Fri,  4 Dec 2020 16:53:57 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] virtio-blk: Acquire context while switching them on
 dataplane start
Date: Fri,  4 Dec 2020 17:53:46 +0100
Message-Id: <20201204165347.73542-2-slp@redhat.com>
In-Reply-To: <20201204165347.73542-1-slp@redhat.com>
References: <20201204165347.73542-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sergio Lopez <slp@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On dataplane start, acquire the new AIO context before calling
'blk_set_aio_context', releasing it immediately afterwards. This
prevents reaching the AIO context attach/detach notifier functions
without having acquired it first.

It was also the only place where 'blk_set_aio_context' was called with
an unprotected AIO context.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 37499c5564..034e43cb1f 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -214,7 +214,9 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     vblk->dataplane_started = true;
     trace_virtio_blk_data_plane_start(s);
 
+    aio_context_acquire(s->ctx);
     r = blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err);
+    aio_context_release(s->ctx);
     if (r < 0) {
         error_report_err(local_err);
         goto fail_guest_notifiers;
-- 
2.26.2


