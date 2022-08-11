Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902658F9C7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:12:06 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4EX-0003P3-1A
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM475-0006Wv-QF
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM471-0000sZ-Nj
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660208658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5UHF+3vsDP3xcv4+37tdLs7T4wytv3KBf5VvJJ6DFY=;
 b=AHqm9ftOF6bVtVslLEWTxiWS+79FBpUm19xBj4GuVRWL8XSIVHyOMp9PZjnHZziKgLV5ea
 Rg19gt9OqnpFcxP+G//CidI45GNDbav+y5yTleoNCbfFzzqrrRn/O4VdHSHeIJhqOlfc56
 YH8QPJyTrkdbIzPq8i8VfNkvj0H4hxc=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-gkK3e3nMMMCB2PWbbwxb3Q-1; Thu, 11 Aug 2022 05:04:17 -0400
X-MC-Unique: gkK3e3nMMMCB2PWbbwxb3Q-1
Received: by mail-ua1-f70.google.com with SMTP id
 q8-20020ab054c8000000b00383a1b97212so3409728uaa.11
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 02:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=l5UHF+3vsDP3xcv4+37tdLs7T4wytv3KBf5VvJJ6DFY=;
 b=n4E0Ln3r+RAGGGcwY7uz3/6/okaHLtsSX0JKulrmbXNVjqH1qj9tbwlXNDgQ4Gk2Oe
 A9oMNflGro/UBItH8qw0pAwj+4NXOIXyeNe1JC31IVq7fga1A97SvnoJmukw+HUQJRj2
 TgIg0MChKk0zHpA5rWAL6WKjne/onkXd4ozNZ1MCCnztl1PZLLXoZDB38u1KA1/7WnHJ
 vXi52rMCoPg2JU1md62fSAxpBjHeaDxvN0Nuq8D3KEeVOdYheiHWnx0tFhWh0GkqdEr8
 SN/oSCOviTJ4qwdkGrE/NSaw+NOi004kRmiddFPFQ+orVFdS6tOb01XBzmxO8O9DJCAB
 G4+g==
X-Gm-Message-State: ACgBeo3ynKc16gIfyMjoLtn6C1FSQVH2Dm3CN7my8fi4DDRsVfTtzdsS
 P2TSBUL7PlYGPocIa4tKfJfUS13dfSlYds8v2IZ8JvBJPn8fkt6T33T0qF8sBPWEBwTyns975mh
 2vaGSDWuT1w1Z0so=
X-Received: by 2002:a9f:37f1:0:b0:381:e385:2fdc with SMTP id
 q104-20020a9f37f1000000b00381e3852fdcmr12975713uaq.116.1660208656146; 
 Thu, 11 Aug 2022 02:04:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6c6CE+YdMyLQJUuMcMNZOJ5Vu1eG46STd1CZ7E2U3VnHMGcRAu3VAXCmXsLYramOX/P5IwvA==
X-Received: by 2002:a9f:37f1:0:b0:381:e385:2fdc with SMTP id
 q104-20020a9f37f1000000b00381e3852fdcmr12975702uaq.116.1660208655873; 
 Thu, 11 Aug 2022 02:04:15 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 o16-20020ab03770000000b0038467d003e3sm14119799uat.38.2022.08.11.02.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 02:04:14 -0700 (PDT)
