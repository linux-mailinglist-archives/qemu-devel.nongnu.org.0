Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FF655C9B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 09:25:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9MID-00082f-Je; Sun, 25 Dec 2022 03:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p9MI8-00082A-I7
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 03:23:33 -0500
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p9MI6-0004Ib-Mt
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 03:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671956603; bh=wlU55wTihR+0rtlYUIKrS3FrvKOJQphWmet1KEUS1dU=;
 h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
 b=XuVypboVyJ6/8aiQ8IlSAzy59hWUq7FAlKwI68TJ1nhBISPR1m1fLifO1Pvl6xjt3
 UK2NhiIe70Kw1arXjkIiYpp7dDP9XsRt6bu9LeHKA9lZ+9nrwa9Jllh5kgDQEyqzLj
 cuIO4tU5baEnnYciKx3hBMmi+uxHzuxeGHR33baW5syyORUNH05mtbywUuYhcybwA9
 0rCnkSobZflueG4mTNAxsmnU2h2XHGbbtdXLmj4vEj0qEjEMGXAhnleaTgGXbEzs/5
 SwLNl+EyP9KQdTHXqwhBL4DPLv+SGlGq1PQa920od1ZhmVg/wTwfuCe1Esqb9E6rLc
 P5KVzTamRDj9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.147.77]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mulm5-1osnJA1G6N-00rlSD; Sun, 25
 Dec 2022 09:23:23 +0100
Date: Sun, 25 Dec 2022 09:23:19 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH v3] linux-user: Fix brk() to release pages
Message-ID: <Y6gId80ek49TK1xB@p100>
References: <20221223101626.19215-1-deller@gmx.de>
 <Y6YXrFe9r95MKqno@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6YXrFe9r95MKqno@p100>
X-Provags-ID: V03:K1:lJlj6eVfJGrLdev7m8KKkWAc/ZbDAWIOzx8/QwesmhT2JbLZsd2
 GVtZKtqKJnZsDUCxXNTSLAE1FRHSnMHVZ/ZAFbYdDv1oO9bD3i14/Enaa0uNDZxlkpUCuz/
 Q69UhAint/MfVvSI5HSDB1kjQVaNBcZM75wKoBRbZKc13iw0uO7CJNpoHCiH3oFt98o/abB
 giRvu3EC43p9jIhkN3ofQ==
UI-OutboundReport: notjunk:1;M01:P0:bUdEtXUZH+U=;ZeBPnwEDrmP8tG1QlcacJvBPp8d
 vdP4jXeyYjAJO91YYkmZaqiZ7W2hp0YHrgooyHlyHni25zDBVbJAcQJAIQcqdTBbnBsdbzC2V
 p6PNdXhwCX9cUSCt/QWOETbeHU8B8jtnyNdTvH1S9JjFNm4Y8KF4Ocg1Se+UByudQ2O9I/hkU
 pBa1msK6KjuJjE51+8PdSkwIWN6//wvPqwtQVyieE8FT9LnFpFMB91SRCwaxICbRoy3DBAUr9
 c3mzOsx7CKZTtmcWa0G2JYh6zfkGXW3jZV9JjMLrwlYXaO/tO1FjMsnzB4iqsYrirBGf7Dy0s
 hLWCNsYEPcaFvDd0Z8GsAB2l21QztzN+kOMsMneFr6P9KSx0yWITQEOwCHJownbxrZV0MecCt
 qMJK8bU2W+YM/T/zbMaQAhJgeU1mjMG9PiCifWbZ7xo9uzwIPSgDuxkBtW5tNO7zQZyLFUc4d
 K/XVzm/wgijmoz9rMDDpEJXxZrsyK2F2P7ECfCi1zDXaDyO6cSeQz7www9twhw/844P20nk/T
 yby6QDwM0eVO1xRt4nMWePhP26NqOqFw03DtHo1t3YiJ+w/CE8N1sTnXaqLMhoWhsAIxBQaL8
 GL/s5gLlIToENzJpLfM2HGKEAgsrkzql0g4jgcNyBARBeY4h0v1gNbKQl2gCMUiS7/Zgj4j5Q
 nxv38mA14yzPwH9vZODERUlfbBS9BbaNi8Uhf9I04Y+t2O9uZGMOEoiHKMODi+wHwEAah906H
 COdiqKr2Kzizegmh4f9PbJZPGWOvmls46ewXUzgCUYxmAJv961Zdb2v4/UItyhlsIwldPW1jK
 j9an4vteiY5dFgrvVaQqa/0gr8JfYVMu26lgDvwkg50ntNjw82NQ365pJJUnRIGNW8iF7NOoN
 jnbJKk4x7MVF0ZMWDL43hqeCyurCh4fSnssj+2CixTVA/BtJgU4LeWl9krfHTBFV7HAclsGky
 NsQQkA==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The current brk() implementation does not de-allocate pages if a lower
address is given compared to earlier brk() calls.
But according to the manpage, brk() shall deallocate memory in this case
and currently it breaks a real-world application, specifically building
the debian gcl package in qemu-user.

Fix this issue by reworking the qemu brk() implementation.

Tested with the C-code testcase included in qemu commit 4d1de87c750, and
by building debian package of gcl in a hppa-linux guest on a x86-64
host.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--
v3:
- Fixed one bug where page aligned address was returned instead
  of requested address.
