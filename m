Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75855529B9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 05:27:32 +0200 (CEST)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3UY7-0005ep-8s
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 23:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3UWx-0004yg-UJ
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 23:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3UWt-0001Ua-AM
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 23:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655781974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9S5FJ/dfzGEeaP4TO/s5YekO0wfMHWGV5FwyOccUVcQ=;
 b=WwOdfFjkhbZlsDOm3ukMgV/e/ywfa0BLvu002cLjJ5RqHjnO0FDGG4tLX5MGNnEwK0zvt5
 lXF/2tVywc4w3lvAtnR3wBkOQv1Dn73iYJRSQ/waqjmm8DiZCRn+D3Ge5IuQZBuDF9tOqZ
 L0KHwo1gjAe3/ya05jjosdPLaF6bK9o=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-IwPggtzvNaem7_zXCJUdVg-1; Mon, 20 Jun 2022 23:26:12 -0400
X-MC-Unique: IwPggtzvNaem7_zXCJUdVg-1
Received: by mail-ot1-f69.google.com with SMTP id
 q3-20020a9d7c83000000b0060bf1abd2b0so6661086otn.23
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 20:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=9S5FJ/dfzGEeaP4TO/s5YekO0wfMHWGV5FwyOccUVcQ=;
 b=lHO23T9V6m1WPxpBEjk88CzVpyV21D6Z8QnzcyuSBGYL7TjO4FDT/0xcJNotwulDGJ
 10oUpF2PM/fmixsi+xG3NZE9M/XyvJ27I0EfLevt9smFXHAgZCvA5XXdlLqDfD2l7tOg
 1iC9XtYTlNHEKG5LNiVcImRHoO7yEym3sNouAlNAe8s6dMASn4ZmYMn5TxGxrxB5VkSU
 8emsf3rrsaZo9w+kGLJsh4amm86C+5BpHmwpC9DqMRz2yc6lNHGMk4qjoSjpC1/7V/cj
 8EOutN8BzKxRo/OlRyhXZ2sWN8vg+gbLb7DOvjIQoL9p5GSSQRnR+TerFICugiRCs4ON
 Gqtw==
X-Gm-Message-State: AJIora//eEVpiy+/HMxWLk/SF4wx9NRSTP3M+Z7nJ1QShOmjddOGlIXT
 2u+CZare63rfHaXsQwyV+RdPrsd9W1ADw1pRF/mAIJY3qYhw0sGEZlXHW/TCJzxjqDDqSJ4zhw8
 Qwukh3aPU96B+RNs=
X-Received: by 2002:a05:6870:f146:b0:101:f885:5a4b with SMTP id
 l6-20020a056870f14600b00101f8855a4bmr4091566oac.210.1655781971698; 
 Mon, 20 Jun 2022 20:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sA/J6H8Gku+UATksUuK9KhsPo85eGicDAm4X4Uk6kG26wY73pTziP0fGikiJekTFlzCN7dMw==
X-Received: by 2002:a05:6870:f146:b0:101:f885:5a4b with SMTP id
 l6-20020a056870f14600b00101f8855a4bmr4091552oac.210.1655781971285; 
 Mon, 20 Jun 2022 20:26:11 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f0:d933:8f52:267a:639c:b4c0?
 ([2804:431:c7f0:d933:8f52:267a:639c:b4c0])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056870e50300b000f1bc45ba21sm8346533oag.14.2022.06.20.20.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 20:26:10 -0700 (PDT)
Message-ID: <4df300ef7c26829032078632463350b2e7e3df55.camel@redhat.com>
Subject: Re: [PATCH v4 3/4] migration: zero-copy flush only at the end of
 bitmap scanning
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: quintela@redhat.com
Cc: Daniel =?ISO-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>, "Dr.
 David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?=E5=BE=90=E9=97=AF?=
 <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Date: Tue, 21 Jun 2022 00:26:06 -0300
In-Reply-To: <87wndb4riu.fsf@secure.mitica>
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-4-leobras@redhat.com> <87wndb4riu.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

