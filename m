Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D353409AB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:09:20 +0100 (CET)
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvD5-00053d-IQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMuzs-000112-Jw
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMuzh-0005jO-J9
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616082929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPKSOhD1Ya6ur4WXmt3stHKBWY92eiB8RfEjxSNFnzU=;
 b=Lx7jfzkG/x6hrYGohedIbUVgq79NMm7t2xzoLqN+NWpsFfA8YkmeQ6VcO0xiTusmj03DAz
 /+iwHUdQpIZ4WG+CXDTXIr29x7o3qoGhSSzT5Y3GK6xeeSEkZKChOu3gTYSYCqZEWNhW1i
 fE6ahaa6K3yGWbTenyxpw6R7dpThddQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-ZoaHkIItPQSuOO8vj4BFWw-1; Thu, 18 Mar 2021 11:55:24 -0400
X-MC-Unique: ZoaHkIItPQSuOO8vj4BFWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F7D88143F0;
 Thu, 18 Mar 2021 15:55:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4C85044B;
 Thu, 18 Mar 2021 15:55:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D905D11384D2; Thu, 18 Mar 2021 16:55:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/11] qapi: New -compat deprecated-input=crash
Date: Thu, 18 Mar 2021 16:55:19 +0100
Message-Id: <20210318155519.1224118-12-armbru@redhat.com>
In-Reply-To: <20210318155519.1224118-1-armbru@redhat.com>
References: <20210318155519.1224118-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Policy "crash" calls abort() when deprecated input is received.

Bugs in integration tests may mask the error from policy "reject".
Provide a larger hammer: crash outright.  Masking that seems unlikely.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/compat.json             | 3 ++-
 qapi/qmp-dispatch.c          | 1 +
 qapi/qobject-input-visitor.c | 1 +
 qemu-options.hx              | 4 +++-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/qapi/compat.json b/qapi/compat.json
index fc24a58a9e..ae3afc22df 100644
--- a/qapi/compat.json
+++ b/qapi/compat.json
@@ -11,11 +11,12 @@
 #
 # @accept: Accept silently
 # @reject: Reject with an error
+# @crash: abort() the process
 #
 # Since: 6.0
 ##
 { 'enum': 'CompatPolicyInput',
-  'data': [ 'accept', 'reject' ] }
+  'data': [ 'accept', 'reject', 'crash' ] }
 
 ##
 # @CompatPolicyOutput:
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 174ebf2793..0f7e2e48fa 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -185,6 +185,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
                       "Deprecated command %s disabled by policy",
                       command);
             goto out;
+        case COMPAT_POLICY_INPUT_CRASH:
         default:
             abort();
         }
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index bd94cf187a..04b790412e 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -676,6 +676,7 @@ static bool qobject_input_deprecated_accept(Visitor *v, const char *name,
         error_setg(errp, "Deprecated parameter '%s' disabled by policy",
                    name);
         return false;
+    case COMPAT_POLICY_INPUT_CRASH:
     default:
         abort();
     }
diff --git a/qemu-options.hx b/qemu-options.hx
index d96e05bedb..6b836f4b0d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3508,7 +3508,7 @@ DEFHEADING()
 DEFHEADING(Debug/Expert options:)
 
 DEF("compat", HAS_ARG, QEMU_OPTION_compat,
-    "-compat [deprecated-input=accept|reject][,deprecated-output=accept|hide]\n"
+    "-compat [deprecated-input=accept|reject|crash][,deprecated-output=accept|hide]\n"
     "                Policy for handling deprecated management interfaces\n",
     QEMU_ARCH_ALL)
 SRST
@@ -3519,6 +3519,8 @@ SRST
         Accept deprecated commands and arguments
     ``deprecated-input=reject``
         Reject deprecated commands and arguments
+    ``deprecated-input=crash``
+        Crash on deprecated commands and arguments
     ``deprecated-output=accept`` (default)
         Emit deprecated command results and events
     ``deprecated-output=hide``
-- 
2.26.3


