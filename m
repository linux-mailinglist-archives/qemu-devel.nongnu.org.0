Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5E22071AC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:00:51 +0200 (CEST)
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo398-0002X9-OR
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zz-0001Z1-MX
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51762
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zx-0001QC-2V
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592995880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G0fxQjUvS31mvtxaUp0D7yZJbxAdTCXA9Iw4PMRAuPo=;
 b=EDnl2vMVCKyfVf/U++8kVfilQRlao1fGTiP001k+fC7umQxqfDOSwZxM6aP8OtvGB1TBzL
 hvxc3j54ez1jFGU67vfwe5qfKyVgRI7FFzsgzUq67IplUVfa4VC1yB0meRXch7q0eBhgSK
 0azxGTqoyJT5iIhOReaVhYsEjLs4CK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-2g3qXzjPNLOJkyqw0rn3lQ-1; Wed, 24 Jun 2020 06:51:18 -0400
X-MC-Unique: 2g3qXzjPNLOJkyqw0rn3lQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8434107ACCA
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 10:51:17 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B28961981;
 Wed, 24 Jun 2020 10:51:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/31] kvm: i386: allow TSC to differ by NTP correction bounds
 without TSC scaling
Date: Wed, 24 Jun 2020 06:50:44 -0400
Message-Id: <20200624105048.375353-27-pbonzini@redhat.com>
In-Reply-To: <20200624104917.375143-1-pbonzini@redhat.com>
References: <20200624104917.375143-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marcelo Tosatti <mtosatti@redhat.com>

The Linux TSC calibration procedure is subject to small variations
(its common to see +-1 kHz difference between reboots on a given CPU, for example).

So migrating a guest between two hosts with identical processor can fail, in case
of a small variation in calibrated TSC between them.

Allow a conservative 250ppm error between host TSC and VM TSC frequencies,
rather than requiring an exact match. NTP daemon in the guest can
correct this difference.

Also change migration to accept this bound.

KVM_SET_TSC_KHZ depends on a kernel interface change. Without this change,
the behaviour remains the same: in case of a different frequency
between host and VM, KVM_SET_TSC_KHZ will fail and QEMU will exit.

Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

Message-Id: <20200616165805.GA324612@fuller.cnet>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 46 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index b3c13cb898..6adbff3d74 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -740,26 +740,62 @@ static bool hyperv_enabled(X86CPU *cpu)
          cpu->hyperv_features || cpu->hyperv_passthrough);
 }
 
+/*
+ * Check whether target_freq is within conservative
+ * ntp correctable bounds (250ppm) of freq
+ */
+static inline bool freq_within_bounds(int freq, int target_freq)
+{
+        int max_freq = freq + (freq * 250 / 1000000);
+        int min_freq = freq - (freq * 250 / 1000000);
+
+        if (target_freq >= min_freq && target_freq <= max_freq) {
+                return true;
+        }
+
+        return false;
+}
+
 static int kvm_arch_set_tsc_khz(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
-    int r;
+    int r, cur_freq;
+    bool set_ioctl = false;
 
     if (!env->tsc_khz) {
         return 0;
     }
 
-    r = kvm_check_extension(cs->kvm_state, KVM_CAP_TSC_CONTROL) ?
+    cur_freq = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
+               kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) : -ENOTSUP;
+
+    /*
+     * If TSC scaling is supported, attempt to set TSC frequency.
+     */
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_TSC_CONTROL)) {
+        set_ioctl = true;
+    }
+
+    /*
+     * If desired TSC frequency is within bounds of NTP correction,
+     * attempt to set TSC frequency.
+     */
+    if (cur_freq != -ENOTSUP && freq_within_bounds(cur_freq, env->tsc_khz)) {
+        set_ioctl = true;
+    }
+
+    r = set_ioctl ?
         kvm_vcpu_ioctl(cs, KVM_SET_TSC_KHZ, env->tsc_khz) :
         -ENOTSUP;
+
     if (r < 0) {
         /* When KVM_SET_TSC_KHZ fails, it's an error only if the current
          * TSC frequency doesn't match the one we want.
          */
-        int cur_freq = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
-                       kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) :
-                       -ENOTSUP;
+        cur_freq = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
+                   kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) :
+                   -ENOTSUP;
         if (cur_freq <= 0 || cur_freq != env->tsc_khz) {
             warn_report("TSC frequency mismatch between "
                         "VM (%" PRId64 " kHz) and host (%d kHz), "
-- 
2.26.2



