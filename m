Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5CE60DE0
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 00:36:19 +0200 (CEST)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjWoU-0000pn-AB
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 18:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55141)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hjWV0-0007y4-O1
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hjWUz-0003fL-No
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48174)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hjWUz-0003f6-Ia
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:16:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD51885543;
 Fri,  5 Jul 2019 22:16:08 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 705FD90CD0;
 Fri,  5 Jul 2019 22:16:08 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Fri,  5 Jul 2019 19:14:47 -0300
Message-Id: <20190705221504.25166-26-ehabkost@redhat.com>
In-Reply-To: <20190705221504.25166-1-ehabkost@redhat.com>
References: <20190705221504.25166-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 05 Jul 2019 22:16:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 25/42] i386: Remove unused host_cpudef
 variable
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

The variable is completely unused, probably a leftover from
previous code clean up.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190625050008.12789-3-ehabkost@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6787da4209..b9d6f32945 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3134,14 +3134,8 @@ static void max_x86_cpu_initfn(Object *obj)
         char vendor[CPUID_VENDOR_SZ + 1] = { 0 };
         char model_id[CPUID_MODEL_ID_SZ + 1] = { 0 };
         int family, model, stepping;
-        X86CPUDefinition host_cpudef = { };
-        uint32_t eax = 0, ebx = 0, ecx = 0, edx = 0;
-
-        host_cpuid(0x0, 0, &eax, &ebx, &ecx, &edx);
-        x86_cpu_vendor_words2str(host_cpudef.vendor, ebx, edx, ecx);
 
         host_vendor_fms(vendor, &family, &model, &stepping);
-
         cpu_x86_fill_model_id(model_id);
 
         object_property_set_str(OBJECT(cpu), vendor, "vendor", &error_abort);
-- 
2.18.0.rc1.1.g3f1ff2140


