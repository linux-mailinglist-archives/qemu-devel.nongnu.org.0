Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A45829C3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:36:58 +0200 (CEST)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGj5k-0005v2-VT
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGj1t-0003X1-Ux
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGj1c-0006CH-Mf
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658935958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l1gu6hqPYwHzWRykITBLC8u+IW1ocpfZ34urOhe4xjc=;
 b=YZf7OSrw2VsDGTjXLKcEYG9sGxAIL4aZcAqF0vcIt/3UaVNrML8OqTySAfKiJ1T994vwwZ
 5Xr5P4HrAD/dEYhmoSC5JLfo4ArGtEfvd4lV/EWjg/aU2HqumdQfaBUDtV2ZAvCLbqNRUB
 mRD5vNma01zfx9aaJdlVPg8yw7zKBrs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-lVtPQlS-NdOEAiXZZY6oBg-1; Wed, 27 Jul 2022 11:32:36 -0400
X-MC-Unique: lVtPQlS-NdOEAiXZZY6oBg-1
Received: by mail-wr1-f69.google.com with SMTP id
 n10-20020a5d6b8a000000b0021da91e4a64so3070325wrx.8
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=l1gu6hqPYwHzWRykITBLC8u+IW1ocpfZ34urOhe4xjc=;
 b=nW4KKssUExb+1unM+62i4g0db18FOtxiszh9GMWCqMRi0Ljr/FCLzJ1CSp8Q3N0MIQ
 ULP5Z/3tWznq9Ftm3PT1zeyBEWftjGk7pN5fm9o4LwLlN/MRbChbwLQMQnWIFkq9VQ+k
 fL79GC3/zR+077GiS2DRfJx9CUnDAc/sURFraZsUVaKIdNbDsOB4R6TPTUL0Dv4GJSGs
 82m/B3ITLaseaoz7JKi4uvd3PjdlM5Fuqv9fFKc0rOai4dPXwF4l4GaH6FErmTta+bFK
 gzczicojQQIeFI1xr7UlHbReXiqtCjLfmbjctrjxmjCcyq6EButDFrawul1VMmy9DJTO
 3uNg==
X-Gm-Message-State: AJIora8JMaK5JrIqpLF+DAT36Ea0x1Wk4BsUSt2ie1J/jh7JW2+FSVXk
 Q0WM8JIuHDkF2DHVlL4v+1IgoL5dezEXPqAES095oGNExcrbN5jd3EBIpYyPOouZ3TpMEF6qza8
 tFAMo0ZU0t2MZmfY=
X-Received: by 2002:a05:600c:358d:b0:3a3:2fe2:7d5e with SMTP id
 p13-20020a05600c358d00b003a32fe27d5emr3590521wmq.77.1658935955213; 
 Wed, 27 Jul 2022 08:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s78uW9F3J7Px0JtHHPc3MLnOKDTal+WRtX0xxCFgQk10ZYtECeKvcqAZIgZnGQywIDQe0Wiw==
X-Received: by 2002:a05:600c:358d:b0:3a3:2fe2:7d5e with SMTP id
 p13-20020a05600c358d00b003a32fe27d5emr3590489wmq.77.1658935954617; 
 Wed, 27 Jul 2022 08:32:34 -0700 (PDT)
Received: from redhat.com ([2.52.132.243]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c1d8200b003a32251c3f9sm3000285wms.5.2022.07.27.08.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:32:34 -0700 (PDT)
Date: Wed, 27 Jul 2022 11:32:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Message-ID: <20220727112737-mutt-send-email-mst@kernel.org>
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 27, 2022 at 12:51:31PM +0200, Claudio Fontana wrote:
> Hi Michael and all,
> 
> I have started researching a qemu / ovs / dpdk bug:
> 
> https://inbox.dpdk.org/dev/322122fb-619d-96f6-5c3e-9eabdbf3819a@redhat.com/T/
> 
> that seems to be affecting multiple parties in the telco space,
> 
> and during this process I noticed that qemu/hw/virtio/virtio.c does not do a full virtio reset
> in virtio_set_status, when receiving a status value of 0.
> 
> It seems it has always been this way, so I am clearly missing / forgetting something basic,
> 
> I checked the virtio spec at https://docs.oasis-open.org/
> 
> and from:
> 
> "
> 4.1.4.3 Common configuration structure layout
> 
> device_status
> The driver writes the device status here (see 2.1). Writing 0 into this field resets the device.
> 
> "
> 
> and
> 
> "
> 2.4.1 Device Requirements: Device Reset
> A device MUST reinitialize device status to 0 after receiving a reset.
> "
> 
> I would conclude that in virtio.c::virtio_set_status we should unconditionally do a full virtio_reset.
> 
> Instead, we have just the check:
> 
>     if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
>         (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
>         virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
>     }
> 
> which just sets the started field,
> 
> and then we have the call to the virtio device class set_status (virtio_net...),
> but the VirtioDevice is not fully reset, as per the virtio_reset() call we are missing:
> 
> "
>     vdev->start_on_kick = false;
>     vdev->started = false;
>     vdev->broken = false;
>     vdev->guest_features = 0;
>     vdev->queue_sel = 0;
>     vdev->status = 0;
>     vdev->disabled = false;
>     qatomic_set(&vdev->isr, 0);
>     vdev->config_vector = VIRTIO_NO_VECTOR;
>     virtio_notify_vector(vdev, vdev->config_vector);
> 
>     for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>         ... initialize vdev->vq[i] ...
>     }
> "
> 
> Doing a full reset seems to fix the problem for me, so I can send tentative patches if necessary,
> but what am I missing here?
> 
> Thanks,
> 
> Claudio
> 
> -- 
> Claudio Fontana
> Engineering Manager Virtualization, SUSE Labs Core
> 
> SUSE Software Solutions Italy Srl


So for example for pci:

    case VIRTIO_PCI_STATUS:


	....

        if (vdev->status == 0) {
            virtio_pci_reset(DEVICE(proxy));
        }

which I suspect is a bug because:

static void virtio_pci_reset(DeviceState *qdev)
{
    VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
    VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
    PCIDevice *dev = PCI_DEVICE(qdev);
    int i;

    virtio_bus_reset(bus);
    msix_unuse_all_vectors(&proxy->pci_dev);

    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
        proxy->vqs[i].enabled = 0;
        proxy->vqs[i].num = 0;
        proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
        proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
        proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
    }


so far so good

    if (pci_is_express(dev)) {
        pcie_cap_deverr_reset(dev);
        pcie_cap_lnkctl_reset(dev);

        pci_set_word(dev->config + dev->exp.pm_cap + PCI_PM_CTRL, 0);
    }

this part is wrong I think, it got here by mistake since the same
function is used for bus level reset.

Jason, Marcel, any input?

-- 
MST


