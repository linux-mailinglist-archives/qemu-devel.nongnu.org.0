Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B607767F08D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 22:42:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLWU9-0004bt-DP; Fri, 27 Jan 2023 16:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pLWU7-0004bh-72
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 16:42:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pLWU5-0003mh-8d
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 16:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674855728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XeAUzTDV0Mu/uPwy+jRUJZ7YuGMnuc3cG087u6P6nZ0=;
 b=hjqhpxH/2ql0U5+dYJhvOlLO0Jz0KX+IlZRNaHT+ckSb3U0OP9pgMej4PCl67Y8A02vpBH
 vqJaWBwwWRNA00w9HY+mET4CkZ+SVPgq1w8PIl2EfdUCzk6hewLyzK49zhaQdDqod1fIY1
 SPWUHpBBjxgm6N8zBNz/Oi0zaSVunnY=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-VdEOWBzYMjqw8Cdkou-MGw-1; Fri, 27 Jan 2023 16:42:06 -0500
X-MC-Unique: VdEOWBzYMjqw8Cdkou-MGw-1
Received: by mail-il1-f199.google.com with SMTP id
 z8-20020a056e02088800b0030c247efc7dso3828615ils.15
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 13:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XeAUzTDV0Mu/uPwy+jRUJZ7YuGMnuc3cG087u6P6nZ0=;
 b=V3O5ACIw9gHhToRohEw2n+IwuyzbZlLWoiayOdQyBTKot5gELeBWIel+zFotlBDaxC
 qSINj5ikY9b4W7uCIK5/sTS1249honI/1Nil5FaDhI5hPphwSxLBvemsfhCm0NPMAvPC
 hjnJ4OusNhdh5U5rS3wyhxd40+1GhR/qusLphEusVPdLAp+WV7n5xSjv/1X66rbfOmCe
 Zu8VlDVRrfRecsw1pZFSvy9T/u2+TX1mL51JPhuLWT7rjWIUKoBKBtycH00wkY5mbcqH
 i6pR+jHkZmjBmtq7ue0SJF/F4GkqJgO/9Y0sKMLqZ8+VFU8NQKV1nvBegZSVVbvSvgQA
 O7EQ==
X-Gm-Message-State: AO0yUKVFi63ZkeV0hG85vRVMGjhlwEUe8U7yzH78WPQ1CX4gyoUpspQz
 HCRifDam0ma/2nd3EoqAmbyoDelyzTM90JA2XS3+5Pgm3Y629X6ZAE4X6dBN/egyz/IttjitdXA
 k/9j0fp/5e4jo6fk=
X-Received: by 2002:a05:6e02:12cb:b0:310:b4d6:186e with SMTP id
 i11-20020a056e0212cb00b00310b4d6186emr135551ilm.3.1674855725997; 
 Fri, 27 Jan 2023 13:42:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9hZWnoV7bPx0uJxkqAGreh6Mo0CFkPEPvGwdT3XqqUI6aP4hD0z7ezd+uQmzMOQtYAHKVDEQ==
X-Received: by 2002:a05:6e02:12cb:b0:310:b4d6:186e with SMTP id
 i11-20020a056e0212cb00b00310b4d6186emr135526ilm.3.1674855725736; 
 Fri, 27 Jan 2023 13:42:05 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j19-20020a056e020ef300b003024b62725dsm1586068ilk.22.2023.01.27.13.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 13:42:05 -0800 (PST)
Date: Fri, 27 Jan 2023 14:42:03 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Paolo Bonzini" <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "David Hildenbrand" <david@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 08/18] vfio/common: Record DMA mapped IOVA ranges
Message-ID: <20230127144203.4ecf8c19.alex.williamson@redhat.com>
In-Reply-To: <20230126184948.10478-9-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-9-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Thu, 26 Jan 2023 20:49:38 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> From: Joao Martins <joao.m.martins@oracle.com>
> 
> According to the device DMA logging uAPI, IOVA ranges to be logged by
> the device must be provided all at once upon DMA logging start.
> 
> As preparation for the following patches which will add device dirty
> page tracking, keep a record of all DMA mapped IOVA ranges so later they
> can be used for DMA logging start.
> 
> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
> Following patches will address the vIOMMU case specifically.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  include/hw/vfio/vfio-common.h |  3 ++
>  hw/vfio/common.c              | 86 +++++++++++++++++++++++++++++++++--
>  2 files changed, 86 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 88c2194fb9..d54000d7ae 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -23,6 +23,7 @@
>  
>  #include "exec/memory.h"
>  #include "qemu/queue.h"
> +#include "qemu/iova-tree.h"
>  #include "qemu/notify.h"
>  #include "ui/console.h"
>  #include "hw/display/ramfb.h"
> @@ -94,6 +95,8 @@ typedef struct VFIOContainer {
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
>      unsigned int dma_max_mappings;
> +    IOVATree *mappings;
> +    QemuMutex mappings_mutex;
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index e554573eb5..fafc361cea 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -43,6 +43,7 @@
>  #include "migration/misc.h"
>  #include "migration/qemu-file.h"
>  #include "sysemu/tpm.h"
> +#include "qemu/iova-tree.h"
>  
>  VFIOGroupList vfio_group_list =
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -373,6 +374,11 @@ bool vfio_mig_active(void)
>      return true;
>  }
>  
> +static bool vfio_have_giommu(VFIOContainer *container)
> +{
> +    return !QLIST_EMPTY(&container->giommu_list);
> +}
> +
>  static void vfio_set_migration_error(int err)
>  {
>      MigrationState *ms = migrate_get_current();
> @@ -450,6 +456,51 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>      return true;
>  }
>  
> +static int vfio_record_mapping(VFIOContainer *container, hwaddr iova,
> +                               hwaddr size, bool readonly)
> +{
> +    DMAMap map = {
> +        .iova = iova,
> +        .size = size - 1, /* IOVATree is inclusive, so subtract 1 from size */

<facepalm>


