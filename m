Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9249E4D5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:40:03 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5wQ-000242-KE
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:40:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5fQ-0007oF-KW
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5fP-0003Pe-1v
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zld+Z14lPntaDcU318MSf9lAeevfMx47AxegRJNf6jE=;
 b=XHtA4WNzUS19mKbjv2xcE8vIKKGykGlTQV11UwwclVqIErxDBaSwpdW/C3Lge0k8G9+4OK
 NVrBIEQuGqH4sLQ3ty9tWByQeajKhH4cFkig3/Wloqvj0oBiJ4u6KgL+f6MTC4AeHu9bpJ
 zLLpY6P59Z91r87G8PpujUT67FfLI6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-Ud-e2O68P6WTMwZwKft6Dw-1; Thu, 27 Jan 2022 09:22:20 -0500
X-MC-Unique: Ud-e2O68P6WTMwZwKft6Dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 426E7101F000;
 Thu, 27 Jan 2022 14:22:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE65770D3D;
 Thu, 27 Jan 2022 14:22:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A3F601138221; Thu, 27 Jan 2022 15:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/8] qapi/commands: refactor error handling code
Date: Thu, 27 Jan 2022 15:21:57 +0100
Message-Id: <20220127142202.236638-4-armbru@redhat.com>
In-Reply-To: <20220127142202.236638-1-armbru@redhat.com>
References: <20220127142202.236638-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Move error_propagate() to if (err) and make "if (err)" block mandatory.
This is to simplify further commit, which will bring trace events
generation for QMP commands.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220126161130.3240892-3-vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst |  2 +-
 scripts/qapi/commands.py     | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index a3b5473089..feafed79b5 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1690,8 +1690,8 @@ Example::
         }
 
         retval = qmp_my_command(arg.arg1, &err);
-        error_propagate(errp, err);
         if (err) {
+            error_propagate(errp, err);
             goto out;
         }
 
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 21001bbd6b..17e5ed2414 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -74,14 +74,18 @@ def gen_call(name: str,
     ret = mcgen('''
 
     %(lhs)sqmp_%(c_name)s(%(args)s&err);
-    error_propagate(errp, err);
 ''',
                 c_name=c_name(name), args=argstr, lhs=lhs)
-    if ret_type:
-        ret += mcgen('''
+
+    ret += mcgen('''
     if (err) {
+        error_propagate(errp, err);
         goto out;
     }
+''')
+
+    if ret_type:
+        ret += mcgen('''
 
     qmp_marshal_output_%(c_name)s(retval, ret, errp);
 ''',
-- 
2.31.1


