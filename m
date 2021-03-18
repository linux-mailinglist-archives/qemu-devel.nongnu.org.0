Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411B5340CA4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:15:19 +0100 (CET)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxB0-0007jd-Ag
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1lMx0F-0002nZ-BK
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1lMx0C-0006Th-K8
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616090646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sj7rrYOB9obGZumrcJ/k395Ak1tELLz+bnLanikcvTc=;
 b=NopuQa5cH8jdZjrKgixVVUFYuRCmEwBaXNiRTSh4zWha2fzXwC11hpYuiyjhws/pRceYba
 /zyzrh35lkS+j1PoMxyucTUVfT66eNq+2DEfi6mUFa5aSmCIjGeCrKhFt7KfdUzQxi1ry9
 r/U+S3R3zR3TkmgAggJL+Paabuvqsl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-KZ11n-KHNRSGS8h6q-nbNg-1; Thu, 18 Mar 2021 14:04:04 -0400
X-MC-Unique: KZ11n-KHNRSGS8h6q-nbNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCA89108BD08;
 Thu, 18 Mar 2021 18:04:03 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-2.gru2.redhat.com [10.97.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C47746;
 Thu, 18 Mar 2021 18:04:03 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
 id C49164188684; Thu, 18 Mar 2021 15:03:32 -0300 (-03)
Date: Thu, 18 Mar 2021 15:03:32 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
Message-ID: <20210318180332.GA39091@fuller.cnet>
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
 <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
 <87wnu45sev.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87wnu45sev.fsf@vitty.brq.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mtosatti@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mtosatti@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 05:38:00PM +0100, Vitaly Kuznetsov wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > On 18/03/21 17:02, Vitaly Kuznetsov wrote:
> >> KVM doesn't fully support Hyper-V reenlightenment notifications on
> >> migration. In particular, it doesn't support emulating TSC frequency
> >> of the source host by trapping all TSC accesses so unless TSC scaling
> >> is supported on the destination host and KVM_SET_TSC_KHZ succeeds, it
> >> is unsafe to proceed with migration.
> >> 
> >> Normally, we only require KVM_SET_TSC_KHZ to succeed when 'user_tsc_khz'
> >> was set and just 'try' KVM_SET_TSC_KHZ without otherwise.
> >> 
> >> Introduce a new vmstate section (which is added when the guest has
> >> reenlightenment feature enabled) and add env.tsc_khz to it. We already
> >> have env.tsc_khz packed in 'cpu/tsc_khz' but we don't want to be dependent
> >> on the section order.
> >> 
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >
> > Could we instead fail to load the reenlightenment section if 
> > user_tsc_khz was not set?  This seems to be user (well, management) 
> > error really, since reenlightenment has to be enabled manually (or with 
> > hv-passthrough which blocks migration too).

Seems to match the strategy of the patchset...

> Yes, we certainly could do that but what's the added value of
> user_tsc_khz which upper layer will have to set explicitly (probably to
> the tsc frequency of the source host anyway)?

Yes. I think what happened was "evolution":

1) Added support to set tsc frequency (with hardware multiplier)
in KVM, so add -tsc-khz VAL (kHz) option to KVM.

2) Scaling is enabled only if -tsc-khz VAL is supplied.

3) libvirt switches to using -tsc-khz HVAL, where HVAL it retrieves
from KVM_GET_TSC_KHZ of newly created KVM_CREATE_VM instance.

It could have been done inside qemu instead.

> In case we just want to avoid calling KVM_SET_TSC_KHZ twice, we can probably achieve that by
> adding a CPU flag or something.

Avoid calling KVM_SET_TSC_KHZ twice ? Don't see why you would avoid
that.


