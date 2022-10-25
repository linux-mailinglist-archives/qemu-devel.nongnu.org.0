Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356760CD87
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:32:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJyu-0003xj-1X; Tue, 25 Oct 2022 09:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onJyr-0003xF-Rf
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onJyp-0002Vo-9e
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666704510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoOZwYF4ldrIR2yenflmN0YYncPlmuSa3nITj3mCyCw=;
 b=L/a01tSlGG53JAEACnWbvYm8hRQ6bKC6IJ14R3OzsmCQzt+iTEmIt94JFeLlivAqibpsyR
 Sp/OREbhOnyFqKB1l+rQIoehmtOS3nteZ7hRnfqQ2o1LjaFadXE12SOm5nTmefy/kjHgUM
 6ulF/fQew1d9ZriyKfA/8VvhalPZmXQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-DfH6xvhJOP6QBLakrsSwyA-1; Tue, 25 Oct 2022 09:28:28 -0400
X-MC-Unique: DfH6xvhJOP6QBLakrsSwyA-1
Received: by mail-oi1-f197.google.com with SMTP id
 j186-20020aca3cc3000000b003542949670eso2855623oia.6
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NoOZwYF4ldrIR2yenflmN0YYncPlmuSa3nITj3mCyCw=;
 b=RFUSUoaY02oAU4/NxGgOt1Hf6ZLD/bmUEQ5na1inrOS6fxWNj6tk13pgQoegg3SaUJ
 y9zYzCFRV6PhOLnuNshSSbTW6oQXZeb5YnX1WpwOJnf2OsKJibBQl+3CJVC//mqWFvA3
 4IhTj63wh6UyAbfu45duxrCpwKMiKDz2q6cWn0jdVYkEypI5jI+8out9fzlCtdGYAK9N
 L2Nt5h0BfiMlKFu32B9Jyy34IghzoYp3+UdTP9YlccsHG8jeBhC1sU7lG6vtoTpXZzh7
 WDVEam596gJHNHGXdDyDnnh+nKjSIUUOtkUzjMuA702kRC6wfmXtqbIxnJA2PpRrrUMh
 nWiA==
X-Gm-Message-State: ACrzQf1L8706WyjEYWstRaKvO9Nb8zVBWc/iUz9fz+JBducHajXeMV29
 FNBBAm5W3OETThzi+MUvTnKYj5PmhYnbwflIoMz+wm+uDpQJr2kgMv2RacxFsyyujMgeXNwuTB5
 NLjZo4wGlxq3i8mQ=
X-Received: by 2002:a05:6870:160f:b0:131:e2c3:8fe3 with SMTP id
 b15-20020a056870160f00b00131e2c38fe3mr39778128oae.54.1666704508031; 
 Tue, 25 Oct 2022 06:28:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KiRun5dQPnI8CB76NEopfgTOsyAWZbI6VV33nP4Op/Im8XKoUmiQHkr+EURcndwY0VqKEzQ==
X-Received: by 2002:a05:6870:160f:b0:131:e2c3:8fe3 with SMTP id
 b15-20020a056870160f00b00131e2c38fe3mr39778111oae.54.1666704507784; 
 Tue, 25 Oct 2022 06:28:27 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a801:de5e:6447:4a67:eb7c:b690?
 ([2804:1b3:a801:de5e:6447:4a67:eb7c:b690])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a05683022c400b00661a16f14a1sm1009640otc.15.2022.10.25.06.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 06:28:27 -0700 (PDT)
Message-ID: <b4d926e8b8d62c2f513e1de610bb5971c1eb53a1.camel@redhat.com>
Subject: Re: [RFC PATCH 2/4] migration/multifd/zero-copy: Merge header &
 pages send in a single write
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: quintela@redhat.com
Cc: Daniel =?ISO-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>, "Dr.
 David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 25 Oct 2022 10:28:22 -0300
In-Reply-To: <87a65kdydn.fsf@secure.mitica>
References: <20221025044730.319941-1-leobras@redhat.com>
 <20221025044730.319941-3-leobras@redhat.com> <87a65kdydn.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2022-10-25 at 11:51 +0200, Juan Quintela wrote:
