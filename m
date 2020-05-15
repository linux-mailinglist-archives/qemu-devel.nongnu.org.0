Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785AA1D4590
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 08:08:12 +0200 (CEST)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZTVz-0007Yi-GJ
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 02:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZTSS-00031c-0r
 for qemu-devel@nongnu.org; Fri, 15 May 2020 02:04:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30897
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZTSP-0004Ot-On
 for qemu-devel@nongnu.org; Fri, 15 May 2020 02:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589522668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPANpLvGTDQQFtfDz60U1pggkS+4k/yXktJh79WGnF8=;
 b=W3VXlR1PsoojeS/iN9MIMGfd5qL8V22QInQHnsjhg2PYL+j/ihUqa7XOAnUFLx+K/reaz8
 z+AKfFhliQgFKbZsLNAY624l/+fw5DdVHo6z/HpflVrwExUBchE/tfSeNABd2xOEjtdKRS
 MDSRERldyMr/ym1vbsH2vcdsjIHyM3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-QUIapBmjN6KlqDOiow2W3A-1; Fri, 15 May 2020 02:04:26 -0400
X-MC-Unique: QUIapBmjN6KlqDOiow2W3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED6FB8014D7
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 06:04:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE0CA60C84;
 Fri, 15 May 2020 06:04:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2FC2C11358BF; Fri, 15 May 2020 08:04:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] qom: Drop object_property_del_child()'s unused parameter
 @errp
Date: Fri, 15 May 2020 08:04:06 +0200
Message-Id: <20200515060424.18993-4-armbru@redhat.com>
In-Reply-To: <20200515060424.18993-1-armbru@redhat.com>
References: <20200515060424.18993-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200505152926.18877-4-armbru@redhat.com>
---
 qom/object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 07762cc331..3d65658059 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -614,7 +614,7 @@ static void object_property_del_all(Object *obj)
     g_hash_table_unref(obj->properties);
 }
 
-static void object_property_del_child(Object *obj, Object *child, Error **errp)
+static void object_property_del_child(Object *obj, Object *child)
 {
     ObjectProperty *prop;
     GHashTableIter iter;
@@ -644,7 +644,7 @@ static void object_property_del_child(Object *obj, Object *child, Error **errp)
 void object_unparent(Object *obj)
 {
     if (obj->parent) {
-        object_property_del_child(obj->parent, obj, NULL);
+        object_property_del_child(obj->parent, obj);
     }
 }
 
-- 
2.21.1


