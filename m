Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786D36AC9D2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEYk-0001gI-K0; Mon, 06 Mar 2023 12:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZEYi-0001fN-Ma
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:23:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZEYg-0008H3-Uu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678123414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD4hSbFkVi4Gf21BQmYFZNBk6r/AgTRo79NadtomHjM=;
 b=akJQwRoO23XsdF4aMWW55rlIkRxF/FWm1+J5tafJXx6uuC3hwpZids4OLZmw8BZdQlHr2O
 O2pjws0egvYkQ2+z/JsKf9TqKtqzMvjUpI+b6rcMEACgPLRdxlz0HMsZzYvC7Zj0qfwW75
 zzNg5TOF7XoKn80q8oEWlKbaNQCDMXU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-vAsBmO5CMa6ZC1SH8Ur5ZQ-1; Mon, 06 Mar 2023 12:23:32 -0500
X-MC-Unique: vAsBmO5CMa6ZC1SH8Ur5ZQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 pm17-20020ad446d1000000b0057256b237b9so5885256qvb.16
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 09:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678123412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aD4hSbFkVi4Gf21BQmYFZNBk6r/AgTRo79NadtomHjM=;
 b=TLcVIZXbyIDhWz9oBN5O4AkQ1AUFU8waeBQOdPuurJKIcLWme3C5Eo+WxuErPCEqXl
 NrJbLIJNuZoyqd8/rZrr6j0PLt5ZbzmSiR9adPKXnpr2qZdjGRVx9OB2EYNfPtvfbSoV
 +OyfNqGVLzW2t3geO+jH6RVmi18zR7Gm11endPURk7j4Jci+FmsFYwJwXbiNiCgVquXg
 jwohVPhwRIMWlEa5mO5Z7zuGlNa6RMMAGjyL+PSlitiW+5LjRQFkEYxWfN0IZk88twap
 TnCLJn0phJO/rQXQUB1wRZ96dtTTSfrptONGZ6l1phlHAMVtLFS8iNIirJ1hLf24mv6E
 6EvA==
X-Gm-Message-State: AO0yUKWyFLo77UTuxD+UXH3MKJc+1Uy67xrLWq1uRZzRdLy+BHwJlsjo
 ZKUYRQz+wLr8Tm4/1jjpIS+TJRjQyDDdF1KP1sN2u3mLJl+aUOiD89nIY0ioqs3m5e9fL9gneL7
 g1HR73E1TsBBlU3Y=
X-Received: by 2002:a05:622a:120a:b0:3bf:d238:6ca with SMTP id
 y10-20020a05622a120a00b003bfd23806camr18714194qtx.68.1678123412190; 
 Mon, 06 Mar 2023 09:23:32 -0800 (PST)
X-Google-Smtp-Source: AK7set94gZr06n0grJyI7bPD9ZyY8AeOD82NORyMez1tFyp4xmCW6tKjSIrLYmU3riociqN9MzXT5A==
X-Received: by 2002:a05:622a:120a:b0:3bf:d238:6ca with SMTP id
 y10-20020a05622a120a00b003bfd23806camr18714173qtx.68.1678123411949; 
 Mon, 06 Mar 2023 09:23:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 y12-20020ac8704c000000b003bfb6ddc49dsm7982265qtm.1.2023.03.06.09.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:23:31 -0800 (PST)
Message-ID: <b3c061f5-662f-8303-c8f8-2788979d70e8@redhat.com>
Date: Mon, 6 Mar 2023 18:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-1-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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

On 3/4/23 02:43, Joao Martins wrote:
> Hey,
> 
> Presented herewith a series based on the basic VFIO migration protocol v2
> implementation [1].
> 
> It is split from its parent series[5] to solely focus on device dirty
> page tracking. Device dirty page tracking allows the VFIO device to
> record its DMAs and report them back when needed. This is part of VFIO
> migration and is used during pre-copy phase of migration to track the
> RAM pages that the device has written to and mark those pages dirty, so
> they can later be re-sent to target.
> 
> Device dirty page tracking uses the DMA logging uAPI to discover device
> capabilities, to start and stop tracking, and to get dirty page bitmap
> report. Extra details and uAPI definition can be found here [3].
> 
> Device dirty page tracking operates in VFIOContainer scope. I.e., When
> dirty tracking is started, stopped or dirty page report is queried, all
> devices within a VFIOContainer are iterated and for each of them device
> dirty page tracking is started, stopped or dirty page report is queried,
> respectively.
> 
> Device dirty page tracking is used only if all devices within a
> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
> used, and if that is not supported as well, memory is perpetually marked
> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
> support, the last two usually have the same effect of perpetually
> marking all pages dirty.
> 
> Normally, when asked to start dirty tracking, all the currently DMA
> mapped ranges are tracked by device dirty page tracking. If using a
> vIOMMU we block live migration. It's temporary and a separate series is
> going to add support for it. Thus this series focus on getting the
> ground work first.
> 
> The series is organized as follows:
> 
> - Patches 1-7: Fix bugs and do some preparatory work required prior to
>    adding device dirty page tracking.
> - Patches 8-10: Implement device dirty page tracking.
> - Patch 11: Blocks live migration with vIOMMU.
> - Patches 12-13 enable device dirty page tracking and document it.
> 
> Comments, improvements as usual appreciated.

It would be helpful to have some feed back from Avihai on the new patches
introduced in v3 or v4 before merging.

Also, (being curious) did you test migration with a TCG guest ?

Thanks,

C.


