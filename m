Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713D345B3E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:46:51 +0100 (CET)
Received: from localhost ([::1]:39892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdcg-0001Ut-19
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWl-0001SO-HN
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWg-00020I-KW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbTrKaxux7k7a5MgrfvlzrPS24nvMJC7i8ICsJHisPw=;
 b=C68gY0bKAugFuPKxnO0YJcc+JZ1WVtPFfngJauKPZLawP68mc8APZf7ng/7WeCE8NM0PJe
 N/xihTQ39/w3iBZm8kWjgAg+ympxUc/Oof4Srck0QD+LF/I+pK4wEkGAzxDnTAYY1yosuf
 dWuxcJoaPGNE07fKLjfuQCWrNyG2Z4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-zD_zJSAeOdyc87_6pmFx_Q-1; Tue, 23 Mar 2021 05:40:35 -0400
X-MC-Unique: zD_zJSAeOdyc87_6pmFx_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 513E687A83A;
 Tue, 23 Mar 2021 09:40:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B90B860BD8;
 Tue, 23 Mar 2021 09:40:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE3531132719; Tue, 23 Mar 2021 10:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/28] qapi: Fix to reject optional members with reserved names
Date: Tue, 23 Mar 2021 10:40:04 +0100
Message-Id: <20210323094025.3569441-8-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check_type() fails to reject optional members with reserved names,
because it neglects to strip off the leading '*'.  Fix that.

The stripping in check_name_str() is now useless.  Drop.

Also drop the "no leading '*'" assertion, because valid_name.match()
ensures it can't fail.

Fixes: 9fb081e0b98409556d023c7193eeb68947cd1211
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py                     |  9 ++++-----
 tests/qapi-schema/reserved-member-u.err  |  2 ++
 tests/qapi-schema/reserved-member-u.json |  1 -
 tests/qapi-schema/reserved-member-u.out  | 14 --------------
 4 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 2fcaaa2497..cf09fa9fd3 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -34,12 +34,10 @@ def check_name_is_str(name, info, source):
 
 
 def check_name_str(name, info, source,
-                   allow_optional=False, enum_member=False,
+                   enum_member=False,
                    permit_upper=False):
     membername = name
 
-    if allow_optional and name.startswith('*'):
-        membername = name[1:]
     # Enum members can start with a digit, because the generated C
     # code always prefixes it with the enum name
     if enum_member and membername[0].isdigit():
@@ -52,7 +50,6 @@ def check_name_str(name, info, source,
     if not permit_upper and name.lower() != name:
         raise QAPISemError(
             info, "%s uses uppercase in name" % source)
-    assert not membername.startswith('*')
 
 
 def check_defn_name_str(name, info, meta):
@@ -171,8 +168,10 @@ def check_type(value, info, source,
     # value is a dictionary, check that each member is okay
     for (key, arg) in value.items():
         key_source = "%s member '%s'" % (source, key)
+        if key.startswith('*'):
+            key = key[1:]
         check_name_str(key, info, key_source,
-                       allow_optional=True, permit_upper=permit_upper)
+                       permit_upper=permit_upper)
         if c_name(key, False) == 'u' or c_name(key, False).startswith('has_'):
             raise QAPISemError(info, "%s uses reserved name" % key_source)
         check_keys(arg, info, key_source, ['type'], ['if', 'features'])
diff --git a/tests/qapi-schema/reserved-member-u.err b/tests/qapi-schema/reserved-member-u.err
index e69de29bb2..b58e599a00 100644
--- a/tests/qapi-schema/reserved-member-u.err
+++ b/tests/qapi-schema/reserved-member-u.err
@@ -0,0 +1,2 @@
+reserved-member-u.json: In struct 'Oops':
+reserved-member-u.json:7: 'data' member '*u' uses reserved name
diff --git a/tests/qapi-schema/reserved-member-u.json b/tests/qapi-schema/reserved-member-u.json
index 15005abb09..2bfb8f59b6 100644
--- a/tests/qapi-schema/reserved-member-u.json
+++ b/tests/qapi-schema/reserved-member-u.json
@@ -4,5 +4,4 @@
 # This is true even for non-unions, because it is possible to convert a
 # struct to flat union while remaining backwards compatible in QMP.
 # TODO - we could munge the member name to 'q_u' to avoid the collision
-# BUG: not rejected
 { 'struct': 'Oops', 'data': { '*u': 'str' } }
diff --git a/tests/qapi-schema/reserved-member-u.out b/tests/qapi-schema/reserved-member-u.out
index 6a3705518b..e69de29bb2 100644
--- a/tests/qapi-schema/reserved-member-u.out
+++ b/tests/qapi-schema/reserved-member-u.out
@@ -1,14 +0,0 @@
-module ./builtin
-object q_empty
-enum QType
-    prefix QTYPE
-    member none
-    member qnull
-    member qnum
-    member qstring
-    member qdict
-    member qlist
-    member qbool
-module reserved-member-u.json
-object Oops
-    member u: str optional=True
-- 
2.26.3


