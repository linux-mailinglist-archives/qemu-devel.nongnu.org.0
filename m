Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E82CD2C0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:42:21 +0100 (CET)
Received: from localhost ([::1]:39070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkl80-0001PM-VG
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:42:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkl6v-0000pi-Tm; Thu, 03 Dec 2020 04:41:13 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:52808 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkl6r-00015t-8x; Thu, 03 Dec 2020 04:41:13 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 05E674138D;
 Thu,  3 Dec 2020 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606988465;
 x=1608802866; bh=H9lTBXR8sJtzH+gP79exGietP7xr+g+hYiSEwFBpeBQ=; b=
 R5iG9MnSwYUgjLNoTwvJ6goQxFJg6hSu0B9cVDE3wzR5rPit5YXQN/+ijubynMHR
 kqq3w9pYHHuW1kfei1KlCKYsn7k90KJXuq3Nx/55uXLtAn9g+WNcThZsCw8pz/Fy
 3CEP4ED39ylUctD6Q3Oe4+3NpfOJ1sh3cibVHOrMgko=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygFQmOxnK4vf; Thu,  3 Dec 2020 12:41:05 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CD3C441369;
 Thu,  3 Dec 2020 12:41:04 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 12:41:04 +0300
Date: Thu, 3 Dec 2020 12:41:24 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH 2/8] hvf: Move common code out
Message-ID: <20201203094124.GA7201@SPB-NB-133.local>
References: <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
 <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
 <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
 <CAMn1gO5xs8RniRYm+Gnbh8S3GVah2+2Ew2V6tFL6PNuSJ7o5Hw@mail.gmail.com>
 <4e1d93a4-9dcc-c6b6-e060-6eea39ae2f16@csgraf.de>
 <CAMn1gO44Y4rahufveQ1dOq96nhqvGEmZ0pYci2f6BKv9kd638Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMn1gO44Y4rahufveQ1dOq96nhqvGEmZ0pYci2f6BKv9kd638Q@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 04:00:11PM -0800, Peter Collingbourne wrote:
