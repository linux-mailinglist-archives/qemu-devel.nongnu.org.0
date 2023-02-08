Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DC68F46F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:26:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoCL-0005f7-Av; Wed, 08 Feb 2023 12:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pPoCF-0005du-3r
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:25:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pPoCC-0007cs-94
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675877122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p8X5GOnfhrCqMcwKSAYfkJu0rQOKR8xSevsNW25pz7Y=;
 b=jH1wH5nAQcozkcLhS8VWaBqCQtXSNNk5WJljs8Zzh9ss66KNiGkVnjhDKtSCzPZ6m/MIL/
 pneaPvMLyHzJlUrqUnuZNM06dqkHFTmC8QNqLGQxxBfzm1Xn1bME5WsrvPs9FgDJCUMGX4
 0keBiLMyR46aAMrLlkfxRuQZvtXn7rw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-zswnlqFdMzi1qHSr68v41g-1; Wed, 08 Feb 2023 12:25:21 -0500
X-MC-Unique: zswnlqFdMzi1qHSr68v41g-1
Received: by mail-qk1-f200.google.com with SMTP id
 j29-20020a05620a001d00b00724fd33cb3eso12648806qki.14
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8X5GOnfhrCqMcwKSAYfkJu0rQOKR8xSevsNW25pz7Y=;
 b=d6e8Z9TQUpD1qzBCcxQc59mD9smq/61IMnPoYB05acW1+WtzitWSquqE1AmQgrdHXI
 ZjWQxFPR7z2E0G2rKNZrRuI0hQiBGhvCZ3F/A+hQuSL6TgSp5TV4e85tG+cRcaCaH8zH
 hwW/9Bc7Ea1nYmcBisn5idlsflbW3roSyCltVQenBHoGmW+5M0rHr3OVTFQu/SHQREAq
 MRlZkGCvUGQiAyxyLqa6rOPtpUE+M1Fe9xqroOCxYCbNsWzoTZIdCqycd+MxAncvbtSR
 IetoXeHn0IZ9Twh1IJgYxFtDwgnf/GN8kEDlOSPeLpXNoZx67sEs7cUxSskdUqiMX1mU
 fgiw==
X-Gm-Message-State: AO0yUKUfM7k/numNy4yFqXQAJJsjQqqLAMTTiNX8S/L2dWZUxBLv6xOH
 DJeK54eikRlqfTNnIKh0drOUSuQ7ACkNEfo6BGUmBRcSWXPbh4Um+FfOaupt/ceuCHh9B1IiqYI
 EQACkLyCet/qbs5c=
X-Received: by 2002:ac8:5e51:0:b0:3b8:49bb:16c3 with SMTP id
 i17-20020ac85e51000000b003b849bb16c3mr14491690qtx.28.1675877120594; 
 Wed, 08 Feb 2023 09:25:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+pBOS20TZ9sXgNJb2y2RjvY8ECppWVEKyXO1Jr5rt4rQqK0Vvdb2/eA4Y1pUxDRaQWza0N+A==
X-Received: by 2002:ac8:5e51:0:b0:3b8:49bb:16c3 with SMTP id
 i17-20020ac85e51000000b003b849bb16c3mr14491645qtx.28.1675877120298; 
 Wed, 08 Feb 2023 09:25:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 l16-20020ac84cd0000000b003b9bf862c04sm11702470qtv.55.2023.02.08.09.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 09:25:19 -0800 (PST)
Message-ID: <0ad070ed-3cb0-edcd-2f80-407344f8306e@redhat.com>
Date: Wed, 8 Feb 2023 18:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 14/14] docs/devel: Align VFIO migration docs to v2
 protocol
Content-Language: en-US
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
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-15-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230206123137.31149-15-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/6/23 13:31, Avihai Horon wrote:
> Now that VFIO migration protocol v2 has been implemented and v1 protocol
> has been removed, update the documentation according to v2 protocol.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>

You will need a rebase for next version. The migration PR was merged since.

Thanks,

C.

