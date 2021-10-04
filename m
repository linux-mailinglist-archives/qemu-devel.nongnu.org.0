Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C76421272
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:14:53 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPg4-0007Ay-7v
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXPcf-0002Vk-KA
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:11:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXPcX-0006f0-8k
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633360270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ux843V9sBaPXSuWOo/f9W2mo69Pvvd1o5UoCHIpH4w=;
 b=LUWSXRacH0q54FCQyapCGmAFf2NYrj+Q+Z/VKXUJ41Dunr70UrQyMg+HFT70Vt/+oG1Lmu
 t85dZRjnZhQAzIt46ngqj7Re9s9DYSBQv9p9e3DWtMN2ZrVL+Re27BXlKmjTA3BhYArINl
 HbTYSPK994P4gmKqudb7SXZENpg1uIY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-kpRt1vbiPXmHj90mB5WIqw-1; Mon, 04 Oct 2021 11:11:08 -0400
X-MC-Unique: kpRt1vbiPXmHj90mB5WIqw-1
Received: by mail-ed1-f72.google.com with SMTP id
 x96-20020a50bae9000000b003d871ecccd8so2558388ede.18
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 08:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4ux843V9sBaPXSuWOo/f9W2mo69Pvvd1o5UoCHIpH4w=;
 b=j0+5XjIRPrPqqJu+bSPFZhW9JWQcBT8vGnVNLxB2h3UFY/zWawmTelBe0+s9SZFyxw
 qrL8Xa1wrwiE4DJLb8kIcYxqX7rQ+mxW351mF2Oh6qVghsRVDxz4csck4Dd6rL2gJcK7
 ew39+kRQwrJriQMkN7AGjEFvyi1CPNMpH9XS/9s02KICDhaF6Rd7BAUS3xisSET3WIyk
 79fBDSCkjCbfh1He1DCzHSX3E2Yo4O/Fgz3vxnV7TYWnzCbVGNCLD5ZPQf/fK/TSkCYa
 ispOlY/eC7+ARqRZ66TOZg5wGNSN2jyoCX1H7UzGSjGKaNNwEU7gVl5LzCHj4jzvPJJY
 po6g==
X-Gm-Message-State: AOAM530izdx+a5jknMoNOm2fUXxsm6ONg+baTxNmtxBGHYs/d8Ky5JUW
 EdrbIznG9kjqrSAdCy55C5wLu2xaUm7nj7RVFImX3QwY5T4M2r888lQoMsppxj2DyZzgZGFKXxU
 svdV/TXyUJG4g1e4=
X-Received: by 2002:aa7:ccc1:: with SMTP id y1mr18960173edt.177.1633360264050; 
 Mon, 04 Oct 2021 08:11:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8W+6pZ+xqGq4cAVpwXg5VLQCjrRCHEse8N9o36xR+CS/qKw4AQTysmlu01dgU5OztT8pavw==
X-Received: by 2002:aa7:ccc1:: with SMTP id y1mr18960163edt.177.1633360263900; 
 Mon, 04 Oct 2021 08:11:03 -0700 (PDT)
Received: from redhat.com (93-172-224-64.bb.netvision.net.il. [93.172.224.64])
 by smtp.gmail.com with ESMTPSA id
 x16sm2056174ejj.8.2021.10.04.08.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 08:11:03 -0700 (PDT)
Date: Mon, 4 Oct 2021 11:11:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <20211004110855-mutt-send-email-mst@kernel.org>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, yc-core@yandex-team.ru, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 06:07:29PM +0300, Denis Plotnikov wrote:
> It might be useful for the cases when a slow block layer should be replaced
> with a more performant one on running VM without stopping, i.e. with very low
> downtime comparable with the one on migration.
> 
> It's possible to achive that for two reasons:
> 
> 1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
>   They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
>   each other in the values of migration service fields only.
> 2.The device driver used in the guest is the same: virtio-blk
> 
> In the series cross-migration is achieved by adding a new type.
> The new type uses virtio-blk VMState instead of vhost-user-blk specific
> VMstate, also it implements migration save/load callbacks to be compatible
> with migration stream produced by "virtio-blk" device.
> 
> Adding the new type instead of modifying the existing one is convenent.
> It ease to differ the new virtio-blk-compatible vhost-user-blk
> device from the existing non-compatible one using qemu machinery without any
> other modifiactions. That gives all the variety of qemu device related
> constraints out of box.

Hmm I'm not sure I understand. What is the advantage for the user?
What if vhost-user-blk became an alias for vhost-user-virtio-blk?
We could add some hacks to make it compatible for old machine types.

> 0001: adds new type "vhost-user-virtio-blk"
> 0002: add new type "vhost-user-virtio-blk-pci"
> 
> Denis Plotnikov (2):
>   vhost-user-blk: add a new vhost-user-virtio-blk type
>   vhost-user-blk-pci: add new pci device type to support
>     vhost-user-virtio-blk
> 
>  hw/block/vhost-user-blk.c          | 63 ++++++++++++++++++++++++++++++
>  hw/virtio/vhost-user-blk-pci.c     | 43 ++++++++++++++++++--
>  include/hw/virtio/vhost-user-blk.h |  2 +
>  3 files changed, 105 insertions(+), 3 deletions(-)
> 
> -- 
> 2.25.1


