Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E002391D2C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:37:15 +0200 (CEST)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwWq-0005VS-DS
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llwV9-0004QT-1V
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llwV6-0008Gl-PS
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622046918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3U+sTbDC/v+4z8/JRegb4z0gj7sqGf7Swk4F8YnsIGk=;
 b=DpBu/tszLSlryzvfqy4B7680JG2aPJCtqqrTU2GfUw9C7fCgEUimQ9UFIEz7SPG+BWIzQu
 1E92GRCvyCvFW+OoI6NQeQrGnq/n2qh15aMh5wu/+sPa8+qvltlMRAaAXSkecAJQqbulhx
 Y4y6hZTmHC3BbnWU8uGncOjjHRm1gFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-hVYKi9ziPiO9xFbVtb9Dfw-1; Wed, 26 May 2021 12:35:16 -0400
X-MC-Unique: hVYKi9ziPiO9xFbVtb9Dfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 489B9800D62
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:35:15 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1198918966;
 Wed, 26 May 2021 16:35:14 +0000 (UTC)
Date: Wed, 26 May 2021 12:35:14 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 10/19] i386: move eVMCS enablement to hyperv_init_vcpu()
Message-ID: <20210526163514.izh52clpynbte747@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-11-vkuznets@redhat.com>
 <20210521212021.lsf2pzfu647ocqj3@habkost.net>
 <87mtsk734q.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87mtsk734q.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Mon, May 24, 2021 at 02:00:37PM +0200, Vitaly Kuznetsov wrote:
[...]
> >> @@ -1455,6 +1454,21 @@ static int hyperv_init_vcpu(X86CPU *cpu)
> >>          }
> >>      }
> >>  
> >> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
> >> +        uint16_t evmcs_version;
> >> +
> >> +        ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
> >> +                                  (uintptr_t)&evmcs_version);
> >> +
> >> +        if (ret < 0) {
> >> +            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
> >> +                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
> >> +            return ret;
> >> +        }
> >> +
> >> +        cpu->hyperv_nested[0] = evmcs_version;
> >
> > Wait, won't this break guest ABI?  Do we want to make
> > HYPERV_FEAT_EVMCS a migration blocker until this is fixed?
> >
> 
> Could you please elaborate on the issue? I read the above is: when 
> evmcs' feature was requested, make an attempt to enable
> KVM_CAP_HYPERV_ENLIGHTENED_VMCS, and bail out if this fails. Propagate
> the the acquired evmcs version to 'cpu->hyperv_nested[]' otherwise.

This will be visible to the guest at CPUID[0x4000000A].EAX,
correct?  You are initializing CPUID data with a value that
change depending on the host.

What is supposed to happen if live migrating to to a host with a
different evmcs_version?

-- 
Eduardo


