Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BCF2DDC0A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 00:49:58 +0100 (CET)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq31x-0003SC-9Y
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 18:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kq2zJ-0002ji-Dk
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 18:47:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kq2zG-0004bx-IG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 18:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608248828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x4gmdzlQkEGUxDZ1C4GUFcZPEy6i+iT11O6Y0uMZKPw=;
 b=aAxP3ZpQ7y8CXFkcG5Qfy4x7jFfxAp0XdXpoV2y6v9+nkh6sbk9S6JfRCA7R15Pp3DKye7
 STGEpEWrwQogADy9sw0kAje9MmWpzi7mQ/ADIYhxJkBWQb989uyGRCHnZHQb1JYtGXlDAM
 OMwvjQua+x3vD/bTHRBqpZ3PIogD3gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-S72ls0fbOw2nTloB11w7Vg-1; Thu, 17 Dec 2020 18:47:05 -0500
X-MC-Unique: S72ls0fbOw2nTloB11w7Vg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE598107ACE4;
 Thu, 17 Dec 2020 23:47:04 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D7CA2BFE6;
 Thu, 17 Dec 2020 23:47:03 +0000 (UTC)
Date: Thu, 17 Dec 2020 18:47:02 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PULL 07/17] i386: move hyperv_vendor_id initialization to
 x86_cpu_realizefn()
Message-ID: <20201217234702.GP3140057@habkost.net>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
 <20201217184620.3945917-8-ehabkost@redhat.com>
 <e3168f16-b338-d758-34f6-ee5bff41e918@suse.de>
 <20201217225313.GO3140057@habkost.net>
 <5deb513d-336f-fadb-a15f-75f51e2211ed@suse.de>
MIME-Version: 1.0
In-Reply-To: <5deb513d-336f-fadb-a15f-75f51e2211ed@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 18, 2020 at 12:34:46AM +0100, Claudio Fontana wrote:
> On 12/17/20 11:53 PM, Eduardo Habkost wrote:
> > On Thu, Dec 17, 2020 at 11:33:57PM +0100, Claudio Fontana wrote:
> >> Hello all,
> >>
> >> On 12/17/20 7:46 PM, Eduardo Habkost wrote:
> >>> From: Vitaly Kuznetsov <vkuznets@redhat.com>
> >>>
> >>> As a preparation to expanding Hyper-V CPU features early, move
> >>> hyperv_vendor_id initialization to x86_cpu_realizefn(). Introduce
> >>> x86_cpu_hyperv_realize() to not not pollute x86_cpu_realizefn()
> >>> itself.
> >>
> >> this seems to fit very well the ongoing work on separating accelerator specific realize functions;
> >>
> >> related to the previous discussions about the class hierarchies,
> >> do you think that we should have a separate class in target/i386/kvm/ for a hyperv variant of the kvm-cpu.c?
> >>
> >> Should it be a separate class or a subclass of "kvm-accel-x86_64-cpu" ?
> > 
> > I don't see how a separate QOM class for Hyper-V would be helpful
> > here.  What would be the problem you are trying to solve in this
> > case?
> 
> there is now a call to accelerator specific code x86_hyperv_cpu_realize just before cpu_exec_realize,
> tying the generic target/i386/cpu.c code to kvm/hyperv-specific accel initialization.
> 
> if this is just a feature of the kvm accel, maybe I should just move all to kvm-cpu.c and that's it.

That would make sense.  If we decide this is a KVM-specific
feature, this code can be moved to kvm_cpu_realizefn(), provided
by the kvm-accel-x86_64-cpu class added by your series.

However, I'm not sure we can say this is a KVM-specific feature.
The feature is currently only supported by the KVM accelerator,
but I'd say it is a generic feature.

-- 
Eduardo


