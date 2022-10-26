Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A6F60DB28
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 08:29:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onZtF-0003ns-57; Wed, 26 Oct 2022 02:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1onZt7-0002se-AV
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 02:27:43 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1onZsu-0003h0-ID
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 02:27:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DCBDA25C4C;
 Wed, 26 Oct 2022 06:27:23 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 26 Oct
 2022 08:27:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0044380cc0a-2a31-4c31-9427-b536b53ee74b,
 1C280F6D154458F0B108E6FF4B978E1879665B11) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 26 Oct 2022 08:27:22 +0200
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] util/log: do not close and reopen log files when flags
 are turned off
Message-ID: <20221026082722.1368f5c8@bahia>
In-Reply-To: <CABgObfZcmAr6S7zMK3N86gnpobL-=aS1mSW6yVitz3t2Va2h7g@mail.gmail.com>
References: <20221025092119.236224-1-pbonzini@redhat.com>
 <20221025143315.5697edad@bahia> <20221025163851.75ac37a1@bahia>
 <CABgObfZcmAr6S7zMK3N86gnpobL-=aS1mSW6yVitz3t2Va2h7g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 6959cc23-fdfe-48cd-9bb2-689e3336ede0
X-Ovh-Tracer-Id: 15225262965441403360
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrtddugddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeekjedtveegkeeileffvdetvddvgedtudduiefghffhgfdvhfegjeetkeehfeeknecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 22:27:36 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Il mar 25 ott 2022, 16:39 Greg Kurz <groug@kaod.org> ha scritto:
> 
> > > > -    if (logfile && (!need_to_open_file || changed_name)) {
> > > > -        qatomic_rcu_set(&global_file, NULL);
> >
> > Hmm... wait, shouldn't this NULLifying be performed...
> >
> > > > -        if (logfile != stderr) {
> > > > +    if (logfile) {
> > > > +        fflush(logfile);
> > > > +        if (changed_name && logfile != stderr) {
> > > >              RCUCloseFILE *r = g_new0(RCUCloseFILE, 1);
> > > >              r->fd = logfile;
> >
> >
> > ... here since we the following closes the global_file ?
> >
> > > >              call_rcu(r, rcu_close_file, rcu);
> >
> 
> Yes it should.
> 

I'll fix this when I repost the full series.

Cheers,

--
Greg


> Paolo
> 
> > > +            logfile = NULL;
> > > >          }
> > > > -        logfile = NULL;
> > > >      }
> > > >
> > > >      if (!logfile && need_to_open_file) {
> > > >          if (filename) {
> > > > -            logfile = fopen(filename, log_append ? "a" : "w");
> > > > +            logfile = fopen(filename, "w");
> > > >              if (!logfile) {
> > > >                  error_setg_errno(errp, errno, "Error opening logfile
> > %s",
> > > >                                   filename);
> > > > @@ -290,8 +289,6 @@ static bool qemu_set_log_internal(const char
> > *filename, bool changed_name,
> > > >              logfile = stderr;
> > > >          }
> > > >
> > > > -        log_append = 1;
> > > > -
> > > >          qatomic_rcu_set(&global_file, logfile);
> > > >      }
> > > >      return true;
> > >
> > >
> >
> >


