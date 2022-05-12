Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4365243CE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 06:03:11 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np02g-0006NR-B6
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 00:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1np008-0005Pl-S1
 for qemu-devel@nongnu.org; Thu, 12 May 2022 00:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1np005-0000ac-1R
 for qemu-devel@nongnu.org; Thu, 12 May 2022 00:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652328023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yIW+FCVbr8CXXVh1W3iI6fl8unJyJ1RtUEfSeN4cPk=;
 b=caR3PiZDZqlnKaaz7WtdbkiZMBRrTWXrLwmzf7QhAmThtL6kDcq6bWDveDTuu3UDppJfk9
 z2FDzk2t6pzXz7hbgL7QQ/HGjoFk+T4V6gQ+YzJuIrYyjj2wTNNCHf8CyG5z6XaeLfLo62
 uzpIeCW7+eMXAk0Cx0u6QLp21mZ4lg4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-KC-8JV2rOCarfh-R2tGWAg-1; Thu, 12 May 2022 00:00:15 -0400
X-MC-Unique: KC-8JV2rOCarfh-R2tGWAg-1
Received: by mail-lf1-f71.google.com with SMTP id
 br16-20020a056512401000b004739cf51722so1665920lfb.6
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 21:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0yIW+FCVbr8CXXVh1W3iI6fl8unJyJ1RtUEfSeN4cPk=;
 b=YWhCsfu5lV47bP+uA47PEQv2MYFmCiDZyyjLZrzuAO+cPEWFT6ibLUjfv4BL/cCXyv
 sW0+qCmGs+zKp9G/AKtp3CfItgK1AVdI+h1TnsOcRIaCSCIzXKLIYLQIde5aaUkQsM9X
 ucGwdPixlRu2sTy+gkRpbNoZpbiSkgbswhvxZRXUP3tlxBSTchBriQ2iY1T62sDEEj4l
 u6tDbMmXUkaQ3djiQ1ucAy4EAAOwOm/QYFnsPaul5yuC3HHAD0JqJo7nYW/3Nz+Or2Qd
 vIWCiZD8+xtG0SGdeRS1Nru0/a3zX/2He/gpFjbkpxIv54sqBZm8k+aFxZrQwwglsO8h
 ev4w==
X-Gm-Message-State: AOAM532l0j/3mShOptWZDfCqPpQ1/aGAJrm7LmV8yjX2qpnjVg4mpg3o
 NJDtHle8oh2ivIvXDdkuKf1hdFiJiKpU8Mv4m736ipbl0M/KRU+AxE0NaajhPXSWfo12MZ45wi9
 C4wb5BXF1K7isdUzYcan6BkoXngsMQ4E=
X-Received: by 2002:a2e:9698:0:b0:24f:14da:6a59 with SMTP id
 q24-20020a2e9698000000b0024f14da6a59mr19906511lji.73.1652328014084; 
 Wed, 11 May 2022 21:00:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2GzW/3WPRn1Qv4igS+/R9CCZvErkegv99KElnGdENDPHIBP+wS3vT7MpzelxhY8a+3fXbyute2TqaNhiPRRU=
X-Received: by 2002:a2e:9698:0:b0:24f:14da:6a59 with SMTP id
 q24-20020a2e9698000000b0024f14da6a59mr19906495lji.73.1652328013826; Wed, 11
 May 2022 21:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
In-Reply-To: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 12 May 2022 12:00:02 +0800
Message-ID: <CACGkMEtPn7u0vd4MHuNJBGHbzx5E11NEU4Zh1Dr8C07eEsO0vQ@mail.gmail.com>
Subject: Re: About restoring the state in vhost-vdpa device
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: virtualization <virtualization@lists.linux-foundation.org>, 
 qemu-level <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@nvidia.com>, 
 Gautam Dawar <gdawar@xilinx.com>, virtio-networking@redhat.com, 
 Eli Cohen <elic@nvidia.com>, Laurent Vivier <lvivier@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, May 12, 2022 at 3:44 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> This is a proposal to restore the state of the vhost-vdpa device at
> the destination after a live migration. It uses as many available
> features both from the device and from qemu as possible so we keep the
> communication simple and speed up the merging process.

When we finalize the design, we can formalize it in kernel Documentation/

