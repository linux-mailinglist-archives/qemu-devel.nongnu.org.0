Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666BC2B5480
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 23:46:26 +0100 (CET)
Received: from localhost ([::1]:41402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kenGT-0000dq-CG
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 17:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kenCH-00045h-3M
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kenC9-0000HW-O0
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605566517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8K+X+Bhbl48vXNduSDuwR4SqZX1cMu+hzqYgTV7pDc=;
 b=J+6Ym0/6ntZg+Tx5tsD+71pqRbqSfHJJ73pYGc84HrHSmK85Bqt2Mo/POSvkgU4hFFdk+H
 dNocEGqrnG0P0JtcOTdbfTXc+4Yl5KWIuAd0GUeJ4Ee4ygHpYBZte/tXc3MnnOjuSmjMWP
 9hhP+5TlF6Wue7U/J2Cv5kfFOn1KxHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-pqh9vlEfNVWgIK53MIDueQ-1; Mon, 16 Nov 2020 17:41:55 -0500
X-MC-Unique: pqh9vlEfNVWgIK53MIDueQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADB3188C143
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 22:41:54 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DFEA6EF46;
 Mon, 16 Nov 2020 22:41:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] qom: Make object_property_set_default() public
Date: Mon, 16 Nov 2020 17:41:42 -0500
Message-Id: <20201116224143.1284278-8-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-1-ehabkost@redhat.com>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function will be used outside qom/object.c, to simplify the
field property code that sets the property default value.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qom/object.h | 11 +++++++++++
 qom/object.c         |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 2ab124b8f0..4234cc9b66 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1090,6 +1090,17 @@ ObjectProperty *object_class_property_add(ObjectClass *klass, const char *name,
                                           ObjectPropertyRelease *release,
                                           void *opaque);
 
+/**
+ * object_property_set_default:
+ * @prop: the property to set
+ * @value: the value to be written to the property
+ *
+ * Set the property default value.
+ *
+ * Ownership of @value is transferred to the property.
+ */
+void object_property_set_default(ObjectProperty *prop, QObject *value);
+
 /**
  * object_property_set_default_bool:
  * @prop: the property to set
diff --git a/qom/object.c b/qom/object.c
index 7c11bcd3b1..6b0d9d8c79 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1547,7 +1547,7 @@ static void object_property_init_defval(Object *obj, ObjectProperty *prop)
     visit_free(v);
 }
 
-static void object_property_set_default(ObjectProperty *prop, QObject *defval)
+void object_property_set_default(ObjectProperty *prop, QObject *defval)
 {
     assert(!prop->defval);
     assert(!prop->init);
-- 
2.28.0


