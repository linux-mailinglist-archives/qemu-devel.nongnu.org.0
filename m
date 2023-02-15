Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF8697C17
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSH8n-0004Lg-UR; Wed, 15 Feb 2023 07:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSH8l-0004LQ-UW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSH8k-0006H2-D5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676465041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W3Eev50Fx6q8/HlyLwfWP0C07jLIGORmnTGY6ur/ad8=;
 b=aKOm92B6rmvxtNx8xHEPR+gTpF/v1YUWBfxjrnjBWy1bUvKF/1q7fxqilC21EkHYiFuuYl
 1OC4/mVcSgj0PKc1Wfm3D9/FLZkZlZ9pNoOwqhTpKBx224UvdMBCMhC/SMSkDCyCJoDVjI
 TkvrcjpLVXPAGa3Arz2RSc9ViFjUYnQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-6hLM44YyNUuhg8VV-XvhTw-1; Wed, 15 Feb 2023 07:43:11 -0500
X-MC-Unique: 6hLM44YyNUuhg8VV-XvhTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so1091535wmb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 04:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W3Eev50Fx6q8/HlyLwfWP0C07jLIGORmnTGY6ur/ad8=;
 b=L7x4CYqlb6BpCT3I0jDi+tqF5hpV7aXfzk6YDzGa/dnUEZp6MZmQV4DjQAfgNyzH3m
 l4+pauJ9GvN9UWno1rE5p49PziYIf0rfTOoctlE+1KsSh+FO7PdCUVimLnaZwwLV7Lcy
 RLrR42TI5F0AkJVtPUUaLOWoQXDGTe+kLosVOzVb6LN+txlebsto0glwmTlm9zL8ckSP
 mRwp9Uy1o+yM/FonhapKbzqiCSY8OR+RMD5fY6xZvF0gL1t1AYcEJY2Rf21JO36kzOFc
 wB/MGW43M8gnYfJjIfGkPC8/HWrh+lF5Uz69yg4deLy/TuRYBvSv6uAUCjJQ/MLIX6pS
 Q/GA==
X-Gm-Message-State: AO0yUKVNOFvzEtljGeE3LFplUc/CprxCCi6XErHMBIsLzwAO3ViKGjSf
 jBpHAS9DjnP8FxxLD6wQ7wtcaCXxF/DiOD7glgl4AtlUrVHDE5CUHr40/1UCskU4dxKbd55Lcfj
 MWz1v/EPyOvL0wMk=
X-Received: by 2002:a05:600c:3290:b0:3df:e54a:4ac5 with SMTP id
 t16-20020a05600c329000b003dfe54a4ac5mr1844925wmp.27.1676464990683; 
 Wed, 15 Feb 2023 04:43:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/T3sGa2JDrj5bS7TZnv2q5UJ6AxzXi9/dfB4t3qVLxz/ahxt6gdybvMI5zIr/kO1NXMPyHDg==
X-Received: by 2002:a05:600c:3290:b0:3df:e54a:4ac5 with SMTP id
 t16-20020a05600c329000b003dfe54a4ac5mr1844909wmp.27.1676464990417; 
 Wed, 15 Feb 2023 04:43:10 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 iz17-20020a05600c555100b003dc4b4dea31sm1949389wmb.27.2023.02.15.04.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 04:43:09 -0800 (PST)
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
Subject: Re: [PATCH v10 03/12] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
In-Reply-To: <20230209192043.14885-4-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 9 Feb 2023 21:20:34 +0200")
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-4-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 13:43:08 +0100
Message-ID: <8735773xr7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
> Currently, if IOMMU of a VFIO container doesn't support dirty page
> tracking, migration is blocked. This is because a DMA-able VFIO device
> can dirty RAM pages without updating QEMU about it, thus breaking the
> migration.
>
> However, this doesn't mean that migration can't be done at all.
> In such case, allow migration and let QEMU VFIO code mark all pages
> dirty.
>
> This guarantees that all pages that might have gotten dirty are reported
> back, and thus guarantees a valid migration even without VFIO IOMMU
> dirty tracking support.
>
> The motivation for this patch is the introduction of iommufd [1].
> iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
> mapping them into its internal ops, allowing the usage of these IOCTLs
> over iommufd. However, VFIO IOMMU dirty tracking is not supported by
> this VFIO compatibility API.
>
> This patch will allow migration by hosts that use the VFIO compatibility
> API and prevent migration regressions caused by the lack of VFIO IOMMU
> dirty tracking support.
>
> [1]
> https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidia.co=
m/
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I know why you are doing this.

But I think this should print a warning, error, somewhere.

You are just dirtying all pages each time we arrive here.

Even calling the featura "experimental" is an understatement.

Later, Juan.


