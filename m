Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CE4F7246
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 04:48:35 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncICH-0006Ov-OI
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 22:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ncIAq-0005ZH-Eo
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:47:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:5850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ncIAn-00064p-M5
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649299621; x=1680835621;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2UEuQrDHOfOzQMemRxGuH5+xTZQPxUP8PXaL37pxIA8=;
 b=haW7nmS/szNkj6+a/1Bhv+v74StT67JQzPxXiEcrxHkthZzsr4WhPjMq
 ClteF31X6nXth3JV4MhoJLSPBcj2attxZwVOtswmUYIMhgvUusFBGJqjW
 tp7t6LS1RTSaDDfHwUI8xQ14ooYqHAeqGVqPFKjuSwuLwyJipoxn1xu5d
 p+7gPElhbpVWNikts53OINFd583DoF5HrPoojPBsfaPizuv84yAhmqe2Q
 oXpwg/CLjuPBC+nxHkeYIXvtzJnVuBCyPAEMvghoi5kAd+PmU/t9OT2PJ
 3wZ+Ciy9IYXAEvkOn6YGh+d8c91LEgrRqsvhIVp9LfnNCDhvDrfbKaFMy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="324376576"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="324376576"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 19:46:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="722770004"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.125])
 ([10.255.28.125])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 19:46:41 -0700
Message-ID: <8785e6a8-5723-ac13-1ea5-7cd6242cb331@intel.com>
Date: Thu, 7 Apr 2022 10:46:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH RESEND v1] trace: Split address space and slot id in
 trace_kvm_set_user_memory()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, mtosatti@redhat.com,
 richard.henderson@linaro.org
References: <20220310122215.804233-1-xiaoyao.li@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220310122215.804233-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/2022 8:22 PM, Xiaoyao Li wrote:
> The upper 16 bits of kvm_userspace_memory_region::slot are
> address space id. Parse it separately in trace_kvm_set_user_memory().

Hi QEMU maintainers,

I think this patch is simple and straightforward. Please take your time 
to look at it.

Thanks,
-Xiaoyao

> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
> Resend:
>   - rebase to 2048c4eba2b4 ("Merge remote-tracking branch 'remotes/philmd/tags/pmbus-20220308' into staging")
> ---
>   accel/kvm/kvm-all.c    | 5 +++--
>   accel/kvm/trace-events | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0e66ebb49717..6b9fd943494b 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -379,8 +379,9 @@ static int kvm_set_user_memory_region(KVMMemoryListener *kml, KVMSlot *slot, boo
>       ret = kvm_vm_ioctl(s, KVM_SET_USER_MEMORY_REGION, &mem);
>       slot->old_flags = mem.flags;
>   err:
> -    trace_kvm_set_user_memory(mem.slot, mem.flags, mem.guest_phys_addr,
> -                              mem.memory_size, mem.userspace_addr, ret);
> +    trace_kvm_set_user_memory(mem.slot >> 16, (uint16_t)mem.slot, mem.flags,
> +                              mem.guest_phys_addr, mem.memory_size,
> +                              mem.userspace_addr, ret);
>       if (ret < 0) {
>           error_report("%s: KVM_SET_USER_MEMORY_REGION failed, slot=%d,"
>                        " start=0x%" PRIx64 ", size=0x%" PRIx64 ": %s",
> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index 399aaeb0ec75..14ebfa1b991c 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -15,7 +15,7 @@ kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
>   kvm_irqchip_release_virq(int virq) "virq %d"
>   kvm_set_ioeventfd_mmio(int fd, uint64_t addr, uint32_t val, bool assign, uint32_t size, bool datamatch) "fd: %d @0x%" PRIx64 " val=0x%x assign: %d size: %d match: %d"
>   kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint32_t val, bool assign, uint32_t size, bool datamatch) "fd: %d @0x%x val=0x%x assign: %d size: %d match: %d"
> -kvm_set_user_memory(uint32_t slot, uint32_t flags, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, int ret) "Slot#%d flags=0x%x gpa=0x%"PRIx64 " size=0x%"PRIx64 " ua=0x%"PRIx64 " ret=%d"
> +kvm_set_user_memory(uint16_t as, uint16_t slot, uint32_t flags, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, int ret) "AddrSpace#%d Slot#%d flags=0x%x gpa=0x%"PRIx64 " size=0x%"PRIx64 " ua=0x%"PRIx64 " ret=%d"
>   kvm_clear_dirty_log(uint32_t slot, uint64_t start, uint32_t size) "slot#%"PRId32" start 0x%"PRIx64" size 0x%"PRIx32
>   kvm_resample_fd_notify(int gsi) "gsi %d"
>   kvm_dirty_ring_full(int id) "vcpu %d"