- Dropped debug info which is partly outdated now
- Reduced number of changed lines in diff compared to v2 to make
  diff easier readable
- Fixed changelog of v2
v2:
- Fixed return value of brk(). The v1 version wrongly page-aligned
  the provided address, while userspace expects an unmodified
  address returned.


diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4fee882cd7..7d28802aa6 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -838,49 +838,52 @@ static inline int host_to_target_sock_type(int host_=
type)
 }

 static abi_ulong target_brk;
-static abi_ulong target_original_brk;
 static abi_ulong brk_page;

 void target_set_brk(abi_ulong new_brk)
 {
-    target_original_brk =3D target_brk =3D HOST_PAGE_ALIGN(new_brk);
+    target_brk =3D new_brk;
     brk_page =3D HOST_PAGE_ALIGN(target_brk);
 }

-//#define DEBUGF_BRK(message, args...) do { fprintf(stderr, (message), ##=
 args); } while (0)
-#define DEBUGF_BRK(message, args...)
-
 /* do_brk() must return target values and target errnos. */
-abi_long do_brk(abi_ulong new_brk)
+abi_long do_brk(abi_ulong brk_val)
 {
     abi_long mapped_addr;
     abi_ulong new_alloc_size;
+    abi_ulong new_brk, new_host_brk_page;

     /* brk pointers are always untagged */

-    DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);
-
-    if (!new_brk) {
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (!new_brk)\n", target_brk);
+    /* return old brk value if brk_val unchanged or zero */
+    if (!brk_val || brk_val =3D=3D target_brk) {
         return target_brk;
     }
-    if (new_brk < target_original_brk) {
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk < target_original_brk)\n"=
,
-                   target_brk);
+
+    new_brk =3D TARGET_PAGE_ALIGN(brk_val);
+    new_host_brk_page =3D HOST_PAGE_ALIGN(brk_val);
+
+    /* brk_val and old target_brk might be on the same page */
+    if (new_brk =3D=3D TARGET_PAGE_ALIGN(target_brk)) {
+        if (brk_val > target_brk) {
+            /* empty remaining bytes in (possibly larger) host page */
+            memset(g2h_untagged(target_brk), 0, new_host_brk_page - targe=
t_brk);
+        }
+        target_brk =3D brk_val;
         return target_brk;
     }

-    /* If the new brk is less than the highest page reserved to the
-     * target heap allocation, set it and we're almost done...  */
-    if (new_brk <=3D brk_page) {
-        /* Heap contents are initialized to zero, as for anonymous
-         * mapped pages.  */
-        if (new_brk > target_brk) {
-            memset(g2h_untagged(target_brk), 0, new_brk - target_brk);
-        }
-	target_brk =3D new_brk;
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk <=3D brk_page)\n", target=
_brk);
-	return target_brk;
+    /* Release heap if necesary */
+    if (new_brk < target_brk) {
+        /* empty remaining bytes in (possibly larger) host page */
+        memset(g2h_untagged(brk_val), 0, new_host_brk_page - brk_val);
+
+        /* free unused host pages and set new brk_page */
+        target_munmap(new_host_brk_page, brk_page - new_host_brk_page);
+        brk_page =3D new_host_brk_page;
+
+        target_brk =3D brk_val;
+        return target_brk;
     }

     /* We need to allocate more memory after the brk... Note that
@@ -889,10 +892,14 @@ abi_long do_brk(abi_ulong new_brk)
      * itself); instead we treat "mapped but at wrong address" as
      * a failure and unmap again.
      */
-    new_alloc_size =3D HOST_PAGE_ALIGN(new_brk - brk_page);
-    mapped_addr =3D get_errno(target_mmap(brk_page, new_alloc_size,
+    new_alloc_size =3D new_host_brk_page - brk_page;
+    if (new_alloc_size) {
+        mapped_addr =3D get_errno(target_mmap(brk_page, new_alloc_size,
                                         PROT_READ|PROT_WRITE,
                                         MAP_ANON|MAP_PRIVATE, 0, 0));
+    } else {
+        mapped_addr =3D brk_page;
+    }

     if (mapped_addr =3D=3D brk_page) {
         /* Heap contents are initialized to zero, as for anonymous
@@ -904,10 +911,8 @@ abi_long do_brk(abi_ulong new_brk)
          * then shrunken).  */
         memset(g2h_untagged(target_brk), 0, brk_page - target_brk);

-        target_brk =3D new_brk;
-        brk_page =3D HOST_PAGE_ALIGN(target_brk);
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (mapped_addr =3D=3D brk_page)\n",
-            target_brk);
+        target_brk =3D brk_val;
+        brk_page =3D new_host_brk_page;
         return target_brk;
     } else if (mapped_addr !=3D -1) {
         /* Mapped but at wrong address, meaning there wasn't actually
@@ -915,10 +920,6 @@ abi_long do_brk(abi_ulong new_brk)
          */
         target_munmap(mapped_addr, new_alloc_size);
         mapped_addr =3D -1;
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (mapped_addr !=3D -1)\n", target_b=
rk);
-    }
-    else {
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (otherwise)\n", target_brk);
     }

 #if defined(TARGET_ALPHA)

