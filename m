Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9100F1158B5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 22:39:03 +0100 (CET)
Received: from localhost ([::1]:45586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idLJV-0005No-Q3
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 16:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1idLFV-0003Z8-Ta
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 16:34:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1idLFS-0001kT-GY
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 16:34:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42299
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1idLFS-0001h7-5a
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 16:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575668087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8WKxdksJcs5sQyB7B17jkULkpMdrvKUXp5o7rxqiKs=;
 b=WSdynm1E/UMLUVBCr2TRSR6Z+ExUogswjhVqUzG2mLzf4qeI5ri4qCV7CtrdbbueE6HYuy
 QVmrRKWZTxHxlDRRl9VEnidJ12R0a7pt9kNoyYPioeeYVtkzdjOiK87mzXYUZPA7T22UUH
 RsNSR3+BMd2CM44OCw9g3d0d40Abe4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-KrLq6GQTMZSrczxi1pYGMw-1; Fri, 06 Dec 2019 16:34:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 777A1800D5C;
 Fri,  6 Dec 2019 21:34:42 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD6E85C1D4;
 Fri,  6 Dec 2019 21:34:41 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] python/qemu: accel: Strengthen kvm_available() checks
Date: Fri,  6 Dec 2019 16:34:32 -0500
Message-Id: <20191206213433.11305-4-wainersm@redhat.com>
In-Reply-To: <20191206213433.11305-1-wainersm@redhat.com>
References: <20191206213433.11305-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: KrLq6GQTMZSrczxi1pYGMw-1
X-Mimecast-Spam-Score: 0
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
Cc: fam@euphon.net, ehabkost@redhat.com, alex.bennee@linaro.org,
 philmd@redhat.com, crosa@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently kvm_available() checks for the presence of kvm module
and, if target and host arches don't mismatch. This patch adds
an 3rd checking: if QEMU binary was compiled with kvm
support.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 python/qemu/accel.py | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/python/qemu/accel.py b/python/qemu/accel.py
index 746b7e68f5..9fecffb44b 100644
--- a/python/qemu/accel.py
+++ b/python/qemu/accel.py
@@ -46,9 +46,24 @@ def list_accel(qemu_bin):
     # Skip the first line which is the header.
     return [l.strip() for l in lines[1:] if l]
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


