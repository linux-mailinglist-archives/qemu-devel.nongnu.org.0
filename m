Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DD4C1379
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 13:59:53 +0100 (CET)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMrFI-0004W1-BR
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 07:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMrB4-00023V-7u
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:55:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMrB1-0001TL-1i
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645620918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=//7nXpUguqxjkdanb6g5AFsFGxU9LvXB49r4LMfpOh8=;
 b=BsmUuNl3KXU8sZVeoYuSCvSMRJY2IiiMh5jwzE6e3kmELwhUUuPTsrJy/LuGy+iQmU0QmP
 voX0r5gQIuf7UFmqMokaqXGVoWTZecu16sSXo9O9/RK2rd7vXB8kXibgdkv9ebnnDOTP65
 22XTJRlIHA/aBo/+rpWNlS7eNjTWNyI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-KyCytWx2OluzSaxKULKe3g-1; Wed, 23 Feb 2022 07:55:15 -0500
X-MC-Unique: KyCytWx2OluzSaxKULKe3g-1
Received: by mail-pf1-f198.google.com with SMTP id
 x194-20020a627ccb000000b004e103c5f726so8968667pfc.8
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 04:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=//7nXpUguqxjkdanb6g5AFsFGxU9LvXB49r4LMfpOh8=;
 b=kFuvjei33ePw/taiSa0DVyExvnZZPOeM09V+ESRCoNpCQhToU/3ijm7h+HwtX8hADv
 4et+cYUEgeicijPk6J+uA/yBCuNtuQfVCIn/loQ18nIj3jIOEXxCVY5JJvv2IRHr207X
 Vsqsk94M4v8AlIFwWMAh8hheBHadW4jLBonJvA1q2GBSSf+b7DFziBBEH1q6dXf9B1MU
 I8mbs5D4LREDZv+DafgYftzKhh+uqESdTLR9I40EE/lGi+tQVIHoBa4DZ82Rr/ARl+UV
 NHKGoTSGIzQgqsvvHG1fdonuxpm8fExBBVRKL39g7ZTOpOXcfWqEAG4A2AipHT1HQOfV
 0aYg==
X-Gm-Message-State: AOAM5326pTCqspnMh+bvB3camUY9QdqszLk8XPxtMxLLMWKM1y5/cuaR
 DPkvtlP+yrlMp6cw/XsXg1fdi0VgKt1FFBywYoYQF88UxkfERVEDyA+3f4rOk/y2FI2lDOSwVM5
 VFFHed9VYouym8Qw=
X-Received: by 2002:a65:5bc1:0:b0:373:ec8f:9f50 with SMTP id
 o1-20020a655bc1000000b00373ec8f9f50mr18352943pgr.289.1645620913871; 
 Wed, 23 Feb 2022 04:55:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznO3Co50lQYp8iLtqPdPjr2naJcbMMOaFBsPUmFraX3E/w7UYDKwKru8+pMlK0cIODfvtAoQ==
X-Received: by 2002:a65:5bc1:0:b0:373:ec8f:9f50 with SMTP id
 o1-20020a655bc1000000b00373ec8f9f50mr18352927pgr.289.1645620913557; 
 Wed, 23 Feb 2022 04:55:13 -0800 (PST)
Received: from xz-m1.local ([94.177.118.100])
 by smtp.gmail.com with ESMTPSA id f19sm21384505pfe.68.2022.02.23.04.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 04:55:13 -0800 (PST)
Date: Wed, 23 Feb 2022 20:55:08 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 13/20] migration: Move channel setup out of
 postcopy_try_recover()
Message-ID: <YhYurGF8RLyWFDmB@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-14-peterx@redhat.com>
 <YhTBnqF7Z2DLsjhY@work-vm> <YhXW6t4pfmhAJyZS@xz-m1.local>
 <YhYCl/IgSMT0Tf6n@work-vm>
MIME-Version: 1.0
In-Reply-To: <YhYCl/IgSMT0Tf6n@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Wed, Feb 23, 2022 at 09:47:03AM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Feb 22, 2022 at 10:57:34AM +0000, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > We used to use postcopy_try_recover() to replace migration_incoming_setup() to
> > > > setup incoming channels.  That's fine for the old world, but in the new world
> > > > there can be more than one channels that need setup.  Better move the channel
> > > > setup out of it so that postcopy_try_recover() only handles the last phase of
> > > > switching to the recovery phase.
> > > > 
> > > > To do that in migration_fd_process_incoming(), move the postcopy_try_recover()
> > > > call to be after migration_incoming_setup(), which will setup the channels.
> > > > While in migration_ioc_process_incoming(), postpone the recover() routine right
> > > > before we'll jump into migration_incoming_process().
> > > > 
> > > > A side benefit is we don't need to pass in QEMUFile* to postcopy_try_recover()
> > > > anymore.  Remove it.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > 
> > > OK, but note one question below:
> > > 
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > Thanks.
> > 
> > > 
> > > > ---
> > > >  migration/migration.c | 23 +++++++++++------------
> > > >  1 file changed, 11 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/migration/migration.c b/migration/migration.c
> > > > index 67520d3105..b2e6446457 100644
> > > > --- a/migration/migration.c
> > > > +++ b/migration/migration.c
> > > > @@ -665,19 +665,20 @@ void migration_incoming_process(void)
> > > >  }
> > > >  
> > > >  /* Returns true if recovered from a paused migration, otherwise false */
> > > > -static bool postcopy_try_recover(QEMUFile *f)
> > > > +static bool postcopy_try_recover(void)
> > > >  {
> > > >      MigrationIncomingState *mis = migration_incoming_get_current();
> > > >  
> > > >      if (mis->state == MIGRATION_STATUS_POSTCOPY_PAUSED) {
> > > >          /* Resumed from a paused postcopy migration */
> > > >  
> > > > -        mis->from_src_file = f;
> > > > +        /* This should be set already in migration_incoming_setup() */
> > > > +        assert(mis->from_src_file);
> > > >          /* Postcopy has standalone thread to do vm load */
> > > > -        qemu_file_set_blocking(f, true);
> > > > +        qemu_file_set_blocking(mis->from_src_file, true);
> > > 
> > > Does that set_blocking happen on the 2nd channel somewhere?
> > 
> > Nop.  I think the rational is that by default all channels are blocking.
> > 
> > Then what happened is: migration code only sets the main channel to
> > non-blocking on incoming, that's in migration_incoming_setup().  Hence for
> > postcopy recovery we need to tweak it to blocking here.
> 
> OK, yes, so the rule seems to be if it's done in it's own thread, we
> make it blocking.
> 
> > The 2nd new channel is not operated by migration_incoming_setup(), but by
> > postcopy_preempt_new_channel(), so it keeps the original blocking state,
> > which should be blocking.
> > 
> > If we want to make that clear, we can proactively set non-blocking too in
> > postcopy_preempt_new_channel() on the 2nd channel.  It's just that it
> > should be optional as long as blocking is the default for any new fd of a
> > socket.
> 
> OK, I notice that in 9e4d2b9 made it explicit on the outgoing side.

Indeed, then let me do the same!

-- 
Peter Xu


