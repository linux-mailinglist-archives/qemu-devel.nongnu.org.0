Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8894E69AA4B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:27:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSysI-0005lg-PH; Fri, 17 Feb 2023 06:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSyrw-0005lG-NR
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:25:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSyrt-000557-SQ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676633129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXVicMbidsMiwyeFpsw5q02eiyi6mR1EFV8Dvi9qbEU=;
 b=P9XmPk2s4lcmf9zuU+cth8v92vfBBF8yfqpUy/F6281e72IbGl7L2DUQ1qnyWKk2HO/0Le
 4D3jJyaX3RvKFoHzZRuNfwrKOdHTPml0vFv0GpsbzbtiUX+boB8GGfEpZbunS9n7QLFNW2
 3vv1j39kOrNRDKCUdSatUawkU6aJ+pk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-5cu1Q6BRMN-ALO5ei0mudQ-1; Fri, 17 Feb 2023 06:25:28 -0500
X-MC-Unique: 5cu1Q6BRMN-ALO5ei0mudQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 77-20020a250d50000000b0074747131938so591950ybn.12
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 03:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXVicMbidsMiwyeFpsw5q02eiyi6mR1EFV8Dvi9qbEU=;
 b=uKSoU4MvUUQxCQ327arqKmauY4/rDdCWKQ5lTloGbsAwpBBd6LVg1ilpBUt4VAieGQ
 ABQYTjNkTznDACq9XsCeEhOwLfgp5bYUhOQTml2225CcC+cd8SS1R0v5iqIOfDfsYlGv
 JkvRkAU0r3g0+vwzOpWTQTNKio3SNRovAACzKwqdfM0hxc78hLVknYmViuFdzBsuBnqQ
 ykKAe6hbXQV+Gf/xcUnk0IjKzhp3Kuhx/bE0V4f1pck9o3S8Xc2OJzb8iFjFjwhWZTVg
 zL00nrZDIv9UBCbzEQaSWEFN9J62a2emJUcsa6fv+Jm3PdEa6zIGz6hae4VPIJWply5M
 ahzQ==
X-Gm-Message-State: AO0yUKVPC4xpkfaM3cn34rV4eSDoRMb10t/aDAuOwD2oLyvsUVO8+/xh
 psv/yowj5QBXtRHudMDKZ7M6k77GwCcPtWmvCzBGi30ZiJUazJmx0AW/WowPnhoRBr76vmy3IHp
 qRrTZFOAGvPsUeqwD+rxZdI45qZyLc3k=
X-Received: by 2002:a25:9983:0:b0:802:4849:af69 with SMTP id
 p3-20020a259983000000b008024849af69mr1215863ybo.13.1676633128164; 
 Fri, 17 Feb 2023 03:25:28 -0800 (PST)
X-Google-Smtp-Source: AK7set91lOdtguiYqHmnC/94R77OJmw3pUCVjKmezrcrukZeqZDQMbRwjHyjkzvm7crTuGd613+DnlKyCeybgreL1RY=
X-Received: by 2002:a25:9983:0:b0:802:4849:af69 with SMTP id
 p3-20020a259983000000b008024849af69mr1215862ybo.13.1676633127941; Fri, 17 Feb
 2023 03:25:27 -0800 (PST)
MIME-Version: 1.0
References: <20230217104219.1675667-1-lvivier@redhat.com>
In-Reply-To: <20230217104219.1675667-1-lvivier@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 17 Feb 2023 12:24:51 +0100
Message-ID: <CAJaqyWfvL0vNu6nT6sKHLATdW7QBwZ6NdW2t4RiVBtiVBARiuA@mail.gmail.com>
Subject: Re: [PATCH] vhost: svq: fix uninitialized variable
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 17, 2023 at 11:42 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> The problem has been reported by gcc with CFLAGS=3D-O3:
>
> .../hw/virtio/vhost-shadow-virtqueue.c: In function =E2=80=98vhost_svq_po=
ll=E2=80=99:
> .../hw/virtio/vhost-shadow-virtqueue.c:538:12:
> error: =E2=80=98len=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-u=
ninitialized]
>   538 |     return len;
>       |            ^~~
>
> vhost_svq_get_buf() returns NULL if SVQ is empty but doesn't set len to 0=
,
> and vhost_svq_poll() returns len without checking the return of
> vhost_svq_get_buf(). So if the SVQ is empty vhost_svq_poll() can return
> an random value.
>

s/an random/a random/.

I think this solves the same as
https://www.mail-archive.com/qemu-devel@nongnu.org/msg939383.html ?

Thanks!

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 430729635815..31cf642db267 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -420,6 +420,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShado=
wVirtqueue *svq,
>      vring_used_elem_t used_elem;
>      uint16_t last_used, last_used_chain, num;
>
> +    *len =3D 0;
>      if (!vhost_svq_more_used(svq)) {
>          return NULL;
>      }
> --
> 2.39.1
>