> Leonardo Bras <leobras@redhat.com> wrote:
> > When zero-copy-send is enabled, each loop iteration of the
> > multifd_send_thread will calls for qio_channel_write_*() twice: The fir=
st
> > one for sending the header without zero-copy flag and the second one fo=
r
> > sending the memory pages, with zero-copy flag enabled.
> >=20
> > This ends up calling two syscalls per loop iteration, where one should =
be
> > enough.
> >=20
> > Also, since the behavior for non-zero-copy write is synchronous, and th=
e
> > behavior for zero-copy write is asynchronous, it ends up interleaving
> > synchronous and asynchronous writes, hurting performance that could
> > otherwise be improved.
> >=20
> > The choice of sending the header without the zero-copy flag in a separa=
ted
> > write happened because the header memory area would be reused in the ne=
xt
> > write, so it was almost certain to have changed before the kernel could
> > send the packet.
> >=20
> > To send the packet with zero-copy, create an array of header area inste=
ad
> > of a single one, and use a different header area after each write. Also=
,
> > flush the sending queue after all the headers have been used.
> >=20
> > To avoid adding a zero-copy conditional in multifd_send_fill_packet(),
> > add a packet parameter (the packet that should be filled). This way it'=
s
> > simpler to pick which element of the array will be used as a header.
> >=20
> > Suggested-by: Juan Quintela <quintela@redhat.com>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>=20
> > =20
> > +            if (use_zero_copy_send) {
> > +                p->packet_idx =3D (p->packet_idx + 1) % HEADER_ARR_SZ;
> > +
> > +                if (!p->packet_idx && (multifd_zero_copy_flush(p->c) <=
 0)) {
> > +                    break;
> > +                }
> > +                header =3D (void *)p->packet + p->packet_idx * p->pack=
et_len;
>=20
> Isn't this equivalent to?
>=20
>       header =3D &(p->packet[p->packet_idx]);


So, that's the thing:
MultiFDPacket_t does contain a flexible array member (offset[]) at the end =
of
the struct, which is used together with dynamic allocation to create the
perception of a variable size struct.=20

This is used to make sure the packet will be able to carry the offset for e=
ach
memory page getting sent, independent of it's size:

multifd_save_setup (){=20
	uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size();
	[...]
	p->packet_len =3D sizeof(MultiFDPacket_t)
                      + sizeof(uint64_t) * page_count;
	p->packet =3D g_malloc0(p->packet_len);
	[...]
}

So the size of the header is actually p->packet_len, and not
sizeof(MultiFDPacket_t). This means using the default pointer arithmetic do=
es
not work for this case, and

header =3D &(p->packet[p->packet_idx])=C2=A0

will actually point to the wrong place in memory, since it does not conside=
r the
the actual size of offset[] array.

>=20
> >      for (i =3D 0; i < thread_count; i++) {
> >          MultiFDSendParams *p =3D &multifd_send_state->params[i];
> > +        int j;
>=20
> For new code you can:
>=20
> >          qemu_mutex_init(&p->mutex);
> >          qemu_sem_init(&p->sem, 0);
> > @@ -940,9 +940,13 @@ int multifd_save_setup(Error **errp)
> >          p->pages =3D multifd_pages_init(page_count);
> >          p->packet_len =3D sizeof(MultiFDPacket_t)
> >                        + sizeof(uint64_t) * page_count;
> > -        p->packet =3D g_malloc0(p->packet_len);
> > -        p->packet->magic =3D cpu_to_be32(MULTIFD_MAGIC);
> > -        p->packet->version =3D cpu_to_be32(MULTIFD_VERSION);
> > +        p->packet =3D g_malloc0_n(HEADER_ARR_SZ, p->packet_len);
> > +        for (j =3D 0; j < HEADER_ARR_SZ ; j++) {
>=20
>            for (int j =3D 0; j < HEADER_ARR_SZ ; j++) {

Oh, sweet. I am very fond of C99, just not used to it getting accepted upst=
ream.
Thanks for the tip :)

>=20
> > +            MultiFDPacket_t *packet =3D (void *)p->packet + j * p->pac=
ket_len;
> > +            packet->magic =3D cpu_to_be32(MULTIFD_MAGIC);
> > +            packet->version =3D cpu_to_be32(MULTIFD_VERSION);
>=20
> Can't you use here:
>=20
>             packet[j].magic =3D cpu_to_be32(MULTIFD_MAGIC);
>             packet[j].version =3D cpu_to_be32(MULTIFD_VERSION);
>=20
> And call it a day?

Not actually. The size of this struct is different from sizeof(MultiFDPacke=
t_t),
so it does not work. See above.

>=20
> The rest is fine for me.  Thanks for the effort.

Thanks for reviewing Juan!

Leo

>=20
> Later, Juan.
>=20


