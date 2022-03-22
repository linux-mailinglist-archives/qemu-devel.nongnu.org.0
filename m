Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3D4E45A0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 19:00:35 +0100 (CET)
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWio6-0005kJ-1d
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 14:00:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nWim5-0004Be-HN
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nWim1-0001LN-VL
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647971904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/X3FgWdPXfqWjeJ0FVmzOs8pGGC6m3Mrl1S8EDRGa4=;
 b=ElgpGT/93nZ+ApeOT7BQSQvAAKwfsHbdHXvgtASoeNPWHPXRfFsMjzw9UEvnAg+xvtxdd9
 cmSyAuuraKMI5xPm3j18QipbBf1jPiMayhydDbijLaZ/8o2lInHEI2ofJopA1Lu43Ewzpa
 lg3m6USwAg+SE7w6Oq2TNgiMdBYbu90=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-cyTrSzhBOO27Tdt-Y3GuvQ-1; Tue, 22 Mar 2022 13:58:23 -0400
X-MC-Unique: cyTrSzhBOO27Tdt-Y3GuvQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so3942482wrp.10
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 10:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i/X3FgWdPXfqWjeJ0FVmzOs8pGGC6m3Mrl1S8EDRGa4=;
 b=vZbDMlwV1yXQWteyR2fyFRH8xqtbVQNCXihUWI5lQ2heXRlZcgHOE00gGDaHd0vm8k
 35AN0sSwt6BK4nVd1dgaL4+CgeGA1Lj+q6MJG0L0SFlt+OiThrebn3f7h1gK/stdm8Ra
 5qSg0ygXwm7Jo9ijKj+bUv0ZzNP3FMPo0d3MSN6BK8rtwpN7OzGssGLewanjmJIDFKmA
 0ucP6cJ7K8Oph+oOKwxUJle+iLTrzEobT7ZyBSftHo3CUqySeRsqtG1HiA2RSq47lGnD
 UcR6Ss1vvZ2MmSnd4JoXe/kvth9aDe2IfgwHY2jdotNIovT4SFmttcS97To/Ny0K0/0t
 SpBw==
X-Gm-Message-State: AOAM532GtV2QMx1GcRvPxCVIrEEogXl3JmTDj8/sTx2gjQ2X/y68JeSE
 7DQc6ZsazLty8J7uWBOtkC7fGLvD3P3PPaFMA/gz3PRvyBfEQxKy4QJurpPQ5jPOoa1xM/LT5XG
 mwepGk2bcDGDrGx4=
X-Received: by 2002:a05:600c:3847:b0:38c:a460:7679 with SMTP id
 s7-20020a05600c384700b0038ca4607679mr5058382wmr.23.1647971902246; 
 Tue, 22 Mar 2022 10:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSdTmL7pr4ydQDiSHkTmiwHI0qpN4jr4WEdolN0wux8wNun47vTR0VgcireJ0g9rgqZ4bplg==
X-Received: by 2002:a05:600c:3847:b0:38c:a460:7679 with SMTP id
 s7-20020a05600c384700b0038ca4607679mr5058349wmr.23.1647971901926; 
 Tue, 22 Mar 2022 10:58:21 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d1-20020adffbc1000000b00203de0fff63sm16355913wrs.70.2022.03.22.10.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 10:58:21 -0700 (PDT)
Date: Tue, 22 Mar 2022 17:58:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrew Deason <adeason@sinenomine.net>
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
Message-ID: <YjoOOzF/lTtF+3S9@work-vm>
References: <20220316040405.4131-1-adeason@sinenomine.net>
 <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
 <CAFEAcA96=yDKOknYmCKriWDJe4g-q07+b8yL3tFUf9=G-o84zA@mail.gmail.com>
 <YjGvvRvPRV3ACbFY@work-vm>
 <a9f31184-f157-e973-5c75-0af327fc2921@redhat.com>
 <20220322113949.d297e615317fa34894de8ed2@sinenomine.net>
 <Yjn+8ZMcnQ0NKWCO@work-vm>
 <20220322123408.43f2d7229b28399d7e3d0b84@sinenomine.net>
