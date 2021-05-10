Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E313A378A1C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:55:46 +0200 (CEST)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4Vm-0004rT-1Z
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4Ku-0001Ai-5Y
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4Ks-0003sV-Ay
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620647069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZcBREX11EcBhJU/zRoS5Ly0VAJn/b6xYn0UDMt7+fk=;
 b=ayz4gvEECdf8/6iVFdYlt1s8OlgTx8TjH96zJxdAgGcF96zpbRiqgztzvD/A7XjYP5SzDx
 KPYiIsS3sx1Cr2W5kQUZOvWufsGQhIg93h+J7WaNg2lFUk7toUU3rS0ye6WMq3wL8Dx+SD
 5TlqZgUrB1A5atZeXJLlxCUOC+L/n/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Mjof7mfaMcSjsJgwHNF3Zw-1; Mon, 10 May 2021 07:44:28 -0400
X-MC-Unique: Mjof7mfaMcSjsJgwHNF3Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2305A1854E25
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 11:44:27 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-137.ams2.redhat.com [10.36.114.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F01D1037F20;
 Mon, 10 May 2021 11:44:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/15] qmp: Include "share" property of memory backends
Date: Mon, 10 May 2021 13:43:25 +0200
Message-Id: <20210510114328.21835-13-david@redhat.com>
In-Reply-To: <20210510114328.21835-1-david@redhat.com>
References: <20210510114328.21835-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
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
index a36c96608f..a36ceaf4f3 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -172,6 +172,7 @@ static int query_memdev(Object *obj, void *opaque)
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


