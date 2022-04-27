Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0C3511577
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:33:04 +0200 (CEST)
Received: from localhost ([::1]:39192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfup-00009B-6Y
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njfsQ-0006nV-HV
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njfsN-0001T3-KK
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651059030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/FJUdaLbl5cpotEMuapi9Llh8YuvreZg5D8DbtlAS70=;
 b=OWUc7CvWeye3/TsTiXePD23/KXMGwQNfpFHNwlZnzzdc9SwRw8N9Va/52b2wb33mAIdqsI
 WYpcey1lyLZn1nwqqfbwt8AAD2+3zQIBU/2RLs4ypTvogwGIF+6GgfcQ030ubKkvbD4Rsb
 uIUIpZ3QQOvrrtjyLHJOH7kDW+JVY28=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-CMmUIvovMTuy0bMORYBDMA-1; Wed, 27 Apr 2022 07:30:29 -0400
X-MC-Unique: CMmUIvovMTuy0bMORYBDMA-1
Received: by mail-lj1-f200.google.com with SMTP id
 u19-20020a2e8553000000b0024f222a942aso654738ljj.8
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FJUdaLbl5cpotEMuapi9Llh8YuvreZg5D8DbtlAS70=;
 b=cxoX/HNAI3Hl0J544IY2ilE7RxfvE0dPDPPCrj/9ZzAeZ/K34dDC4PNFpduFVhXp/u
 3VUcyJ68/9LbEplbSL+mei2hQXcvzBLI2Dyhk/AAaXM5RI7CDME3jsfGUKxty0ZhS1tk
 +mbVsLImiD5Zdw39HpuGid9s14R9/+hyVNG2V8iHCgMQK+DLhBR1LERR9XVDpKtPldFp
 zs1E5Rid94Lo+m8SyR9A2mbqeqMim8IblLZrMDXvCT42mMzrAr7kjv2OFQMbc1BW/bB0
 vQoiC1I7zaHBllshHCNq7K7ctOOGg/MrRRkvcSeTZ9GMJnkt54CKGTrHnTvYjiCSyfih
 AtTg==
X-Gm-Message-State: AOAM5329OuffrIs0R0qJhSCpPGVp8eiiQIrdEnx7HoErzsKK0WJmuADh
 tK5NVOmL/bIRtNw5J/8D/1kq7iDXQLWBelf8wlyS61LIl9ETYZfWe/e1wQdelQEGX3JqGPO4XnS
 92+BzjTz8+3D+8kw8ybVNuggDsf1zUkQ=
X-Received: by 2002:a05:6512:b0e:b0:44a:a5a0:f60e with SMTP id
 w14-20020a0565120b0e00b0044aa5a0f60emr20686922lfu.669.1651059027671; 
 Wed, 27 Apr 2022 04:30:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxXQ2J61NRaL+ed6W0xcEIdbbzPbsvlqlwGK80q0sz8sZQxAlxy7Au9g5adl931/b/seQzOtS4vlWsq2ZyPJM=
X-Received: by 2002:a05:6512:b0e:b0:44a:a5a0:f60e with SMTP id
 w14-20020a0565120b0e00b0044aa5a0f60emr20686893lfu.669.1651059027402; Wed, 27
 Apr 2022 04:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220426230654.637939-1-leobras@redhat.com>
 <20220426230654.637939-7-leobras@redhat.com>
 <Ymh/pjIxBNCCNa9L@xz-m1.local>
In-Reply-To: <Ymh/pjIxBNCCNa9L@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Apr 2022 08:30:16 -0300
Message-ID: <CAJ6HWG4QnR4JX1AJEmu2PKo7p_mV48Dg9W_K1-HcDFjcW0x11Q@mail.gmail.com>
Subject: Re: [PATCH v10 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 8:26 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Apr 26, 2022 at 08:06:55PM -0300, Leonardo Bras wrote:
> > Since d48c3a0445 ("multifd: Use a single writev on the send side"),
> > sending the header packet and the memory pages happens in the same
> > writev, which can potentially make the migration faster.
> >
> > Using channel-socket as example, this works well with the default copying
> > mechanism of sendmsg(), but with zero-copy-send=true, it will cause
> > the migration to often break.
> >
> > This happens because the header packet buffer gets reused quite often,
> > and there is a high chance that by the time the MSG_ZEROCOPY mechanism get
> > to send the buffer, it has already changed, sending the wrong data and
> > causing the migration to abort.
> >
> > It means that, as it is, the buffer for the header packet is not suitable
> > for sending with MSG_ZEROCOPY.
> >
> > In order to enable zero copy for multifd, send the header packet on an
> > individual write(), without any flags, and the remanining pages with a
> > writev(), as it was happening before. This only changes how a migration
> > with zero-copy-send=true works, not changing any current behavior for
> > migrations with zero-copy-send=false.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd.c | 23 ++++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> >
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 15fb668e64..07b2e92d8d 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -617,6 +617,7 @@ static void *multifd_send_thread(void *opaque)
> >      MultiFDSendParams *p = opaque;
> >      Error *local_err = NULL;
> >      int ret = 0;
> > +    bool use_zero_copy_send = migrate_use_zero_copy_send();
> >
> >      trace_multifd_send_thread_start(p->id);
> >      rcu_register_thread();
> > @@ -639,9 +640,14 @@ static void *multifd_send_thread(void *opaque)
> >          if (p->pending_job) {
> >              uint64_t packet_num = p->packet_num;
> >              uint32_t flags = p->flags;
> > -            p->iovs_num = 1;
> >              p->normal_num = 0;
> >
> > +            if (use_zero_copy_send) {
> > +                p->iovs_num = 0;
> > +            } else {
> > +                p->iovs_num = 1;
> > +            }
> > +
> >              for (int i = 0; i < p->pages->num; i++) {
> >                  p->normal[p->normal_num] = p->pages->offset[i];
> >                  p->normal_num++;
> > @@ -665,8 +671,19 @@ static void *multifd_send_thread(void *opaque)
> >              trace_multifd_send(p->id, packet_num, p->normal_num, flags,
> >                                 p->next_packet_size);
> >
> > -            p->iov[0].iov_len = p->packet_len;
> > -            p->iov[0].iov_base = p->packet;
> > +            if (use_zero_copy_send) {
> > +                /* Send header first, without zerocopy */
> > +                ret = qio_channel_write_all(p->c, (void *)p->packet,
> > +                                            p->packet_len, &local_err);
> > +                if (ret != 0) {
> > +                    break;
> > +                }
> > +
>
> Extra but useless newline.. but not worth a repost.  Looks good here:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> Thanks,

Thanks for reviewing Peter!

Best regards,
Leo

>
> > +            } else {
> > +                /* Send header using the same writev call */
> > +                p->iov[0].iov_len = p->packet_len;
> > +                p->iov[0].iov_base = p->packet;
> > +            }
> >
> >              ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> >                                           &local_err);
> > --
> > 2.36.0
> >
>
> --
> Peter Xu
>


