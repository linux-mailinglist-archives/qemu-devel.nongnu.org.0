Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48223476CB3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:00:33 +0100 (CET)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmcq-0005gt-A8
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:00:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUX-0000lP-01
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUT-0004CW-4k
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twiUCk0v22AusBPtAVZ2Kfzu31gmOTTHEElXCa/XEew=;
 b=DiCC5oENzaGgPPKrXDH/K9R0IA1JcV0u8ut7HBhQLcsBeaQHlyqkYZjQjWUavvpxYYfVHc
 rBA12gyySTV6nK9vHUHHJyi1cS+ZeT/ztGcxoFkDVteuFc9z6UAGjFQmMmqDwQw+dnFuxZ
 P0qRdLJJ0CjmrG3knbYYri/b/IcKfmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-1R22rfwSMTCP_eNgO47-8w-1; Thu, 16 Dec 2021 03:51:46 -0500
X-MC-Unique: 1R22rfwSMTCP_eNgO47-8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EA6F100D682
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:45 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFF9C2C1AB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] configure: unify two case statements on $cpu
Date: Thu, 16 Dec 2021 09:51:34 +0100
Message-Id: <20211216085139.99682-6-pbonzini@redhat.com>
In-Reply-To: <20211216085139.99682-1-pbonzini@redhat.com>
References: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 67 ++++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/configure b/configure
index a774086891..65df8d02d9 100755
--- a/configure
+++ b/configure
@@ -635,32 +635,47 @@ else
 fi
 
 ARCH=
-# Normalise host CPU name and set ARCH.
+# Normalise host CPU name, set ARCH and multilib cflags
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390x|sparc64|x32|riscv)
-  ;;
-  ppc64le)
-    ARCH="ppc64"
-  ;;
+  aarch64|riscv) ;;
+  armv*b|armv*l|arm)
+    cpu="arm" ;;
+
   i386|i486|i586|i686|i86pc|BePC)
     cpu="i386"
-  ;;
+    CPU_CFLAGS="-m32" ;;
+  x32)
+    CPU_CFLAGS="-mx32" ;;
   x86_64|amd64)
     cpu="x86_64"
-  ;;
-  armv*b|armv*l|arm)
-    cpu="arm"
-  ;;
-  aarch64)
-    cpu="aarch64"
-  ;;
+    # ??? Only extremely old AMD cpus do not have cmpxchg16b.
+    # If we truly care, we should simply detect this case at
+    # runtime and generate the fallback to serial emulation.
+    CPU_CFLAGS="-m64 -mcx16" ;;
+
   mips*)
-    cpu="mips"
-  ;;
+    cpu="mips" ;;
+
+  ppc)
+    CPU_CFLAGS="-m32" ;;
+  ppc64)
+    CPU_CFLAGS="-m64" ;;
+  ppc64le)
+    ARCH="ppc64" ;;
+
+  s390)
+    CPU_CFLAGS="-m31"
+    ARCH=unknown ;;
+  s390x)
+    CPU_CFLAGS="-m64" ;;
+
   sparc|sun4[cdmuv])
     cpu="sparc"
-  ;;
+    CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
+  sparc64)
+    CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
+
   *)
     # This will result in either an error or falling back to TCI later
     ARCH=unknown
@@ -1255,24 +1270,6 @@ local_statedir="${local_statedir:-$prefix/var}"
 firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
 localedir="${localedir:-$datadir/locale}"
 
-case "$cpu" in
-    ppc) CPU_CFLAGS="-m32" ;;
-    ppc64) CPU_CFLAGS="-m64" ;;
-    sparc) CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
-    sparc64) CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
-    s390) CPU_CFLAGS="-m31" ;;
-    s390x) CPU_CFLAGS="-m64" ;;
-    i386) CPU_CFLAGS="-m32" ;;
-    x32) CPU_CFLAGS="-mx32" ;;
-
-    # ??? Only extremely old AMD cpus do not have cmpxchg16b.
-    # If we truly care, we should simply detect this case at
-    # runtime and generate the fallback to serial emulation.
-    x86_64) CPU_CFLAGS="-m64 -mcx16" ;;
-
-    # No special flags required for other host CPUs
-esac
-
 if eval test -z "\${cross_cc_$cpu}"; then
     eval "cross_cc_${cpu}=\$cc"
     cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
-- 
2.33.1



