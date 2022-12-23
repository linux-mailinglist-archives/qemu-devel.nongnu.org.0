Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721A96554A6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 22:05:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8pCr-0003Om-Ur; Fri, 23 Dec 2022 16:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8pCo-0003OU-FU
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 16:03:50 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8pCm-0005Rs-G9
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 16:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671829424; bh=kcS+EGAloHZKzXp/Mw/qKYtyRd05BaPhGBR6yqbEiN4=;
 h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
 b=lHgFmcAr1KoDzk3UHlB0yJLT1yrlQVnkbBgpVsTYnETigh3/vGuhU4RzWaN3w19wh
 o8lU9w9e88+HNqRzfWf7MM9SzU7TQ/emu14BvmQbF0LjrV9sOq4wyBpH6wKk6Sc8yj
 B8YvNJ7WoBhy0cI99z5h+7GrgGnwjXTeBQgMNKCXGAdy8D90QADDSBysT7naGiCv++
 3hR4d3V/tOkSjvysSq/eeDfCcsTz1Kq11E4uZHfkqj2mSFqDex0wLsCNvHLmEiGzO5
 3GxoSYgdTXP2zlrbeaUHZubX2RMoAnMZhTvecNeFttOlRWX2pj+vzSu/GF7dOWB5Wh
 9KylxDMWBVECg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.152.212]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6ll8-1pDl9S1B42-008Ndx; Fri, 23
 Dec 2022 22:03:44 +0100
Date: Fri, 23 Dec 2022 22:03:40 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Fix brk() to release pages
Message-ID: <Y6YXrFe9r95MKqno@p100>
References: <20221223101626.19215-1-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223101626.19215-1-deller@gmx.de>
X-Provags-ID: V03:K1:+Gwp0KNHfBX5TyLUtIigGRnLoQ2KAhsqvE9cE8HjFinBayEMYg7
 SUZv4hf9/g6f3vQaeNq06wlJZlpJZb80sKD1bwCS7H0gaeJERIHE4MM17JOMy8vs9IbPdSj
 ZBaBsdRCH5/YHvpFjk14gjYTDFjyaI/iHr5Qcq9O1Z0+ZQY+7e50Jnp0R9NXmMDSPK831NG
 fIW/M1uuJ8JFhF9K/G4fA==
UI-OutboundReport: notjunk:1;M01:P0:g+hCsmDQycU=;BzGLDjt83+lH/MbKJQx6KxAzzew
 vRbGRyLYD2rSXamrMSUY3NvlE6b/eB1J1f04A2yMR9fv18wvaKxmRHcf2qszu/WYTjf/r4IYE
 cibnPI1JOoE0VG2BDWKeE1X4h4Gm1nhx1OZzIERuziGKUJYNkP+mDP+gT3IkL/noPcOMc3RSN
 331o1MQTaf4K6GSjRG1ddBf2rbi2v2ClE2MCmRMJImxlNhqt0ZAUzQ9RCQsfs/FRT6CppvJMf
 6KP+OBd+2Ik21KYdFLMRJh0zXBsoOZdZqwBPLSaKUm2fMIy3mP0kwem26U3g5vzDLFP7w4xr4
 9e28QLJX6PiaEOHLLjVKb53JGzjwavB+byQPVqLfLNGZUyT6ibPmtbr7ThwgbFOeVURw1++SZ
 N86dtKoN/7hWsaYAoyG3XnfDom5cZJR4mjJ5x7MXz1Ew7cNhqj9ec1xCYsIPAsE0JNbxX+obI
 HL0Qq7kLMgLlGVW91q82dWcjrFgPIKKG3Uz3O4oTASQpLfgK0M5BxHshwxo03+AKd7aiSt5gX
 49K2Jdt5BDQWZmAJRVUmyyZ3Y6H/HrjcSLcx6NrGBQzqNnuNXSZtOZKdXhvgMAsiiu1BSKKrR
 Sfl1/YaWJY40N+qYBOtwLU5SO3ECxtRGVFcOAyUimTx2F/9vY03y4L01DWZ1abKb9HpeQgOKR
 PL03C+hnj9LRQZkzKzE5ajP9AMNj/ACGKpMQRqesvMn0P2XgHYSwpWgqYV9jGFNjEmcm0XTw0
 QkCpsX4dZDfphpqnJbLsTNZGlQcC5rTRQ2kKpuq+hwgpNjUjZWonuNx4hWeWH+p1XvbDHMJct
 0kMGSFTBReNNksfiSBPBvggcdYV4s84CDkHz56YMHIu4DxSx2C6zzf+oEeoJd0u9/jxHEU5mo
 vcotd1bmmCKeSngrR6b3CfMHWx3+ck21ZVmcKEYg/T9cTlI3DZveZI3WOiAqBOBOd/nX8YFZ/
 +/KGil8Lw788NWbwM66skPE2UAY=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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
