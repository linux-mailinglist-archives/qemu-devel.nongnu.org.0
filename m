Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152672735BF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 00:26:49 +0200 (CEST)
Received: from localhost ([::1]:56186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKUGm-0003Gw-4Z
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 18:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU29-0000eC-E2
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU24-0001gL-75
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600726294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5+/1tyGKR8UL8izbNzf4NPhJhG0pfUnyRttNwTzYwI=;
 b=C5rZ2qwEA+F0Ishm1J7G9WMs9S25qX0Lc0ZsOGf3Mb3peK+VfQx9fHs+M3QpY/eTHvzt80
 I4ei1BGW04NUqIdq5PHoH0qUCp3VJRpGpZP/BYPwAdQJbCE6Yp0u3AYkDJANgkfZAwBrou
 KVPO3hgkKnYlCv4haKI2bvebLKbwewE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-SjKwBzV8NaWE28qR60HC-w-1; Mon, 21 Sep 2020 18:11:30 -0400
X-MC-Unique: SjKwBzV8NaWE28qR60HC-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8141D873081;
 Mon, 21 Sep 2020 22:11:29 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A13310013BD;
 Mon, 21 Sep 2020 22:11:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/24] machine: Register "memory-backend" as class property
Date: Mon, 21 Sep 2020 18:10:41 -0400
Message-Id: <20200921221045.699690-21-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:43:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/machine.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index ea26d612374..675ca6d651c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -874,6 +874,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
         machine_get_memory_encryption, machine_set_memory_encryption);
     object_class_property_set_description(oc, "memory-encryption",
         "Set memory encryption object to use");
+
+    object_class_property_add_str(oc, "memory-backend",
+                                  machine_get_memdev, machine_set_memdev);
+    object_class_property_set_description(oc, "memory-backend",
+                                          "Set RAM backend"
+                                          "Valid value is ID of hostmem based backend");
 }
 
 static void machine_class_base_init(ObjectClass *oc, void *data)
@@ -925,12 +931,6 @@ static void machine_initfn(Object *obj)
                                         "Table (HMAT)");
     }
 
-    object_property_add_str(obj, "memory-backend",
-                            machine_get_memdev, machine_set_memdev);
-    object_property_set_description(obj, "memory-backend",
-                                    "Set RAM backend"
-                                    "Valid value is ID of hostmem based backend");
-
     /* Register notifier when init is done for sysbus sanity checks */
     ms->sysbus_notifier.notify = machine_init_notify;
     qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
-- 
2.26.2


