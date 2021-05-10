Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B08A377D48
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:40:03 +0200 (CEST)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0WI-0003Vc-Bo
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0SJ-0001bU-AX
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0SH-0003mi-MI
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620632153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMCTi0qebaBSR+xMCe0BCntr5gyGCdYIt4o3C5cSVlI=;
 b=a9vxPQ/yp1bydliH+PLflLmv/Ob3FLJ6bEKJXYnfSpr1ycgF5JdlXwbKeY0YwHdVm7eAyY
 d8ocyPPZaiHfFkxUvYEE1hOQk0mZVAP3qZ6gkCpXO20jO9EA9BX1TV856VWpnH5gxyPVA5
 dkNXEqw6JNBAYSG1UC3uwRNT6Jj7m9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-Hmxzqn5LMDm-ED2aCFebfA-1; Mon, 10 May 2021 03:35:49 -0400
X-MC-Unique: Hmxzqn5LMDm-ED2aCFebfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 597A11006C83;
 Mon, 10 May 2021 07:35:48 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB21DE154;
 Mon, 10 May 2021 07:35:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/9] pc-bios/s390-ccw: Allow building with Clang, too
Date: Mon, 10 May 2021 09:35:23 +0200
Message-Id: <20210510073524.85951-9-thuth@redhat.com>
In-Reply-To: <20210510073524.85951-1-thuth@redhat.com>
References: <20210510073524.85951-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang unfortunately does not support generating code for the z900
architecture level and starts with the z10 instead. Thus to be able
to support compiling with Clang, we have to check for the supported
compiler flags. The disadvantage is of course that the bios image
will only run with z10 guest CPUs upwards (which is what most people
use anyway), so just in case let's also emit a warning in that case
(we will continue to ship firmware images that have been pre-built
with GCC in future releases, so this should not impact normal users,
too).

Message-Id: <20210502174836.838816-5-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                 | 9 ++++++++-
 pc-bios/s390-ccw/Makefile | 3 ++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 4f374b4889..5ebc937746 100755
--- a/configure
+++ b/configure
@@ -5417,9 +5417,16 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
 fi
 
 # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
+# or -march=z10 (which is the lowest architecture level that Clang supports)
 if test "$cpu" = "s390x" ; then
   write_c_skeleton
-  if compile_prog "-march=z900" ""; then
+  compile_prog "-march=z900" ""
+  has_z900=$?
+  if [ $has_z900 = 0 ] || compile_prog "-march=z10" ""; then
+    if [ $has_z900 != 0 ]; then
+      echo "WARNING: Your compiler does not support the z900!"
+      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
+    fi
     roms="$roms s390-ccw"
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 83fb1afb73..cee9d2c63b 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -34,7 +34,8 @@ QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-overflow)
 QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
 QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
 QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
-QEMU_CFLAGS += -msoft-float -march=z900
+QEMU_CFLAGS += -msoft-float
+QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS),-march=z900,-march=z10)
 QEMU_CFLAGS += -std=gnu99
 LDFLAGS += -Wl,-pie -nostdlib
 
-- 
2.27.0


