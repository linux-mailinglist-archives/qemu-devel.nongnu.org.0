Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B314D29E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 22:36:54 +0100 (CET)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwv13-00012g-8W
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 16:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwupY-0006PT-Kj
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:25:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwupX-0001Tq-LP
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:25:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21055
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwupX-0001TA-Hg
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580333099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2Z6BCJcZiEurK9sjcERsyQFzsZbV08xWNkNQA9K3uI=;
 b=MnHOdRT4Fdbg94/Hf3FhD2GkuixLGfyqhGUmUTv8K6YI7DpI0QKEtzk2BMys7qXzYzyk9c
 n683PYWowk5k+qkWroy9z4pH5Rb4QXT1UvwNk1zEgI92CpijB8HRzLQpGt8R/0kI1XMXBR
 PwNRzTX8pDP9umOvUZckyywwtQWxxCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-yTA1Rn88NJyuxxv_hi61lw-1; Wed, 29 Jan 2020 16:24:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F2B1DB60;
 Wed, 29 Jan 2020 21:24:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 625FA60BF3;
 Wed, 29 Jan 2020 21:24:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/29] tests/acceptance/virtio_check_params: Improve
 exception logging
Date: Wed, 29 Jan 2020 22:23:33 +0100
Message-Id: <20200129212345.20547-18-philmd@redhat.com>
In-Reply-To: <20200129212345.20547-1-philmd@redhat.com>
References: <20200129212345.20547-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: yTA1Rn88NJyuxxv_hi61lw-1
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/virtio_check_params.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/vir=
tio_check_params.py
index 4a417b8ef5..51a2dd76e8 100755
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