> ---
>   docs/devel/vfio-migration.rst | 68 ++++++++++++++++-------------------
>   1 file changed, 30 insertions(+), 38 deletions(-)
> 
> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> index 9ff6163c88..1d50c2fe5f 100644
> --- a/docs/devel/vfio-migration.rst
> +++ b/docs/devel/vfio-migration.rst
> @@ -7,46 +7,39 @@ the guest is running on source host and restoring this saved state on the
>   destination host. This document details how saving and restoring of VFIO
>   devices is done in QEMU.
>   
> -Migration of VFIO devices consists of two phases: the optional pre-copy phase,
> -and the stop-and-copy phase. The pre-copy phase is iterative and allows to
> -accommodate VFIO devices that have a large amount of data that needs to be
> -transferred. The iterative pre-copy phase of migration allows for the guest to
> -continue whilst the VFIO device state is transferred to the destination, this
> -helps to reduce the total downtime of the VM. VFIO devices can choose to skip
> -the pre-copy phase of migration by returning pending_bytes as zero during the
> -pre-copy phase.
> +Migration of VFIO devices currently consists of a single stop-and-copy phase.
> +During the stop-and-copy phase the guest is stopped and the entire VFIO device
> +data is transferred to the destination.
> +
> +The pre-copy phase of migration is currently not supported for VFIO devices.
> +Support for VFIO pre-copy will be added later on.
>   
>   A detailed description of the UAPI for VFIO device migration can be found in
> -the comment for the ``vfio_device_migration_info`` structure in the header
> -file linux-headers/linux/vfio.h.
> +the comment for the ``vfio_device_mig_state`` structure in the header file
> +linux-headers/linux/vfio.h.
>   
>   VFIO implements the device hooks for the iterative approach as follows:
>   
> -* A ``save_setup`` function that sets up the migration region and sets _SAVING
> -  flag in the VFIO device state.
> +* A ``save_setup`` function that sets up migration on the source.
>   
> -* A ``load_setup`` function that sets up the migration region on the
> -  destination and sets _RESUMING flag in the VFIO device state.
> +* A ``load_setup`` function that sets the VFIO device on the destination in
> +  _RESUMING state.
>   
>   * A ``save_live_pending`` function that reads pending_bytes from the vendor
>     driver, which indicates the amount of data that the vendor driver has yet to
>     save for the VFIO device.
>   
> -* A ``save_live_iterate`` function that reads the VFIO device's data from the
> -  vendor driver through the migration region during iterative phase.
> -
>   * A ``save_state`` function to save the device config space if it is present.
>   
> -* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
> -  VFIO device state and iteratively copies the remaining data for the VFIO
> -  device until the vendor driver indicates that no data remains (pending bytes
> -  is zero).
> +* A ``save_live_complete_precopy`` function that sets the VFIO device in
> +  _STOP_COPY state and iteratively copies the data for the VFIO device until
> +  the vendor driver indicates that no data remains.
>   
>   * A ``load_state`` function that loads the config section and the data
> -  sections that are generated by the save functions above
> +  sections that are generated by the save functions above.
>   
>   * ``cleanup`` functions for both save and load that perform any migration
> -  related cleanup, including unmapping the migration region
> +  related cleanup.
>   
>   
>   The VFIO migration code uses a VM state change handler to change the VFIO
> @@ -71,13 +64,13 @@ tracking can identify dirtied pages, but any page pinned by the vendor driver
>   can also be written by the device. There is currently no device or IOMMU
>   support for dirty page tracking in hardware.
>   
> -By default, dirty pages are tracked when the device is in pre-copy as well as
> -stop-and-copy phase. So, a page pinned by the vendor driver will be copied to
> -the destination in both phases. Copying dirty pages in pre-copy phase helps
> -QEMU to predict if it can achieve its downtime tolerances. If QEMU during
> -pre-copy phase keeps finding dirty pages continuously, then it understands
> -that even in stop-and-copy phase, it is likely to find dirty pages and can
> -predict the downtime accordingly.
> +By default, dirty pages are tracked during pre-copy as well as stop-and-copy
> +phase. So, a page pinned by the vendor driver will be copied to the destination
> +in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
> +it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
> +finding dirty pages continuously, then it understands that even in stop-and-copy
> +phase, it is likely to find dirty pages and can predict the downtime
> +accordingly.
>   
>   QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
>   which disables querying the dirty bitmap during pre-copy phase. If it is set to
> @@ -111,23 +104,22 @@ Live migration save path
>                                     |
>                        migrate_init spawns migration_thread
>                   Migration thread then calls each device's .save_setup()
> -                    (RUNNING, _SETUP, _RUNNING|_SAVING)
> +                       (RUNNING, _SETUP, _RUNNING)
>                                     |
> -                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
> +                      (RUNNING, _ACTIVE, _RUNNING)
>                If device is active, get pending_bytes by .save_live_pending()
>             If total pending_bytes >= threshold_size, call .save_live_iterate()
> -                  Data of VFIO device for pre-copy phase is copied
>           Iterate till total pending bytes converge and are less than threshold
>                                     |
>     On migration completion, vCPU stops and calls .save_live_complete_precopy for
> -   each active device. The VFIO device is then transitioned into _SAVING state
> -                   (FINISH_MIGRATE, _DEVICE, _SAVING)
> +  each active device. The VFIO device is then transitioned into _STOP_COPY state
> +                  (FINISH_MIGRATE, _DEVICE, _STOP_COPY)
>                                     |
>        For the VFIO device, iterate in .save_live_complete_precopy until
>                            pending data is 0
> -                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
> +                   (FINISH_MIGRATE, _DEVICE, _STOP)
>                                     |
> -                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
> +                 (FINISH_MIGRATE, _COMPLETED, _STOP)
>                Migraton thread schedules cleanup bottom half and exits
>   
>   Live migration resume path
> @@ -136,7 +128,7 @@ Live migration resume path
>   ::
>   
>                 Incoming migration calls .load_setup for each device
> -                       (RESTORE_VM, _ACTIVE, _STOPPED)
> +                       (RESTORE_VM, _ACTIVE, _STOP)
>                                    |
>          For each device, .load_state is called for that device section data
>                          (RESTORE_VM, _ACTIVE, _RESUMING)


