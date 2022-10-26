Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6A60D87C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 02:35:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onUJD-0003tx-LM; Tue, 25 Oct 2022 20:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1onUJ9-0003nm-Ha
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:30:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1onUJ5-0000MO-EF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666744204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KpGdKj/mpUhhpki17knBogDgVkSHFPgzk2f/PypGgWo=;
 b=O5PfGbNFN8GmSOZrZSo5k6jrosGOwLSD+kKN3ur++5ZSukHlMJ9ViDOGot18b8/c1VQsi4
 JtCwrmiMjvQBikbELjaaqRL9ksZHsLF7HtS4XyLckQreMXiwaznrpgGjjUVz2wqNXhQBRn
 Fav1b6rOYaTtPtALnmHJDtnyIx8jDEo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-Qz4oIPBnNTWoWcFZjdBW1A-1; Tue, 25 Oct 2022 20:30:02 -0400
X-MC-Unique: Qz4oIPBnNTWoWcFZjdBW1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3471429AB406;
 Wed, 26 Oct 2022 00:30:02 +0000 (UTC)
Received: from [10.64.54.151] (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0CAD112132E;
 Wed, 26 Oct 2022 00:29:58 +0000 (UTC)
Subject: Re: [PATCH v6 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
Message-ID: <fcf82677-dd16-82db-c502-a8baf35192f3@redhat.com>
Date: Wed, 26 Oct 2022 08:29:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20221024035416.34068-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter and Marc,

On 10/24/22 11:54 AM, Gavin Shan wrote:
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
> 
> (1) One specific high memory region is disabled by developer by
>      toggling vms->highmem_{redists, ecam, mmio}.
> 
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>      'virt-2.12' or ealier than it.
> 
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>      on 32-bits system.
> 
> (4) One specific high memory region is disabled when it breaks the
>      PA space limit.
> 
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
> 
> The series intends to improve the address assignment for these
> high memory regions and introduces new properties for user to
> selectively disable those 3 high memory regions.
> 
> PATCH[1-4] preparatory work for the improvment
> PATCH[5]   improve high memory region address assignment
> PATCH[6]   adds 'compact-highmem' to enable or disable the optimization
> PATCH[7]   adds properties so that high memory regions can be disabled
> 
> v5: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00280.html
> v4: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00067.html
> v3: https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00258.html
> v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
> 

Could you help to take a look when getting a chance? I think Connie and
Eric are close to complete the reviews, but v7 is still needed to address
extra comments from them. I hope to make v7 mergeable if possible :)

Thanks,
Gavin

> Changelog
> ==========
> v6:
>    * Pick review-by from Connie/Eric                            (Connie/Eric)
>    * Make the changes obvious in PATCH[v6 5/7]                  (Eric)
>    * Move the example to commit log and describe the legacy
>      and compact layout in code's comments in PATCH[v6 6/7]     (Eric)
>    * Comment and commit message improvements                    (Connie/Eric)
>    * Add 3 properties in PATCH[v6 7/7], allowing user to disable
>      those 3 high memory regions                                (Marc)
> v5:
>    * Pick review-by and tested-by                               (Connie/Zhenyu)
>    * Add extra check in PATCH[v5 4/6]                           (Connie)
>    * Improve comments about compatibility for disabled regions
>      in PATCH[v5 5/6]                                           (Connie)
> v4:
>    * Add virt_get_high_memmap_enabled() helper                  (Eric)
>    * Move 'vms->highmem_compact' and related logic from
>      PATCH[v4 6/6] to PATCH[v4 5/6] to avoid git-bisect
>      breakage                                                   (Eric)
>    * Document the legacy and optimized high memory region
>      layout in commit log and source code                       (Eric)
> v3:
>    * Reorder the patches                                        (Gavin)
>    * Add 'highmem-compact' property for backwards compatibility (Eric)
> v2:
>    * Split the patches for easier review                        (Gavin)
>    * Improved changelog                                         (Marc)
>    * Use 'bool fits' in virt_set_high_memmap()                  (Eric)
> 
> Gavin Shan (7):
>    hw/arm/virt: Introduce virt_set_high_memmap() helper
>    hw/arm/virt: Rename variable size to region_size in
>      virt_set_high_memmap()
>    hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
>    hw/arm/virt: Introduce virt_get_high_memmap_enabled() helper
>    hw/arm/virt: Improve high memory region address assignment
>    hw/arm/virt: Add 'compact-highmem' property
>    hw/arm/virt: Add properties to disable high memory regions
> 
>   docs/system/arm/virt.rst |  16 ++++
>   hw/arm/virt.c            | 182 ++++++++++++++++++++++++++++++++-------
>   include/hw/arm/virt.h    |   2 +
>   3 files changed, 167 insertions(+), 33 deletions(-)
> 


