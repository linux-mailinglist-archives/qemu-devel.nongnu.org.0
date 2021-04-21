Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF073672B2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:38:58 +0200 (CEST)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHkX-0001iO-CW
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHTL-0002k5-T8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHTK-0003s5-3c
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mj5eqXUu/ejMlhT4ls2rJCK65l3UrBx512STLV6Me2c=;
 b=CFZ59dzVMixK38eC0SoJcBPtpIiqKQqSfwyQGu5h73WdT5GpswDKae04JFSK5GiDH8Pyl4
 s1qjj6MzUjw4ndQkzavsB53qjs3Nyie+X/KC1sZDrrZDamyLeDEvdAGZ1hTYJt7L6UwD+Q
 zBf/X0NyjKm6Voih802Y8zM/gtxUnEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-y-2nsGUcNhC76BYFTFQ7ng-1; Wed, 21 Apr 2021 14:20:39 -0400
X-MC-Unique: y-2nsGUcNhC76BYFTFQ7ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60516107ACED;
 Wed, 21 Apr 2021 18:20:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8461C19D9B;
 Wed, 21 Apr 2021 18:20:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 02/17] qapi/expr.py: Remove 'info' argument from nested
 check_if_str
Date: Wed, 21 Apr 2021 14:20:17 -0400
Message-Id: <20210421182032.3521476-3-jsnow@redhat.com>
In-Reply-To: <20210421182032.3521476-1-jsnow@redhat.com>
References: <20210421182032.3521476-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

The function can just use the argument from the scope above. Otherwise,
we get shadowed argument errors because the parameter name clashes with
the name of a variable already in-scope.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index c207481f7e9..3fda5d50827 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -122,7 +122,7 @@ def check_flags(expr, info):
 
 def check_if(expr, info, source):
 
-    def check_if_str(ifcond, info):
+    def check_if_str(ifcond):
         if not isinstance(ifcond, str):
             raise QAPISemError(
                 info,
@@ -142,9 +142,9 @@ def check_if_str(ifcond, info):
             raise QAPISemError(
                 info, "'if' condition [] of %s is useless" % source)
         for elt in ifcond:
-            check_if_str(elt, info)
+            check_if_str(elt)
     else:
-        check_if_str(ifcond, info)
+        check_if_str(ifcond)
         expr['if'] = [ifcond]
 
 
-- 
2.30.2


