Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080362AF85E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:44:18 +0100 (CET)
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcv6P-0005DG-1m
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv1E-0000PA-G6
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv1B-00084q-5G
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTQvQV3EldUR5MCeiXq/dAUZUOCFSg1ml0s83cmdU40=;
 b=iKi+pRsQJZZzMfxROzjfPxwbHYinF4xgaj/8bFGV3u8pk4s9udBRTp8iEdGqqcpYLfM8az
 sqJb8E3/WyBElbCGZcvOQ05HinOZkhztef4k1L1qJg+f17VnhINBWX9zZv3YUCbC0kstAD
 0CCgy+jNC3lbm2GhJmYKKkeNuKepD3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274--nQ4SyhPNjOXtiuDJ9_cIA-1; Wed, 11 Nov 2020 13:38:45 -0500
X-MC-Unique: -nQ4SyhPNjOXtiuDJ9_cIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14157186DD44
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 18:38:45 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC4BB7366E;
 Wed, 11 Nov 2020 18:38:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] input: Use class properties
Date: Wed, 11 Nov 2020 13:38:23 -0500
Message-Id: <20201111183823.283752-13-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instance properties make introspection hard and are not shown by
"-object ...,help".  Convert them to class properties.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This was originally submitted as part of the series:
Subject: [PATCH 00/12] qom: Make all -object types use only class properties
Message-Id: <20201009160122.1662082-1-ehabkost@redhat.com>
https://lore.kernel.org/qemu-devel/20201009160122.1662082-1-ehabkost@redhat.com
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
---
 ui/input-barrier.c | 22 ++++++++++++++++++++++
 ui/input-linux.c   | 14 ++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index 81b8d04ec8..b3558c3c91 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -695,6 +695,28 @@ static void input_barrier_class_init(ObjectClass *oc, void *data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
 
+    object_class_property_add_str(oc, "name",
+                                  input_barrier_get_name,
+                                  input_barrier_set_name);
+    object_class_property_add_str(oc, "server",
+                                  input_barrier_get_server,
+                                  input_barrier_set_server);
+    object_class_property_add_str(oc, "port",
+                                  input_barrier_get_port,
+                                  input_barrier_set_port);
+    object_class_property_add_str(oc, "x-origin",
+                                  input_barrier_get_x_origin,
+                                  input_barrier_set_x_origin);
+    object_class_property_add_str(oc, "y-origin",
+                                  input_barrier_get_y_origin,
+                                  input_barrier_set_y_origin);
+    object_class_property_add_str(oc, "width",
+                                  input_barrier_get_width,
+                                  input_barrier_set_width);
+    object_class_property_add_str(oc, "height",
+                                  input_barrier_get_height,
+                                  input_barrier_set_height);
+
     ucc->complete = input_barrier_complete;
 
     object_class_property_add_str(oc, "name",
diff --git a/ui/input-linux.c b/ui/input-linux.c
index 05c0c98819..1aaaa5a375 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -496,6 +496,20 @@ static void input_linux_class_init(ObjectClass *oc, void *data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
 
+    object_class_property_add_str(oc, "evdev",
+                                  input_linux_get_evdev,
+                                  input_linux_set_evdev);
+    object_class_property_add_bool(oc, "grab_all",
+                                   input_linux_get_grab_all,
+                                   input_linux_set_grab_all);
+    object_class_property_add_bool(oc, "repeat",
+                                   input_linux_get_repeat,
+                                   input_linux_set_repeat);
+    object_class_property_add_enum(oc, "grab-toggle", "GrabToggleKeys",
+                                   &GrabToggleKeys_lookup,
+                                   input_linux_get_grab_toggle,
+                                   input_linux_set_grab_toggle);
+
     ucc->complete = input_linux_complete;
 
     object_class_property_add_str(oc, "evdev",
-- 
2.28.0


