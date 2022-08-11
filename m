Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4110058F8EC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 10:18:47 +0200 (CEST)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM3Ow-0005fx-4z
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 04:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3Ha-0008Me-Tq
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3HX-0000H1-0Q
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660205465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hRmCF9kj6Z9GLuVPx865YXiZMZqYg/3IHEf9Q/U6qsI=;
 b=XlM+G4hHeP7ienN4mjmNDkUhMGhtiB6obX4xMeRls9XV0RbQNGPd5FRKRmbApvKAoT1yNh
 pSigAsxKDuAHJASTwGNXKT+dkyZEMJVUdZFXQnrKvPr24r1lJBjY7dactCEO1dwBobXu5D
 1XtCZj7rGqmxsFgOU/k1b1E2JMIlGxg=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-VY6pGg0UM-WyQj1HWhZ2pA-1; Thu, 11 Aug 2022 04:11:04 -0400
X-MC-Unique: VY6pGg0UM-WyQj1HWhZ2pA-1
Received: by mail-ua1-f72.google.com with SMTP id
 b11-20020ab05f8b000000b00384cbe4f8daso3360852uaj.23
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 01:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=hRmCF9kj6Z9GLuVPx865YXiZMZqYg/3IHEf9Q/U6qsI=;
 b=3yu+Q4IbGbZ9FdYLfwFUZy1kLH0UsTW8YymR3lA8FB9Vv8r+7ooTyOdsJi+Z2m/KWA
 q1+VXzMU+pGrDS7xHizpJZBmiQavyDgyZIYJmlRVuzvz7llEZNcSYZGpsrCPaXKeHnoc
 UOgd/DtvTbUZUfH1teAMSY8macKxKt40OFB1nNGaQQ6HKQVNw0rG02KQT46ze4Q14xdM
 l7tIK4/mSbOty9eSYX1kR05jes6bOZortwAr9FpoFoth6op84naTqi+99ur4rc8SnI9S
 0e2zCkIhwmE9WZeNbk+KWjWqt6GA1HJAY1I9Qm/Ud865Iw+VruIdZF6uP2xyw/JLt6Gt
 g3CA==
X-Gm-Message-State: ACgBeo3eNvLcwC4e1OIZMS7FfVxXPEGMeJotoOAl3EvPFx+aT9q/TIa0
 uJ41vXqfOgcAtaMZhDdd/4B22Ta+t1g/6CWuYzRkwLfTc2iFbCsEFW24SlwMTENGNZFhWrrW5Qd
 jSgZrM1Vp6fzlfJE=
X-Received: by 2002:a67:8c83:0:b0:388:b5c2:b44b with SMTP id
 o125-20020a678c83000000b00388b5c2b44bmr8155595vsd.8.1660205463876; 
 Thu, 11 Aug 2022 01:11:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Pv657a3BlmQjd7O3K8A1okBfdW3kERJ/AatS/t51HFX5Xy78jTBEtsxrseoih2myGKux/+w==
X-Received: by 2002:a67:8c83:0:b0:388:b5c2:b44b with SMTP id
 o125-20020a678c83000000b00388b5c2b44bmr8155583vsd.8.1660205463700; 
 Thu, 11 Aug 2022 01:11:03 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056102224900b0038849a48605sm1108427vsb.23.2022.08.11.01.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:11:03 -0700 (PDT)
Message-ID: <335aec77d41e2b7d163e5b2fef9ddaa284fa8527.camel@redhat.com>
Subject: Re: [PATCH v7 02/12] multifd: Create page_count fields into both
 MultiFD{Recv,Send}Params
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Thu, 11 Aug 2022 05:10:59 -0300
In-Reply-To: <20220802063907.18882-3-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-3-quintela@redhat.com>
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

On Tue, 2022-08-02 at 08:38 +0200, Juan Quintela wrote:
> We were recalculating it left and right.  We plan to change that
> values on next patches.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h | 4 ++++
>  migration/multifd.c | 7 ++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 86fb9982b3..e2802a9ce2 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -82,6 +82,8 @@ typedef struct {
>      uint32_t packet_len;
>      /* guest page size */
>      uint32_t page_size;
> +    /* number of pages in a full packet */
> +    uint32_t page_count;
>      /* multifd flags for sending ram */
>      int write_flags;
> =20
> @@ -147,6 +149,8 @@ typedef struct {
>      uint32_t packet_len;
>      /* guest page size */
>      uint32_t page_size;
> +    /* number of pages in a full packet */
> +    uint32_t page_count;
> =20
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index d2070c9cee..aa3808a6f4 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -279,7 +279,6 @@ static void multifd_send_fill_packet(MultiFDSendParam=
s *p)
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp=
)
>  {
>      MultiFDPacket_t *packet =3D p->packet;
> -    uint32_t page_count =3D MULTIFD_PACKET_SIZE / p->page_size;
>      RAMBlock *block;
>      int i;
> =20
> @@ -306,10 +305,10 @@ static int multifd_recv_unfill_packet(MultiFDRecvPa=
rams *p, Error **errp)
>       * If we received a packet that is 100 times bigger than expected
>       * just stop migration.  It is a magic number.
>       */
> -    if (packet->pages_alloc > page_count) {
> +    if (packet->pages_alloc > p->page_count) {
>          error_setg(errp, "multifd: received packet "
>                     "with size %u and expected a size of %u",
> -                   packet->pages_alloc, page_count) ;
> +                   packet->pages_alloc, p->page_count) ;
>          return -1;
>      }
> =20
> @@ -936,6 +935,7 @@ int multifd_save_setup(Error **errp)
>          p->iov =3D g_new0(struct iovec, page_count + 1);
>          p->normal =3D g_new0(ram_addr_t, page_count);
>          p->page_size =3D qemu_target_page_size();
> +        p->page_count =3D page_count;
> =20
>          if (migrate_use_zero_copy_send()) {
>              p->write_flags =3D QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
> @@ -1183,6 +1183,7 @@ int multifd_load_setup(Error **errp)
>          p->name =3D g_strdup_printf("multifdrecv_%d", i);
>          p->iov =3D g_new0(struct iovec, page_count);
>          p->normal =3D g_new0(ram_addr_t, page_count);
> +        p->page_count =3D page_count;
>          p->page_size =3D qemu_target_page_size();
>      }
> =20

Same comment as Patch [1/12] here.

FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

Best regards,=20
Leo


