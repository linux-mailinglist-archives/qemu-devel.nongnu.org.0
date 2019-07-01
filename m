Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5332CB5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 11:24:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXjCG-0001UZ-V5
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 05:24:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hXiwT-00057D-Kb
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 05:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hXiwR-0003V5-Pp
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 05:07:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hXiwR-0003Ot-7B; Mon, 03 Jun 2019 05:07:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E88A309265C;
	Mon,  3 Jun 2019 09:07:39 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.117.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53E7D61981;
	Mon,  3 Jun 2019 09:07:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2019 11:06:34 +0200
Message-Id: <20190603090635.10631-22-david@redhat.com>
In-Reply-To: <20190603090635.10631-1-david@redhat.com>
References: <20190603090635.10631-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 03 Jun 2019 09:07:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 21/22] s390x/tcg: Allow linux-user to use
 vector instructions
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
Cc: Thomas Huth <thuth@redhat.com>, Denys Vlasenko <dvlasenk@redhat.com>,
	David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pino Toscano <ptoscano@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Once we unlock S390_FEAT_VECTOR for TCG, we want linux-user to be
able to make use of it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


