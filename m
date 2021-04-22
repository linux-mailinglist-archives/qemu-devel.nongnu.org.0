Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120043684CB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:27:26 +0200 (CEST)
Received: from localhost ([::1]:47702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcAn-0003WF-5f
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbwK-0003uZ-2Z
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbwA-00038t-61
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619107937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmpDfYFECKgXbNmrxUMUhDB4r9v7TgPbNQQGtHlEzsY=;
 b=gAmE2yzy+HL4YAixWhBaNG3Efz1T+pC/hhYevi4A+5SFaqsovd9MYAQ4oocEeUY1ft+eyW
 4onJ33MaONCxVXTIQCaQJ5iTkfxuC/f6Ecp6AOT19O/owglYw+zZVag5fx9bwc/dIZzaxg
 Iza98hZVWalRKdfW8fIqCRgfflOe1sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-KWGwht4sMwynWwNULMOglg-1; Thu, 22 Apr 2021 12:12:15 -0400
X-MC-Unique: KWGwht4sMwynWwNULMOglg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8FD9107ACE6
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:12:14 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 041C35B4A4;
 Thu, 22 Apr 2021 16:12:12 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/19] i386: HV_HYPERCALL_AVAILABLE privilege bit is always
 needed
Date: Thu, 22 Apr 2021 18:11:28 +0200
Message-Id: <20210422161130.652779-18-vkuznets@redhat.com>
In-Reply-To: <20210422161130.652779-1-vkuznets@redhat.com>
References: <20210422161130.652779-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
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

According to TLFS, Hyper-V guest is supposed to check
HV_HYPERCALL_AVAILABLE privilege bit before accessing
HV_X64_MSR_GUEST_OS_ID/HV_X64_MSR_HYPERCALL MSRs but at least some
Windows versions ignore that. As KVM is very permissive and allows
accessing these MSRs unconditionally, no issue is observed. We may,
however, want to tighten the checks eventually. Conforming to the
spec is probably also a good idea.

Add HV_HYPERCALL_AVAILABLE to all 'leaf' features with no dependencies.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c1a77f9b00f..d81451276cd8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -835,6 +835,8 @@ static struct {
     [HYPERV_FEAT_CRASH] = {
         .desc = "crash MSRs (hv-crash)",
         .flags = {
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
+             .bits = HV_HYPERCALL_AVAILABLE},
             {.func = HV_CPUID_FEATURES, .reg = R_EDX,
              .bits = HV_GUEST_CRASH_MSR_AVAILABLE}
         }
@@ -843,28 +845,28 @@ static struct {
         .desc = "reset MSR (hv-reset)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_RESET_AVAILABLE}
+             .bits = HV_HYPERCALL_AVAILABLE | HV_RESET_AVAILABLE}
         }
     },
     [HYPERV_FEAT_VPINDEX] = {
         .desc = "VP_INDEX MSR (hv-vpindex)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_VP_INDEX_AVAILABLE}
+             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_INDEX_AVAILABLE}
         }
     },
     [HYPERV_FEAT_RUNTIME] = {
         .desc = "VP_RUNTIME MSR (hv-runtime)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_VP_RUNTIME_AVAILABLE}
+             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_RUNTIME_AVAILABLE}
         }
     },
     [HYPERV_FEAT_SYNIC] = {
         .desc = "synthetic interrupt controller (hv-synic)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_SYNIC_AVAILABLE}
+             .bits = HV_HYPERCALL_AVAILABLE | HV_SYNIC_AVAILABLE}
         }
     },
     [HYPERV_FEAT_STIMER] = {
@@ -879,7 +881,7 @@ static struct {
         .desc = "frequency MSRs (hv-frequencies)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_ACCESS_FREQUENCY_MSRS},
+             .bits = HV_HYPERCALL_AVAILABLE | HV_ACCESS_FREQUENCY_MSRS},
             {.func = HV_CPUID_FEATURES, .reg = R_EDX,
              .bits = HV_FREQUENCY_MSRS_AVAILABLE}
         }
@@ -888,7 +890,8 @@ static struct {
         .desc = "reenlightenment MSRs (hv-reenlightenment)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_ACCESS_REENLIGHTENMENTS_CONTROL}
+             .bits = HV_HYPERCALL_AVAILABLE |
+             HV_ACCESS_REENLIGHTENMENTS_CONTROL}
         }
     },
     [HYPERV_FEAT_TLBFLUSH] = {
-- 
2.30.2


