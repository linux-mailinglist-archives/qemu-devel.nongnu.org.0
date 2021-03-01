Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119D328025
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:59:54 +0100 (CET)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGj5V-0000t1-Ec
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGixY-0006hb-N5
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGixV-0008Qd-3K
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614606696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5M+K8bs83qCm/w7AXg7FXWxRQ6Ohiihq9e9exPuzGNY=;
 b=Si385XC7lZiNT/OcWc+uMmSzlmwvzPA+laxySljTqdf4cp0yBP1mBhkY8OZeFnDYG0UK99
 J3uzC39FSdCgsrh1zH1pNJVXREXkPLZf63DwADQMD3nh8zWzr+g22H2elEBCa/fpqW6ezi
 seDtSbR3hrue7Sn0KM2K+2RruOoQXU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-_cN4Mg5dMWm429mj-dnhRg-1; Mon, 01 Mar 2021 08:51:34 -0500
X-MC-Unique: _cN4Mg5dMWm429mj-dnhRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0635B108BD0C
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:51:34 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A2D562679;
 Mon,  1 Mar 2021 13:51:32 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/17] i386: prefer system KVM_GET_SUPPORTED_HV_CPUID ioctl
 over vCPU's one
Date: Mon,  1 Mar 2021 14:50:59 +0100
Message-Id: <20210301135103.306003-14-vkuznets@redhat.com>
In-Reply-To: <20210301135103.306003-1-vkuznets@redhat.com>
References: <20210301135103.306003-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM_GET_SUPPORTED_HV_CPUID was made a system wide ioctl which can be called
prior to creating vCPUs and we are going to use that to expand Hyper-V cpu
features early. Use it when it is supported by KVM.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4d301da7375e..264f879cd257 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -928,7 +928,8 @@ static struct {
     },
 };
 
-static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max)
+static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
+                                           bool do_sys_ioctl)
 {
     struct kvm_cpuid2 *cpuid;
     int r, size;
@@ -937,7 +938,11 @@ static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max)
     cpuid = g_malloc0(size);
     cpuid->nent = max;
 
-    r = kvm_vcpu_ioctl(cs, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
+    if (do_sys_ioctl) {
+        r = kvm_ioctl(kvm_state, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
+    } else {
+        r = kvm_vcpu_ioctl(cs, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
+    }
     if (r == 0 && cpuid->nent >= max) {
         r = -E2BIG;
     }
@@ -964,13 +969,17 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
     /* 0x40000000..0x40000005, 0x4000000A, 0x40000080..0x40000080 leaves */
     int max = 10;
     int i;
+    bool do_sys_ioctl;
+
+    do_sys_ioctl =
+        kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID) > 0;
 
     /*
      * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
      * -E2BIG, however, it doesn't report back the right size. Keep increasing
      * it and re-trying until we succeed.
      */
-    while ((cpuid = try_get_hv_cpuid(cs, max)) == NULL) {
+    while ((cpuid = try_get_hv_cpuid(cs, max, do_sys_ioctl)) == NULL) {
         max++;
     }
 
@@ -980,7 +989,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
      * information early, just check for the capability and set the bit
      * manually.
      */
-    if (kvm_check_extension(cs->kvm_state,
+    if (!do_sys_ioctl && kvm_check_extension(cs->kvm_state,
                             KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
         for (i = 0; i < cpuid->nent; i++) {
             if (cpuid->entries[i].function == HV_CPUID_ENLIGHTMENT_INFO) {
-- 
2.29.2


