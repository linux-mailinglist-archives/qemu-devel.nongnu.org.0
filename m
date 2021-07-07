Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2503BE966
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:08:17 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18Do-0001My-A2
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m18Cs-00006N-VT
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m18Cr-0000Fb-D4
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625666836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMezUTTPSX4w5qcjxsrEt6Hs9LLW9K2Cg4QrfqgU+Kk=;
 b=M0c++o2kddbYHSwPqA3ePMLr9HjBJn5u6dvQPsC/1ZJWTP7QWCLSlno6enT6RyTMpWOE7q
 3BVVplYU2qyC4UPIC+2jbbdx+59uwn/95mQ4782+JnLw56m2pzKiq3TpzIq8XqzLKy6FbA
 IMzFxhcTgrHTFRmE4tS8boJcr8FvU58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-p0ZKX0OPNGir7uB9MR77Uw-1; Wed, 07 Jul 2021 10:07:15 -0400
X-MC-Unique: p0ZKX0OPNGir7uB9MR77Uw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31663107B2A5;
 Wed,  7 Jul 2021 14:07:14 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4F725D9F0;
 Wed,  7 Jul 2021 14:07:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] migration/postcopy-ram: define type for "struct
 PostcopyNotifyData"
Date: Wed,  7 Jul 2021 16:06:54 +0200
Message-Id: <20210707140655.30982-2-david@redhat.com>
In-Reply-To: <20210707140655.30982-1-david@redhat.com>
References: <20210707140655.30982-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Wei Wang <wei.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's define a proper type, just as we do for PrecopyNotifyData already.

Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/vhost-user.c   | 2 +-
 migration/postcopy-ram.c | 2 +-
 migration/postcopy-ram.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 1ac4a2ebec..42dad711bf 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1827,9 +1827,9 @@ static int vhost_user_postcopy_end(struct vhost_dev *dev, Error **errp)
 static int vhost_user_postcopy_notifier(NotifierWithReturn *notifier,
                                         void *opaque)
 {
-    struct PostcopyNotifyData *pnd = opaque;
     struct vhost_user *u = container_of(notifier, struct vhost_user,
                                          postcopy_notifier);
+    PostcopyNotifyData *pnd = opaque;
     struct vhost_dev *dev = u->dev;
 
     switch (pnd->reason) {
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 2e9697bdd2..ee4e1c7cf5 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -69,7 +69,7 @@ void postcopy_remove_notifier(NotifierWithReturn *n)
 
 int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
 {
-    struct PostcopyNotifyData pnd;
+    PostcopyNotifyData pnd;
     pnd.reason = reason;
     pnd.errp = errp;
 
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6d2b3cf124..01829c3562 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -125,10 +125,10 @@ enum PostcopyNotifyReason {
     POSTCOPY_NOTIFY_INBOUND_END,
 };
 
-struct PostcopyNotifyData {
+typedef struct PostcopyNotifyData {
     enum PostcopyNotifyReason reason;
     Error **errp;
-};
+} PostcopyNotifyData;
 
 void postcopy_add_notifier(NotifierWithReturn *nn);
 void postcopy_remove_notifier(NotifierWithReturn *n);
-- 
2.31.1


