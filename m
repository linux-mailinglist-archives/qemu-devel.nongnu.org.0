Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5942C88A0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:52:25 +0100 (CET)
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjlTU-0006of-SE
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1kjlSR-0006FO-5H
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:51:19 -0500
Received: from ssh.movementarian.org ([2a01:7e00::f03c:92ff:fefb:3ad2]:45206
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1kjlSP-0002lt-Jl
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:51:18 -0500
Received: from movement by movementarian.org with local (Exim 4.93)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1kjlSL-009g5B-K6; Mon, 30 Nov 2020 15:51:13 +0000
Date: Mon, 30 Nov 2020 15:51:13 +0000
From: John Levon <john.levon@nutanix.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH] virtio: reset device on bad guest index in virtio_load()
Message-ID: <20201130155113.GA2306699@li1368-133.members.linode.com>
References: <20201120185103.GA442386@sent>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120185103.GA442386@sent>
X-Url: http://www.movementarian.org/
Received-SPF: none client-ip=2a01:7e00::f03c:92ff:fefb:3ad2;
 envelope-from=movement@li1368-133.members.linode.com; helo=movementarian.org
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, KHOP_HELO_FCRDNS=0.398,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 06:51:07PM +0000, John Levon wrote:

> If we find a queue with an inconsistent guest index value, explicitly mark the
> device as needing a reset - and broken - via virtio_error().
> 
> There's at least one driver implementation - the virtio-win NetKVM driver - that
> is able to handle a VIRTIO_CONFIG_S_NEEDS_RESET notification and successfully
> restore the device to a working state. Other implementations do not correctly
> handle this, but as the VQ is not in a functional state anyway, this is still
> worth doing.

Ping, anyone have issues with doing this?

cheers
john

> Signed-off-by: John Levon <john.levon@nutanix.com>
> ---
>  hw/virtio/virtio.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ceb58fda6c..eff35fab7c 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3161,12 +3161,15 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
>              nheads = vring_avail_idx(&vdev->vq[i]) - vdev->vq[i].last_avail_idx;
>              /* Check it isn't doing strange things with descriptor numbers. */
>              if (nheads > vdev->vq[i].vring.num) {
> -                qemu_log_mask(LOG_GUEST_ERROR,
> -                              "VQ %d size 0x%x Guest index 0x%x "
> -                              "inconsistent with Host index 0x%x: delta 0x%x",
> -                              i, vdev->vq[i].vring.num,
> -                              vring_avail_idx(&vdev->vq[i]),
> -                              vdev->vq[i].last_avail_idx, nheads);
> +                virtio_error(vdev, "VQ %d size 0x%x Guest index 0x%x "
> +                             "inconsistent with Host index 0x%x: delta 0x%x",
> +                             i, vdev->vq[i].vring.num,
> +                             vring_avail_idx(&vdev->vq[i]),
> +                             vdev->vq[i].last_avail_idx, nheads);
> +                vdev->vq[i].used_idx = 0;
> +                vdev->vq[i].shadow_avail_idx = 0;
> +                vdev->vq[i].inuse = 0;
> +                continue;
>              }
>              vdev->vq[i].used_idx = vring_used_idx(&vdev->vq[i]);
>              vdev->vq[i].shadow_avail_idx = vring_avail_idx(&vdev->vq[i]);

