Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD93654F14
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:18:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8f7f-0008If-UD; Fri, 23 Dec 2022 05:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8f7W-0008GJ-KV
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:17:48 -0500
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8f7Q-0003Qp-I3
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671790652; bh=pF1UP10CGzZjyC7Aa8ywWx9CLo2XonxeAtmMqqmDJ7g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=BwrdztmiY0w9wJmk+GHq+3AJu1QudaKeIbRb38zyGxnylZi/cvJaWPF4W6aNS1iam
 bBW05fxQnYSyfahOTxy7A8o5YLGkKmhxL+M4DA2/3GRjPkT/ZsEKyer6ddJytGgWns
 3oh2/vP65PCwAj0DAONtYqDH27n81IRWX2oG20KUKOJTUt4pGXw/28ac5Zp4+pMjIq
 f5kutuWiEdvr3wN3r1yJqjjqpcFm0nXVQJUVSpKO9ldiJ5jB9LmZhWlIf+QL0BfPeH
 9iZQIJkBz3MdLvaxW0p8OeIWodoy2Rw3gfEw3AqMRppaUr646PB97OAyF1XyFYjvhT
 keiJXyo+irUQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.152.212]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1p5hlD331D-00HQLV; Fri, 23
 Dec 2022 11:17:32 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Fix brk() to release pages
Date: Fri, 23 Dec 2022 11:16:28 +0100
Message-Id: <20221223101626.19215-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xv7rLVY5y42ehNjsUNetS1F+TdQCM7rx5CiAK83OPxbWb+NG6jD
 6O8k0AEaU02Phw/CJm4OsDdw6BaewfJXKgi5V+BpT/UDYM3qgMkTNgjTiaRMMh86W2GR3TF
 yvqRFdAatBK2blvx9K7oXhCm2rFCFH9GacyTEeU0fuYTNZcvLylgrUmOVk/IRWXgnVqaa4y
 yUphLDDlltR8KXOLoZxUQ==
UI-OutboundReport: notjunk:1;M01:P0:5ndd9A1paMU=;NEm5tkrjAV3g06FwrFWBW3j8M8R
 9+NOyf18a8PshDsnska0o/g3jMRyHVigqNI7dFPb3jXl9ebHp8TGiljjiB6GgbXwN3ssFeUGE
 x4uSO3dKlBmk6wnyG5mQOfGXrehsrzeGVJNcoRCINvelK1FNzVM6AksPVCT5Y0O/y6joPIUIq
 57rObn+9M7OaprDR5PlD3dsA+nzLbOyctM1CXwHN9GduksW0tRjFYRKNv97AhykhjYYIgkjd+
 fb7S6+/0EbJJigIn1sP8vxyKUk53whwTzYF04If1BElHa/KFl9alVuymBkaPnYRH/CwC03EJC
 DEEJGBEa2Gv+W75cecFaknpUHwtXeIpl35ForHOKB7+5hJm5pAv0rmGRV+I5JdGnfMOu8gLT9
 5pwjmF94lElelGAWZNMndJW6lzD10MqHNs2Er3CSMRSR16pLkcdhPZdFiAMApeVPLGvcAXKnH
 hNzoIvfxK8aj9ZN9+rSuZOdbhrJ3A3W6lFMPwhAPJn3qwhFSbdueOvK3vQ57s7Xe3FA3rPW3v
 ckXIDiSXWnkcotYLWgQoGhbGRmDOIWMchwyvRes5gmmcB1p4UgyhNWW/GhWzjQwV5fR3hcxNS
 U7NvPJNB3f2FQtyMLxQxNvJ6W3lCdQTrXYAJl1Q7bnw38l/aOSx9HUml5iVT3UlGZNGWg0tzg
 mbJXUcqBPuUvrtCImU/L0+DiFO/tyOq+1/wDwsr1r63CqENYaxQuelijgqZ5juJuXqUlXkyf5
 O245sxPvq++PDwtOVYQZd7KpbJnvKrJFL4721Wil2wDEl2fNZ4hkng8G2PnXGhrudm83/H0Nz
 vBuHV5bGXdwKMd3yjZGXoPiirCIs3WHc/JNYe8dFyKwf6mrrxzcMF7GuJOgAz4GypzwIgVYpr
 292c91EU/knFROGkYDIgNs2VvFHtCHe9q9VXTY8/xa369bO/YWJJvM8fNW/jtMw5oOw3DT7JB
 0Bupu+K7tOkN7Lw3/Mvs0sJZ4pE=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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
 linux-user/syscall.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4fee882cd7..d306b02e21 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -838,13 +838,12 @@ static inline int host_to_target_sock_type(int host_=
type)
 }

 static abi_ulong target_brk;
-static abi_ulong target_original_brk;
 static abi_ulong brk_page;

 void target_set_brk(abi_ulong new_brk)
 {
-    target_original_brk =3D target_brk =3D HOST_PAGE_ALIGN(new_brk);
-    brk_page =3D HOST_PAGE_ALIGN(target_brk);
+    target_brk =3D TARGET_PAGE_ALIGN(new_brk);
+    brk_page =3D HOST_PAGE_ALIGN(new_brk);
 }

 //#define DEBUGF_BRK(message, args...) do { fprintf(stderr, (message), ##=
 args); } while (0)
@@ -855,29 +854,29 @@ abi_long do_brk(abi_ulong new_brk)
 {
     abi_long mapped_addr;
     abi_ulong new_alloc_size;
+    abi_ulong new_host_brk_page;

     /* brk pointers are always untagged */

+    new_brk =3D TARGET_PAGE_ALIGN(new_brk);
+    new_host_brk_page =3D HOST_PAGE_ALIGN(new_brk);
+
     DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);

-    if (!new_brk) {
+    if (!new_brk || new_brk =3D=3D target_brk) {
         DEBUGF_BRK(TARGET_ABI_FMT_lx " (!new_brk)\n", target_brk);
         return target_brk;
     }
-    if (new_brk < target_original_brk) {
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk < target_original_brk)\n"=
,
-                   target_brk);
-        return target_brk;
-    }

-    /* If the new brk is less than the highest page reserved to the
-     * target heap allocation, set it and we're almost done...  */
-    if (new_brk <=3D brk_page) {
-        /* Heap contents are initialized to zero, as for anonymous
-         * mapped pages.  */
-        if (new_brk > target_brk) {
-            memset(g2h_untagged(target_brk), 0, new_brk - target_brk);
-        }
+    /* Release heap if necesary */
+    if (new_brk < target_brk) {
+        /* empty remaining bytes in (possibly larger) host page */
+        memset(g2h_untagged(new_brk), 0, new_host_brk_page - new_brk);
+
+        /* free unused host pages and set new brk_page */
+        target_munmap(new_host_brk_page, brk_page - new_host_brk_page);
+        brk_page =3D new_host_brk_page;
+
 	target_brk =3D new_brk;
         DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk <=3D brk_page)\n", target=
_brk);
 	return target_brk;
@@ -889,10 +888,14 @@ abi_long do_brk(abi_ulong new_brk)
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
@@ -905,7 +908,7 @@ abi_long do_brk(abi_ulong new_brk)
         memset(g2h_untagged(target_brk), 0, brk_page - target_brk);

         target_brk =3D new_brk;
-        brk_page =3D HOST_PAGE_ALIGN(target_brk);
+        brk_page =3D new_host_brk_page;
         DEBUGF_BRK(TARGET_ABI_FMT_lx " (mapped_addr =3D=3D brk_page)\n",
             target_brk);
         return target_brk;
=2D-
2.38.1