> On Mon, Nov 30, 2020 at 3:18 PM Alexander Graf <agraf@csgraf.de> wrote:
> >
> >
> > On 01.12.20 00:01, Peter Collingbourne wrote:
> > > On Mon, Nov 30, 2020 at 1:40 PM Alexander Graf <agraf@csgraf.de> wrote:
> > >> Hi Peter,
> > >>
> > >> On 30.11.20 22:08, Peter Collingbourne wrote:
> > >>> On Mon, Nov 30, 2020 at 12:56 PM Frank Yang <lfy@google.com> wrote:
> > >>>>
> > >>>> On Mon, Nov 30, 2020 at 12:34 PM Alexander Graf <agraf@csgraf.de> wrote:
> > >>>>> Hi Frank,
> > >>>>>
> > >>>>> Thanks for the update :). Your previous email nudged me into the right direction. I previously had implemented WFI through the internal timer framework which performed way worse.
> > >>>> Cool, glad it's helping. Also, Peter found out that the main thing keeping us from just using cntpct_el0 on the host directly and compare with cval is that if we sleep, cval is going to be much < cntpct_el0 by the sleep time. If we can get either the architecture or macos to read out the sleep time then we might be able to not have to use a poll interval either!
> > >>>>> Along the way, I stumbled over a few issues though. For starters, the signal mask for SIG_IPI was not set correctly, so while pselect() would exit, the signal would never get delivered to the thread! For a fix, check out
> > >>>>>
> > >>>>>     https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgraf.de/20201130030723.78326-4-agraf@csgraf.de/
> > >>>>>
> > >>>> Thanks, we'll take a look :)
> > >>>>
> > >>>>> Please also have a look at my latest stab at WFI emulation. It doesn't handle WFE (that's only relevant in overcommitted scenarios). But it does handle WFI and even does something similar to hlt polling, albeit not with an adaptive threshold.
> > >>> Sorry I'm not subscribed to qemu-devel (I'll subscribe in a bit) so
> > >>> I'll reply to your patch here. You have:
> > >>>
> > >>> +                    /* Set cpu->hvf->sleeping so that we get a
> > >>> SIG_IPI signal. */
> > >>> +                    cpu->hvf->sleeping = true;
> > >>> +                    smp_mb();
> > >>> +
> > >>> +                    /* Bail out if we received an IRQ meanwhile */
> > >>> +                    if (cpu->thread_kicked || (cpu->interrupt_request &
> > >>> +                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> > >>> +                        cpu->hvf->sleeping = false;
> > >>> +                        break;
> > >>> +                    }
> > >>> +
> > >>> +                    /* nanosleep returns on signal, so we wake up on kick. */
> > >>> +                    nanosleep(ts, NULL);
> > >>>
> > >>> and then send the signal conditional on whether sleeping is true, but
> > >>> I think this is racy. If the signal is sent after sleeping is set to
> > >>> true but before entering nanosleep then I think it will be ignored and
> > >>> we will miss the wakeup. That's why in my implementation I block IPI
> > >>> on the CPU thread at startup and then use pselect to atomically
> > >>> unblock and begin sleeping. The signal is sent unconditionally so
> > >>> there's no need to worry about races between actually sleeping and the
> > >>> "we think we're sleeping" state. It may lead to an extra wakeup but
> > >>> that's better than missing it entirely.
> > >>
> > >> Thanks a bunch for the comment! So the trick I was using here is to > > >> modify the timespec from the kick function before sending the IPI
> > >> signal. That way, we know that either we are inside the sleep (where the
> > >> signal wakes it up) or we are outside the sleep (where timespec={} will
> > >> make it return immediately).
> > >>
> > >> The only race I can think of is if nanosleep does calculations based on
> > >> the timespec and we happen to send the signal right there and then.
> > > Yes that's the race I was thinking of. Admittedly it's a small window
> > > but it's theoretically possible and part of the reason why pselect was
> > > created.
> > >
> > >> The problem with blocking IPIs is basically what Frank was describing
> > >> earlier: How do you unset the IPI signal pending status? If the signal
> > >> is never delivered, how can pselect differentiate "signal from last time
> > >> is still pending" from "new signal because I got an IPI"?
> > > In this case we would take the additional wakeup which should be
> > > harmless since we will take the WFx exit again and put us in the
> > > correct state. But that's a lot better than busy looping.
> >
> >
> > I'm not sure I follow. I'm thinking of the following scenario:
> >
> >    - trap into WFI handler
> >    - go to sleep with blocked SIG_IPI
> >    - SIG_IPI arrives, pselect() exits
> >    - signal is still pending because it's blocked
> >    - enter guest
> >    - trap into WFI handler
> >    - run pselect(), but it immediate exits because SIG_IPI is still pending
> >
> > This was the loop I was seeing when running with SIG_IPI blocked. That's
> > part of the reason why I switched to a different model.
> 
> What I observe is that when returning from a pending signal pselect
> consumes the signal (which is also consistent with my understanding of
> what pselect does). That means that it doesn't matter if we take a
> second WFx exit because once we reach the pselect in the second WFx
> exit the signal will have been consumed by the pselect in the first
> exit and we will just wait for the next one.
> 

Aha! Thanks for the explanation. So, the first WFI in the series of
guest WFIs will likely wake up immediately? After a period without WFIs
there must be a pending SIG_IPI...

It shouldn't be a critical issue though because (as defined in D1.16.2)
"the architecture permits a PE to leave the low-power state for any
reason, it is permissible for a PE to treat WFI as a NOP, but this is
not recommended for lowest power operation."

BTW. I think a bit from the thread should go into the description of
patch 8, because it's not trivial and it would really be helpful to keep
in repo history. At least something like this (taken from an earlier
reply in the thread):

  In this implementation IPI is blocked on the CPU thread at startup and
  pselect() is used to atomically unblock the signal and begin sleeping.
  The signal is sent unconditionally so there's no need to worry about
  races between actually sleeping and the "we think we're sleeping"
  state. It may lead to an extra wakeup but that's better than missing
  it entirely.


Thanks,
Roman

> I don't know why things may have been going wrong in your
> implementation but it may be related to the issue with
> mach_absolute_time() which I posted about separately and was also
> causing busy loops for us in some cases. Once that issue was fixed in
> our implementation we started seeing sleep until VTIMER due work
> properly.
> 
> >
> >
> > > I reckon that you could improve things a little by unblocking the
> > > signal and then reblocking it before unlocking iothread (e.g. with a
> > > pselect with zero time interval), which would flush any pending
> > > signals. Since any such signal would correspond to a signal from last
> > > time (because we still have the iothread lock) we know that any future
> > > signals should correspond to new IPIs.
> >
> >
> > Yeah, I think you actually *have* to do exactly that, because otherwise
> > pselect() will always return after 0ns because the signal is still pending.
> >
> > And yes, I agree that that starts to sound a bit less racy now. But it
> > means we can probably also just do
> >
> >    - WFI handler
> >    - block SIG_IPI
> >    - set hvf->sleeping = true
> >    - check for pending interrupts
> >    - pselect()
> >    - unblock SIG_IPI
> >
> > which means we run with SIG_IPI unmasked by default. I don't think the
> > number of signal mask changes is any different with that compared to
> > running with SIG_IPI always masked, right?
> 

P.S. Just found that Alex already raised my concern. Pending signals
have to be consumed or there should be no pending signals to start
sleeping on the very first WFI.

> And unlock/lock iothread around the pselect? I suppose that could work
> but as I mentioned it would just be an optimization.
> 
> Maybe I can try to make my approach work on top of your series, or if
> you already have a patch I can try to debug it. Let me know.
> 
> Peter

