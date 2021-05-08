Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3D377027
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:44:23 +0200 (CEST)
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGhK-0004EQ-4l
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lfGfo-0003Y4-LY
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:42:48 -0400
Received: from mga01.intel.com ([192.55.52.88]:23768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lfGfm-0005kL-2N
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:42:48 -0400
IronPort-SDR: FxCqMPXBYXjJAE8LjzDZGO0Y0W/4/n7SSREeQIeB+R+iu0arrUa48R2U/7tks1xLl1GOKZ78X8
 8S56xdaTVbjA==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="219790960"
X-IronPort-AV: E=Sophos;i="5.82,282,1613462400"; d="scan'208";a="219790960"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 23:42:40 -0700
IronPort-SDR: 2ubldhmFmQ3BRAb7jdvxqpcD9i92fZU+2N5fBpOuNjIvBh3g8sfL9452WJRWuTFH0mIZhKdOoT
 Ybov5fSVyfoQ==
X-IronPort-AV: E=Sophos;i="5.82,282,1613462400"; d="scan'208";a="435259590"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 07 May 2021 23:42:38 -0700
Date: Sat, 8 May 2021 14:30:08 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RESEND PATCH 01/32] memory: Add RAM_PROTECTED flag to skip
 IOMMU mappings
Message-ID: <20210508063008.GA24876@yangzhon-Virtual>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-2-yang.zhong@intel.com>
 <b216c2e4-abcb-d7bd-b461-96b731472b4d@redhat.com>
 <20210507052443.GA23130@yangzhon-Virtual>
 <14990ed0-6e94-1c80-d8e0-d863b05d3d6d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14990ed0-6e94-1c80-d8e0-d863b05d3d6d@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yang.zhong@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 07, 2021 at 02:45:21PM +0200, Paolo Bonzini wrote:
> On 07/05/21 07:24, Yang Zhong wrote:
> >   Paolo, i will revert this patch, but in order to disable sgx epc memory region
> >   as DMA target, we still need to skip this memory region while adding this memory
> >   region.
> >
> >   So, my plan is to revert this patch, and then add one new bool variable in the
> >   struct MemoryRegion.
> >
> >   The new patch as below and it will be as patch 2 in the next version
> >
> >   diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
> >   index 0c98812f0d..316e1ee688 100644
> >   --- a/backends/hostmem-epc.c
> >   +++ b/backends/hostmem-epc.c
> >   @@ -67,6 +67,7 @@ void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
> >        }
> >
> >        sgx_epc_backend_memory_alloc(backend, errp);
> >   +    mr->sgx_epc_device = true;
> >   }
> >
> >   static void sgx_epc_backend_instance_init(Object *obj)
> >   diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >   index 5bc5d29358..7a53855436 100644
> >   --- a/hw/vfio/common.c
> >   +++ b/hw/vfio/common.c
> >   @@ -538,7 +538,7 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> >    {
> >        return (!memory_region_is_ram(section->mr) &&
> >                !memory_region_is_iommu(section->mr)) ||
> >   +            section->mr->sgx_epc_device ||
> >                /*
> >                 * Sizing an enabled 64-bit BAR can cause spurious mappings to
> >                 * addresses in the upper part of the 64-bit address space.  These
> >    diff --git a/include/exec/memory.h b/include/exec/memory.h
> >    index 2816e52be3..9bba0a1590 100644
> >    --- a/include/exec/memory.h
> >    +++ b/include/exec/memory.h
> >    @@ -463,6 +463,7 @@ struct MemoryRegion {
> >         bool readonly; /* For RAM regions */
> >         bool nonvolatile;
> >         bool rom_device;
> >    +    bool sgx_epc_device;
> >         bool flush_coalesced_mmio;
> >         uint8_t dirty_log_mask;
> >         bool is_iommu;
> >   If this patch is not suitable to skip this memory region, any suggestion is
> >   appreciated, thanks!
> 
> No, you can keep RAM_PROTECTED.  I was just remarking on the new
> bool argument, and suggesting passing the flags (RAM_SHARED and
> RAM_PROTECTED) directly  tot he memory_region_init* functions.
>

  Paolo, thanks! If there is no new comments from community, i will send the V2
  in the next week. thanks!

  Yang


 
> Paolo

