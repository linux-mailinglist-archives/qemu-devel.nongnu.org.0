Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C532233E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:43:22 +0100 (CET)
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELnN-0001If-LH
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELgg-0002MJ-CY
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELej-0005NX-QY
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Fd+v1opmHyA9PnyOfe6QSG4N81hIkEu9HE+yPuC4O4=;
 b=di62+Umt0ifTTYkgZlPIr/+8DdmqmCgYZ9WzvxA70ug/rZeP/oZPk9EjOKtT5pRFcEj6Gn
 oq+cshVwOQ6K8S6UwYAETcLno6EUd72DZAOvfNNSgy0x7a3MD8DJDvV7LuP+PYHrDionlh
 MLT6Zy0++RfN4PUrHrFP9TTlU7N4Dxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-9n0dvRGsPfGLIeEa3VY8Dw-1; Mon, 22 Feb 2021 19:34:23 -0500
X-MC-Unique: 9n0dvRGsPfGLIeEa3VY8Dw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 815F78030C1;
 Tue, 23 Feb 2021 00:34:22 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C24565D6D5;
 Tue, 23 Feb 2021 00:34:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 14/16] qapi/expr.py: Use tuples instead of lists for static
 data
Date: Mon, 22 Feb 2021 19:34:06 -0500
Message-Id: <20210223003408.964543-15-jsnow@redhat.com>
In-Reply-To: <20210223003408.964543-1-jsnow@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

It is -- maybe -- possibly -- three nanoseconds faster.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>

---

This can be dropped if desired; it has no real functional impact I could
defend in code review court. I just happened to write it this way.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 0b841f292d7..61699de8cd5 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -173,11 +173,11 @@ def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
     :param expr: Expression to validate.
     :param info: QAPI source file information.
     """
-    for key in ['gen', 'success-response']:
+    for key in ('gen', 'success-response'):
         if key in expr and expr[key] is not False:
             raise QAPISemError(
                 info, "flag '%s' may only use false value" % key)
-    for key in ['boxed', 'allow-oob', 'allow-preconfig', 'coroutine']:
+    for key in ('boxed', 'allow-oob', 'allow-preconfig', 'coroutine'):
         if key in expr and expr[key] is not True:
             raise QAPISemError(
                 info, "flag '%s' may only use true value" % key)
-- 
2.29.2


