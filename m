Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1358F9FB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:21:58 +0200 (CEST)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4O5-0007yI-7k
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM4J2-0004lL-16
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM4Iy-0003dR-Bv
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660209396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27EQecvAHke1dbw+GfKQoc9CD0N4revzVpBHrthUUzM=;
 b=PXdqJ/7EgFuqUdn9EClqS0CFKKFl/SaKtCHoSELtZptG/9ujDP8LIxz1IBhMc0C6CqLeBr
 UglO6mb2FQckza8nhdzqUbtZnHby2XbCIQ5DpzvhgMxcFla3mcRB5wfScpOqb/5si+VWCu
 e3lIghLXEaza5fHoDwY7+GifkXMeKdo=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-fJ0Y_GTvOea8nP9JSYmtDQ-1; Thu, 11 Aug 2022 05:16:33 -0400
X-MC-Unique: fJ0Y_GTvOea8nP9JSYmtDQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 p6-20020a9f3806000000b00384ca6cf4c3so3334217uad.5
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 02:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=27EQecvAHke1dbw+GfKQoc9CD0N4revzVpBHrthUUzM=;
 b=xgeAohyeEPRzLYpqVsTmAgvvYVh9dN4UbFZzYoeJqEctr7vdsVaRHTU11deuVfQIYu
 dxerRzULlvxWwj/EJl36R4tx6ociD1PnZOKOi1FkWd3ajd6J7lexnBMn5oKbS5vQ/Tuc
 nDsUvnv+aVQvv/DtW43MON2BQBQBP691uWKWRTUAAZ1HuvID5bxYOMWj4aJrmUSfw9Zo
 GrB37QiUHRerQIuIcYgWkRviBlaM2sn7F4a0W8eiBCr/xUm1xwAp2BbKLJkFZCYRFFPi
 iYxpbG69U4z4NeP1Se20xFqpg3A0dRaNancrYa09Vh/YHcYSO/5EqEJSRnthnwR6SCzd
 Uqeg==
X-Gm-Message-State: ACgBeo0GuUzv0VTKR+f7GhnjPksgSroykOxiSps/1bieMY421LUhxqTa
 rBxV9EG9/PSsPA6boe2FfOWXt5hinV4bkd8QuLg7UN1rCjm/EQ8Jy/DPp5b+XEqw6WmHNT2WcOG
 hAhUHmq+t5gkyxq8=
X-Received: by 2002:a1f:1d93:0:b0:37b:c50d:a055 with SMTP id
 d141-20020a1f1d93000000b0037bc50da055mr4454036vkd.21.1660209392679; 
 Thu, 11 Aug 2022 02:16:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Q7XiTVKPmpw3Pqj4p+t5NdfK17Nv2uwYOeQOK5D3zASFH1wLR6Iehkc+6obtLIcud/HgWiA==
X-Received: by 2002:a1f:1d93:0:b0:37b:c50d:a055 with SMTP id
 d141-20020a1f1d93000000b0037bc50da055mr4454028vkd.21.1660209392475; 
 Thu, 11 Aug 2022 02:16:32 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a056122063300b00376f4f93745sm1476493vkp.10.2022.08.11.02.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 02:16:31 -0700 (PDT)
Message-ID: <b46a95640229beaabf8bc7af1254f9a95d23fbfb.camel@redhat.com>
Subject: Re: [PATCH v7 07/12] multifd: Prepare to send a packet without the
 mutex held
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Thu, 11 Aug 2022 06:16:28 -0300
In-Reply-To: <20220802063907.18882-8-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-8-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> We do the send_prepare() and the fill of the head packet without the
> mutex held.  It will help a lot for compression and later in the
> series for zero pages.
>=20
> Notice that we can use p->pages without holding p->mutex because
> p->pending_job =3D=3D 1.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h |  2 ++
>  migration/multifd.c | 11 ++++++-----
>  2 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index a67cefc0a2..cd389d18d2 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -109,7 +109,9 @@ typedef struct {
>      /* array of pages to sent.
>       * The owner of 'pages' depends of 'pending_job' value:
>       * pending_job =3D=3D 0 -> migration_thread can use it.
> +     *                     No need for mutex lock.
>       * pending_job !=3D 0 -> multifd_channel can use it.
> +     *                     No need for mutex lock.
>       */
>      MultiFDPages_t *pages;
> =20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 09a40a9135..68fc9f8e88 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -663,6 +663,8 @@ static void *multifd_send_thread(void *opaque)
>                  p->flags |=3D MULTIFD_FLAG_SYNC;
>                  p->sync_needed =3D false;
>              }
> +            qemu_mutex_unlock(&p->mutex);
> +

If it unlocks here, we will have unprotected:
for (int i =3D 0; i < p->pages->num; i++) {
    p->normal[p->normal_num] =3D p->pages->offset[i];
    p->normal_num++;
}

And p->pages seems to be in the mutex-protected area.
Should it be ok?

Also, under that we have:
            if (p->normal_num) {
                ret =3D multifd_send_state->ops->send_prepare(p, &local_err=
);
                if (ret !=3D 0) {
                    qemu_mutex_unlock(&p->mutex);
                    break;
                }
            }

Calling mutex_unlock() here, even though the unlock already happened before=
,
could cause any issue?


>              p->normal_num =3D 0;
> =20
>              if (use_zero_copy_send) {
> @@ -684,11 +686,6 @@ static void *multifd_send_thread(void *opaque)
>                  }
>              }
>              multifd_send_fill_packet(p);
> -            p->num_packets++;
> -            p->total_normal_pages +=3D p->normal_num;
> -            p->pages->num =3D 0;
> -            p->pages->block =3D NULL;
> -            qemu_mutex_unlock(&p->mutex);
> =20
>              trace_multifd_send(p->id, packet_num, p->normal_num, p->flag=
s,
>                                 p->next_packet_size);
> @@ -713,6 +710,10 @@ static void *multifd_send_thread(void *opaque)
>              }
> =20
>              qemu_mutex_lock(&p->mutex);
> +            p->num_packets++;
> +            p->total_normal_pages +=3D p->normal_num;
> +            p->pages->num =3D 0;
> +            p->pages->block =3D NULL;
>              p->sent_bytes +=3D p->packet_len;;
>              p->sent_bytes +=3D p->next_packet_size;
>              p->pending_job--;

Not used in the interval, this part seems ok.

Best regards,
Leo


