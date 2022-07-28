Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61EC583649
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 03:31:17 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGsMs-0001o9-7R
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 21:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGsJw-0000Bq-F6
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGsJr-0001ck-7H
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658971676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQ4ykk+YZNO3rfonDOxCau88TijzKe3q8Bp50A8vx+s=;
 b=MdkMFID6T8n129qbDHsghX4ziw47OPiuvK+BzJASp75fhhkZ5l/jMrYx6rRSE1OmFwRlP0
 dOf2pXktCJzJk/7EZxVM3jNNKsx4GG2mvuPwVF8bCPZ/JY7b7huSxmzNWdF0vH4qh5nrT8
 ocDzRXSQAmSxBOWuqhc3WCKjGRGf2BE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-51djoCqPObSlxAigao8PnA-1; Wed, 27 Jul 2022 21:27:55 -0400
X-MC-Unique: 51djoCqPObSlxAigao8PnA-1
Received: by mail-lf1-f69.google.com with SMTP id
 q21-20020a194315000000b0048a78fe600dso169781lfa.9
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 18:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zQ4ykk+YZNO3rfonDOxCau88TijzKe3q8Bp50A8vx+s=;
 b=p/z6Y1FEXRe9/YuxmzOrqICTWz0O3bB0mcyK/TdrKSahrWcsFkvgYvfqddE8Jg9SUM
 VtTx8tNs6Gh84y7DwWAlWcejE2lk+QaMF/UYiwTRWqDNPB8YDKHsoVBXsftXaPxAeNRD
 3lNk/kacY9TvvIpyhJLCn/luH2+jvdKxggpwafjUDmX4Zk/v0gG5H2XeEA01vhSp0HIn
 y9cBeI6dCxccpacO51gKob5wKyPuMS34wgi5HNcUmu93FXqy8nKcHZ/sX/v0/fKOBvYY
 D6jEWVssENe5ctXgFEccXqOgjbuidDeoMbEQ+4URMiIemnB88Z+DG7Pe57pWNWy3KM39
 ex/w==
X-Gm-Message-State: AJIora9YntFa74DLZcqSx87SDpKJfF88Aw4vcghBOnfZv71IZoJNRlAS
 efCsMmJ+WZzbOnsYcvFfwqDsoO/7tKnF7Euj50bU1y+cYHmFctUjmCf2O1IR2w6WmXEgQMG4MhZ
 bezvX7P0TG8EcE+3TkM8hKyFktkTtNM8=
X-Received: by 2002:a05:6512:2284:b0:48a:7c35:2729 with SMTP id
 f4-20020a056512228400b0048a7c352729mr9515839lfu.397.1658971674045; 
 Wed, 27 Jul 2022 18:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+uXcFOSwZ0ecMOGPR5GGrR6RMnyZzpa6D9NRwx63YKsHWcO1X//Z3vjBN1O9NPcxW9dgQtV2e4ARfycxoRrY=
X-Received: by 2002:a05:6512:2284:b0:48a:7c35:2729 with SMTP id
 f4-20020a056512228400b0048a7c352729mr9515828lfu.397.1658971673572; Wed, 27
 Jul 2022 18:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220727112737-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Jul 2022 09:27:42 +0800
Message-ID: <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Marcel Apfelbaum <marcel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 27, 2022 at 11:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jul 27, 2022 at 12:51:31PM +0200, Claudio Fontana wrote:
> > Hi Michael and all,
> >
> > I have started researching a qemu / ovs / dpdk bug:
> >
> > https://inbox.dpdk.org/dev/322122fb-619d-96f6-5c3e-9eabdbf3819a@redhat.com/T/
> >
> > that seems to be affecting multiple parties in the telco space,
> >
> > and during this process I noticed that qemu/hw/virtio/virtio.c does not do a full virtio reset
> > in virtio_set_status, when receiving a status value of 0.
> >
> > It seems it has always been this way, so I am clearly missing / forgetting something basic,
> >
> > I checked the virtio spec at https://docs.oasis-open.org/
> >
> > and from:
> >
> > "
> > 4.1.4.3 Common configuration structure layout
> >
> > device_status
> > The driver writes the device status here (see 2.1). Writing 0 into this field resets the device.
> >
> > "
> >
> > and
> >
> > "
> > 2.4.1 Device Requirements: Device Reset
> > A device MUST reinitialize device status to 0 after receiving a reset.
> > "
> >
> > I would conclude that in virtio.c::virtio_set_status we should unconditionally do a full virtio_reset.
> >
> > Instead, we have just the check:
> >
> >     if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
> >         (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
> >         virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
> >     }
> >
> > which just sets the started field,
> >
> > and then we have the call to the virtio device class set_status (virtio_net...),
> > but the VirtioDevice is not fully reset, as per the virtio_reset() call we are missing:
> >
> > "
> >     vdev->start_on_kick = false;
> >     vdev->started = false;
> >     vdev->broken = false;
> >     vdev->guest_features = 0;
> >     vdev->queue_sel = 0;
> >     vdev->status = 0;
> >     vdev->disabled = false;
> >     qatomic_set(&vdev->isr, 0);
> >     vdev->config_vector = VIRTIO_NO_VECTOR;
> >     virtio_notify_vector(vdev, vdev->config_vector);
> >
> >     for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> >         ... initialize vdev->vq[i] ...
> >     }
> > "
> >
> > Doing a full reset seems to fix the problem for me, so I can send tentative patches if necessary,
> > but what am I missing here?
> >
> > Thanks,
> >
> > Claudio
> >
> > --
> > Claudio Fontana
> > Engineering Manager Virtualization, SUSE Labs Core
> >
> > SUSE Software Solutions Italy Srl
>
>
> So for example for pci:
>
>     case VIRTIO_PCI_STATUS:
>
>
>         ....
>
>         if (vdev->status == 0) {
>             virtio_pci_reset(DEVICE(proxy));
>         }
>
> which I suspect is a bug because:
>
> static void virtio_pci_reset(DeviceState *qdev)
> {
>     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
>     VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
>     PCIDevice *dev = PCI_DEVICE(qdev);
>     int i;
>
>     virtio_bus_reset(bus);

Note that we do virtio_reset() here.

>     msix_unuse_all_vectors(&proxy->pci_dev);
>
>     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>         proxy->vqs[i].enabled = 0;
>         proxy->vqs[i].num = 0;
>         proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
>         proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
>     }
>
>
> so far so good
>
>     if (pci_is_express(dev)) {
>         pcie_cap_deverr_reset(dev);
>         pcie_cap_lnkctl_reset(dev);
>
>         pci_set_word(dev->config + dev->exp.pm_cap + PCI_PM_CTRL, 0);
>     }
>
> this part is wrong I think, it got here by mistake since the same
> function is used for bus level reset.
>
> Jason, Marcel, any input?

Yes, I think we don't need PCI stuff here. We do virtio reset not pci.

Thanks

>
> --
> MST
>


