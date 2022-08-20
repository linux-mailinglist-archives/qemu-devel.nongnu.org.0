Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CB259AC35
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 09:26:57 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPIsi-0003gE-2X
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 03:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oPIr4-0002FN-I9
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 03:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oPIr0-0004HE-Am
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 03:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660980308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ma1jjT/dA/JuqqQGzNwKC6sd3FB5+B9LQvq87yfwS7g=;
 b=e8ZZn+xvxphkqMRUWmlXDqoVcgG7h9waCmlmBRmxRxv/aK8gpa0A3qrfMQpwGhYAfMRc+w
 gh1fM5VPTTjtTV7rtjAsxr3kyueXEli6T36FORYGOJ3JEraxlfaQlX4K3WxwKC9bb4Vq2N
 tg3WYYK4REDkqPZSprjZCRddPLNEDHw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-iADup53zOCqhp3a_N-LW0Q-1; Sat, 20 Aug 2022 03:25:06 -0400
X-MC-Unique: iADup53zOCqhp3a_N-LW0Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 w5-20020a05640234c500b0043dda025648so3899527edc.8
 for <qemu-devel@nongnu.org>; Sat, 20 Aug 2022 00:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=ma1jjT/dA/JuqqQGzNwKC6sd3FB5+B9LQvq87yfwS7g=;
 b=1YRuVV1a1LLaLPd7SXW/terPkM8fZ9Lux7jNt8sNAd0hDQSSV+IREzBUNSplN3wDt4
 s3sEVK2EO7S3jzi3oJBNQRyjTr7B1xqfw1MAA636pZj99dTyYiqsrkVHHVb/FLWyig3W
 gZDDvw8TYBiupI2lawujr5p28NmtJCpCL/OXQ3zBk8JRPWwymUw2NTWUfsWOaOyWpafK
 CMLfiCS+LFBp0DUBcswEh5Ma92Xm/hhJnXIJWpt8WE1Zi0ecXKb71thjGXJLvM1Q6Z+M
 sG49grdDN6YDtwFyNaRKP0vCPQawrTWKCPNWjokiJxzPsdUkfI1umlvJBieYPtZljCjD
 EHFQ==
X-Gm-Message-State: ACgBeo2cnhHBRAwcYs7NHC0o6JxAbNDOMaHOLSsrJDZ1bF4s1AFik2qg
 TEQqdtymu4hyWLJZNGJMC2M7oMxUpHKAwoJNSx8ZlIdoGJRx2eDALVqvBu36L3cT+51Sy4pgPE+
 iQGIfj2VXdn+TrneZb264L+8BptwyTyU=
X-Received: by 2002:a17:907:9694:b0:73c:4e5c:fd33 with SMTP id
 hd20-20020a170907969400b0073c4e5cfd33mr5744936ejc.331.1660980305730; 
 Sat, 20 Aug 2022 00:25:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6tmc4u5a2SVonwJjOwQtW1eiam1C4n9uSjCHXeX4HzJT1e+XOJYi7T02Fnl3n3AACdkg0QAeAPL1C/cG+GFQQ=
X-Received: by 2002:a17:907:9694:b0:73c:4e5c:fd33 with SMTP id
 hd20-20020a170907969400b0073c4e5cfd33mr5744910ejc.331.1660980305329; Sat, 20
 Aug 2022 00:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-7-quintela@redhat.com>
 <ef7bff6220e3759c7acb5382ae211de1623cdf5e.camel@redhat.com>
 <87czcw1rfp.fsf@secure.mitica>
In-Reply-To: <87czcw1rfp.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Sat, 20 Aug 2022 04:24:54 -0300
Message-ID: <CAJ6HWG7hXM8jwLTqTZx_uyWm0KKBC93wVgrXV_dcC_r+HwKmPw@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] multifd: Make flags field thread local
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

