Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5263C5D7F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:41:00 +0200 (CEST)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wB9-0001A3-F7
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m2vms-0002sS-RZ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m2vmq-0003Fu-HC
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626095751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uk4kyEJKLEo4by9chxBhpndxw/+BuxYt1A7roSwZFFg=;
 b=SQtoAd1nE5++Uu1twKHu5j4cGZMC4dtWqlYCzZ4zQtx0BlE93SP9tJqgzHr1++pgIKMVlD
 dw08OJ1BSivS2BatVR03pNdzujW65uCeTaFCIYQaYDSvB1U/5Ai/j4msbxE2W8znkpj49z
 8L0hCJn7jzCWYM7W/Kj+b0GIPnOSrVg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-ssDmzdVYP7qCyleV1J4QJw-1; Mon, 12 Jul 2021 09:15:49 -0400
X-MC-Unique: ssDmzdVYP7qCyleV1J4QJw-1
Received: by mail-ed1-f70.google.com with SMTP id
 e1-20020a0564021481b02903a66550f6f4so1500893edv.21
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 06:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uk4kyEJKLEo4by9chxBhpndxw/+BuxYt1A7roSwZFFg=;
 b=eQYROsjxvQn0fLrBxRz1RWTjNbz/RD0g2qq9FiyfdOWy5DtVzQ5W+pyDQo2syuwXRH
 1P7Rbp0Pnu7EVtnB99xe2SOlAQOiAjTYgVbjIN3MRPUuzNV8ZLrUgJ6M9/A+A72VWHcY
 547QNu22GGdkNA2Or5b+d1PQ3OKDrsusZZtUDSh5wWzYii6KiyQf1MWh6fwldrkl0xBG
 fmoburWb6SxzAcPuWUZRo56ecGFTNBjZR91ONfhHcpwqFrgwNzU7sI3Cfox3g7MOnDTz
 EjaqiBLi1EB7h0QiwmxfZPS0tgSltHHCvAC6YYfpNvDBGqolpB0yubo67UTxYv4mgHtm
 MbVw==
X-Gm-Message-State: AOAM530cgUoJouGq0pJ/syg4sg394oEe/6CuYPGJraoceikynoEmw+68
 yOQVcdiWfspqi+JRQr1Ox01aFl+4/aFMW2UsYp1x1ysajSBmkEHVWN7ErSyGVBfT1SUt2StQKIt
 a7etOz96GgZnP+tI=
X-Received: by 2002:a17:906:794f:: with SMTP id
 l15mr40359440ejo.462.1626095748493; 
 Mon, 12 Jul 2021 06:15:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/AlrEixljyy9K4eCagBZr3wpUe29/sx4e0Xf4faeDkhPFL10O/dAGScUn2ov6tIEYN0z9sw==
X-Received: by 2002:a17:906:794f:: with SMTP id
 l15mr40359408ejo.462.1626095748266; 
 Mon, 12 Jul 2021 06:15:48 -0700 (PDT)
Received: from redhat.com ([2.55.156.48])
 by smtp.gmail.com with ESMTPSA id nc29sm605032ejc.10.2021.07.12.06.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 06:15:47 -0700 (PDT)
Date: Mon, 12 Jul 2021 09:15:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 00/18] vhost-vDPA multiqueue
Message-ID: <20210712091500-mutt-send-email-mst@kernel.org>
References: <20210706082717.37730-1-jasowang@redhat.com>
 <ce31242d-08a9-b1e4-f260-8c31ca4b49c0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ce31242d-08a9-b1e4-f260-8c31ca4b49c0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eperezma@redhat.com, elic@nvidia.com, lulu@redhat.com,
 qemu-devel@nongnu.org, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 01:44:45PM +0800, Jason Wang wrote:
> 
> 在 2021/7/6 下午4:26, Jason Wang 写道:
> > Hi All:
> > 
> > This patch implements the multiqueue support for vhost-vDPA. The most
> > important requirement the control virtqueue support. The virtio-net
> > and vhost-net core are tweak to support control virtqueue as if what
> > data queue pairs are done: a dedicated vhost_net device which is
> > coupled with the NetClientState is intrdouced so most of the existing
> > vhost codes could be reused with minor changes. With the control
> > virtqueue, vhost-vDPA are extend to support creating and destroying
> > multiqueue queue pairs plus the control virtqueue.
> > 
> > Tests are done via the vp_vdpa driver in L1 guest plus vdpa simulator
> > on L0.
> > 
> > Please reivew.
> 
> 
> If no objection, I will queue this for 6.1.
> 
> Thanks


Just to make sure I understand, this basically works by
passing the cvq through to the guest right?
Giving up on maintaining the state in qemu.

> 
> > 
> > Changes since V1:
> > 
> > - validating all features that depends on ctrl vq
> > - typo fixes and commit log tweaks
> > - fix build errors because max_qps is used before it is introduced
> > 
> > Thanks
> > 
> > Jason Wang (18):
> >    vhost_net: remove the meaningless assignment in vhost_net_start_one()
> >    vhost: use unsigned int for nvqs
> >    vhost_net: do not assume nvqs is always 2
> >    vhost-vdpa: remove the unnecessary check in vhost_vdpa_add()
> >    vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
> >    vhost-vdpa: fix leaking of vhost_net in vhost_vdpa_add()
> >    vhost-vdpa: tweak the error label in vhost_vdpa_add()
> >    vhost-vdpa: fix the wrong assertion in vhost_vdpa_init()
> >    vhost-vdpa: remove the unncessary queue_index assignment
> >    vhost-vdpa: open device fd in net_init_vhost_vdpa()
> >    vhost-vdpa: classify one time request
> >    vhost-vdpa: prepare for the multiqueue support
> >    vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
> >    net: introduce control client
> >    vhost-net: control virtqueue support
> >    virito-net: use "qps" instead of "queues" when possible
> >    virtio-net: vhost control virtqueue support
> >    vhost-vdpa: multiqueue support
> > 
> >   hw/net/vhost_net.c             |  48 +++++++---
> >   hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
> >   hw/virtio/vhost-vdpa.c         |  55 ++++++++++-
> >   include/hw/virtio/vhost-vdpa.h |   1 +
> >   include/hw/virtio/vhost.h      |   2 +-
> >   include/hw/virtio/virtio-net.h |   5 +-
> >   include/net/net.h              |   5 +
> >   include/net/vhost_net.h        |   7 +-
> >   net/net.c                      |  24 ++++-
> >   net/tap.c                      |   1 +
> >   net/vhost-user.c               |   1 +
> >   net/vhost-vdpa.c               | 156 ++++++++++++++++++++++++-------
> >   12 files changed, 332 insertions(+), 138 deletions(-)
> > 