On Mon, 2022-06-20 at 11:23 +0200, Juan Quintela wrote:
> Leonardo Bras <leobras@redhat.com> wrote:
> > When sending memory pages with MSG_ZEROCOPY, it's necessary to flush
> > to make sure all dirty pages are sent before a future version of them
> > happens to be sent.
> >=20
> > Currently, the flush happens every time at the end of ram_save_iterate(=
),
> > which usually happens around 20x per second, due to a timeout.
> >=20
> > Change so it flushes only after a whole scanning of the dirty bimap,
> > so it never sends a newer version of a page before an older one, while
> > avoiding unnecessary overhead.
> >=20
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>=20
> I agree that previous one is too many flushes, but this one changes to to=
o
> much memory to be uncommitted, and that is important because otherwise we
> have unlimited amount of dirty memory.

I don't quite understand what you meant here.
What does it mean to be uncommitted at this context?
I don't see how we get unlimited amounts of dirty memory here.=20

Zero-copy is not supposed to copy memory pages, so let's say all pages are =
dirty
and enqueued to send, but our network interface is stalling the send:
All memory we should have allocated is VM ram pagecount x sizeof(iov), beca=
use
then we flush.

Unless... are you referring to locked memory (as dirty enqueued memory -> l=
ocked
memory)?=C2=A0
That would be a point: If we enqueue more memory than the locked memory amo=
unt
our user support, the migration will fail.=C2=A0

But that would mean a very fast CPU (lots of sendmsgs) and a very slow netw=
ork
interface.=20

