Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B54A6242A5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot775-0007Fq-SS; Thu, 10 Nov 2022 07:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot772-0007D0-DP
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:56:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot770-00023H-MR
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668085013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jS8OHYvX+RFJyPMobgu3Swmgc9dl0FKn3jnAC7W8AEY=;
 b=KGUf7M8QoCv5gxuMaRVJfqSHx9mYq1k6Q5gFntS+7qrsPXskxFfkJfAEznFzMpQnHPNLnO
 kR6bIlqkabqIJTNLSzeNSSaPUyZffEr3s/qoQLDnQllF7dnjfZE4me6lgxX5As+eyc4FkI
 eumWNCQDKF5bDwdp0MMB+xwBTNPmsAE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-7RyjjGsdM3GTl8G74c5EpA-1; Thu, 10 Nov 2022 07:56:52 -0500
X-MC-Unique: 7RyjjGsdM3GTl8G74c5EpA-1
Received: by mail-pg1-f197.google.com with SMTP id
 h185-20020a636cc2000000b0046fc6e0065dso963121pgc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 04:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jS8OHYvX+RFJyPMobgu3Swmgc9dl0FKn3jnAC7W8AEY=;
 b=qf5k6dctV++u2hNbyz6WJenJJVjQ6WZ++rcOkdY5fG4Y/CKHThSUILeHSCBCfNTUsD
 7LDp5wUrtQAPt488hPWxxvjjhrNE75AbnR3V0DJtgDhX81RkTRegS4/PTarzV+hDcX45
 iuTlE2EAPoQsoui350YVpn+OB8DKpXrEDathgO7QfzjGIoA+Ma4O+TApTOfp/bzVTSMK
 YWbBdyt1fIenLWf2unROG1RiWa1duOeD16/XNs1zwLPbhAh7U9teMp2RDRFSKYUqN4Xe
 k10fNbBE6SvkEzy+Cm57p/mAvkLtXq5KPIAGJjmir8aGRHjWbJErddB2AqsBegZCjfYu
 NGSg==
X-Gm-Message-State: ACrzQf0rvxzoXvrHZvjvxbI9PLIwEj8h0QMKoXwIj5RZszUvTakxzzRO
 Uj30QbD7WctpMGjTzK81ZTbp6zuCh887gTKlYXsTkJ30dIeNNMIVMofhvtuJNe31Th1xADGcf/X
 uZJuXb2ZT1FsuZCdUOdCUADwjRVFMIp4=
X-Received: by 2002:a63:40c4:0:b0:470:18d5:e914 with SMTP id
 n187-20020a6340c4000000b0047018d5e914mr35128939pga.58.1668085011384; 
 Thu, 10 Nov 2022 04:56:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM73AiJ/tFA+L0uf7V/sAqT2Ut/jA/N6LjkyupDWLgaZJP43gptz6xz4rukdQyecVU9Fj8PKSI/Z2Nj87VjS1Bc=
X-Received: by 2002:a63:40c4:0:b0:470:18d5:e914 with SMTP id
 n187-20020a6340c4000000b0047018d5e914mr35128918pga.58.1668085011097; Thu, 10
 Nov 2022 04:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221110072455-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221110072455-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 10 Nov 2022 13:56:14 +0100
Message-ID: <CAJaqyWfCC9W_Dec3EqSxBk_CQ9E-CRDu947EKfyQtxQNZXeDOw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] ASID support in vhost-vdpa net
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Thu, Nov 10, 2022 at 1:25 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Nov 08, 2022 at 06:07:45PM +0100, Eugenio P=C3=A9rez wrote:
> > Control VQ is the way net devices use to send changes to the device sta=
te, like
> > the number of active queues or its mac address.
> >
> > QEMU needs to intercept this queue so it can track these changes and is=
 able to
> > migrate the device. It can do it from 1576dbb5bbc4 ("vdpa: Add x-svq to
> > NetdevVhostVDPAOptions"). However, to enable x-svq implies to shadow al=
l VirtIO
> > device's virtqueues, which will damage performance.
> >
> > This series adds address space isolation, so the device and the guest
> > communicate directly with them (passthrough) and CVQ communication is s=
plit in
> > two: The guest communicates with QEMU and QEMU forwards the commands to=
 the
> > device.
> >
> > Comments are welcome. Thanks!
>
>
> This is not 7.2 material, right?
>

No it is not.

I should have noted it after PATCH in the subject, sorry.

> > v6:
> > - Do not allocate SVQ resources like file descriptors if SVQ cannot be =
used.
> > - Disable shadow CVQ if the device does not support it because of net
> >   features.
> >
> > v5:
> > - Move vring state in vhost_vdpa_get_vring_group instead of using a
> >   parameter.
> > - Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID
> >
> > v4:
> > - Rebased on last CVQ start series, that allocated CVQ cmd bufs at load
> > - Squash vhost_vdpa_cvq_group_is_independent.
> > - Do not check for cvq index on vhost_vdpa_net_prepare, we only have on=
e
> >   that callback registered in that NetClientInfo.
> > - Add comment specifying behavior if device does not support _F_ASID
> > - Update headers to a later Linux commit to not to remove SETUP_RNG_SEE=
D
> >
> > v3:
> > - Do not return an error but just print a warning if vdpa device initia=
lization
> >   returns failure while getting AS num of VQ groups
> > - Delete extra newline
> >
> > v2:
> > - Much as commented on series [1], handle vhost_net backend through
> >   NetClientInfo callbacks instead of directly.
> > - Fix not freeing SVQ properly when device does not support CVQ
> > - Add BIT_ULL missed checking device's backend feature for _F_ASID.
> >
> > Eugenio P=C3=A9rez (10):
> >   vdpa: Use v->shadow_vqs_enabled in vhost_vdpa_svqs_start & stop
> >   vhost: set SVQ device call handler at SVQ start
> >   vhost: Allocate SVQ device file descriptors at device start
> >   vdpa: add vhost_vdpa_net_valid_svq_features
> >   vdpa: move SVQ vring features check to net/
> >   vdpa: Allocate SVQ unconditionally
> >   vdpa: Add asid parameter to vhost_vdpa_dma_map/unmap
> >   vdpa: Store x-svq parameter in VhostVDPAState
> >   vdpa: Add listener_shadow_vq to vhost_vdpa
> >   vdpa: Always start CVQ in SVQ mode
> >
> >  include/hw/virtio/vhost-vdpa.h     |  10 +-
> >  hw/virtio/vhost-shadow-virtqueue.c |  35 +-----
> >  hw/virtio/vhost-vdpa.c             | 114 ++++++++++---------
> >  net/vhost-vdpa.c                   | 171 ++++++++++++++++++++++++++---
> >  hw/virtio/trace-events             |   4 +-
> >  5 files changed, 222 insertions(+), 112 deletions(-)
> >
> > --
> > 2.31.1
> >
>


