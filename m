Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C831D9415
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 16:40:08 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKkT8-0002KW-SB
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 10:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKkNZ-00055Q-Ev
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 10:34:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKkNY-0000iq-FL
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 10:34:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49760)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKkNW-0000hQ-6W; Wed, 16 Oct 2019 10:34:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 64BF1883BA;
 Wed, 16 Oct 2019 14:34:17 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6DEC19C68;
 Wed, 16 Oct 2019 14:34:15 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 2/5] timer: arm: Introduce functions to get the host cntfrq
Date: Wed, 16 Oct 2019 16:34:07 +0200
Message-Id: <20191016143410.5023-3-drjones@redhat.com>
In-Reply-To: <20191016143410.5023-1-drjones@redhat.com>
References: <20191016143410.5023-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 16 Oct 2019 14:34:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When acceleration like KVM is in use it's necessary to use the host's
counter frequency when converting ticks to or from time units.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/timer.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 85bc6eb00b21..8941ddea8242 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -1006,6 +1006,22 @@ static inline int64_t cpu_get_host_ticks(void)
 }
 #endif
=20
+#if defined(__aarch64__)
+static inline uint32_t cpu_get_host_tick_frequency(void)
+{
+    uint64_t frq;
+    asm volatile("mrs %0, cntfrq_el0" : "=3Dr" (frq));
+    return frq;
+}
+#elif defined(__arm__)
+static inline uint32_t cpu_get_host_tick_frequency(void)
+{
+    uint32_t frq;
+    asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=3Dr" (frq));
+    return frq;
+}
+#endif
+
 #ifdef CONFIG_PROFILER
 static inline int64_t profile_getclock(void)
 {
--=20
2.21.0


