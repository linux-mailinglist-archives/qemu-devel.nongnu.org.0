Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D812C438EC9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:28:22 +0200 (CEST)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mesWz-0008Hm-T2
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUh-0005NI-IC
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUf-0005JU-Lf
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QaSqOtQSZ3U6D/KP50cN1j58gfn+YZlEzo2vi3miaOk=;
 b=bpCcgj27Wif3xny87ku1tjG7pZEhU4yvmGq8eGn/5Dxhbi93nfWU7O7gmnf/nWQ7xv60uy
 ovbdNikHxacA21h39kAmBG1KpCNkQB44UBCfbXFZPs4cLTbzidpQsV1QSucn1cMHS3Hxq0
 fmlnC5Pw/ysIuDxLEQwmy3zCaBhl4Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-sDuLiZ5ENpyTaYXJGdwXSQ-1; Mon, 25 Oct 2021 01:25:49 -0400
X-MC-Unique: sDuLiZ5ENpyTaYXJGdwXSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B1E91272;
 Mon, 25 Oct 2021 05:25:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 498E160862;
 Mon, 25 Oct 2021 05:25:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB7B911380C3; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] qapi: Tools for sets of special feature flags in
 generated code
Date: Mon, 25 Oct 2021 07:25:27 +0200
Message-Id: <20211025052532.3859634-5-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-1-armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New enum QapiSpecialFeature enumerates the special feature flags.

New helper gen_special_features() returns code to represent a
collection of special feature flags as a bitset.

The next few commits will put them to use.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/util.h    |  4 ++++
 scripts/qapi/gen.py    | 13 +++++++++++++
 scripts/qapi/schema.py |  3 +++
 3 files changed, 20 insertions(+)

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
index 2ec1e7b3b6..9d07b88cf6 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -29,6 +29,7 @@
     mcgen,
 )
 from .schema import (
+    QAPISchemaFeature,
     QAPISchemaIfCond,
     QAPISchemaModule,
     QAPISchemaObjectType,
@@ -37,6 +38,18 @@
 from .source import QAPISourceInfo
 
 
+def gen_special_features(features: QAPISchemaFeature):
+    ret = ''
+    sep = ''
+
+    for feat in features:
+        if feat.is_special():
+            ret += ('%s1u << QAPI_%s' % (sep, feat.name.upper()))
+            sep = ' | '
+
+    return ret or '0'
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


