Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E9436E993
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:30:18 +0200 (CEST)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4s5-0000kA-9P
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4pq-00080w-KC
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4pp-0003YO-1F
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619695676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PtJ3WkYq/6WfkYFyId9CQxf2bqSHIctEmPP8mwkYZ2c=;
 b=I0QDb8MYW/G4qS9p+HSQDk1Uh3WdPcF05gm9/d4gXsOQFBgqXaA3+MwlZs+HY9/CFy5wY3
 zK0CY0wFIRMbEiZVOfayTWV/cHOshyvVoJw3zG7SzA6cn418mjLxBKbGiXHmxHUfIH8f5C
 ME22SOaSmkbtIFJ5fHH+qwpavzr9UNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-kJwPIqPFPAiRWld1n55FqA-1; Thu, 29 Apr 2021 07:27:52 -0400
X-MC-Unique: kJwPIqPFPAiRWld1n55FqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5987B6D500;
 Thu, 29 Apr 2021 11:27:51 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-50.ams2.redhat.com [10.36.114.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC782679EB;
 Thu, 29 Apr 2021 11:27:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/10] numa: Make all callbacks of ram block notifiers
 optional
Date: Thu, 29 Apr 2021 13:27:01 +0200
Message-Id: <20210429112708.12291-4-david@redhat.com>
In-Reply-To: <20210429112708.12291-1-david@redhat.com>
References: <20210429112708.12291-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's make add/remove optional. We want to introduce a RAM block
notifier for RAM migration that is only interested in resize events.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/numa.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 921bf86ab4..64b9334050 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -819,8 +819,11 @@ static int ram_block_notify_add_single(RAMBlock *rb, void *opaque)
 void ram_block_notifier_add(RAMBlockNotifier *n)
 {
     QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);
+
     /* Notify about all existing ram blocks. */
-    qemu_ram_foreach_block(ram_block_notify_add_single, n);
+    if (n->ram_block_added) {
+        qemu_ram_foreach_block(ram_block_notify_add_single, n);
+    }
 }
 
 void ram_block_notifier_remove(RAMBlockNotifier *n)
@@ -833,7 +836,9 @@ void ram_block_notify_add(void *host, size_t size, size_t max_size)
     RAMBlockNotifier *notifier;
 
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_added(notifier, host, size, max_size);
+        if (notifier->ram_block_added) {
+            notifier->ram_block_added(notifier, host, size, max_size);
+        }
     }
 }
 
@@ -842,7 +847,9 @@ void ram_block_notify_remove(void *host, size_t size, size_t max_size)
     RAMBlockNotifier *notifier;
 
     QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
-        notifier->ram_block_removed(notifier, host, size, max_size);
+        if (notifier->ram_block_removed) {
+            notifier->ram_block_removed(notifier, host, size, max_size);
+        }
     }
 }
 
-- 
2.30.2


