Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C1599433
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 06:38:33 +0200 (CEST)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOtmB-0005et-DO
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 00:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOtjv-0003yA-P5
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 00:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOtjr-0000KU-QT
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 00:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660883766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1bOKS/Sg+jAm8vbMz6TQ/iG2R3SgzfLTTnTuvLIrXQ=;
 b=SJQ1pv1/LlexFSGKAIvr/vWe0gxanRrpMlQAc09bnxuxmcgnMhIEHnRDFhLkH79v5kuvrg
 Wb9UZRfIckVgi77EYzlVWsH/dljw6wV7X0Q94MTQNofwBC1Ir2X5HPTdR5ZNVdUDEyhIkQ
 lyM55uL15+iNXv93wljz90Wsk0EG094=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-OW3ziGWoNWanb408uogcSQ-1; Fri, 19 Aug 2022 00:36:04 -0400
X-MC-Unique: OW3ziGWoNWanb408uogcSQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 z1-20020a0565120c0100b0048ab2910b13so1126166lfu.23
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 21:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=V1bOKS/Sg+jAm8vbMz6TQ/iG2R3SgzfLTTnTuvLIrXQ=;
 b=PG2n4WLO7gdkstdjgdAi7FMSDIDpidWZjxXbxOYe+/Begwem4pa06Whh8l4S/xQqz/
 66wmvY5How2ewEOMf91FjYhO0Eint1ZHpW8Jfd0M2YKhzb+3ihmAU/mSPB5vGNSmYx7T
 lJxFKT2viPKjqbgRaBZqjupP14+W2dWwefP5/Sx3OrSWzffD/mgusqu8OxP9PJjrvjAn
 AZ/9cPaPAGII1Klgkb3ceI9RJLrdz2ujshqjV7myQUe96lZRJeRiHt5dG43HeuYK4wrV
 1bqnOHohHX8cewaFULOuUGhL/rI+GSwE1uC62rCPz4LLMWCiSFt+ZR1gY6vleaVVT9+n
 WmtQ==
X-Gm-Message-State: ACgBeo3lJNx40sM6cQdOcaCBj4EagIfNfSJTUgQ9jPp/MifLP9cSLjTl
 EJ/hyYg/2UdY1IfFaZPan6Gs8qRkTe49VsyIDJoAZqJRx91Tp/x6yhhgpIetRLtWrKMVHsmJTjn
 ZDq11dZTE149xLZByOcMyD0jq40PLqh4=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr1752579lfa.124.1660883762587; 
 Thu, 18 Aug 2022 21:36:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6w7kLSIs2oDd9guczBCQ1VnSQImfCxJdcNPS8ilpcnWqo6wXWDT1i/6Ylt7cT2qJ29h6o8A+V019dcDLFU13Q=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr1752558lfa.124.1660883762313; Thu, 18
 Aug 2022 21:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220809173926.1695280-1-eperezma@redhat.com>
 <CAJaqyWes7ePnG5wRwWGCS6H4=mrrW4=D19xg74rX985Yd1-TyQ@mail.gmail.com>
In-Reply-To: <CAJaqyWes7ePnG5wRwWGCS6H4=mrrW4=D19xg74rX985Yd1-TyQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 19 Aug 2022 12:35:51 +0800
Message-ID: <CACGkMEvVyx0c2=+2TAuZdfE7B5y--hyQmR_kKCs=LnMbw4L+uw@mail.gmail.com>
Subject: Re: [PATCH v8 00/12] NIC vhost-vdpa state restore via Shadow CVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Aug 11, 2022 at 2:57 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Aug 9, 2022 at 7:43 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > CVQ of net vhost-vdpa devices can be intercepted since the addition of =
x-svq.
> > The virtio-net device model is updated. The migration was blocked becau=
se
> > although the state can be megrated between VMM it was not possible to r=
estore
> > on the destination NIC.
> >
> > This series add support for SVQ to inject external messages without the=
 guest's
> > knowledge, so before the guest is resumed all the guest visible state i=
s
> > restored. It is done using standard CVQ messages, so the vhost-vdpa dev=
ice does
> > not need to learn how to restore it: As long as they have the feature, =
they
> > know how to handle it.
> >
> > This series needs fix [1] to be applied to achieve full live
> > migration.
> >
> > Thanks!
> >
> > [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg00325.h=
tml
> >
> > v8:
> > - Rename NetClientInfo load to start, so is symmetrical with stop()
> > - Delete copy of device's in buffer at vhost_vdpa_net_load
> >
> > v7:
> > - Remove accidental double free.
> >
> > v6:
> > - Move map and unmap of the buffers to the start and stop of the device=
. This
> >   implies more callbacks on NetClientInfo, but simplifies the SVQ CVQ c=
ode.
> > - Not assume that in buffer is sizeof(virtio_net_ctrl_ack) in
> >   vhost_vdpa_net_cvq_add
> > - Reduce the number of changes from previous versions
> > - Delete unused memory barrier
> >
> > v5:
> > - Rename s/start/load/
> > - Use independent NetClientInfo to only add load callback on cvq.
> > - Accept out sg instead of dev_buffers[] at vhost_vdpa_net_cvq_map_elem
> > - Use only out size instead of iovec dev_buffers to know if the descrip=
tor is
> >   effectively available, allowing to delete artificial !NULL VirtQueueE=
lement
> >   on vhost_svq_add call.
> >
> > v4:
> > - Actually use NetClientInfo callback.
> >
> > v3:
> > - Route vhost-vdpa start code through NetClientInfo callback.
> > - Delete extra vhost_net_stop_one() call.
> >
> > v2:
> > - Fix SIGSEGV dereferencing SVQ when not in svq mode
> >
> > v1 from RFC:
> > - Do not reorder DRIVER_OK & enable patches.
> > - Delete leftovers
> >
> > Eugenio P=C3=A9rez (12):
> >   vhost: stop transfer elem ownership in vhost_handle_guest_kick
> >   vhost: use SVQ element ndescs instead of opaque data for desc
> >     validation
> >   vhost: Delete useless read memory barrier
> >   vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush
> >   vhost_net: Add NetClientInfo prepare callback
> >   vhost_net: Add NetClientInfo stop callback
> >   vdpa: add net_vhost_vdpa_cvq_info NetClientInfo
> >   vdpa: Move command buffers map to start of net device
> >   vdpa: extract vhost_vdpa_net_cvq_add from
> >     vhost_vdpa_net_handle_ctrl_avail
> >   vhost_net: add NetClientState->load() callback
> >   vdpa: Add virtio-net mac address via CVQ at start
> >   vdpa: Delete CVQ migration blocker
> >
> >  include/hw/virtio/vhost-vdpa.h     |   1 -
> >  include/net/net.h                  |   6 +
> >  hw/net/vhost_net.c                 |  17 +++
> >  hw/virtio/vhost-shadow-virtqueue.c |  27 ++--
> >  hw/virtio/vhost-vdpa.c             |  14 --
> >  net/vhost-vdpa.c                   | 225 ++++++++++++++++++-----------
> >  6 files changed, 178 insertions(+), 112 deletions(-)
> >
> > --
> > 2.31.1
> >
> >
> >
>
> Hi Jason,
>
> Should I send a new version of this series with the changes you
> proposed, or can they be done at pull time? (Mostly changes in patch
> messages).

A new series please.


> Can you confirm to me that there is no other action I need
> to perform?

No other from my side.

Thanks

>
> Thanks!
>


