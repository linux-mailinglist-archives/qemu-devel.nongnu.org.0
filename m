Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C405F1F961A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 14:13:04 +0200 (CEST)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jknz5-0005eN-Sq
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 08:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1jknxh-0004zy-Ig
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 08:11:37 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52136
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1jknxf-0007cv-K7
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 08:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592223094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dEcd7Ou8Wc2IM9OEpa2krlue9KWBHBJ5MmJhN3pvDxo=;
 b=NhSTWWgM62Kf0VcJi89PWUbMs7mBDJvgl3T+qTw6cFkxUWhJrBxKZRPWLqiu/QLBuNrd+A
 wuDaJ6GSNDrx2RtL447BFyukZXA8C+ZCDRaWA4zUUQ3OgqKfHZfjFzpJDTWrqCJXKqOW2B
 R4vYa5DHNZ8CPYhMQDWZghAxYrK6Z/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-reJFroX6NsCuo-629NVw0Q-1; Mon, 15 Jun 2020 08:10:24 -0400
X-MC-Unique: reJFroX6NsCuo-629NVw0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCEE68C23B8;
 Mon, 15 Jun 2020 12:09:52 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-3.gru2.redhat.com [10.97.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F61C80883;
 Mon, 15 Jun 2020 12:09:52 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
 id 31640430716A; Mon, 15 Jun 2020 09:01:27 -0300 (-03)
Date: Mon, 15 Jun 2020 09:01:27 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: qemu-devel <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>
Subject: [PATCH] kvm: i386: allow TSC to differ by NTP correction bounds
 without TSC scaling
Message-ID: <20200615120127.GB224592@fuller.cnet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mtosatti@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:12:36
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


The Linux TSC calibration procedure is subject to small variations
(its common to see +-1 kHz difference between reboots on a given CPU, for example).

So migrating a guest between two hosts with identical processor can fail, in case 
of a small variation in calibrated TSC between them.

Allow a conservative 250ppm error between host TSC and VM TSC frequencies,
rather than requiring an exact match. NTP daemon in the guest can
correct this difference.

Also change migration to accept this bound.

Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 34f8387..257fee4 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -739,23 +739,44 @@ static int kvm_arch_set_tsc_khz(CPUState *cs)
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
-        if (cur_freq <= 0 || cur_freq != env->tsc_khz) {
+        cur_freq = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
+                   kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) :
+                   -ENOTSUP;
+        if (cur_freq <= 0 || (cur_freq != env->tsc_khz &&
+                              !freq_within_bounds(cur_freq, env->tsc_khz))) {
             warn_report("TSC frequency mismatch between "
                         "VM (%" PRId64 " kHz) and host (%d kHz), "
                         "and TSC scaling unavailable",
diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
index 00bde7a..ebf9a64 100644
--- a/target/i386/kvm_i386.h
+++ b/target/i386/kvm_i386.h
@@ -47,4 +47,20 @@ bool kvm_has_x2apic_api(void);
 
 bool kvm_hv_vpindex_settable(void);
 
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
 #endif
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 0c96531..b052654 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -300,7 +300,7 @@ static int cpu_post_load(void *opaque, int version_id)
     int i;
 
     if (env->tsc_khz && env->user_tsc_khz &&
-        env->tsc_khz != env->user_tsc_khz) {
+        !freq_within_bounds(env->tsc_khz, env->user_tsc_khz)) {
         error_report("Mismatch between user-specified TSC frequency and "
                      "migrated TSC frequency");
         return -EINVAL;


