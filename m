Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7182583E05
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 13:49:11 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH20s-0002gX-KU
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 07:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oH1tE-0007kI-IL
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 07:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oH1tA-00044d-6y
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 07:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659008471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=enSnMpvaX+527zoW/ahjBvCEO8NqpsHdhMh9TXPIKmY=;
 b=aL1QtdkuGLbT2YOXwCMXX73T+/9d4Qr+nd109Fti1Rra+nQ43vV6H0gWv/3khSJ8L07ZKe
 1VCmFmo321O67pF15f672qqov2pphOI2i4ZonUYaXbQHLgywLP5L4YE5YT/OGvcXW7P3U+
 T1L4Er0mbSRjcOf2zz4TSlowb6mMX0Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-hnsnCU65NBiXmoJ0px37DA-1; Thu, 28 Jul 2022 07:41:10 -0400
X-MC-Unique: hnsnCU65NBiXmoJ0px37DA-1
Received: by mail-ed1-f71.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso919993edx.19
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 04:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=enSnMpvaX+527zoW/ahjBvCEO8NqpsHdhMh9TXPIKmY=;
 b=y5GpvhZZfjtApv1WUrogrY/NL6b5gDwwiiFCehV9jKHHD1bwUbotif4qIhrU5ADc1U
 gUTF3V9dMY/BINGS1FPIjtUydt1mYy2Zb8YvfUFaCCCFrM159Yp3oJ1Hrvy9iWXrdmm6
 nL1bqy1fR92+BhM9Oxx7/gQ8QWAmeuaFbB5dkPDm+Frht424PL5kuRu6kf597WbWwjMA
 CYZQjcg/EznKHyUnapqty8h82IykxVnS8QFZ76NWpl8Sbkx0bMaeWaAL8ZSKLbotemNu
 kS9TNHmAwhgd7v8rXi7GIpCYRghc/ISsofQdu0RzuE3d+AUCToNHzJCi/m2aDidRpKQr
 kcZA==
X-Gm-Message-State: AJIora/INQLrZpuqfZn7ZeEk/oADVFtUdZ/R0/URqi8Jw8RE7YvEa5EV
 33gk+nUXnD8vkbzKeB3m1SmCSqvOqXEicYKOuINV/qHIy3o4r2WdqBv+WQuaTwOdvPpRbht/JIa
 pMlcJLcjzdm1EafY=
X-Received: by 2002:a05:6402:5249:b0:43c:cb3e:d7f8 with SMTP id
 t9-20020a056402524900b0043ccb3ed7f8mr5095705edd.56.1659008469019; 
 Thu, 28 Jul 2022 04:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1urxyvEYEf6YdKG/X0gshL9UuEwa/RIZEtMlewlCkzZHYANIkNn2ItN7LMnAsSyjBkCAj+iVg==
X-Received: by 2002:a05:6402:5249:b0:43c:cb3e:d7f8 with SMTP id
 t9-20020a056402524900b0043ccb3ed7f8mr5095674edd.56.1659008468468; 
 Thu, 28 Jul 2022 04:41:08 -0700 (PDT)
Received: from redhat.com ([2.54.183.236]) by smtp.gmail.com with ESMTPSA id
 q15-20020a17090676cf00b006fed93bf71fsm342124ejn.18.2022.07.28.04.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 04:41:07 -0700 (PDT)
Date: Thu, 28 Jul 2022 07:41:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel@redhat.com>
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Message-ID: <20220728073757-mutt-send-email-mst@kernel.org>
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
 <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
 <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Jul 28, 2022 at 09:43:56AM +0200, Claudio Fontana wrote:
