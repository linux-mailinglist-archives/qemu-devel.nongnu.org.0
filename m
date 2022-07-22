Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95B57DB89
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:54:10 +0200 (CEST)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEnU7-00086J-R5
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oEnNo-0004pk-Ut
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oEnNl-0007FW-RV
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658476051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=shwlVv+FbeU3zMEq2/nwRFuQclElHDaZSUofPPZVmkk=;
 b=KeUk2ArXgi/AitGLwAA3L9Lpe/8HZFJQPfpz8g6uBYPFDZ4g/EYvvXE1owfiiHYBbHdKo2
 eff5lktZ+0KDKTqPoyHDG8nBNs5DXf8hCq/MDsbhvpJX1Jt5olamI+XneQ2im3h2FYH2Im
 rAYhGdk8Kck9hZL2zff9y0NQv41+ScY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-VZogwqNMMAOQWrRQKE42Yw-1; Fri, 22 Jul 2022 03:47:29 -0400
X-MC-Unique: VZogwqNMMAOQWrRQKE42Yw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w15-20020a056402268f00b0043ac600a6bcso2400084edd.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 00:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shwlVv+FbeU3zMEq2/nwRFuQclElHDaZSUofPPZVmkk=;
 b=g04GHOZFOXbYEqbFX46H6U2FimJwe+LHOyfbnSGFMS2gXnFb0hLPMjqGlwBi0kjA8O
 b+7dumzNli0l0TLtvsb69y6J2Pvu4ay+c40bcnM8/vMbAYxVQQv8c7JoqgRHrW983W71
 lEBDsp723SxpQeehxBthiwL+X9FVbrBlO384eA6JAES4wlxxsjwJtzxORH3+hO342Xrk
 2+PxOj5aSydg/bh8qRrWSn/DP3tPS4PBmrGYxzeqIA8cM7eZn6OimliYSm9HIGWrE6Zf
 eW90DzlAAZ9DcdhEbbYwqkYaeWPDAeMKDvYqxwUW1CDW2h52uB6FBlqZAQuCdmZfICQf
 PpqA==
X-Gm-Message-State: AJIora8sy+1AhhyA8pqkl2taAtV/iApmel3X/pDN5dSVHwAqH2c8DtML
 uJRAqvqwq+37m8r88sLDZW9rqyp5+3AOdwXCWSwcazpuMgSATiHGWFLsfkrE2IlQf5d+3O+sm5B
 tlYaaQlxKcap8bgr2iy3c7L9juKYsD5s=
X-Received: by 2002:a05:6402:388d:b0:43b:a17b:6212 with SMTP id
 fd13-20020a056402388d00b0043ba17b6212mr2226671edb.51.1658476048335; 
 Fri, 22 Jul 2022 00:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tRqVF391n/l9ROOp1U2BLMMDllLnmqVlBbiZ+vjQP0cJFKwBQQU2/07W+y/xKZbDzCfQPplx56Fs+Wy0jGB8Y=
X-Received: by 2002:a05:6402:388d:b0:43b:a17b:6212 with SMTP id
 fd13-20020a056402388d00b0043ba17b6212mr2226654edb.51.1658476048133; Fri, 22
 Jul 2022 00:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220720131204.591104-1-lulu@redhat.com>
In-Reply-To: <20220720131204.591104-1-lulu@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Fri, 22 Jul 2022 15:46:52 +0800
Message-ID: <CACLfguXo3=h0PsHh+oehVcTjRNSqwOCiG9-VM_o7HjUdZBtxcA@mail.gmail.com>
Subject: Re: [PATCH v13 00/10] vhost-vdpa: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Cc: Jason Wang <jasowang@redhat.com>, virtio-fs@redhat.com, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

Hi Micheal.
Would you help review these patches, not sure if this is ok to merge?
Thanks
Cindy

On Wed, Jul 20, 2022 at 9:12 PM Cindy Lu <lulu@redhat.com> wrote:
>
> Add support for virtio-mmio bus
> active the notifier while the backend support configure interrupt
> misc fixes from v1
>
> Change in v3
> fix the coding style problems
>
> Change in v4
> misc fixes from v3
> merge the set_config_notifier to set_guest_notifier
> when vdpa start, check the feature by VIRTIO_NET_F_STATUS
>
> Change in v5
> misc fixes from v4
> split the code to introduce configure interrupt type and the callback function
> will init the configure interrupt in all virtio-pci and virtio-mmio bus, but will
> only active while using vhost-vdpa driver
>
> Change in v6
> misc fixes from v5
> decouple vq from interrupt setting and misc process
> fix the bug in virtio_net_handle_rx
>
> Change in v7
> misc fixes from v6
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move config_notifier and masked_config_notifier to VirtIODevice
> fix the bug in virtio_net_handle_rx, add more information
> add VIRTIO_CONFIG_IRQ_IDX as the queue number for configure interrupt
>
> Change in v8
> misc fixes from v7
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move the vhost configure interrupt to vhost_net
>
> Change in v9
> misc fixes from v8
> address the comments from v8
>
> Change in v10
> fix the hang issue in qtest
> address the comments from v9
>
> Change in v11
> fix the crash in aarch64 plateform.
> fix the crash upstream reported
>
> Changes in v12
> fix the typo and the comments
>
> changes in v13
> re-send the patches by git-publish
>
> Cindy Lu (10):
>   virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
>   virtio-pci: decouple notifier from interrupt process
>   virtio-pci: decouple the single vector from the interrupt process
>   vhost: introduce new VhostOps vhost_set_config_call
>   vhost-vdpa: add support for config interrupt
>   virtio: add support for configure interrupt
>   vhost: add support for configure interrupt
>   virtio-net: add support for configure interrupt
>   virtio-mmio: add support for configure interrupt
>   virtio-pci: add support for configure interrupt
>
>  hw/display/vhost-user-gpu.c       |  13 ++
>  hw/net/vhost_net.c                |   9 +
>  hw/net/virtio-net.c               |  20 ++-
>  hw/virtio/trace-events            |   1 +
>  hw/virtio/vhost-user-fs.c         |  14 ++
>  hw/virtio/vhost-vdpa.c            |   8 +
>  hw/virtio/vhost-vsock-common.c    |  14 ++
>  hw/virtio/vhost.c                 |  78 +++++++-
>  hw/virtio/virtio-crypto.c         |  14 ++
>  hw/virtio/virtio-mmio.c           |  27 +++
>  hw/virtio/virtio-pci.c            | 283 +++++++++++++++++++++---------
>  hw/virtio/virtio-pci.h            |   4 +-
>  hw/virtio/virtio.c                |  29 +++
>  include/hw/virtio/vhost-backend.h |   3 +
>  include/hw/virtio/vhost.h         |   4 +
>  include/hw/virtio/virtio.h        |   7 +
>  include/net/vhost_net.h           |   2 +
>  17 files changed, 443 insertions(+), 87 deletions(-)
>
> --
> 2.34.3
>
>


