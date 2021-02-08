Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC243140C6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:45:59 +0100 (CET)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DPy-0002F4-3x
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974P-0005aW-IX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9742-0001b0-V3
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWrusQf7vms/Kn07LD+g6+lC5FHvfnFhI3dW9a1AHS4=;
 b=dpiEt2QPKJuWUHfqec4uo13CEOt3rx7oCv6vytXauS/IsTF3MDbe1UY2W/a75wpEGfkVlq
 LPltfXUzupTDiKUeHbWX97MqgATDfHnhvPkkmklfL5X54Bn6mfD884NO5I6vzHX9D53uVH
 hOUxv3Acg42YJCSH2mzIHjVeYzBxZ8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-UwF47ELhOgWkBtOEoNSJxQ-1; Mon, 08 Feb 2021 08:58:49 -0500
X-MC-Unique: UwF47ELhOgWkBtOEoNSJxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1357685B665;
 Mon,  8 Feb 2021 13:58:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1A061007612;
 Mon,  8 Feb 2021 13:58:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4D5CA113861E; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] qapi/commands: assert arg_type is not None
Date: Mon,  8 Feb 2021 14:58:31 +0100
Message-Id: <20210208135846.3707170-2-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When boxed is True, expr.py asserts that we must have
arguments. Ultimately, this should mean that if boxed is True that
arg_type should be defined. Mypy cannot infer this, and does not support
'stateful' type inference, e.g.:

```
if x:
    assert y is not None

...

if x:
    y.etc()
```

does not work, because mypy does not statefully remember the conditional
assertion in the second block. Help mypy out by creating a new local
that it can track more easily.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-2-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/commands.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 50978090b4..71744f48a3 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -126,6 +126,9 @@ def gen_marshal(name: str,
                 boxed: bool,
                 ret_type: Optional[QAPISchemaType]) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
+    if have_args:
+        assert arg_type is not None
+        arg_type_c_name = arg_type.c_name()
 
     ret = mcgen('''
 
@@ -147,7 +150,7 @@ def gen_marshal(name: str,
         ret += mcgen('''
     %(c_name)s arg = {0};
 ''',
-                     c_name=arg_type.c_name())
+                     c_name=arg_type_c_name)
 
     ret += mcgen('''
 
@@ -163,7 +166,7 @@ def gen_marshal(name: str,
         ok = visit_check_struct(v, errp);
     }
 ''',
-                     c_arg_type=arg_type.c_name())
+                     c_arg_type=arg_type_c_name)
     else:
         ret += mcgen('''
     ok = visit_check_struct(v, errp);
@@ -193,7 +196,7 @@ out:
         ret += mcgen('''
     visit_type_%(c_arg_type)s_members(v, &arg, NULL);
 ''',
-                     c_arg_type=arg_type.c_name())
+                     c_arg_type=arg_type_c_name)
 
     ret += mcgen('''
     visit_end_struct(v, NULL);
-- 
2.26.2


