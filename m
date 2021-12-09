Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33B46E08A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 02:56:30 +0100 (CET)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv8fd-00043Y-5H
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 20:56:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mv8dk-0003ND-DO
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 20:54:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mv8dX-0008I3-5u
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 20:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639014858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hvjzZKyGNZy4VZJnEGxHawDGHhlhzDzymsMaGQ6FuHw=;
 b=SNy/0Ud1hrun917b14jVoWak3u2BpXENAliR+BaA86P/kNnVCHdswPpLN/z4V8wgkJ9Rnn
 TxpdC3lYGzChQJ9lEt/QUTm6HemQj2qkQI6KvDks5n025eifXCW3A78u27bimhtcmOx58C
 Njr/+Oaxi0cfxA7poatsFw4PO5dDO/M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-2LVVseTOOgeJyl0PvK6b1Q-1; Wed, 08 Dec 2021 20:54:17 -0500
X-MC-Unique: 2LVVseTOOgeJyl0PvK6b1Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so884538wrb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 17:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hvjzZKyGNZy4VZJnEGxHawDGHhlhzDzymsMaGQ6FuHw=;
 b=uzbMPHTIQorq+O/j9hhd5qmXkXnIbUYrPmAotRbK8FQa4AfyGTcq1slYbeeCfP91u9
 tP/i5pUlHndrf5iLQk4bBpr0fOE6TAzcAsSXqZjtW8nKhu6G2bhS1hji0ot8S7RiCCu4
 nMyO1C4YCCDH0oda7qgFAm3I63/KfDHYPLY2+RMn+driYLkRi2aXPzIxyUh7o0gcweQx
 Rq99zftPioxthY6KC3HBvnsONiyRCLi9YLwG0xMv7X/QN7p9KZQPC0nxLsDSJLxlbYQn
 50vvZK5SnIxcqmO6xJ+mXPmklBfJMi27Nkquq03ofWCPkcdTFVgyixmI8Wz5wy+rWIIF
 7nVw==
X-Gm-Message-State: AOAM530D1WMoKm8yyt4C9VC5F7q+U3HHasbJMdVsszkwjHVD673TmaXB
 GkUVUI9vu8mIxR+3I6zPgCvL0Nmu1eAMqi41IYNw6Pr+D2bQHM2VMbbIdMRoLRcsIacTTBesL8x
 O8nfl/1nU1mO2OKI=
X-Received: by 2002:adf:828e:: with SMTP id 14mr2753010wrc.567.1639014855623; 
 Wed, 08 Dec 2021 17:54:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynDTqSWG9SUHgIxiNuUUr+RMVbdQ5w6ohdPLhGsnEnhCh+KPJLXS5JKoGTpuNbzZ/FRwoS9Q==
X-Received: by 2002:adf:828e:: with SMTP id 14mr2752993wrc.567.1639014855411; 
 Wed, 08 Dec 2021 17:54:15 -0800 (PST)
Received: from xz-m1.local ([85.203.46.169])
 by smtp.gmail.com with ESMTPSA id q4sm4047577wrs.56.2021.12.08.17.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 17:54:14 -0800 (PST)
Date: Thu, 9 Dec 2021 09:54:10 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 7/7] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Message-ID: <YbFhQP3FldToWkGv@xz-m1.local>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-8-peterx@redhat.com>
 <YbELjB041z8jSBUE@work-vm>
MIME-Version: 1.0
In-Reply-To: <YbELjB041z8jSBUE@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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

On Wed, Dec 08, 2021 at 07:46:20PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > The enablement of postcopy listening has a few steps, add a few tracepoints to
> > be there ready for some basic measurements for them.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/savevm.c     | 5 ++++-
> >  migration/trace-events | 2 +-
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index 17b8e25e00..5b3f31eab2 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -1946,7 +1946,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
> >  static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> >  {
> >      PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
> > -    trace_loadvm_postcopy_handle_listen();
> > +    trace_loadvm_postcopy_handle_listen(1);
> 
> I think we tend just to split this into separate traces in many places;
> or if we're using the same one then we should use a string
> 
> I'd make this:
>   trace_loadvm_postcopy_handle_listen_entry();
> 
> for example.
> 
> >      Error *local_err = NULL;
> >  
> >      if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
> > @@ -1962,6 +1962,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> >              postcopy_ram_prepare_discard(mis);
> >          }
> >      }
> > +    trace_loadvm_postcopy_handle_listen(2);
> >  
> >      /*
> >       * Sensitise RAM - can now generate requests for blocks that don't exist
> > @@ -1974,6 +1975,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> >              return -1;
> >          }
> >      }
> > +    trace_loadvm_postcopy_handle_listen(3);
> >  
> >      if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
> >          error_report_err(local_err);
> > @@ -1988,6 +1990,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> >                         QEMU_THREAD_DETACHED);
> >      qemu_sem_wait(&mis->listen_thread_sem);
> >      qemu_sem_destroy(&mis->listen_thread_sem);
> > +    trace_loadvm_postcopy_handle_listen(4);
> 
>   trace_loadvm_postcopy_handle_listen_entry_end();

I see, I can use it.  It's just that I want to trap more than entry/exit.

For the "4 steps" here I split it into four procedures, the 2 steps inside are
majorly to trap either uffd registration time or external uffd handling of
other processes.

One example:

We may want to know how slow is postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN)
when there're some external process attached.  I wanted to be prepared for that
so when there's need to evaluate slowness of this procedure with vhost-user
enabled we have some tracepoints without replacing the binaries.

It's easy to use strings too if that's better looking than numbers.  How about:

  trace_loadvm_postcopy_handle_listen("entry")
  trace_loadvm_postcopy_handle_listen("uffd-reg")
  trace_loadvm_postcopy_handle_listen("external")
  trace_loadvm_postcopy_handle_listen("exit")

?

Thanks,

-- 
Peter Xu


