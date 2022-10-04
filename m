Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204795F4136
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:58:01 +0200 (CEST)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offce-0005Qb-3M
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1offYl-0001Kw-TE
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1offYh-0004pX-Dy
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664880833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGoewGI2tIAIhQV36B5JUf6B4O/mb6qTfQ9wwL1whKM=;
 b=g//8BLhoOD3esmQGzT0u0FhjUVt4drKjIcUh5xp+/LlPcpgmcRfzx8zLVq0huVkXovLJgU
 mW35oqgUvUXSsPYU29ocPdvb47q/aOuIOdjEV+GjaAb5Q6dmOuYK6BHiv7/0fYsO9qd50k
 kGa9Hh5O4Vs+sVLOepmkeYwqQwkE3RE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-k02VsSOgNFu2ICsG6vyfNA-1; Tue, 04 Oct 2022 06:53:52 -0400
X-MC-Unique: k02VsSOgNFu2ICsG6vyfNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C06B385A583;
 Tue,  4 Oct 2022 10:53:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E5E62027061;
 Tue,  4 Oct 2022 10:53:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v4 5/6] hw/arm/virt: Improve high memory region address
In-Reply-To: <20221004002627.59172-6-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-6-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 04 Oct 2022 12:53:48 +0200
Message-ID: <87bkqroo5f.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:

> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> This improves the address assignment for those three high memory
> region by skipping the address assignment for one specific high
> memory region if it has been disabled in case (1), (2) and (3).
> 'vms->high_compact' is false for now, meaning that we don't have
> any behavior changes until it becomes configurable through property
> 'compact-highmem' in next patch.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c         | 19 ++++++++++++-------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 59de7b78b5..4164da49e9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1715,9 +1715,6 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>          region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> -        vms->memmap[i].base = region_base;
> -        vms->memmap[i].size = region_size;
> -
>          /*
>           * Check each device to see if they fit in the PA space,
>           * moving highest_gpa as we go.

Maybe tweak this comment?

"Check each enabled device to see if they fit in the PA space,
moving highest_gpa as we go. For compatibility, move highest_gpa
for disabled fitting devices as well, if the compact layout has
been disabled."

(Or would that be overkill?)


