Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D2143D89
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:00:44 +0100 (CET)
Received: from localhost ([::1]:53446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itt99-00081e-85
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51865)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itseC-0000Jf-Bg
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itse8-0003I1-Fv
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:44 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44937
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itse8-0003HN-BL
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhyW5z+VaszQlDaA17fYn0il9TBlWPtFWVYu+Yolavw=;
 b=Jcx9Puv4NpxGK/nD1KcrxOM9ntHreA8Yl4666sjBdPygWHoyBOyeysz1leoonzzAlErOzR
 1Cnrq+0I9hzWIrfN30HXdPn8kzbQoZcySfy6tw/D21RiHeDRt4EBo1mSNc+TNiYpsxyXgX
 HZug1Q2J52X7USkwhyjsfUprRG7nVpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-3ZoZusIDMs6m_meGbDmGmg-1; Tue, 21 Jan 2020 07:28:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B7B98010C5;
 Tue, 21 Jan 2020 12:28:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C85660BE0;
 Tue, 21 Jan 2020 12:28:34 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 049/109] virtiofsd: move to an empty network namespace
Date: Tue, 21 Jan 2020 12:23:33 +0000
Message-Id: <20200121122433.50803-50-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3ZoZusIDMs6m_meGbDmGmg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

If the process is compromised there should be no network access.  Use an
empty network namespace to sandbox networking.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index e6ecf95e31..0d061de438 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1943,6 +1943,19 @@ static void print_capabilities(void)
     printf("}\n");
 }
=20
+/*
+ * Called after our UNIX domain sockets have been created, now we can move=
 to
+ * an empty network namespace to prevent TCP/IP and other network activity=
 in
+ * case this process is compromised.
+ */
+static void setup_net_namespace(void)
+{
+    if (unshare(CLONE_NEWNET) !=3D 0) {
+        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWNET): %m\n");
+        exit(1);
+    }
+}
+
 /* This magic is based on lxc's lxc_pivot_root() */
 static void setup_pivot_root(const char *source)
 {
@@ -2034,6 +2047,7 @@ static void setup_mount_namespace(const char *source)
  */
 static void setup_sandbox(struct lo_data *lo)
 {
+    setup_net_namespace();
     setup_mount_namespace(lo->source);
 }
=20
--=20
2.24.1


