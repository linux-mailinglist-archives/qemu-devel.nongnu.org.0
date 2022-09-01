Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFB5A8E02
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 08:12:07 +0200 (CEST)
Received: from localhost ([::1]:36218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTdQs-0003mq-EW
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 02:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oTdMe-0001me-9w
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:07:48 -0400
Received: from mga11.intel.com ([192.55.52.93]:20598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oTdMc-0005Jg-3l
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662012462; x=1693548462;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G6jVS9CeJVnfYB/Itqo+fr2ajX7MAVat38uzOdqvS9o=;
 b=EGo9MoBCIr9ssE55krMgDmSmVs7Q/tSdUThIX5YBDlnFZ3vIqnMjAmo7
 6zCbwuNaXq5yHlqFL9a/hIw4ZwQrOt2zNwoVPN/FVsxR8Hu7YxkD3pWTV
 66cAJF9IRpEB/IzHU6UMw7IO6yeB78KymCpI0xqaLbHupdGR34IXoHtHc
 ByXSi9Kcb0iZkxXGyVBi2/NsBFgn3xN9QQNBnxY71Xle2G8VGjFkU6pzz
 cOtD7fjzSREeFWIKHoNdPTbH27B6q7oWW122gBLRhrjzTyvpYdsCIu+v5
 DaiyjKh5rMx3qaeAvk9B1UnB11tWLssh2m4emT8kuvDf2oKmHIsQJeeij w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="293204308"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="293204308"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 23:07:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="754687731"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.114])
 ([10.255.28.114])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 23:07:15 -0700
Message-ID: <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
Date: Thu, 1 Sep 2022 14:07:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>
References: <20220831125059.170032-1-kraxel@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220831125059.170032-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=192.55.52.93;
 envelope-from=xiaoyao.li@intel.com; helo=mga11.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On 8/31/2022 8:50 PM, Gerd Hoffmann wrote:
> When the guest (firmware specifically) knows how big
> the address space actually is it can be used better.
> 
> Some more background:
>    https://bugzilla.redhat.com/show_bug.cgi?id=2084533

QEMU enables host-phys-bits for "-cpu host/max" in 
host_cpu_max_instance_init();

I think the problem is for all the named CPU model, that they don't have 
phys_bits defined. Thus they all have "cpu->phys-bits == 0", which leads 
to cpu->phys_bits = TCG_PHYS_ADDR_BITS (36 for 32-bits build and 40 for 
64-bits build)

Anyway, IMO, guest including guest firmware, should always consult from 
CPUID leaf 0x80000008 for physical address length. Tt is the duty of 
userspace VMM, here QEMU, to ensure VM's host physical address length 
not exceeding host's. If userspace VMM cannot ensure this, guest is 
likely hitting problem.

> This is a RfC series exposes the information via cpuid.
> 
> take care,
>    Gerd
> 
> Gerd Hoffmann (2):
>    [hack] reserve bit KVM_HINTS_HOST_PHYS_BITS
>    [RfC] expose host-phys-bits to guest
> 
>   include/standard-headers/asm-x86/kvm_para.h | 3 ++-
>   target/i386/cpu.h                           | 3 ---
>   hw/i386/microvm.c                           | 6 +++++-
>   target/i386/cpu.c                           | 3 +--
>   target/i386/host-cpu.c                      | 4 +++-
>   target/i386/kvm/kvm.c                       | 1 +
>   6 files changed, 12 insertions(+), 8 deletions(-)
> 


