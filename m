Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68104523DCE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 21:46:39 +0200 (CEST)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nosIA-0007sy-29
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 15:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nosGC-0007AL-Li
 for qemu-devel@nongnu.org; Wed, 11 May 2022 15:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nosG9-0003tM-9I
 for qemu-devel@nongnu.org; Wed, 11 May 2022 15:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652298271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=DfEdD8NmWz+EmWpW5W7h8jSo/5P4MLBedJAUxMwqVA8=;
 b=Dl7YQzUCT7p27mfgX2StlV54zDYhyrYJ7oRjEhSCEI9KMS6LIr+Ewx+2ZXh5zgmdWjGhSv
 9erekICGFQo7e64EMEHNnRuNxxb4YdIvJDcS8rFWSjt1MbyL6qW4i0k5kpjIC8tjDHR1Pz
 y/SRuO/LLr77400TXWGNvZotyG/4xIg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-m7Pu_LrMOhqW3fMaRnbFHQ-1; Wed, 11 May 2022 15:44:30 -0400
X-MC-Unique: m7Pu_LrMOhqW3fMaRnbFHQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 g1-20020ac85801000000b002f3b281f745so2298313qtg.22
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 12:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DfEdD8NmWz+EmWpW5W7h8jSo/5P4MLBedJAUxMwqVA8=;
 b=BFKgz6gaKytGEye8L2JM+gILCTRqAsoQ9nTvmHItgUHcL+WXxs0NVKqK1yTN1oIdpn
 mfkhPu806U/EXdp5uTQbrG90ogbXZdj6AwpovwEpbwsd7h93iZa453swUdM9vQEjqJCX
 LzGp3A5gDfxF9sIe+VsEsPuZ31OBNpDAWI5aknWoq3sMAt1bpUu2xLe8JKDCBOPwS0jT
 br6ALroDoQXPkh5F2yXWl5YDpZUPQPp906VUt/swFFVh8u6rdGbDL5GF8EGLlCMXrlQe
 /Jlh/PSDPokc/CAkH2SBnw4mG7VdvoIAdcMIJGvNjAk4R47Iexs24EkSvg18Newdxyb8
 If/Q==
X-Gm-Message-State: AOAM532XvbZ+c5eUVc7TNiBSsKDfxb2bVhAQ+b1ibSQOIJm7aHJ9zFQv
 1oLgo8pFGH+2warAd7BY2/Ub16zSlr8vcJ3wmsEzvr2afcjjzfqtmlurK/P1YZH1ph5LM19NWMk
 yr0WVF6g/n7UGnvv97uuraMOtvSZRE2U=
X-Received: by 2002:a05:622a:1899:b0:2f3:b09e:dbe9 with SMTP id
 v25-20020a05622a189900b002f3b09edbe9mr25906651qtc.199.1652298269390; 
 Wed, 11 May 2022 12:44:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+IvjpMRC6TEGsbTzNIXyDrevnI6jOqAxHDZ8jifnRjpIY9XnhmV/u08iRxsyAdbfDc3sjmyMXaPNSMb6dX2s=
X-Received: by 2002:a05:622a:1899:b0:2f3:b09e:dbe9 with SMTP id
 v25-20020a05622a189900b002f3b09edbe9mr25906631qtc.199.1652298269138; Wed, 11
 May 2022 12:44:29 -0700 (PDT)
MIME-Version: 1.0
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 11 May 2022 21:43:53 +0200
Message-ID: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
Subject: About restoring the state in vhost-vdpa device
To: virtualization <virtualization@lists.linux-foundation.org>, 
 qemu-level <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@nvidia.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtio-networking@redhat.com, 
 Eli Cohen <elic@nvidia.com>, Laurent Vivier <lvivier@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

This is a proposal to restore the state of the vhost-vdpa device at
the destination after a live migration. It uses as many available
features both from the device and from qemu as possible so we keep the
communication simple and speed up the merging process.

# Initializing a vhost-vdpa device.

Without the context of live migration, the steps to initialize the
device from vhost-vdpa at qemu starting are:
1) [vhost] Open the vdpa device, Using simply open()
2) [vhost+virtio] Get device features. These are expected not to
change in the device's lifetime, so we can save them. Qemu issues a
VHOST_GET_FEATURES ioctl and vdpa forwards to the backend driver using
get_device_features() callback.
3) [vhost+virtio] Get its max_queue_pairs if _F_MQ and _F_CTRL_VQ.
These are obtained using VHOST_VDPA_GET_CONFIG, and that request is
forwarded to the device using get_config. QEMU expects the device to
not change it in its lifetime.
4) [vhost] Vdpa set status (_S_ACKNOLEDGE, _S_DRIVER). Still no
FEATURES_OK or DRIVER_OK. The ioctl is VHOST_VDPA_SET_STATUS, and the
vdpa backend driver callback is set_status.

These are the steps used to initialize the device in qemu terminology,
taking away some redundancies to make it simpler.

Now the driver sends the FEATURES_OK and the DRIVER_OK, and qemu
detects it, so it *starts* the device.

# Starting a vhost-vdpa device

At virtio_net_vhost_status we have two important variables here:
int cvq = _F_CTRL_VQ ? 1 : 0;
int queue_pairs = _F_CTRL_VQ && _F_MQ ? (max_queue_pairs of step 3) : 0;

Now identification of the cvq index. Qemu *know* that the device will
expose it at the last queue (max_queue_pairs*2) if _F_MQ has been
acknowledged by the guest's driver or 2 if not. It cannot depend on
any data sent to the device via cvq, because we couldn't get its
command status on a change.

Now we start the vhost device. The workflow is currently:

5) [virtio+vhost] The first step is to send the acknowledgement of the
Virtio features and vhost/vdpa backend features to the device, so it
knows how to configure itself. This is done using the same calls as
step 4 with these feature bits added.
6) [virtio] Set the size, base, addr, kick and call fd for each queue
(SET_VRING_ADDR, SET_VRING_NUM, ...; and forwarded with
set_vq_address, set_vq_state, ...)
7) [vdpa] Send host notifiers and *send SET_VRING_ENABLE = 1* for each
queue. This is done using ioctl VHOST_VDPA_SET_VRING_ENABLE, and
forwarded to the vdpa backend using set_vq_ready callback.
8) [virtio + vdpa] Send memory translations & set DRIVER_OK.

If we follow the current workflow, the device is allowed now to start
receiving only on vq pair 0, since we've still not set the multi queue
pair. This could cause the guest to receive packets in unexpected
queues, breaking RSS.

# Proposal

Our proposal diverge in step 7: Instead of enabling *all* the
virtqueues, only enable the CVQ. After that, send the DRIVER_OK and
queue all the control commands to restore the device status (MQ, RSS,
...). Once all of them have been acknowledged ("device", or emulated
cvq in host vdpa backend driver, has used all cvq buffers, enable
(SET_VRING_ENABLE, set_vq_ready) all other queues.

Everything needed for this is already implemented in the kernel as far
as I see, there is only a small modification in qemu needed. Thus
achieving the restoring of the device state without creating
maintenance burden.

A lot of optimizations can be applied on top without the need to add
stuff to the migration protocol or vDPA uAPI, like the pre-warming of
the vdpa queues or adding more capabilities to the emulated CVQ.

Other optimizations like applying the state out of band can also be
added so they can run in parallel with the migration, but that
requires a bigger change in qemu migration protocol making us lose
focus on achieving at least the basic device migration in my opinion.

Thoughts?