>=20
> > +/*
> > + * Set zero_copy_flush =3D true for every multifd channel
> > + *
> > + * When using zero-copy, it's necessary to flush the pages before any =
of
> > + * the pages can be sent again, so we'll make sure the new version of =
the
> > + * pages will always arrive _later_ than the old pages.
> > + *
> > + * Should be called only after we finished one whole scanning of
> > + * all the dirty bitmaps.
> > + */
> > +int multifd_zero_copy_flush(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int i;
> > +=C2=A0=C2=A0=C2=A0 Error *local_err =3D NULL;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!migrate_use_multifd()) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < migrate_multifd_channels(); i++) =
{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MultiFDSendParams *p =3D &m=
ultifd_send_state->params[i];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D qio_channel_flush(p=
->c, &local_err);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err=
or_report_err(local_err);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
>=20
>=20
> Here you flush every channel, Only at the end of a range you want to do t=
his.

Yes, the idea is to flush after a full scan of the dirty-bitmap.

>=20
>=20
> > =C2=A0int multifd_send_sync_main(QEMUFile *f)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 int i;
> > -=C2=A0=C2=A0=C2=A0 bool flush_zero_copy;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (!migrate_use_multifd()) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > @@ -581,19 +613,6 @@ int multifd_send_sync_main(QEMUFile *f)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 /*
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * When using zero-copy, it's necessary to flu=
sh the pages before any
> > of
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * the pages can be sent again, so we'll make =
sure the new version of
> > the
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * pages will always arrive _later_ than the o=
ld pages.
> > -=C2=A0=C2=A0=C2=A0=C2=A0 *
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * Currently we achieve this by flushing the z=
ero-page requested writes
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * per ram iteration, but in the future we cou=
ld potentially optimize
> > it
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * to be less frequent, e.g. only after we fin=
ished one whole scanning
> > of
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * all the dirty bitmaps.
> > -=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -
> > -=C2=A0=C2=A0=C2=A0 flush_zero_copy =3D migrate_use_zero_copy_send();
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < migrate_multifd_channels(); =
i++) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MultiFDSendParams *p =
=3D &multifd_send_state->params[i];
> > =C2=A0
> > @@ -615,17 +634,6 @@ int multifd_send_sync_main(QEMUFile *f)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_counters.transferr=
ed +=3D p->packet_len;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_mutex_unlock(&p->=
mutex);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_sem_post(&p->sem)=
;
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flush_zero_copy && p->c=
) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
 ret;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Err=
or *err =3D NULL;
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D qio_channel_flush(p->c, &err);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(ret < 0) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 error_report_err(err);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -1;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> This synchronization already happens once every iteration through all
> ram.
>=20
> </me checks how>
>=20
> And low and behold, it doesn't.
>=20
> The problem here is that we are calling multifd_send_sync_main() in the
> wrong place, i.e. we are being too conservative.
>=20
> We need to call multifd_send_sync_main() just before doing
> migration_bitmap_sync().=C2=A0 The reason that we need to call that funct=
ion
> is exactly the same that we need to flush for zero_copy.
>=20
> So, what we need to change is remove the call to
> multifd_send_sync_main(), not how it handles zero_copy.

So, IIUC, multifd have been syncing in a conservative way (i.e. more than
actually needed), and we need to do the same improvement (sync less) for mu=
ltifd
too, instead of just changing it for zero-copy. Is that correct?

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < migrate_multifd_channels(); =
i++) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MultiFDSendParams *p =
=3D &multifd_send_state->params[i];
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 5f5e37f64d..514584e44f 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -2288,6 +2288,13 @@ static int ram_find_and_save_block(RAMState *rs)
> > =C2=A0=C2=A0=C2=A0=C2=A0 rs->last_seen_block =3D pss.block;
> > =C2=A0=C2=A0=C2=A0=C2=A0 rs->last_page =3D pss.page;
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 if (pss.complete_round && migrate_use_zero_copy_sen=
d()) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D multifd_zero_co=
py_flush();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
>=20
> This place is not right either, because we can have a sync in the middle
> for other reasons.

What do you mean by "in the middle" here?=20
Does it mean we should not have multifd code in this function?

>=20
> We call migration_bitmap_sync() in save_live_pending(), and that is not
> when we finish the complete_round.

Agree.=20
We could add/set a flag in multifd, say in the above area, and then sync/fl=
ush
in the correct place (in the future).

But at my experience debugging my code, I found that the loop at
ram_save_iterate() will not stop/break at "bitmap scan end", so we may end =
up
sending the same page twice before a flush, which is what we want to avoid.

>=20
> Once discussed this, what I asked in the past is that you are having too
> much dirty memory on zero_copy.=C2=A0 When you have a Multiterabyte guest=
, in
> a single round you have a "potentially" dirty memory on each channel of:
>=20
> =C2=A0=C2=A0 total_amount_memory / number of channels.

If dirty memory -> locked memory, yes, max_locked_memory =3D=3D guest_ram.

>=20
> In a Multiterabyte guest, this is going to be more that probably in the
> dozens of gigabytes.=C2=A0 As far as I know there is no card/driver that =
will
> benefit for so many pages in zero_copy, and kernel will move to
> synchronous copy at some point.=C2=A0 (In older threads, daniel showed ho=
w to
> test for this case).

The idea of MSG_ZEROCOPY is to avoid copying the pages content over to the
kernel space. I don't recall any reason a network card would drop to copyin=
g
instead of keep using zero-copy, unless it does not support it (scatter-gat=
her
not supported, for example), but in this case it would never use zero-copy =
from
the start.=20

IIRC, as long as we have enough locked memory, there should be no problem f=
or
the driver to keep using zero-copy send.

Well, unless you mean the gain of using zero-copy should be irrelevant comp=
ared
to the cost of locked memory in some scenarios, say very powerful CPU with =
slow
network interface, where using zero-copy should not interfere with migratio=
n
speed. But that is not a scenario for zero-copy anyway

>=20
> What I proposed is that you check in the migration_send_thread() how
> much memory you have written since last synchronization.=C2=A0 Once that =
it
> is big enough (I don't know the limits for card, in the docs that you
> showed suggested the size is a few megabytes), you just sync at that
> point and continue.

This would help us keep the locked memory under control? yes.
But it would come with the cost of flushing *much* more often than needed.

I mean, it would only be useful if the network card is completely stalling =
the
send, or if the cpu is scheduling more zero-copy sends than the network car=
d can
process.

The point here is: we don't have to keep track of how much has been sent, b=
ut
instead of how much is enqueued (i.e. locked memory). Maybe there is cheap =
way
to track this value, and we could flush when we detect it's too high.

>=20
> You still need to synchronize all threads at bitmap sync, but as said,
> that is handled by multifd_send_sync_main(), and we should fix that
> instead of changing where zero_copy flushes.

Ok, so we keep the zero-copy-flush inside the multifd_send_sync_main() and
change where it's called in order to match the end of the dirty-bitmap scan=
.
Is that correct?

>=20
> /* Removed not relevant bits of the function */
>=20
> static void *multifd_send_thread(void *opaque)
> {
> =C2=A0=C2=A0=C2=A0 size_t zero_copy_bytes_sent =3D 0;
>=20
> =C2=A0=C2=A0=C2=A0 ...
>=20
> =C2=A0=C2=A0=C2=A0 while (true) {
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_=
multifd_send(p->id, packet_num, p->normal_num, p->zero_num,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->flags, p->next_packet_size);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (us=
e_zero_copy_send) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* Send header first, without zerocopy */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ret =3D qio_channel_write_all(p->c, (void *)p->packet,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->packet_len, &local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (ret !=3D 0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
>=20
> ****** Note aside
>=20
> Did you answered my question here of what happens when you do:
>=20
> write_with_zero_copy(1MB); write_without_zero_copy(4KB);
> write_with_zero_copy(1MB); write_without_zero_copy(4KB);
>=20
> My guess is that write_without_zero_copy(4KB) will just flush the
> socket.=C2=A0 I can't think how it can work without doing that.

To be honest, I did not follow the MSG_ZEROCOPY code to this extent.=20

But it depends. If write_without_zero_copy() has MSG_DONTWAIT we could have
everything being sent in a non-blocking way.

But, of course, taking it into account that in multifd we are using a block=
ing
sendmsg(), I also agree that it is probably flushing the packets previously=
 sent
with MSG_ZEROCOPY (or we could have issues in the receiving part).

But that's an assumption. I still need to dig the code in that aspect to be
sure. I will work on that asap.

> If so, we are not getting what we want.

In fact yes, we are.
We are avoiding copying the buffer, which is what we intend to do, and avoi=
ding
the cost of the 'flush' syscall happening too often.=20

If we think multifd is supposed to have blocking sendmsg(), then we are doi=
ng
exactly that here, with zero-copy for the heavy part, which is ideal IMHO.

We could try adding MSG_DONTWAIT to the sendmsg() in multifd (which would t=
ake
the blocking / synchronous send away), but I have no idea on the impact it =
would
have at multifd inner workings.

>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else=
 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* Send header using the same writev call */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 p->iov[0].iov_len =3D p->packet_len;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 p->iov[0].iov_base =3D p->packet;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =
=3D qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, p->write_flags, &local_=
err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (re=
t !=3D 0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_m=
utex_lock(&p->mutex);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->num=
_packets++;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->tot=
al_normal_pages +=3D p->normal_num;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->tot=
al_zero_pages +=3D p->zero_num;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->pag=
es->num =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->pag=
es->block =3D NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->sen=
t_bytes +=3D p->packet_len;;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->sen=
t_bytes +=3D p->next_packet_size;
>=20
> **** Addition
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zero_c=
opy_bytes_sent +=3D p->packet_len + p->next_packet_size;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->pen=
ding_job--;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_m=
utex_unlock(&p->mutex);
> ***** Addition
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ze=
ro_copy_bytes_sent > Threshold) // 2MB/4MB?=C2=A0 I don't know
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D qio_channel_flush(p->c, =
&local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Handle error somehow
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0 If you want to be a pro=
, just change the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Threshold depending on what t=
he kernel answers.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // If it has to revert to synchr=
onous sent, just
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // decrease the threshold, other=
wise increase it.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p-=
>flags & MULTIFD_FLAG_SYNC) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 qemu_sem_post(&p->sem_sync);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_s=
em_post(&multifd_send_state->channels_ready);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (p->quit) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_m=
utex_unlock(&p->mutex);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_m=
utex_unlock(&p->mutex);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* som=
etimes there are spurious wakeups */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 .............
> }
>=20
> What do you think?

It's a good idea to keep locked memory at bay, but I think flushing after N
bytes sent is too often, and will kill the performance. Even more if we ass=
ume
the non-zerocopy blocking sendmsg() is already flushing for us.=20

>=20
> Later, Juan.
>=20

Thanks Juan!

Best regards,
Leo


