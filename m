Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F54DB35E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:36:47 +0100 (CET)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUla-00061K-3n
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:36:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUUe9-00054d-5c
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:29:05 -0400
Received: from smtp66.ord1c.emailsrvr.com ([108.166.43.66]:59505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUUe6-00077f-M2
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:29:04 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp1.relay.ord1c.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id CE2B62009E; 
 Wed, 16 Mar 2022 10:29:00 -0400 (EDT)
Date: Wed, 16 Mar 2022 09:29:00 -0500
From: Andrew Deason <adeason@sinenomine.net>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
Message-Id: <20220316092900.5c16426663a8b07b22c1172d@sinenomine.net>
In-Reply-To: <a9f31184-f157-e973-5c75-0af327fc2921@redhat.com>
References: <20220316040405.4131-1-adeason@sinenomine.net>
 <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
 <CAFEAcA96=yDKOknYmCKriWDJe4g-q07+b8yL3tFUf9=G-o84zA@mail.gmail.com>
 <YjGvvRvPRV3ACbFY@work-vm>
 <a9f31184-f157-e973-5c75-0af327fc2921@redhat.com>
Organization: Sine Nomine Associates
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Classification-ID: 935de880-a640-45a3-a6c0-45466e19b347-1-1
Received-SPF: pass client-ip=108.166.43.66;
 envelope-from=adeason@sinenomine.net; helo=smtp66.ord1c.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 10:41:41 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 16.03.22 10:37, Dr. David Alan Gilbert wrote:
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> On Wed, 16 Mar 2022 at 07:53, David Hildenbrand <david@redhat.com> wrote:
> >>>
> >>> On 16.03.22 05:04, Andrew Deason wrote:
> >>>> We have a thin wrapper around madvise, called qemu_madvise, which
> >>>> provides consistent behavior for the !CONFIG_MADVISE case, and works
> >>>> around some platform-specific quirks (some platforms only provide
> >>>> posix_madvise, and some don't offer all 'advise' types). This specific
> >>>> caller of madvise has never used it, tracing back to its original
> >>>> introduction in commit e0b266f01dd2 ("migration_completion: Take
> >>>> current state").
> >>>>
> >>>> Call qemu_madvise here, to follow the same logic as all of our other
> >>>> madvise callers. This slightly changes the behavior for
> >>>> !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
> >>>> error message), but this is now more consistent with other callers
> >>>> that use qemu_madvise.
> >>>>
> >>>> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> >>>> ---
> >>>> Looking at the history of commits that touch this madvise() call, it
> >>>> doesn't _look_ like there's any reason to be directly calling madvise vs
> >>>> qemu_advise (I don't see anything mentioned), but I'm not sure.
> >>>>
> >>>>  softmmu/physmem.c | 12 ++----------
> >>>>  1 file changed, 2 insertions(+), 10 deletions(-)
> >>>>
> >>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >>>> index 43ae70fbe2..900c692b5e 100644
> >>>> --- a/softmmu/physmem.c
> >>>> +++ b/softmmu/physmem.c
> >>>> @@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
> >>>>                           rb->idstr, start, length, ret);
> >>>>              goto err;
> >>>>  #endif
> >>>>          }
> >>>>          if (need_madvise) {
> >>>>              /* For normal RAM this causes it to be unmapped,
> >>>>               * for shared memory it causes the local mapping to disappear
> >>>>               * and to fall back on the file contents (which we just
> >>>>               * fallocate'd away).
> >>>>               */
> >>>> -#if defined(CONFIG_MADVISE)
> >>>>              if (qemu_ram_is_shared(rb) && rb->fd < 0) {
> >>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> >>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> >>>>              } else {
> >>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> >>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> >>>
> >>> posix_madvise(QEMU_MADV_DONTNEED) has completely different semantics
> >>> then madvise() -- it's not a discard that we need here.
> >>>
> >>> So ram_block_discard_range() would now succeed in environments (BSD?)
> >>> where it's supposed to fail.
> >>>
> >>> So AFAIKs this isn't sane.
> >>
> >> But CONFIG_MADVISE just means "host has madvise()"; it doesn't imply
> >> "this is a Linux madvise() with MADV_DONTNEED". Solaris madvise()
> >> doesn't seem to have  MADV_DONTNEED at all; a quick look at the
> >> FreeBSD manpage suggests its madvise MADV_DONTNEED is identical
> >> to its posix_madvise MADV_DONTNEED.
> >>
> >> If we need "specifically Linux MADV_DONTNEED semantics" maybe we
> >> should define a QEMU_MADV_LINUX_DONTNEED which either (a) does the
> >> right thing or (b) fails, and use qemu_madvise() regardless.
> >>
> >> Certainly the current code is pretty fragile to being changed by
> >> people who don't understand the undocumented subtlety behind
> >> the use of a direct madvise() call here.
> > 
> > Yeh and I'm not sure I can remembe rall the subtleties; there's a big
> > hairy set of ifdef's in include/qemu/madvise.h that makes
> > sure we always have the definition of QEMU_MADV_REMOVE/DONTNEED
> > even on platforms that might not define it themselves.
> > 
> > But I think this code is used for things with different degrees
> > of care about the semantics; e.g. 'balloon' just cares that
> > it frees memory up and doesn't care about the detailed semantics
> > that much; so it's probably fine with that.
> > Postcopy is much more touchy, but then it's only going to be
> > calling this on Linux anyway (because of the userfault dependency).
> 
> MADV_DONTNEED/MADV_REMOVE only provides discard semantics on Linux IIRC
> -- and that's what we want to achieve: ram_block_discard_range()
> 
> So I agree with Peter that we might want to make this more explicit.

Maybe this could use an argument like QEMU_MADV_DONTNEED_DISCARD, which
gets #define'd to QEMU_MADV_INVALID for posix_madvise, or based on a
configure-time test, or just all non-Linux to be safe? Regardless, it
means "MADV_DONTNEED with discard semantics".

Solaris does have MADV_DONTNEED (possibly new in Solaris 11; I haven't
checked the history), but no MADV_REMOVE. As of 11.4.42 CBE, madvise(3C) says:

       MADV_DONTNEED

           Tell  the  kernel  that  the  specified  address range is no longer
           needed, so the system starts to free the resources associated  with
           the address range.

           MADV_DONTNEED  and  MADV_FREE  perform  related but distinct opera-
           tions. MADV_DONTNEED tries to move  any  data  from  the  specified
           address  range  out  of memory, but it ensures that the contents of
           that range  will  be  recovered  when  they  are  next  referenced.
           MADV_FREE  does not attempt to preserve the contents of the address
           range. As a result, subsequent references to an address range  that
           received  madvise (MADV_DONTNEED) are likely to be slower than ref-
           erences to a range that received madvise (MADV_FREE).

Is there a small test program I could run to see if the semantics are
what we want? Or should we just assume only Linux works here; I assume
that's safer.

-- 
Andrew Deason
adeason@sinenomine.net

