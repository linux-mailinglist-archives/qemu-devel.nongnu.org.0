Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170D69C5BE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:01:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU09F-0008Bm-DT; Mon, 20 Feb 2023 01:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pU09D-0008Bd-7m
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 01:59:39 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pU09B-00058I-9O
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 01:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676876377; x=1708412377;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a5q9o3pnlA3vdMXM7PYMd11JAFbI1F4Zd0KYVQwkaaI=;
 b=TiA7+e997w5hqTUP9F14Ly6fb5n0erIs32m15WJ+yICfzLZm0dqcDYgS
 0ILNuMrJkOLMeiBZ8u2vrKeVcnbTxNoH7T7pNt2pnY0Mg9ZD3lcorHNVh
 igS6s+4itTn4pBq0HczcXmQkqX2JDA3FUGY20K9+Qen9At5ABAWfdGB/Y
 KhMnH/nnSthvE2uQjB8kcX5qw5kYPRkks+ejE1fn76jF8V/YSqftbLV9i
 6YPAC+F7HWFtxhhZJpkUziyhPXLwmnnh557ZGkaqDWBrq4FcdldSwg9v0
 cHVYJEKAL6xB6p4WkAeKpdDZjhUJeMUkYgn5vLqycYA2kuUcnjpPcY+n3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="320457742"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="320457742"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 22:59:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="916745150"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="916745150"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.254.208.109])
 ([10.254.208.109])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 22:59:24 -0800
Message-ID: <e7d7f1a0-15ac-d863-625f-08e66667e4ec@intel.com>
Date: Mon, 20 Feb 2023 14:59:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs in
 CPUID.04H
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-5-zhao1.liu@linux.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230213093625.158170-5-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/13/2023 5:36 PM, Zhao Liu wrote:
> For i-cache and d-cache, the maximum IDs for CPUs sharing cache (
> CPUID.04H.00H:EAX[bits 25:14] and CPUID.04H.01H:EAX[bits 25:14]) are
> both 0, and this means i-cache and d-cache are shared in the SMT level.
> This is correct if there's single thread per core, but is wrong for the
> hyper threading case (one core contains multiple threads) since the
> i-cache and d-cache are shared in the core level other than SMT level.
> 
> Therefore, in order to be compatible with both multi-threaded and
> single-threaded situations, we should set i-cache and d-cache be shared
> at the core level by default.

It's true for VM only when the exactly HW topology is configured to VM. 
i.e., two virtual LPs of one virtual CORE are pinned to two physical LPs 
that of one physical CORE. Otherwise it's incorrect for VM.

for example. given a VM of 4 threads and 2 cores. If not pinning the 4 
threads to physical 4 LPs of 2 CORES. It's likely each vcpu running on a 
LP of different physical cores. So no vcpu shares L1i/L1d cache at core 
level.

