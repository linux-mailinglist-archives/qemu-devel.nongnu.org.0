Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776E6122407
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:48:38 +0100 (CET)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5in-0006mP-7d
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1ih5E2-0004Ww-4W
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 00:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1ih5E0-0004GK-Sy
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 00:16:49 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36667
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1ih5E0-0004FL-P1
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 00:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576559808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4zh81Cf/kIZ2jxA4b5dS+pBpBqgi/gEpRekYY5BdSU=;
 b=XTKkF1oAONgwP7OTvf/ar1PtqEFobubIM8wj2G4J4TTfgDK7lVvSRCIflDNOrl5c2HWis8
 4xo2SmH1aWhVjcpM8PesLXob8IhnyAHzZhnuSSLjJUXpwnwvaXs0gedTuiRCg1ssc2FytG
 cMM6aSgMJ58tN3FViXlYB0DE1e4cbng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-J7DinpNrMxyU2m3BYR1C_g-1; Tue, 17 Dec 2019 00:16:46 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0EDE8017DF;
 Tue, 17 Dec 2019 05:16:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-6.gru2.redhat.com
 [10.97.116.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 664CD19C4F;
 Tue, 17 Dec 2019 05:16:41 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/15] python/qemu: accel: Strengthen kvm_available() checks
Date: Tue, 17 Dec 2019 00:15:19 -0500
Message-Id: <20191217051521.1239-14-crosa@redhat.com>
In-Reply-To: <20191217051521.1239-1-crosa@redhat.com>
References: <20191217051521.1239-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: J7DinpNrMxyU2m3BYR1C_g-1
X-Mimecast-Spam-Score: 0
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
Cc: Fam Zheng <fam@euphon.net>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-ppc@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Currently kvm_available() checks for the presence of kvm module
and, if target and host arches don't mismatch. This patch adds
an 3rd checking: if QEMU binary was compiled with kvm
support.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20191216191438.93418-4-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/accel.py | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/python/qemu/accel.py b/python/qemu/accel.py
index 7395cee793..5fce3aa3dd 100644
--- a/python/qemu/accel.py
+++ b/python/qemu/accel.py
@@ -46,9 +46,24 @@ def list_accel(qemu_bin):
     # Skip the first line which is the header.
     return [acc.strip() for acc in out.splitlines()[1:]]
=20
-def kvm_available(target_arch=3DNone):
-    host_arch =3D os.uname()[4]
-    if target_arch and target_arch !=3D host_arch:
-        if target_arch !=3D ADDITIONAL_ARCHES.get(host_arch):
-            return False
-    return os.access("/dev/kvm", os.R_OK | os.W_OK)
+def kvm_available(target_arch=3DNone, qemu_bin=3DNone):
+    """
+    Check if KVM is available using the following heuristic:
+      - Kernel module is present in the host;
+      - Target and host arches don't mismatch;
+      - KVM is enabled in the QEMU binary.
+
+    @param target_arch (str): target architecture
+    @param qemu_bin (str): path to the QEMU binary
+    @return True if kvm is available, otherwise False.
+    """
+    if not os.access("/dev/kvm", os.R_OK | os.W_OK):
+        return False
+    if target_arch:
+        host_arch =3D os.uname()[4]
+        if target_arch !=3D host_arch:
+            if target_arch !=3D ADDITIONAL_ARCHES.get(host_arch):
+                return False
+    if qemu_bin and "kvm" not in list_accel(qemu_bin):
+        return False
+    return True
--=20
2.21.0


