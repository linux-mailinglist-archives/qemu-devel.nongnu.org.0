Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE1339D73
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:50:22 +0100 (CET)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0ub-0000oH-PJ
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sU-0007BR-3j
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:10 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:52201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sG-00075s-AZ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:09 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M27ix-1lJ53x1Luj-002Tvz; Sat, 13 Mar 2021 10:47:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] linux-user/elfload: munmap proper address in
 pgd_find_hole_fallback
Date: Sat, 13 Mar 2021 10:47:45 +0100
Message-Id: <20210313094747.2966948-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210313094747.2966948-1-laurent@vivier.eu>
References: <20210313094747.2966948-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ARPqbZM7H4YlmUK/sMpbATnHDzHRqg7ulXMGpTkzgiXqmGdYIef
 ojC291BX4+K6K98BABMRZMb1ag+VUyyyySRJJF067SzF2LxiG8orxL1xSIjHZV4xoadLTy1
 AuoJHr1iGQ0XwrB4fHeEb5i0N1PggruSNbS476ohOjOd5P0MCuJTkEZAtoAuS28SlJMUGg8
 dSZePlqgopn8ZIHpEguiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ajBkhAo/r94=:ff1BMVkCQbI/FbsUILc3+2
 ofHpyx+MS7qTyOiPka5OArG4HawsFuL2gkFGk+qPB9m5ngcZHhOQqBqzYJY4PpKQ8hEQFaBCT
 08ZSj0z38+z5l1CYie7wIuFHgfBsSBr1kUqmaQCybAfbX6YGr3bVEqIIYui2uioJVUwW6fgLq
 OQg4tL6WESmLXghlZUqtjMK8mp+qX7UdN4TZeJ4DuTkHurMzVScxCIFaFgKg0y1Lb0i3A7itw
 9LiGyspjafUuq964CoggA15WF7gtkDRb3Ylqzdx5B06hl9SQFj3G98kXPWQR89Hspi7nj4n09
 O5W6c1e0sdnVS7N0OLuakTcYjDUDltqrJANFVLP1jbc4bY5mjYIWruWgrFdOHwtBz9GS5LzCB
 MHo/3zMQrp318CGkpAH1sogpSeb4nnDrNFdJd2YdrF87eb625xCeKHLuZAI9dolGiehRWtg/j
 4v0pskpi1w==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Vincent Fazio <vfazio@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vincent Fazio <vfazio@gmail.com>

Previously, if the build host's libc did not define MAP_FIXED_NOREPLACE
or if the running kernel didn't support that flag, it was possible for
pgd_find_hole_fallback to munmap an incorrect address which could lead to
SIGSEGV if the range happened to overlap with the mapped address of the
QEMU binary.

  mmap(0x1000, 22261224, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0) = 0x7f889d331000
  munmap(0x1000, 22261224)                = 0
  --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x84b817} ---
  ++ killed by SIGSEGV +++

Now, always munmap the address returned by mmap.

Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fallback")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210131061849.12615-1-vfazio@xes-inc.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 140a9716324d..174ee7bad677 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2209,7 +2209,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
             void * mmap_start = mmap((void *) align_start, guest_size,
                                      PROT_NONE, flags, -1, 0);
             if (mmap_start != MAP_FAILED) {
-                munmap((void *) align_start, guest_size);
+                munmap(mmap_start, guest_size);
                 if (MAP_FIXED_NOREPLACE != 0 ||
                     mmap_start == (void *) align_start) {
                     return (uintptr_t) mmap_start + offset;
-- 
2.29.2


