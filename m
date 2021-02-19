Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E3A31F920
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:13:25 +0100 (CET)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4ey-0007hw-2m
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WO-0007Mq-V1
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WK-0001yj-VY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+gd5x8iUrI44KvF06DQTf2QGKx5A5EZzkn6Oo4BEo4=;
 b=J+zpkiHpTqYp48NrKiE5TVCrNi6GZvp3fu8z5QHMTs52UT4BD3+DLQOZueZy2vEeosttMz
 mJLs4hfBd8DjvGUDJTw3mXVCBMOFbH7djjNefhgumY9+D8GdHB5rAOKtkYT/s5LNCfmtY7
 xXaCmN2XIPo1nEKqmLtNBX/V7KPXlwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-QzCmVxGRPEuswv6g-Y5Ndg-1; Fri, 19 Feb 2021 07:04:25 -0500
X-MC-Unique: QzCmVxGRPEuswv6g-Y5Ndg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB871801965;
 Fri, 19 Feb 2021 12:04:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CD085C1BB;
 Fri, 19 Feb 2021 12:04:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A6271138467; Fri, 19 Feb 2021 13:04:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/18] qapi/introspect.py: assert schema is not None
Date: Fri, 19 Feb 2021 13:04:06 +0100
Message-Id: <20210219120422.600850-3-armbru@redhat.com>
In-Reply-To: <20210219120422.600850-1-armbru@redhat.com>
References: <20210219120422.600850-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

The introspect visitor is stateful, but expects that it will have a
schema to refer to. Add assertions that state this.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-3-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index fafec94e02..43ab4be1f7 100644
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
2.26.2