Message-ID: <ef7bff6220e3759c7acb5382ae211de1623cdf5e.camel@redhat.com>
Subject: Re: [PATCH v7 06/12] multifd: Make flags field thread local
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Thu, 11 Aug 2022 06:04:11 -0300
In-Reply-To: <20220802063907.18882-7-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-7-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> Use of flags with respect to locking was incensistant.  For the
> sending side:
> - it was set to 0 with mutex held on the multifd channel.
> - MULTIFD_FLAG_SYNC was set with mutex held on the migration thread.
> - Everything else was done without the mutex held on the multifd channel.
>=20
> On the reception side, it is not used on the migration thread, only on
> the multifd channels threads.
>=20
> So we move it to the multifd channels thread only variables, and we
> introduce a new bool sync_needed on the send side to pass that informatio=
n.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h | 10 ++++++----
>  migration/multifd.c | 23 +++++++++++++----------
>  2 files changed, 19 insertions(+), 14 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 36f899c56f..a67cefc0a2 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -98,12 +98,12 @@ typedef struct {

Just noticed having no name in 'typedef struct' line makes it harder to
understand what is going on.=20

MultiFDSendParams

>      bool running;
>      /* should this thread finish */
>      bool quit;
> -    /* multifd flags for each packet */
> -    uint32_t flags;
>      /* global number of generated multifd packets */
>      uint64_t packet_num;
>      /* How many bytes have we sent on the last packet */
>      uint64_t sent_bytes;
> +    /* Do we need to do an iteration sync */
> +    bool sync_needed;
>      /* thread has work to do */
>      int pending_job;
>      /* array of pages to sent.
> @@ -117,6 +117,8 @@ typedef struct {
> =20
>      /* pointer to the packet */
>      MultiFDPacket_t *packet;
> +    /* multifd flags for each packet */
> +    uint32_t flags;
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
>      /* packets sent through this channel */

MultiFDRecvParams

> @@ -163,8 +165,6 @@ typedef struct {
>      bool running;
>      /* should this thread finish */
>      bool quit;
> -    /* multifd flags for each packet */
> -    uint32_t flags;
>      /* global number of generated multifd packets */
>      uint64_t packet_num;
> =20
> @@ -172,6 +172,8 @@ typedef struct {
> =20
>      /* pointer to the packet */
>      MultiFDPacket_t *packet;
> +    /* multifd flags for each packet */
> +    uint32_t flags;
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
>      /* packets sent through this channel */

So, IIUC, the struct member flags got moved down (same struct) to an area
described as thread-local, meaning it does not need locking.=20

Interesting, I haven't noticed this different areas in the same struct.

> diff --git a/migration/multifd.c b/migration/multifd.c
> index e25b529235..09a40a9135 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -602,7 +602,7 @@ int multifd_send_sync_main(QEMUFile *f)
>          }
> =20
>          p->packet_num =3D multifd_send_state->packet_num++;
> -        p->flags |=3D MULTIFD_FLAG_SYNC;
> +        p->sync_needed =3D true;
>          p->pending_job++;
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
> @@ -658,7 +658,11 @@ static void *multifd_send_thread(void *opaque)
> =20
>          if (p->pending_job) {
>              uint64_t packet_num =3D p->packet_num;
> -            uint32_t flags =3D p->flags;
> +            p->flags =3D 0;
> +            if (p->sync_needed) {
> +                p->flags |=3D MULTIFD_FLAG_SYNC;
> +                p->sync_needed =3D false;
> +            }

Any particular reason why doing p->flags =3D 0, then p->flags |=3D MULTIFD_=
FLAG_SYNC
?

[1] Couldn't it be done without the |=3D , since it's already being set to =
zero
before?=C2=A0(becoming "p->flags =3D MULTIFD_FLAG_SYNC" )


>              p->normal_num =3D 0;
> =20
>              if (use_zero_copy_send) {
> @@ -680,14 +684,13 @@ static void *multifd_send_thread(void *opaque)
>                  }
>              }
>              multifd_send_fill_packet(p);
> -            p->flags =3D 0;
>              p->num_packets++;
>              p->total_normal_pages +=3D p->normal_num;
>              p->pages->num =3D 0;
>              p->pages->block =3D NULL;
>              qemu_mutex_unlock(&p->mutex);
> =20
> -            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
> +            trace_multifd_send(p->id, packet_num, p->normal_num, p->flag=
s,
>                                 p->next_packet_size);
> =20
>              if (use_zero_copy_send) {
> @@ -715,7 +718,7 @@ static void *multifd_send_thread(void *opaque)
>              p->pending_job--;
>              qemu_mutex_unlock(&p->mutex);
> =20
> -            if (flags & MULTIFD_FLAG_SYNC) {
> +            if (p->flags & MULTIFD_FLAG_SYNC) {
>                  qemu_sem_post(&p->sem_sync);
>              }
>              qemu_sem_post(&multifd_send_state->channels_ready);

IIUC it uses p->sync_needed to keep the sync info, instead of the previous =
flags
local var, and thus it can set p->flags =3D 0 earlier. Seems to not change =
any
behavior AFAICS.



> @@ -1090,7 +1093,7 @@ static void *multifd_recv_thread(void *opaque)
>      rcu_register_thread();
> =20
>      while (true) {
> -        uint32_t flags;
> +        bool sync_needed =3D false;
> =20
>          if (p->quit) {
>              break;
> @@ -1112,11 +1115,11 @@ static void *multifd_recv_thread(void *opaque)
>              break;
>          }
> =20
> -        flags =3D p->flags;
> +        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->flags=
,
> +                           p->next_packet_size);
> +        sync_needed =3D p->flags & MULTIFD_FLAG_SYNC;
>          /* recv methods don't know how to handle the SYNC flag */
>          p->flags &=3D ~MULTIFD_FLAG_SYNC;
> -        trace_multifd_recv(p->id, p->packet_num, p->normal_num, flags,
> -                           p->next_packet_size);
>          p->num_packets++;
>          p->total_normal_pages +=3D p->normal_num;
>          qemu_mutex_unlock(&p->mutex);
> @@ -1128,7 +1131,7 @@ static void *multifd_recv_thread(void *opaque)
>              }
>          }
> =20
> -        if (flags & MULTIFD_FLAG_SYNC) {
> +        if (sync_needed) {
>              qemu_sem_post(&multifd_recv_state->sem_sync);
>              qemu_sem_wait(&p->sem_sync);
>          }

Ok, IIUC this part should have the same behavior as before, but using a boo=
l
instead of an u32.

Other than question [1], LGTM.=C2=A0

FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>


