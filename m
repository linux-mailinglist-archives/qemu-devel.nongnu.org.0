Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400E46E51A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:06:26 +0100 (CET)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFNg-0005Uu-QN
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:06:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mvFLh-0004SO-Ho
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:04:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mvFLc-0003ZW-TV
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639040655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VSYOmQce4xSeYxIzDO/LHp2hmoHg8wj9M46c/xkArvg=;
 b=dIfkR8FSYebD4QSiIQId9euFOX7lTkAfOrVi7vsXtMO5cDSMzymOLv6lGd8vLPh6clDDbH
 61VJcrlSBLIHeSNs3ChQlGE8yjYJYrTLlYuUXGOT0dyipudmYbkOeQW/CIRDZLuks/4bZP
 8E9WGHZ+Ivk3CCAZHDYOdwZ4HtCjlzA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-ukpiajPOMLmTlSMLYAynwA-1; Thu, 09 Dec 2021 04:04:14 -0500
X-MC-Unique: ukpiajPOMLmTlSMLYAynwA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q15-20020adfbb8f000000b00191d3d89d09so1173614wrg.3
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VSYOmQce4xSeYxIzDO/LHp2hmoHg8wj9M46c/xkArvg=;
 b=KKDBDH+rjPLAkoScb4MW06VKMGaMbeebNG8xyNCkYYDTd9EQmyYzO7tch/POYJdxwq
 bdIEOHwJuFUpkfQNVkoZacV86/fgY4KN21WpiuXrYUe32HZB+Y204eClIEsCy14uClxd
 Y3TzgRklJKeCEz8XxhuVHHTxqIrcFwEVWHmgNxxRYsTKGU3Qxg1idM8MRVPIJg5E27dg
 Ow+SnXUdAm1C4mk7nlslJGyBmO9YvROZ3GiyhOLyuceh1vLUhhIbzPflzFvuQMcQmg6A
 znVqLLWweAGK+2aB6aA1sBopQamcCQxB+rEWAaxEsrzM56MqXerG9UTBcZ/sUAWEziNi
 7SVw==
X-Gm-Message-State: AOAM530Kn5ZpJXC/U3aBdrURH4yS+t8vb3vWJuzU7LKiC/eZJ3a+zjS+
 E0OmTwatjUur2gcwiB/LOKi/iuWTkQISUNAG4V3zKtRYjUJQ/2MepbcJ0/i1q7IFEWpK7mJK7Qa
 4VMZZ9fmRVZVD2H8=
X-Received: by 2002:adf:e84e:: with SMTP id d14mr4828496wrn.472.1639040652968; 
 Thu, 09 Dec 2021 01:04:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfG3vV/aRyiYWe3LN4jC4aNnHV+jtlwRB2a/z9RSF4h0GXAskY10WYB/ydgOWJ7a4EhEsyyQ==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr4828466wrn.472.1639040652652; 
 Thu, 09 Dec 2021 01:04:12 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z6sm6245420wmp.9.2021.12.09.01.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:04:12 -0800 (PST)
Date: Thu, 9 Dec 2021 09:04:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 7/7] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Message-ID: <YbHGilsMgFp0dYYP@work-vm>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-8-peterx@redhat.com>
 <YbELjB041z8jSBUE@work-vm> <YbFhQP3FldToWkGv@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YbFhQP3FldToWkGv@xz-m1.local>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Dec 08, 2021 at 07:46:20PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > The enablement of postcopy listening has a few steps, add a few tracepoints to
> > > be there ready for some basic measurements for them.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  migration/savevm.c     | 5 ++++-
> > >  migration/trace-events | 2 +-
> > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > index 17b8e25e00..5b3f31eab2 100644
> > > --- a/migration/savevm.c
> > > +++ b/migration/savevm.c
> > > @@ -1946,7 +1946,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
> > >  static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> > >  {
> > >      PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
> > > -    trace_loadvm_postcopy_handle_listen();
> > > +    trace_loadvm_postcopy_handle_listen(1);
> > 
> > I think we tend just to split this into separate traces in many places;
> > or if we're using the same one then we should use a string
> > 
> > I'd make this:
> >   trace_loadvm_postcopy_handle_listen_entry();
> > 
> > for example.
> > 
> > >      Error *local_err = NULL;
> > >  
> > >      if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
> > > @@ -1962,6 +1962,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> > >              postcopy_ram_prepare_discard(mis);
> > >          }
> > >      }
> > > +    trace_loadvm_postcopy_handle_listen(2);
> > >  
> > >      /*
> > >       * Sensitise RAM - can now generate requests for blocks that don't exist
> > > @@ -1974,6 +1975,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> > >              return -1;
> > >          }
> > >      }
> > > +    trace_loadvm_postcopy_handle_listen(3);
> > >  
> > >      if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
> > >          error_report_err(local_err);
> > > @@ -1988,6 +1990,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> > >                         QEMU_THREAD_DETACHED);
> > >      qemu_sem_wait(&mis->listen_thread_sem);
> > >      qemu_sem_destroy(&mis->listen_thread_sem);
> > > +    trace_loadvm_postcopy_handle_listen(4);
> > 
> >   trace_loadvm_postcopy_handle_listen_entry_end();
> 
> I see, I can use it.  It's just that I want to trap more than entry/exit.
> 
> For the "4 steps" here I split it into four procedures, the 2 steps inside are
> majorly to trap either uffd registration time or external uffd handling of
> other processes.
> 
> One example:
> 
> We may want to know how slow is postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN)
> when there're some external process attached.  I wanted to be prepared for that
> so when there's need to evaluate slowness of this procedure with vhost-user
> enabled we have some tracepoints without replacing the binaries.
> 
> It's easy to use strings too if that's better looking than numbers.  How about:
> 
>   trace_loadvm_postcopy_handle_listen("entry")
>   trace_loadvm_postcopy_handle_listen("uffd-reg")
>   trace_loadvm_postcopy_handle_listen("external")
>   trace_loadvm_postcopy_handle_listen("exit")
> 

Yes, that's fine; but it would also be fine to create 4 separate traces.

Dave

> ?
> 
> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


