Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307834194E6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:16:16 +0200 (CEST)
Received: from localhost ([::1]:38294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqUR-0000V5-63
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLZ-0003GN-D0
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLP-0003io-NS
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqTyOIb6ZBMcr8rJ+oxf7EFtgNWL6mFR1HQtd3y3BEE=;
 b=JA6P+2m576Mf7uNMIwzN8y/Z0j0QZJhhTNvdKMWnpomH3muskqwX165aYv3dWTJ0MkMCse
 dTSq3UPvSVw8SQReVqOZM9+xqla3IjHAsROWTc2rwvJsj2kMjehVbcLBOS9E7SpWV/NSq/
 H3Wp7QuxD2wl3f90eeW/K3caFAYUT/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-E_7boEWgM0SdKmfFF5VzHw-1; Mon, 27 Sep 2021 09:06:50 -0400
X-MC-Unique: E_7boEWgM0SdKmfFF5VzHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1585F100C665;
 Mon, 27 Sep 2021 13:06:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBEE15C23A;
 Mon, 27 Sep 2021 13:06:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78C8111385C1; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/25] qapi: Stop enforcing "type name should not end in
 'Kind'
Date: Mon, 27 Sep 2021 15:06:24 +0200
Message-Id: <20210927130647.1271533-3-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm about to convert simple unions to flat unions, then drop simple
union support.  The conversion involves making the implict enum types
explicit.  To reduce churn, I'd like to name them exactly like the
implicit types they replace.  However, these names are reserved for
the generator's use.  They won't be once simple unions are gone.  Stop
enforcing this naming rule now rather than then.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-3-armbru@redhat.com>
---
 scripts/qapi/expr.py                      | 6 +++---
 tests/qapi-schema/meson.build             | 1 -
 tests/qapi-schema/reserved-type-kind.err  | 2 --
 tests/qapi-schema/reserved-type-kind.json | 2 --
 tests/qapi-schema/reserved-type-kind.out  | 0
 5 files changed, 3 insertions(+), 8 deletions(-)
 delete mode 100644 tests/qapi-schema/reserved-type-kind.err
 delete mode 100644 tests/qapi-schema/reserved-type-kind.json
 delete mode 100644 tests/qapi-schema/reserved-type-kind.out

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 90bde501b0..91959ee79a 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -171,7 +171,7 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
       - 'event' names adhere to `check_name_upper()`.
       - 'command' names adhere to `check_name_lower()`.
       - Else, meta is a type, and must pass `check_name_camel()`.
-        These names must not end with ``Kind`` nor ``List``.
+        These names must not end with ``List``.
 
     :param name: Name to check.
     :param info: QAPI schema source file information.
@@ -187,9 +187,9 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
             permit_underscore=name in info.pragma.command_name_exceptions)
     else:
         check_name_camel(name, info, meta)
-        if name.endswith('Kind') or name.endswith('List'):
+        if name.endswith('List'):
             raise QAPISemError(
-                info, "%s name should not end in '%s'" % (meta, name[-4:]))
+                info, "%s name should not end in 'List'" % meta)
 
 
 def check_keys(value: _JSONObject,
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 6b2a4ce41a..0798e94042 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -168,7 +168,6 @@ schemas = [
   'reserved-member-q.json',
   'reserved-member-u.json',
   'reserved-member-underscore.json',
-  'reserved-type-kind.json',
   'reserved-type-list.json',
   'returns-alternate.json',
   'returns-array-bad.json',
diff --git a/tests/qapi-schema/reserved-type-kind.err b/tests/qapi-schema/reserved-type-kind.err
deleted file mode 100644
index d8fb769f9d..0000000000
--- a/tests/qapi-schema/reserved-type-kind.err
+++ /dev/null
@@ -1,2 +0,0 @@
-reserved-type-kind.json: In enum 'UnionKind':
-reserved-type-kind.json:2: enum name should not end in 'Kind'
diff --git a/tests/qapi-schema/reserved-type-kind.json b/tests/qapi-schema/reserved-type-kind.json
deleted file mode 100644
index 9ecaba12bc..0000000000
--- a/tests/qapi-schema/reserved-type-kind.json
+++ /dev/null
@@ -1,2 +0,0 @@
-# we reject types that would conflict with implicit union enum
-{ 'enum': 'UnionKind', 'data': [ 'oops' ] }
diff --git a/tests/qapi-schema/reserved-type-kind.out b/tests/qapi-schema/reserved-type-kind.out
deleted file mode 100644
index e69de29bb2..0000000000
-- 
2.31.1


