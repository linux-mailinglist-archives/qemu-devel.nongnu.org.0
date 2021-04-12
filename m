Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2780D35BC8C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:43:34 +0200 (CEST)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsAP-0002Rk-8D
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVs7k-00014N-2a
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVs7c-0000yP-Iv
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618216839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99twmwHu2cQ6JoJttkye1QMHPrzhs9nr/QpmOzIYRso=;
 b=JJ81YJ2toENAaj9oyNBu1SgbhReGKbB6gYDVud1B6TfES4PAoS5pGi2UgapGcpM4MIIyO1
 B4ORUDjccK4yEtc7+d+dtXnLv+IWvQnV40xCgIA5OMUmNNcelOjBWJ5rzUD7pOP5CKBeMw
 k5fCWQDEPNokO3bDWcZ//2gbyNFyMVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-GF4tafNPNbCJV75R9q5IHw-1; Mon, 12 Apr 2021 04:40:35 -0400
X-MC-Unique: GF4tafNPNbCJV75R9q5IHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 887CB10054F6;
 Mon, 12 Apr 2021 08:40:33 +0000 (UTC)
Received: from [10.36.113.253] (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B97E66A04E;
 Mon, 12 Apr 2021 08:40:26 +0000 (UTC)
Subject: Re: [RFC PATCH 0/3] Add migration support for VFIO PCI devices in
 SMMUv3 nested stage mode
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <16fd91d3-2bbf-b870-ad36-2cfef54be265@redhat.com>
Date: Mon, 12 Apr 2021 10:40:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210219094230.231-1-jiangkunkun@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 2/19/21 10:42 AM, Kunkun Jiang wrote:
> Hi all,
> 
> Since the SMMUv3's nested translation stages[1] has been introduced by Eric, we
> need to pay attention to the migration of VFIO PCI devices in SMMUv3 nested stage
> mode. At present, it is not yet supported in QEMU. There are two problems in the
> existing framework.
> 
> First, the current way to get dirty pages is not applicable to nested stage mode.
> Because of the "Caching Mode", VTD can map the RAM through the host single stage
> (giova->hpa). "vfio_listener_log_sync" gets dirty pages by transferring "giova"
> to the kernel for the RAM block section of mapped MMIO region. In nested stage
> mode, we setup the stage 2 (gpa->hpa) and the stage 1(giova->gpa) separately. So
> it is inapplicable to get dirty pages by the current way in nested stage mode.
> 
> Second, it also need to pass stage 1 configurations to the destination host after
> the migration. In Eric's patch, it passes the stage 1 configuration to the host on
> each STE update for the devices set the PASID PciOps. The configuration will be
> applied at physical level. But the data of physical level will not be sent to the
> destination host. So we have to pass stage 1 configurations to the destination
> host after the migration.
> 
> This Patch set includes patches as below:
> Patch 1-2:
> - Refactor the vfio_listener_log_sync and added a new function to get dirty pages
> in nested stage mode.
> 
> Patch 3:
> - Added the post_load function to vmstate_smmuv3 for passing stage 1 configuration
> to the destination host after the migration.
> 
> @Eric, Could you please add this Patch set to your future version of
> "vSMMUv3/pSMMUv3 2 stage VFIO integration", if you think this Patch set makes sense? :)
First of all, thank you for working on this. As you may have noticed I
sent a new RFC version yesterday (without including this). When time
allows, you may have a look at the comments I posted on your series. I
don't think I can test it at the moment so I may prefer to keep it
separate. Also be aware that the QEMU integration of nested has not
received much comments yet and is likely to evolve. The priority is to
get some R-b's on the kernel pieces, especially the SMMU part. With this
dependency resolved, things can't move forward I am afraid.

Thanks

Eric
> 
> Best Regards
> Kunkun Jiang
> 
> [1] [RFC,v7,00/26] vSMMUv3/pSMMUv3 2 stage VFIO integration
> http://patchwork.ozlabs.org/project/qemu-devel/cover/20201116181349.11908-1-eric.auger@redhat.com/
> 
> Kunkun Jiang (3):
>   vfio: Introduce helpers to mark dirty pages of a RAM section
>   vfio: Add vfio_prereg_listener_log_sync in nested stage
>   hw/arm/smmuv3: Post-load stage 1 configurations to the host
> 
>  hw/arm/smmuv3.c     | 60 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events |  1 +
>  hw/vfio/common.c    | 47 +++++++++++++++++++++++++++++------
>  3 files changed, 100 insertions(+), 8 deletions(-)
> 


