Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC69D2D4C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:08:22 +0200 (CEST)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIa3B-0007Ch-GX
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iIZzq-0004sF-UB
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:04:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iIZzp-0007Eh-3d
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:04:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iIZzo-0007EN-Qx
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:04:53 -0400
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F0D1EC01092E
 for <qemu-devel@nongnu.org>; Thu, 10 Oct 2019 15:04:51 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id e13so6008898qto.18
 for <qemu-devel@nongnu.org>; Thu, 10 Oct 2019 08:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vcosvwsFUQBd9L1CA4OUm08AT5a2nTzFohYXnkoGQRE=;
 b=KVUlTfhX33i5qKUWmEySq+uKHGWR9KXiAEsadaPWFne3rES/gQDDjd0t95J/hv7D1m
 P7psqryfIuwMiE0tW1PzbcKMMTyRywaqANcpzGIQsmeGHWnNciqQd6KC79pW+pPRlS+6
 9zvbxs3XgU+yEtq7KFg18Gxoh88iEh/hFG8KpgvqO1G440B1P4biheARoBobCu2rRbmd
 0DQDJlC+OnAJoCmotFobv1C+Rb0wONoLO7+PMNu6isglb4dQVPnz0s8LOYTiTJoeMD0z
 VS8a4eXKTRt/lNNOa7NpLhcvirnE2aN6m1JCZjkf2vbxKEWt6dFWFNL8UL0b/xJ+syR0
 a1gQ==
X-Gm-Message-State: APjAAAVjZbkiszx2fUijRoZiRMKq8q/lIbsBovYWI2uScsNEfaFZYjtu
 PgxLGLbP60EHAz9l38c1TVQ8Zr7Iqx68SfY9isF/keAMr9OMz3M59aCozr8KOBD58YtzuLWXMv4
 lk2ju1XlpGQohboQ=
X-Received: by 2002:a0c:d610:: with SMTP id c16mr10186027qvj.229.1570719890043; 
 Thu, 10 Oct 2019 08:04:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5JhnXR1lbc/Wy3FiH9Luun4nxiWMAcC010A1EwIR0I2ZOKhkIq+URHgfbaefmf3RO7vlc1g==
X-Received: by 2002:a0c:d610:: with SMTP id c16mr10185983qvj.229.1570719889707; 
 Thu, 10 Oct 2019 08:04:49 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 e5sm3383144qtk.35.2019.10.10.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:04:48 -0700 (PDT)
Date: Thu, 10 Oct 2019 11:04:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
Subject: Re: [PATCH v3] virtio-net: prevent offloads reset on migration
Message-ID: <20191010105212-mutt-send-email-mst@kernel.org>
References: <1570709475-32073-1-git-send-email-mikhail.sennikovskii@cloud.ionos.com>
 <1570709475-32073-2-git-send-email-mikhail.sennikovskii@cloud.ionos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570709475-32073-2-git-send-email-mikhail.sennikovskii@cloud.ionos.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 10, 2019 at 02:11:15PM +0200, Mikhail Sennikovsky wrote:
> Currently offloads disabled by guest via the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
> command are not preserved on VM migration.
> Instead all offloads reported by guest features (via VIRTIO_PCI_GUEST_FEATURES)
> get enabled.
> What happens is: first the VirtIONet::curr_guest_offloads gets restored
> and offloads are getting set correctly:
> 
>  #0  qemu_set_offload (nc=0x555556a11400, csum=1, tso4=0, tso6=0, ecn=0, ufo=0) at net/net.c:474
>  #1  virtio_net_apply_guest_offloads (n=0x555557701ca0) at hw/net/virtio-net.c:720
>  #2  virtio_net_post_load_device (opaque=0x555557701ca0, version_id=11) at hw/net/virtio-net.c:2334
>  #3  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577c80 <vmstate_virtio_net_device>, opaque=0x555557701ca0, version_id=11)
>      at migration/vmstate.c:168
>  #4  virtio_load (vdev=0x555557701ca0, f=0x5555569dc010, version_id=11) at hw/virtio/virtio.c:2197
>  #5  virtio_device_get (f=0x5555569dc010, opaque=0x555557701ca0, size=0, field=0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:2036
>  #6  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577ce0 <vmstate_virtio_net>, opaque=0x555557701ca0, version_id=11) at migration/vmstate.c:143
>  #7  vmstate_load (f=0x5555569dc010, se=0x5555578189e0) at migration/savevm.c:829
>  #8  qemu_loadvm_section_start_full (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2211
>  #9  qemu_loadvm_state_main (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2395
>  #10 qemu_loadvm_state (f=0x5555569dc010) at migration/savevm.c:2467
>  #11 process_incoming_migration_co (opaque=0x0) at migration/migration.c:449
> 
> However later on the features are getting restored, and offloads get reset to
> everything supported by features:
> 
>  #0  qemu_set_offload (nc=0x555556a11400, csum=1, tso4=1, tso6=1, ecn=0, ufo=0) at net/net.c:474
>  #1  virtio_net_apply_guest_offloads (n=0x555557701ca0) at hw/net/virtio-net.c:720
>  #2  virtio_net_set_features (vdev=0x555557701ca0, features=5104441767) at hw/net/virtio-net.c:773
>  #3  virtio_set_features_nocheck (vdev=0x555557701ca0, val=5104441767) at hw/virtio/virtio.c:2052
>  #4  virtio_load (vdev=0x555557701ca0, f=0x5555569dc010, version_id=11) at hw/virtio/virtio.c:2220
>  #5  virtio_device_get (f=0x5555569dc010, opaque=0x555557701ca0, size=0, field=0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:2036
>  #6  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577ce0 <vmstate_virtio_net>, opaque=0x555557701ca0, version_id=11) at migration/vmstate.c:143
>  #7  vmstate_load (f=0x5555569dc010, se=0x5555578189e0) at migration/savevm.c:829
>  #8  qemu_loadvm_section_start_full (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2211
>  #9  qemu_loadvm_state_main (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2395
>  #10 qemu_loadvm_state (f=0x5555569dc010) at migration/savevm.c:2467
>  #11 process_incoming_migration_co (opaque=0x0) at migration/migration.c:449
> 
> Fix this by making the virtio_net_set_features not reset
> the curr_guest_offloads in case the VM runstate is RUN_STATE_INMIGRATE
> 
> Signed-off-by: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>

I thought more about it and I really think the problem here is
different: we really should first set features and then apply offloads.

It is simply dumb that we are calling device specific
code before initializing generic virtio.

The logical order of initialization should be:

init base class
init derived class


instead we have it all spread out :(



What to do about it?
Could we maybe teach vmstate to record post load hooks
it needs to run *somewhere*?
Then we could load device specific state and record post load
hooks, then load generic state, run generic post load,
then run device specific post load hooks.

Dave, what do you think?


> ---
>  hw/net/virtio-net.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index b9e1cd7..49be172 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -767,7 +767,14 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>      n->rsc6_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
>          virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO6);
>  
> -    if (n->has_vnet_hdr) {
> +    /*
> +     * In case of RUN_STATE_INMIGRATE the virtio_net_set_features
> +     * is called as part of VM state restore process.
> +     * At this stage we do not want the curr_guest_offloads to be reset,
> +     * i.e. want to preserve them in the same state as was set
> +     * by the guest on the source machine.
> +     */
> +    if (n->has_vnet_hdr && !runstate_check(RUN_STATE_INMIGRATE)) {
>          n->curr_guest_offloads =
>              virtio_net_guest_offloads_by_features(features);
>          virtio_net_apply_guest_offloads(n);
> -- 
> 2.7.4

