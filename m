Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E62CE24C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 00:07:04 +0100 (CET)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkxgk-0000DZ-Oq
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 18:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkxdg-0006sO-Uv; Thu, 03 Dec 2020 18:03:52 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:60212 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkxde-0004A0-Qx; Thu, 03 Dec 2020 18:03:52 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3CF3E413D5;
 Thu,  3 Dec 2020 23:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607036627;
 x=1608851028; bh=MtEDsv9qLd1EMFqncsWZDnlOigSwtDR6qJ19jveVIMU=; b=
 XS+670TOkSYKqNNbZOaNb34z1d2IyI1qwAVNJ/92/NAktWo/5IN4P6TPo5pMbLHp
 7ukBiIUqqr+VkgxSD5dhZAwc+JZKbWU1ytyd5Kpc3rqnvfGP1RdOBcbeORxUQhVx
 EYQF0zkNgsaKNKaRRinMZKaT8hfPJMIrOKAYN6P/SDE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m76ttCrY3fkR; Fri,  4 Dec 2020 02:03:47 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 681F641399;
 Fri,  4 Dec 2020 02:03:46 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 02:03:46 +0300
Date: Fri, 4 Dec 2020 02:04:07 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 2/8] hvf: Move common code out
Message-ID: <20201203230407.GB14685@SPB-NB-133.local>
References: <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
 <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
 <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
 <CAMn1gO5xs8RniRYm+Gnbh8S3GVah2+2Ew2V6tFL6PNuSJ7o5Hw@mail.gmail.com>
 <4e1d93a4-9dcc-c6b6-e060-6eea39ae2f16@csgraf.de>
 <CAMn1gO44Y4rahufveQ1dOq96nhqvGEmZ0pYci2f6BKv9kd638Q@mail.gmail.com>
 <20201203094124.GA7201@SPB-NB-133.local>
 <CAMn1gO6kMFLGKy4VuOL=CyP=ioGAZJmogT=y6dd=SQ82odK8_Q@mail.gmail.com>
 <2a286418-aa8e-17b9-1be2-58b0b361dec5@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2a286418-aa8e-17b9-1be2-58b0b361dec5@csgraf.de>
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
 qemu-arm <qemu-arm@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 11:13:35PM +0100, Alexander Graf wrote:
> 
> On 03.12.20 19:42, Peter Collingbourne wrote:
> > On Thu, Dec 3, 2020 at 1:41 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> > > On Mon, Nov 30, 2020 at 04:00:11PM -0800, Peter Collingbourne wrote:
> > > > What I observe is that when returning from a pending signal pselect
> > > > consumes the signal (which is also consistent with my understanding of
> > > > what pselect does). That means that it doesn't matter if we take a
> > > > second WFx exit because once we reach the pselect in the second WFx
> > > > exit the signal will have been consumed by the pselect in the first
> > > > exit and we will just wait for the next one.
> > > > 
> > > Aha! Thanks for the explanation. So, the first WFI in the series of
> > > guest WFIs will likely wake up immediately? After a period without WFIs
> > > there must be a pending SIG_IPI...
> > > 
> > > It shouldn't be a critical issue though because (as defined in D1.16.2)
> > > "the architecture permits a PE to leave the low-power state for any
> > > reason, it is permissible for a PE to treat WFI as a NOP, but this is
> > > not recommended for lowest power operation."
> > > 
> > > BTW. I think a bit from the thread should go into the description of
> > > patch 8, because it's not trivial and it would really be helpful to keep
> > > in repo history. At least something like this (taken from an earlier
> > > reply in the thread):
> > > 
> > >    In this implementation IPI is blocked on the CPU thread at startup and
> > >    pselect() is used to atomically unblock the signal and begin sleeping.
> > >    The signal is sent unconditionally so there's no need to worry about
> > >    races between actually sleeping and the "we think we're sleeping"
> > >    state. It may lead to an extra wakeup but that's better than missing
> > >    it entirely.
> > Okay, I'll add something like that to the next version of the patch I send out.
> 
> 
> If this is the only change, I've already added it for v4. If you want me to
> change it further, just let me know what to replace the patch description
> with.
> 
> 

Thanks, Alex.

I'm fine with the description and all set.

-Roman

