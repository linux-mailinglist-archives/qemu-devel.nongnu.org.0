Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700B560CDE5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:50:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onKIB-0001qf-Cj; Tue, 25 Oct 2022 09:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onKHx-0001IF-NO
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onKHh-0006PJ-2U
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666705679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4vyYxf213RiCM/ajUUHOXLyErcDpMBpoRVa/LMXbwU=;
 b=J0X1rYZZaaGvN3WROlLMWTN4yrd3K6iyJYduhha19J4xM4HegovZPSDNk/JXKf8JdcLxsK
 Hkl2Lo9IsAtHR3TX+yLKEOr7iYnzNN2hjtPH4OUmiYoKsJePhAXaZfEdo1cgXs73kUyzPR
 tVhkobfeQgwzwaxzY2O7wDvnKsaxETg=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-BuecdMVQNQ2Ks9VyN4PYzw-1; Tue, 25 Oct 2022 09:47:57 -0400
X-MC-Unique: BuecdMVQNQ2Ks9VyN4PYzw-1
Received: by mail-ot1-f72.google.com with SMTP id
 v12-20020a056830140c00b00661e2e22665so7082958otp.21
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q4vyYxf213RiCM/ajUUHOXLyErcDpMBpoRVa/LMXbwU=;
 b=YO6WlRIAOBOF/Tyjp4FukJdtoft+onAYiJU+1/jkjUKJNPAIMKC7yIH/kIbE9VmTTb
 A5Nn/FAHJb650QM8y7tYVxXsyCmYHNLwsHXhAlzxbyP0hnMZh0NYmnoKvgFbuyLlCY/f
 z2KEfzurQE85kEf1N5H16BiKzZGp6cKIUR6Q2dpBAb90d5Cg08GyM1zFks7MMarB9sj0
 P6bbl3FePa1twUKrFjSx01xllwj/DcHNgfgh86yS5R3fDgo2cw9twquOeXRvtFkeP7t6
 1HEABgW++WjnfY56MsQNOpdGrmJF8ORsBTmaUxtPh/GX7sonA21asbV7D155C7ZfbSs5
 hl5g==
X-Gm-Message-State: ACrzQf0TdKIKSGv0+w9VxgVku5wcxZ+IBzotDHLTFxSAUlJLjAJ54vW3
 XnqX3bLeA/wYi6DNP6nneUsOnfjW/9RKp56zEtQiGtidykspfeYt2YitcPVqECbPra+sJz28EBr
 +EsB1SFdslH9AD8c=
X-Received: by 2002:a05:6870:6025:b0:137:5344:7082 with SMTP id
 t37-20020a056870602500b0013753447082mr22711815oaa.279.1666705675238; 
 Tue, 25 Oct 2022 06:47:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XYho/lSuiwTvXIi0XyfBznltmJdLsNNW5UguJ3P3tgkpCgabECkbsFmV5c3SvuCuM9Heppw==
X-Received: by 2002:a05:6870:6025:b0:137:5344:7082 with SMTP id
 t37-20020a056870602500b0013753447082mr22711795oaa.279.1666705674933; 
 Tue, 25 Oct 2022 06:47:54 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a801:de5e:6447:4a67:eb7c:b690?
 ([2804:1b3:a801:de5e:6447:4a67:eb7c:b690])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a056870d0c600b0012796e8033dsm1510496oaa.57.2022.10.25.06.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 06:47:53 -0700 (PDT)
Message-ID: <84efbd3a03ab7effd691336a58b6ac97b935d3c3.camel@redhat.com>
Subject: Re: [RFC PATCH 4/4] migration/multifd/zero-copy: Flush only the LRU
 half of the header array
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: quintela@redhat.com, Daniel =?ISO-8859-1?Q?P=2EBerrang=E9?=
 <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu
 <peterx@redhat.com>,  qemu-devel@nongnu.org
