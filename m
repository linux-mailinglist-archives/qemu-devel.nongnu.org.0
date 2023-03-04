Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF46AA7EE
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 05:06:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYJ8u-0000sI-7Z; Fri, 03 Mar 2023 23:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pYJ8p-0000pz-GK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 23:05:04 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pYJ8m-00054d-8e
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 23:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677902700; x=1709438700;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HD3SckavdhIBNyA+9INcHkdVwaDWSnDk3Cz9Xpj5Hqs=;
 b=eoIS9Vuw+xCn/FbfrZhYInm8dnXEKjOgH9/TXRO6wDtjX6bY5wuJJCS3
 blYGYi5/d+lkMBlVJar+I3rp0HuXnwPg3Oavp+OIP8gGWZJfraQ1C9YUY
 I9m7tZMBgWUEAMiausPHqAD8aky4vjSSDYc6dVbDa8O1A5ufZcaiNWhvf
 gpHEiBj8W4FlhNWJor8WesJ9Q1RWza8MzBELCIoK2svCMD2nfHGDcGScS
 wO4ObwMfKDenFFvxb2nA9KAa7aC5hkyqsM9Z0rv+BuleEkiE8fVFLhtSi
 j6SCWJsjYHItC4gErIF5/z90Ox6ID1b0LKzESXGRa2sY4ksAXX35l/TV8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="400036518"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="400036518"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 20:04:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="849711208"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="849711208"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.168.161])
 ([10.249.168.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 20:04:54 -0800
Message-ID: <fd4b1ce6-d998-c1e7-f9ce-469b757d8f9d@intel.com>
Date: Sat, 4 Mar 2023 12:04:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/6] target/i386: Support new Intel platform
 Instructions in CPUID enumeration
Content-Language: en-US
To: Tao Su <tao1.su@linux.intel.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com, philmd@linaro.org
References: <20230303065913.1246327-1-tao1.su@linux.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230303065913.1246327-1-tao1.su@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/3/2023 2:59 PM, Tao Su wrote:
> Intel platforms Granite Rapids/Sierra Forest introduce below new
> instructions and CPUID leaves:
> 
>   - CMPccXADD CPUID.(EAX=7,ECX=1):EAX[bit 7]
>   - AMX-FP16 CPUID.(EAX=7,ECX=1):EAX[bit 21]
>   - AVX-IFMA CPUID.(EAX=7,ECX=1):EAX[bit 23]
>   - AVX-VNNI-INT8 CPUID.(EAX=7,ECX=1):EDX[bit 4]
>   - AVX-NE-CONVERT CPUID.(EAX=7,ECX=1):EDX[bit 5]
>   - PREFETCHITI CPUID.(EAX=7,ECX=1):EDX[bit 14]
> 
> Details can be found in recent Intel ISE (Instruction Set Extensions)[1].
> 
> KVM part of advertising these CPUID bits have been already in Linux
> mainline from commit(6a19d7aa5821) to commit(29c46979b25d). This series
> adds the counterpart in QEMU to allow these features exposed to guest.
> 
> [1] Intel ISE: https://cdrdv2.intel.com/v1/dl/getContent/671368
> 

For the whole series,

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
> 
> Changelog:
> 
> v2:
>   - Rebase to latest QEMU.
>   - Improve changelog.
> v1:
>   - https://lore.kernel.org/all/20221208071917.1923093-1-jiaxi.chen@linux.intel.com/
> 
> Jiaxi Chen (6):
>    target/i386: Add support for CMPCCXADD in CPUID enumeration
>    target/i386: Add support for AMX-FP16 in CPUID enumeration
>    target/i386: Add support for AVX-IFMA in CPUID enumeration
>    target/i386: Add support for AVX-VNNI-INT8 in CPUID enumeration
>    target/i386: Add support for AVX-NE-CONVERT in CPUID enumeration
>    target/i386: Add support for PREFETCHIT0/1 in CPUID enumeration
> 
>   target/i386/cpu.c | 26 +++++++++++++++++++++++---
>   target/i386/cpu.h | 14 ++++++++++++++
>   2 files changed, 37 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 627634031092e1514f363fd8659a579398de0f0e


