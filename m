Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20B01AB40
	for <lists+qemu-devel@lfdr.de>; Sun, 12 May 2019 10:40:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hPk2S-0005x0-TG
	for lists+qemu-devel@lfdr.de; Sun, 12 May 2019 04:40:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1hPjyM-0003cD-4i
	for qemu-devel@nongnu.org; Sun, 12 May 2019 04:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1hPjyL-0003Gl-9i
	for qemu-devel@nongnu.org; Sun, 12 May 2019 04:36:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53146)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1hPjyI-0003Fp-WC; Sun, 12 May 2019 04:36:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40A748667B;
	Sun, 12 May 2019 08:36:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com
	[10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03F115D706;
	Sun, 12 May 2019 08:36:33 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 12 May 2019 10:36:12 +0200
Message-Id: <20190512083624.8916-2-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sun, 12 May 2019 08:36:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 01/13] target/arm/kvm64: fix error returns
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, armbru@redhat.com,
	abologna@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A couple return -EINVAL's forget their '-'s.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e3ba1492482f..ba232b27a6d3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -841,7 +841,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     write_cpustate_to_list(cpu, true);
=20
     if (!write_list_to_kvmstate(cpu, level)) {
-        return EINVAL;
+        return -EINVAL;
     }
=20
     kvm_arm_sync_mpstate_to_kvm(cpu);
@@ -982,7 +982,7 @@ int kvm_arch_get_registers(CPUState *cs)
     }
=20
     if (!write_kvmstate_to_list(cpu)) {
-        return EINVAL;
+        return -EINVAL;
     }
     /* Note that it's OK to have registers which aren't in CPUState,
      * so we can ignore a failure return here.
--=20
2.20.1