Date: Tue, 25 Oct 2022 10:47:51 -0300
In-Reply-To: <875yg8dxmu.fsf@secure.mitica>
References: <20221025044730.319941-1-leobras@redhat.com>
 <20221025044730.319941-5-leobras@redhat.com> <Y1ef6/8gxsCiNjiO@redhat.com>
 <875yg8dxmu.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2022-10-25 at 12:07 +0200, Juan Quintela wrote:
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > On Tue, Oct 25, 2022 at 01:47:31AM -0300, Leonardo Bras wrote:
> > > Zero-copy multifd migration sends both the header and the memory page=
s in a
> > > single syscall. Since it's necessary to flush before reusing the head=
er, a
> > > header array was implemented, so each write call uses a different
> > > array, and flushing only take place after all headers have been used,
> > > meaning 1 flush for each N writes.
> > >=20
> > > This method has a bottleneck, though: After the last write, a flush w=
ill
> > > have to wait for all writes to finish, which will be a lot, meaning t=
he
> > > recvmsg() syscall called in qio_channel_socket_flush() will be called=
 a
> > > lot. On top of that, it will create a time period when the I/O queue =
is
> > > empty and nothing is getting send: between the flush and the next wri=
te.
> > >=20
> > > To avoid that, use qio_channel_flush()'s new max_pending parameter to=
 wait
> > > until at most half of the array is still in use. (i.e. the LRU half o=
f the
> > > array can be reused)
> > >=20
> > > Flushing for the LRU half of the array is much faster, since it does =
not
> > > have to wait for the most recent writes to finish, making up for havi=
ng
> > > to flush twice per array.
> > >=20
> > > As a main benefit, this approach keeps the I/O queue from being empty=
 while
> > > there are still data to be sent, making it easier to keep the I/O max=
imum
> > > throughput while consuming less cpu time.
> >=20
> > Doesn't this defeat the reason for adding the flush in the first
> > place, which was to ensure that a migration iteration was fully
> > sent before starting the next iteration over RAM ? If it is OK to
> > only partially flush on each iteration, then why do we need to
> > flush at all ?
>=20
> Now we need to do the flush in two places:
> - on sync_main (the old place)
> - on the migration thread, when we run out of array entries.
>   This one has nothing to do with correctness, it is just that we have
>   more space than needed.

That's correct! In fact, sync_main (the old place) will call flush with
max_remaining =3D 0, meaning it will only return when there is nothing else
pending.

>=20
> So, in this regard, I think that the patches are correct.
>=20
> But on the other hand, I am not sure that I like the size of the array.
> Leonardo is using 1024 entries for each migration channel.  That means
> that it allows it to have 1024 entries * 512 KB each packet is 512MB of
> unflushed data in each channel.  I think that this is still too much.

The size is correct, meaning we need to allow 512MB of locked memory per mu=
ltifd
channel.

>=20
> I will need some data from testing, but my understanding on how Zero
> Copy work is that having around 10MB in each channel would be more than
> enough to saturate the link.  And once that the data inflight is
> smaller, we can just flush it when we get out of channels.
>=20
> My idea here was to work the size the other way around, add a parameter
> to the user about how much memory is he available for mlocking, and
> just do a memory/channels array entries on each channel.  That will:
>=20
> a - limit the amount of mlocked memory that we need
>     10MB/channel for 10 channels is 100MB of mlocked memory, for a guest
>     that has lots of Gigabytes of RAM looks reasonable.
>=20
> b - We don't synchronize after each write, because I still claim than
>     doing a non asynchronous write on the channel just syncs everything
>     (otherwise I can't see how the hardware can even work).

So the user sets the locked memory available and we split it between the nu=
mber
of channels during migration. Seems a good strategy, since it will explore =
the
hardware well regardless of the channel count.=20

>=20
> So I guess that the best thing to decide this is:
> - get a couple of nice 100Gigabit networking cards
> - Enable 16 channels or so, so we know that the CPU is not going to be
>   the bottleneck
> - test with this patch
> - remove last two patches and test with several array sizes
>   (10, 20, 30,..) and we will see that after some size, performance will
>   not improve at all.
> - Got that value as default one.
>=20
> What do you think?

Most of it is good. I only disagree on removing the two last patches.

I did some tests with smaller array sizes, and without the last two patches=
 it
would totally destroy performance. I blame the fact that once each N writes=
 it
will have to wait the queue to be completely empty, and then add more data =
for
sending.=C2=A0

Also, waiting for the completion of a send that was just scheduled takes
multiple recvmsg syscalls, raising cpu usage.

Other than that, seems a good strategy.

Thank you both for reviewing!

Best regards,
Leo

>=20
> Later, Juan.
>=20
> PD.  Yes, I don't like to add another parameter, so you can recompile
>      with different values, or we will not add the parameter once that
>      we find a right value.
>=20


