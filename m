Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026C2D5E9B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:51:46 +0100 (CET)
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNIH-0002pu-Hu
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1knNE6-0008Pt-Q5
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:47:27 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1knNE2-0005rz-Jx
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:47:26 -0500
Received: by mail-io1-xd44.google.com with SMTP id n4so5739495iow.12
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9g8sBrnA+RbVK7UGq5E9n9J/+BjsylR6CGwX1jg5OA=;
 b=fn1P7lgH7jL7cmm4w+/pNdUbP9LKoOvlYT9ZFQjd1dvaol5TKQw4ZQH4aQTrkFk7Re
 1MYFUNGgYY6FMMWE/Dh5rSIYEtZnBF4xxQKsjJbfqeUPDmzqZ5srYz1r2kH5JO31NGSO
 DuiI5p4/u+Z14BPUc09o8hBKzZ92oPg/FXYuZpuwDcndqqr+NfAZBuV1u+klC4M4KWWi
 id857ojzbUOwuZtHwGlbbxfESIHMoCWPLDF9BqVA377rV3lTdPNARuY0EAY/mQSTfPY8
 VS3v23CMzZlVgNTS27fJrs8DvYL2BxShHTBgOYPBULRMt+JCOV03es3tlkp70jZFKA5N
 nDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9g8sBrnA+RbVK7UGq5E9n9J/+BjsylR6CGwX1jg5OA=;
 b=LG7FYgYttc3hvdSO5W0vZVeMjn9DDDx6/AtYnR7sySwvJDtkh6v7rVYqgTrHoAf21P
 J9AlKIZ3DHKSOaDanHVT1G0vZr+ukav/lCZUqdaaGolJEfX9FXKUYTFUFRELV1DAijgV
 B+BSwYE+mm6RsXIS64K4QIh1IoxKqRRchI9jkYMY1ArH94FeaqpVvgae/45aJYtSrFCx
 yFUa6sSlC7v3In5O9GBoUGBkAQ/6IunI0u4vLM7oTLdNUVDe7fNE1mRlqWC7nlYqQTvp
 njWXa9m/eXDXG82Mv+fth6PRMx/oY0draUscVnFJeZIueYFUgu74k7NDpsCinHG/o+6A
 XfNg==
X-Gm-Message-State: AOAM531MguMCnIIaADz9WYWuvpmxYuArzGQCIVYsxlVAuAmFkp5Cyrv7
 q5Lflc8KZJit9GpJfzhiiLsmMf01fRQSEsHwSa4=
X-Google-Smtp-Source: ABdhPJzJrOKvmVWlWgKwsLGq3iDGekQ8M+3OupzNdWGGz22ViJgYrDiOiLI0eoYF6JQxWPiv0dAGUqkeCrd1k34RY5E=
X-Received: by 2002:a5d:85c7:: with SMTP id e7mr8649640ios.162.1607611637293; 
 Thu, 10 Dec 2020 06:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-11-david@redhat.com>
In-Reply-To: <20201208163950.29617-11-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 10 Dec 2020 15:47:06 +0100
Message-ID: <CAM9Jb+iOYRqYSrX9ERGfO3xvx2+HUGF+=EQrgzghJ_WPVoBfqg@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] vfio: Disable only uncoordinated discards
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

> We support coordinated discarding of RAM using the RamDiscardMgr. Let's
> unlock support for coordinated discards, keeping uncoordinated discards
> (e.g., via virtio-balloon) disabled.
>
> This unlocks virtio-mem + vfio. Note that vfio used via "nvme://" by the
> block layer has to be implemented/unlocked separately. For now,
> virtio-mem only supports x86-64 - spapr IOMMUs are not tested/affected.
>
> Note: The block size of a virtio-mem device has to be set to sane sizes,
> depending on the maximum hotplug size - to not run out of vfio mappings.
> The default virtio-mem block size is usually in the range of a couple of
> MBs. The maximum number of mapping is 64k, shared with other users.
> Assume you want to hotplug 256GB using virtio-mem - the block size would
> have to be set to at least 8 MiB (resulting in 32768 separate mappings).
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
>  hw/vfio/common.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 57c83a2f14..3ce5e26bab 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1974,8 +1974,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>       * new memory, it will not yet set ram_block_discard_set_required() and
>       * therefore, neither stops us here or deals with the sudden memory
>       * consumption of inflated memory.
> +     *
> +     * We do support discarding of memory coordinated via the RamDiscardMgr.
>       */
> -    ret = ram_block_discard_disable(true);
> +    ret = ram_block_uncoordinated_discard_disable(true);
>      if (ret) {
>          error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
>          return ret;
> @@ -2155,7 +2157,7 @@ close_fd_exit:
>      close(fd);
>
>  put_space_exit:
> -    ram_block_discard_disable(false);
> +    ram_block_uncoordinated_discard_disable(false);
>      vfio_put_address_space(space);
>
>      return ret;
> @@ -2277,7 +2279,7 @@ void vfio_put_group(VFIOGroup *group)
>      }
>
>      if (!group->ram_block_discard_allowed) {
> -        ram_block_discard_disable(false);
> +        ram_block_uncoordinated_discard_disable(false);
>      }
>      vfio_kvm_device_del_group(group);
>      vfio_disconnect_container(group);
> @@ -2331,7 +2333,7 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>
>          if (!group->ram_block_discard_allowed) {
>              group->ram_block_discard_allowed = true;
> -            ram_block_discard_disable(false);
> +            ram_block_uncoordinated_discard_disable(false);
>          }
>      }
>
Looks good to me.
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

