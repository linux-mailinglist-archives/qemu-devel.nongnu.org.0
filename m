Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E74C1040
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:25:15 +0100 (CET)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMopd-0001MC-BW
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:25:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMoEp-000094-P7
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMoEn-0008NS-Qy
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645609628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ip2UURxU1jIhA8JXLEPD/6/fVrqMyrfA7JU/lSbN9HA=;
 b=EybDSoWsmRAZ0fnTzRDTAoB/R+xmGdwwEqpxnf4F5vlvmIioppEqge7feHT+EXm71Tmp+W
 O7y5DL1X7iw/oTrDAJnN/KB3Bu9kVh7sUXVIIK6aRGLqRBMZrLltXrKWGR4UxqqYE0mExI
 U8j3MfN8q4QN359z0XkwYmVzRBOZzjI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-dt4PAlu5OdyCRomybcZ7pQ-1; Wed, 23 Feb 2022 04:47:07 -0500
X-MC-Unique: dt4PAlu5OdyCRomybcZ7pQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so1570843wmj.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:47:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ip2UURxU1jIhA8JXLEPD/6/fVrqMyrfA7JU/lSbN9HA=;
 b=pftG4tHwKLctrB7eysOHW4XASiD/2IHMx5C1ygXLWBiIiAAnjhYko9lEflqUJlycp8
 bNBcNeERD3svNB4Kj82q1b7PHzZJSowG9u/x/p/tizJTYbRDbasnrACz8p7INSkNOY8b
 LoWRfjVkldxl35TisW0y+oa/UfpKLNb/a8up93mQU/YC80BNDmoMWKuncuO52MOy3jY0
 z8b/duzHSPSK8OoKKS6BGi8iVmnvNXrN1e/JWrUn9uWNHogD6BYZLCFWYqOYo7jbx0F+
 W98jsVP0SLruvl9Rw2xHIIobc39efWv78AVweQ8Nw/p8544x0AWwLyIHQWbvBW9jolpa
 MdLw==
X-Gm-Message-State: AOAM5330KKAdcc3Vl7vRlmzObPkjMrWdMOmuGtOZEcjCxqmVdpNWFa1E
 swj9a+YINT4N0CEhipNaQ+7BpqX4xMiZ+UkNylz/82M9GKIyfKWzBa7YLLQwM5kVV+oYgQenPQ/
 Xp7I4efVoDNiFdjk=
X-Received: by 2002:adf:f48c:0:b0:1ea:9cb7:6c8b with SMTP id
 l12-20020adff48c000000b001ea9cb76c8bmr4302069wro.60.1645609626541; 
 Wed, 23 Feb 2022 01:47:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWVXT75/FprAVXQg2UM153H0Ja4IE3sBc1m10Q1IT18ZxxqhaAAu/IZNZ7zrAwQ8l4eYxgBQ==
X-Received: by 2002:adf:f48c:0:b0:1ea:9cb7:6c8b with SMTP id
 l12-20020adff48c000000b001ea9cb76c8bmr4302049wro.60.1645609626316; 
 Wed, 23 Feb 2022 01:47:06 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b0037d1e31a25csm5254996wmq.26.2022.02.23.01.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:47:05 -0800 (PST)
Date: Wed, 23 Feb 2022 09:47:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 13/20] migration: Move channel setup out of
 postcopy_try_recover()
Message-ID: <YhYCl/IgSMT0Tf6n@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-14-peterx@redhat.com>
 <YhTBnqF7Z2DLsjhY@work-vm> <YhXW6t4pfmhAJyZS@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YhXW6t4pfmhAJyZS@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Feb 22, 2022 at 10:57:34AM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > We used to use postcopy_try_recover() to replace migration_incoming_setup() to
> > > setup incoming channels.  That's fine for the old world, but in the new world
> > > there can be more than one channels that need setup.  Better move the channel
> > > setup out of it so that postcopy_try_recover() only handles the last phase of
> > > switching to the recovery phase.
> > > 
> > > To do that in migration_fd_process_incoming(), move the postcopy_try_recover()
> > > call to be after migration_incoming_setup(), which will setup the channels.
> > > While in migration_ioc_process_incoming(), postpone the recover() routine right
> > > before we'll jump into migration_incoming_process().
> > > 
> > > A side benefit is we don't need to pass in QEMUFile* to postcopy_try_recover()
> > > anymore.  Remove it.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > OK, but note one question below:
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Thanks.
> 
> > 
> > > ---
> > >  migration/migration.c | 23 +++++++++++------------
> > >  1 file changed, 11 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index 67520d3105..b2e6446457 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -665,19 +665,20 @@ void migration_incoming_process(void)
> > >  }
> > >  
> > >  /* Returns true if recovered from a paused migration, otherwise false */
> > > -static bool postcopy_try_recover(QEMUFile *f)
> > > +static bool postcopy_try_recover(void)
> > >  {
> > >      MigrationIncomingState *mis = migration_incoming_get_current();
> > >  
> > >      if (mis->state == MIGRATION_STATUS_POSTCOPY_PAUSED) {
> > >          /* Resumed from a paused postcopy migration */
> > >  
> > > -        mis->from_src_file = f;
> > > +        /* This should be set already in migration_incoming_setup() */
> > > +        assert(mis->from_src_file);
> > >          /* Postcopy has standalone thread to do vm load */
> > > -        qemu_file_set_blocking(f, true);
> > > +        qemu_file_set_blocking(mis->from_src_file, true);
> > 
> > Does that set_blocking happen on the 2nd channel somewhere?
> 
> Nop.  I think the rational is that by default all channels are blocking.
> 
> Then what happened is: migration code only sets the main channel to
> non-blocking on incoming, that's in migration_incoming_setup().  Hence for
> postcopy recovery we need to tweak it to blocking here.

OK, yes, so the rule seems to be if it's done in it's own thread, we
make it blocking.

> The 2nd new channel is not operated by migration_incoming_setup(), but by
> postcopy_preempt_new_channel(), so it keeps the original blocking state,
> which should be blocking.
> 
> If we want to make that clear, we can proactively set non-blocking too in
> postcopy_preempt_new_channel() on the 2nd channel.  It's just that it
> should be optional as long as blocking is the default for any new fd of a
> socket.

OK, I notice that in 9e4d2b9 made it explicit on the outgoing side.

Dave

> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


