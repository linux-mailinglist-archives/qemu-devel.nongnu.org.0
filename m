Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8F15D9DC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 15:56:37 +0100 (CET)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2cOS-0003KY-4u
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 09:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ovoshcha@redhat.com>) id 1j2cKq-0007Qn-HC
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:52:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ovoshcha@redhat.com>) id 1j2cKp-0006Nd-Kk
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:52:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58912
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ovoshcha@redhat.com>) id 1j2cKp-0006NK-Gs
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581691971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5CB81CUm1jCyBDHkqv6YGFNAjzXz83NbCC2BzCNJTI=;
 b=bCOpEY5ssvgXrWZT0AWHE8+/UromN8+7YhybknT7SGufEJ4idXv6Egam5BsG4WZMxAuPGZ
 gWmEmi6SkxtJfwDTuLtuDjj7kb6r+FlRfC+k2si0SMTNVeGeCk8wnFPMYkvZWXx+6Le7m3
 hSBGQLzV7YPju6oIUiSXCzCsyb+JaVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-SB4wwgetMIWYhzE4Rhs3mA-1; Fri, 14 Feb 2020 09:52:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5A60100550E
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 14:52:48 +0000 (UTC)
Received: from kh066.redhat.com (ovpn-117-55.ams2.redhat.com [10.36.117.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FEB1790DD;
 Fri, 14 Feb 2020 14:52:47 +0000 (UTC)
From: Oksana Vohchana <ovoshcha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/4] Acceptance test: provides to use RDMA transport for
 migration
Date: Fri, 14 Feb 2020 16:52:35 +0200
Message-Id: <20200214145235.4378-5-ovoshcha@redhat.com>
In-Reply-To: <20200214145235.4378-1-ovoshcha@redhat.com>
References: <20200214145235.4378-1-ovoshcha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: SB4wwgetMIWYhzE4Rhs3mA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: philmd@redhat.com, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds test for RDMA migration check

Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
---
 tests/acceptance/migration.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index bbd88f8dda..c0a3031e67 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -94,3 +94,11 @@ class Migration(Test):
         dest_uri =3D 'exec:nc -l localhost %u' % free_port
         src_uri =3D 'exec:nc localhost %u' % free_port
         self.do_migrate(dest_uri, src_uri)
+
+    @skipUnless(_if_rdma_enable(None), "Unit rdma.service could not be fou=
nd")
+    @skipUnless(_get_ip_rdma(None), 'RoCE(RDMA) service or interface not c=
onfigured')
+    def test_migration_with_rdma_localhost(self):
+        ip =3D self._get_ip_rdma()
+        free_port =3D self._get_free_port(address=3Dip)
+        dest_uri =3D 'rdma:%s:%u' % (ip, free_port)
+        self.do_migrate(dest_uri)
--=20
2.21.1


