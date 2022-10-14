Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9C5FF20E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 18:11:58 +0200 (CEST)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojNHw-0007gD-8j
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 12:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ojNDW-00010E-9T
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:07:22 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:48891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ojNDU-0001nP-35
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:07:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E68B021C04;
 Fri, 14 Oct 2022 16:07:15 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 14 Oct
 2022 18:07:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0062d29b763-9373-40d0-a39d-518a63c9fb5f,
 93E7CCAF9763085C798639D715A644A78EABBAA0) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 14 Oct 2022 18:07:14 +0200
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] util/log: Always send errors to logfile when daemonized
Message-ID: <20221014180714.6d423f74@bahia>
In-Reply-To: <398b4657-7b21-5e15-1db6-e9225e6f3d4e@redhat.com>
References: <20221014060807.660587-1-groug@kaod.org>
 <398b4657-7b21-5e15-1db6-e9225e6f3d4e@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: c13bb62c-c970-47ea-9368-96d90a869790
X-Ovh-Tracer-Id: 9886245611270740448
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekvddgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeekjedtveegkeeileffvdetvddvgedtudduiefghffhgfdvhfegjeetkeehfeeknecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.33.25; envelope-from=groug@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Oct 2022 10:51:36 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 10/14/22 08:08, Greg Kurz wrote:
> > 
> > +        need_to_open_file = log_flags && !per_thread;
> 
> Pre-existing, but I think this should check log_per_thread instead of 
> per_thread.
> 

Yes I agree, and also check qemu_loglevel instead of log_flags for
the same reason (and to match the comment just above).

> > +    } else if (filename) {
> > +        /*
> > +         * If we are daemonized, we will only log if there is a filename.
> > +         */
> > +        need_to_open_file = true;
> 
> Slightly nicer:
> 
>      } else {
>         /*
>          * If daemonized, always log to the -D file if present.
>          */
>          need_to_open_file = filename != NULL;
>      }
> 

Sure.

> > @@ -271,10 +276,22 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
> >   
> >       if (!logfile && need_to_open_file) {
> >           if (filename) {
> > -            logfile = fopen(filename, log_append ? "a" : "w");
> > +            g_autofree char *fname = NULL;
> > +
> > +            /*
> > +             * If per-thread, filename contains a single %d that should be
> > +             * converted.
> > +             */
> > +            if (per_thread) {
> > +                fname = g_strdup_printf(filename, getpid());
> > +            } else {
> > +                fname = g_strdup(filename);
> > +            }
> > +
> > +            logfile = fopen(fname, log_append ? "a" : "w");
> >               if (!logfile) {
> >                   error_setg_errno(errp, errno, "Error opening logfile %s",
> > -                                 filename);
> > +                                 fname);
> >                   return false;
> >               }
> >               /* In case we are a daemon redirect stderr to logfile */
> 
> This could conflict with the file opened by qemu_log_trylock() when 
> per-thread logging is enabled *and* QEMU is daemonized.  Perhaps 
> something like:
> 

Yeah... if the main thread happens to call qemu_log(), it then opens
a file with the same name indeed. Thanks for catching that !

> 1) change qemu_log_trylock() to
> 
> -        if (log_per_thread) {
> +        if (log_per_thread && log_thread_id() != getpid()) {
> 
> i.e. use the global_file for the main thread
> 
> 2) change qemu_log_unlock() to
> 
> -        if (!log_per_thread) {
> +        if (!thread_file) {
> 
> to match (1)
> 
> 3) change log_thread_id() to something like
> 
> ...
> #else
>      static __thread int my_id = -1;
>      static int counter;
>      if (my_id == -1) {
>          my_id = getpid() + qatomic_fetch_inc(&counter);
>      }
>      return my_id;
> #endif
> 
> and perhaps do a dummy trylock/unlock late in qemu_set_log_internal(), 
> to ensure that the main thread is the one with log_thread_id() == getpid()?
> 
> I think this can be a separate patch before this one.
> 

2) and 3) can certainly be preparatory work but I think 1)
should be squashed in my patch. Because of the !per_thread
check in need_to_open_file, the existing code in
qemu_set_log_internal() doesn't even open the global file
and qemu_log_trylock() would always return NULL for the
main thread.

Thanks for the quick answer and suggestions !

> Paolo
> 


