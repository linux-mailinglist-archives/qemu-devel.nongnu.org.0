Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33055BC01
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 22:35:23 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5vS5-0008KV-Of
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 16:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o5vP1-0007Nx-FS
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 16:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o5vOx-0005uF-5s
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 16:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656361925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Fk6cgoFqEkXBzuCnRvq1CYoM/ia+S6d7r37vmIjq8s=;
 b=NTde/9NbAH9miOyKsqepqT8hd4UQgozpEExzEKTe93pTh9+NvSJ5Cw10xRR/qlrvQCmPd+
 Duqot6le+lL5NOJ6uimvUrNUz7BRweJE6HXaPwdy/OFTvA3K7kGnesV4cgQVcB9YwBeVyy
 +rLA9uLyoPDkeOVrdC5we4xnGPsEdT4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-fT5vJ-bYOgOGQ9KnBBp1pg-1; Mon, 27 Jun 2022 16:32:04 -0400
X-MC-Unique: fT5vJ-bYOgOGQ9KnBBp1pg-1
Received: by mail-il1-f199.google.com with SMTP id
 x5-20020a923005000000b002d1a91c4d13so6247106ile.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 13:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+Fk6cgoFqEkXBzuCnRvq1CYoM/ia+S6d7r37vmIjq8s=;
 b=kwywzIAFo07Ap2hafVM9C3Qdq2JR8ETDGpngpglntk+YpdPTDWV2j/mvPEekgqifhK
 SMqK5A01Ri+NeGdxo+G3eZnBWhaqD5U60FgLkYxSki09xNVUZRPXSlX0Vr5i3uXrwiLJ
 pdMNmYzirj9jHuGE/9nDsOLxyIOP287UCNtHnTvXkxDMpWQxYuso37X5ZwF4FUgp+RxC
 q7+7XXT68oyOkUQqdM98r97jXVg/e9zlQNmoXwbYyQ9cpwFMNtag3zqa00hipU4qwNcS
 gVvgLKH04IKT8G64JP+cXtvf6cajhjtAqXGJK5KUmqh2H8fYZPapSvFI2k6GGRlwSTiz
 kVZw==
X-Gm-Message-State: AJIora+eXNudkiP1LaULmQsKHIA934xgtcIq3b8AyCXa0fY8PkvkhBQQ
 rqEee9SS0bd0j9tFF4drVr/54x7zl+dTrx1jpXGYTHK0qNDKGe7/TTKpqxXpLvX2mOmlEUhoCt8
 ojbaS9yHrB/JXQ+w=
X-Received: by 2002:a05:6602:2d13:b0:669:cae1:8bab with SMTP id
 c19-20020a0566022d1300b00669cae18babmr7762247iow.70.1656361923478; 
 Mon, 27 Jun 2022 13:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uwP+xTf2QN7W98EWCaYGK8kNIq9eGV7w2Mv+TiO8p1Q6ME/hzeAj02BuNl/6aTGfh0uYQhCg==
X-Received: by 2002:a05:6602:2d13:b0:669:cae1:8bab with SMTP id
 c19-20020a0566022d1300b00669cae18babmr7762236iow.70.1656361923257; 
 Mon, 27 Jun 2022 13:32:03 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056e020c6100b002d95d67fbc5sm5075539ilj.2.2022.06.27.13.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 13:32:02 -0700 (PDT)
Date: Mon, 27 Jun 2022 16:32:00 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YroTwDmAzE7uImvu@xz-m1.local>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local> <YrnGrXpwBdmt69Fp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrnGrXpwBdmt69Fp@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jun 27, 2022 at 04:03:09PM +0100, Daniel P. Berrangé wrote:
> On Wed, Jun 22, 2022 at 03:34:52PM -0400, Peter Xu wrote:
> > On Wed, Jun 22, 2022 at 07:39:06PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > > index 74f919de67..e206b05550 100644
> > > --- a/migration/qemu-file.c
> > > +++ b/migration/qemu-file.c
> > > @@ -377,8 +377,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
> > >          return 0;
> > >      }
> > >  
> > > -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> > > -                             IO_BUF_SIZE - pending, &local_error);
> > > +    do {
> > > +        len = qio_channel_read(f->ioc,
> > > +                               (char *)f->buf + pending,
> > > +                               IO_BUF_SIZE - pending,
> > > +                               &local_error);
> > > +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> > > +            if (qemu_in_coroutine()) {
> > > +                qio_channel_yield(f->ioc, G_IO_IN);
> > > +            } else {
> > > +                qio_channel_wait(f->ioc, G_IO_IN);
> > > +            }
> > > +        } else if (len < 0) {
> > > +            len = EIO;
> > 
> > This should be -EIO.
> > 
> > > +        }
> > > +    } while (len == QIO_CHANNEL_ERR_BLOCK);
> > 
> > It's failing only with the new TLS test I added for postcopy somehow (at
> > least /x86_64/migration/postcopy/recovery/tls).. I also verified after the
> > change it'll work again.
> 
> Assuming you can still reproduce the pre-existing flaw, can you capture
> a stack trace when it hangs.   I'm wondering if it is a sign that the
> migration is not converging when using TLS under certain load conditions,
> because the test waits forever for converge.

Yes it is, and it reproduces here every time.  It hangs at:

 if (!got_stop) {
     qtest_qmp_eventwait(from, "STOP");
 }

> 
> Also what scenario are you running in ? Bare metal or a VM, and what
> host arch ? Wondering if the machine is at all slow, or for example
> missing AES hardware acceleration or some such thing.

It's Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz, 40 cores.

It'll pass after I modify the downtime:

  migrate_set_parameter_int(from, "downtime-limit", 100000);

And with QTEST_LOG=1 I found that the bw is indeed low, ~700mbps.

-- 
Peter Xu


