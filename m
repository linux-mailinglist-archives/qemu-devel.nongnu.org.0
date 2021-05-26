Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA60391D5C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:54:15 +0200 (CEST)
Received: from localhost ([::1]:46152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwnO-0000Jg-21
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llwgO-0002Vt-Ld
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llwg3-00048L-4s
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622047590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMsru0vboXa1b9pEkWt8wQ8HDt4zDepFCQtqPEXOI50=;
 b=BeVOI9fb3NJHbSVG3Bh/6vMV7fh79+ZFqI0jEtdaFwJ3qF7FCbYDciWo5p9WuncIlkpDAW
 BRvD2MzOIcRg6GbfOUQF2QetZb5YZgxZg3WcaPs+7AONtPXypA6dTQ5BMQFkd1uW4MS7Yw
 YPj/PkzXq3wovmDVsegRErVDldDZdA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562--nEHIzpKObSuWd0w3Ty1dg-1; Wed, 26 May 2021 12:46:27 -0400
X-MC-Unique: -nEHIzpKObSuWd0w3Ty1dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A704A107ACE8
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:46:26 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 752A160875;
 Wed, 26 May 2021 16:46:26 +0000 (UTC)
Date: Wed, 26 May 2021 12:46:25 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 13/19] i386: prefer system KVM_GET_SUPPORTED_HV_CPUID
 ioctl over vCPU's one
Message-ID: <20210526164625.ci5xou7ikuiqkrpz@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-14-vkuznets@redhat.com>
 <20210521214202.g222ullptiseaesq@habkost.net>
 <87h7is72rp.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87h7is72rp.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, May 24, 2021 at 02:08:26PM +0200, Vitaly Kuznetsov wrote:
[...]
> >> @@ -980,7 +989,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
> >>       * information early, just check for the capability and set the bit
> >>       * manually.
> >>       */
> >> -    if (kvm_check_extension(cs->kvm_state,
> >> +    if (!do_sys_ioctl && kvm_check_extension(cs->kvm_state,
> >>                              KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
> >
> > Oh, this conditional replaces the comment I suggested in patch
> > 10/19.  It makes it obvious that the hack can be deleted if we
> > remove support for the VCPU ioctl.
> >
> > So, when exactly will we be able to delete the VCPU ioctl code
> > and support only the system ioctl?
> 
> When QEMU drops support for kernels < 5.11? Note, current RHEL8 already
> supports system version so we're talking about upstream kernels/Ubuntu
> LTS/... 
> 
> I remember there was a list of supported kernels for QEMU somewhere but
> don't seem to be able to find it quickly, could you maybe point me in
> the right direction?

The KVM-specific kernel requirement is documented here:
https://qemu-project.gitlab.io/qemu/system/target-i386.html?highlight=kvm#os-requirements

I took a while to find it.  Maybe we should have a more visible
"runtime requirements" section in the docs, or it should be
moved to the supported build platforms section.

We have a clear policy on supported build platforms
[https://qemu-project.gitlab.io/qemu/system/build-platforms.html],
but not a clear policy for KVM kernel dependencies.

There's a table with Python and GCC versions at
[https://wiki.qemu.org/Supported_Build_Platforms].
Maybe it could include kernel version information as well.

-- 
Eduardo


