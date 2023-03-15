Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF16BBBD6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVfr-0000n3-03; Wed, 15 Mar 2023 14:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pcVfp-0000l4-7F
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:16:29 -0400
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pcVfn-00078B-07
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678904183; i=deller@gmx.de;
 bh=VlkHkolQ1D+9YefxnLcFVzotg0yM/PfwRHQS5aX5W9k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=cATEA8bnPu+sItAR884HSf07EMq7JKLIGrTL0odnpCc+jpqcmBmih+r9e8hjvS2vL
 1iswSBK6HdQbrm+6bf8H2TLElJNQrzhgkcY19aDAP3KIf+zsd+fmEn7NXu0Qgg2YI8
 cpsGuahsA7RW+78IhqSq3f4LTD4kGAuPpqGLg0JubKqBRWkPpbqc78FoxhFK3kweAa
 kDOqXU2QE7eMccXT5wPWAHmlV/Twa+b1NsMj0CiJkvdpcHLtULHCKRoaNAxGAnRDGo
 etABruT9lcPdy8wABXGR4Z3WGtHkf0yOSzTbj6Q8kEf0jSIil5NkrbQHkHtdwIz9em
 SCdCSql7KNmUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.153.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1pq4JC1TBx-00MKso; Wed, 15
 Mar 2023 19:16:23 +0100
From: Helge Deller <deller@gmx.de>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH 1/2] linux-user: Fix mmap2() syscall on 32-bit targets to
 allow file mapping beyond 4GB
Date: Wed, 15 Mar 2023 19:16:11 +0100
Message-Id: <20230315181612.1388056-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u7G+gMuxQXdyIwOjz63sSCt2GGPmoVzmO1HpCnjQK1hBlN6gi4P
 /z+BJIiAqod6rNonF2yvfCu98bqLiIE1uox3JQk56hMGlzvzmKJOFl2UIhPhnVoJmAdYVzA
 qa+DZF3N8y9CWaNBE8y9SeXL5PUN9Aljxlg15tteGMrpEwNVudqGnRjV/qjh9jG02z66lWH
 I5vYmXPcEdaROV1to3org==
UI-OutboundReport: notjunk:1;M01:P0:EiHe3n3QhMc=;0g9gJMpgdx+qSETh64sxIJtXfep
 Yy9YM2XeoB8FTXIJBSz3v/bZ54HUmT/c6hEIZqUSW6C9hW/c3ZzU7ofBFd0b4/JIcVrko5aCy
 fv3lhy9pOjg1iFIOCRIySbRHGIBIVSkaH9mQgeVbh12shOYsUOzN0KaPbrXikOP7GrEp3wyXS
 hHep+KSSXsAl9QN2KxSfMeQdXdGqBHtqLvrn+dcv0ZIcciQkWOtq6HmhO2mmaKxJfYs4KFpnH
 51fufhNyL3TqwBjEJElV+e5fh0dIDE3V9wR9YvQGIx2oB0MGblqSZ79qwCGg/NGZSvjo1X6Bw
 P0v4kJrH8P1Li5EmMjQmc2iiaAsXtVIMTQhMD1nzIk3RiAppI/B85rfzONssumX+SUVCyBV8f
 LcpLTtUGsnIKOwHmbt3BYQ5MD57Jm8wiWr523L/OfnSfdR9STRyTc7lxjYbxw4+L7w/50wR1Z
 OWi8O1tP5sVmWIY6jFOh57tTusxBOdRqdVZwI44nxq+Clwf5elhBi/UisbwWQfDFMy/g0Sgco
 Osb/Zv7VSH+1olpdLxQ/hRV8yZhS0EIMj9Xk/qIvKuQLR6GQi7HUFpv/65ffPePCQUjymnwU0
 xyYliYADv2MShxYrH2NxIOwG98rrVDgYF7WJJSTWqO8Kxbcz9dzV9LLovstshV+BYAeusycHj
 fbuf0O2CvIn9CC/kLZT9npQIANVXSHK3rhsoSAScPonwllgTZiIB3u8qgPSEkMg1bNqt7dnFF
 3C9mWH0DviQZVctsUwcELI3mC+Kve2XgHdPDNJR/WqZxD0sEDgVbKSi1Kq2tfICRJvm7rg+dR
 PRrJdqb/VKJzpghzuEJk3Pmx3BfvGsz4X8foa6WBpeBz9z0lAXdaBvIscPQdFLmBXAvls4WN7
 X87TGE1IAn/dEKhxW41Uhuw5DOG46An/0tIkyua0D6ODODn3yy35Irn1Ads9gu66YDHndmnVt
 fYywmlR0IghEzRmqAGZ3yUtAmpg=
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

The mmap2() syscall allows 32-bit guests to specify the offset into a
file in page units (instead of bytes, as done by mmap(2)).
On physical machines this allows 32-bit applications to map such parts
of large files which are stored beyond the 4GB limit.

Allow the same behaviour when emulating 32-bit guests with qemu.

For that switch the mmap2() function to always take an abi_ullong
(64-bit) offset parameter for target_mmap() and mmap_frag() to avoid an
arithmetical overflow when shifing a 32-bit offset parameter by
12 bits (=3DPAGE_SHIFT) and thus possibly overflow the abi_ulong (32-bit)
type.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/mmap.c      | 9 +++++----
 linux-user/syscall.c   | 2 +-
 linux-user/user-mmap.h | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28135c9e6a..1bd60e28e6 100644
=2D-- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -192,7 +192,7 @@ error:
 /* map an incomplete host page */
 static int mmap_frag(abi_ulong real_start,
                      abi_ulong start, abi_ulong end,
-                     int prot, int flags, int fd, abi_ulong offset)
+                     int prot, int flags, int fd, abi_ullong offset)
 {
     abi_ulong real_end, addr;
     void *host_start;
@@ -430,10 +430,11 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong s=
ize, abi_ulong align)

 /* NOTE: all the constants are the HOST ones */
 abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
-                     int flags, int fd, abi_ulong offset)
+                     int flags, int fd, abi_ullong offset)
 {
-    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_=
len,
+    abi_ulong ret, end, real_start, real_end, retaddr, host_len,
               passthrough_start =3D -1, passthrough_end =3D -1;
+    abi_ullong host_offset;
     int page_flags, host_prot;

     mmap_lock();
@@ -621,7 +622,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, i=
nt target_prot,
         /* map the middle (easier) */
         if (real_start < real_end) {
             void *p;
-            unsigned long offset1;
+            off_t offset1;
             if (flags & MAP_ANONYMOUS)
                 offset1 =3D 0;
             else
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24cea6fb6a..e0a6550769 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10137,7 +10137,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env,=
 int num, abi_long arg1,
 #endif
         ret =3D target_mmap(arg1, arg2, arg3,
                           target_to_host_bitmask(arg4, mmap_flags_tbl),
-                          arg5, arg6 << MMAP_SHIFT);
+                          arg5, ((abi_ullong)arg6) << MMAP_SHIFT);
         return get_errno(ret);
 #endif
     case TARGET_NR_munmap:
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index 480ce1c114..72e99000d9 100644
=2D-- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -20,7 +20,7 @@

 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, abi_ulong offset);
+                     int flags, int fd, abi_ullong offset);
 int target_munmap(abi_ulong start, abi_ulong len);
 abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
                        abi_ulong new_size, unsigned long flags,
=2D-
2.38.1


