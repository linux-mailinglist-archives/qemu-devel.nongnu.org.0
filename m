Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF5D39365F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 21:36:32 +0200 (CEST)
Received: from localhost ([::1]:38180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmLny-0008Ps-TL
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 15:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmLmX-00079i-6P
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmLmR-00083C-VK
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622144094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7FAncg573hzYrchFwJIh6gnXkWHcokaBwjCBW4J13E=;
 b=YWZncrhWic7k5D9lcVt+37yVgBmMkBKwNGW03/4PP8vtoQOc/SEdi/vKIMCYBKRBrG/8ce
 oGozQt6A5xDqZdjJk/DP6PBAEqoyIq5nuiQnjTxkwNatvHUAcYkYXaXf1qNc/lXjhwghjP
 04KdfJtKl+EmmOdKtd0qiWBluSNqvLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-qznQKA-8PDSnsNIgLqgdzA-1; Thu, 27 May 2021 15:34:52 -0400
X-MC-Unique: qznQKA-8PDSnsNIgLqgdzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0F42107ACE4
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 19:34:51 +0000 (UTC)
Received: from localhost (ovpn-117-209.rdu2.redhat.com [10.10.117.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 700AD5C22B;
 Thu, 27 May 2021 19:34:51 +0000 (UTC)
Date: Thu, 27 May 2021 15:34:50 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 17/19] i386: HV_HYPERCALL_AVAILABLE privilege bit is
 always needed
Message-ID: <20210527193450.gulad2fsqh7hc6p6@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-18-vkuznets@redhat.com>
 <20210521220637.kg6g7lfvpwasnzez@habkost.net>
 <878s44723s.fsf@vitty.brq.redhat.com>
 <20210526170530.ugirlteyzamogysz@habkost.net>
 <87im347hk8.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87im347hk8.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On Thu, May 27, 2021 at 09:37:59AM +0200, Vitaly Kuznetsov wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Mon, May 24, 2021 at 02:22:47PM +0200, Vitaly Kuznetsov wrote:
> >> Eduardo Habkost <ehabkost@redhat.com> writes:
> >> 
> >> > On Thu, Apr 22, 2021 at 06:11:28PM +0200, Vitaly Kuznetsov wrote:
> >> >> According to TLFS, Hyper-V guest is supposed to check
> >> >> HV_HYPERCALL_AVAILABLE privilege bit before accessing
> >> >> HV_X64_MSR_GUEST_OS_ID/HV_X64_MSR_HYPERCALL MSRs but at least some
> >> >> Windows versions ignore that. As KVM is very permissive and allows
> >> >> accessing these MSRs unconditionally, no issue is observed. We may,
> >> >> however, want to tighten the checks eventually. Conforming to the
> >> >> spec is probably also a good idea.
> >> >> 
> >> >> Add HV_HYPERCALL_AVAILABLE to all 'leaf' features with no dependencies.
> >> >> 
> >> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> >
> >> > Are all VMs being created with HV_HYPERCALL_AVAILABLE unset,
> >> > today?
> >> >
> >> 
> >> No, we have HV_HYPERCALL_AVAILABLE encoded in 'hv-relaxed','hv-vapic'
> >> and 'hv-time' features but not 
> >> 
> >> 
> >> > Wouldn't it be simpler to simply add a new
> >> > HYPERV_FEAT_HYPERCALL_AVAILABLE bit to hyperv_features, and
> >> > enabling it by default?
> >> >
> >> 
> >> We could do that but as I note above, we already have it for three
> >> features.
> >
> > Do we have any cases where we do not want to enable
> > HV_HYPERCALL_AVAILABLE?
> >
> > Would it be OK to just hardcoded it in hyperv_fill_cpuids() like
> > we do with HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE?
> >
> 
> struct kvm_hyperv_properties[] serves two purposes:
> 1) Set corresponding guest visible CPUID bits when certain features are
> enabled.
> 
> 2) Check, that KVM supports certain features before we expose them to the
>   guest.

Oh, you're right.

> 
> Whatever we hardcode in hyperv_fill_cpuids() gives us 1) but not 2). For
> this particular bit it probably doesn't matter as even the oldest
> supported kernel (v4.5) has it. That said, I'm OK with moving this to
> hyperv_fill_cpuids().

I'm only worried about the risk of somebody forgetting to
hardcode the HV_HYPERCALL_AVAILABLE bit in new
kvm_hyperv_expand_features[] entries in the future.

A new HYPERV_FEAT_HYPERCALL_AVAILABLE bit (hardcoded to 1 at
kvm_hyperv_expand_features()) would give us feature checking.
But if you're OK with hardcoding it at hyperv_fill_cpuids(), it's
probably the simplest solution.

> [...]

-- 
Eduardo


