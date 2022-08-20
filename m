Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F2559AC37
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 09:31:07 +0200 (CEST)
Received: from localhost ([::1]:49928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPIwk-0005nX-1p
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 03:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oPItS-0003mw-CR
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 03:27:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oPItQ-0004Zq-DB
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 03:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660980459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kdimuQ86oSzbibAG2gcRrElp7A+gu9dzMRoZHmi+F0=;
 b=hJLGkMS0sxAS+qL0Bv4kvrKOIlVtM331Rz8hkUGDDFliVrrB0xrtbwSJPIRS0Us0zeq5QH
 YH4Hmx+VY3w1ge2YXwzUum2f7FIw4o5IWea3+9efHqil3sLI5N/am3Ee+52kO6vv/fXUaq
 0vv66lkPFwntQzRgSn7k81zARthtoFM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-TbClckNYOIyLXyxwvYDzNA-1; Sat, 20 Aug 2022 03:27:38 -0400
X-MC-Unique: TbClckNYOIyLXyxwvYDzNA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w17-20020a056402269100b0043da2189b71so3838895edd.6
 for <qemu-devel@nongnu.org>; Sat, 20 Aug 2022 00:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=3kdimuQ86oSzbibAG2gcRrElp7A+gu9dzMRoZHmi+F0=;
 b=RyKcqXqYF69p3d1EFB0/imL0YDHUMbP+ndh8hhBq+YtXo7arLREvmF9Q01O1B7IHG5
 HKi/lKc2DY0f6cEWUNnekJWndZlrVYsuJ9e3SmX9CVccdG9kNol2+/mVB6Lc1G2Y8exw
 OAKkEySeEP6lEv2evbFJ2ZXRRoK+he8xOQvwkzGSds/YbTcb3/2CmNRFxB0gsqJM+m5m
 BCR8qiWklyXrmWo7CHAel/9RMmgfDOhJ6awJwcfZ2hvzio01gMnuD9i6lP39dh+DllvO
 3wNwvGvoTje1GtuJRGKQcqGUyonddmIdBTY96gBVh7b06d7opP7RkeQOsr9ook8woajm
 Mg5Q==
X-Gm-Message-State: ACgBeo1trY/XUWxaQWFRdY0G0+msh51/1jPORNhMOI3d7U9aQh7qy8lK
 DFRFCKb2jAS+VUfu591t/ILa+BVPeFQzN/K7p/5TVwEPpRcUmKxEZOM9F8H4r1oKCh96kLKmPlN
 8qE5ioWb4mng/ThINisMtmmMHJgSpdVA=
X-Received: by 2002:a17:907:6d24:b0:731:7720:bb9b with SMTP id
 sa36-20020a1709076d2400b007317720bb9bmr7060830ejc.717.1660980457365; 
 Sat, 20 Aug 2022 00:27:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5s3B/T0pEFiXh3qYWln8/EuLF2wiCzSjaem4G5YNWQYs/p9ODh4NAKOT8cSA/Vz5SaQJxdvQdLTR6yr7V8x9s=
X-Received: by 2002:a17:907:6d24:b0:731:7720:bb9b with SMTP id
 sa36-20020a1709076d2400b007317720bb9bmr7060811ejc.717.1660980457183; Sat, 20
 Aug 2022 00:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-8-quintela@redhat.com>
 <b46a95640229beaabf8bc7af1254f9a95d23fbfb.camel@redhat.com>
 <878rnk1nb8.fsf@secure.mitica>
In-Reply-To: <878rnk1nb8.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Sat, 20 Aug 2022 04:27:26 -0300
Message-ID: <CAJ6HWG540gasXXtEBU3QNKDzMdvH5jjDN-oz3CpFUBfN1qJX4g@mail.gmail.com>
Subject: Re: [PATCH v7 07/12] multifd: Prepare to send a packet without the
 mutex held
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 19, 2022 at 8:32 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> > On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> >> We do the send_prepare() and the fill of the head packet without the
> >> mutex held.  It will help a lot for compression and later in the
> >> series for zero pages.
> >>
> >> Notice that we can use p->pages without holding p->mutex because
> >> p->pending_job =3D=3D 1.
> >>
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  migration/multifd.h |  2 ++
> >>  migration/multifd.c | 11 ++++++-----
> >>  2 files changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/migration/multifd.h b/migration/multifd.h
> >> index a67cefc0a2..cd389d18d2 100644
> >> --- a/migration/multifd.h
> >> +++ b/migration/multifd.h
> >> @@ -109,7 +109,9 @@ typedef struct {
> >>      /* array of pages to sent.
> >>       * The owner of 'pages' depends of 'pending_job' value:
> >>       * pending_job =3D=3D 0 -> migration_thread can use it.
> >> +     *                     No need for mutex lock.
> >>       * pending_job !=3D 0 -> multifd_channel can use it.
> >> +     *                     No need for mutex lock.
> >>       */
> >>      MultiFDPages_t *pages;
> >>
> >> diff --git a/migration/multifd.c b/migration/multifd.c
> >> index 09a40a9135..68fc9f8e88 100644
> >> --- a/migration/multifd.c
> >> +++ b/migration/multifd.c
> >> @@ -663,6 +663,8 @@ static void *multifd_send_thread(void *opaque)
> >>                  p->flags |=3D MULTIFD_FLAG_SYNC;
> >>                  p->sync_needed =3D false;
> >>              }
> >> +            qemu_mutex_unlock(&p->mutex);
> >> +
> >
> > If it unlocks here, we will have unprotected:
> > for (int i =3D 0; i < p->pages->num; i++) {
> >     p->normal[p->normal_num] =3D p->pages->offset[i];
> >     p->normal_num++;
> > }
> >
> > And p->pages seems to be in the mutex-protected area.
> > Should it be ok?
>
> From the documentation:
>
>     /* array of pages to sent.
>      * The owner of 'pages' depends of 'pending_job' value:
>      * pending_job =3D=3D 0 -> migration_thread can use it.
>      *                     No need for mutex lock.
>      * pending_job !=3D 0 -> multifd_channel can use it.
>      *                     No need for mutex lock.
>      */
>     MultiFDPages_t *pages;
>
> So, it is right.

Oh, right. I missed that part earlier .

>
> > Also, under that we have:
> >             if (p->normal_num) {
> >                 ret =3D multifd_send_state->ops->send_prepare(p, &local=
_err);
> >                 if (ret !=3D 0) {
> >                     qemu_mutex_unlock(&p->mutex);
> >                     break;
> >                 }
> >             }
> >
> > Calling mutex_unlock() here, even though the unlock already happened be=
fore,
> > could cause any issue?
>
> Good catch.  Never got an error there.
>
> Removing that bit.

Thanks!

Best regards,
Leo

>
> > Best regards,
>
>
> Thanks, Juan.
>


