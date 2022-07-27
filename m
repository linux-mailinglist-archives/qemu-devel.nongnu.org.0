Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D620582BAF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:36:28 +0200 (CEST)
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGk1K-0003dE-Rc
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGjjZ-0007TI-8e
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 12:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGjjX-0004wJ-7m
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 12:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658938682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Mm6cKvNXqNOR25HnzwqK4xjBZAxnARfOcHRFw4Y92s=;
 b=W1P2WxTDfTOS7rmeAMjk34scyF6EaOVrJep/cVve7iNunculF2QSdSWTwINqVGDGEwth+i
 epu1HrplZxor/JiO9oPHwwkG/81mE/SuWUykkilp5v2GntGg4n6WeuqnGktvAcdMJkl+Nu
 yRROToBxN3f/dBM3cSKZ8m8uj5+tG98=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-YF0ofYSMMTaYGyf4ykKynQ-1; Wed, 27 Jul 2022 12:18:00 -0400
X-MC-Unique: YF0ofYSMMTaYGyf4ykKynQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 e19-20020adfa453000000b0021eb66639cbso1260300wra.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 09:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=7Mm6cKvNXqNOR25HnzwqK4xjBZAxnARfOcHRFw4Y92s=;
 b=isbP7dPcJl1Rt8JlTsdh8cTDagVso9M00QTD9gbmxTSPs3ryFKrDT3lEfzJk21eurR
 mNZ9lfuyVxTRHk1W/SdBHk27n7VlWrBIXYteodVq8g+CD8lgtPxwA0NZE/aBPWemUDrD
 9TeslPBZgKE/y7PxhF79tJtkHIcQ1QIe0xBAdERj8WBVkzvPTnab0TWfpzLqQDLhPmsT
 vKWPsXhY2d8dsRWGyg3cw5xX9qTuV9wLq8nsARG4HFhXeLFnx5A6ePsrUbkPaAyd2N2x
 r/esYvBbdQNCqybU7RFoZztCIZwbS1+AwhJI9gcb3urj4e/xtRh4vWCux/4ksGWmYLgX
 o7mw==
X-Gm-Message-State: AJIora88UIXBDjH0XeLh3JUampLxzHS0fkEk/Ytmv8OcAE+tHb3wi971
 2iMJj557ZEsnfuBygOw1zZb/QMGubpU1yRE/ikkpEMZJhQqdtpZOzGfIbhK0TV/QK80ltHjTkVq
 ZNKaIH1Ii0GaNFO0=
X-Received: by 2002:a05:600c:4304:b0:3a3:2e32:8a8f with SMTP id
 p4-20020a05600c430400b003a32e328a8fmr3609177wme.104.1658938678941; 
 Wed, 27 Jul 2022 09:17:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tetJ/YpjgHcQICRJtNBf5FzOLVWttte5AgblC9IBB/CvAmcPM3TN5U6RkOGDqfqY2NzW4HvQ==
X-Received: by 2002:a05:600c:4304:b0:3a3:2e32:8a8f with SMTP id
 p4-20020a05600c430400b003a32e328a8fmr3609156wme.104.1658938678468; 
 Wed, 27 Jul 2022 09:17:58 -0700 (PDT)
Received: from redhat.com ([2.52.132.243]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c414500b003a2c7bf0497sm2839916wmm.16.2022.07.27.09.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 09:17:57 -0700 (PDT)
Date: Wed, 27 Jul 2022 12:17:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Message-ID: <20220727121557-mutt-send-email-mst@kernel.org>
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
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

I went looking at this code and found a bug, so
I just sent a patch fixing it:
https://lore.kernel.org/r/20220727161445.21428-1-mst%40redhat.com

no idea whether it's related but can't hurt to try.


> -- 
> Claudio Fontana
> Engineering Manager Virtualization, SUSE Labs Core
> 
> SUSE Software Solutions Italy Srl