> On 7/28/22 03:27, Jason Wang wrote:
> > On Wed, Jul 27, 2022 at 11:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>
> >> On Wed, Jul 27, 2022 at 12:51:31PM +0200, Claudio Fontana wrote:
> >>> Hi Michael and all,
> >>>
> >>> I have started researching a qemu / ovs / dpdk bug:
> >>>
> >>> https://inbox.dpdk.org/dev/322122fb-619d-96f6-5c3e-9eabdbf3819a@redhat.com/T/
> >>>
> >>> that seems to be affecting multiple parties in the telco space,
> >>>
> >>> and during this process I noticed that qemu/hw/virtio/virtio.c does not do a full virtio reset
> >>> in virtio_set_status, when receiving a status value of 0.
> >>>
> >>> It seems it has always been this way, so I am clearly missing / forgetting something basic,
> >>>
> >>> I checked the virtio spec at https://docs.oasis-open.org/
> >>>
> >>> and from:
> >>>
> >>> "
> >>> 4.1.4.3 Common configuration structure layout
> >>>
> >>> device_status
> >>> The driver writes the device status here (see 2.1). Writing 0 into this field resets the device.
> >>>
> >>> "
> >>>
> >>> and
> >>>
> >>> "
> >>> 2.4.1 Device Requirements: Device Reset
> >>> A device MUST reinitialize device status to 0 after receiving a reset.
> >>> "
> >>>
> >>> I would conclude that in virtio.c::virtio_set_status we should unconditionally do a full virtio_reset.
> >>>
> >>> Instead, we have just the check:
> >>>
> >>>     if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
> >>>         (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
> >>>         virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
> >>>     }
> >>>
> >>> which just sets the started field,
> >>>
> >>> and then we have the call to the virtio device class set_status (virtio_net...),
> >>> but the VirtioDevice is not fully reset, as per the virtio_reset() call we are missing:
> >>>
> >>> "
> >>>     vdev->start_on_kick = false;
> >>>     vdev->started = false;
> >>>     vdev->broken = false;
> >>>     vdev->guest_features = 0;
> >>>     vdev->queue_sel = 0;
> >>>     vdev->status = 0;
> >>>     vdev->disabled = false;
> >>>     qatomic_set(&vdev->isr, 0);
> >>>     vdev->config_vector = VIRTIO_NO_VECTOR;
> >>>     virtio_notify_vector(vdev, vdev->config_vector);
> >>>
> >>>     for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> >>>         ... initialize vdev->vq[i] ...
> >>>     }
> >>> "
> >>>
> >>> Doing a full reset seems to fix the problem for me, so I can send tentative patches if necessary,
> >>> but what am I missing here?
> >>>
> >>> Thanks,
> >>>
> >>> Claudio
> >>>
> >>> --
> >>> Claudio Fontana
> >>> Engineering Manager Virtualization, SUSE Labs Core
> >>>
> >>> SUSE Software Solutions Italy Srl
> >>
> >>
> >> So for example for pci:
> >>
> >>     case VIRTIO_PCI_STATUS:
> >>
> >>
> >>         ....
> >>
> >>         if (vdev->status == 0) {
> >>             virtio_pci_reset(DEVICE(proxy));
> >>         }
> >>
> >> which I suspect is a bug because:
> >>
> >> static void virtio_pci_reset(DeviceState *qdev)
> >> {
> >>     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
> >>     VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
> >>     PCIDevice *dev = PCI_DEVICE(qdev);
> >>     int i;
> >>
> >>     virtio_bus_reset(bus);
> > 
> > Note that we do virtio_reset() here.
> 
> 
> Yes, thank you, I completely overlooked it, I noticed this in Michael's response as well.
> 
> However we end up with multiple calls to k->set_status, one from the virtio_set_status call,
> and one from the virtio_bus_reset(), which is probably something we don't want.
> 
> All in all it is not clear what the meaning of virtio_set_status is supposed to be I think,
> and I wonder what the assumptions are among all the callers.
> If it is supposed to be an implementation of the virtio standard field as described, I think we should do the reset right then and there,
> but maybe the true meaning of the function is another one I couldn't understand, since _some_ of the cases are processes there.
> 
> And there is a question about ordering:
> 
> in virtio_pci we end up calling virtio_set_status(0), which gets us k->set_status(vdev, 0), which lands in virtio_net_set_status(0) and virtio_net_vhost_status,
> which causes a vhost_net_stop().
> Should we instead land in virtio_net_reset() first, by doing a virtio reset earlier when detecting a 0 value from the driver?


Well we want to first stop the backend and only then reset our
local state. Seems to make sense ...


> in the scenario I am looking at (with vhost-user, ovs/dpdk, and a guest testpmd application),
> the guest application goes away without any chance to signal (kill -9), then gets immediately restarted and does a write of 0 to status, while qemu and ovs still hold the state for the device.
> 
> As QEMU lands in vhost_net_stop(), it seems to cause a chain of events that crash ovs which is trying to read an rx burst from the queue,

Not sure I got this part.

> while QEMU is left hanging waiting forever for a response to VHOST_USER_GET_VRING_BASE issued as a result of vhost_net_stop.

Ineteresting why doesn't socket close after ovs crash cause the read to fail.

> Just saying, I am having more success with the second ordering, but I am still studying, don't have the full picture yet.
> 
> Thanks,
> 
> Claudio
> 
> > 
> >>     msix_unuse_all_vectors(&proxy->pci_dev);
> >>
> >>     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> >>         proxy->vqs[i].enabled = 0;
> >>         proxy->vqs[i].num = 0;
> >>         proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
> >>         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
> >>         proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
> >>     }
> >>
> >>
> >> so far so good
> >>
> >>     if (pci_is_express(dev)) {
> >>         pcie_cap_deverr_reset(dev);
> >>         pcie_cap_lnkctl_reset(dev);
> >>
> >>         pci_set_word(dev->config + dev->exp.pm_cap + PCI_PM_CTRL, 0);
> >>     }
> >>
> >> this part is wrong I think, it got here by mistake since the same
> >> function is used for bus level reset.
> >>
> >> Jason, Marcel, any input?
> > 
> > Yes, I think we don't need PCI stuff here. We do virtio reset not pci.
> > 
> > Thanks
> > 
> >>
> >> --
> >> MST
> >>
> > 
> > 


