Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974113BC7BD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:19:49 +0200 (CEST)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gJ2-0005px-Kz
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0gHp-0004yv-KO
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0gHn-0003aV-Mu
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625559509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/EJ4H8S9Tpye9ssLtSZJ9BxcV+Yo1xIbTT2RiIVlJxs=;
 b=DOmvJw8TRRZK4k3LBTC4r1MLySJ2dEEUXjtV3AzatVIBL7NIAPj1Mxjjdn9mtmSKZ99SGu
 Iv9rhbYtT6FJMbOKNT/dlb9ItXY9b7kn4HUgZpa1ZMCBI/RmNogib4oExuDnVp4N2ODwHG
 Pg4P/uoz8pQw3iJzwuytWyM9CsPS64E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-ylo18xB4O7aTwJiA8Pkkmw-1; Tue, 06 Jul 2021 04:18:28 -0400
X-MC-Unique: ylo18xB4O7aTwJiA8Pkkmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34246C740B;
 Tue,  6 Jul 2021 08:18:27 +0000 (UTC)
Received: from thuth.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E41C60864;
 Tue,  6 Jul 2021 08:18:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] target/xtensa/xtensa-semi: Fix compilation problem on Haiku
Date: Tue,  6 Jul 2021 10:18:22 +0200
Message-Id: <20210706081822.1316551-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The errno numbers are very large on Haiku, so the linking currently
fails there with a "final link failed: memory exhausted" error
message. We should not use the errno number as array indexes here,
thus convert the code to a switch-case statement instead. A clever
compiler should be able to optimize this code in a similar way
anway.

Reported-by: Richard Zak <richard.j.zak@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/xtensa/xtensa-semi.c | 84 +++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 45 deletions(-)

diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 79f2b043f2..fa21b7e11f 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -95,59 +95,53 @@ enum {
 
 static uint32_t errno_h2g(int host_errno)
 {
-    static const uint32_t guest_errno[] = {
-        [EPERM]         = TARGET_EPERM,
-        [ENOENT]        = TARGET_ENOENT,
-        [ESRCH]         = TARGET_ESRCH,
-        [EINTR]         = TARGET_EINTR,
-        [EIO]           = TARGET_EIO,
-        [ENXIO]         = TARGET_ENXIO,
-        [E2BIG]         = TARGET_E2BIG,
-        [ENOEXEC]       = TARGET_ENOEXEC,
-        [EBADF]         = TARGET_EBADF,
-        [ECHILD]        = TARGET_ECHILD,
-        [EAGAIN]        = TARGET_EAGAIN,
-        [ENOMEM]        = TARGET_ENOMEM,
-        [EACCES]        = TARGET_EACCES,
-        [EFAULT]        = TARGET_EFAULT,
+    switch (host_errno) {
+    case 0:         return 0;
+    case EPERM:     return TARGET_EPERM;
+    case ENOENT:    return TARGET_ENOENT;
+    case ESRCH:     return TARGET_ESRCH;
+    case EINTR:     return TARGET_EINTR;
+    case EIO:       return TARGET_EIO;
+    case ENXIO:     return TARGET_ENXIO;
+    case E2BIG:     return TARGET_E2BIG;
+    case ENOEXEC:   return TARGET_ENOEXEC;
+    case EBADF:     return TARGET_EBADF;
+    case ECHILD:    return TARGET_ECHILD;
+    case EAGAIN:    return TARGET_EAGAIN;
+    case ENOMEM:    return TARGET_ENOMEM;
+    case EACCES:    return TARGET_EACCES;
+    case EFAULT:    return TARGET_EFAULT;
 #ifdef ENOTBLK
-        [ENOTBLK]       = TARGET_ENOTBLK,
+    case ENOTBLK:   return TARGET_ENOTBLK;
 #endif
-        [EBUSY]         = TARGET_EBUSY,
-        [EEXIST]        = TARGET_EEXIST,
-        [EXDEV]         = TARGET_EXDEV,
-        [ENODEV]        = TARGET_ENODEV,
-        [ENOTDIR]       = TARGET_ENOTDIR,
-        [EISDIR]        = TARGET_EISDIR,
-        [EINVAL]        = TARGET_EINVAL,
-        [ENFILE]        = TARGET_ENFILE,
-        [EMFILE]        = TARGET_EMFILE,
-        [ENOTTY]        = TARGET_ENOTTY,
+    case EBUSY:     return TARGET_EBUSY;
+    case EEXIST:    return TARGET_EEXIST;
+    case EXDEV:     return TARGET_EXDEV;
+    case ENODEV:    return TARGET_ENODEV;
+    case ENOTDIR:   return TARGET_ENOTDIR;
+    case EISDIR:    return TARGET_EISDIR;
+    case EINVAL:    return TARGET_EINVAL;
+    case ENFILE:    return TARGET_ENFILE;
+    case EMFILE:    return TARGET_EMFILE;
+    case ENOTTY:    return TARGET_ENOTTY;
 #ifdef ETXTBSY
-        [ETXTBSY]       = TARGET_ETXTBSY,
+    case ETXTBSY:   return TARGET_ETXTBSY;
 #endif
-        [EFBIG]         = TARGET_EFBIG,
-        [ENOSPC]        = TARGET_ENOSPC,
-        [ESPIPE]        = TARGET_ESPIPE,
-        [EROFS]         = TARGET_EROFS,
-        [EMLINK]        = TARGET_EMLINK,
-        [EPIPE]         = TARGET_EPIPE,
-        [EDOM]          = TARGET_EDOM,
-        [ERANGE]        = TARGET_ERANGE,
-        [ENOSYS]        = TARGET_ENOSYS,
+    case EFBIG:     return TARGET_EFBIG;
+    case ENOSPC:    return TARGET_ENOSPC;
+    case ESPIPE:    return TARGET_ESPIPE;
+    case EROFS:     return TARGET_EROFS;
+    case EMLINK:    return TARGET_EMLINK;
+    case EPIPE:     return TARGET_EPIPE;
+    case EDOM:      return TARGET_EDOM;
+    case ERANGE:    return TARGET_ERANGE;
+    case ENOSYS:    return TARGET_ENOSYS;
 #ifdef ELOOP
-        [ELOOP]         = TARGET_ELOOP,
+    case ELOOP:     return TARGET_ELOOP;
 #endif
     };
 
-    if (host_errno == 0) {
-        return 0;
-    } else if (host_errno > 0 && host_errno < ARRAY_SIZE(guest_errno) &&
-            guest_errno[host_errno]) {
-        return guest_errno[host_errno];
-    } else {
-        return TARGET_EINVAL;
-    }
+    return TARGET_EINVAL;
 }
 
 typedef struct XtensaSimConsole {
-- 
2.27.0


