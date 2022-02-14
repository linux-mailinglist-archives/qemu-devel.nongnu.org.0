Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB024B5452
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:16:12 +0100 (CET)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJd5H-00052x-Fh
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:16:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nJcaz-0000oH-U7
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:44:56 -0500
Received: from mga18.intel.com ([134.134.136.126]:30012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nJcaw-0002a0-Ek
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644849890; x=1676385890;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b6enna1CGmcskeKJ3rJtDcnqF28Vym9nEbJa2yqEgD0=;
 b=MC/lGwGxte299ScqBiWKi7qmF9oetePOB6b8gMrS7SQwEg5f6eVdiIxs
 iGeR5gzGIdrmPL3hi57MyDHgIQS7DM4ZtIqj4z76fkidG40NJ/YL+9Ktx
 QtbNLPWA9JhoKRjjlkjCmCoc9BPrky5Mc3S0D+xLdOhN2LKN3ZTajWsFY
 SQEDyYV6V/nGTRzay6DxOpG38D7yH6X2+N3GHwHFDfw6/wznC1+4wrVTJ
 gbEEmvojjNxPc1Ek8LEYRWd/70uuptWu8HnoHRIWC2iDiTKzeCY3TdT8s
 o5GmwD60SoTcIzKZgp+Ql5U7UD4zyar5kYsZzRyinjRme6Ek/sB148vHL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="233649416"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="233649416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 06:44:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="528212754"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.31.126])
 ([10.255.31.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 06:44:45 -0800
Message-ID: <59095b07-ae17-48d0-8650-fa0207a08a29@intel.com>
Date: Mon, 14 Feb 2022 22:44:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH] trace: Split address space and slot id in
 trace_kvm_set_user_memory()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20220104023540.1433331-1-xiaoyao.li@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220104023540.1433331-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=1, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kindly ping.

On 1/4/2022 10:35 AM, Xiaoyao Li wrote:
> The upper 16 bits of kvm_userspace_memory_region::slot are
> address space id. Parse it separately in trace_kvm_set_user_memory().
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
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


