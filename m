Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAAC16299B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 16:42:01 +0100 (CET)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j450a-00005c-Oa
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 10:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j44zX-0006iv-RR
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 10:40:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j44zW-0001ge-Rr
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 10:40:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j44zW-0001g0-OK
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 10:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582040454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYdW57Gi4VWogYvFlCc6iuJ0jzLDS0PDclWM8DpwXMQ=;
 b=Z/O1ipb2GHOK2W/+WbOcDiKW/zkLYZKFZfPBAUp5jOK7tinFf1UciVKLFGQBoC1qBPn+oz
 Em0WgoorUFP9fmEmIRxn5PCItc1eNM9ecCyK6W3E5PTG1LcxwPeGeK0qe0hSjRY+jzbCsM
 xROKM9yFXZurAyy14gva/6qlpDUbzyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-C2moIUXeMQGqdp0oiNDJpg-1; Tue, 18 Feb 2020 10:40:48 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EE9D800EB2;
 Tue, 18 Feb 2020 15:40:47 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1BF287056;
 Tue, 18 Feb 2020 15:40:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/4] vl: Initialise main loop earlier
Date: Tue, 18 Feb 2020 16:40:34 +0100
Message-Id: <20200218154036.28562-3-kwolf@redhat.com>
In-Reply-To: <20200218154036.28562-1-kwolf@redhat.com>
References: <20200218154036.28562-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: C2moIUXeMQGqdp0oiNDJpg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: kwolf@redhat.com, marcandre.lureau@gmail.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use qemu_aio_context in the monitor
initialisation.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 vl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index 794f2e5733..98bc51e089 100644
--- a/vl.c
+++ b/vl.c
@@ -2894,6 +2894,11 @@ int main(int argc, char **argv, char **envp)
     runstate_init();
     precopy_infrastructure_init();
     postcopy_infrastructure_init();
+
+    if (qemu_init_main_loop(&main_loop_err)) {
+        error_report_err(main_loop_err);
+        exit(1);
+    }
     monitor_init_globals();
=20
     if (qcrypto_init(&err) < 0) {
@@ -3811,11 +3816,6 @@ int main(int argc, char **argv, char **envp)
     qemu_unlink_pidfile_notifier.notify =3D qemu_unlink_pidfile;
     qemu_add_exit_notifier(&qemu_unlink_pidfile_notifier);
=20
-    if (qemu_init_main_loop(&main_loop_err)) {
-        error_report_err(main_loop_err);
-        exit(1);
-    }
-
 #ifdef CONFIG_SECCOMP
     olist =3D qemu_find_opts_err("sandbox", NULL);
     if (olist) {
--=20
2.20.1


