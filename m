Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50D3EF12B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 19:56:45 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG3KO-0005pR-I5
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 13:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mG3J9-00050t-Sm
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 13:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mG3J3-0001oo-QW
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 13:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629222919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zIJ/HquNchLUyoSnSOh4tftuS50Y4wA8Q3wmama86LU=;
 b=HSjIN6mT6td0qQxiQI2K7b5tkP6marOqOjmsnDJpMO4mJ7DNA+Ix7JeQJP1YUsCLs8E78j
 h84ebTDR3JY5UcREH8t+SIH7XF8tNxjqVLsNWMYVlNoEci3ooX1yqZbGd13dSx2D+qssxS
 Nqa8VT+C/RmOs9+nPzyDmDwhuV+L8y0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-yV-GSrHGOZ6vprefMdu53g-1; Tue, 17 Aug 2021 13:55:15 -0400
X-MC-Unique: yV-GSrHGOZ6vprefMdu53g-1
Received: by mail-lj1-f199.google.com with SMTP id
 x1-20020a05651c0241b02901b900da420dso21463ljn.15
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 10:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zIJ/HquNchLUyoSnSOh4tftuS50Y4wA8Q3wmama86LU=;
 b=mZcQMhPOlTmo2Pu24yhFxjOt9I3YLBfDtIw5ht/ZYUmiRGMe3qDcjsw37L083sULDY
 M+xSwowKBR/DHuL73G2N5Wf/zdGvdRvZMMZEEkEx/x0eaqzLX8AKEkWyX8LUf0ZTXyLd
 KkBT5k5UmuFdaM3Yt/qRvUuf0c2LSB/Mc9GtSpCT7mxxveiBtoaL1EmvHN27AbaLkREM
 DShtTIoiv/H7d6eWLj0tZ7Wj6LshRK+aD0mKShSLpbIzdNZjNm2567DbXsYM4wYHmfoJ
 Mk3OYYhjXyAvsC5ecs60r181OgH9FIdAsXmyDBqfSojQYq10xjPcX5gB/98WOyTbekzi
 wgog==
X-Gm-Message-State: AOAM531Q2w/bXOXzqPWCCiGJd7LD9LLdviAcc1/wKxNTG/sLFV3d4LpO
 c/8MvtYfOPTOKB09m7D61t+BR+iYkW6njVQnhSNCAjmd1qWPGASuriNpUt71I9oJmPwjbiOuE7y
 +25P7pkwfoa4E9iFFIzdcdtRqo9BY6jY=
X-Received: by 2002:a2e:894a:: with SMTP id b10mr4231226ljk.143.1629222914369; 
 Tue, 17 Aug 2021 10:55:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+Uwd+E2VnQzX4ZVfiOd91tQ+637XGbrhI8q3aJxtAN2VY/OjKIRRNm8YeDLpLX+LvtxRH5KpUr0bm7wxe8ig=
X-Received: by 2002:a2e:894a:: with SMTP id b10mr4231199ljk.143.1629222914091; 
 Tue, 17 Aug 2021 10:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210804212724.07e411d6@gecko.fritz.box>
 <CAJ6HWG6+OH4tsyybpaTF+kLhSu=DmH2+Gcrypa-WhzcXrXEqYw@mail.gmail.com>
In-Reply-To: <CAJ6HWG6+OH4tsyybpaTF+kLhSu=DmH2+Gcrypa-WhzcXrXEqYw@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 17 Aug 2021 14:55:09 -0300
Message-ID: <CAJ6HWG7r-mJqkoSwX7-C+-C3wybkbYaqUBospeogsOjiN6ZUCQ@mail.gmail.com>
Subject: Re: [PATCH] multifd: Implement yank for multifd send side
To: Lukas Straub <lukasstraub2@web.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Li Xiaohui <xiaohli@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 2:44 AM Leonardo Bras Soares Passos
<leobras@redhat.com> wrote:
>
> Hello Lukas,
>
> On Wed, Aug 4, 2021 at 4:27 PM Lukas Straub <lukasstraub2@web.de> wrote:
> >
> > When introducing yank functionality in the migration code I forgot
> > to cover the multifd send side.
> >
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > ---
> >
> > @Leonardo Could you check if this fixes your issue?
>
> In the same scenario I was testing my previous patch,
> (http://patchwork.ozlabs.org/project/qemu-devel/patch/20210730074043.54260-1-leobras@redhat.com/)
> this patch also seems to fix the issue .
> (https://bugzilla.redhat.com/show_bug.cgi?id=1970337).

Regarding this single test:
Tested-by: Leonardo Bras <leobras@redhat.com>

I am by no means a yank or migration expert, but the change seems to
make sense based on what I could learn in the above BZ.

So, FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

Although I think it would be great if a more experienced person could
also review.

Best regards,
Leonardo Bras



>
>
> >
> >  migration/multifd.c | 6 +++++-
> >  migration/multifd.h | 2 ++
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 377da78f5b..5a4f158f3c 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -546,6 +546,9 @@ void multifd_save_cleanup(void)
> >          MultiFDSendParams *p = &multifd_send_state->params[i];
> >          Error *local_err = NULL;
> >
> > +        if (p->registered_yank) {
> > +            migration_ioc_unregister_yank(p->c);
> > +        }
> >          socket_send_channel_destroy(p->c);
> >          p->c = NULL;
> >          qemu_mutex_destroy(&p->mutex);
> > @@ -813,7 +816,8 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
> >                  return false;
> >              }
> >          } else {
> > -            /* update for tls qio channel */
> > +            migration_ioc_register_yank(ioc);
> > +            p->registered_yank = true;
> >              p->c = ioc;
> >              qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
> >                                     QEMU_THREAD_JOINABLE);
> > diff --git a/migration/multifd.h b/migration/multifd.h
> > index 8d6751f5ed..16c4d112d1 100644
> > --- a/migration/multifd.h
> > +++ b/migration/multifd.h
> > @@ -85,6 +85,8 @@ typedef struct {
> >      bool running;
> >      /* should this thread finish */
> >      bool quit;
> > +    /* is the yank function registered */
> > +    bool registered_yank;
> >      /* thread has work to do */
> >      int pending_job;
> >      /* array of pages to sent */
> > --
> > 2.32.0


