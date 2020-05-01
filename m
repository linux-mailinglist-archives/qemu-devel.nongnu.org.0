Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F81C1DC7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 21:21:17 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUbDo-00056K-9l
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 15:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jUb8A-0006kD-Jn
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:15:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jUb89-0000Aj-Ue
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:15:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22912
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jUb89-0000A4-EU
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588360524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EXg3g0TJQ0fzkN/YF/vUs7KPqWl/4bai/hbrgPx4Kw=;
 b=PnUxdZKeuTfetF4QnpWq/u1pfZ6U/u+645Ar5Kjt1sBN1M3AZpMbPTOv3aJH63eJ2oC2BX
 mDSygKUMW8/RVjAUQmOQ0Y8HjAeeak6Iz/3nYzpps76hI6zNLcoQPWq8TJzWJ2V88T0xNy
 ylCVMRpiGEFAenYPpZUMDMBlyugSxXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-C1D59UdIPb2edws58G-W0Q-1; Fri, 01 May 2020 15:15:22 -0400
X-MC-Unique: C1D59UdIPb2edws58G-W0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 196AFA0C13;
 Fri,  1 May 2020 19:15:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-191.ams2.redhat.com
 [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D04E910013BD;
 Fri,  1 May 2020 19:15:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, yavrahami@paloaltonetworks.com,
 mszeredi@redhat.com, mreitz@redhat.com
Subject: [PULL 6/6] virtiofsd: drop all capabilities in the wait parent process
Date: Fri,  1 May 2020 20:15:00 +0100
Message-Id: <20200501191500.126432-7-dgilbert@redhat.com>
In-Reply-To: <20200501191500.126432-1-dgilbert@redhat.com>
References: <20200501191500.126432-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 08:22:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

From: Stefan Hajnoczi <stefanha@redhat.com>

All this process does is wait for its child.  No capabilities are
needed.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index e49650b63d..3ba1d90984 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2530,6 +2530,17 @@ static void print_capabilities(void)
     printf("}\n");
 }
=20
+/*
+ * Drop all Linux capabilities because the wait parent process only needs =
to
+ * sit in waitpid(2) and terminate.
+ */
+static void setup_wait_parent_capabilities(void)
+{
+    capng_setpid(syscall(SYS_gettid));
+    capng_clear(CAPNG_SELECT_BOTH);
+    capng_apply(CAPNG_SELECT_BOTH);
+}
+
 /*
  * Move to a new mount, net, and pid namespaces to isolate this process.
  */
@@ -2563,6 +2574,8 @@ static void setup_namespaces(struct lo_data *lo, stru=
ct fuse_session *se)
         pid_t waited;
         int wstatus;
=20
+        setup_wait_parent_capabilities();
+
         /* The parent waits for the child */
         do {
             waited =3D waitpid(child, &wstatus, 0);
--=20
2.26.2


