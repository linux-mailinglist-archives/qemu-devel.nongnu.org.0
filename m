Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689222DB025
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:35:10 +0100 (CET)
Received: from localhost ([::1]:48402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCM1-0002du-FQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC92-0008S2-UI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8z-0002RR-6b
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JXkZX9nO3q1Ve7oTE8uNndF6piKybS2esJb44PLdPY=;
 b=D8UAZ2QFlL1jXRTevyaGecSodW+VBo8hx/URt3S8bH0E93ikxgBIQdu01zHB5pV+ENhqNg
 Xc0Mc3fXzX46qMa5Z9tlnaGx2ppl7jf6vx1vwSJZ0WTYH9vWubbGip+zKkmJEuiFU/mTiA
 XFI+jn1JRDSZTsvgokK/Rp3k8H1S3bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-cUcbc6YvOQuX5gA0_fAKSA-1; Tue, 15 Dec 2020 10:21:30 -0500
X-MC-Unique: cUcbc6YvOQuX5gA0_fAKSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF478F4E6;
 Tue, 15 Dec 2020 15:19:54 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D07DD60873;
 Tue, 15 Dec 2020 15:19:53 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/25] can_host: Use class properties
Date: Tue, 15 Dec 2020 10:19:25 -0500
Message-Id: <20201215151942.3125089-9-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instance properties make introspection hard and are not shown by
"-object ...,help".  Convert them to class properties.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Message-Id: <20201111183823.283752-9-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 net/can/can_host.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/net/can/can_host.c b/net/can/can_host.c
index ba7f163d0a..a3c84028c6 100644
--- a/net/can/can_host.c
+++ b/net/can/can_host.c
@@ -77,21 +77,16 @@ static void can_host_complete(UserCreatable *uc, Error **errp)
     can_host_connect(CAN_HOST(uc), errp);
 }
 
-static void can_host_instance_init(Object *obj)
-{
-    CanHostState *ch = CAN_HOST(obj);
-
-    object_property_add_link(obj, "canbus", TYPE_CAN_BUS,
-                             (Object **)&ch->bus,
-                             object_property_allow_set_link,
-                             OBJ_PROP_LINK_STRONG);
-}
-
 static void can_host_class_init(ObjectClass *klass,
                                 void *class_data G_GNUC_UNUSED)
 {
     UserCreatableClass *uc_klass = USER_CREATABLE_CLASS(klass);
 
+    object_class_property_add_link(klass, "canbus", TYPE_CAN_BUS,
+                                   offsetof(CanHostState, bus),
+                                   object_property_allow_set_link,
+                                   OBJ_PROP_LINK_STRONG);
+
     klass->unparent = can_host_unparent;
     uc_klass->complete = can_host_complete;
 }
@@ -102,7 +97,6 @@ static const TypeInfo can_host_info = {
     .instance_size = sizeof(CanHostState),
     .class_size = sizeof(CanHostClass),
     .abstract = true,
-    .instance_init = can_host_instance_init,
     .class_init = can_host_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_USER_CREATABLE },
-- 
2.28.0


