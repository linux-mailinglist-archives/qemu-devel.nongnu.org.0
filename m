Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92666309AD8
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 07:29:33 +0100 (CET)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l66Em-0003n2-M8
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 01:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1l66Bh-0002GC-IK; Sun, 31 Jan 2021 01:26:21 -0500
Received: from [162.248.234.2] (port=24600 helo=mail.xes-mad.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1l66Bf-0004TW-AT; Sun, 31 Jan 2021 01:26:20 -0500
Received: from vfazio1.xes-mad.com (vfazio1.xes-mad.com [10.52.16.140])
 by mail.xes-mad.com (Postfix) with ESMTP id 98C0D20244;
 Sun, 31 Jan 2021 00:19:35 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1612073975; bh=Qeq3vle/+xTsK0znVOE8akBohkhIBMekNQg6OTi38nU=;
 h=From:To:Cc:Subject:Date:From;
 b=UB4SINBUZcZOo26Y042PaNJy6yvQkf0GGif7fQMu7WP7Mg0yuJCxuFGGyv1raBF35
 nEnoZy9HB5CdrV2FsYMVD+GZEY813e9foAfyTmC/VjfbYWSqU63Amhjwjmp+kMQSBc
 bBVsv3yBcqYmzkjw47g7qt8AULFdQCJP741MeGuU=
From: Vincent Fazio <vfazio@xes-inc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE kernel
 support
Date: Sun, 31 Jan 2021 00:19:30 -0600
Message-Id: <20210131061930.14554-1-vfazio@xes-inc.com>
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

Previously, pgd_find_hole_fallback assumed that if the build host's libc
had MAP_FIXED_NOREPLACE defined that the address returned by mmap would
match the requested address. This is not a safe assumption for Linux
kernels prior to 4.17

Now, we always compare mmap's resultant address with the requested
address and no longer short-circuit based on MAP_FIXED_NOREPLACE.

Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fallback")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 linux-user/elfload.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5f5f23d2e5..8d425f9ed0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2217,8 +2217,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
                                      PROT_NONE, flags, -1, 0);
             if (mmap_start != MAP_FAILED) {
                 munmap(mmap_start, guest_size);
-                if (MAP_FIXED_NOREPLACE != 0 ||
-                    mmap_start == (void *) align_start) {
+                if (mmap_start == (void *) align_start) {
                     return (uintptr_t) mmap_start + offset;
                 }
             }
-- 
2.30.0


