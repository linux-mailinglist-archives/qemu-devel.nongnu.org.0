Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC086653BB8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 06:21:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8E0f-0000AJ-EO; Thu, 22 Dec 2022 00:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8E0c-00009F-T5
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 00:20:46 -0500
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8E0b-0001rO-2x
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 00:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671686439; bh=mbHL3EZaE2X/54S/CGztHVNpzXfqEV/TOIQ73dQaMF0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=MahOlgwoNaLTxSiRG5h9eQ1co/5YYobEZ3YjiyjV/IcSrBFKOqsoaaHkYfKdp64Je
 BjhEfRBWb978vhvEaFhsG1DZVTaQTz1k6mKlQD7IT9VQzf0BXKwUnbjN+/aZCbLr24
 vDor9wk6XBPj+RnYshVYqlpnOLJaBokiKPKLnNg5szt8lUXwWP5M12w7oCpr0F890y
 RHP0CYv9xmE0dC1XyhNUJAdotWMynlMhP938gQcfwhUGFV9aEQ10EknreSP68xtkXX
 c8RO6j1XkyPTfN4v+z21iVCaFXK5KuZu063sm7MGwbT139fdcXYcsWu3XakkaWRaDQ
 ALAY7BHqiUntQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.146.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7R1T-1op1Ug29rJ-017kaq; Thu, 22
 Dec 2022 06:20:39 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Allow 64-bit offsets in mmap2() syscall on 32-bit
 targets
Date: Thu, 22 Dec 2022 06:20:21 +0100
Message-Id: <20221222052021.16734-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zRZFe31XavSyliTMpYovsJkLw7aTXe/RYlJKfy795dQBfXvqwfv
 65Chv5yC6pQ4fgyiGs4+xsCicUWL9KX8wu0aAuI+Xko9id+7aECk7JSBNL+EJhFhJfFjkUl
 fKrUzBJTtQLAJ6iacgTiXvP3K8kfStckczhoAsbGod77/3qF3iP2c9Jm97jPUZBO8X+HMTT
 +z2I2cMZW8F0gaJcz6cpQ==
UI-OutboundReport: notjunk:1;M01:P0:WuTA/i8T7h4=;tUGzNsVvmro4vUQifU4TYbDUct9
 i2O/cMWiiMFJsit4vUJdFOYkY9/E5UXF+apk0MuiXwmVWYqCsLTTVfUiAHHdv9Nnf93I0WWwB
 7lyZMTJ6+/dECs3GgFlBHGZXO86JhgregXfEQ2clVlnwQYedyttmZuMqo3AORXXVqsrYLIKbx
 VoIDR9ZzFnUXFgdaLHRcq3IZ0o0N/Qp9plSxU6K4gZNStQ/fHSyH1beO++n17tTUfu72GKQPp
 q1HyHZySuTI44kHSD8//i5p82CTPqnljAPNUL417o1yljcrfpELNZ2nKhBtYzGYYm63JsqClA
 SM6XsEcxGAQZ9KksDWkbKmI6uLI+YapCmQwJUdbtAV9k+gIFdme9nrOiupGS5w4pc4qm4vcc3
 8j2qUZzdvpHFZUfnTZaRX9/FMHoII8ShiwgEGgfMik3QyIbKjtPCj7bMoyyZ/kSfBlA7IrAdl
 SaHfurn4XL92nKlw/z6KqwQulcbe6fIjY3tVSRKEnO880hJ3Wyzr3jOvr63tZ25+Qz195bshW
 0LhwM8AEQF7KtCsNkz+3BPa3YcHntUme1SBNCuL5uBZO56TSowHhOAZk+s69t40xwWzob8jST
 0zhqB4DhdxuFqsrUddvgyorSxu3SEi2wkMm+vmttQzByuohat4XHn/R8XQAne/338RUw8KEFH
 VN9u1/E3nVZxJ6VMdbt2tiB/HX1rOWuMxnyvqito1YwjD2Gk8gyj9hcmdZHGRMol+HB6+3JZ1
 Ie1PZu0/uvlM0oMMn9dufoCubsvh3R3UDRHaz1CFOJyT5hQ/BlRbf/dM7RoPnTxoI1tPYKP04
 WY7mOiDwt6OmiKxcGOy4RVxGmTU5bPrs3/GRMfDXhFLF0MPK3zYu31hvPgmYjMLYM/LC5dYQX
 GZyBOJLCznSo90uMvUZ3AUva4TXnu8Mlpa7MXp+tvI7otqaqefMNsdZcHet3kzajiK2FItJGH
 dNczAxrX+rXeZ08+CxV2mChQN8Q=
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

The mmap2() syscall allows 32-bit guests to specify the offset into a
mapping in 4096-byte units (instead of bytes, as is done by mmap(2)).
This enables applications that use a 32-bit off_t to map large files
(up to 2^44 bytes).

So when emulating the mmap2 syscall the offset parameter is shifted by
12 bits, which then may exceed what the abi_ulong (32-bit) type of the
offset parameter in target_mmap() can hold.

Overcome this possible issue by switching hard to uint64_t in
target_mmap() and mmap_frag().

Note: compile-tested only.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/mmap.c      | 9 +++++----
 linux-user/syscall.c   | 2 +-
 linux-user/user-mmap.h | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c75342108c..43fbd8d957 100644
=2D-- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -192,7 +192,7 @@ error:
 /* map an incomplete host page */
 static int mmap_frag(abi_ulong real_start,
                      abi_ulong start, abi_ulong end,
-                     int prot, int flags, int fd, abi_ulong offset)
+                     int prot, int flags, int fd, uint64_t offset)
 {
     abi_ulong real_end, addr;
     void *host_start;
@@ -430,9 +430,10 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong si=
ze, abi_ulong align)

 /* NOTE: all the constants are the HOST ones */
 abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
-                     int flags, int fd, abi_ulong offset)
+                     int flags, int fd, uint64_t offset)
 {
-    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_=
len,
+    uint64_t host_offset;
+    abi_ulong ret, end, real_start, real_end, retaddr, host_len,
               passthrough_start =3D -1, passthrough_end =3D -1;
     int page_flags, host_prot;

@@ -621,7 +622,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, i=
nt target_prot,
         /* map the middle (easier) */
         if (real_start < real_end) {
             void *p;
-            unsigned long offset1;
+            uint64_t offset1;
             if (flags & MAP_ANONYMOUS)
                 offset1 =3D 0;
             else
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 52693b4239..4fee882cd7 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10144,7 +10144,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env,=
 int num, abi_long arg1,
 #endif
         ret =3D target_mmap(arg1, arg2, arg3,
                           target_to_host_bitmask(arg4, mmap_flags_tbl),
-                          arg5, arg6 << MMAP_SHIFT);
+                          arg5, ((uint64_t)arg6) << MMAP_SHIFT);
         return get_errno(ret);
 #endif
     case TARGET_NR_munmap:
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index 480ce1c114..0aed3df2c4 100644
=2D-- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -20,7 +20,7 @@

 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, abi_ulong offset);
+                     int flags, int fd, uint64_t offset);
 int target_munmap(abi_ulong start, abi_ulong len);
 abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
                        abi_ulong new_size, unsigned long flags,
=2D-
2.38.1


