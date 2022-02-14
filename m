Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AE4B5562
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:54:39 +0100 (CET)
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdgU-0001le-6P
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:54:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nJcc7-0001Nc-R7
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:46:05 -0500
Received: from mga07.intel.com ([134.134.136.100]:49211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nJcc2-00032U-Ts
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644849959; x=1676385959;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rKIalvL37eSEIbZqBJ+m6HLUZJT6wzOwp1CDnCSCPUI=;
 b=mSf0eYfRMfcpiBMgbb44plqpj6QX+24b6MW42znYobjjFzBw/HaPcGwI
 Qsqj0g0sdkAaqi1AGTmoYxK8Q3p64bQW+1GndfrUk+7SSPNm1G6OBuToG
 bZh41nz/gQNVP3rThFN74THImEYuPT4A5/0YDTqtVyq/7y/WuSu9OHJ6q
 Au0VIt9X5pbc+z3+gC1kZHILSamrqO1QN+MDK2sFDcFD8svWa9DgQI7Gv
 JYDZnirRWC4mJOJvQDpRMNzsiQjKwBjtBR4G5xx78ZMdrAoN5zWlgs+9d
 1xUZGKLJ7Yk2bF54FXPYYJjDuzfnvy4KRGI9d0s5VvN8piMFehMQ29Jip w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="313379029"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="313379029"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 06:45:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="528213124"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.31.126])
 ([10.255.31.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 06:45:33 -0800
Message-ID: <636186c2-941e-bf15-6f32-642d2d04bb74@intel.com>
Date: Mon, 14 Feb 2022 22:45:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v1 0/2] i386: Make PIT and PIC the property of common x86
 base machine type
Content-Language: en-US
To: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220111073528.1771552-1-xiaoyao.li@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220111073528.1771552-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=1, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

ping.

On 1/11/2022 3:35 PM, Xiaoyao Li wrote:
> For PIT, it's straightforward to merge microvm::pit and
> pc_machine::pit_enabled into x86ms::pit
> 
> For PIC, move microvm::pic to x86ms:pic, which gives PC machine the
> ability to dis-/en-able PIC and it's the preparation for future TDX
> support.
> 
> Xiaoyao Li (2):
>    hw/i386: Make pit a property of common x86 base machine type
>    hw/i386: Make pic a property of common x86 base machine type
> 
>   hw/i386/microvm.c         | 54 ++-------------------------------------
>   hw/i386/pc.c              | 24 +++--------------
>   hw/i386/pc_piix.c         |  4 ++-
>   hw/i386/pc_q35.c          |  4 ++-
>   hw/i386/x86.c             | 50 ++++++++++++++++++++++++++++++++++++
>   include/hw/i386/microvm.h |  4 ---
>   include/hw/i386/pc.h      |  2 --
>   include/hw/i386/x86.h     |  4 +++
>   8 files changed, 65 insertions(+), 81 deletions(-)
> 


