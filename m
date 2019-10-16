Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81B5D9A1F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 21:32:55 +0200 (CEST)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKp2U-0000qe-RI
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 15:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iKouq-0001UT-I3
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 15:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iKoup-0002Sa-Fw
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 15:25:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34688)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1iKoun-0002Qv-7Y; Wed, 16 Oct 2019 15:24:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74C0010DCC94;
 Wed, 16 Oct 2019 19:24:56 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1515C60852;
 Wed, 16 Oct 2019 19:24:55 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] image-fuzzer: Use %r for all fiels at Field.__repr__()
Date: Wed, 16 Oct 2019 16:24:25 -0300
Message-Id: <20191016192430.25098-6-ehabkost@redhat.com>
In-Reply-To: <20191016192430.25098-1-ehabkost@redhat.com>
References: <20191016192430.25098-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Wed, 16 Oct 2019 19:24:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes the formatting code simpler, and safer if we change
the type of self.value from str to bytes.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 tests/image-fuzzer/qcow2/layout.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/image-fuzzer/qcow2/layout.py b/tests/image-fuzzer/qcow=
2/layout.py
index 6501c9fd4b..0adcbd448d 100644
--- a/tests/image-fuzzer/qcow2/layout.py
+++ b/tests/image-fuzzer/qcow2/layout.py
@@ -53,8 +53,8 @@ class Field(object):
         return iter([self.fmt, self.offset, self.value, self.name])
=20
     def __repr__(self):
-        return "Field(fmt=3D'%s', offset=3D%d, value=3D%s, name=3D%s)" %=
 \
-            (self.fmt, self.offset, str(self.value), self.name)
+        return "Field(fmt=3D%r, offset=3D%r, value=3D%r, name=3D%r)" % \
+            (self.fmt, self.offset, self.value, self.name)
=20
=20
 class FieldsList(object):
--=20
2.21.0


