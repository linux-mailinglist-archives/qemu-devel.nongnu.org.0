Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D52F2D4AEE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:49:45 +0100 (CET)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5T6-0006Ad-2N
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4pY-00050j-4F
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:08:52 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:44537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4pV-0001cY-FC
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:08:51 -0500
Received: by mail-io1-xd44.google.com with SMTP id z5so2742839iob.11
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 11:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CnKxNHN4m6y2yJUCzP6bslM8aaY6GRHer4WkdpuQSXg=;
 b=W+5exp91toEmxdDXax5wCy+Lb1K4zA0On22MGVjt4xU1iXmpmc1fU+hlJJTL/iFOdN
 onBz9Wb5RQg6RqdKdTKJAZDK6STm8TVK/PmwMEx2neC5hG0bT4xCP+Ydblilbd2h+ZFu
 +Mv+OElxa8VQ4uEynQulPUJ3F570/ITkRsSlkkmKl1Q12pvUJ1h9s6909aEwwlu6HkGc
 PkTwb/PKj5ioa4d+R1MTAxJn2nwZgzz3oJTxfgCp57O69ntrfH/eu5/noDZCpsv11Tjz
 vSgptn0V7gQ6hRT+yo1SObQnUHCOaL1+PEjRSHB4g293Z8uLrA1hZbKhdPo7K70/i8LH
 fQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CnKxNHN4m6y2yJUCzP6bslM8aaY6GRHer4WkdpuQSXg=;
 b=aIDLzPGgsY5/1HAir0DQ5SSK45At4COpePxAmDSULDZVPfiLgWmHVFoGbsuHHS9MXp
 3Rhil5cnVXXZ2d7O7mjLiGRfqXlFjqobq5rq5JN7PRH884NGBqIlwCPtNcAgEeMV9EXw
 3SUvjHnSRIXH3S+3N+ELYExbqrWX3kft1pqT7Gay74pZeyrhy7GbhgtYxdAcZU2U2SRp
 77Vom/QOQW9IFRr2Ufg2dMx+CjbvYszBiwp5mmcJ1gdW2lX/Odf8oQQmobvvnevWQne7
 bQWBqJvfleoRmaC1EQqg8TnDnXTTpbVZ1tXDV0PVwJh8fnOGQ3nGzzg2HScowbxSmIK7
 bryw==
X-Gm-Message-State: AOAM53200yw+KHW8e7uiY1O/R7Ha2AyY0Fsn+ZY4Zd0Y6B7KgpJPfK/Q
 WGUZFGBMyk8Bql4Jr96y4Qxa+tqDDytCxDvjLVU=
X-Google-Smtp-Source: ABdhPJywJh5t6ueXXTpq3okgVQo/p+oK1nIB1VVhTH6OhjA66X1R6U6otLkh/c42aWQWkzC5sjeD7ZF9yr/HiaCB61k=
X-Received: by 2002:a5d:9c91:: with SMTP id p17mr4619181iop.36.1607540928576; 
 Wed, 09 Dec 2020 11:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-3-david@redhat.com>
