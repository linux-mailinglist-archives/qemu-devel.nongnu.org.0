Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE473D2B53
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:44:26 +0200 (CEST)
Received: from localhost ([::1]:58440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ckD-0006Ea-9B
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cbv-0000lC-3U
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cbq-0007eZ-Tm
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626975344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ODzoNoJK4l8muA8OZ1rMraSwtbgwe0/afOBBaJRBfo=;
 b=ficf3ypDxmIlzwODMSCGI5y/Fkrvqv4H1plM6Jc29Cp4TmzX7ciSsF50j8l7qFk7EbBcNv
 YuitPjYcEzF9ezFMd5wMJH5hrUYKC6deVEqBu5DAO5Wsl3cZTZZuGPgDXe7xBFvTYT0Vqk
 J3X7iGCBpfplPa0/uj3s110oYgZxXFA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-i2kCKMynMgy0jUvW_faq1A-1; Thu, 22 Jul 2021 13:35:43 -0400
X-MC-Unique: i2kCKMynMgy0jUvW_faq1A-1
Received: by mail-qk1-f199.google.com with SMTP id
 o14-20020a05620a0d4eb02903a5eee61155so4642726qkl.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9ODzoNoJK4l8muA8OZ1rMraSwtbgwe0/afOBBaJRBfo=;
 b=amsI/eJi8+AvfxMeLmptStGsWztEchj25VlAHvPCxMoEYNpQyQE4QPtJnhUX/zgLrZ
 +xUdggo9yKK/z2nQdLykMMTXjfdgyKhkyR8AJCSETj0XXd3EZfmiNtoqf3dVudvXpkgu
 9l2oqeAaHePiixLse7/00AP66f5CVuZGwjppkvhajMdAY5V7JLuMuLD/xCE6QrqI+KRW
 /eKoXJFjJf10pNBox2oerw1/uRJflJhsktYXuvZGoxT5ycjPdHKbJYypD/ASRogISFs+
 0rV2Kxn3xWgAykP5cCqT51qWUmeI0kp2b7TPtMo8KssgRiAJCZBEhzo1gAQppWOYqK6i
 oOSA==
X-Gm-Message-State: AOAM531m/MUAflKkv4ZwD25Fzj/aCFPGPK6OJEkOCg++Bx875jo1NK4l
 8JPd37oAyQ2Hrlk06Cd7Nq29IuAKNFQL1ZDdKF9Crz0zRLMGiCY9ftfpLklg04au4QO16t/NKHw
 Cgl22jCJjtFnUGxk=
X-Received: by 2002:a37:487:: with SMTP id 129mr785474qke.154.1626975342956;
 Thu, 22 Jul 2021 10:35:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyw8HwWWRGV3Q8Bv+NPgxmzFwo8vzpL3xYL9mqjD5rZ0OOYtU9WdDoSqJOb1ck+5Pw38WCbw==
X-Received: by 2002:a37:487:: with SMTP id 129mr785455qke.154.1626975342692;
 Thu, 22 Jul 2021 10:35:42 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id v25sm7839002qkf.108.2021.07.22.10.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:35:42 -0700 (PDT)
Date: Thu, 22 Jul 2021 13:35:41 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 5/5] migration: Move the yank unregister of
 channel_close out
Message-ID: <YPmsbTotU7wVC4P0@t490s>
References: <20210721193409.910462-1-peterx@redhat.com>
 <20210721193409.910462-6-peterx@redhat.com>
 <YPmOZ3LGm0u7GoBA@work-vm> <YPmagh393LlpVSm9@t490s>
 <YPmmL9XBdsCFH2rs@work-vm>
MIME-Version: 1.0
In-Reply-To: <YPmmL9XBdsCFH2rs@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 06:09:03PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Thu, Jul 22, 2021 at 04:27:35PM +0100, Dr. David Alan Gilbert wrote:
> > > > @@ -3352,6 +3355,8 @@ static MigThrError postcopy_pause(MigrationState *s)
> > > >  
> > > >          /* Current channel is possibly broken. Release it. */
> > > >          assert(s->to_dst_file);
> > > > +        /* Unregister yank for current channel */
> > > > +        migration_ioc_unregister_yank_from_file(s->to_dst_file);
> > > 
> > > Should this go inside the lock?
> > 
> > Shouldn't need to; as we've got the assert() right above so otherwise we'll
> > abrt otherwise :)
> 
> Hmm OK; although with out always having to think about it then you worry
> about something getting in after the assert.

Right; the point is still that to_dst_file shouldn't be changed by other
thread, or it'll bring some more challenge.

If it can be mnodified when reaching this line, it means it can also reach
earlier at assert(), then we coredump.  So we should guaratee it won't happen,
or we'd better also remove that assertion..

I think the challenge here is, we do have a mutex to protect the files and from
that pov it's the same as other mutex.  However it's different in that this
mutex is also used in the oob handlers so we want to "keep it non-blocking and
as small as possible for the critical sections".

I didn't put it into the mutex protection because the yank code will further go
to take the yank_lock so it'll make things slightly more complicated (then the
file mutex is correlated to yank_lock too!).  I don't think that's a problem
because yank_lock is also "non-blocking" (ah! it can still block, got scheduled
out, but there's no explicit things that will proactively sleep..).  So since I
think it's safe without the lock then I kept it outside of the lock then we
don't need to discuss the safely of having it inside the critical section.

(However then I noticed we still need justification on why it can be moved out..)

> 
> > The mutex lock/unlock right below this one is not protecting us from someone
> > changing it but really for being able to wait until someone finished using it
> > then we won't crash someone else.
> > 
> > I think the rational is to_dst_file is managed by migration thread while
> > from_dst_file is managed by rp_thread.
> > 
> > Maybe I add a comment above?
> 
> OK, I almost pushed this further, but then I started to get worried that
> we'd trace off a race with ordering on two locks with yank_lock; so yeh
> lets just add a comment.

Agreed.  I think ordering is not a huge problem as yank_lock is very limitedly
used in yank and protect yank instance/functions only, so there shouldn't be a
path we take file mutex within it.  Will repost shortly, thanks.

-- 
Peter Xu


