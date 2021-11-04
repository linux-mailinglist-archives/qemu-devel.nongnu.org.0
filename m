Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212DA4452FE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:29:12 +0100 (CET)
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mibrh-0005zv-Rk
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mibpw-00053J-SZ
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mibpt-0004M5-Tv
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636028836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tV/vMknzsWgi0RzTy41v7nbtgGS25wIgh/r7kz9NBbw=;
 b=fuu7ZdsrU+1t0iOACML4yRKLIZX0FjrYE+0ONHgkeKqhLZtJc02KnX0OmialyrXBRzupth
 E4FJyMaZLs2FBNitpr2bPt+EgbudY28nzD9+VmdxEwVfCgkx7Za+nzS7bDrxRRvrshRmFj
 h2twHIh5DoSa9prWjIQtsZi1BFL4uq8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-WDq9IJOqNgeC5zebRhIw_w-1; Thu, 04 Nov 2021 08:27:15 -0400
X-MC-Unique: WDq9IJOqNgeC5zebRhIw_w-1
Received: by mail-wm1-f71.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so2536391wmr.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 05:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tV/vMknzsWgi0RzTy41v7nbtgGS25wIgh/r7kz9NBbw=;
 b=MMqbpph7VAxt/ZEkmPT5a6g6omoGrJwstweYOfvlDaH47JIS/MI78qs02nRJozionZ
 nyIcpRAfCYwkE1PqZw50pBTMKuPeVESKdrXdIAkLyQbZpg6xVhnbmp73urD68kyuaZ4v
 xKstFU7WA3dVEjI5jkwlvEbYGs0Ud2LrNWrdyn0+leng6L9Nix542ZHMvG/OjvmeoD3m
 8op27Br9U4BeZ2PtQ3sZwqmI5s24n9i0NUbzIj6wIDeScMlbdFDQTVRzzblZ5Msl7shj
 vhYSRPzztU1wolGhBtHtB+x0zvfzK7EnOp1qJYO5tbDZIfd8eXSu+N92dYDrtA5WYTPm
 aXyA==
X-Gm-Message-State: AOAM530S1c9px9wa1jVmS6JEZRZEoM5Y8quEr0SQVdyWhv/7EMTqG6gS
 m9OUfCPVHEbeH+NNcGxkZbcZvQR4Ax0dUWgNxgQYdrrxQqDOLMCae6oLrA6QPLoATZi15peroCE
 rdNB6GLVk2JrmD3o=
X-Received: by 2002:adf:fd4c:: with SMTP id h12mr51216960wrs.429.1636028834261; 
 Thu, 04 Nov 2021 05:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4VrKeafJoA5/0FMoZ+awxjcuceAcLnSKeBjsC+ViR8Bwbs/MzD3z2J3CDjo3RTMCxAzzUVQ==
X-Received: by 2002:adf:fd4c:: with SMTP id h12mr51216945wrs.429.1636028834059; 
 Thu, 04 Nov 2021 05:27:14 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id w10sm4844664wrq.88.2021.11.04.05.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 05:27:13 -0700 (PDT)
Date: Thu, 4 Nov 2021 12:27:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] postocpy: Check that postocpy fd's are not NULL
Message-ID: <YYPRn8geZ21UKsA/@work-vm>
References: <20211103193129.23930-1-quintela@redhat.com>
 <YYLqcx/Y9EqhZKhG@work-vm> <87r1bxgfvk.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87r1bxgfvk.fsf@secure.mitica>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> If postcopy has finished, it frees the array.
> >> But vhost-user unregister it at cleanup time.
> >
> > I must admit to being confused as the double migrate case vs migrate
> > once and shutdown. It might just be an ordering thing?
> >
> > I notice that  'vhost_user_backend_cleanup' does:
> >     if (u->postcopy_fd.handler) {
> >         postcopy_unregister_shared_ufd(&u->postcopy_fd);
> >         close(u->postcopy_fd.fd);
> >         u->postcopy_fd.handler = NULL;
> >     }
> >
> > where as the other caller, 'vhost_user_postcopy_end'
> > does:
> >     postcopy_unregister_shared_ufd(&u->postcopy_fd);
> >     close(u->postcopy_fd.fd);
> >     u->postcopy_fd.handler = NULL;
> 
> I think that we want ta make here the check to see if it has already
> been freed.
> 
> > maybe it would be better to fix them to do the same if check?
> 
> But even there, I think that it is more robust that we don't try to
> access a NULL pointer.
> 
> I.e. there are two things that we can fix here:
> - postcopy unregister
> - vhost use of postcopy unregister

True we could indeed fix both as a belt-and-braces.

> > (Also note 'post*o*cpy' typo in title, and probably worth a
> >   Fixes: c4f7538 ?)
> 
> Sure.
> 
> What do you think?

So yeh,

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Please do the other if as a separate patch sometime.

Dave

> Later, Juan.
> 
> > Dave
> >
> >
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  migration/postcopy-ram.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >> 
> >> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> >> index e721f69d0f..d18b5d05b2 100644
> >> --- a/migration/postcopy-ram.c
> >> +++ b/migration/postcopy-ram.c
> >> @@ -1457,6 +1457,10 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
> >>      MigrationIncomingState *mis = migration_incoming_get_current();
> >>      GArray *pcrfds = mis->postcopy_remote_fds;
> >>  
> >> +    if (!pcrfds) {
> >> +        /* migration has already finished and freed the array */
> >> +        return;
> >> +    }
> >>      for (i = 0; i < pcrfds->len; i++) {
> >>          struct PostCopyFD *cur = &g_array_index(pcrfds, struct PostCopyFD, i);
> >>          if (cur->fd == pcfd->fd) {
> >> -- 
> >> 2.33.1
> >> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


