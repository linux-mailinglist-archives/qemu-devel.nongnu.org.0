Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A674669EC9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGV-0001i9-4l; Fri, 13 Jan 2023 10:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pGMFz-0001St-PK
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pGMFx-00061h-AA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673624772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHzBl7mt2mzdn/SZ9Cnk2lOySo1J0Jlh3mrvPRsnnyg=;
 b=JoEGQi9U+92yTSxHZuq/0A6ZBB854g4I+x3P8aLLcJvwmXw15w9OUnioKdcFKBTSk39Gs1
 ge9reUE8vjeUwj/MYd7OLwol9nk9ZKsEaB9aSSF9UaGov00Ofzf6CrviTWJHQPJiMpFw7a
 /LOqBULSRxZsTg5C9WSYEQKKlOthU54=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-4bh2y1tZPWyl0j_hZeRVTA-1; Fri, 13 Jan 2023 10:46:10 -0500
X-MC-Unique: 4bh2y1tZPWyl0j_hZeRVTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bd6-20020a05600c1f0600b003d96f7f2396so14397553wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MHzBl7mt2mzdn/SZ9Cnk2lOySo1J0Jlh3mrvPRsnnyg=;
 b=2rgmD1pIIBj4aZfolIOYyMmmuuvgZpvKQgeBfx2MxoK6UYkw3YhCtHTYYINS9/E4Za
 C3DPbuw9rLA/RCTNs0llm9LcG9QL8IfnyQyxpct/tNfgPQNCf4m1bDABkIlXh+WvsJzX
 Wbd57qXmIWL0/RF6H+PZz9bbdv2cpygrgT3cc9jvyzxKM93/dULMgvho/LBEFl9Z246J
 U9qeAqA9CvMlLDg3pqc15MIDX1xaW7a7I6NWBd5Nf6GWCAtbdCvsxIM7FmzZU93gYvVf
 AMWHjJr2THHIoE3YLMUQMgiW9u1lsETpvsEHbiWQ46OKu2ACPOAkYJrr89D5UvB/BHjw
 R5qQ==
X-Gm-Message-State: AFqh2krf1J5lLqgReXjY27OSqqmEAxOWYrckf+zLNhfiYs0LQoX0rTjp
 ij13sLWIH2NDg5P129xCfkMYFsCErDhw46+tiya5PhcoQskll4AERt+cEUelLpQKcpHiCFDQhts
 n/9szA7lwIuNTBgU=
X-Received: by 2002:a05:600c:3ca3:b0:3d9:ef72:190d with SMTP id
 bg35-20020a05600c3ca300b003d9ef72190dmr15356071wmb.19.1673624769633; 
 Fri, 13 Jan 2023 07:46:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt2VEoZjjLO975j9Rqxz9F4ctolCWRuW0XqG8zDl7BJcqpWLjWcSjhUrjjLO1T5dprrYa+zIg==
X-Received: by 2002:a05:600c:3ca3:b0:3d9:ef72:190d with SMTP id
 bg35-20020a05600c3ca300b003d9ef72190dmr15356043wmb.19.1673624769395; 
 Fri, 13 Jan 2023 07:46:09 -0800 (PST)
Received: from [192.168.124.101] (149.37.22.93.rev.sfr.net. [93.22.37.149])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c444a00b003d998412db6sm32311051wmn.28.2023.01.13.07.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 07:46:08 -0800 (PST)
Message-ID: <d499e81b-9a55-87e6-b3d4-5566b7a6d004@redhat.com>
Date: Fri, 13 Jan 2023 16:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 06/13] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
 <20230112085020.15866-7-avihaih@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230112085020.15866-7-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/12/23 09:50, Avihai Horon wrote:
> vfio_devices_all_running_and_saving() is used to check if migration is
> in pre-copy phase. This is done by checking if migration is in setup or
> active states and if all VFIO devices are in pre-copy state, i.e.
> _SAVING | _RUNNING.
> 
> In VFIO migration protocol v2 pre-copy support is made optional. Hence,
> a matching v2 protocol pre-copy state can't be used here.
> 
> As preparation for adding v2 protocol, change
> vfio_devices_all_running_and_saving() logic such that it doesn't use the
> VFIO pre-copy state.
> 
> The new equivalent logic checks if migration is in active state and if
> all VFIO devices are in running state [1]. No functional changes
> intended.
> 
> [1] Note that checking if migration is in setup or active states and if
> all VFIO devices are in running state doesn't guarantee that we are in
> pre-copy phase, thus we check if migration is only in active state.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/common.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index f6dd571549..3a35f4afad 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -40,6 +40,7 @@
>   #include "trace.h"
>   #include "qapi/error.h"
>   #include "migration/migration.h"
> +#include "migration/misc.h"
>   #include "sysemu/tpm.h"
>   
>   VFIOGroupList vfio_group_list =
> @@ -363,13 +364,16 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>       return true;
>   }
>   
> -static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
> +/*
> + * Check if all VFIO devices are running and migration is active, which is
> + * essentially equivalent to the migration being in pre-copy phase.
> + */
> +static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>   {
>       VFIOGroup *group;
>       VFIODevice *vbasedev;
> -    MigrationState *ms = migrate_get_current();
>   
> -    if (!migration_is_setup_or_active(ms->state)) {
> +    if (!migration_is_active(migrate_get_current())) {
>           return false;
>       }
>   
> @@ -381,8 +385,7 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
>                   return false;
>               }
>   
> -            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
> -                (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
> +            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
>                   continue;
>               } else {
>                   return false;
> @@ -461,7 +464,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
>       };
>   
>       if (iotlb && container->dirty_pages_supported &&
> -        vfio_devices_all_running_and_saving(container)) {
> +        vfio_devices_all_running_and_mig_active(container)) {
>           return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>       }
>   
> @@ -488,7 +491,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
>           return -errno;
>       }
>   
> -    if (iotlb && vfio_devices_all_running_and_saving(container)) {
> +    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
>           cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
>                                               tcg_enabled() ? DIRTY_CLIENTS_ALL :
>                                               DIRTY_CLIENTS_NOCODE);