>
> # Initializing a vhost-vdpa device.
>
> Without the context of live migration, the steps to initialize the
> device from vhost-vdpa at qemu starting are:
> 1) [vhost] Open the vdpa device, Using simply open()
> 2) [vhost+virtio] Get device features. These are expected not to
> change in the device's lifetime, so we can save them. Qemu issues a
> VHOST_GET_FEATURES ioctl and vdpa forwards to the backend driver using
> get_device_features() callback.

For "virtio" do you mean it's an action that is defined in the spec?

> 3) [vhost+virtio] Get its max_queue_pairs if _F_MQ and _F_CTRL_VQ.
> These are obtained using VHOST_VDPA_GET_CONFIG, and that request is
> forwarded to the device using get_config. QEMU expects the device to
> not change it in its lifetime.
> 4) [vhost] Vdpa set status (_S_ACKNOLEDGE, _S_DRIVER). Still no
> FEATURES_OK or DRIVER_OK. The ioctl is VHOST_VDPA_SET_STATUS, and the
> vdpa backend driver callback is set_status.
>
> These are the steps used to initialize the device in qemu terminology,
> taking away some redundancies to make it simpler.
>
> Now the driver sends the FEATURES_OK and the DRIVER_OK, and qemu
> detects it, so it *starts* the device.
>
> # Starting a vhost-vdpa device
>
> At virtio_net_vhost_status we have two important variables here:
> int cvq = _F_CTRL_VQ ? 1 : 0;
> int queue_pairs = _F_CTRL_VQ && _F_MQ ? (max_queue_pairs of step 3) : 0;
>
> Now identification of the cvq index. Qemu *know* that the device will
> expose it at the last queue (max_queue_pairs*2) if _F_MQ has been
> acknowledged by the guest's driver or 2 if not. It cannot depend on
> any data sent to the device via cvq, because we couldn't get its
> command status on a change.
>
> Now we start the vhost device. The workflow is currently:
>
> 5) [virtio+vhost] The first step is to send the acknowledgement of the
> Virtio features and vhost/vdpa backend features to the device, so it
> knows how to configure itself. This is done using the same calls as
> step 4 with these feature bits added.
> 6) [virtio] Set the size, base, addr, kick and call fd for each queue
> (SET_VRING_ADDR, SET_VRING_NUM, ...; and forwarded with
> set_vq_address, set_vq_state, ...)
> 7) [vdpa] Send host notifiers and *send SET_VRING_ENABLE = 1* for each
> queue. This is done using ioctl VHOST_VDPA_SET_VRING_ENABLE, and
> forwarded to the vdpa backend using set_vq_ready callback.
> 8) [virtio + vdpa] Send memory translations & set DRIVER_OK.
>
> If we follow the current workflow, the device is allowed now to start
> receiving only on vq pair 0, since we've still not set the multi queue
> pair. This could cause the guest to receive packets in unexpected
> queues, breaking RSS.
>
> # Proposal
>
> Our proposal diverge in step 7: Instead of enabling *all* the
> virtqueues, only enable the CVQ. After that, send the DRIVER_OK and
> queue all the control commands to restore the device status (MQ, RSS,
> ...). Once all of them have been acknowledged ("device", or emulated
> cvq in host vdpa backend driver, has used all cvq buffers, enable
> (SET_VRING_ENABLE, set_vq_ready) all other queues.
>
> Everything needed for this is already implemented in the kernel as far
> as I see, there is only a small modification in qemu needed. Thus
> achieving the restoring of the device state without creating
> maintenance burden.

Yes, one of the major motivations is to try to reuse the existing APIs
as much as possible as a start. It doesn't mean we can't invent new
API, but having a dedicated save/restore uAPI looks fine. But it looks
more like a work that needs to be finalized in the virtio spec
otherwise we may end up with code that is hard to maintain.

Thanks

>
> A lot of optimizations can be applied on top without the need to add
> stuff to the migration protocol or vDPA uAPI, like the pre-warming of
> the vdpa queues or adding more capabilities to the emulated CVQ.
>
> Other optimizations like applying the state out of band can also be
> added so they can run in parallel with the migration, but that
> requires a bigger change in qemu migration protocol making us lose
> focus on achieving at least the basic device migration in my opinion.
>
> Thoughts?
>


