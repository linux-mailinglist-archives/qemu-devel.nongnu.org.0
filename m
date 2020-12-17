Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACE02DD3D2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:12:10 +0100 (CET)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuwr-0004uY-3D
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpumC-0004N9-Kr
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:01:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpum1-0007tO-Lq
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608217255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VK6nSYcyxlQ99/4gk2RQCa/LpwqjxsuqtL5MgNzEcLI=;
 b=PBQ/OmdzRH2didGMWldSe7cveQwfqyw7MmrvZztikvxgHIFliPPceI6lQGCY7ewuqaBBEg
 hSguRvC9/mFPYMT97HRJjARnh1hqsa25ht8YZsDis4pXoqvHfPMCp/9GyH3CmUUyK1FrID
 i23hdhBVJ4i+cWg07WuraJeP3ALmMFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-f2gNOmDuNaiJvpewevI7ug-1; Thu, 17 Dec 2020 10:00:53 -0500
X-MC-Unique: f2gNOmDuNaiJvpewevI7ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8D54107ACF6;
 Thu, 17 Dec 2020 15:00:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00EA55D9D5;
 Thu, 17 Dec 2020 15:00:50 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] event_notifier: handle initialization failure better
Date: Thu, 17 Dec 2020 17:00:40 +0200
Message-Id: <20201217150040.906961-4-mlevitsk@redhat.com>
In-Reply-To: <20201217150040.906961-1-mlevitsk@redhat.com>
References: <20201217150040.906961-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 'initialized' field and use it to avoid touching event notifiers which are
either not initialized or if their initialization failed.

This is somewhat a hack, but it seems the less intrusive way to make
virtio code deal with event notifiers that failed initialization.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 include/qemu/event_notifier.h |  1 +
 util/event_notifier-posix.c   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/qemu/event_notifier.h b/include/qemu/event_notifier.h
index 3380b662f3..b79add035d 100644
--- a/include/qemu/event_notifier.h
+++ b/include/qemu/event_notifier.h
@@ -24,6 +24,7 @@ struct EventNotifier {
 #else
     int rfd;
     int wfd;
+    bool initialized;
 #endif
 };
 
diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 00d93204f9..5b2110e861 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -29,6 +29,7 @@ void event_notifier_init_fd(EventNotifier *e, int fd)
 {
     e->rfd = fd;
     e->wfd = fd;
+    e->initialized = true;
 }
 #endif
 
@@ -68,6 +69,7 @@ int event_notifier_init(EventNotifier *e, int active)
     if (active) {
         event_notifier_set(e);
     }
+    e->initialized = true;
     return 0;
 
 fail:
@@ -78,12 +80,18 @@ fail:
 
 void event_notifier_cleanup(EventNotifier *e)
 {
+    if (!e->initialized) {
+        return;
+    }
+
     if (e->rfd != e->wfd) {
         close(e->rfd);
     }
+
     e->rfd = -1;
     close(e->wfd);
     e->wfd = -1;
+    e->initialized = false;
 }
 
 int event_notifier_get_fd(const EventNotifier *e)
@@ -96,6 +104,10 @@ int event_notifier_set(EventNotifier *e)
     static const uint64_t value = 1;
     ssize_t ret;
 
+    if (!e->initialized) {
+        return -1;
+    }
+
     do {
         ret = write(e->wfd, &value, sizeof(value));
     } while (ret < 0 && errno == EINTR);
@@ -113,6 +125,10 @@ int event_notifier_test_and_clear(EventNotifier *e)
     ssize_t len;
     char buffer[512];
 
+    if (!e->initialized) {
+        return 0;
+    }
+
     /* Drain the notify pipe.  For eventfd, only 8 bytes will be read.  */
     value = 0;
     do {
-- 
2.26.2


