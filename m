Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A45863CF80
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 08:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0H7n-0006Ji-P1; Wed, 30 Nov 2022 02:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0H7D-0006GA-9x
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0H6z-0002K0-Lf
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669791749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozOGXxURZHsjxMKp5d3gaWtz3O2aMDflJnqNUnSdLCE=;
 b=GJqzBFrsj71G/Ew/kFh590YbhngUsGUg6q/Ru9FEDkEP0sNfiuP4FbK3w27rWEj9XjE30M
 aOFtHPMcRcQ6LKNFV0w1DCbg/8CV5JNpRTVDJstpCvHEaNJch6rdWb+Q0fe15Fu0jkT2B5
 whbadRtt3zLCrA8Xn2wx6b2zEHO7Akk=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-3gke3--BNcCGsJ9DQsmmAQ-1; Wed, 30 Nov 2022 02:02:27 -0500
X-MC-Unique: 3gke3--BNcCGsJ9DQsmmAQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 r65-20020acaf344000000b0035a1d791805so6432684oih.19
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 23:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozOGXxURZHsjxMKp5d3gaWtz3O2aMDflJnqNUnSdLCE=;
 b=IH0Al8X1qXIZLYACqVxYpg7FUksSEUyPL6BGIsA2bqJ7mjNBB9xzIjhNpoq4ghAK2/
 PCtEMtfsuAkaqPnKhqVzmAe0yY97MQVRoA9xUaetXqQyif0iDQrWqb1kMQNjbcguhHBz
 srSgCOeiGwU5Xemlmt+vxSx4Hiiz66TFbseCru5R+Apo4YwiGOlzNCwU5y5GpbvkpPZ2
 8gWJABQC/hRn43T0RiSmt6uZo+Qum7pm95FdcRSCHcYsYb9TS/gS+sE7ShOQ18SfEj+I
 Xw/KLkrDCwTfRgH0w2IolThUl/yl8VhqoQE73dpdZVFBY+r+gxyWKYzMei4RGX3pv45N
 dUOQ==
X-Gm-Message-State: ANoB5plleU0Mdp/+cgkIiuk0v5kaYde7GTYCpfYMvEzWzC8FY89q4HL9
 ZrI98JAjeW04M1wnK/leuNRnz9l9CAU4p/lZzMSoBHCsKUS5w2IaSRFoBXpMukzxmAexyTEemJs
 ggeTQm4HpLOD4QP4mzknhRGj4BNI1qho=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr22935955oab.35.1669791746968; 
 Tue, 29 Nov 2022 23:02:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59qjXRZYiEA/ICZ1zq7IUu//j2RFdXDxXtQ4atd8KQDO/+VDOisfT9icrLnxIIJTDyAFUyOrJ2Vh5VQ/wznlY=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr22935940oab.35.1669791746818; Tue, 29
 Nov 2022 23:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-5-eperezma@redhat.com>
In-Reply-To: <20221124173314.2123015-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 15:02:15 +0800
Message-ID: <CACGkMEuzvELivmN=NO1vrz8pnuvMSWEpYaQtqBygSFqj8Nu5Zw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in
 vhost-vdpa
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> So qemu emulates it even in case the device does not support it.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  net/vhost-vdpa.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 8172aa8449..79f022c2bf 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -72,7 +72,6 @@ const int vdpa_feature_bits[] =3D {
>      VIRTIO_F_RING_RESET,
>      VIRTIO_NET_F_RSS,
>      VIRTIO_NET_F_HASH_REPORT,
> -    VIRTIO_NET_F_GUEST_ANNOUNCE,
>      VIRTIO_NET_F_STATUS,
>      VHOST_INVALID_FEATURE_BIT
>  };
> --
> 2.31.1
>


