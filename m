Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3526528
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 15:52:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTRfj-0002VV-Q3
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 09:52:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTRac-0006sF-AC
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTRab-0002ap-7l
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hTRab-0002aE-0w
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B36330C1AF9
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 13:47:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC9A5426D
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 13:47:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D2BC51132BD3; Wed, 22 May 2019 15:47:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 15:47:23 +0200
Message-Id: <20190522134726.19225-3-armbru@redhat.com>
In-Reply-To: <20190522134726.19225-1-armbru@redhat.com>
References: <20190522134726.19225-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 22 May 2019 13:47:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/5] tests/vhost-user-bridge: Fix misuse of
 isdigit()
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

vubr_set_host() passes char values to isdigit().  Undefined behavior
when the value is negative.

Fix by using qemu_isdigit() instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190514180311.16028-3-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
[Missing #include "qemu-common.h" fixed]
---
 tests/vhost-user-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 0033b61f2e..5b771de7a3 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -30,6 +30,7 @@
 #define _FILE_OFFSET_BITS 64
=20
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "qemu/atomic.h"
 #include "qemu/iov.h"
 #include "standard-headers/linux/virtio_net.h"
@@ -645,7 +646,7 @@ vubr_host_notifier_setup(VubrDev *dev)
 static void
 vubr_set_host(struct sockaddr_in *saddr, const char *host)
 {
-    if (isdigit(host[0])) {
+    if (qemu_isdigit(host[0])) {
         if (!inet_aton(host, &saddr->sin_addr)) {
             fprintf(stderr, "inet_aton() failed.\n");
             exit(1);
--=20
2.17.2


