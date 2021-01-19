Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9EC2FBF29
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:41:52 +0100 (CET)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vwt-0004un-I3
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLQ-0007fG-Pd
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLM-0005Pi-VB
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZpWSM54xsimG0B6tYdsDuXcPSLAIK/STHFzgm6mKZU=;
 b=e6JyKjteMxVAFYeRBjOHAKgz+jwrmNV61fnOYvvqUFPaodJ8BLrhnZJVBHYSTtQFpgIyNq
 ibgbfB2k1SQ46CBbiu0pf1HiD46wVnVR3kqKJkNhk3+78zDLNq6R8fvd2IxRvenfMmcvSf
 k+tH44lPXurr8zYx9YiX8l4gCGzdkUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-gGxsc5ZlM8q26Jc8P7P6Tg-1; Tue, 19 Jan 2021 13:03:01 -0500
X-MC-Unique: gGxsc5ZlM8q26Jc8P7P6Tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 437E7180A094
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:02:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C6145D9DD;
 Tue, 19 Jan 2021 18:02:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/17] qapi/commands: assert arg_type is not None
Date: Tue, 19 Jan 2021 13:02:26 -0500
Message-Id: <20210119180242.1570753-2-jsnow@redhat.com>
In-Reply-To: <20210119180242.1570753-1-jsnow@redhat.com>
References: <20210119180242.1570753-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 scripts/qapi/commands.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 50978090b44..71744f48a35 100644
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
@@ -193,7 +196,7 @@ def gen_marshal(name: str,
         ret += mcgen('''
     visit_type_%(c_arg_type)s_members(v, &arg, NULL);
 ''',
-                     c_arg_type=arg_type.c_name())
+                     c_arg_type=arg_type_c_name)
 
     ret += mcgen('''
     visit_end_struct(v, NULL);
-- 
2.26.2


