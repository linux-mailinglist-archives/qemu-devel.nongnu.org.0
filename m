Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A419378981
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:51:48 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4Rt-0005Fs-US
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4L6-0001hd-7A
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4Kz-0003wn-Qf
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620647077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OgD0H0WDIKDVJ5YzHTe0l8wioVl0CiZcYd7oSM9KHO8=;
 b=UdX32UEiUBeXuCd17Pn8YYcgiHlSesxzxCmwBkr0/5Eriz9t12aqDiDdiJabQrQaFOn451
 lrDi0RyQW714+9qgULYOuisrhg1kWgbkPBW7aO1ts9eqChCVSiaqog+WxS3sBNLbE+QVIb
 BtxN0i9sA9OQqt82B/oDMvjVr2LMDx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-_AOmIdHTMU6iSyWwYclgbg-1; Mon, 10 May 2021 07:44:35 -0400
X-MC-Unique: _AOmIdHTMU6iSyWwYclgbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04086801817
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 11:44:35 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-137.ams2.redhat.com [10.36.114.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0A98100EBAD;
 Mon, 10 May 2021 11:44:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/15] qmp: Include "reserve" property of memory backends
Date: Mon, 10 May 2021 13:43:27 +0200
Message-Id: <20210510114328.21835-15-david@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

Let's include the new property. Instead of relying on CONFIG_LINUX,
let's try to unconditionally grab the property and treat errors as
"does not exist".

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 7 +++++++
 qapi/machine.json          | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index a36ceaf4f3..216fdfaf3a 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -157,6 +157,7 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
 
 static int query_memdev(Object *obj, void *opaque)
 {
+    Error *err = NULL;
     MemdevList **list = opaque;
     Memdev *m;
     QObject *host_nodes;
@@ -173,6 +174,12 @@ static int query_memdev(Object *obj, void *opaque)
         m->dump = object_property_get_bool(obj, "dump", &error_abort);
         m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
         m->share = object_property_get_bool(obj, "share", &error_abort);
+        m->reserve = object_property_get_bool(obj, "reserve", &err);
+        if (err) {
+            error_free_or_abort(&err);
+        } else {
+            m->has_reserve = true;
+        }
         m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
                                              &error_abort);
         host_nodes = object_property_get_qobject(obj,
diff --git a/qapi/machine.json b/qapi/machine.json
index 32650bfe9e..1cfb16e6eb 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -798,6 +798,12 @@
 #
 # @share: whether memory is private to QEMU or shared (since 6.1)
 #
+# @reserve: whether swap space (or huge pages) was reserved if applicable.
+#           This corresponds to the user configuration and not the actual
+#           behavior implemented in the OS to perform the reservation.
+#           For example, Linux will never reserve swap space for shared
+#           file mappings. (since 6.1)
+#
 # @host-nodes: host nodes for its memory policy
 #
 # @policy: memory policy of memory backend
@@ -812,6 +818,7 @@
     'dump':       'bool',
     'prealloc':   'bool',
     'share':      'bool',
+    '*reserve':    'bool',
     'host-nodes': ['uint16'],
     'policy':     'HostMemPolicy' }}
 
-- 
2.30.2


