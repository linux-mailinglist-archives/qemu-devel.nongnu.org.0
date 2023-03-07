Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC566ADBD0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:26:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUW5-0001HK-3t; Tue, 07 Mar 2023 05:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZUW2-0001H8-Tc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:25:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZUW1-000421-8v
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678184752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIwpqhIZ5cPmiAMgCRKvZe/aUTcfsTWDdJHM/MNhyiw=;
 b=fx+5R/XlnQk6/gSxaUs4RzW/UjxCfIIkPpt8zf0mtvm3v1HJNg+T94PjnNCLP87cafhys5
 Afppm/GmhnDDaNniQ+nkFWJRUB/hoqpDevDpJSFfYiRNG8sFBSg3g1l+ihr0NbFgkCKo5u
 7ozLn7V3NWc70TCixoAvsjHd+gqH9Z4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-AIrGHowyOh-ZcQIdmvoCdA-1; Tue, 07 Mar 2023 05:25:51 -0500
X-MC-Unique: AIrGHowyOh-ZcQIdmvoCdA-1
Received: by mail-ed1-f72.google.com with SMTP id
 dn8-20020a05640222e800b004bd35dd76a9so18378727edb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIwpqhIZ5cPmiAMgCRKvZe/aUTcfsTWDdJHM/MNhyiw=;
 b=0o7wmzcwDuA1cC7xAZP8RIhQnp6z9e5aaXHW/sFggj/85I1EY8JP+Ji/iqJJDutZuM
 IPDOp6oLjpoK9KCUjABU5hNwpG1KuAcUt+tokseUmlni0+50CdAQ55CzNyW8Fjt/VYQ9
 Dbo8b+gxiwFvAlf9AtooIgXp5aYKpjOeBoxCIabNXZAXfEAfEWDuOKzbqkQp64Fyi/Ol
 yHrsGiB9ybTZAdREPVUr9Voh7AzquvHWnFKux1ed9jm/GX1ISKwVd8WOkhsc52deMnrd
 hIQyNSSzOyPSbHwv49ujz3iGBW9FMWx8JAumZUeZ3Posw7589yZ7OJMYV5H9QjtLC5YC
 PVYA==
X-Gm-Message-State: AO0yUKXHKyvZaZLox8HMwiqBNomfGzolLz9/a+gnHR4+1v4rcgV6TEyF
 UmFX60Pq8EOkwalgmxV8N3HNrteZodrZJgfpIqmV2DU0e2PR0HPbljolG0RyRWcpnxHv/tNnSBr
 3/G00rXijr13Z6CQ=
X-Received: by 2002:a17:907:6d18:b0:8f4:3846:31e0 with SMTP id
 sa24-20020a1709076d1800b008f4384631e0mr18760112ejc.47.1678184750044; 
 Tue, 07 Mar 2023 02:25:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8jqNon5v9+PNs48S8exOVGizpw6aP39HlqfROZOvi9svXohu1hECn6lDeK/n83hlxOxKYgYA==
X-Received: by 2002:a17:907:6d18:b0:8f4:3846:31e0 with SMTP id
 sa24-20020a1709076d1800b008f4384631e0mr18760098ejc.47.1678184749765; 
 Tue, 07 Mar 2023 02:25:49 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o26-20020a50c29a000000b004ac54d4da22sm6506440edf.71.2023.03.07.02.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 02:25:48 -0800 (PST)
Date: Tue, 7 Mar 2023 11:25:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH v1 2/2] vhost: Remove vhost_backend_can_merge() callback
Message-ID: <20230307112548.062b068d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230216114752.198627-3-david@redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-3-david@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 12:47:52 +0100
David Hildenbrand <david@redhat.com> wrote:

> Checking whether the memory regions are equal is sufficient: if they are
> equal, then most certainly the contained fd is equal.
sounds reasonable to me.

> 
> The whole vhost-user memslot handling is suboptimal and overly
> complicated. We shouldn't have to lookup a RAM memory regions we got
> notified about in vhost_user_get_mr_data() using a host pointer. But that

While on janitor duty can you fixup following?

vhost_user_get_mr_data() -> memory_region_from_host -> 
 -> qemu_ram_block_from_host()
for qemu_ram_block_from_host doc comment seems to out of
sync (ram_addr not longer exists)

> requires a bigger rework -- especially an alternative vhost_set_mem_table()
> backend call that simply consumes MemoryRegionSections.

just skimming through  usage of vhost_user_get_mr_data() it looks like
we are first collecting MemoryRegionSection-s into tmp_sections
then we do vhost_commit we convert then into vhost_memory_region list
and the we are trying hard to convert addresses from the later
to back to MemoryRegions we've lost during tmp_sections conversion
all over the place.

