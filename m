Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD371A10F7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 18:06:57 +0200 (CEST)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLqka-0000CV-PL
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 12:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ovoshcha@redhat.com>) id 1jLqax-0004vt-8y
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ovoshcha@redhat.com>) id 1jLqaw-0002RR-9Y
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:56:59 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47243
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ovoshcha@redhat.com>) id 1jLqaw-0002QM-1K
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586275017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OM2TK08DprDmua1hryjviamFXGvjxXVAx44sc++ybd4=;
 b=Sj+iXLV6AipBFk2U+56NL5UhBa+uiMflT0kAZf/cWAsDHvX8hQGXADChroXbm+pEYI98gD
 Mhji4VuHkWtZ21oGZY8OCG481/erYpfMMNKyA11TcsP7xPnKjKvD2hWRj2uR+ExY2ruyD4
 seGBl4XMxMq2T69h78iWnEnJDbFYYgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-owTViyVuNkmvPDOnxE8zZQ-1; Tue, 07 Apr 2020 11:56:55 -0400
X-MC-Unique: owTViyVuNkmvPDOnxE8zZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6035A1902EA0
 for <qemu-devel@nongnu.org>; Tue,  7 Apr 2020 15:56:54 +0000 (UTC)
Received: from kh066.redhat.com (ovpn-114-200.ams2.redhat.com [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C59A75DA7B;
 Tue,  7 Apr 2020 15:56:52 +0000 (UTC)
From: Oksana Vohchana <ovoshcha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/3] Acceptance test: provides to use RDMA transport for
 migration test
Date: Tue,  7 Apr 2020 18:56:42 +0300
Message-Id: <20200407155642.10716-4-ovoshcha@redhat.com>
In-Reply-To: <20200407155642.10716-1-ovoshcha@redhat.com>
References: <20200407155642.10716-1-ovoshcha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: ovoshcha@redhat.com, philmd@redhat.com, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds test for RDMA migration check

Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
---
 tests/acceptance/migration.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index 1c3a684395..99563ae850 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -120,3 +120,15 @@ class Migration(Test):
         """
         free_port =3D self._get_free_port()
         dest_uri =3D 'exec:nc -l localhost %u' % free_port
+
+    @skipUnless(get_rdma_status(), 'RDMA service is disabled or not instal=
led')
+    @skipUnless(get_interface_rdma(), 'RDMA interface not configured')
+    def test_migration_with_rdma_localhost(self):
+        iface =3D get_interface_rdma()
+        ip =3D get_ip_rdma(iface)
+        if ip:
+            free_port =3D self._get_free_port(address=3Dip[0])
+        else:
+            self.cancel("Ip address doesn't configured properly on interfa=
ce:%s" % iface)
+        dest_uri =3D 'rdma:%s:%u' % (ip, free_port)
+        self.do_migrate(dest_uri)
--=20
2.21.1


