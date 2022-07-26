Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB018581495
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:55:35 +0200 (CEST)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGL24-0005YC-GX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGKy5-0003du-Bf
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGKy3-0007t5-Cd
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658843482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lhPIlzddAv4/4utORiZyxe6VDsMAiJDdljFSjfEgYJg=;
 b=LK5029zvwMPlzs5jVeR/BhKATuopyfVLwD2IakDlz0gxa18ekC/bcSg/kUJDdBMUFXPLFI
 C3oD3nPus6V5kEmrZ1fiRdRvmztRXQUZ1O1OQq83lZlqnOWPrBeHC1VtMRieP3UxR+jhkl
 87d8stDv8SER4CO9IPWl8KM0U+8vee8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-e1sjLS77MIufdKxeZLB1aA-1; Tue, 26 Jul 2022 09:51:21 -0400
X-MC-Unique: e1sjLS77MIufdKxeZLB1aA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i133-20020a1c3b8b000000b003a2fe4c345cso6699366wma.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 06:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lhPIlzddAv4/4utORiZyxe6VDsMAiJDdljFSjfEgYJg=;
 b=x6GOTX+xEdKYT4Wemz3cwhlN/ojaN8cz0NgOL15s1VKnSVHckEDJygQ7aQ28Lq11dr
 13l4BTpI1DjfwtQ33EyID7fsDrWxZeZMncStE7sGZw8wXxG1KC+nMLB/psV0a5TRUk5H
 iPUWUGKdV48gTz5MvRW5n66jtdbDKrT87i3aI8LPBgv1sa58/ElGHEHZBRvE969frxpo
 Uq0D2R24DfgycGAg7bs/M9aqK3E3U7b7liUxSkveT9T7/j3uTiQl1nmX1JWbahE+lfDM
 b+aYuVbVOadRGw4uXvFMAIuILrw1TR7heK44+z570vV//juz3+Z/kGfLl/8DRV3lLZje
 7sNg==
X-Gm-Message-State: AJIora/XX02OlIF4xM4rLxGer+iDemKSZCxOyxLxSe2xshQ4DvHvFlyQ
 Fh0JuqQcDEAtrrvbtFv/Ljuwz9ORrsyOidq8mI/6xoQBDtb336Ppa8BxK8b0Wgnpvi1o4beq/kI
 lh+iAXhwZE6sAmfI=
X-Received: by 2002:a05:600c:5128:b0:3a3:2160:7a7b with SMTP id
 o40-20020a05600c512800b003a321607a7bmr24852741wms.204.1658843479818; 
 Tue, 26 Jul 2022 06:51:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vbcNtop5a/I5dilrWJNJYStGwqn2NBnCkrmKRr5SQ3kqIpz3l0iRxep/mt2WzfG+pCnwYs/g==
X-Received: by 2002:a05:600c:5128:b0:3a3:2160:7a7b with SMTP id
 o40-20020a05600c512800b003a321607a7bmr24852713wms.204.1658843479491; 
 Tue, 26 Jul 2022 06:51:19 -0700 (PDT)
Received: from redhat.com ([2.55.4.105]) by smtp.gmail.com with ESMTPSA id
 e10-20020adfe7ca000000b0021dbaa4f38dsm17337120wrn.18.2022.07.26.06.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 06:51:18 -0700 (PDT)
Date: Tue, 26 Jul 2022 09:51:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, stefanha@redhat.com, den@virtuozzo.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <20220726094740-mutt-send-email-mst@kernel.org>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
> Although QEMU virtio-blk is quite fast, there is still some room for
> improvements. Disk latency can be reduced if we handle virito-blk requests
> in host kernel so we avoid a lot of syscalls and context switches.
> 
> The biggest disadvantage of this vhost-blk flavor is raw format.
> Luckily Kirill Thai proposed device mapper driver for QCOW2 format to attach
> files as block devices: https://www.spinics.net/lists/kernel/msg4292965.html

That one seems stalled. Do you plan to work on that too?

> Also by using kernel modules we can bypass iothread limitation and finaly scale
> block requests with cpus for high-performance devices. This is planned to be
> implemented in next version.
> 
> Linux kernel module part:
> https://lore.kernel.org/kvm/20220725202753.298725-1-andrey.zhadchenko@virtuozzo.com/
> 
> test setups and results:
> fio --direct=1 --rw=randread  --bs=4k  --ioengine=libaio --iodepth=128
> QEMU drive options: cache=none
> filesystem: xfs
> 
> SSD:
>                | randread, IOPS  | randwrite, IOPS |
> Host           |      95.8k	 |	85.3k	   |
> QEMU virtio    |      57.5k	 |	79.4k	   |
> QEMU vhost-blk |      95.6k	 |	84.3k	   |
> 
> RAMDISK (vq == vcpu):
>                  | randread, IOPS | randwrite, IOPS |
> virtio, 1vcpu    |	123k	  |	 129k       |
> virtio, 2vcpu    |	253k (??) |	 250k (??)  |
> virtio, 4vcpu    |	158k	  |	 154k       |
> vhost-blk, 1vcpu |	110k	  |	 113k       |
> vhost-blk, 2vcpu |	247k	  |	 252k       |
> vhost-blk, 4vcpu |	576k	  |	 567k       |
> 
> Andrey Zhadchenko (1):
>   block: add vhost-blk backend


From vhost/virtio side the patchset looks ok. But let's see what do
block devs think about it.


>  configure                     |  13 ++
>  hw/block/Kconfig              |   5 +
>  hw/block/meson.build          |   1 +
>  hw/block/vhost-blk.c          | 395 ++++++++++++++++++++++++++++++++++
>  hw/virtio/meson.build         |   1 +
>  hw/virtio/vhost-blk-pci.c     | 102 +++++++++
>  include/hw/virtio/vhost-blk.h |  44 ++++
>  linux-headers/linux/vhost.h   |   3 +
>  8 files changed, 564 insertions(+)
>  create mode 100644 hw/block/vhost-blk.c
>  create mode 100644 hw/virtio/vhost-blk-pci.c
>  create mode 100644 include/hw/virtio/vhost-blk.h
> 
> -- 
> 2.31.1


