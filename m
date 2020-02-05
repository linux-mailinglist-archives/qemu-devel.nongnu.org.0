Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5415398F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 21:34:28 +0100 (CET)
Received: from localhost ([::1]:56058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izRNS-0008NA-K5
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 15:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34733)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1izRM8-0006iU-Rv
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 15:33:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1izRM7-0004Ci-CI
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 15:33:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46228
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1izRM7-0004Ay-8J
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 15:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580934782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2uGlt86COKYUDhQFWse6Ly3NxnMC67p7pADYGwbJQI=;
 b=SXPSG/Ja1F20BdF5vlWu0eDFvojeS8Rsp2HMnhfyKKULS3VX8N2c506WNZkCkKzjesKPHO
 d9y5QMY0szusDYLS+Nb4uEZ/dh/Xr7ZxnWin9LUREImIM4ZmcjczbdGR6Zgch+Fiw6oFSz
 ZiaUCDNqAmEGYvqXuoMu8qocDAkW7Hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-L3N2HlyWNy2oB4eabLWiPw-1; Wed, 05 Feb 2020 15:33:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48E978010F8;
 Wed,  5 Feb 2020 20:33:00 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C1A810013A1;
 Wed,  5 Feb 2020 20:32:59 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/8] tests/acceptance: avocado_qemu: Refactor the handler
 of 'machine' parameter
Date: Wed,  5 Feb 2020 15:32:49 -0500
Message-Id: <20200205203250.30526-8-wainersm@redhat.com>
In-Reply-To: <20200205203250.30526-1-wainersm@redhat.com>
References: <20200205203250.30526-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: L3N2HlyWNy2oB4eabLWiPw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: drjones@redhat.com, ehabkost@redhat.com, philmd@redhat.com,
 thuth@redhat.com, crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Test._param_to_vm_args variable contain VM arguments that should be add=
ed
at launch which were originated from test parameters. Use this variable
to set -M from 'machine' parameter as well.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py
index c83a75ccbc..443ac02aff 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -120,6 +120,8 @@ class Test(avocado.Test):
=20
         self.machine =3D self.params.get('machine',
                                        default=3Dself._get_unique_tag_val(=
'machine'))
+        if self.machine:
+            self._param_to_vm_args.extend(['-M', self.machine])
=20
         default_qemu_bin =3D pick_default_qemu_bin(arch=3Dself.arch)
         self.qemu_bin =3D self.params.get('qemu_bin',
@@ -162,8 +164,6 @@ class Test(avocado.Test):
             name =3D str(uuid.uuid4())
         if self._vms.get(name) is None:
             self._vms[name] =3D self._new_vm(*args)
-            if self.machine is not None:
-                self._vms[name].set_machine(self.machine)
         return self._vms[name]
=20
     def tearDown(self):
--=20
2.24.1


