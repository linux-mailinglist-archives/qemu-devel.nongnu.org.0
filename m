Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4711BC584
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 18:43:26 +0200 (CEST)
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTTKP-0006K6-Gw
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 12:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTTF7-0006U9-L7
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTTBl-0000rt-2O
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:37:57 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30171
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTTBk-0000rc-87
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588091667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDl41aBw5k0OYxc94xTJsbLKhtsME9ZYbfSh/Y5Sl/0=;
 b=iRn2c2Ck5uqnUgydtZZ+gL1wrxJf24dXwKAzdDcK75UHl8SmEu2DuBucJuhudmpSI72jIX
 XRlb3RP5wZ+3eJ1PM/UeD3ehoDVOnY08lzYf1XqzHHeq2m5zhbqzwIZrpf5KriMZHEvnId
 H1gtJ7VgnEa+Qw41Y4jcdJRH3PC5mmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-d09y0BCnMUGpRGt22GlRpA-1; Tue, 28 Apr 2020 12:34:24 -0400
X-MC-Unique: d09y0BCnMUGpRGt22GlRpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D263A108BD0D
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 16:34:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FCDB6607D;
 Tue, 28 Apr 2020 16:34:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0714711358BF; Tue, 28 Apr 2020 18:34:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/17] qom: Drop object_property_del_child()'s unused
 parameter @errp
Date: Tue, 28 Apr 2020 18:34:05 +0200
Message-Id: <20200428163419.4483-4-armbru@redhat.com>
In-Reply-To: <20200428163419.4483-1-armbru@redhat.com>
References: <20200428163419.4483-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qom/object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 0c9e2052fa..9c74749193 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -614,7 +614,7 @@ static void object_property_del_all(Object *obj)
     g_hash_table_unref(obj->properties);
 }
=20
-static void object_property_del_child(Object *obj, Object *child, Error **=
errp)
+static void object_property_del_child(Object *obj, Object *child)
 {
     ObjectProperty *prop;
     GHashTableIter iter;
@@ -644,7 +644,7 @@ static void object_property_del_child(Object *obj, Obje=
ct *child, Error **errp)
 void object_unparent(Object *obj)
 {
     if (obj->parent) {
-        object_property_del_child(obj->parent, obj, NULL);
+        object_property_del_child(obj->parent, obj);
     }
 }
=20
--=20
2.21.1


