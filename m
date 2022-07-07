Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2789C56AC75
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 22:08:06 +0200 (CEST)
Received: from localhost ([::1]:37774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9XnA-0003nU-ES
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 16:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Xm9-0002wd-9q
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 16:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Xls-0004Ku-QC
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 16:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657224404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QSLCeaQoTBC6w91neaNH/MNX6SZbgq7NxVzN3WHGp0=;
 b=iShqh0PeZIN5hnBq5Dy1XLFl/m9+yahUuK13uxxN0IiHP0pn8RXPo9rI/TKONDYUMpBHW/
 2w7iCUSHUKpOFcOi3jSSECOoaKo5jt6RAbYdQLygTbIeI9qIBmNBKdvL1/K/z8cG6HkOGp
 sO1eAZDp01/0Uq3FfJtBR3gKT5v53wI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-sv2gb3KFP4uP1wXTXJ83Eg-1; Thu, 07 Jul 2022 16:06:43 -0400
X-MC-Unique: sv2gb3KFP4uP1wXTXJ83Eg-1
Received: by mail-qk1-f197.google.com with SMTP id
 f10-20020a05620a408a00b006b267fdf71fso16851341qko.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 13:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+QSLCeaQoTBC6w91neaNH/MNX6SZbgq7NxVzN3WHGp0=;
 b=oESeHGkF6fFa+IId56C3BK+6ckWF/nUs1wB6Bwh+ryriSEKeAsiqsnFun9KDpQWBzg
 HLscRygxKIh4fg8NaYkJ4HTYC8x5VUdPASJpEOVSQKYumleQTR4WEKOYY8dTgwUUrMfk
 hUA3XEgNbRby5qGXnoxO2rA0Qc6ZOpB+NwfA8W6JrWPWj5fLsp4bmuNktM9OPuaUs/2X
 GRQ7O7OwI8Owj2EAFxZXy8Kq1O3QuSn19RcZaBeEN/rRCsX/ffCC3ZRoH/pYyX4+mNHL
 NrrfzMddUjnjk+UVWTwipLceMsYj/5Qh+dATqAcb0Fz3fN7cxR5rK/ZmDcr2CuFTuz8K
 Eu8g==
X-Gm-Message-State: AJIora9j8mFY2HbvCHJ+jix2mIECAW7srjIA6RamDOXjLdDLPcoHOJnx
 U+s+DqJv3ha2qMHi0DAHhA57lsb93LgBysjLyGCMt3SbnxTPy4snuVbXbQtHbonfy9Gei4Ja5xa
 FPqfRd0Wjmzvs+64=
X-Received: by 2002:ac8:5912:0:b0:31d:3996:d2fc with SMTP id
 18-20020ac85912000000b0031d3996d2fcmr28086345qty.644.1657224402623; 
 Thu, 07 Jul 2022 13:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u9s9zfntcfaFqkYsauVyAw581zm+VikhdCRSqFSHE2AaxoMPx1tgo9gl08tN58GBQTGDZbXQ==
X-Received: by 2002:ac8:5912:0:b0:31d:3996:d2fc with SMTP id
 18-20020ac85912000000b0031d3996d2fcmr28086323qty.644.1657224402334; 
 Thu, 07 Jul 2022 13:06:42 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 fb10-20020a05622a480a00b00304e2e4bf1esm27222809qtb.88.2022.07.07.13.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 13:06:41 -0700 (PDT)
Date: Thu, 7 Jul 2022 16:06:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 3/3] migration/multifd: Warn user when zerocopy not
 working
Message-ID: <Ysc80LAUttN/7QRZ@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-4-leobras@redhat.com>
 <YsceXwzZGaWBBe5D@xz-m1.local>
 <CAJ6HWG7d_v1Zc9wKZJrGYb7U3JXx08-adyWATDiQ9gjvsjU6ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG7d_v1Zc9wKZJrGYb7U3JXx08-adyWATDiQ9gjvsjU6ow@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 07, 2022 at 04:59:22PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter,
> 
> On Thu, Jul 7, 2022 at 2:56 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Mon, Jul 04, 2022 at 05:23:15PM -0300, Leonardo Bras wrote:
> > > Some errors, like the lack of Scatter-Gather support by the network
> > > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> > > zero-copy, which causes it to fall back to the default copying mechanism.
> > >
> > > After each full dirty-bitmap scan there should be a zero-copy flush
> > > happening, which checks for errors each of the previous calls to
> > > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> > > increment dirty_sync_missed_zero_copy migration stat to let the user know
> > > about it.
> > >
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >  migration/ram.h     | 2 ++
> > >  migration/multifd.c | 2 ++
> > >  migration/ram.c     | 5 +++++
> > >  3 files changed, 9 insertions(+)
> > >
> > > diff --git a/migration/ram.h b/migration/ram.h
> > > index ded0a3a086..d3c7eb96f5 100644
> > > --- a/migration/ram.h
> > > +++ b/migration/ram.h
> > > @@ -87,4 +87,6 @@ void ram_write_tracking_prepare(void);
> > >  int ram_write_tracking_start(void);
> > >  void ram_write_tracking_stop(void);
> > >
> > > +void dirty_sync_missed_zero_copy(void);
> > > +
> > >  #endif
> > > diff --git a/migration/multifd.c b/migration/multifd.c
> > > index 684c014c86..3909b34967 100644
> > > --- a/migration/multifd.c
> > > +++ b/migration/multifd.c
> > > @@ -624,6 +624,8 @@ int multifd_send_sync_main(QEMUFile *f)
> > >              if (ret < 0) {
> > >                  error_report_err(err);
> > >                  return -1;
> > > +            } else if (ret == 1) {
> > > +                dirty_sync_missed_zero_copy();
> > >              }
> > >          }
> > >      }
> >
> > I know that Juan is working on some patch to only do
> > multifd_send_sync_main() for each dirty sync, but that's not landed, right?
> 
> That's correct, but I am hoping it should land before the release, so
> the numbers will match.
> 
> 
> >
> > Can we name it without "dirty-sync" at all (so it'll work before/after
> > Juan's patch will be applied)?  Something like "zero-copy-send-fallbacks"?
> 
> It initially was something like that, but on the v2 thread there was
> some discussion on
> the topic, and it was suggested the number would not mean much to the
> user, unless
> it was connected to something else.
> 
> Markus suggested the connection to @dirty-sync-count right in the
> name, and Daniel suggested the above name, which sounds fine to me.

Ah okay.

But then I suggest we make sure it lands only after Juan's.. or it won't
really match.  Also when Juan's patch ready, we'd also double check it will
be exactly called once per iteration, or we can get confusing numbers.  I
assume Juan will take care of that then.

> 
> >
> > The other thing is the subject may need to be touched up as right now with
> > the field we don't warn the user anymore on zero-copy-send fallbacks.
> 
> Ok, Warning sounds misleading here.
> What do you think about 'report' instead?

Looks good.  Thanks,

-- 
Peter Xu


