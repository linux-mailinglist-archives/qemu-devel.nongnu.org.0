Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68465697CA0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:03:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHQ8-0003N5-82; Wed, 15 Feb 2023 08:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSHPo-0003CF-4X
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSHPk-00046u-L4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676466095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GTfH7/BXjs/NvEliw/W5RCZkSfDnZcMy0Q7A7GGb94M=;
 b=RklbJ9HGOt9HcnYwozA5ny7zcLC5ZPOhhy9NZUr/r2rDCm8Ha46mrXIv0UjjmLL1X4Trag
 LfXXP0no4zw/zrbN1UYaL9whRVTsG8pOhSsx5IUUi3igi6X8Bdapsoh43IyN0bjavnuxqz
 hg7dwnaJghV4YJUBV3bUGgtcCDpDIBI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-dPO7_0dOPaeONVD1ZeLR3w-1; Wed, 15 Feb 2023 08:01:33 -0500
X-MC-Unique: dPO7_0dOPaeONVD1ZeLR3w-1
Received: by mail-wm1-f71.google.com with SMTP id
 j40-20020a05600c1c2800b003e2036a1516so899291wms.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GTfH7/BXjs/NvEliw/W5RCZkSfDnZcMy0Q7A7GGb94M=;
 b=Isu9BxZS59CyPOzr46spdnMSHyBMN+lv4GfDLjNbgd/3kuSuYgJ5pFmVq8OKP6cWzC
 9zjTzn/JZb2APNykAJnvE/w5rsm3gtz39obO86BgjQD3+eMijxvnh4nnnjwRCP1Zaam3
 jsJL4dDzTCZnACtKhKamWcJ5+66yxOYycgAbP5w13+dR6gkkCTECsRKAf3ce8VRhk5j/
 aaViamajNMGKZHnbEehI56nQcyYo0YHj47VRGGo/Mxg7fALMdd3PpXmcpMEc5zJoePM9
 F+m54EGtqeNM1XaNwnS2G515a2NeL0mx3BcW/ddHPLHRomFdETXKm5j1V+jTqFTcNHiL
 QdGg==
X-Gm-Message-State: AO0yUKUDkkwGKde8PMpFpSMUCLOzC1ZhJ2SKYEJrC/gVsvbCdx2GXis0
 yup9UDajkswlSW5/0vvj4L2Mf+TgcRVDCfes4DJlcuy8y+5uQLlI9HsUmS2DYQL4nCJJVzrzPAQ
 lIfinLef8vIU03o8=
X-Received: by 2002:adf:fe8a:0:b0:2c5:5ef5:ca52 with SMTP id
 l10-20020adffe8a000000b002c55ef5ca52mr1671353wrr.19.1676466092756; 
 Wed, 15 Feb 2023 05:01:32 -0800 (PST)
X-Google-Smtp-Source: AK7set95uCI9fagRgrEWj3AKr+iXUpyD9MxOm4MgQc4/N48XPJPR1hS9ja9FwvJz/WmedQnXFu5Yww==
X-Received: by 2002:adf:fe8a:0:b0:2c5:5ef5:ca52 with SMTP id
 l10-20020adffe8a000000b002c55ef5ca52mr1671316wrr.19.1676466092519; 
 Wed, 15 Feb 2023 05:01:32 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d65ce000000b002c561805a4csm4804275wrw.45.2023.02.15.05.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:01:31 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Yishai
 Hadas <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>,  Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 09/12] vfio/migration: Implement VFIO migration
 protocol v2
In-Reply-To: <20230209192043.14885-10-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 9 Feb 2023 21:20:40 +0200")
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-10-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 14:01:31 +0100
Message-ID: <87pmab2ic4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:
> Implement the basic mandatory part of VFIO migration protocol v2.
> This includes all functionality that is necessary to support
> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
>
> The two protocols, v1 and v2, will co-exist and in the following patches
> v1 protocol code will be removed.
>
> There are several main differences between v1 and v2 protocols:
> - VFIO device state is now represented as a finite state machine instead
>   of a bitmap.
>
> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>   ioctl and normal read() and write() instead of the migration region.
>
> - Pre-copy is made optional in v2 protocol. Support for pre-copy will be
>   added later on.
>
> Detailed information about VFIO migration protocol v2 and its difference
> compared to v1 protocol can be found here [1].
>
> [1]
> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> +/*
> + * Migration size of VFIO devices can be as little as a few KBs or as big as
> + * many GBs. This value should be big enough to cover the worst case.
> + */
> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)

Wow O:-)

> +
> +/*
> + * Only exact function is implemented and not estimate function. The reason is
> + * that during pre-copy phase of migration the estimate function is called
> + * repeatedly while pending RAM size is over the threshold, thus migration
> + * can't converge and querying the VFIO device pending data size is useless.
> + */

You can do it after this is merge, but I think you can do better than
this.  Something in the lines of:


// I put it in a global variable, but it really needs to be in
VFIODevice to be // able to support several devices.  You get the idea
O:-)

static uint64_t cached_size = -1;

static void vfio_state_pending_exact(void *opaque, uint64_t *res_precopy_only,
                                     uint64_t *res_compatible,
                                     uint64_t *res_postcopy_only)
{
    VFIODevice *vbasedev = opaque;
    uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;

    /*
     * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE is
     * reported so downtime limit won't be violated.
     */
    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
    *res_precopy_only += stop_copy_size;
    cached_size = stop_copy_size;

    trace_vfio_state_pending_exact(vbasedev->name, *res_precopy_only,
                                   *res_postcopy_only, *res_compatible,
                                   stop_copy_size);
}


static void vfio_state_pending_estimate(void *opaque, uint64_t *res_precopy_only,
                                        uint64_t *res_compatible,
                                        uint64_t *res_postcopy_only)
{
    VFIODevice *vbasedev = opaque;
    uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;

    if (cached_size == -1) {
        uint64_t res_precopy;
        uint64_t res_compatible;
        uint64_t res_postcopy;
        vfio_state_pending_exact(opaque, &res_precopy, &res_compatible, &res_postcopy);
    }
    *res_precopy_only += cached_size;
}


