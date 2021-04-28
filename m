Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14E36D904
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:59:27 +0200 (CEST)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkis-0004j6-L2
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkTQ-00042J-8b
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkTO-00006j-Mf
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619617406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ufpt8vsngOcIACjibgi1qmy3Gz+SKto0BeFN9Fw5YI=;
 b=A7yF8Cz2J/DJcLSkLKKFzdgiJA2OzMOJu9hgn5XBkHJNhhQWzh1lsjlqTqtDF+hGMD0XTw
 GuKWa+LLOXaKwY7yl7t5U2g7ppOg4cBmb5Is3c4OTzy5x8pEF1m4PtSNAaiPd8pVHS1U0f
 uyzSb9H4LhKOW5jM+SfLuisM690QMU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-WvdPYU2TPtSQo5K-kpgSOg-1; Wed, 28 Apr 2021 09:43:24 -0400
X-MC-Unique: WvdPYU2TPtSQo5K-kpgSOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 558E619251AE;
 Wed, 28 Apr 2021 13:43:23 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3C7960CC9;
 Wed, 28 Apr 2021 13:43:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/15] qmp: Include "share" property of memory backends
Date: Wed, 28 Apr 2021 15:37:51 +0200
Message-Id: <20210428133754.10713-13-david@redhat.com>
In-Reply-To: <20210428133754.10713-1-david@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's include the property, which can be helpful when debugging,
for example, to spot misuse of MAP_PRIVATE which can result in some ugly
corner cases (e.g., double-memory consumption on shmem).

Use the same description we also use for describing the property.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 1 +
 qapi/machine.json          | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 68a942595a..d41db5b93b 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -174,6 +174,7 @@ static int query_memdev(Object *obj, void *opaque)
         m->merge = object_property_get_bool(obj, "merge", &error_abort);
         m->dump = object_property_get_bool(obj, "dump", &error_abort);
         m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
+        m->share = object_property_get_bool(obj, "share", &error_abort);
         m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
                                              &error_abort);
         host_nodes = object_property_get_qobject(obj,
diff --git a/qapi/machine.json b/qapi/machine.json
index 758b901185..32650bfe9e 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -796,6 +796,8 @@
 #
 # @prealloc: whether memory was preallocated
 #
+# @share: whether memory is private to QEMU or shared (since 6.1)
+#
 # @host-nodes: host nodes for its memory policy
 #
 # @policy: memory policy of memory backend
@@ -809,6 +811,7 @@
     'merge':      'bool',
     'dump':       'bool',
     'prealloc':   'bool',
+    'share':      'bool',
     'host-nodes': ['uint16'],
     'policy':     'HostMemPolicy' }}
 
-- 
2.30.2


