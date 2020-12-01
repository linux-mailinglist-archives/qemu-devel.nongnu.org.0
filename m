Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C682C9414
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 01:38:37 +0100 (CET)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjtgh-0001Tn-Ln
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 19:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kjtfW-0000jR-EM; Mon, 30 Nov 2020 19:37:22 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:57714 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kjtfU-0006ey-0a; Mon, 30 Nov 2020 19:37:22 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1F31341316;
 Tue,  1 Dec 2020 00:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606783034;
 x=1608597435; bh=VFGYtVe1lf96y0U6bwdQzUtg9QK6pCpJDKyRYLekr4c=; b=
 CiTT7KDkT1E2mG57UN9CaH7p9747yjkCPxPdnbm9aiYUE/Ka3Sr2hVxAPPoCZVsu
 BVOAeLxBhtQMrmrlNBD2igGwPy8U2Oe6i1BNACd5xjDAwsEWx9L3HIujt0O+NA9b
 3VCslx2k8NKSVYtSUpftMpFr6rRnLHKG3ocX1sbjwqk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D58egHqAmbaq; Tue,  1 Dec 2020 03:37:14 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B73464130C;
 Tue,  1 Dec 2020 03:37:13 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 1 Dec
 2020 03:37:13 +0300
Date: Tue, 1 Dec 2020 03:37:27 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 2/8] hvf: Move common code out
Message-ID: <20201201003727.GA29488@SPB-NB-133.local>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
 <20201127200054.GC56950@SPB-NB-133.local>
 <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
 <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
 <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
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
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 10:40:49PM +0100, Alexander Graf wrote:
> Hi Peter,
> 
> On 30.11.20 22:08, Peter Collingbourne wrote:
> > On Mon, Nov 30, 2020 at 12:56 PM Frank Yang <lfy@google.com> wrote:
> > > 
> > > 
> > > On Mon, Nov 30, 2020 at 12:34 PM Alexander Graf <agraf@csgraf.de> wrote:
> > > > Hi Frank,
> > > > 
> > > > Thanks for the update :). Your previous email nudged me into the right direction. I previously had implemented WFI through the internal timer framework which performed way worse.
> > > Cool, glad it's helping. Also, Peter found out that the main thing keeping us from just using cntpct_el0 on the host directly and compare with cval is that if we sleep, cval is going to be much < cntpct_el0 by the sleep time. If we can get either the architecture or macos to read out the sleep time then we might be able to not have to use a poll interval either!
> > > > Along the way, I stumbled over a few issues though. For starters, the signal mask for SIG_IPI was not set correctly, so while pselect() would exit, the signal would never get delivered to the thread! For a fix, check out
> > > > 
> > > >    https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgraf.de/20201130030723.78326-4-agraf@csgraf.de/
> > > > 
> > > Thanks, we'll take a look :)
> > > 
> > > > Please also have a look at my latest stab at WFI emulation. It doesn't handle WFE (that's only relevant in overcommitted scenarios). But it does handle WFI and even does something similar to hlt polling, albeit not with an adaptive threshold.
> > Sorry I'm not subscribed to qemu-devel (I'll subscribe in a bit) so
> > I'll reply to your patch here. You have:
> > 
> > +                    /* Set cpu->hvf->sleeping so that we get a
> > SIG_IPI signal. */
> > +                    cpu->hvf->sleeping = true;
> > +                    smp_mb();
> > +
> > +                    /* Bail out if we received an IRQ meanwhile */
> > +                    if (cpu->thread_kicked || (cpu->interrupt_request &
> > +                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> > +                        cpu->hvf->sleeping = false;
> > +                        break;
> > +                    }
> > +
> > +                    /* nanosleep returns on signal, so we wake up on kick. */
> > +                    nanosleep(ts, NULL);
> > 
> > and then send the signal conditional on whether sleeping is true, but
> > I think this is racy. If the signal is sent after sleeping is set to
> > true but before entering nanosleep then I think it will be ignored and
> > we will miss the wakeup. That's why in my implementation I block IPI
> > on the CPU thread at startup and then use pselect to atomically
> > unblock and begin sleeping. The signal is sent unconditionally so
> > there's no need to worry about races between actually sleeping and the
> > "we think we're sleeping" state. It may lead to an extra wakeup but
> > that's better than missing it entirely.
> 
> 
> Thanks a bunch for the comment! So the trick I was using here is to modify
> the timespec from the kick function before sending the IPI signal. That way,
> we know that either we are inside the sleep (where the signal wakes it up)
> or we are outside the sleep (where timespec={} will make it return
> immediately).
> 
> The only race I can think of is if nanosleep does calculations based on the
> timespec and we happen to send the signal right there and then.
> 
> The problem with blocking IPIs is basically what Frank was describing
> earlier: How do you unset the IPI signal pending status? If the signal is
> never delivered, how can pselect differentiate "signal from last time is
> still pending" from "new signal because I got an IPI"?
> 
> 

Hi Alex,

There was a patch for x86 HVF that implements CPU kick and it wasn't
merged (mostly because of my lazyness). It has some changes like you
introduced in the series and VMX-specific handling of preemption timer
to gurantee interrupt delivery without kick loss:

https://patchwork.kernel.org/project/qemu-devel/patch/20200729124832.79375-1-r.bolshakov@yadro.com/

I wonder if it'd possible to have common handling of kicks for both x86
and arm (given that arch-specific bits are wrapped)?

Thanks,
Roman

