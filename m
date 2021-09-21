Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EBD4131BB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:37:57 +0200 (CEST)
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd9v-0006T7-Gx
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mScxo-0008Tr-QJ
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 06:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mScxS-0005pT-Kr
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 06:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632219896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8JjdR6fqUAntjJFZm01EHglaJhkZRQVmI7kwA55TkA0=;
 b=CR1SPoaWsgDcL/3UmXGWdByCjk5PWrO8os4zjY6S+/EI7pQqKvZephaKw35VDwEH5Z9i3B
 I4VusSWrL85ZE8Kqo/pouhSZkKUwJVN+A9qs0B665/3Rbllf12vn2+gcMZwcmSbJ/kvvc1
 aPFk/tAgqU3jhQzc2+TmA1YNV+aWZIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-xoGVGW8lOnSVC_7vfZEPqA-1; Tue, 21 Sep 2021 06:24:55 -0400
X-MC-Unique: xoGVGW8lOnSVC_7vfZEPqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55481802921
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 10:24:54 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E6AA6B544;
 Tue, 21 Sep 2021 10:24:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] monitor: Consider "id" when rate-limiting
 MEMORY_DEVICE_SIZE_CHANGE qapi events
Date: Tue, 21 Sep 2021 12:24:34 +0200
Message-Id: <20210921102434.24273-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have to consider the device id, otherwise we'll lose some events for
unrelated devices. If the device does not have a device id (very unlikely),
the target of the notifications has to update the size of all devices
manually either way.

This was noticed by starting a VM with two virtio-mem devices that each
have a requested size > 0. The Linux guest will initialize both devices
in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
one of the devices.

Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Human Monitor (HMP))
Cc: Markus Armbruster <armbru@redhat.com> (supporter:QMP)
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 monitor/monitor.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 46a171bca6..05c0b32b67 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -474,6 +474,11 @@ static unsigned int qapi_event_throttle_hash(const void *key)
         hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
     }
 
+    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE &&
+        qdict_get(evstate->data, "id")) {
+        hash += g_str_hash(qdict_get_str(evstate->data, "id"));
+    }
+
     return hash;
 }
 
@@ -496,6 +501,20 @@ static gboolean qapi_event_throttle_equal(const void *a, const void *b)
                        qdict_get_str(evb->data, "node-name"));
     }
 
+    if (eva->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
+        const bool id_a = qdict_get(eva->data, "id");
+        const bool id_b = qdict_get(evb->data, "id");
+
+        if (!id_a && !id_b) {
+            return TRUE;
+        } else if (id_a ^ id_b) {
+            return FALSE;
+        }
+
+        return !strcmp(qdict_get_str(eva->data, "id"),
+                       qdict_get_str(evb->data, "id"));
+    }
+
     return TRUE;
 }
 
-- 
2.31.1


