Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49737CE8C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:22:27 +0200 (CEST)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsZ0-0004a9-57
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsSt-0004Pp-AT
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsSo-0007Uy-Bd
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620839761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYCfq+yD8dNR6oFZoEf6mZWVBsHi58hFQah1patXkgA=;
 b=SueLd9bgU12rceg6AyoQPTajlYwNiFQan0c0FDyR4Lv5hSOtuJVYeJlc1fxQdxJl+RD5zX
 EdHlH13CbeqBNPigDCafjFNHKDSlXZx+fUXs2aAPri7EdyWUPZR7gMT2tO3XEKs222304g
 b8inFJEBNf6n54wiQOVNt5RJ94HW/Ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-9_V8aV0lMp6dfxPU1efqlA-1; Wed, 12 May 2021 13:15:57 -0400
X-MC-Unique: 9_V8aV0lMp6dfxPU1efqlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A0B10CE782;
 Wed, 12 May 2021 17:15:56 +0000 (UTC)
Received: from thuth.com (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1C252B0D7;
 Wed, 12 May 2021 17:15:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 1/3] pc-bios/s390-ccw: Fix inline assembly for older versions
 of Clang
Date: Wed, 12 May 2021 19:15:48 +0200
Message-Id: <20210512171550.476130-2-thuth@redhat.com>
In-Reply-To: <20210512171550.476130-1-thuth@redhat.com>
References: <20210512171550.476130-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang versions before v11.0 insist on having the %rX or %cX register
names instead of just a number. Since our Travis-CI is currently
still using Clang v6.0, we have to fix this to avoid failing jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/helper.h   | 2 +-
 pc-bios/s390-ccw/jump2ipl.c | 4 ++--
 pc-bios/s390-ccw/menu.c     | 8 ++++----
 pc-bios/s390-ccw/virtio.c   | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/pc-bios/s390-ccw/helper.h b/pc-bios/s390-ccw/helper.h
index dfcfea0ff0..3d0731c4c6 100644
--- a/pc-bios/s390-ccw/helper.h
+++ b/pc-bios/s390-ccw/helper.h
@@ -31,7 +31,7 @@ static inline void *u32toptr(uint32_t n)
 
 static inline void yield(void)
 {
-    asm volatile ("diag 0,0,0x44"
+    asm volatile ("diag %%r0,%%r0,0x44"
                   : :
                   : "memory", "cc");
 }
diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
index 73e4367e09..78f5f46533 100644
--- a/pc-bios/s390-ccw/jump2ipl.c
+++ b/pc-bios/s390-ccw/jump2ipl.c
@@ -64,8 +64,8 @@ void jump_to_IPL_code(uint64_t address)
      * We use the load normal reset to keep r15 unchanged. jump_to_IPL_2
      * can then use r15 as its stack pointer.
      */
-    asm volatile("lghi 1,1\n\t"
-                 "diag 1,1,0x308\n\t"
+    asm volatile("lghi %%r1,1\n\t"
+                 "diag %%r1,%%r1,0x308\n\t"
                  : : : "1", "memory");
     panic("\n! IPL returns !\n");
 }
diff --git a/pc-bios/s390-ccw/menu.c b/pc-bios/s390-ccw/menu.c
index de8260a5d6..d601952d3e 100644
--- a/pc-bios/s390-ccw/menu.c
+++ b/pc-bios/s390-ccw/menu.c
@@ -36,9 +36,9 @@ static inline void enable_clock_int(void)
     uint64_t tmp = 0;
 
     asm volatile(
-        "stctg      0,0,%0\n"
+        "stctg      %%c0,%%c0,%0\n"
         "oi         6+%0, 0x8\n"
-        "lctlg      0,0,%0"
+        "lctlg      %%c0,%%c0,%0"
         : : "Q" (tmp) : "memory"
     );
 }
@@ -48,9 +48,9 @@ static inline void disable_clock_int(void)
     uint64_t tmp = 0;
 
     asm volatile(
-        "stctg      0,0,%0\n"
+        "stctg      %%c0,%%c0,%0\n"
         "ni         6+%0, 0xf7\n"
-        "lctlg      0,0,%0"
+        "lctlg      %%c0,%%c0,%0"
         : : "Q" (tmp) : "memory"
     );
 }
diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
index ab49840db8..5d2c6e3381 100644
--- a/pc-bios/s390-ccw/virtio.c
+++ b/pc-bios/s390-ccw/virtio.c
@@ -54,7 +54,7 @@ static long kvm_hypercall(unsigned long nr, unsigned long param1,
     register ulong r_param3 asm("4") = param3;
     register long retval asm("2");
 
-    asm volatile ("diag 2,4,0x500"
+    asm volatile ("diag %%r2,%%r4,0x500"
                   : "=d" (retval)
                   : "d" (r_nr), "0" (r_param1), "r"(r_param2), "d"(r_param3)
                   : "memory", "cc");
-- 
2.27.0


