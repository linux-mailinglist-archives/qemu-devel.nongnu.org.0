Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A239E44D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:46:52 +0200 (CEST)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIOo-00021V-Uy
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lqINW-0001Cp-PK
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lqINT-00035b-W1
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623084327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=42y7mhmG0rgwwVZ+qeNLYgWx4DJGBvskztl2B3UE/LI=;
 b=UyJNZrGEaAcyU6fEb6bdX0QEWUSxtghoJ7olwhnsuKauesw9S6duf4TmTJKIzCoAlMAZF0
 3MW0KXrZ953lIK11yQ+MGh0Ajcaa2CcFEjweZ1gfWFRwCJBtTcSjXuChU+QWcq1xTd+aGc
 yGKaWee5UDd9NJjQw2yaGtVQBxaGZgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-z_AMm-mwNqKC-1VxVnDhGA-1; Mon, 07 Jun 2021 12:45:25 -0400
X-MC-Unique: z_AMm-mwNqKC-1VxVnDhGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D845210074A7
 for <qemu-devel@nongnu.org>; Mon,  7 Jun 2021 16:45:24 +0000 (UTC)
Received: from localhost (ovpn-116-131.gru2.redhat.com [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC3959441;
 Mon,  7 Jun 2021 16:45:24 +0000 (UTC)
Date: Mon, 7 Jun 2021 13:45:22 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 8/9] i386: Hyper-V SynIC requires
 POST_MESSAGES/SIGNAL_EVENTS priviliges
Message-ID: <20210607164522.qpm5rnjtfyxrrglx@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-9-vkuznets@redhat.com>
 <20210603230017.3goxm7fdu5fpdkdw@habkost.net>
 <871r9i13r4.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <871r9i13r4.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 04, 2021 at 09:35:27AM +0200, Vitaly Kuznetsov wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Jun 03, 2021 at 01:48:34PM +0200, Vitaly Kuznetsov wrote:
> >> When Hyper-V SynIC is enabled, we may need to allow Windows guests to make
> >> hypercalls (POST_MESSAGES/SIGNAL_EVENTS). No issue is currently observed
> >> because KVM is very permissive, allowing these hypercalls regarding of
> >> guest visible CPUid bits.
> >> 
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >>  target/i386/kvm/hyperv-proto.h | 6 ++++++
> >>  target/i386/kvm/kvm.c          | 6 ++++++
> >>  2 files changed, 12 insertions(+)
> >> 
> >> diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
> >> index e30d64b4ade4..5fbb385cc136 100644
> >> --- a/target/i386/kvm/hyperv-proto.h
> >> +++ b/target/i386/kvm/hyperv-proto.h
> >> @@ -38,6 +38,12 @@
> >>  #define HV_ACCESS_FREQUENCY_MSRS     (1u << 11)
> >>  #define HV_ACCESS_REENLIGHTENMENTS_CONTROL  (1u << 13)
> >>  
> >> +/*
> >> + * HV_CPUID_FEATURES.EBX bits
> >> + */
> >> +#define HV_POST_MESSAGES             (1u << 4)
> >> +#define HV_SIGNAL_EVENTS             (1u << 5)
> >> +
> >>  /*
> >>   * HV_CPUID_FEATURES.EDX bits
> >>   */
> >> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> >> index a3897d4d8788..6a32d43e6ec1 100644
> >> --- a/target/i386/kvm/kvm.c
> >> +++ b/target/i386/kvm/kvm.c
> >> @@ -1343,6 +1343,12 @@ static int hyperv_fill_cpuids(CPUState *cs,
> >>      /* Unconditionally required with any Hyper-V enlightenment */
> >>      c->eax |= HV_HYPERCALL_AVAILABLE;
> >>  
> >> +    /* SynIC and Vmbus devices require messages/signals hypercalls */
> >> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC) &&
> >> +        !cpu->hyperv_synic_kvm_only) {
> >> +        c->ebx |= HV_POST_MESSAGES | HV_SIGNAL_EVENTS;
> >
> > Why exactly is the hyperv_synic_kvm_only check needed?
> >
> 
> 'hyperv_synic_kvm_only' means SynIC is only used for in-KVM stimers and
> in this case Post Messages / Signal Events hypercalls are not used. KVM
> will also return an error to the guest directly (as it can't forward
> them to QEMU). No need to expose HV_POST_MESSAGES | HV_SIGNAL_EVENTS.
> 
> > Is the hyperv_synic_kvm_only check the only reason this was done
> > here and not at kvm_hyperv_properties?
> >
> 
> Yes, basically.

Thanks for the clarification!

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


