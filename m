Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA131C5A5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:44:14 +0100 (CET)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqLU-0003UJ-Vf
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwo-0001pq-ER
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwj-00039Z-Pt
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613441913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sp2u1lIVfdVptqh5ZDczvVjhtTTjq8lIMFAyfYHoDNg=;
 b=Zn1cIdAkw8lafjPboxBEKOt37RK25oXaexfwlRii6IQXIvOBXkacYq3VKX4dg3E6Aomt29
 tieq2FDaflerk/yTOx1YDCcVEOhFA+W3YnW9I/8/dVjXzGwN2hes5nvr/rE3m7G17pRjhZ
 yB/tEp6MKieKwSvKa/wQrsIBNIjixMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-9wqygy6bO7yW4Li2OUJhwA-1; Mon, 15 Feb 2021 21:18:30 -0500
X-MC-Unique: 9wqygy6bO7yW4Li2OUJhwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02E3D1005501;
 Tue, 16 Feb 2021 02:18:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B19A10023AF;
 Tue, 16 Feb 2021 02:18:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 13/19] qapi/introspect.py: remove _gen_variants helper
Date: Mon, 15 Feb 2021 21:18:03 -0500
Message-Id: <20210216021809.134886-14-jsnow@redhat.com>
In-Reply-To: <20210216021809.134886-1-jsnow@redhat.com>
References: <20210216021809.134886-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is easier to give a name to all of the dictly-typed objects we pass
around in introspect.py by removing this helper, as it does not return
an object that has any knowable type by itself.

Inline it into its only caller instead.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index afad891bb2b..b0fcc4443c1 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -241,10 +241,6 @@ def _gen_member(self, member):
             obj['features'] = self._gen_features(member.features)
         return Annotated(obj, member.ifcond)
 
-    def _gen_variants(self, tag_name, variants):
-        return {'tag': tag_name,
-                'variants': [self._gen_variant(v) for v in variants]}
-
     def _gen_variant(self, variant):
         obj = {'case': variant.name, 'type': self._use_type(variant.type)}
         return Annotated(obj, variant.ifcond)
@@ -268,9 +264,8 @@ def visit_object_type_flat(self, name, info, ifcond, features,
                                members, variants):
         obj = {'members': [self._gen_member(m) for m in members]}
         if variants:
-            obj.update(self._gen_variants(variants.tag_member.name,
-                                          variants.variants))
-
+            obj['tag'] = variants.tag_member.name
+            obj['variants'] = [self._gen_variant(v) for v in variants.variants]
         self._gen_tree(name, 'object', obj, ifcond, features)
 
     def visit_alternate_type(self, name, info, ifcond, features, variants):
-- 
2.29.2


