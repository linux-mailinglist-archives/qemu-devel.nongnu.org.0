Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B7E58A528
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:53:07 +0200 (CEST)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJoOY-0003HX-8t
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoLv-00082L-98
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoLs-0004Ee-Fx
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659671419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0IivqfMEH7IzEX1fXxP1URvC0PiG1qvgka+B0O16oo=;
 b=V4V6N+iUEr6EJN85VmzdXmyE2KUJnF6wrD2LTnM7OqlEOd3fo5WBKcn941ygxyunaPp6CN
 rrBz/q+2QQe9+9mIVR7jbT6c1EnHRv3f6tdNgOFPgLQAyDx8CA4++20unyn59ll92Dvcyd
 +Ia8DlmKihLg0z6xqWizU/XtJTTMeA4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-bA4Jd8EAMPuzgQWgjYrZRw-1; Thu, 04 Aug 2022 23:50:18 -0400
X-MC-Unique: bA4Jd8EAMPuzgQWgjYrZRw-1
Received: by mail-lf1-f71.google.com with SMTP id
 x29-20020ac259dd000000b0048af0e04887so290660lfn.12
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 20:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w0IivqfMEH7IzEX1fXxP1URvC0PiG1qvgka+B0O16oo=;
 b=bgPtMn1BbhL3I/H0/mSqtP7AyPAe10Ff9OkBulakFHXu20XUdepK6NRryTjiutuFvu
 tbihP3P+pqKloXhUpBiqEcUgqq9Xc+MqnO0qAe4DBROCj28O7yEnyIaEW68eAWY6iKsw
 3uex2zLHljWucA2+1yOlZyNwKTLYywTLx6P2wzg/j4NduredzpqSWydn3pKsgh6RPv5R
 FHwVoyHGbXDCZEgmtf3TmmqZs2JQjfnio6aN9KqL482kQmUOT/m4QR0PxveTLjdG6fou
 wO33nm/6RD45KfdjLbn3VseoFiXv26f/aYwPy4j/k09kkUoDPo+0UvHGjRyKRho3+ieX
 wZqg==
X-Gm-Message-State: ACgBeo3r85T9AwVPq1/+4EUk8RWxsfONRS5KfUNqDJtmlkjA0/Bq8KVg
 LBI4twQhWspmwXIamcQaUxMSV0F5f8G3cT0W6X/bavCCsRzgWPVdfdOfHWh4A2I/U0EWaOcSh02
 jcHjgoCBtA4Vs3vMiov+ADPMcwoQiSAc=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr1775758lfl.641.1659671417115; 
 Thu, 04 Aug 2022 20:50:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6pZah1I7wqzyO9Bez+psD46Fkzt/Yx5FQQkZU/spgN653HW7JTYHEnUyrzzg3o2VYwcq2UL4crSPVt+m0BVnI=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr1775738lfl.641.1659671416945; Thu, 04
 Aug 2022 20:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-5-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Aug 2022 11:50:05 +0800
Message-ID: <CACGkMEtTVr7wUwdkzNDdCYfs7cuaFBGkTgqF1CBDdwPtzTJ2ZQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] vhost: Do not depend on !NULL VirtQueueElement
 on vhost_svq_flush
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> Since QEMU will be able to inject new elements on CVQ to restore the
> state, we need not to depend on a VirtQueueElement to know if a new
> element has been used by the device or not. Instead of check that, check
> if there are new elements only using used idx on vhost_svq_flush.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

> v6: Change less from the previous function
> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 1b49bf54f2..f863b08627 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -499,17 +499,20 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
>  size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
>  {
>      int64_t start_us =3D g_get_monotonic_time();
> +    uint32_t len;
> +
>      do {
> -        uint32_t len;
> -        VirtQueueElement *elem =3D vhost_svq_get_buf(svq, &len);
> -        if (elem) {
> -            return len;
> +        if (vhost_svq_more_used(svq)) {
> +            break;
>          }
>
>          if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
>              return 0;
>          }
>      } while (true);
> +
> +    vhost_svq_get_buf(svq, &len);
> +    return len;
>  }
>
>  /**
> --
> 2.31.1
>


