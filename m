Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1A62F555D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 00:58:39 +0100 (CET)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzq2A-0006fd-28
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 18:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kzq15-0006FD-Cj
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:57:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kzq12-0006Hs-K8
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610582246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DrykCmrESMmR9d57sCtm7+qDAaTPupQvQuxNP8hESU=;
 b=WSVQEuzlbLoCjYIyecA7yplWTgahvQdWfGWd26ZYJwvcSo9YBbeKnvINQAOL0kK0WINZfm
 FFxR/HkKqHLyh4rHnPbVqCJDH24BFiie5tSI4fIynDFUvpt6x73+K8HcCpO2Y9C77JOzLq
 x3WGNGrQ8KTb+QW+xRhb+8kszSnQAZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-nAgt4nSVNimekTgVuK59xg-1; Wed, 13 Jan 2021 18:57:24 -0500
X-MC-Unique: nAgt4nSVNimekTgVuK59xg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 272FD801FD4;
 Wed, 13 Jan 2021 23:57:23 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A8086A8F2;
 Wed, 13 Jan 2021 23:57:09 +0000 (UTC)
Date: Wed, 13 Jan 2021 16:57:08 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 11/11] vfio: Disable only uncoordinated discards
Message-ID: <20210113165708.45a8701c@omen.home.shazbot.org>
In-Reply-To: <20210107133423.44964-12-david@redhat.com>
References: <20210107133423.44964-1-david@redhat.com>
 <20210107133423.44964-12-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  7 Jan 2021 14:34:23 +0100
David Hildenbrand <david@redhat.com> wrote:

> We support coordinated discarding of RAM using the RamDiscardMgr. Let's
> unlock support for coordinated discards, keeping uncoordinated discards
> (e.g., via virtio-balloon) disabled.
> 
> This unlocks virtio-mem + vfio. Note that vfio used via "nvme://" by the
> block layer has to be implemented/unlocked separately. For now,
> virtio-mem only supports x86-64 - spapr IOMMUs are not tested/affected.

I think SPAPR always uses a vIOMMU, but I won't claim to understand it.
Is there anything other than testing that restricts it to x86-64?  ARM
and S390 will use the same type1 IOMMU backend as far as vfio support
is concerned.  Should we do something more than put it in a commit log
if we really want to prevent it elsewhere?  Thanks,

Alex
 
> Note: The block size of a virtio-mem device has to be set to sane sizes,
> depending on the maximum hotplug size - to not run out of vfio mappings.
> The default virtio-mem block size is usually in the range of a couple of
> MBs. The maximum number of mapping is 64k, shared with other users.
> Assume you want to hotplug 256GB using virtio-mem - the block size would
> have to be set to at least 8 MiB (resulting in 32768 separate mappings).
> 
> Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
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
> index 2b9ba3f8c9..ee7a82524a 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1976,8 +1976,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
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
> @@ -2157,7 +2159,7 @@ close_fd_exit:
>      close(fd);
>  
>  put_space_exit:
> -    ram_block_discard_disable(false);
> +    ram_block_uncoordinated_discard_disable(false);
>      vfio_put_address_space(space);
>  
>      return ret;
> @@ -2279,7 +2281,7 @@ void vfio_put_group(VFIOGroup *group)
>      }
>  
>      if (!group->ram_block_discard_allowed) {
> -        ram_block_discard_disable(false);
> +        ram_block_uncoordinated_discard_disable(false);
>      }
>      vfio_kvm_device_del_group(group);
>      vfio_disconnect_container(group);
> @@ -2333,7 +2335,7 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>  
>          if (!group->ram_block_discard_allowed) {
>              group->ram_block_discard_allowed = true;
> -            ram_block_discard_disable(false);
> +            ram_block_uncoordinated_discard_disable(false);
>          }
>      }
>  


