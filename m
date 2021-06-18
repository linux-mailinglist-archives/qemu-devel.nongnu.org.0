Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9B3AD3C1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 22:41:27 +0200 (CEST)
Received: from localhost ([::1]:47912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luLIr-0000zN-I1
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 16:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luLHk-0000Bb-82
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:40:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luLHg-0004Ll-Ny
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624048810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qKEO77u/d1G0OLkye+TPueIkTEWwNLFmRctaFbVPAk=;
 b=CzbJb/nBCvzFpIXbES/espgokbb3w9JbnoQGkJQWkrPHQpjP9ZjA7ipEWavaGvMrqMn6qh
 jcHvm2H1hyEtJxytjEW5mNXS8NIeIcPim20xb15c7TKGM7p0mGkclTfbD8uhoTf3WSXXkB
 5G0dVfmngGDKBS/7reMbR8/Njk+U18U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-D2oycs5KOGWAPiVVIq8RiA-1; Fri, 18 Jun 2021 16:40:09 -0400
X-MC-Unique: D2oycs5KOGWAPiVVIq8RiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1130D9F92B;
 Fri, 18 Jun 2021 20:40:08 +0000 (UTC)
Received: from localhost (unknown [10.22.9.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7895F175B5;
 Fri, 18 Jun 2021 20:40:07 +0000 (UTC)
Date: Fri, 18 Jun 2021 16:40:06 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v9] qapi: introduce 'query-kvm-cpuid' action
Message-ID: <20210618204006.k6krwuz2lpxvb6uh@habkost.net>
References: <20210603090753.11688-1-valeriy.vdovin@virtuozzo.com>
 <87im2d6p5v.fsf@dusky.pond.sub.org>
 <20210617074919.GA998232@dhcp-172-16-24-191.sw.ru>
 <87a6no3fzf.fsf@dusky.pond.sub.org>
 <790d22e1-5de9-ba20-6c03-415b62223d7d@suse.de>
 <877dis1sue.fsf@dusky.pond.sub.org>
 <20210617153949.GA357@dhcp-172-16-24-191.sw.ru>
 <e69ea2b4-21cc-8203-ad2d-10a0f4ffe34a@suse.de>
 <20210617165111.eu3x2pvinpoedsqj@habkost.net>
 <87sg1fwwgg.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sg1fwwgg.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Denis Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 07:52:47AM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Jun 17, 2021 at 05:53:11PM +0200, Claudio Fontana wrote:
> >> On 6/17/21 5:39 PM, Valeriy Vdovin wrote:
> >> > On Thu, Jun 17, 2021 at 04:14:17PM +0200, Markus Armbruster wrote:
> >> >> Claudio Fontana <cfontana@suse.de> writes:
> >> >>
> >> >>> On 6/17/21 1:09 PM, Markus Armbruster wrote:
> 
> [...]
> 
> >> >>>> If it just isn't implemented for anything but KVM, then putting "kvm"
> >> >>>> into the command name is a bad idea.  Also, the commit message should
> >> >>>> briefly note the restriction to KVM.
> >> >>
> >> >> Perhaps this one is closer to reality.
> >> >>
> >> > I agree.
> >> > What command name do you suggest?
> >> 
> >> query-exposed-cpuid?
> >
> > Pasting the reply I sent at [1]:
> >
> >   I don't really mind how the command is called, but I would prefer
> >   to add a more complex abstraction only if maintainers of other
> >   accelerators are interested and volunteer to provide similar
> >   functionality.  I don't want to introduce complexity for use
> >   cases that may not even exist.
> >
> > I'm expecting this to be just a debugging mechanism, not a stable
> > API to be maintained and supported for decades.  (Maybe a "x-"
> > prefix should be added to indicate that?)
> >
> > [1] https://lore.kernel.org/qemu-devel/20210602204604.crsxvqixkkll4ef4@habkost.net
> 
> x-query-x86_64-cpuid?
> 

Unless somebody wants to spend time designing a generic
abstraction around this (and justify the extra complexity), this
is a KVM-specific command.  Is there a reason to avoid "kvm" in
the command name?

-- 
Eduardo


