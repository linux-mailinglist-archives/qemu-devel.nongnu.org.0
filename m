Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A2444A5E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:41:59 +0100 (CET)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miO18-0007pJ-90
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1miNov-0004BE-E3
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1miNot-0000sa-Ei
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635974958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iVMKa7DJs2327nAFpK2ZaBi/36WAegpPoCcfzbQtCY8=;
 b=VbAo5XByomifIBGZ9Au0Gw0A9XlwVt93Fu+VB8m7ndRv3sBxemhGAVTv6w3odWE4JuXVxG
 s/W68mcK29V0us3fm5ilmB6Xzi8Y63qXSC5bYYQnJ9Vh997dyVIbf0FTWaq77t2s4EgepZ
 1BvWvMzBwo53anUCXXiBkE5sI2GJUxk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-HabxwWw6OwukRNwYH4s-5w-1; Wed, 03 Nov 2021 17:29:17 -0400
X-MC-Unique: HabxwWw6OwukRNwYH4s-5w-1
Received: by mail-lf1-f69.google.com with SMTP id
 t8-20020a056512030800b004017cf4c16dso819996lfp.14
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 14:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVMKa7DJs2327nAFpK2ZaBi/36WAegpPoCcfzbQtCY8=;
 b=A51fqx1/DbU+z5WghHthvyPDrjxw0KNVbnilACCrN5CdDj3WP51EXmUACrgn8YSxrD
 cMJ2VLYMhxLyumfaNFBlqH7dG3uJdQ5QIlrvirGYMErs3yeZ48AD9d4BLbFoBFvofGT1
 Cg//J44vxwlc8mK8DVq7N/tWsT/Zf+wyynsY9HUdCVohNrLKQJ90Q1DMtFfUBXlOfz0+
 faNRJMdZcTEWCk0iIDUAaKzeD+MiWrUDvQI+9IqT60M+xrUflEKxRJpYZD+Z8mtjQblr
 N188/Side2f7VbX9GP0fIa0mdTY1mIgyAtu/QVTA5nlCNU0f5mESpplxdyqLzUgaus7V
 XfWQ==
X-Gm-Message-State: AOAM5333k8+SnzaSyiq3XgYU5pvvbn29LnEOgHFK2zYrfsvfxFhw0nQx
 LrY7/Ax21Xl3M095ictY3PU6OiXoxUHezz+RKLMEEQJon33zhnNwcr79Gv7hOMj6W7BsSkgn81j
 CB8oKtDf3HQaVHDL8bMh/Z8GLhBHxQ50=
X-Received: by 2002:a2e:a554:: with SMTP id e20mr36261612ljn.116.1635974956119; 
 Wed, 03 Nov 2021 14:29:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi+jzMgj5/2QlQiNBELoMfNcazHltDMhJUPL5GwG6qmhl+QjUGgH7pXSw51fwzSFU0Geap54OJO48zdYRIzYQ=
X-Received: by 2002:a2e:a554:: with SMTP id e20mr36261575ljn.116.1635974955827; 
 Wed, 03 Nov 2021 14:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <87sfwekabf.fsf@secure.mitica>
In-Reply-To: <87sfwekabf.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 3 Nov 2021 18:29:25 -0300
Message-ID: <CAJ6HWG7erHjN7ZNi=oRC=e-boWexbCJ7bBpgKs9x1D-igVSAqw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Juan,

On Tue, Nov 2, 2021 at 9:32 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras <leobras@redhat.com> wrote:
> > Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> > zerocopy interface.
> >
> > Change multifd_send_sync_main() so it can distinguish the last sync from
> > the setup and per-iteration ones, so a flush_zerocopy() can be called
> > at the last sync in order to make sure all RAM is sent before finishing
> > the migration.
>
> You need to do this after each iteration.  Otherwise it can happen that:
>
> channel 1:               channel 2:
>
>    send page 11
>
> next iteration
>                          send page 11
>
>                          this page arrives
>
> now arrives this old copy.

Current multifd's sendmsg() will block until all data is sent, is that correct?

If that's the case, and supposing the network driver supports
multiqueue, maybe there is a small chance for this to happen.
I will add the flush at the end of each iteration, just to be sure.

>
> After each iteration, one needs to be sure that no ram is inflight.
>
> This means that I think you don't need the last_sync parameter at all,
> as you have to do the flush() in every iteration.
>
> > Also make it return -1 if flush_zerocopy() fails, in order to cancel
> > the migration process, and avoid resuming the guest in the target host
> > without receiving all current RAM.> >
> > This will work fine on RAM migration because the RAM pages are not usually freed,
> > and there is no problem on changing the pages content between async_send() and
> > the actual sending of the buffer, because this change will dirty the page and
> > cause it to be re-sent on a next iteration anyway.
> >
> > Given a lot of locked memory may be needed in order to use multid migration
> > with zerocopy enabled, make it optional by creating a new parameter
> > multifd-zerocopy on qapi, so low-privileged users can still perform multifd
> > migrations.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> I think it is better that you split this patch into two:
>
> - Add the new parameter (it looks good to me, and can be reviewed-by)
> - Implement the feature, here probably you need more changes/review

Sure, I will try to divide the patch like this.

>
>
> >              '*multifd-zlib-level': 'uint8',
> >              '*multifd-zstd-level': 'uint8',
> > +         '*multifd-zerocopy': 'bool',
> >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>
> Something weird here.
>
> >              '*multifd-compression': 'MultiFDCompression',
> >              '*multifd-zlib-level': 'uint8',
> >              '*multifd-zstd-level': 'uint8',
> > +         '*multifd-zerocopy': 'bool',
> >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> >
>
> Same here.

Could you please elaborate?

>
>
> > @@ -105,7 +105,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
> >   */
> >  static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
> >  {
> > -    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
> > +    int flags = 0;
> > +
> > +    if (migrate_multifd_zerocopy()) {
> > +        flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> > +    }
>
> You have added an if on each write, just add it during initialization.



>
> There is already a uint32_t flags field in MultiFDRecvParams, but you
> can add a
>
> int write_flags;
>
> one and add it during initialization.  That way you don't need any check
> here, just pass it.
>
> > +    return qio_channel_writev_all_flags(p->c, p->pages->iov, used, flags, errp);

Ok, I will try to make it work with this suggestion.

>
>
> > -void multifd_send_sync_main(QEMUFile *f)
> > +int multifd_send_sync_main(QEMUFile *f, bool last_sync)
>
> As you need to check every round, you now have to check for errors on
> every multifd_send_sync_main() call.  It really looked weird that you
> only need to check it sometimes.

Ok, I will work on that.

>
> > @@ -3006,13 +3006,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
> >          ram_control_after_iterate(f, RAM_CONTROL_FINISH);
> >      }
> >
> > -    if (ret >= 0) {
> > -        multifd_send_sync_main(rs->f);
> > -        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
> > -        qemu_fflush(f);
> > +    if (ret < 0) {
> > +        return ret;
> >      }
> >
> > -    return ret;
> > +    ret = multifd_send_sync_main(rs->f, true);
> > +    if (ret < 0) {
> > +        return -1;
>
> Why are you returning -1 instead of ret?
>
> Callers of ram_save_complete(). We set qemu_error_file() with that
> error, so it is not a good idea to reset it.
>
>

Ok, I will take a look on that.

> Later, Juan.
>

Thanks,
Leo


