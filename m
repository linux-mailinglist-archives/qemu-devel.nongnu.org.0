Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E897A341D0D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:40:41 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNEQi-0006Ma-Mu
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lNEON-0005Xb-OH
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lNEOJ-0000UC-Bg
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616157487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WtN2veN2OXQg3V1xJGwr9EPz6jYHWLQCOjn4GhvTTJY=;
 b=g0P+6M73ScB4m9P2uiKSEHT30+cv0fwfPNribo+qGUkZfu7TWxujSQmLfzFXWoiV3uld5i
 XNyR6EiVIV0g0siVA2FoHQI/vMKb/tWzwK+AitMCGWvWMVRqEkrM9QejC/7K2sQDXsEA6+
 pLjThZUNNwtcodQZ+hOwQappzvoKA/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-TxOqslWqOFWtEcR-veJg6Q-1; Fri, 19 Mar 2021 08:38:06 -0400
X-MC-Unique: TxOqslWqOFWtEcR-veJg6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 255151926DA0;
 Fri, 19 Mar 2021 12:38:05 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 443A819C79;
 Fri, 19 Mar 2021 12:38:03 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] i386: Make migration fail when Hyper-V reenlightenment was
 enabled but 'user_tsc_khz' is unset
Date: Fri, 19 Mar 2021 13:38:01 +0100
Message-Id: <20210319123801.1111090-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM doesn't fully support Hyper-V reenlightenment notifications on
migration. In particular, it doesn't support emulating TSC frequency
of the source host by trapping all TSC accesses so unless TSC scaling
is supported on the destination host and KVM_SET_TSC_KHZ succeeds, it
is unsafe to proceed with migration.

KVM_SET_TSC_KHZ is called from two sites: kvm_arch_init_vcpu() and
kvm_arch_put_registers(). The later (intentionally) doesn't propagate
errors allowing migrations to succeed even when TSC scaling is not
supported on the destination. This doesn't suit 're-enlightenment'
use-case as we have to guarantee that TSC frequency stays constant.

Require 'tsc-frequency=' command line option to be specified for successful
migration when re-enlightenment was enabled by the guest.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
This patch is a successor of "[PATCH 3/3] i386: Make sure
kvm_arch_set_tsc_khz() succeeds on migration when 'hv-reenlightenment'
was exposed" taking a different approach suggested by Paolo.
---
 docs/hyperv.txt                |  5 +++++
 target/i386/kvm/hyperv-proto.h |  1 +
 target/i386/machine.c          | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 5df00da54fc4..e53c581f4586 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -160,6 +160,11 @@ the hypervisor) until it is ready to switch to the new one. This, in conjunction
 with hv-frequencies, allows Hyper-V on KVM to pass stable clocksource (Reference
 TSC page) to its own guests.
 
+Note, KVM doesn't fully support re-enlightenment notifications and doesn't
+emulate TSC accesses after migration so 'tsc-frequency=' CPU option also has to
+be specified to make migration succeed. The destination host has to either have
+the same TSC frequency or support TSC scaling CPU feature.
+
 Recommended: hv-frequencies
 
 3.16. hv-evmcs
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index 056a305be38c..e30d64b4ade4 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -139,6 +139,7 @@
  * Reenlightenment notification MSRs
  */
 #define HV_X64_MSR_REENLIGHTENMENT_CONTROL      0x40000106
+#define HV_REENLIGHTENMENT_ENABLE_BIT           (1u << 16)
 #define HV_X64_MSR_TSC_EMULATION_CONTROL        0x40000107
 #define HV_X64_MSR_TSC_EMULATION_STATUS         0x40000108
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 7259fe6868c6..137604ddb898 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -883,11 +883,31 @@ static bool hyperv_reenlightenment_enable_needed(void *opaque)
         env->msr_hv_tsc_emulation_status != 0;
 }
 
+static int hyperv_reenlightenment_post_load(void *opaque, int version_id)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    /*
+     * KVM doesn't fully support re-enlightenment notifications so we need to
+     * make sure TSC frequency doesn't change upon migration.
+     */
+    if ((env->msr_hv_reenlightenment_control & HV_REENLIGHTENMENT_ENABLE_BIT) &&
+        !env->user_tsc_khz) {
+        error_report("Guest enabled re-enlightenment notifications, "
+                     "'tsc-frequency=' has to be specified");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_msr_hyperv_reenlightenment = {
     .name = "cpu/msr_hyperv_reenlightenment",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = hyperv_reenlightenment_enable_needed,
+    .post_load = hyperv_reenlightenment_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(env.msr_hv_reenlightenment_control, X86CPU),
         VMSTATE_UINT64(env.msr_hv_tsc_emulation_control, X86CPU),
-- 
2.30.2


