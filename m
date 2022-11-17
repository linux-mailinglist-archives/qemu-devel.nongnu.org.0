Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1962D2E2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 06:46:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovXil-00030l-RH; Thu, 17 Nov 2022 00:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovXi6-0002nn-NM
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 00:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovXi2-0000La-WA
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 00:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668663910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56i049Aed0JKBuVol4TWmhK7+K9RgEQ60fNagERMDS8=;
 b=L9gI5UFZU0Vim0LGmQcH2qkEkpsf8Iakva392QEElv0ov54E3Ae7yyeQyyuXK+xsMi5BuJ
 BA9wSL9Bi9oytNncRq3dv4rewnsFovoE2P6SF9xyWvcEgynLiU+lCBLRvNybApjVBsNTbQ
 D+Qz1T466eAGQnocCeqGoWyGeeLNbc8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-XQ3xzOPNM4KM8_2kb4IaBQ-1; Thu, 17 Nov 2022 00:45:08 -0500
X-MC-Unique: XQ3xzOPNM4KM8_2kb4IaBQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 z15-20020a056808048f00b0035a08170a97so417942oid.2
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 21:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=56i049Aed0JKBuVol4TWmhK7+K9RgEQ60fNagERMDS8=;
 b=To3g3XDjIwQKT/Zh/t+QDQgPLD2buaqiwk5PXKFarfVyd8ZIuzl1mbGohI8nnZNo25
 a4ufIc8dT2+FYvgQDfK0WiKkzVm9VdjhK+fMPCscA8g2+vyRwbAWSfLWs6iqa/1FYANu
 gCaVoK3O+PVNSyyYRDg77Oo98YFZZEYWVsK8vQzsx3AkLsoZu0zBNSJgVA+suG1nJ7Cm
 s+9pIFjq5NfmlNXc/SN3n1DJyZbKg5gQVeY4RH5m7exZQVFWeRl+CG3XtzVLOAVHI/I4
 QXp5Up66iKUf5/8IBsZWvuCmWHkmT+A3jATukoOv2HJC2Sv3NG1bacKYTcox3Cd0xYEi
 vzgw==
X-Gm-Message-State: ANoB5plyYAMGNoO76qeCPiVE5AEX4sUzwyR0fp1jOg5nLdEGwdlEkdZL
 zdDYkTKadX5jcIkWqUze06syk5CKa4quACFUvGenfWAGPWVH3uxCjfss0P5n1gmOUu09zUA2q7c
 h0HlVvEnzFfzvK+2Fn/LfbXm1v6YwWv0=
X-Received: by 2002:a05:6808:220b:b0:359:f5eb:82ec with SMTP id
 bd11-20020a056808220b00b00359f5eb82ecmr416039oib.280.1668663907743; 
 Wed, 16 Nov 2022 21:45:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf76rMnpgnQjp6/ZhWLOS0qNtuIB6e3PWR7W+GcYDBtIVg+L09dpqBCuDpSDlzQEO/Uy3jtO6xdLIcbXnqVgd8o=
X-Received: by 2002:a05:6808:220b:b0:359:f5eb:82ec with SMTP id
 bd11-20020a056808220b00b00359f5eb82ecmr416026oib.280.1668663907571; Wed, 16
 Nov 2022 21:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20221116150556.1294049-1-eperezma@redhat.com>
 <20221116150556.1294049-7-eperezma@redhat.com>
In-Reply-To: <20221116150556.1294049-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Nov 2022 13:44:56 +0800
Message-ID: <CACGkMEv1D5eMz=j6CRYPc2Quve5Z3-ikDCeLcObiFYctnhYGLg@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v7 06/10] vdpa: Allocate SVQ unconditionally
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 16, 2022 at 11:06 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> SVQ may run or not in a device depending on runtime conditions (for
> example, if the device can move CVQ to its own group or not).
>
> Allocate the SVQ array unconditionally at startup, since its hard to
> move this allocation elsewhere.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost-vdpa.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 146f0dcb40..23efb8f49d 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -547,10 +547,6 @@ static void vhost_vdpa_svq_cleanup(struct vhost_dev =
*dev)
>      struct vhost_vdpa *v =3D dev->opaque;
>      size_t idx;
>
> -    if (!v->shadow_vqs) {
> -        return;
> -    }
> -
>      for (idx =3D 0; idx < v->shadow_vqs->len; ++idx) {
>          vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
>      }
> --
> 2.31.1
>


