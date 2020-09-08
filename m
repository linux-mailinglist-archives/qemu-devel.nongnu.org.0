Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E677260A16
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:32:07 +0200 (CEST)
Received: from localhost ([::1]:54404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFWEg-0002gZ-6Q
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3V-0006Kr-E7; Tue, 08 Sep 2020 01:20:36 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3T-00062w-4M; Tue, 08 Sep 2020 01:20:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bltkt1S8lz9sVm; Tue,  8 Sep 2020 15:20:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599542406;
 bh=oeTwfet2JM4g+Thw1qR7fessfnR6Qs0F3YzSLDUcLJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GTPr9hdFlk4wEAG7l8WiBj+s+Ej+XgIq0h0Ym1Mo3waOYbsZkk88n//1yzWpBo0H9
 97a0jdezjUgPsbsLSZs1eMBT9xPzIl9etllT/JlqUpPMYa4mCiYFkNUxYhuHdpPiqS
 56xVm2lMUK0qtWhG3fd8Dp2jXzI+skO941F/0/g0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 22/33] target/s390x: Use start-powered-off CPUState property
Date: Tue,  8 Sep 2020 15:19:42 +1000
Message-Id: <20200908051953.1616885-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
References: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Note that this changes behavior by setting cs->halted to 1 on reset, which
didn't happen before.

Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Message-Id: <20200826055535.951207-9-bauerman@linux.ibm.com>
[dwg: Fix from Laurent Vivier for user only case]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/s390x/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 08eb674d22..749cd548f0 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -291,9 +291,9 @@ static void s390_cpu_initfn(Object *obj)
     S390CPU *cpu = S390_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
-    cs->halted = 1;
     cs->exception_index = EXCP_HLT;
 #if !defined(CONFIG_USER_ONLY)
+    cs->start_powered_off = true;
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
     cpu->env.tod_timer =
-- 
2.26.2


