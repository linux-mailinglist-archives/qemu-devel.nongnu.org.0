Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EAF391D6F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:00:13 +0200 (CEST)
Received: from localhost ([::1]:52078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwtA-0004Y3-9B
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llwqC-0002Wk-FH
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1llwq7-00008F-S8
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048221;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/E1zRKy22hQflBQKNHHIXyCaNj0DFPnik7y+EzsA1xs=;
 b=jOPn0/bVXdG+ZgdZfoPdDKBCuVhEN0DKcCx3sluxI3RtWeqpmjKf9zTq8x1NDwm6PdLOkw
 nXPU+6pxTjLUmR3/fa5+y4TqrqTS3qcv+Dejqrx/LIWlJiWS2kOgeYS4AAPk2bXy59qavZ
 JArap5Qun8iYPhX3qfFXOIfmZBJEmbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-gNGGSlDsNYuRPZ47etqv1A-1; Wed, 26 May 2021 12:56:58 -0400
X-MC-Unique: gNGGSlDsNYuRPZ47etqv1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F14A100747C
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:56:57 +0000 (UTC)
Received: from redhat.com (ovpn-115-19.ams2.redhat.com [10.36.115.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B04955D9D3;
 Wed, 26 May 2021 16:56:55 +0000 (UTC)
Date: Wed, 26 May 2021 17:56:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 13/19] i386: prefer system KVM_GET_SUPPORTED_HV_CPUID
 ioctl over vCPU's one
Message-ID: <YK591Ge2KV+betiE@redhat.com>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-14-vkuznets@redhat.com>
 <20210521214202.g222ullptiseaesq@habkost.net>
 <87h7is72rp.fsf@vitty.brq.redhat.com>
 <20210526164625.ci5xou7ikuiqkrpz@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210526164625.ci5xou7ikuiqkrpz@habkost.net>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 12:46:25PM -0400, Eduardo Habkost wrote:
> On Mon, May 24, 2021 at 02:08:26PM +0200, Vitaly Kuznetsov wrote:
> [...]
> > >> @@ -980,7 +989,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
> > >>       * information early, just check for the capability and set the bit
> > >>       * manually.
> > >>       */
> > >> -    if (kvm_check_extension(cs->kvm_state,
> > >> +    if (!do_sys_ioctl && kvm_check_extension(cs->kvm_state,
> > >>                              KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
> > >
> > > Oh, this conditional replaces the comment I suggested in patch
> > > 10/19.  It makes it obvious that the hack can be deleted if we
> > > remove support for the VCPU ioctl.
> > >
> > > So, when exactly will we be able to delete the VCPU ioctl code
> > > and support only the system ioctl?
> > 
> > When QEMU drops support for kernels < 5.11? Note, current RHEL8 already
> > supports system version so we're talking about upstream kernels/Ubuntu
> > LTS/... 
> > 
> > I remember there was a list of supported kernels for QEMU somewhere but
> > don't seem to be able to find it quickly, could you maybe point me in
> > the right direction?
> 
> The KVM-specific kernel requirement is documented here:
> https://qemu-project.gitlab.io/qemu/system/target-i386.html?highlight=kvm#os-requirements
> 
> I took a while to find it.  Maybe we should have a more visible
> "runtime requirements" section in the docs, or it should be
> moved to the supported build platforms section.
> 
> We have a clear policy on supported build platforms
> [https://qemu-project.gitlab.io/qemu/system/build-platforms.html],
> but not a clear policy for KVM kernel dependencies.

While it says "supported build platforms", that was implicitly
assumed to also refer to "runtime platforms". We should just
rename it to "supported-platforms.html" to make it more obvious.

Thus, the minimum KVM kernel version we need follows the same rules.
Look at whatever is the oldest kernel across the distros we target.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


