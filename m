Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B740E26529
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 15:52:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTRfm-0002bD-Uw
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 09:52:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTRad-0006sU-Hi
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTRac-0002cP-Ko
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hTRac-0002bO-Eq
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3DA95D608
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 13:47:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 961BA619B4
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 13:47:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DCFBF1132B38; Wed, 22 May 2019 15:47:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 15:47:26 +0200
Message-Id: <20190522134726.19225-6-armbru@redhat.com>
In-Reply-To: <20190522134726.19225-1-armbru@redhat.com>
References: <20190522134726.19225-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 22 May 2019 13:47:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 5/5] cutils: Simplify how parse_uint() checks
 for whitespace
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_isspace() so we don't have to cast to unsigned char.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190514180311.16028-7-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 util/cutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index d682c90901..9aacc422ca 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -683,7 +683,7 @@ int parse_uint(const char *s, unsigned long long *val=
ue, char **endptr,
     }
=20
     /* make sure we reject negative numbers: */
-    while (isspace((unsigned char)*s)) {
+    while (qemu_isspace(*s)) {
         s++;
     }
     if (*s =3D=3D '-') {
--=20
2.17.2


