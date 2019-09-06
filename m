Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD180AB3BF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 10:12:16 +0200 (CEST)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i69Lr-0002vk-FD
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 04:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i698b-00040q-7a
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i698Z-0003NL-In
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 03:58:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37190)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i698Z-0003Mg-8l; Fri, 06 Sep 2019 03:58:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 59AFB49;
 Fri,  6 Sep 2019 07:58:30 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-162.ams2.redhat.com [10.36.117.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAAE31001955;
 Fri,  6 Sep 2019 07:58:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 09:57:36 +0200
Message-Id: <20190906075750.14791-15-david@redhat.com>
In-Reply-To: <20190906075750.14791-1-david@redhat.com>
References: <20190906075750.14791-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 06 Sep 2019 07:58:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 14/28] s390x/tcg: Always use MMU_USER_IDX
 for CONFIG_USER_ONLY
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although we basically ignore the index all the time for CONFIG_USER_ONLY,
let's simply skip all the checks and always return MMU_USER_IDX in
cpu_mmu_index() and get_mem_index().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu.h       | 4 ++++
 target/s390x/translate.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 79202c0980..163dae13d7 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -328,6 +328,9 @@ extern const VMStateDescription vmstate_s390_cpu;
=20
 static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 {
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
     if (!(env->psw.mask & PSW_MASK_DAT)) {
         return MMU_REAL_IDX;
     }
@@ -351,6 +354,7 @@ static inline int cpu_mmu_index(CPUS390XState *env, b=
ool ifetch)
     default:
         abort();
     }
+#endif
 }
=20
 static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong=
 *pc,
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index b76e10d832..50124520c9 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -318,6 +318,9 @@ static inline uint64_t ld_code4(CPUS390XState *env, u=
int64_t pc)
=20
 static int get_mem_index(DisasContext *s)
 {
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
     if (!(s->base.tb->flags & FLAG_MASK_DAT)) {
         return MMU_REAL_IDX;
     }
@@ -333,6 +336,7 @@ static int get_mem_index(DisasContext *s)
         tcg_abort();
         break;
     }
+#endif
 }
=20
 static void gen_exception(int excp)
--=20
2.21.0


