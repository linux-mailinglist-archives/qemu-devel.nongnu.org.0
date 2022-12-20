Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532176529B9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 00:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ljT-00028W-Ab; Tue, 20 Dec 2022 18:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ljQ-00026a-Oo
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ljO-0008N2-Dt
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671577745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gAgd/lJBAaeawCVN8dZfvqIfsFRW8Gwdjs2HlhqDajg=;
 b=amcNr3BHgtrcIc9TEXJYAGecAkVn2x3UVDZDSrhkfpmaJLGznh9GWw2kMD3Ixd1YRsfTxa
 dwn9Fkk0l2yPleCwpKqcDn6dZ5EZwERlziDxJoZbQLeQND282qHyIpCjTutWmyLM9EPTl0
 apx813/n73TrDjkAKuJbQIpQDa3P8yw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-FlBxKjt3PX-RJv5JfPVR7w-1; Tue, 20 Dec 2022 18:09:04 -0500
X-MC-Unique: FlBxKjt3PX-RJv5JfPVR7w-1
Received: by mail-qt1-f198.google.com with SMTP id
 g12-20020ac870cc000000b003a8112df2e9so6161652qtp.9
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 15:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAgd/lJBAaeawCVN8dZfvqIfsFRW8Gwdjs2HlhqDajg=;
 b=aMRr55/+bje3BbHzz0+38HU6ZhIFkt2gRuw7W3lWh3yYrFDNqkJCz7VU8BC+lMx/OQ
 NsaRLJ4WE50GHQbNhlY3kpq+DTFYZqKfBN8OwLNeXPDwxhqosS9VqXqdIO5emgT2uwvE
 4NvdPNQs/GFTkx9Km6gkM+ZFXCCn+o7GIb9kNcC3qcFjDd0nfXI07vnOgQNf6msIj4AM
 uCpKmYMO2t/dF2S1Ht2MgwtCD2Crf0HtZbn0bs09TcsuQHJXu9lndhwxFMYSPiYWa0l5
 93PulQ+DpxViITEXyv2htu2+UuqtSZuUUKu6BltLTEctBetzeLV+YUrHHZPKcDilSA55
 il6g==
X-Gm-Message-State: ANoB5pmjZQBZqTPFf9WbkN8zer0J2tN6QrYwXj76OGvnEIbCs1VvgUbb
 QmXMT+belYqSKUSX9GFCTCgdZoBRTC600csUkD84eMohjD5I4E9jms23c7TgrtiYr3mLDoOr/Ou
 NaiLNyH4qZ4Sxc4o=
X-Received: by 2002:a05:622a:4c0a:b0:3a8:26b1:336a with SMTP id
 ey10-20020a05622a4c0a00b003a826b1336amr42172871qtb.17.1671577743396; 
 Tue, 20 Dec 2022 15:09:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf49w7lwLw6Gfjk1NgpVcFsBxM3uxBGVgMI26gcuRYbRQCz3Hqc6mPHdpBTc0b8Ixpnfv5GDQg==
X-Received: by 2002:a05:622a:4c0a:b0:3a8:26b1:336a with SMTP id
 ey10-20020a05622a4c0a00b003a826b1336amr42172830qtb.17.1671577743105; 
 Tue, 20 Dec 2022 15:09:03 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 h5-20020ac87145000000b003a69225c2cdsm8270571qtp.56.2022.12.20.15.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 15:09:02 -0800 (PST)
Date: Tue, 20 Dec 2022 18:08:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH RESEND v3 2/2] virtio: remove unnecessary host_features
 in ->get_features()
Message-ID: <20221220180511-mutt-send-email-mst@kernel.org>
References: <20221121155020.1915166-1-stefanha@redhat.com>
 <20221121155020.1915166-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121155020.1915166-3-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 21, 2022 at 10:50:20AM -0500, Stefan Hajnoczi wrote:
> Since at least commit 6b8f1020540c27246277377aa2c3331ad2bfb160 ("virtio:
> move host_features") the ->get_features() function has been called with
> host_features as an argument.
> 
> Some devices manually add host_features in ->get_features() although the
> features argument already contains host_features. Make all devices
> consistent by dropping the unnecessary code.
> 
> Cc: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Causes qos-test failures:

ok 65 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch
**
ERROR:../tests/qtest/vhost-user-test.c:889:wait_for_rings_started: assertion failed (ctpop64(s->rings) == count): (2 == 4)
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/multiqueue/subprocess [856811]) exit status: 1 (error)
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/multiqueue/subprocess [856811]) stdout: ""
# child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/multiqueue/subprocess [856811]) stderr: "**\nERROR:../tests/qtest/vhost-user-test.c:889:wait_for_rings_started: assertion failed (ctpop64(s->rings) == count): (2 == 4)\n"
**
ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/multiqueue/subprocess [856811]) failed unexpectedly
Bail out! ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/multiqueue/subprocess [856811]) failed unexpectedly
runone.sh: line 10: 856419 Aborted                 (core dumped) QTEST_QEMU_STORAGE_DAEMON_BINARY=./build/storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=build/x86_64-softmmu/qemu-system-x86_64 "$@"


> ---
>  hw/block/virtio-blk.c       | 3 ---
>  hw/char/virtio-serial-bus.c | 1 -
>  hw/net/virtio-net.c         | 3 ---
>  hw/scsi/vhost-scsi-common.c | 3 ---
>  hw/scsi/virtio-scsi.c       | 4 ----
>  hw/virtio/virtio-balloon.c  | 2 --
>  6 files changed, 16 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f717550fdc..a744012fec 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -983,9 +983,6 @@ static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
>  {
>      VirtIOBlock *s = VIRTIO_BLK(vdev);
>  
> -    /* Firstly sync all virtio-blk possible supported features */
> -    features |= s->host_features;
> -
>      virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
>      virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
>      virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index 7d4601cb5d..1414fb85ae 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -557,7 +557,6 @@ static uint64_t get_features(VirtIODevice *vdev, uint64_t features,
>  
>      vser = VIRTIO_SERIAL(vdev);
>  
> -    features |= vser->host_features;
>      if (vser->bus.max_nr_ports > 1) {
>          virtio_add_feature(&features, VIRTIO_CONSOLE_F_MULTIPORT);
>      }
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index aba12759d5..35b45eb6e3 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -777,9 +777,6 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>      VirtIONet *n = VIRTIO_NET(vdev);
>      NetClientState *nc = qemu_get_queue(n->nic);
>  
> -    /* Firstly sync all virtio-net possible supported features */
> -    features |= n->host_features;
> -
>      virtio_add_feature(&features, VIRTIO_NET_F_MAC);
>  
>      if (!peer_has_vnet_hdr(n)) {
> diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
> index 767f827e55..8b26f90aa1 100644
> --- a/hw/scsi/vhost-scsi-common.c
> +++ b/hw/scsi/vhost-scsi-common.c
> @@ -124,9 +124,6 @@ uint64_t vhost_scsi_common_get_features(VirtIODevice *vdev, uint64_t features,
>  {
>      VHostSCSICommon *vsc = VHOST_SCSI_COMMON(vdev);
>  
> -    /* Turn on predefined features supported by this device */
> -    features |= vsc->host_features;
> -
>      return vhost_get_features(&vsc->dev, vsc->feature_bits, features);
>  }
>  
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 6f6e2e32ba..40e10322fb 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -817,10 +817,6 @@ static uint64_t virtio_scsi_get_features(VirtIODevice *vdev,
>                                           uint64_t requested_features,
>                                           Error **errp)
>  {
> -    VirtIOSCSI *s = VIRTIO_SCSI(vdev);
> -
> -    /* Firstly sync all virtio-scsi possible supported features */
> -    requested_features |= s->host_features;
>      return requested_features;
>  }
>  
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 73ac5eb675..0e9ca71b15 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -796,8 +796,6 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
>  static uint64_t virtio_balloon_get_features(VirtIODevice *vdev, uint64_t f,
>                                              Error **errp)
>  {
> -    VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
> -    f |= dev->host_features;
>      virtio_add_feature(&f, VIRTIO_BALLOON_F_STATS_VQ);
>  
>      return f;
> -- 
> 2.38.1