v2:
- Fixed return value of brk(). The v1 version wrongly page-aligned the
  provided address, while userspace expects unmodified the address
  returned unmodified.


diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4fee882cd7..2fcb6dba06 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -838,49 +838,59 @@ static inline int host_to_target_sock_type(int host_=
type)
 }

 static abi_ulong target_brk;
-static abi_ulong target_original_brk;
 static abi_ulong brk_page;

 void target_set_brk(abi_ulong new_brk)
 {
-    target_original_brk =3D target_brk =3D HOST_PAGE_ALIGN(new_brk);
-    brk_page =3D HOST_PAGE_ALIGN(target_brk);
+    target_brk =3D new_brk;
+    brk_page =3D HOST_PAGE_ALIGN(new_brk);
 }

 //#define DEBUGF_BRK(message, args...) do { fprintf(stderr, (message), ##=
 args); } while (0)
 #define DEBUGF_BRK(message, args...)

 /* do_brk() must return target values and target errnos. */
-abi_long do_brk(abi_ulong new_brk)
+abi_long do_brk(abi_ulong brk_val)
 {
     abi_long mapped_addr;
     abi_ulong new_alloc_size;
+    abi_ulong new_brk, new_host_brk_page;

     /* brk pointers are always untagged */

+    /* return old brk value on zero brk_val */
+    if (!brk_val || brk_val =3D=3D target_brk) {
+        return target_brk;
+    }
+
+    new_brk =3D TARGET_PAGE_ALIGN(brk_val);
+    new_host_brk_page =3D HOST_PAGE_ALIGN(brk_val);
+
     DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);

-    if (!new_brk) {
+    /* brk_val and old target_brk might be on the same page */
+    if (new_brk =3D=3D TARGET_PAGE_ALIGN(target_brk)) {
+        if (brk_val > target_brk) {
+            /* empty remaining bytes in (possibly larger) host page */
+            memset(g2h_untagged(target_brk), 0, new_host_brk_page - targe=
t_brk);
+        }
         DEBUGF_BRK(TARGET_ABI_FMT_lx " (!new_brk)\n", target_brk);
-        return target_brk;
-    }
-    if (new_brk < target_original_brk) {
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk < target_original_brk)\n"=
,
-                   target_brk);
-        return target_brk;
+        target_brk =3D brk_val;
+        return brk_val;
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
+    /* Release heap if necesary */
+    if (new_brk < target_brk) {
+        /* empty remaining bytes in (possibly larger) host page */
+        memset(g2h_untagged(brk_val), 0, new_host_brk_page - brk_val);
+
+        /* free unused host pages and set new brk_page */
+        target_munmap(new_host_brk_page, brk_page - new_host_brk_page);
+        brk_page =3D new_host_brk_page;
+
+	target_brk =3D brk_val;
         DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk <=3D brk_page)\n", target=
_brk);
-	return target_brk;
+	return brk_val;
     }

     /* We need to allocate more memory after the brk... Note that
@@ -889,10 +899,14 @@ abi_long do_brk(abi_ulong new_brk)
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
@@ -905,10 +919,10 @@ abi_long do_brk(abi_ulong new_brk)
         memset(g2h_untagged(target_brk), 0, brk_page - target_brk);

         target_brk =3D new_brk;
-        brk_page =3D HOST_PAGE_ALIGN(target_brk);
+        brk_page =3D new_host_brk_page;
         DEBUGF_BRK(TARGET_ABI_FMT_lx " (mapped_addr =3D=3D brk_page)\n",
             target_brk);
-        return target_brk;
+        return brk_val;
     } else if (mapped_addr !=3D -1) {
         /* Mapped but at wrong address, meaning there wasn't actually
          * enough space for this brk.

