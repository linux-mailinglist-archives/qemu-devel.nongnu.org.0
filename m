Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF1D135CAC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 16:24:40 +0100 (CET)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipZfq-0000Qi-FB
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 10:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ipZdN-0006Sr-J6
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:22:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ipZdK-0002GJ-GU
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:22:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30260
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ipZdK-0002Bq-7u
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578583321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkPqCUD4XkIHW5a1LsjZ+v2acwoaiMCCGZAUZ9gBdJI=;
 b=C5fS2d+Ursebd+zTF6wshVph08byTt4IlSOU4W8Wl7AZoiTlCg85j/q0+9/Csd8JCHdfah
 Dq51wW7MALXY3lcuUMPV/upjialsC/SOFu9qG852W7vESdfOJ+RAKmSZzwqA4UNCuGQPQg
 6/H+ryYbFa0rsXDJN3HKd3ESCWBjRbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-Gscak5j0MSqJfyybuFHsGw-1; Thu, 09 Jan 2020 10:21:59 -0500
X-MC-Unique: Gscak5j0MSqJfyybuFHsGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAC11804910;
 Thu,  9 Jan 2020 15:21:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F1180608;
 Thu,  9 Jan 2020 15:21:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/15] target/arm/kvm: Use CPUState::kvm_state in
 kvm_arm_pmu_supported()
Date: Thu,  9 Jan 2020 16:21:19 +0100
Message-Id: <20200109152133.23649-2-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-1-philmd@redhat.com>
References: <20200109152133.23649-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVMState is already accessible via CPUState::kvm_state, use it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/kvm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b87b59a02a..8d82889150 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -181,9 +181,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
=20
 bool kvm_arm_pmu_supported(CPUState *cpu)
 {
-    KVMState *s =3D KVM_STATE(current_machine->accelerator);
-
-    return kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
+    return kvm_check_extension(cpu->kvm_state, KVM_CAP_ARM_PMU_V3);
 }
=20
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
--=20
2.21.1


