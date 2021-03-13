Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098CC339D74
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:50:33 +0100 (CET)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0um-0000yA-3E
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sS-0007Ak-5h
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:09 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:39879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sG-00075v-Ct
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:07 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MadC8-1lsPgJ0oBO-00c5bI; Sat, 13 Mar 2021 10:47:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] linux-user/elfload: fix address calculation in fallback
 scenario
Date: Sat, 13 Mar 2021 10:47:47 +0100
Message-Id: <20210313094747.2966948-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210313094747.2966948-1-laurent@vivier.eu>
References: <20210313094747.2966948-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ypx7//kkwQSt+PxxQ9JhdJGaZSLCEiDiUl2WnxSxR+hLLc33gA+
 0RLQam29jJrx5LLlSjoRaTBYpcb4Xdf+spy7KbIqFlGH6ZbttBo2le2duDrwG9c6/BtriDx
 cp6VwlpnNDKR9525BQffmBh90+uZ1ajyUa5T6b7aVa9J1+bfamyK1b/v1ynh22HGe0J46aW
 ZmhpACJKA2QRzHtxlaadg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l5AvciM7xMA=:/kvJsT7CY/2u4c0Apr5L7a
 wmgfwXKXkGEzcIZe4Nh9/vAv3Ffyg7Q4i2al5RlPqehai3CSNy/Enhv9phxrtf+hIe9HuAKXk
 +rKVlH9TPjHGJ637BzPf6ODRVeJxFWoiChvNmt91xljtvMZw5SOUJFSkSmkqGX5M105xUTLnQ
 Hx/ptlPj80eKiraewcfbBw5p5XjC7TYQrw6y9fVSRfUQAAnYMZz0Tsqi7CsmzsAUuvaCEtNbR
 wMqX/bza6V0RASCcN0iWg+rAoooxwmDIRoNdL64VjvxjmT/LgHAx+2OMpMHFcQVSyNrGcQYHA
 VpcAbQEyavA+MsfWhmzp3kAl3GeMFlH6BQ85q/FAlsaT3mcoIJJkWdBGTNj92GOo8cfT0y1Uw
 t66h7CqVUnpWVw6Q8M5ulC6mqxV4VxRZxhaSjVSUlqPcixKgDfx/RN2GHBRsV0fgDjxWWDV0m
 CUgbFDJQWA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>, Vincent Fazio <vfazio@gmail.com>
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210131061948.15990-1-vfazio@xes-inc.com>
[lv: updated it to check if ret == -1]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index e525901659d4..c6731013fde2 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2235,7 +2235,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     brk = (uintptr_t)sbrk(0);
 
     if (!maps) {
-        return pgd_find_hole_fallback(guest_size, brk, align, offset);
+        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
+        return ret == -1 ? -1 : ret - guest_loaddr;
     }
 
     /* The first hole is before the first map entry. */
-- 
2.29.2