To me it looks like we should drop conversion to vhost_dev::mem
and replace its usage with vhost_dev::mem_sections directly
to get rid of data duplication and back and forth addr<->mr conversion.

> For now, let's just drop vhost_backend_can_merge().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/virtio/vhost-user.c            | 14 --------------
>  hw/virtio/vhost-vdpa.c            |  1 -
>  hw/virtio/vhost.c                 |  6 +-----
>  include/hw/virtio/vhost-backend.h |  4 ----
>  4 files changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e68daa35d4..4bfaf559a7 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2195,19 +2195,6 @@ static int vhost_user_migration_done(struct vhost_dev *dev, char* mac_addr)
>      return -ENOTSUP;
>  }
>  
> -static bool vhost_user_can_merge(struct vhost_dev *dev,
> -                                 uint64_t start1, uint64_t size1,
> -                                 uint64_t start2, uint64_t size2)
> -{
> -    ram_addr_t offset;
> -    int mfd, rfd;
> -
> -    (void)vhost_user_get_mr_data(start1, &offset, &mfd);
> -    (void)vhost_user_get_mr_data(start2, &offset, &rfd);
> -
> -    return mfd == rfd;
> -}
> -
>  static int vhost_user_net_set_mtu(struct vhost_dev *dev, uint16_t mtu)
>  {
>      VhostUserMsg msg;
> @@ -2704,7 +2691,6 @@ const VhostOps user_ops = {
>          .vhost_set_vring_enable = vhost_user_set_vring_enable,
>          .vhost_requires_shm_log = vhost_user_requires_shm_log,
>          .vhost_migration_done = vhost_user_migration_done,
> -        .vhost_backend_can_merge = vhost_user_can_merge,
>          .vhost_net_set_mtu = vhost_user_net_set_mtu,
>          .vhost_set_iotlb_callback = vhost_user_set_iotlb_callback,
>          .vhost_send_device_iotlb_msg = vhost_user_send_device_iotlb_msg,
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 542e003101..9ab7bc8718 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1317,7 +1317,6 @@ const VhostOps vdpa_ops = {
>          .vhost_set_config = vhost_vdpa_set_config,
>          .vhost_requires_shm_log = NULL,
>          .vhost_migration_done = NULL,
> -        .vhost_backend_can_merge = NULL,
>          .vhost_net_set_mtu = NULL,
>          .vhost_set_iotlb_callback = NULL,
>          .vhost_send_device_iotlb_msg = NULL,
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index b7fb960fa9..9d8662aa98 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -733,11 +733,7 @@ static void vhost_region_add_section(struct vhost_dev *dev,
>              size_t offset = mrs_gpa - prev_gpa_start;
>  
>              if (prev_host_start + offset == mrs_host &&
> -                section->mr == prev_sec->mr &&
> -                (!dev->vhost_ops->vhost_backend_can_merge ||
> -                 dev->vhost_ops->vhost_backend_can_merge(dev,
> -                    mrs_host, mrs_size,
> -                    prev_host_start, prev_size))) {
> +                section->mr == prev_sec->mr) {
>                  uint64_t max_end = MAX(prev_host_end, mrs_host + mrs_size);
>                  need_add = false;
>                  prev_sec->offset_within_address_space =
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index c5ab49051e..abf1601ba2 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -86,9 +86,6 @@ typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
>  typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
>  typedef int (*vhost_migration_done_op)(struct vhost_dev *dev,
>                                         char *mac_addr);
> -typedef bool (*vhost_backend_can_merge_op)(struct vhost_dev *dev,
> -                                           uint64_t start1, uint64_t size1,
> -                                           uint64_t start2, uint64_t size2);
>  typedef int (*vhost_vsock_set_guest_cid_op)(struct vhost_dev *dev,
>                                              uint64_t guest_cid);
>  typedef int (*vhost_vsock_set_running_op)(struct vhost_dev *dev, int start);
> @@ -160,7 +157,6 @@ typedef struct VhostOps {
>      vhost_set_vring_enable_op vhost_set_vring_enable;
>      vhost_requires_shm_log_op vhost_requires_shm_log;
>      vhost_migration_done_op vhost_migration_done;
> -    vhost_backend_can_merge_op vhost_backend_can_merge;
>      vhost_vsock_set_guest_cid_op vhost_vsock_set_guest_cid;
>      vhost_vsock_set_running_op vhost_vsock_set_running;
>      vhost_set_iotlb_callback_op vhost_set_iotlb_callback;


