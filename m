Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828025EE98
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 23:33:57 +0200 (CEST)
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1himt2-00068O-Hk
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 17:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1himVJ-00069S-3s
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1himVH-00071D-UK
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35106)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1himVH-000703-NX
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C8D9B30832C2;
 Wed,  3 Jul 2019 21:09:22 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58D115D704;
 Wed,  3 Jul 2019 21:09:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Wed,  3 Jul 2019 18:08:01 -0300
Message-Id: <20190703210821.27550-24-ehabkost@redhat.com>
In-Reply-To: <20190703210821.27550-1-ehabkost@redhat.com>
References: <20190703210821.27550-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 03 Jul 2019 21:09:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v5 23/43] i386: Fix signedness of
 hyperv_spinlock_attempts
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current default value for hv-spinlocks is 0xFFFFFFFF (meaning
"never retry").  However, the value is stored as a signed
integer, making the getter of the hv-spinlocks QOM property
return -1 instead of 0xFFFFFFFF.

Fix this by changing the type of X86CPU::hyperv_spinlock_attempts
to uint32_t.  This has no visible effect to guest operating
systems, affecting just the behavior of the QOM getter.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190615200505.31348-1-ehabkost@redhat.com>
Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Reviewed-by: Roman Kagan <rkagan@virtuozzo.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 4d2ae2384e..ff26351538 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1408,7 +1408,7 @@ struct X86CPU {
     CPUNegativeOffsetState neg;
     CPUX86State env;
 
-    int hyperv_spinlock_attempts;
+    uint32_t hyperv_spinlock_attempts;
     char *hyperv_vendor_id;
     bool hyperv_synic_kvm_only;
     uint64_t hyperv_features;
-- 
2.18.0.rc1.1.g3f1ff2140


