Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F4154DFF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:34:39 +0100 (CET)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izonG-0000Ps-NR
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izoaP-0000BV-73
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:21:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izoaN-0004uN-IH
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:21:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37247
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izoaN-0004mv-E1
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fo6pn+rdUmyDgQyqiqx0zR9MFYzcbJ9J/sBVzIJLTGI=;
 b=hcLksx3nIePmEwCS1ZH+LFhmnIDtH2lwPRQBcHnB7M8CstUNdBmx5+68D8qy24ATk74bM/
 5ylT5lD94npyirR1Zf6aE6NYbL4CmgwkE9zQmrwMpQCJBlV+NGIxVa3PJBB6s7/13efeoA
 HD3T2e2sLCoBhSOV3lPPNEP07xSJT9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-2ve50yDKNgKi60r2QKaVVA-1; Thu, 06 Feb 2020 16:21:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32EF72F60
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 21:21:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF1E060BEC;
 Thu,  6 Feb 2020 21:21:03 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/46] tests/acceptance/virtio_check_params: Improve exception
 logging
Date: Thu,  6 Feb 2020 22:19:09 +0100
Message-Id: <20200206211936.17098-20-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 2ve50yDKNgKi60r2QKaVVA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Message-Id: <20200129212345.20547-18-philmd@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/virtio_check_params.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/vir=
tio_check_params.py
index 5458573138..270f69d092 100755
--- a/tests/acceptance/virtio_check_params.py
+++ b/tests/acceptance/virtio_check_params.py
@@ -77,8 +77,12 @@ class VirtioMaxSegSettingsCheck(Test):
             vm.set_machine(mt["name"])
             for s in VM_DEV_PARAMS[dev_type_name]:
                 vm.add_args(s)
-            vm.launch()
-            query_ok, props, error =3D self.query_virtqueue(vm, dev_type_n=
ame)
+            try:
+                vm.launch()
+                query_ok, props, error =3D self.query_virtqueue(vm, dev_ty=
pe_name)
+            except:
+                query_ok =3D False
+                error =3D sys.exc_info()[0]
=20
         if not query_ok:
             self.fail('machine type {0}: {1}'.format(mt['name'], error))
--=20
2.21.1


