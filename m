Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1439E4C0CC4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 07:50:11 +0100 (CET)
Received: from localhost ([::1]:48188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMlTV-0001G9-KX
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 01:50:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMlKe-0007YD-7j
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 01:41:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMlKY-0003Ry-Ry
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 01:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645598450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nU3SgC3ZFOA8lTaFLv90S+Qn32vTOHBc0cbhCPW9CH4=;
 b=eBj6411+CVGFbUagDeY/UI3aIz8GC5ahAYKEc00gq97yWKtillrnqGS9k79L1IuCmuprHc
 1dbqBC9uISDh3yKQ18xiMG5FbZIfRESm5qX36k9corSpHEi5Cz1yCu8xU2wcu2ovr5yUlX
 lO4HcHn7wxFam0Go1Hjaq/tmU5FJQK8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-Mgv8BYspPDW5dXfuYdb9dA-1; Wed, 23 Feb 2022 01:40:48 -0500
X-MC-Unique: Mgv8BYspPDW5dXfuYdb9dA-1
Received: by mail-pg1-f200.google.com with SMTP id
 k13-20020a65434d000000b00342d8eb46b4so12686333pgq.23
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 22:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nU3SgC3ZFOA8lTaFLv90S+Qn32vTOHBc0cbhCPW9CH4=;
 b=G/Boz3VLEvvTrKVw3x5xHDe5k4dpuTs9ruLWR4PqdJyyug50A/ePtQg8y6OUdfnBfU
 hngj6DD1aFuEb4uhCwiekZAEjY/dbAY+b8CnaQkvY50j5FS7LRcGC1RHluGJMulykwYN
 KcdvHXMEth3nKJ0GvmYOzuObqLXHOpGe1pRE5SacVUy2B46Sw/WKJ1RQFyHYnSTDFSdd
 IWw2blpbkyRtCYK+WLYWbk2ZtLRKfuO35LIAJe6GFpd4WuOdolu3jdG150i2A69aBurA
 OPTQsMVDz5Kn9TjFiOyaJFKGm5tTYNFZS3RTuuqBtEKjJAoEo9SslmxRcyGhMRTZT/fK
 LBJA==
X-Gm-Message-State: AOAM531FKYbxELS+DC4ZsOGNPPXkgZlaj8xV3noVys3GD5+I3tJW3JTz
 LFL7JhZPWC/Vxp7OFWMv3aqMK9fWGJIYmaP/ms2OouJsAuWudGDr8yRDJuH+tq1RTplJWSpV30E
 4jEPTydRV8jBuKps=
X-Received: by 2002:a05:6a00:b51:b0:4c7:c1a3:3911 with SMTP id
 p17-20020a056a000b5100b004c7c1a33911mr28287057pfo.13.1645598447734; 
 Tue, 22 Feb 2022 22:40:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7LhCsF5mUd/+uyO0Jr+UYPb8aFB90IDIfxIaoiTxBfKUwT8yOlzS4NcJFCdf/wV7w7vWHhw==
X-Received: by 2002:a05:6a00:b51:b0:4c7:c1a3:3911 with SMTP id
 p17-20020a056a000b5100b004c7c1a33911mr28287042pfo.13.1645598447454; 
 Tue, 22 Feb 2022 22:40:47 -0800 (PST)
Received: from xz-m1.local ([94.177.118.100])
 by smtp.gmail.com with ESMTPSA id 14sm17265792pgd.2.2022.02.22.22.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 22:40:47 -0800 (PST)
Date: Wed, 23 Feb 2022 14:40:42 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 13/20] migration: Move channel setup out of
 postcopy_try_recover()
Message-ID: <YhXW6t4pfmhAJyZS@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-14-peterx@redhat.com>
 <YhTBnqF7Z2DLsjhY@work-vm>
MIME-Version: 1.0
In-Reply-To: <YhTBnqF7Z2DLsjhY@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Feb 22, 2022 at 10:57:34AM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > We used to use postcopy_try_recover() to replace migration_incoming_setup() to
> > setup incoming channels.  That's fine for the old world, but in the new world
> > there can be more than one channels that need setup.  Better move the channel
> > setup out of it so that postcopy_try_recover() only handles the last phase of
> > switching to the recovery phase.
> > 
> > To do that in migration_fd_process_incoming(), move the postcopy_try_recover()
> > call to be after migration_incoming_setup(), which will setup the channels.
> > While in migration_ioc_process_incoming(), postpone the recover() routine right
> > before we'll jump into migration_incoming_process().
> > 
> > A side benefit is we don't need to pass in QEMUFile* to postcopy_try_recover()
> > anymore.  Remove it.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> OK, but note one question below:
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks.

> 
> > ---
> >  migration/migration.c | 23 +++++++++++------------
> >  1 file changed, 11 insertions(+), 12 deletions(-)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 67520d3105..b2e6446457 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -665,19 +665,20 @@ void migration_incoming_process(void)
> >  }
> >  
> >  /* Returns true if recovered from a paused migration, otherwise false */
> > -static bool postcopy_try_recover(QEMUFile *f)
> > +static bool postcopy_try_recover(void)
> >  {
> >      MigrationIncomingState *mis = migration_incoming_get_current();
> >  
> >      if (mis->state == MIGRATION_STATUS_POSTCOPY_PAUSED) {
> >          /* Resumed from a paused postcopy migration */
> >  
> > -        mis->from_src_file = f;
> > +        /* This should be set already in migration_incoming_setup() */
> > +        assert(mis->from_src_file);
> >          /* Postcopy has standalone thread to do vm load */
> > -        qemu_file_set_blocking(f, true);
> > +        qemu_file_set_blocking(mis->from_src_file, true);
> 
> Does that set_blocking happen on the 2nd channel somewhere?

Nop.  I think the rational is that by default all channels are blocking.

Then what happened is: migration code only sets the main channel to
non-blocking on incoming, that's in migration_incoming_setup().  Hence for
postcopy recovery we need to tweak it to blocking here.

The 2nd new channel is not operated by migration_incoming_setup(), but by
postcopy_preempt_new_channel(), so it keeps the original blocking state,
which should be blocking.

If we want to make that clear, we can proactively set non-blocking too in
postcopy_preempt_new_channel() on the 2nd channel.  It's just that it
should be optional as long as blocking is the default for any new fd of a
socket.

Thanks,

-- 
Peter Xu


