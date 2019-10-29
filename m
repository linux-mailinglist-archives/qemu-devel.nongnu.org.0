Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30072E85DF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 11:40:58 +0100 (CET)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPOvp-00005T-7d
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 06:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iPOeK-0005ez-16
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iPOeI-0001KK-Rp
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:22:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53238
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iPOeI-0001Jw-OC
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572344570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2eThPq9BJLPZf9L3adB8f7juJrJrRykI/QSBFmzWMY=;
 b=GlG/9jLXoXIpgd78ukeHDImfjoasipRlkSKpAUct7h2rqfDviQBoLpWgYYVC/ZBn8PzLeF
 kg4vl/5M3MbJsVh3GaFVnf9yBJGWBGJanY9BcZtATyd66QzYp3b7IP/KAP54b8Y58VslX6
 bfLPWZnXcX9ihKwNME9jbkKlPIPYzno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-4TkxXanhPUmRB2GyAvqm1g-1; Tue, 29 Oct 2019 06:22:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FCAA180496F
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2019 10:22:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1033C5D9C3
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2019 10:22:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA5991132741; Tue, 29 Oct 2019 11:22:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/19] qapi: Fold normalize_features() into check_features()
Date: Tue, 29 Oct 2019 11:22:24 +0100
Message-Id: <20191029102228.20740-16-armbru@redhat.com>
In-Reply-To: <20191029102228.20740-1-armbru@redhat.com>
References: <20191029102228.20740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 4TkxXanhPUmRB2GyAvqm1g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check_features() is always called together with normalize_features():
the former in check_struct() and check_command(), the latter in their
caller check_exprs().  Fold the latter into the former.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191024110237.30963-16-armbru@redhat.com>
---
 scripts/qapi/expr.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index aa0fe69f99..66014e2bb2 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -173,17 +173,13 @@ def check_type(value, info, source,
         check_type(arg['type'], info, key_source, allow_array=3DTrue)
=20
=20
-def normalize_features(features):
-    if isinstance(features, list):
-        features[:] =3D [f if isinstance(f, dict) else {'name': f}
-                       for f in features]
-
-
 def check_features(features, info):
     if features is None:
         return
     if not isinstance(features, list):
         raise QAPISemError(info, "'features' must be an array")
+    features[:] =3D [f if isinstance(f, dict) else {'name': f}
+                   for f in features]
     for f in features:
         source =3D "'features' member"
         assert isinstance(f, dict)
@@ -347,7 +343,6 @@ def check_exprs(exprs):
             check_keys(expr, info, meta,
                        ['struct', 'data'], ['base', 'if', 'features'])
             normalize_members(expr['data'])
-            normalize_features(expr.get('features'))
             check_struct(expr, info)
         elif meta =3D=3D 'command':
             check_keys(expr, info, meta,
@@ -356,7 +351,6 @@ def check_exprs(exprs):
                         'gen', 'success-response', 'allow-oob',
                         'allow-preconfig'])
             normalize_members(expr.get('data'))
-            normalize_features(expr.get('features'))
             check_command(expr, info)
         elif meta =3D=3D 'event':
             check_keys(expr, info, meta,
--=20
2.21.0


