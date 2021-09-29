Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F541CA1A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:29:38 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcSf-0006cQ-E8
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVcOC-00083T-Nq
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVcOB-00080b-BA
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632932698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXGeh+8sARDJ0YX0wqG0/a8iZKKXb4tTcC9Om710q94=;
 b=aF5P4jg7MuYeDqbLzDBrguFhgSQiA1KTOw8kDdl5UXgl1AnvobY9Ecd1RKh0+FzZqM4Dkl
 qU3PmiaeXwMy6RKu9Nhse27q2wq8+8hVZWdOqm1LgC8h4ZyQ57mvsEWGmSHnAFg2cCObTS
 OrL4faLQO96LOxcxu/Uoxt9nsxZwMA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-dhSBeSaPMdS4lwBnfrqRWA-1; Wed, 29 Sep 2021 12:24:56 -0400
X-MC-Unique: dhSBeSaPMdS4lwBnfrqRWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88C8AA40C0
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 16:24:55 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A846D19C59;
 Wed, 29 Sep 2021 16:24:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi
 events per device
Date: Wed, 29 Sep 2021 18:24:45 +0200
Message-Id: <20210929162445.64060-4-david@redhat.com>
In-Reply-To: <20210929162445.64060-1-david@redhat.com>
References: <20210929162445.64060-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to rate-limit MEMORY_DEVICE_SIZE_CHANGE events per device,
otherwise we can lose some events for devices. We can now use the
qom-path to reliably map an event to a device and make rate-limiting
device-aware.

This was noticed by starting a VM with two virtio-mem devices that each
have a requested size > 0. The Linux guest will initialize both devices
in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
one of the devices.

Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 monitor/monitor.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 46a171bca6..21c7a68758 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -474,6 +474,10 @@ static unsigned int qapi_event_throttle_hash(const void *key)
         hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
     }
 
+    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
+        hash += g_str_hash(qdict_get_str(evstate->data, "qom-path"));
+    }
+
     return hash;
 }
 
@@ -496,6 +500,11 @@ static gboolean qapi_event_throttle_equal(const void *a, const void *b)
                        qdict_get_str(evb->data, "node-name"));
     }
 
+    if (eva->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
+        return !strcmp(qdict_get_str(eva->data, "qom-path"),
+                       qdict_get_str(evb->data, "qom-path"));
+    }
+
     return TRUE;
 }
 
-- 
2.31.1


