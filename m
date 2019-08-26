Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB949CB01
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 09:54:09 +0200 (CEST)
Received: from localhost ([::1]:50594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i29pI-0001yB-He
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 03:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i29n1-0000C0-V0
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:51:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i29mz-0002s0-TB
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:51:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55128)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i29mz-0002rg-MB; Mon, 26 Aug 2019 03:51:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DEF033082B5F;
 Mon, 26 Aug 2019 07:51:44 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-227.ams2.redhat.com [10.36.116.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7018A6CE58;
 Mon, 26 Aug 2019 07:51:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Aug 2019 09:51:10 +0200
Message-Id: <20190826075112.25637-6-david@redhat.com>
In-Reply-To: <20190826075112.25637-1-david@redhat.com>
References: <20190826075112.25637-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 26 Aug 2019 07:51:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 5/7] mips/tcg: Call probe_write() for
 CONFIG_USER_ONLY as well
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
Cc: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's call it also for CONFIG_USER_ONLY. While at it, add a FIXME and get
rid of one local variable.

MIPS code probably needs a bigger refactoring in regards of
ensure_writable_pages(), similar to s390x, so for example, watchpoints
can be handled reliably later. The actually accessed addresses should
be probed only, not full pages.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/mips/op_helper.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 34bcc8d884..08d9a4f9f1 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -4537,16 +4537,14 @@ static inline void ensure_writable_pages(CPUMIPSS=
tate *env,
                                          int mmu_idx,
                                          uintptr_t retaddr)
 {
-#if !defined(CONFIG_USER_ONLY)
-    target_ulong page_addr;
+    /* FIXME: Probe the actual accesses (pass and use a size) */
     if (unlikely(MSA_PAGESPAN(addr))) {
         /* first page */
         probe_write(env, addr, 0, mmu_idx, retaddr);
         /* second page */
-        page_addr =3D (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
-        probe_write(env, page_addr, 0, mmu_idx, retaddr);
+        addr =3D (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+        probe_write(env, addr, 0, mmu_idx, retaddr);
     }
-#endif
 }
=20
 void helper_msa_st_b(CPUMIPSState *env, uint32_t wd,
--=20
2.21.0


