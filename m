Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F36429C2E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 06:08:37 +0200 (CEST)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma95g-0007W9-7v
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 00:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma93n-0006pK-S1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 00:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma93m-0007di-2r
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 00:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634011597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEEfo6/fO7vnWVX0k3aMZCS0u4yEik1OBiwvcb73+bY=;
 b=iY7GebVThfzUVhGP1vtYDM0F4OysIHKXd7puzbPqBfj6qlgMMV1XqjbyKg4OsCtzP9+HRR
 /XQHDrX5h6H9gBw2bCXHv6gwAN62hypdM7QOPRD4WromO4CO5fh0Ns2/j4WM6Oot5X1HHk
 JeaUApuS/ikOSlBD86RWui7wBKEGXRU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-TruKgbrwNQ20os3iWF-4xg-1; Tue, 12 Oct 2021 00:06:35 -0400
X-MC-Unique: TruKgbrwNQ20os3iWF-4xg-1
Received: by mail-lf1-f70.google.com with SMTP id
 bi16-20020a0565120e9000b003fd56ef5a94so13085161lfb.3
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 21:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FEEfo6/fO7vnWVX0k3aMZCS0u4yEik1OBiwvcb73+bY=;
 b=bRssqaXvB2DXcHy+8JDNMth7dVuhlFVo540rv8aGZEQzsTffy38kddHDpirs6Hv45O
 YrQe0OXLYkP4hXevqcFkCChO0rLT5m+6lGcpDCfjM2OWgludoUrwQsLa1nGYF8LlBoom
 JuQmM7oGqdg/dp+JwKn358OXj5V1FaIaT939hhpxMnbSl1r8TBOzXRVTlqzpPsgUgmER
 k1MU2HvyILdB4MYtVXtvZDtGtO1mJGC6JMR5wtsAapQOJSekrg3O70xl/ifL9ehrcuNF
 5Iz9hyql7s89rMl4K6YFGyaqtwUZNmy1+1Dih9Z5IaVoDA5RCq9XUM0xVA3XNIIkwayA
 GTqw==
X-Gm-Message-State: AOAM531o8n7+z3K9l72sDDk3gbrpnOu/7CsamOWuU7dXk21d/oMqDq3C
 DOTvLa2ngSADsWZTYxR4Pi+ofxpNRyhA+A9Eh1wbneoCw6ExSl+qx1Rx2BGI6PcTmNtOr/BJV1i
 JkoQUb6fWg1jdsNyMJQg5CmHNTloNz+0=
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr7851187ljf.107.1634011593880; 
 Mon, 11 Oct 2021 21:06:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT2mncpArnx1I4VGQ2+qfICD/ll4RDk/14xrqiwVrrF92XtuUcahJCyNw/3aVVN3pnra8I4t/Lc6MRY/KUQOA=
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr7851162ljf.107.1634011593595; 
 Mon, 11 Oct 2021 21:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <9f438a35-a5ff-1891-24e6-dd11d1a3bba6@redhat.com>
In-Reply-To: <9f438a35-a5ff-1891-24e6-dd11d1a3bba6@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Oct 2021 12:06:17 +0800
Message-ID: <CACGkMEvQrJKYZ_xm+f5saZwd7jkYcDOdhNQXwHPU1PvGjGCFLA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/20] vDPA shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 11:59 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This series enable shadow virtqueue (SVQ) for vhost-vdpa devices. This
> > is intended as a new method of tracking the memory the devices touch
> > during a migration process: Instead of relay on vhost device's dirty
> > logging capability, SVQ intercepts the VQ dataplane forwarding the
> > descriptors between VM and device. This way qemu is the effective
> > writer of guests memory, like in qemu's virtio device operation.
> >
> > When SVQ is enabled qemu offers a new vring to the device to read
> > and write into, and also intercepts kicks and calls between the device
> > and the guest. Used buffers relay would cause dirty memory being
> > tracked, but at this RFC SVQ is not enabled on migration automatically.
> >
> > It is based on the ideas of DPDK SW assisted LM, in the series of
> > DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> > not map the shadow vq in guest's VA, but in qemu's.
> >
> > For qemu to use shadow virtqueues the guest virtio driver must not use
> > features like event_idx or indirect descriptors. These limitations will
> > be addressed in later series, but they are left out for simplicity at
> > the moment.
> >
> > SVQ needs to be enabled with QMP command:
> >
> > { "execute": "x-vhost-enable-shadow-vq",
> >        "arguments": { "name": "dev0", "enable": true } }
> >
> > This series includes some patches to delete in the final version that
> > helps with its testing. The first two of the series freely implements
> > the feature to stop the device and be able to retrieve its status. It's
> > intended to be used with vp_vpda driver in a nested environment. This
> > driver also need modifications to forward the new status bit.
> >
> > Patches 2-8 prepares the SVQ and QMP command to support guest to host
> > notifications forwarding. If the SVQ is enabled with these ones
> > applied and the device supports it, that part can be tested in
> > isolation (for example, with networking), hopping through SVQ.
> >
> > Same thing is true with patches 9-13, but with device to guest
> > notifications.
> >
> > The rest of the patches implements the actual buffer forwarding.
> >
> > Comments are welcome.
>
>
> Hi Eugenio:
>
>
> It would be helpful to have a public git repo for us to ease the review.
>
> Thanks
>

Btw, we also need to measure the performance impact of the shadow virtqueue=
.

Thanks


