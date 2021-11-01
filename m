Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C17144126B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 04:35:06 +0100 (CET)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhO6C-0005tz-UP
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 23:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhO5Q-0005EZ-F8
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 23:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhO5M-0000lj-L0
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 23:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635737650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tegdXbIqPRLZhLqVzvjPUDB1wc4779t/qdXKyvykph0=;
 b=Qv4wk04SxKRwy89uaXN2bQgOPilbCG5iOVV3gJXbfqTZzL/kleYOoXALSRw5d7mlecLGsn
 M1Ir96CG+SNBkO3TD/iQln+FGs6NA1gvqE6MU0+LJ68RjAAnBEhzJpWnfqN8cYIPP8PWDI
 N5vcl3MDzjt7scLYKUALIGe4qeP7gXk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-ULSiRXT8OheFGB_MU5SMxw-1; Sun, 31 Oct 2021 23:34:09 -0400
X-MC-Unique: ULSiRXT8OheFGB_MU5SMxw-1
Received: by mail-lj1-f198.google.com with SMTP id
 n9-20020a2e9049000000b00212acec7473so5007903ljg.22
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 20:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tegdXbIqPRLZhLqVzvjPUDB1wc4779t/qdXKyvykph0=;
 b=LEmIuNH4u7YwDNGJ2ewuMaHsRJKrxXYSKMzcWAA1usny59pnvIV92PAFHXruHcLN83
 ei+yUMFZ8E/GKgY1Zd00wRUO/3VBCagjeVbNi6OoMeb3CWEWLTCz2mS/D3J05ZqKollh
 Yb/EEJdE9Cei/v4mFh4f2RaK1iz+ra71jHr8QhB4UPfGqkwTFlSO/IKDiKxhW43ddCbW
 YoL8U46hSxJA9EbnyvPgUySofjkR5o3ackWN17vutvPyAHZpf37kubXbxZ1gxoyX0/7m
 u0QOkuYO/g1qZLgsVLMync2F6Oo+Nbcw/drQCH20OXSaK+R65LOR/mZMOxiovykMV9EZ
 Ck2A==
X-Gm-Message-State: AOAM532vgWp9eBXAVXyMNwvTv36Um9DPvzQmv2VoiEmabW1wLbRY9gvz
 kdH0EvkoQ3k+fJgq71whzavZ66v0MjHt1Pf7z1YnZNOBpjaTdg+jcDVTbo26KTl/H+W7WDn5iLn
 eB2aJqM5R953lYgGlodT8lVyk5CG0WqI=
X-Received: by 2002:a05:6512:1291:: with SMTP id
 u17mr26236900lfs.84.1635737647614; 
 Sun, 31 Oct 2021 20:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpVVKQd0OnoJwJwzmId3p9Pz1+PV9QE6626qzRH1UTCiHAQadIxrQk9pGMDXTfHMqqlxLb9rwQvdzDXykBwNQ=
X-Received: by 2002:a05:6512:1291:: with SMTP id
 u17mr26236871lfs.84.1635737647232; 
 Sun, 31 Oct 2021 20:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
In-Reply-To: <20211029141608.1728855-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 1 Nov 2021 11:33:56 +0800
Message-ID: <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 10:16 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> The -1 assumes that all devices with no cvq have an spare vq allocated
> for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be the
> case, and the device may have a pair number of queues.
>
> To fix this, just resort to the lower even number of queues.
>
> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virt=
io device")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/vhost_net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 0d888f29a6..edf56a597f 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState=
 *ncs,
>      NetClientState *peer;
>
>      if (!cvq) {
> -        last_index -=3D 1;
> +        last_index &=3D ~1ULL;
>      }

The math here looks correct but we need to fix vhost_vdpa_dev_start() inste=
ad?

if (dev->vq_index + dev->nvqs - 1 !=3D dev->last_index) {
...
}

Thanks

>
>      if (!k->set_guest_notifiers) {
> --
> 2.27.0
>


