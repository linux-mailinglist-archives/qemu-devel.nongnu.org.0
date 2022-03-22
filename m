Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58AB4E46C3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:36:33 +0100 (CET)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWkIy-0003DQ-Js
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:36:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nWkIB-0002Rq-JK
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 15:35:43 -0400
Received: from smtp87.iad3a.emailsrvr.com ([173.203.187.87]:34968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nWkI9-0004hm-96
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 15:35:43 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp19.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 90C6E4F28; 
 Tue, 22 Mar 2022 15:35:39 -0400 (EDT)
Date: Tue, 22 Mar 2022 14:35:39 -0500
From: Andrew Deason <adeason@sinenomine.net>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
Message-Id: <20220322143539.858a5ab913257a9beb6846a3@sinenomine.net>
In-Reply-To: <YjoOOzF/lTtF+3S9@work-vm>
References: <20220316040405.4131-1-adeason@sinenomine.net>
 <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
 <CAFEAcA96=yDKOknYmCKriWDJe4g-q07+b8yL3tFUf9=G-o84zA@mail.gmail.com>
 <YjGvvRvPRV3ACbFY@work-vm>
 <a9f31184-f157-e973-5c75-0af327fc2921@redhat.com>
 <20220322113949.d297e615317fa34894de8ed2@sinenomine.net>
 <Yjn+8ZMcnQ0NKWCO@work-vm>
 <20220322123408.43f2d7229b28399d7e3d0b84@sinenomine.net>
 <YjoOOzF/lTtF+3S9@work-vm>
Organization: Sine Nomine Associates
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Classification-ID: 8edd598c-ae0a-4db4-9686-5f2c929a0a4b-1-1
Received-SPF: pass client-ip=173.203.187.87;
 envelope-from=adeason@sinenomine.net; helo=smtp87.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 17:58:19 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Andrew Deason (adeason@sinenomine.net) wrote:
> > On Tue, 22 Mar 2022 16:53:05 +0000
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > 
> > > * Andrew Deason (adeason@sinenomine.net) wrote:
> > > > On Wed, 16 Mar 2022 10:41:41 +0100
> > > > David Hildenbrand <david@redhat.com> wrote:
> > > > 
> > > > > On 16.03.22 10:37, Dr. David Alan Gilbert wrote:
> > > > > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > > >> On Wed, 16 Mar 2022 at 07:53, David Hildenbrand <david@redhat.com> wrote:
> > > > > >>>
> > > > > >>> On 16.03.22 05:04, Andrew Deason wrote:
> > > > > >>>> We have a thin wrapper around madvise, called qemu_madvise, which
> > > > > >>>> provides consistent behavior for the !CONFIG_MADVISE case, and works
> > > > > >>>> around some platform-specific quirks (some platforms only provide
> > > > > >>>> posix_madvise, and some don't offer all 'advise' types). This specific
> > > > > >>>> caller of madvise has never used it, tracing back to its original
> > > > > >>>> introduction in commit e0b266f01dd2 ("migration_completion: Take
> > > > > >>>> current state").
> > > > > >>>>
> > > > > >>>> Call qemu_madvise here, to follow the same logic as all of our other
> > > > > >>>> madvise callers. This slightly changes the behavior for
> > > > > >>>> !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
> > > > > >>>> error message), but this is now more consistent with other callers
> > > > > >>>> that use qemu_madvise.
> > > > > >>>>
> > > > > >>>> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> > > > > >>>> ---
> > > > > >>>> Looking at the history of commits that touch this madvise() call, it
> > > > > >>>> doesn't _look_ like there's any reason to be directly calling madvise vs
> > > > > >>>> qemu_advise (I don't see anything mentioned), but I'm not sure.
> > > > > >>>>
> > > > > >>>>  softmmu/physmem.c | 12 ++----------
> > > > > >>>>  1 file changed, 2 insertions(+), 10 deletions(-)
> > > > > >>>>
> > > > > >>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > > > > >>>> index 43ae70fbe2..900c692b5e 100644
> > > > > >>>> --- a/softmmu/physmem.c
> > > > > >>>> +++ b/softmmu/physmem.c
> > > > > >>>> @@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
> > > > > >>>>                           rb->idstr, start, length, ret);
> > > > > >>>>              goto err;
> > > > > >>>>  #endif
> > > > > >>>>          }
> > > > > >>>>          if (need_madvise) {
> > > > > >>>>              /* For normal RAM this causes it to be unmapped,
> > > > > >>>>               * for shared memory it causes the local mapping to disappear
> > > > > >>>>               * and to fall back on the file contents (which we just
> > > > > >>>>               * fallocate'd away).
> > > > > >>>>               */
> > > > > >>>> -#if defined(CONFIG_MADVISE)
> > > > > >>>>              if (qemu_ram_is_shared(rb) && rb->fd < 0) {
> > > > > >>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> > > > > >>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> > > > > >>>>              } else {
> > > > > >>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> > > > > >>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> > > > > >>>
> > > > > >>> posix_madvise(QEMU_MADV_DONTNEED) has completely different semantics
> > > > > >>> then madvise() -- it's not a discard that we need here.
> > > > > >>>
> > > > > >>> So ram_block_discard_range() would now succeed in environments (BSD?)
> > > > > >>> where it's supposed to fail.
> > > > > >>>
> > > > > >>> So AFAIKs this isn't sane.
> > > > > >>
> > > > > >> But CONFIG_MADVISE just means "host has madvise()"; it doesn't imply
> > > > > >> "this is a Linux madvise() with MADV_DONTNEED". Solaris madvise()
> > > > > >> doesn't seem to have  MADV_DONTNEED at all; a quick look at the
> > > > > >> FreeBSD manpage suggests its madvise MADV_DONTNEED is identical
> > > > > >> to its posix_madvise MADV_DONTNEED.
> > > > > >>
> > > > > >> If we need "specifically Linux MADV_DONTNEED semantics" maybe we
> > > > > >> should define a QEMU_MADV_LINUX_DONTNEED which either (a) does the
> > > > > >> right thing or (b) fails, and use qemu_madvise() regardless.
> > > > > >>
> > > > > >> Certainly the current code is pretty fragile to being changed by
> > > > > >> people who don't understand the undocumented subtlety behind
> > > > > >> the use of a direct madvise() call here.
> > > > > > 
> > > > > > Yeh and I'm not sure I can remembe rall the subtleties; there's a big
> > > > > > hairy set of ifdef's in include/qemu/madvise.h that makes
> > > > > > sure we always have the definition of QEMU_MADV_REMOVE/DONTNEED
> > > > > > even on platforms that might not define it themselves.
> > > > > > 
> > > > > > But I think this code is used for things with different degrees
> > > > > > of care about the semantics; e.g. 'balloon' just cares that
> > > > > > it frees memory up and doesn't care about the detailed semantics
> > > > > > that much; so it's probably fine with that.
> > > > > > Postcopy is much more touchy, but then it's only going to be
> > > > > > calling this on Linux anyway (because of the userfault dependency).
> > > > > 
> > > > > MADV_DONTNEED/MADV_REMOVE only provides discard semantics on Linux IIRC
> > > > > -- and that's what we want to achieve: ram_block_discard_range()
> > > > > 
> > > > > So I agree with Peter that we might want to make this more explicit.
> > > > 
> > > > I was looking at the comments/history around this code to try to make
> > > > this more explicit/clear, and it seems like the whole function is very
> > > > Linux-specific. All we ever do is:
> > > > 
> > > > - fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)
> > > > - madvise(MADV_REMOVE)
> > > > - madvise(MADV_DONTNEED) with Linux semantics
> > > > 
> > > > All of those operations are Linux-only, so trying to figure out the
> > > > cross-platform way to model this seems kind of pointless. Is it fine to
> > > > just #ifdef the whole thing to be just for Linux?
> > > 
> > > For ballooning we don't really need Linux semantics; we just need it to
> > > use less host memory.  Postcopy needs the more careful semantics though.
> > 
> > Right, sorry, you mentioned that, but I was thinking it sounded like
> > that applied to the MADV_DONTNEED path, which is only 1 case of the 3.
> > But reading into this a bit, maybe all of these cases are fine on
> > non-Linux for ballooning: fallocate is never called ('rb->fd' is always
> > -1), and QEMU_MADV_REMOVE falls back to QEMU_MADV_DONTNEED, which is
> > fine for ballooning. Am I understanding that correctly?
> > 
> > But regardless, it's simpler/more-conservative to make it all
> > Linux-specific. If I just take ram_block_discard_range away from
> > non-Linux (that is, make it always return an error), is that breaking
> > actual functionality, or is it removing a niche code path that non-Linux
> > isn't really using anyway, and it's not worth the time to figure out? I
> > am not familiar with qemu internals, so this is not obvious to me.
> > 
> > For context: I'm just trying to get the tree to compile on other
> > platforms (immediate focus is the guest agent on Solaris). The madvise()
> > calls here generate warnings due to platform-specific quirks that
> > qemu_madvise() has some logic to deal with. So my question is whether
> > to adapt these to the cross-platform qemu_advise(), or treat the
> > function as platform-specific code.
> 
> I think you should keep this function to have the basic functionality of
> freeing a chunk of memory so that it takes less host space up; that way
> a guest using virtio-balloon will still be nice to the host.

Okay, but the postcopy code path still requires the linux semantics
(that is, that accessing the range afterwards triggers a fault). That
sounds like having two functions is in order, to indicate which
semantics are needed? Something like:

- int ram_block_discard_range(...). Existing semantics; pages must be
  unmapped, or return an error. Called by postcopy stuff.

- void ram_block_try_discard_range(...). Best-effort, just try to reduce
  memory usage. Called by balloon stuff.

There are several callers in hw/virtio/virtio-mem.c that do look at the
return code. Do these require the pages be unmapped? (the linux
semantics)

-- 
Andrew Deason
adeason@sinenomine.net

