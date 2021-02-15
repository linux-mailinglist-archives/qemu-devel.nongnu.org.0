Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9F731B9DA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:55:34 +0100 (CET)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdPZ-0005Iz-2J
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFs-00045v-PO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:33 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:34125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFo-0000fy-Jd
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:32 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MmlbE-1lcgGO0i86-00jpok; Mon, 15 Feb 2021 13:45:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] linux-user: Fix loading of BSS segments
Date: Mon, 15 Feb 2021 13:45:13 +0100
Message-Id: <20210215124519.720265-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:15vBzcTUJZyrdXzM1s6zbG8IVaz1RZwT7C1jG7mFqQR6efA3ZZp
 sLVR8querciUvreHWJ/ZzJ6enRAlRe61L2p45bUarZ4mgCH0KuRxBwohplGRKdOH0Zz3L+S
 /w76R4asi1blJEzEExR8+YUY1agkQYrWSgbGAAqDxMmUT8vkN8J4Fo9ijDlV1Bse4AbxDRd
 0nmYzzbs2g+4FhtxlYvwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xpjC7WNSSF4=:NyrFZf4VCTS2P2sbKkwy6j
 2nLIh/Tv41YcN0gQsJZ9MrgZA0MDL4NBumnaYj10s+KPV0H4HpSwrrmjphDCTR/EokWe/Ie7D
 7t5tewrw8imFfXukmj75k4sEcaSxAat+v7NL5rS6pLTO0uAatjOC/m3lcOqLs8jvHM+ZkxcV8
 bi/43mh2g0DEQdFgqKWb0rqdunTaNNiat4GrN8dpfhFFpVRzF3phOxN9mWjTKxhinSny/LUnP
 veUaf1BGTFpBO/oPygZT8l7Yc2HVWaZDn/2z/cY6NXWwd6izwx0fNUUud5v4QQqOx9yrjc8o1
 zm/4YgPqX6i/5HyKWsqtwg5RCGjaXm3aifGyAgVJELjy5jDTi3+J2Ed8vlNPFbU9YWf767L7d
 GfctJSDsjY4LA4aE4OdkOEnikDVzMQKMc7d1DWSA5Ok6MoUYmYhxa2kBs43UDLXsIc8Bafky3
 wokU4s1WmA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

Some ELF binaries encode the .bss section as an extension of the data
ones by setting the segment p_memsz > p_filesz. Some other binaries take
a different route and encode it as a stand-alone PT_LOAD segment with
p_filesz = 0 and p_memsz > 0.

Both the encodings are actually correct per ELF specification but the
ELF loader had some troubles in handling the former: with the old logic
it was very likely to get Qemu to crash in zero_bss when trying to
access unmapped memory.

zero_bss isn't meant to allocate whole zero-filled segments but to
"complete" a previously mapped segment with the needed zero bits.

The fix is pretty simple, if the segment is completely zero-filled we
simply allocate one or more pages (according to p_memsz) and avoid
calling zero_bss altogether.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Message-Id: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a64050713f28..f5bd4076fcf5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2805,14 +2805,16 @@ static void load_elf_image(const char *image_name, int image_fd,
             vaddr = load_bias + eppnt->p_vaddr;
             vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
             vaddr_ps = TARGET_ELF_PAGESTART(vaddr);
-            vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
+
+            vaddr_ef = vaddr + eppnt->p_filesz;
+            vaddr_em = vaddr + eppnt->p_memsz;
 
             /*
-             * Some segments may be completely empty without any backing file
-             * segment, in that case just let zero_bss allocate an empty buffer
-             * for it.
+             * Some segments may be completely empty, with a non-zero p_memsz
+             * but no backing file segment.
              */
             if (eppnt->p_filesz != 0) {
+                vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
                 error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
                                     MAP_PRIVATE | MAP_FIXED,
                                     image_fd, eppnt->p_offset - vaddr_po);
@@ -2820,14 +2822,22 @@ static void load_elf_image(const char *image_name, int image_fd,
                 if (error == -1) {
                     goto exit_mmap;
                 }
-            }
 
-            vaddr_ef = vaddr + eppnt->p_filesz;
-            vaddr_em = vaddr + eppnt->p_memsz;
+                /*
+                 * If the load segment requests extra zeros (e.g. bss), map it.
+                 */
+                if (eppnt->p_filesz < eppnt->p_memsz) {
+                    zero_bss(vaddr_ef, vaddr_em, elf_prot);
+                }
+            } else if (eppnt->p_memsz != 0) {
+                vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_memsz + vaddr_po);
+                error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
+                                    MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS,
+                                    -1, 0);
 
-            /* If the load segment requests extra zeros (e.g. bss), map it.  */
-            if (vaddr_ef < vaddr_em) {
-                zero_bss(vaddr_ef, vaddr_em, elf_prot);
+                if (error == -1) {
+                    goto exit_mmap;
+                }
             }
 
             /* Find the full program boundaries.  */
-- 
2.29.2


