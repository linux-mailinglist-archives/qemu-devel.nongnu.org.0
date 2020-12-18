Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6C2DE0F1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:26:05 +0100 (CET)
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCxY-0004OE-6n
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvo-0002qP-JD
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:16 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvm-00072a-U4
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:16 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWAay-1kbU8m32Ec-00XdmA; Fri, 18 Dec 2020 11:24:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/14] linux-user/mmap.c: check range of mremap result in
 target address space
Date: Fri, 18 Dec 2020 11:23:54 +0100
Message-Id: <20201218102407.597566-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j3gKVhnKa4Q0GO+Crgw8R3KLVLNoUemxtY1bDxMsYC0DGKFvUC4
 x98pfaw0kPoov5Je2L+36XKDqBlbkRwwIUHNlFOheVc5CriZqPmnwFLVTUyuSK2WfW6a7M/
 P6FqR42gEKr+MalLahkYtPggrdlinda4nHmXc9fhbYtyqj1KPq+a3zfkR/RAX2Wv3bE5ewM
 QvNsBF47QNqh79UtpkdpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n5UsRjsgMjQ=:G8N/W8rzChePCC7EpvNjvM
 MxskfINOdne9n1S7v8O6zM7rX5Yi5leMAnWWiyZP2ZdmawgP1XFaTTBIeiS3BmtYcIG4J4lgJ
 nQkI3lJM5Wts3KJ9o7EURJqBBMDxU5updAwYnKU8B4XVmBb0AKScd3Bjfy1b2dNYqBxZDK2sQ
 +J12GvuQu3D2rzmTUuGgnKb/4xIrGaisX8nPEJXw5/cl8wBLjNLd/JWd4YFI5qsDY52rih9p2
 3X2PVY4cOKbmlhbqHjKgZkibsp0Qo0Vflbza/AkD665vymQGQIZeLBpVhe4w8n9U1QT6wHD8B
 WrCKxb4FqE3cH/2wPWfPdSunkUI4/mpeoJ2BNOKQdlANBc48SAopziShVhW2gg9YwUKJgHHh/
 XOVB6LOsYLEv+g7CPDBjt99uBShwXFb9TG18Up5kTbjzDsVu9CxkW+PIaZZWY
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Tobias Koch <tobias.koch@nonterra.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobias Koch <tobias.koch@nonterra.com>

If mremap succeeds, an additional check is performed to ensure that the
new address range fits into the target address space. This check was
previously perfomed in host address space, with the upper bound fixed to
abi_ulong.

This patch replaces the static check with a call to `guest_range_valid`,
performing the range check against the actual size of the target address
space. It also moves the corresponding block to prevent it from being
called incorrectly when the mapping itself fails.

Signed-off-by: Tobias Koch <tobias.koch@nonterra.com>
Message-Id: <20201028213833.26592-1-tobias.koch@nonterra.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 00c05e6a0f19..810653c50357 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -767,20 +767,23 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         }
         if (prot == 0) {
             host_addr = mremap(g2h(old_addr), old_size, new_size, flags);
-            if (host_addr != MAP_FAILED && reserved_va && old_size > new_size) {
-                mmap_reserve(old_addr + old_size, old_size - new_size);
+
+            if (host_addr != MAP_FAILED) {
+                /* Check if address fits target address space */
+                if (!guest_range_valid(h2g(host_addr), new_size)) {
+                    /* Revert mremap() changes */
+                    host_addr = mremap(g2h(old_addr), new_size, old_size,
+                                       flags);
+                    errno = ENOMEM;
+                    host_addr = MAP_FAILED;
+                } else if (reserved_va && old_size > new_size) {
+                    mmap_reserve(old_addr + old_size, old_size - new_size);
+                }
             }
         } else {
             errno = ENOMEM;
             host_addr = MAP_FAILED;
         }
-        /* Check if address fits target address space */
-        if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
-            /* Revert mremap() changes */
-            host_addr = mremap(g2h(old_addr), new_size, old_size, flags);
-            errno = ENOMEM;
-            host_addr = MAP_FAILED;
-        }
     }
 
     if (host_addr == MAP_FAILED) {
-- 
2.29.2