MIME-Version: 1.0
In-Reply-To: <20220322123408.43f2d7229b28399d7e3d0b84@sinenomine.net>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrew Deason (adeason@sinenomine.net) wrote:
> On Tue, 22 Mar 2022 16:53:05 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Andrew Deason (adeason@sinenomine.net) wrote:
> > > On Wed, 16 Mar 2022 10:41:41 +0100
> > > David Hildenbrand <david@redhat.com> wrote:
> > > 
> > > > On 16.03.22 10:37, Dr. David Alan Gilbert wrote:
> > > > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > >> On Wed, 16 Mar 2022 at 07:53, David Hildenbrand <david@redhat.com> wrote:
> > > > >>>
> > > > >>> On 16.03.22 05:04, Andrew Deason wrote:
> > > > >>>> We have a thin wrapper around madvise, called qemu_madvise, which
> > > > >>>> provides consistent behavior for the !CONFIG_MADVISE case, and works
> > > > >>>> around some platform-specific quirks (some platforms only provide
> > > > >>>> posix_madvise, and some don't offer all 'advise' types). This specific
> > > > >>>> caller of madvise has never used it, tracing back to its original
> > > > >>>> introduction in commit e0b266f01dd2 ("migration_completion: Take
> > > > >>>> current state").
> > > > >>>>
> > > > >>>> Call qemu_madvise here, to follow the same logic as all of our other
> > > > >>>> madvise callers. This slightly changes the behavior for
> > > > >>>> !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
> > > > >>>> error message), but this is now more consistent with other callers
> > > > >>>> that use qemu_madvise.
> > > > >>>>
> > > > >>>> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> > > > >>>> ---
> > > > >>>> Looking at the history of commits that touch this madvise() call, it
> > > > >>>> doesn't _look_ like there's any reason to be directly calling madvise vs
> > > > >>>> qemu_advise (I don't see anything mentioned), but I'm not sure.
> > > > >>>>
> > > > >>>>  softmmu/physmem.c | 12 ++----------
> > > > >>>>  1 file changed, 2 insertions(+), 10 deletions(-)
> > > > >>>>
> > > > >>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > > > >>>> index 43ae70fbe2..900c692b5e 100644
> > > > >>>> --- a/softmmu/physmem.c
> > > > >>>> +++ b/softmmu/physmem.c
> > > > >>>> @@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
> > > > >>>>                           rb->idstr, start, length, ret);
> > > > >>>>              goto err;
> > > > >>>>  #endif
> > > > >>>>          }
> > > > >>>>          if (need_madvise) {
> > > > >>>>              /* For normal RAM this causes it to be unmapped,
> > > > >>>>               * for shared memory it causes the local mapping to disappear
> > > > >>>>               * and to fall back on the file contents (which we just
> > > > >>>>               * fallocate'd away).
> > > > >>>>               */
> > > > >>>> -#if defined(CONFIG_MADVISE)
> > > > >>>>              if (qemu_ram_is_shared(rb) && rb->fd < 0) {
> > > > >>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> > > > >>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> > > > >>>>              } else {
> > > > >>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> > > > >>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> > > > >>>
> > > > >>> posix_madvise(QEMU_MADV_DONTNEED) has completely different semantics
> > > > >>> then madvise() -- it's not a discard that we need here.
> > > > >>>
> > > > >>> So ram_block_discard_range() would now succeed in environments (BSD?)
> > > > >>> where it's supposed to fail.
> > > > >>>
> > > > >>> So AFAIKs this isn't sane.
> > > > >>
> > > > >> But CONFIG_MADVISE just means "host has madvise()"; it doesn't imply
> > > > >> "this is a Linux madvise() with MADV_DONTNEED". Solaris madvise()
> > > > >> doesn't seem to have  MADV_DONTNEED at all; a quick look at the
> > > > >> FreeBSD manpage suggests its madvise MADV_DONTNEED is identical
> > > > >> to its posix_madvise MADV_DONTNEED.
> > > > >>
> > > > >> If we need "specifically Linux MADV_DONTNEED semantics" maybe we
> > > > >> should define a QEMU_MADV_LINUX_DONTNEED which either (a) does the
> > > > >> right thing or (b) fails, and use qemu_madvise() regardless.
> > > > >>
> > > > >> Certainly the current code is pretty fragile to being changed by
> > > > >> people who don't understand the undocumented subtlety behind
> > > > >> the use of a direct madvise() call here.
> > > > > 
> > > > > Yeh and I'm not sure I can remembe rall the subtleties; there's a big
> > > > > hairy set of ifdef's in include/qemu/madvise.h that makes
> > > > > sure we always have the definition of QEMU_MADV_REMOVE/DONTNEED
> > > > > even on platforms that might not define it themselves.
> > > > > 
> > > > > But I think this code is used for things with different degrees
> > > > > of care about the semantics; e.g. 'balloon' just cares that
> > > > > it frees memory up and doesn't care about the detailed semantics
> > > > > that much; so it's probably fine with that.
> > > > > Postcopy is much more touchy, but then it's only going to be
> > > > > calling this on Linux anyway (because of the userfault dependency).
> > > > 
> > > > MADV_DONTNEED/MADV_REMOVE only provides discard semantics on Linux IIRC
> > > > -- and that's what we want to achieve: ram_block_discard_range()
> > > > 
> > > > So I agree with Peter that we might want to make this more explicit.
> > > 
> > > I was looking at the comments/history around this code to try to make
> > > this more explicit/clear, and it seems like the whole function is very
> > > Linux-specific. All we ever do is:
> > > 
> > > - fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)
> > > - madvise(MADV_REMOVE)
> > > - madvise(MADV_DONTNEED) with Linux semantics
> > > 
> > > All of those operations are Linux-only, so trying to figure out the
> > > cross-platform way to model this seems kind of pointless. Is it fine to
> > > just #ifdef the whole thing to be just for Linux?
> > 
> > For ballooning we don't really need Linux semantics; we just need it to
> > use less host memory.  Postcopy needs the more careful semantics though.
> 
> Right, sorry, you mentioned that, but I was thinking it sounded like
> that applied to the MADV_DONTNEED path, which is only 1 case of the 3.
> But reading into this a bit, maybe all of these cases are fine on
> non-Linux for ballooning: fallocate is never called ('rb->fd' is always
> -1), and QEMU_MADV_REMOVE falls back to QEMU_MADV_DONTNEED, which is
> fine for ballooning. Am I understanding that correctly?
> 
> But regardless, it's simpler/more-conservative to make it all
> Linux-specific. If I just take ram_block_discard_range away from
> non-Linux (that is, make it always return an error), is that breaking
> actual functionality, or is it removing a niche code path that non-Linux
> isn't really using anyway, and it's not worth the time to figure out? I
> am not familiar with qemu internals, so this is not obvious to me.
> 
> For context: I'm just trying to get the tree to compile on other
> platforms (immediate focus is the guest agent on Solaris). The madvise()
> calls here generate warnings due to platform-specific quirks that
> qemu_madvise() has some logic to deal with. So my question is whether
> to adapt these to the cross-platform qemu_advise(), or treat the
> function as platform-specific code.

I think you should keep this function to have the basic functionality of
freeing a chunk of memory so that it takes less host space up; that way
a guest using virtio-balloon will still be nice to the host.

Dave

> -- 
> Andrew Deason
> adeason@sinenomine.net
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


