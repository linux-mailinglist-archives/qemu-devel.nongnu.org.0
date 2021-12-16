Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16296476CC3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:03:34 +0100 (CET)
Received: from localhost ([::1]:49200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmfl-0000mH-88
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:03:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUQ-0000aU-Fy
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUO-0004Bb-Mm
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=my0xZH1OyhR9sJGDqQWYbETpzZlQgeLL8kevRMBdtgo=;
 b=PCYHUPlvXiYxKbJlu8APWvkYCX/souhbS76YysXV/aHraI+LGyQiG+tG/jOzvieEumprEl
 S96F/INn2GX5L2L/VsetaVpCdO9HrhtQT0RAHUkvwcfBp5qKPwfkHrVd6aK4lFgn0fJqdW
 c0mftAVuonlJsNBToxLLnYBym4E1+qQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-pvIRLCoxOWifZtkY6HdG1w-1; Thu, 16 Dec 2021 03:51:46 -0500
X-MC-Unique: pvIRLCoxOWifZtkY6HdG1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2516719253C7
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:46 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9862E2C1AB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:45 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/10] configure: unify ppc64 and ppc64le
Date: Thu, 16 Dec 2021 09:51:35 +0100
Message-Id: <20211216085139.99682-7-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The only difference between the two, as far as either configure or
Meson are concerned, is the default endianness of the compiler.

For tests/tcg, specify the endianness explicitly on the command line;
for configure, do the same so that it is possible to have --cpu=ppc64le
on a bigendian system or vice versa.  Apart from this, cpu=ppc64le can
be normalized to ppc64 also in configure and not just in the meson
cross file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 10 ++++------
 tests/tcg/configure.sh |  4 +++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 65df8d02d9..741ff99f4f 100755
--- a/configure
+++ b/configure
@@ -660,9 +660,10 @@ case "$cpu" in
   ppc)
     CPU_CFLAGS="-m32" ;;
   ppc64)
-    CPU_CFLAGS="-m64" ;;
+    CPU_CFLAGS="-m64 -mbig" ;;
   ppc64le)
-    ARCH="ppc64" ;;
+    cpu="ppc64"
+    CPU_CFLAGS="-m64 -mlittle" ;;
 
   s390)
     CPU_CFLAGS="-m31"
@@ -3737,7 +3738,7 @@ if test "$linux" = "yes" ; then
   i386|x86_64|x32)
     linux_arch=x86
     ;;
-  ppc|ppc64|ppc64le)
+  ppc|ppc64)
     linux_arch=powerpc
     ;;
   s390x)
@@ -3919,9 +3920,6 @@ if test "$skip_meson" = no; then
         x86_64|x32)
             echo "cpu_family = 'x86_64'" >> $cross
             ;;
-        ppc64le)
-            echo "cpu_family = 'ppc64'" >> $cross
-            ;;
         *)
             echo "cpu_family = '$ARCH'" >> $cross
             ;;
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 9b76f58258..9ef913df5b 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -64,7 +64,9 @@ fi
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
-: ${cross_cc_ppc64le="powerpc64le-linux-gnu-gcc"}
+: ${cross_cc_cflags_ppc64="-m64 -mbig"}
+: ${cross_cc_ppc64le="$cross_cc_ppc64"}
+: ${cross_cc_cflags_ppc64le="-m64 -mlittle"}
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-- 
2.33.1



