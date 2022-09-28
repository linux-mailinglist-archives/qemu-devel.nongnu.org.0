Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724125EE6CB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:46:20 +0200 (CEST)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddwh-0006Z0-Fj
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odder-0008Gw-Mh
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:53 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddeq-0006T0-3A
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:53 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MulyX-1pVBse2o8R-00rsM7; Wed, 28
 Sep 2022 22:27:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 14/37] linux-user: Fix madvise(MADV_DONTNEED) on alpha
Date: Wed, 28 Sep 2022 22:27:14 +0200
Message-Id: <20220928202737.793171-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i0yr5EFEWA1ZQqz3PDG77k6jJS2MM3v1x3uqNeFMNAlhJOHEzdD
 Xdzf2ofk2tIQjY2yP3IhDs99Vjwjq2itNzam5PKBR0k++tGgFHLKuds1hu/zOdwN2j/RMh1
 U0FGhxd91MHak+76W2mCTOs0M1g3iQ5Uv3YpUlEK1W96UDjAcBUKjTeyCXSB3VvN01fzyMo
 rbFM9F7qP87ADJlXQRjfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8cTgGsrrg28=:d21UEtRTAekW5x3SdirhkY
 5LZuEapYPNRjiLiW8NOFzD7van3mg3ITREPy/1+2etQvdgw7ZgCOVi+L2kE8X2nATOr8sr5ZE
 08251sm+EQddvVf1Rpgybe6qoQyklpOvmgU0/03tkAcFMPoommqdjz8eks0Y0W9qc5RVMjibR
 QFhDhGEkWkyPQ3Z8mk95oiLJI9Slvk7gD89CdP8MWL4KsBk6xnEO+eryxx5VHD9B0qbBUUFEy
 LyIRy18oIv0x9e+NnKtx0YF6C/a3Kvdgz2mgWFYL5X4hzC8h0Xy8EEQpm60GEQpieh6GISzLr
 bkxO0IML5iaNKzwi2qdvtpbJmHir0eyF74XKhU711cGX84Qy5J+UokEkZB1VjExbEEc6vju65
 GuqibE9USQS7UpATpJeQFaS8OBz6OUqWsBiezZQDE7RbwDZQZFV5/sjT7NvpMzAh4mI7bH6uk
 uJzgtEyr/+sb7m2pdvV/1s4V6hp8wQcy4ASN23I0cj756G3m6pfyI9Vfx3Mn2OsNM4Beu/Uad
 2bag5zFqUb8x9BBnOiVHToI4ZMOs0SEa1uRVDAslX0ZH2Pf3ZvX/0o20Mp0/FCSabfKZ2MRsF
 C8UXbpOKU6trPIJKkobnls9dJR8d5pMwEHsSPKQGTaPWW7po4zCJqTZfVLR+9lQNcdhYO6rap
 fn05AgyLT4K5NdujI1CqSoUZJNHWH2YI7l+mjkID02kHN/Yd2cV/+XsHkpLwEBx3nTeeV7iNV
 Ggs/geDGxGeWEFmx0/i3UdU/IOnT4q8NxWgvNfMB0knNuASmEt8W/9dEOe9ja5Zb+0GCcAY9+
 xM1qlVt
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

MADV_DONTNEED has a different value on alpha, compared to all the other
architectures. Fix by using TARGET_MADV_DONTNEED instead of
MADV_DONTNEED.

Fixes: 892a4f6a750a ("linux-user: Add partial support for MADV_DONTNEED")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220906000839.1672934-3-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 83fdae7034ea..942bec7e8528 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "user-internals.h"
 #include "user-mmap.h"
+#include "target_mman.h"
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
@@ -897,7 +898,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
      * anonymous mappings. In this case passthrough is safe, so do it.
      */
     mmap_lock();
-    if (advice == MADV_DONTNEED &&
+    if (advice == TARGET_MADV_DONTNEED &&
         can_passthrough_madv_dontneed(start, end)) {
         ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
         if (ret == 0) {
-- 
2.37.3


