Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DD9288F38
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:54:18 +0200 (CEST)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQver-0004UA-5r
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4a-0004Xs-VR
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4W-0003Mj-CH
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THLjB+nqUST3VSx1phmjeHAFHIBVHY5eQx5Gg5vz534=;
 b=inQsSZOSKnLRK0dgvw9JBVutjXBcB4htn+uSWV6iI0RrPRMsiWSebSmi8Z1v5Kupev1PRb
 91+tl0LVIFN/fPndcnx0Kgqml2rTy+7v5HtP0yKoBLFaXm7/d6FX428aVTyG7ctF4GS2BL
 ggQuE2/uMTk9iWuZGtrmblK5OZbtt5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-Cai5p_K_OtKfcq4wSS9fhQ-1; Fri, 09 Oct 2020 12:16:40 -0400
X-MC-Unique: Cai5p_K_OtKfcq4wSS9fhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC2BA64086;
 Fri,  9 Oct 2020 16:16:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDEC419936;
 Fri,  9 Oct 2020 16:16:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 34/36] qapi/visit.py: assert tag_member contains a
 QAPISchemaEnumType
Date: Fri,  9 Oct 2020 12:15:56 -0400
Message-Id: <20201009161558.107041-35-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is true by design, but not presently able to be expressed in the
type system. An assertion helps mypy understand our constraints.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/visit.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 708f72c4a1e..e00f2a09d75 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -22,7 +22,7 @@
     mcgen,
 )
 from .gen import QAPISchemaModularCVisitor, ifcontext
-from .schema import QAPISchemaObjectType
+from .schema import QAPISchemaEnumType, QAPISchemaObjectType
 
 
 def gen_visit_decl(name, scalar=False):
@@ -84,15 +84,17 @@ def gen_visit_object_members(name, base, members, variants):
         ret += gen_endif(memb.ifcond)
 
     if variants:
+        tag_member = variants.tag_member
+        assert isinstance(tag_member.type, QAPISchemaEnumType)
+
         ret += mcgen('''
     switch (obj->%(c_name)s) {
 ''',
-                     c_name=c_name(variants.tag_member.name))
+                     c_name=c_name(tag_member.name))
 
         for var in variants.variants:
-            case_str = c_enum_const(variants.tag_member.type.name,
-                                    var.name,
-                                    variants.tag_member.type.prefix)
+            case_str = c_enum_const(tag_member.type.name, var.name,
+                                    tag_member.type.prefix)
             ret += gen_if(var.ifcond)
             if var.type.name == 'q_empty':
                 # valid variant and nothing to do
-- 
2.26.2


