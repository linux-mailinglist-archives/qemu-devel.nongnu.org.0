Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E635E370E46
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:50:21 +0200 (CEST)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGEX-0001Wz-0p
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldGD6-0000Fh-4w
 for qemu-devel@nongnu.org; Sun, 02 May 2021 13:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldGD4-0000TG-07
 for qemu-devel@nongnu.org; Sun, 02 May 2021 13:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619977729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTzB/niq2+KOl6V7uzrJ3GhYtimVeLGPZmrQmgIikm8=;
 b=ZWy8ERDhXfoNKDfkooySfmYlD9Lzfxe5DPtv8TAQsTmpoeuJlrOgXzObhI/SM6WSA8hI5k
 CtF2bkkD19VAirwpwee+EdAdSaA3S+fsNHz4i1vb9ae4hi6Jgoc+sLh0bcm8hhInfY3+fY
 v4XeRSEM5w1eaniMxOcZO90FaHMOvZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-XxpKV5EMPvGk4kyZUt6Pjw-1; Sun, 02 May 2021 13:48:47 -0400
X-MC-Unique: XxpKV5EMPvGk4kyZUt6Pjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 682FD801817;
 Sun,  2 May 2021 17:48:46 +0000 (UTC)
Received: from thuth.com (ovpn-112-16.ams2.redhat.com [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B2F7189B6;
 Sun,  2 May 2021 17:48:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
Date: Sun,  2 May 2021 19:48:36 +0200
Message-Id: <20210502174836.838816-5-thuth@redhat.com>
In-Reply-To: <20210502174836.838816-1-thuth@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang unfortunately does not support generating code for the z900
architecture level and starts with the z10 instead. Thus to be able
to support compiling with Clang, we have to check for the supported
compiler flags. The disadvantage is of course that the bios image
will only run with z10 guest CPUs upwards (which is what most people
use anyway), so just in case let's also emit a warning in that case.

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


