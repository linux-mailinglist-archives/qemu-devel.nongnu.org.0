Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8156AC4C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 22:01:49 +0200 (CEST)
Received: from localhost ([::1]:60666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Xh6-0007Im-5u
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 16:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o9Xf6-0006ai-Tk
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o9Xf4-0003p2-Av
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657223981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O0X7XxTEXBP5vTeCS7xaQuPeh7MlQDRhBGojXHenEYc=;
 b=T3c3Da+KJqXj9e5hRtTuHEmVI+sFjGl2bRLhhM1ZdUhsuoxlx83ueVzU/7iSncoOfCr41o
 2Rcwwyd9G0ZH1XpaEQESfSVMmJUEXX9V/Sqxypm894awaknGG7q3HRcZI0FOU8+AINSMuc
 i200Odlp/yA2ojQ7UTJ82eRWNpw7PEo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-Kh0xKYU-O5i4Nm3aByuESw-1; Thu, 07 Jul 2022 15:59:34 -0400
X-MC-Unique: Kh0xKYU-O5i4Nm3aByuESw-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a056402519200b004358ce90d97so14357456edd.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 12:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O0X7XxTEXBP5vTeCS7xaQuPeh7MlQDRhBGojXHenEYc=;
 b=7fcIg5MywmYdInb1b1rvHYNC+gyhw1ZOonoqhRB7p6VftTldzrfcc0dl0WJxxtucpn
 kmEfHmvUFeB4obhAOmjox0JCKA5pafHuzgYDTUQZ0Th2p0sfLYRP/byrqn6wPvgar8wp
 N8u1hXNFm3ADzG3zs/haNWJpGaj7b7p2r9bfqgLUERFNLeAVYE0fCjgkewVZs4B7tEfD
 FrVB5KKdag99N1zbmEKqDsQx6EiChoY518VblnICdAixMuArcEc/rpX45YDOgAqXtg5v
 lUSJBhmXmUSG6XGp/cVMe+ALiKJR1G3uzxCBAU7eeYykKf+EPboi2IDom9j1h6ZTHqoR
 Ngeg==
X-Gm-Message-State: AJIora9sloPmrY7RaPZQopDbbYNYnH0sNJvLKIYsE85KPohveDhr2X4v
 WSzCGP0N79MXpEGFcFWr/RY0zlGdBeQcqJ7Eg6i+MUVa7f7e+ev1GS1841dwkKjLg95xL06yCTR
 hbv2t9HUS+cioihpzxgzO9pFDasDJHIA=
X-Received: by 2002:a05:6402:3818:b0:436:f2e1:64b3 with SMTP id
 es24-20020a056402381800b00436f2e164b3mr64282914edb.111.1657223973694; 
 Thu, 07 Jul 2022 12:59:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1J+Yk/Eu5oCkIQsc2PSz2uQ6wXtXWyfs4yfnO6miMdQCNtfZwMFq4S0xumKzNCD0WaNtZlN1UZsAZY8Fb8E0=
X-Received: by 2002:a05:6402:3818:b0:436:f2e1:64b3 with SMTP id
 es24-20020a056402381800b00436f2e164b3mr64282880edb.111.1657223973460; Thu, 07
 Jul 2022 12:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-4-leobras@redhat.com>
 <YsceXwzZGaWBBe5D@xz-m1.local>
In-Reply-To: <YsceXwzZGaWBBe5D@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 7 Jul 2022 16:59:22 -0300
Message-ID: <CAJ6HWG7d_v1Zc9wKZJrGYb7U3JXx08-adyWATDiQ9gjvsjU6ow@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] migration/multifd: Warn user when zerocopy not
 working
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Thu, Jul 7, 2022 at 2:56 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jul 04, 2022 at 05:23:15PM -0300, Leonardo Bras wrote:
> > Some errors, like the lack of Scatter-Gather support by the network
> > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> > zero-copy, which causes it to fall back to the default copying mechanism.
> >
> > After each full dirty-bitmap scan there should be a zero-copy flush
> > happening, which checks for errors each of the previous calls to
> > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> > increment dirty_sync_missed_zero_copy migration stat to let the user know
> > about it.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/ram.h     | 2 ++
> >  migration/multifd.c | 2 ++
> >  migration/ram.c     | 5 +++++
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/migration/ram.h b/migration/ram.h
> > index ded0a3a086..d3c7eb96f5 100644
> > --- a/migration/ram.h
> > +++ b/migration/ram.h
> > @@ -87,4 +87,6 @@ void ram_write_tracking_prepare(void);
> >  int ram_write_tracking_start(void);
> >  void ram_write_tracking_stop(void);
> >
> > +void dirty_sync_missed_zero_copy(void);
> > +
> >  #endif
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 684c014c86..3909b34967 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -624,6 +624,8 @@ int multifd_send_sync_main(QEMUFile *f)
> >              if (ret < 0) {
> >                  error_report_err(err);
> >                  return -1;
> > +            } else if (ret == 1) {
> > +                dirty_sync_missed_zero_copy();
> >              }
> >          }
> >      }
>
> I know that Juan is working on some patch to only do
> multifd_send_sync_main() for each dirty sync, but that's not landed, right?

That's correct, but I am hoping it should land before the release, so
the numbers will match.


>
> Can we name it without "dirty-sync" at all (so it'll work before/after
> Juan's patch will be applied)?  Something like "zero-copy-send-fallbacks"?

It initially was something like that, but on the v2 thread there was
some discussion on
the topic, and it was suggested the number would not mean much to the
user, unless
it was connected to something else.

Markus suggested the connection to @dirty-sync-count right in the
name, and Daniel suggested the above name, which sounds fine to me.

>
> The other thing is the subject may need to be touched up as right now with
> the field we don't warn the user anymore on zero-copy-send fallbacks.

Ok, Warning sounds misleading here.
What do you think about 'report' instead?

Best regards,
Leo

>
> Thanks,
>
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 01f9cc1d72..db948c4787 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -407,6 +407,11 @@ static void ram_transferred_add(uint64_t bytes)
> >      ram_counters.transferred += bytes;
> >  }
> >
> > +void dirty_sync_missed_zero_copy(void)
> > +{
> > +    ram_counters.dirty_sync_missed_zero_copy++;
> > +}
> > +
> >  /* used by the search for pages to send */
> >  struct PageSearchStatus {
> >      /* Current block being searched */
> > --
> > 2.36.1
> >
>
> --
> Peter Xu
>


