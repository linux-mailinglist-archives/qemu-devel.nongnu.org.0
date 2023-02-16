Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51DF699640
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:49:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSecq-0008WQ-8R; Thu, 16 Feb 2023 08:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvaro.karsz@solid-run.com>)
 id 1pSeco-0008VO-1a
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:48:38 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alvaro.karsz@solid-run.com>)
 id 1pSecm-0001Uh-BT
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:48:37 -0500
Received: by mail-pf1-x434.google.com with SMTP id ct17so1467284pfb.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtprkMmgE7hoJ6Y8aJ3Nve9pxuJnzGGALFqVXwWI6js=;
 b=7r+zhVsO05E4aQwd42ejOPV3GO7RVgTz0oj/B1uTxz5YPKbOYir3V69Jx8jPtIz13u
 xo2OJ15xoixlo7UlVM3HJjYCFfYNRhmugxRPZ3eiDZKhPLHfWDawV+fPH82MSWfBiiIp
 0O+2RkKYJBh/XRFDBZXgegv/WT73R71zsGFYDrw8vOUc80kpJTTQ2KT1y/ohQLAetETQ
 RTyuEmYE7A5N9YfaMIhZ9ltfMvk6uG2ajUXIcZg/GrOA9X1Oz9gAeUpqcM6mtsEkgjn/
 X5WWk7rCqALZnHEiDdvbvXC9Zd4gkusWPeJj4xROxIYprYEeBkHRsLc8VOz3Z6lEsYlp
 O2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtprkMmgE7hoJ6Y8aJ3Nve9pxuJnzGGALFqVXwWI6js=;
 b=dt/17yrrw3X0U9+ofNvEezJp2mTDUDXxrD4uj2kg4uxMJU/MZXuEHY5spGh1X0L5Gr
 YTF1dev9e+C9jp/qPpI0n1O+MfflVJZPceN62GDj9Jy+CanAj7wdWFwlusbDmVBcl718
 iZtx+nfZr2fiRktnUAn82d4u5ZJbvrwCKnUD4bt5P0pHPxtx2XAK1yiMlm/KVcOMnv97
 miwXomO+eEXZjhea6t8uQG6lUuiJ/gs9almlfhK4FfxA2H3Fh4bRbI937wH/GeGC7FGN
 AIm63cxhdQhdKBRxLLTCHH0M561Q4lH+OGCPFvhP/6Kyrkbt2ASbnpkeao6ua+N4AnaS
 7mmg==
X-Gm-Message-State: AO0yUKV7pzqDNlZ1+DXGwNiWTOW+m+CcLSdVnxVePknrvdMQ5jXAOC9L
 0cmlmRplUGSHRI9/l9qTT/0UdIbrm28VRFqbxpIzqQ==
X-Google-Smtp-Source: AK7set9Ibvt/gd41trfRELwqc0Ybl60labYoMsG/vCNdC7KGVO2grQsGWkcJBYvltqVAZCKYFh8StVF+jNDkP62nYdk=
X-Received: by 2002:a63:f508:0:b0:4fb:d8d:2362 with SMTP id
 w8-20020a63f508000000b004fb0d8d2362mr882406pgh.8.1676555314430; Thu, 16 Feb
 2023 05:48:34 -0800 (PST)
MIME-Version: 1.0
References: <20230215173850.298832-1-eperezma@redhat.com>
 <20230215173850.298832-5-eperezma@redhat.com>
In-Reply-To: <20230215173850.298832-5-eperezma@redhat.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Thu, 16 Feb 2023 15:47:57 +0200
Message-ID: <CAJs=3_Ci0m2wGYmw6cbdmJmeM+Gv05z2sJ_mdnAbpTRm9pbP5w@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] vdpa: add vhost_vdpa_suspend
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Cindy Lu <lulu@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, longpeng2@huawei.com, 
 virtualization@lists.linux-foundation.org, 
 Harpreet Singh Anand <hanand@xilinx.com>, si-wei.liu@oracle.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: permerror client-ip=2607:f8b0:4864:20::434;
 envelope-from=alvaro.karsz@solid-run.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

Hi,

> The function vhost.c:vhost_dev_stop fetches the vring base so the vq
> state can be migrated to other devices.  However, this is unreliable in
> vdpa, since we didn't signal the device to suspend the queues, making
> the value fetched useless.
>
> Suspend the device if possible before fetching first and subsequent
> vring bases.
>
> Moreover, vdpa totally reset and wipes the device at the last device
> before fetch its vrings base, making that operation useless in the last
> device. This will be fixed in later patches of this series.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 19 +++++++++++++++++++
>  hw/virtio/trace-events |  1 +
>  2 files changed, 20 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 1d0209d6ad..796f38d64e 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1109,6 +1109,24 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev =
*dev)
>      }
>  }
>
> +static void vhost_vdpa_suspend(struct vhost_dev *dev)
> +{
> +    struct vhost_vdpa *v =3D dev->opaque;
> +    int r;
> +
> +    if (!vhost_vdpa_first_dev(dev) ||
> +        !(dev->backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {

Shouldn't it be backend_cap?

