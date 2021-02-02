Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E630C85D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:49:39 +0100 (CET)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zo2-0006UA-Tg
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlW-0004j3-9G
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlU-0008AS-Cu
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612288018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWr0AcRlsQez5Aq3NxYWxDa4M/wcTgndy6zggib5YUk=;
 b=RIeSZhtLMYmmQQ+jLSDSvwSftwg9kYRMopsWaEjsgn+5oRvHIfx26H4jEbYsv3gqiAAp4A
 NZhXhjwbPGseBzwGQJZivm5ia1JOInoIVpH6jEuwoA+BqDF+YknBB4qZkJ3CFqA9DnzQMG
 5i0RxN9TvHAYp5yNYhqEtbMMlZ47rvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-S5AIT4FVMK6rNaXOXqz8ZA-1; Tue, 02 Feb 2021 12:46:56 -0500
X-MC-Unique: S5AIT4FVMK6rNaXOXqz8ZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2062835E21;
 Tue,  2 Feb 2021 17:46:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 278F85C1CF;
 Tue,  2 Feb 2021 17:46:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 01/14] qapi/introspect.py: assert schema is not None
Date: Tue,  2 Feb 2021 12:46:38 -0500
Message-Id: <20210202174651.2274166-2-jsnow@redhat.com>
In-Reply-To: <20210202174651.2274166-1-jsnow@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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

The introspect visitor is stateful, but expects that it will have a
schema to refer to. Add assertions that state this.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index fafec94e022..43ab4be1f77 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -147,6 +147,8 @@ def _name(self, name):
         return self._name_map[name]
 
     def _use_type(self, typ):
+        assert self._schema is not None
+
         # Map the various integer types to plain int
         if typ.json_type() == 'int':
             typ = self._schema.lookup_type('int')
@@ -225,6 +227,8 @@ def visit_alternate_type(self, name, info, ifcond, features, variants):
     def visit_command(self, name, info, ifcond, features,
                       arg_type, ret_type, gen, success_response, boxed,
                       allow_oob, allow_preconfig, coroutine):
+        assert self._schema is not None
+
         arg_type = arg_type or self._schema.the_empty_object_type
         ret_type = ret_type or self._schema.the_empty_object_type
         obj = {'arg-type': self._use_type(arg_type),
@@ -234,6 +238,7 @@ def visit_command(self, name, info, ifcond, features,
         self._gen_tree(name, 'command', obj, ifcond, features)
 
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
+        assert self._schema is not None
         arg_type = arg_type or self._schema.the_empty_object_type
         self._gen_tree(name, 'event', {'arg-type': self._use_type(arg_type)},
                        ifcond, features)
-- 
2.29.2


