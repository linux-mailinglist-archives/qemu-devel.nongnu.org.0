Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54DF60DC5
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 00:26:58 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjWfS-0008Ta-4R
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 18:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55098)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hjWUv-0007wr-Vh
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hjWUt-0003dH-NQ
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54132)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hjWUt-0003cq-I0
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5AFA8665F;
 Fri,  5 Jul 2019 22:16:02 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6885B646B9;
 Fri,  5 Jul 2019 22:16:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Fri,  5 Jul 2019 19:14:44 -0300
Message-Id: <20190705221504.25166-23-ehabkost@redhat.com>
In-Reply-To: <20190705221504.25166-1-ehabkost@redhat.com>
References: <20190705221504.25166-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 05 Jul 2019 22:16:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 22/42] i386: Fix signedness of
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


