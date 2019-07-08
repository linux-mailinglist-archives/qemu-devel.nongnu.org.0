Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81562771
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 19:43:35 +0200 (CEST)
Received: from localhost ([::1]:43608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkXfq-00069W-G3
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 13:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hkXe7-0005Vr-V6
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 13:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hkXe6-0007UY-CN
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 13:41:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55364)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hkXe1-0007Qx-FD
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 13:41:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9C66D30C132E;
 Mon,  8 Jul 2019 17:41:29 +0000 (UTC)
Received: from work-vm (ovpn-117-74.ams2.redhat.com [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9B2C5C226;
 Mon,  8 Jul 2019 17:41:27 +0000 (UTC)
Date: Mon, 8 Jul 2019 18:41:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190708174125.GO2746@work-vm>
References: <CAFEAcA-yzWhwYPzC9px0H-=x3XEPVBjZOhk402is49YpbmJX9g@mail.gmail.com>
 <ac682594-fac7-ca67-2cef-85db15920c7c@redhat.com>
 <CAFEAcA-giDCA8ZTR3Ft3ZNQUBEJBaXNaMnZOmgPo3Auw1gvZjg@mail.gmail.com>
 <faeb493b-f61b-16fe-3aff-aa40dffaf06b@redhat.com>
 <CAFEAcA-o-_tvgxZFs8rWcgK147pFLrbQLZ1s_fD0Gzc+iQc4UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-o-_tvgxZFs8rWcgK147pFLrbQLZ1s_fD0Gzc+iQc4UQ@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 08 Jul 2019 17:41:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] pl031 time across vm save/reload
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Fri, 5 Jul 2019 at 11:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 05/07/19 11:58, Peter Maydell wrote:
> > > On Fri, 5 Jul 2019 at 10:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >> You're right, the compatibility causes wrong behavior for the default
> > >> -rtc settings (the RC pauses across migration).  The right thing to do
> > >> would be to store the base rather than the offset: that is, you store
> > >> the time at which LR was written.  Then the offset is s->lr - s->base
> > >> and it's independent of the machine on which the rtc_clock is being read.
> > >
> > > Right. How do we handle this for back-compat purposes? I guess
> > > we need to have a new migration subsection, so if it's present
> > > it has the 'base' value and we ignore the 'offset' in the
> > > main migration data, and if it's not present we assume an
> > > old->new migration and use the existing offset code. New->old
> > > migration would not be possible as the new subsection is
> > > always-present.
> >
> > Yes, something like that but I would just bump the version.  Version 1
> > has the old meaning for the first field, version 2 has the new meaning.
> 
> Yeah, we could do that. I thought we preferred to avoid using
> version-numbers for migration though these days ? (cc'ing DG
> in case he has an opinion.)

Right.
Add a subsection, make the subsection only be sent if you're on a new
machine type.

(I'm currently getting my head around our x86 RTC code because of a bug
I've been handed involving RTCs and migration; the expectations and the
behaviours are not obvious at all).

Dave

> > And also, since our brains are fresh on pl031... currently s->lr is
> > always 0; besides the bug that writing RTC_LR should update it, the
> > datasheet says the counter counts up from 1 so perhaps at startup s->lr
> > should be set to a nonzero value?   That would be
> > qemu_ref_timedate(QEMU_CLOCK_VIRTUAL) - 1.
> 
> The 'summary of RTC registers' section in the datasheet says
> that RTCLR's reset value is zero...
> 
> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

