Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE36309ADA
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 07:32:44 +0100 (CET)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l66Hr-0006u2-Lk
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 01:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1l66Bh-0002GW-S9; Sun, 31 Jan 2021 01:26:22 -0500
Received: from [162.248.234.2] (port=61834 helo=mail.xes-mad.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1l66Bf-0004TV-AC; Sun, 31 Jan 2021 01:26:21 -0500
Received: from vfazio1.xes-mad.com (vfazio1.xes-mad.com [10.52.16.140])
 by mail.xes-mad.com (Postfix) with ESMTP id 6322420015;
 Sun, 31 Jan 2021 00:19:18 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1612073958; bh=CrSi0glCqLNPII+jF/X6HoTptHfWak8ylfpSvO/PoPQ=;
 h=From:To:Cc:Subject:Date:From;
 b=pttSu3VTI697fFL1MaLkXdKj4omvjUX++GhcKyHq/uc138dL/BYN83f33AH0gOZUy
 sO5dMPLSWYDB/+Vdcp7/OI5RP2kXkRZR1K4qwryW9HyD16wuxOOs15xnUBhA8X2Rbt
 aA8ob6NrOldgWjLESZ4xZJVP/8awzUTC4qrPOZbU=
From: Vincent Fazio <vfazio@xes-inc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/elfload: munmap proper address in
 pgd_find_hole_fallback
Date: Sun, 31 Jan 2021 00:18:49 -0600
Message-Id: <20210131061849.12615-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 162.248.234.2 (failed)
Received-SPF: pass client-ip=162.248.234.2; envelope-from=vfazio@xes-inc.com;
 helo=mail.xes-mad.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu,
 Vincent Fazio <vfazio@gmail.com>
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
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a64050713f..5f5f23d2e5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2216,7 +2216,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
             void * mmap_start = mmap((void *) align_start, guest_size,
                                      PROT_NONE, flags, -1, 0);
             if (mmap_start != MAP_FAILED) {
-                munmap((void *) align_start, guest_size);
+                munmap(mmap_start, guest_size);
                 if (MAP_FIXED_NOREPLACE != 0 ||
                     mmap_start == (void *) align_start) {
                     return (uintptr_t) mmap_start + offset;
-- 
2.30.0


