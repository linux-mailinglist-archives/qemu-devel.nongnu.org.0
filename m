Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A00309ADB
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 07:32:46 +0100 (CET)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l66Ht-0006xD-0a
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 01:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1l66Bh-0002GB-J0; Sun, 31 Jan 2021 01:26:21 -0500
Received: from [162.248.234.2] (port=12362 helo=mail.xes-mad.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1l66Bf-0004TU-AL; Sun, 31 Jan 2021 01:26:20 -0500
Received: from vfazio1.xes-mad.com (vfazio1.xes-mad.com [10.52.16.140])
 by mail.xes-mad.com (Postfix) with ESMTP id D95F12039A;
 Sun, 31 Jan 2021 00:19:53 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1612073993; bh=QdD3u/iRN0rpMXWQy24nSf8fb5h2Oe01FIKMhkaF85Q=;
 h=From:To:Cc:Subject:Date:From;
 b=WJKm4czHW8cMTAetfSTDQiHGnAVpYWYU9QANuwN+U4yiPA/4qTTYlKxxIvTVPRdG0
 l+C5E8pXArjrGNo5iAGv5U4lCkitMzPwPSuSrmQc12rzZdALq4AcA1c7FGdzZJtmpH
 fJMOA10RSDllgNIyEMSW+5MNY9WDviw6OfFyTqdM=
From: Vincent Fazio <vfazio@xes-inc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/elfload: fix address calculation in fallback
 scenario
Date: Sun, 31 Jan 2021 00:19:48 -0600
Message-Id: <20210131061948.15990-1-vfazio@xes-inc.com>
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

Previously, guest_loaddr was not taken into account when returning an
address from pgb_find_hole when /proc/self/maps was unavailable which
caused an improper guest_base address to be calculated.

This could cause a SIGSEGV later in load_elf_image -> target_mmap for
ET_EXEC type images since the mmap MAP_FIXED flag is specified which
could clobber existing mappings at the address returnd by g2h().

  mmap(0xd87000, 16846912, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE|0x100000, -1, 0) = 0xd87000
  munmap(0xd87000, 16846912)              = 0
  write(2, "Locating guest address space @ 0"..., 40Locating guest address space @ 0xd87000) = 40
  mmap(0x1187000, 16850944, PROT_NONE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0) = 0x1187000
  --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x2188310} ---
  +++ killed by SIGSEGV +++

Now, pgd_find_hole accounts for guest_loaddr in this scenario.

Fixes: ad592e37dfcc ("linux-user: provide fallback pgd_find_hole for bare chroots")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8d425f9ed0..6d606b9442 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2242,7 +2242,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     brk = (uintptr_t)sbrk(0);
 
     if (!maps) {
-        return pgd_find_hole_fallback(guest_size, brk, align, offset);
+        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
+        return ret - guest_loaddr;
     }
 
     /* The first hole is before the first map entry. */
-- 
2.30.0


