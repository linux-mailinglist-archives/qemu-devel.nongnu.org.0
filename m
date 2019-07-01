Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC51CE85
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:06:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQboQ-0004Bt-4U
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:06:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQbln-00030p-Rk
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQblm-0002Yo-Uq
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48911)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQblm-0002YJ-Ni
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17BF334CF
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 18:03:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83B805EDE1;
	Tue, 14 May 2019 18:03:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F0CCB113861C; Tue, 14 May 2019 20:03:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 20:03:07 +0200
Message-Id: <20190514180311.16028-3-armbru@redhat.com>
In-Reply-To: <20190514180311.16028-1-armbru@redhat.com>
References: <20190514180311.16028-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 14 May 2019 18:03:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/6] tests/vhost-user-bridge: Fix misuse of
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
Cc: thuth@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vubr_set_host() passes char values to isdigit().  Undefined behavior
when the value is negative.

Fix by using qemu_isdigit() instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/vhost-user-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 0033b61f2e..d70b107ebc 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -645,7 +645,7 @@ vubr_host_notifier_setup(VubrDev *dev)
 static void
 vubr_set_host(struct sockaddr_in *saddr, const char *host)
 {
-    if (isdigit(host[0])) {
+    if (qemu_isdigit(host[0])) {
         if (!inet_aton(host, &saddr->sin_addr)) {
             fprintf(stderr, "inet_aton() failed.\n");
             exit(1);
-- 
2.17.2