On Fri, Aug 19, 2022 at 7:03 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> > On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> >> Use of flags with respect to locking was incensistant.  For the
> >> sending side:
> >> - it was set to 0 with mutex held on the multifd channel.
> >> - MULTIFD_FLAG_SYNC was set with mutex held on the migration thread.
> >> - Everything else was done without the mutex held on the multifd chann=
el.
> >>
> >> On the reception side, it is not used on the migration thread, only on
> >> the multifd channels threads.
> >>
> >> So we move it to the multifd channels thread only variables, and we
> >> introduce a new bool sync_needed on the send side to pass that informa=
tion.
> >>
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  migration/multifd.h | 10 ++++++----
> >>  migration/multifd.c | 23 +++++++++++++----------
> >>  2 files changed, 19 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/migration/multifd.h b/migration/multifd.h
> >> index 36f899c56f..a67cefc0a2 100644
> >> --- a/migration/multifd.h
> >> +++ b/migration/multifd.h
> >> @@ -98,12 +98,12 @@ typedef struct {
> >
> > Just noticed having no name in 'typedef struct' line makes it harder to
> > understand what is going on.
>
> It is common idiom in QEMU.  The principal reason is that if you don't
> want anyone to use "struct MultiFDSendParams" but MultiFDSendParams, the
> best way to achieve that is to do it this way.

I agree, but a comment after the typedef could help reviewing. Something li=
ke

typedef struct { /* MultiFDSendParams */
...
} MultiFDSendParams

Becomes this in diff:

diff --git a/migration/multifd.h b/migration/multifd.h
index 134e6a7f19..93bb3a7f4a 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -90,6 +90,7 @@ typedef struct { /* MultiFDSendParams */
[...]


>
> >> @@ -172,6 +172,8 @@ typedef struct {
> >>
> >>      /* pointer to the packet */
> >>      MultiFDPacket_t *packet;
> >> +    /* multifd flags for each packet */
> >> +    uint32_t flags;
> >>      /* size of the next packet that contains pages */
> >>      uint32_t next_packet_size;
> >>      /* packets sent through this channel */
> >
> > So, IIUC, the struct member flags got moved down (same struct) to an ar=
ea
> > described as thread-local, meaning it does not need locking.
> >
> > Interesting, I haven't noticed this different areas in the same struct.
>
> It has changed in the last two weeks or so in upstream (it has been on
> this patchset for several months.)

Nice :)

>
>
> >
> >> diff --git a/migration/multifd.c b/migration/multifd.c
> >> index e25b529235..09a40a9135 100644
> >> --- a/migration/multifd.c
> >> +++ b/migration/multifd.c
> >> @@ -602,7 +602,7 @@ int multifd_send_sync_main(QEMUFile *f)
> >>          }
> >>
> >>          p->packet_num =3D multifd_send_state->packet_num++;
> >> -        p->flags |=3D MULTIFD_FLAG_SYNC;
> >> +        p->sync_needed =3D true;
> >>          p->pending_job++;
> >>          qemu_mutex_unlock(&p->mutex);
> >>          qemu_sem_post(&p->sem);
> >> @@ -658,7 +658,11 @@ static void *multifd_send_thread(void *opaque)
> >>
> >>          if (p->pending_job) {
> >>              uint64_t packet_num =3D p->packet_num;
> >> -            uint32_t flags =3D p->flags;
> >> +            p->flags =3D 0;
> >> +            if (p->sync_needed) {
> >> +                p->flags |=3D MULTIFD_FLAG_SYNC;
> >> +                p->sync_needed =3D false;
> >> +            }
> >
> > Any particular reason why doing p->flags =3D 0, then p->flags |=3D MULT=
IFD_FLAG_SYNC
> > ?
>
> It is a bitmap field, and if there is anything on the future, we need to
> set it.  I agree that when there is only one flag, it seems "weird".
>
> > [1] Couldn't it be done without the |=3D , since it's already being set=
 to zero
> > before? (becoming "p->flags =3D MULTIFD_FLAG_SYNC" )
>
> As said, easier to modify later, and also easier if we want to setup a
> flag by default.

Yeah, I agree. It makes sense now.

Thanks

>
> I agree that it is a matter of style/taste.
>
> >>              p->normal_num =3D 0;
> >>
> >>              if (use_zero_copy_send) {
> >> @@ -680,14 +684,13 @@ static void *multifd_send_thread(void *opaque)
> >>                  }
> >>              }
> >>              multifd_send_fill_packet(p);
> >> -            p->flags =3D 0;
> >>              p->num_packets++;
> >>              p->total_normal_pages +=3D p->normal_num;
> >>              p->pages->num =3D 0;
> >>              p->pages->block =3D NULL;
> >>              qemu_mutex_unlock(&p->mutex);
> >>
> >> -            trace_multifd_send(p->id, packet_num, p->normal_num, flag=
s,
> >> +            trace_multifd_send(p->id, packet_num, p->normal_num, p->f=
lags,
> >>                                 p->next_packet_size);
> >>
> >>              if (use_zero_copy_send) {
> >> @@ -715,7 +718,7 @@ static void *multifd_send_thread(void *opaque)
> >>              p->pending_job--;
> >>              qemu_mutex_unlock(&p->mutex);
> >>
> >> -            if (flags & MULTIFD_FLAG_SYNC) {
> >> +            if (p->flags & MULTIFD_FLAG_SYNC) {
> >>                  qemu_sem_post(&p->sem_sync);
> >>              }
> >>              qemu_sem_post(&multifd_send_state->channels_ready);
> >
> > IIUC it uses p->sync_needed to keep the sync info, instead of the previ=
ous flags
> > local var, and thus it can set p->flags =3D 0 earlier. Seems to not cha=
nge any
> > behavior AFAICS.
>
> The protection of the global flags was being wrong.  That is the reason
> that I decided to change it to the sync_needed.
>
> The problem was that at some point we were still sending a packet (that
> shouldn't have the SYNC flag enabled), but we received a
> multifd_main_sync() and it got enabled anyways.  The easier way that I
> found te fix it was this way.
>
> Problem was difficult to detect, that is the reason that I change it
> this way.

Oh, I see.

>
> >> -        if (flags & MULTIFD_FLAG_SYNC) {
> >> +        if (sync_needed) {
> >>              qemu_sem_post(&multifd_recv_state->sem_sync);
> >>              qemu_sem_wait(&p->sem_sync);
> >>          }
> >
> > Ok, IIUC this part should have the same behavior as before, but using a=
 bool
> > instead of an u32.
>
> I changed it to make sure that we only checked the flags at the
> beggining of the function, with the lock taken.

Thanks for sharing!

Best regards,
Leo

>
> >
> > FWIW:
> > Reviewed-by: Leonardo Bras <leobras@redhat.com>
>
> Thanks, Juan.
>


