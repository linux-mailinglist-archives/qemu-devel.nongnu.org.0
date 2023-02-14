Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E878469597F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 07:55:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpCI-00005a-Qy; Tue, 14 Feb 2023 01:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRpCG-00005M-SI
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRpCF-0008Mz-0U
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676357625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VgV7owhtHI5ZxmViUBZqT4KBML5LI81/EFoipc4Doro=;
 b=Kvzsp5ovjKIsWuDElu/XCyOn4pQIM3cT0xiE2v6pVKJ4kCPr41UDo1WyBBHqaZww47Z3iS
 RfzJmKhHz01Ei2PoNjTQkuHNiAUGd6yQSvldBUkZXxEznTzckQOU0+FoAfrW4X8y8KuMl2
 XyivqFdk5tle45jnIY9+AyhCw0HSaZk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-D9dSKWOEOuOLfEhgTiX7Ew-1; Tue, 14 Feb 2023 01:53:44 -0500
X-MC-Unique: D9dSKWOEOuOLfEhgTiX7Ew-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-4bdeb1bbeafso149503317b3.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 22:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VgV7owhtHI5ZxmViUBZqT4KBML5LI81/EFoipc4Doro=;
 b=bM2YqX+Udo5O6aepdYADENGCPPomMEmzVMvaBUKSsIvsQdT62/CwywFAatudNyUEZy
 Y7yEq5sltCCBcoU9LGsbWCT/i1qp1jloxRGi85yU9dcjwH+CiezFlQ9r5orYfcf+EgoS
 DDWprSFaq9Pf53/J4vb5sWdStO9D1stoZs6s+GMxYd5BB6X4Ejls0WstRoqJjFWNVJdn
 1iDtnI08e9i/R/X0KHHd5vj6UO+QeP+ZRYOU/AHg4Xsp5zt5ekLh/AEny0gu3XxeL0ra
 IF5K3JNQ+QrtMousP9kYVUjTy5JOmmzrvO7xpFKP3hNfqR0wKBqtPQHUK6v6LriCCbup
 TlCw==
X-Gm-Message-State: AO0yUKU6gyhGuLZaOq1bf8g1gVCh0q7XqYK0fPsnmoiK5MxGGTReXiej
 sVmrnuO1BXneAUrOk3OxxEM6g/CxfyWxgdpJg9sEXjKVGblpzdRq4+Cf+2MaiDcmkt1Z1zry2OB
 ygMUnVfhM8ABEBCt2rJEKzOzmAYFpwEoYDGX2
X-Received: by 2002:a0d:e944:0:b0:52e:db9c:9ef2 with SMTP id
 s65-20020a0de944000000b0052edb9c9ef2mr80751ywe.269.1676357623830; 
 Mon, 13 Feb 2023 22:53:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9CgeSkzHNPB9AXpwGg/Zybn0YxX0p20GR1BOW3QWneBn7zHsGd2CqEAWel0QiNjppUpttaHJ5/LrsJKTqCYXI=
X-Received: by 2002:a0d:e944:0:b0:52e:db9c:9ef2 with SMTP id
 s65-20020a0de944000000b0052edb9c9ef2mr80744ywe.269.1676357623617; Mon, 13 Feb
 2023 22:53:43 -0800 (PST)
MIME-Version: 1.0
References: <20230124161159.2182117-1-eperezma@redhat.com>
In-Reply-To: <20230124161159.2182117-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 14 Feb 2023 07:53:07 +0100
Message-ID: <CAJaqyWctGpCZrCYZa0hN60PG+5LA+jFL2C=_k+bahdBhKHBK+Q@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: clear guest_announce feature if no cvq backend
To: qemu-devel@nongnu.org
Cc: leiyang@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 gautam.dawar@amd.com, 
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Jan 24, 2023 at 5:32 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Since GUEST_ANNOUNCE is emulated the feature bit could be set without
> backend support.  This happens in the vDPA case.
>
> However, backend vDPA parent may not have CVQ support.  This causes an
> incoherent feature set, and the driver may refuse to start.  This
> happens in virtio-net Linux driver.
>
> This may be solved differently in the future.  Qemu is able to emulate a
> CVQ just for guest_announce purposes, helping guest to notify the new
> location with vDPA devices that does not support it.  However, this is
> left as a TODO as it is way more complex to backport.
>
> Tested with vdpa_net_sim, toggling manually VIRTIO_NET_F_CTRL_VQ in the
> driver and migrating it with x-svq=3Don.
>

Friendly ping about this patch, as it fell through the cracks if I'm not wr=
ong.

Thanks!

> Fixes: 980003debddd ("vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in =
vhost-vdpa")
> Reported-by: Dawar, Gautam <gautam.dawar@amd.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/virtio-net.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 3ae909041a..09d5c7a664 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -820,6 +820,21 @@ static uint64_t virtio_net_get_features(VirtIODevice=
 *vdev, uint64_t features,
>          features |=3D (1ULL << VIRTIO_NET_F_MTU);
>      }
>
> +    /*
> +     * Since GUEST_ANNOUNCE is emulated the feature bit could be set wit=
hout
> +     * enabled. This happens in the vDPA case.
> +     *
> +     * Make sure the feature set is not incoherent, as the driver could =
refuse
> +     * to start.
> +     *
> +     * TODO: QEMU is able to emulate a CVQ just for guest_announce purpo=
ses,
> +     * helping guest to notify the new location with vDPA devices that d=
oes not
> +     * support it.
> +     */
> +    if (!virtio_has_feature(vdev->backend_features, VIRTIO_NET_F_CTRL_VQ=
)) {
> +        virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
> +    }
> +
>      return features;
>  }
>
> --
> 2.31.1
>
>


