Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE6A43DF1E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:41:49 +0200 (CEST)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2qy-0001bt-Mc
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg2bZ-0007KV-Po
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:25:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg2bW-00031h-C2
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635416747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqE7rF9IM7mRRsuUCSxKju0OgS59eNBKa7ba+uQGeVA=;
 b=Rd1XQGc/bvRDHDRa8SxUotISNM/u2jLlU0gW8MEIaudNELun67ryVp8lsNrJ+y5BRkomuE
 hTFXmVbbMpGi8F8Un1OeghEePLTYp7BpZgLbwEhgrc7jAARfJvQhg8S4ZAN2B1+PiyqzEF
 XHmafC7lFH+8eoEnCUOiy7Ll1hE0YMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-Neo4bj7UOO6OOUBlQNI8SA-1; Thu, 28 Oct 2021 06:25:44 -0400
X-MC-Unique: Neo4bj7UOO6OOUBlQNI8SA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11101802B61;
 Thu, 28 Oct 2021 10:25:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1292069219;
 Thu, 28 Oct 2021 10:25:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4505F11380C3; Thu, 28 Oct 2021 12:25:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] qapi: Tools for sets of special feature flags in
 generated code
Date: Thu, 28 Oct 2021 12:25:15 +0200
Message-Id: <20211028102520.747396-5-armbru@redhat.com>
In-Reply-To: <20211028102520.747396-1-armbru@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, philmd@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New enum QapiSpecialFeature enumerates the special feature flags.

New helper gen_special_features() returns code to represent a
collection of special feature flags as a bitset.

The next few commits will put them to use.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 include/qapi/util.h    | 4 ++++
 scripts/qapi/gen.py    | 8 ++++++++
 scripts/qapi/schema.py | 3 +++
 3 files changed, 15 insertions(+)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 257c600f99..7a8d5c7d72 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -11,6 +11,10 @@
 #ifndef QAPI_UTIL_H
 #define QAPI_UTIL_H
 
+typedef enum {
+    QAPI_DEPRECATED,
+} QapiSpecialFeature;
+
 /* QEnumLookup flags */
 #define QAPI_ENUM_DEPRECATED 1
 
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 2ec1e7b3b6..995a97d2b8 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -18,6 +18,7 @@
     Dict,
     Iterator,
     Optional,
+    Sequence,
     Tuple,
 )
 
@@ -29,6 +30,7 @@
     mcgen,
 )
 from .schema import (
+    QAPISchemaFeature,
     QAPISchemaIfCond,
     QAPISchemaModule,
     QAPISchemaObjectType,
@@ -37,6 +39,12 @@
 from .source import QAPISourceInfo
 
 
+def gen_special_features(features: Sequence[QAPISchemaFeature]) -> str:
+    special_features = [f"1u << QAPI_{feat.name.upper()}"
+                        for feat in features if feat.is_special()]
+    return ' | '.join(special_features) or '0'
+
+
 class QAPIGen:
     def __init__(self, fname: str):
         self.fname = fname
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 6d5f46509a..55f82d7389 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -725,6 +725,9 @@ def connect_doc(self, doc):
 class QAPISchemaFeature(QAPISchemaMember):
     role = 'feature'
 
+    def is_special(self):
+        return self.name in ('deprecated')
+
 
 class QAPISchemaObjectTypeMember(QAPISchemaMember):
     def __init__(self, name, info, typ, optional, ifcond=None, features=None):
-- 
2.31.1