In-Reply-To: <20201208163950.29617-3-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 9 Dec 2020 20:08:37 +0100
Message-ID: <CAM9Jb+ja6eWz3FAYwteMPs--JE6sU79z1vpC3bj5+jV+YpOuGg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] virtio-mem: Factor out traversing unplugged
 ranges
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Let's factor out the core logic, to be reused soon.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/virtio/virtio-mem.c | 86 ++++++++++++++++++++++++------------------
>  1 file changed, 49 insertions(+), 37 deletions(-)
>
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 655824ff81..471e464171 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -145,6 +145,33 @@ static bool virtio_mem_is_busy(void)
>      return migration_in_incoming_postcopy() || !migration_is_idle();
>  }
>
> +typedef int (*virtio_mem_range_cb)(const VirtIOMEM *vmem, void *arg,
> +                                   uint64_t offset, uint64_t size);
> +
> +static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
> +                                               virtio_mem_range_cb cb)
> +{
> +    unsigned long first_zero_bit, last_zero_bit;
> +    uint64_t offset, size;
> +    int ret = 0;
> +
> +    first_zero_bit = find_first_zero_bit(vmem->bitmap, vmem->bitmap_size);
> +    while (first_zero_bit < vmem->bitmap_size) {
> +        offset = first_zero_bit * vmem->block_size;
> +        last_zero_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
> +                                      first_zero_bit + 1) - 1;
> +        size = (last_zero_bit - first_zero_bit + 1) * vmem->block_size;
> +
> +        ret = cb(vmem, arg, offset, size);
> +        if (ret) {
> +            break;
> +        }
> +        first_zero_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
> +                                            last_zero_bit + 2);
> +    }
> +    return ret;
> +}
> +
>  static bool virtio_mem_test_bitmap(VirtIOMEM *vmem, uint64_t start_gpa,
>                                     uint64_t size, bool plugged)
>  {
> @@ -594,33 +621,27 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
>      ram_block_discard_require(false);
>  }
>
> -static int virtio_mem_restore_unplugged(VirtIOMEM *vmem)
> +static int virtio_mem_discard_range_cb(const VirtIOMEM *vmem, void *arg,
> +                                       uint64_t offset, uint64_t size)
>  {
>      RAMBlock *rb = vmem->memdev->mr.ram_block;
> -    unsigned long first_zero_bit, last_zero_bit;
> -    uint64_t offset, length;
>      int ret;
>
> -    /* Find consecutive unplugged blocks and discard the consecutive range. */
> -    first_zero_bit = find_first_zero_bit(vmem->bitmap, vmem->bitmap_size);
> -    while (first_zero_bit < vmem->bitmap_size) {
> -        offset = first_zero_bit * vmem->block_size;
> -        last_zero_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
> -                                      first_zero_bit + 1) - 1;
> -        length = (last_zero_bit - first_zero_bit + 1) * vmem->block_size;
> -
> -        ret = ram_block_discard_range(rb, offset, length);
> -        if (ret) {
> -            error_report("Unexpected error discarding RAM: %s",
> -                         strerror(-ret));
> -            return -EINVAL;
> -        }
> -        first_zero_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
> -                                            last_zero_bit + 2);
> +    ret = ram_block_discard_range(rb, offset, size);
> +    if (ret) {
> +        error_report("Unexpected error discarding RAM: %s", strerror(-ret));
> +        return -EINVAL;
>      }
>      return 0;
>  }
>
> +static int virtio_mem_restore_unplugged(VirtIOMEM *vmem)
> +{
> +    /* Make sure all memory is really discarded after migration. */
> +    return virtio_mem_for_each_unplugged_range(vmem, NULL,
> +                                               virtio_mem_discard_range_cb);
> +}
> +
>  static int virtio_mem_post_load(void *opaque, int version_id)
>  {
>      if (migration_in_incoming_postcopy()) {
> @@ -872,28 +893,19 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
>      vmem->block_size = value;
>  }
>
> -static void virtio_mem_precopy_exclude_unplugged(VirtIOMEM *vmem)
> +static int virtio_mem_precopy_exclude_range_cb(const VirtIOMEM *vmem, void *arg,
> +                                               uint64_t offset, uint64_t size)
>  {
>      void * const host = qemu_ram_get_host_addr(vmem->memdev->mr.ram_block);
> -    unsigned long first_zero_bit, last_zero_bit;
> -    uint64_t offset, length;
>
> -    /*
> -     * Find consecutive unplugged blocks and exclude them from migration.
> -     *
> -     * Note: Blocks cannot get (un)plugged during precopy, no locking needed.
> -     */
> -    first_zero_bit = find_first_zero_bit(vmem->bitmap, vmem->bitmap_size);
> -    while (first_zero_bit < vmem->bitmap_size) {
> -        offset = first_zero_bit * vmem->block_size;
> -        last_zero_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
> -                                      first_zero_bit + 1) - 1;
> -        length = (last_zero_bit - first_zero_bit + 1) * vmem->block_size;
> +    qemu_guest_free_page_hint(host + offset, size);
> +    return 0;
> +}
>
> -        qemu_guest_free_page_hint(host + offset, length);
> -        first_zero_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
> -                                            last_zero_bit + 2);
> -    }
> +static void virtio_mem_precopy_exclude_unplugged(VirtIOMEM *vmem)
> +{
> +    virtio_mem_for_each_unplugged_range(vmem, NULL,
> +                                        virtio_mem_precopy_exclude_range_cb);
>  }
>
>  static int virtio_mem_precopy_notify(NotifierWithReturn *n, void *data)

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

