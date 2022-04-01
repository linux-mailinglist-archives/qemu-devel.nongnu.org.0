Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7468B4EE613
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:33:25 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na76K-0001Rz-9m
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:33:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na74V-0007uB-Mc
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:31:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na74T-0005iI-NA
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648780289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2o60ylNEQqRUL0ImYLTS7sITGmVrT2SfeN1ZyPismUE=;
 b=K3H2I42mPepejFwAVr/vCilBUKWywYomCDIwaphrz6Og3n15hMcdiziIdc8JW3OQ3mqfXW
 7t9fpnKH4La21hRipO4IPhUpsi9oCzM8eahEG11DGw4P69gm+yoP9LjQBJxcXnS9dwUm3D
 crb675Vvezt/D0jDIUajVu4LlMyMie4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-cx4hK3WLPhyecT7xbnCBdg-1; Thu, 31 Mar 2022 22:31:27 -0400
X-MC-Unique: cx4hK3WLPhyecT7xbnCBdg-1
Received: by mail-lf1-f72.google.com with SMTP id
 d41-20020a0565123d2900b0044a10c21f39so582061lfv.22
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2o60ylNEQqRUL0ImYLTS7sITGmVrT2SfeN1ZyPismUE=;
 b=O7ZZyBD+DsmMvkzicrpci7JMiD8bRa3ZdyW3siz3s55lDFY5y4Lr/1Wg8lq8FCAx/y
 YiII/fC3NM/gcP8ZjZLoxFH85QJOzZYmNEBqK5ykzr6AZSFFNmsJ4D6VGflBAQE5ppAL
 q3mhqS9+9CChuNosuFPOzeMtyPTm/BsZpWDPZUZ4PhTc7bmhHaK4aANr7twBG/GdajQY
 r9UhbhSDGNfnQpSnH3papEUTCxk3fzsCuc9UHmx0jqifuLdtpx7lYewU0ThgM9hcS0CI
 9OEYFDY0neVG5Cp6qfDuphkanR8vpqrhDZLH+HfQaKClEhr7bRm/yadbNP4MIqn1vTte
 /Wvg==
X-Gm-Message-State: AOAM532j0I/g0mPejqunQ3hfg5crngpzr3LzUrBnUUm/WN5rmkQyZxV/
 pINNVv6S5lMwvL/6kB607aRnqaBz1e2LgIdaz1tlRRQpLi0UDB9J95RjNwiusu1aj7u7C32owVN
 /Zw7GtMLJHLVSuWb+PQb9Z+Wrezx+ah0=
X-Received: by 2002:a2e:b946:0:b0:24a:fdff:1205 with SMTP id
 6-20020a2eb946000000b0024afdff1205mr2170349ljs.73.1648780285980; 
 Thu, 31 Mar 2022 19:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpaQgCK4PBRlTx8wcepL5kiodGkpaB434IdDu+FHA3lZirTzelrMyYMjHup+SOskjiCqSCIK5rKrLgXa4P0Mc=
X-Received: by 2002:a2e:b946:0:b0:24a:fdff:1205 with SMTP id
 6-20020a2eb946000000b0024afdff1205mr2170340ljs.73.1648780285777; Thu, 31 Mar
 2022 19:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220331182935.538101-1-eperezma@redhat.com>
In-Reply-To: <20220331182935.538101-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Apr 2022 10:31:14 +0800
Message-ID: <CACGkMEvEKGxccu5_tFeVqthZrr_KfwVy2MFVw4rZhJbG90Z4QA@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: use g_memdup2() instead of unsafe g_memdup()
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> Fixing that literal checkpatch.pl because it will complain when we modify=
 the file
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/virtio-net.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1067e72b39..e4748a7e6c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1443,7 +1443,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vd=
ev, VirtQueue *vq)
>          }
>
>          iov_cnt =3D elem->out_num;
> -        iov2 =3D iov =3D g_memdup(elem->out_sg, sizeof(struct iovec) * e=
lem->out_num);
> +        iov2 =3D iov =3D g_memdup2(elem->out_sg,
> +                               sizeof(struct iovec) * elem->out_num);
>          s =3D iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
>          iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
>          if (s !=3D sizeof(ctrl)) {
> --
> 2.27.0
>


