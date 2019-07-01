Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD7B365A1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 22:40:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYchj-0007A2-8V
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 16:40:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hYcdN-0003st-UR
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hYcdM-0008K6-0c
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:35:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42378)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hYcdL-0007U9-Lk; Wed, 05 Jun 2019 16:35:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03C7A3082129;
	Wed,  5 Jun 2019 20:35:14 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-124.ams2.redhat.com [10.36.116.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4980A619A9;
	Wed,  5 Jun 2019 20:35:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 22:33:59 +0200
Message-Id: <20190605203403.29461-30-david@redhat.com>
In-Reply-To: <20190605203403.29461-1-david@redhat.com>
References: <20190605203403.29461-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 05 Jun 2019 20:35:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 29/33] s390x/tcg: Allow
 linux-user to use vector instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Once we unlock S390_FEAT_VECTOR for TCG, we want linux-user to be
able to make use of it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index b1df63d82c..6af1a1530f 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -145,6 +145,9 @@ static void s390_cpu_full_reset(CPUState *s)
 #if defined(CONFIG_USER_ONLY)
     /* user mode should always be allowed to use the full FPU */
     env->cregs[0] |=3D CR0_AFP;
+    if (s390_has_feat(S390_FEAT_VECTOR)) {
+        env->cregs[0] |=3D CR0_VECTOR;
+    }
 #endif
=20
     /* architectured initial value for Breaking-Event-Address register *=
/
--=20
2.21.0


