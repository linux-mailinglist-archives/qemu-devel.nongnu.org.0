Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A2769ECFF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:39:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUf1R-0002Yx-J3; Tue, 21 Feb 2023 21:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pUf1N-0002KQ-94; Tue, 21 Feb 2023 21:38:17 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pUf1K-0002kp-2Z; Tue, 21 Feb 2023 21:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677033494; x=1708569494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XKtWyhhMsv4S7QNMfNOSoCuHBO1JeUzgcxNUGHVZ7L8=;
 b=KjG5GleC/uFkb02VzDzYPXwRGIPI1jG5IA1Dcn42FWrskMLErTLZe5Af
 G5uN719ofR0Mi2Q7jMdF+M5Glf6Uk72NdPcwmW/Uk5UedHi09k2qlUBbi
 Kiz3L2mQpofzj4WDzaOUnbh+kHWq9Yndg442tVLXCTfT1MXl91X3fm0a5
 zsESqtZPOM94sGS2I3q87xBVryDNVVdOCuTwvQII4K2wdTkOfHyvY22IF
 /7kDuEaUPfLARa8hWsR5pGufz43033F6GjnhNb0EQVuVvzBDz8FxzNjWG
 ZXr8k6ZFFQbJ3IO+hUsWBi42ki3Wf/29o6K+ccbpkqrTqIXBzDJTn/s5x w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334178645"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="334178645"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 18:38:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="673937160"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="673937160"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.254.208.234])
 ([10.254.208.234])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 18:38:07 -0800
Message-ID: <87e11e16-f9ad-bfb4-cc1c-d5288741ded3@intel.com>
Date: Wed, 22 Feb 2023 10:38:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v4 6/9] hw/i386/pc: Initialize ram_memory variable directly
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-7-shentey@gmail.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230213162004.2797-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=xiaoyao.li@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 2/14/2023 12:20 AM, Bernhard Beschow wrote:
> Going through pc_memory_init() seems quite complicated for a simple
> assignment.
> 

...

> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 5bde4533cc..00ba725656 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -143,6 +143,7 @@ static void pc_init1(MachineState *machine,
>       if (xen_enabled()) {
>           xen_hvm_init_pc(pcms, &ram_memory);
>       } else {
> +        ram_memory = machine->ram;
>           if (!pcms->max_ram_below_4g) {
>               pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
>           }
> @@ -205,8 +206,7 @@ static void pc_init1(MachineState *machine,
>   
>       /* allocate ram and load rom/bios */
>       if (!xen_enabled()) {
> -        pc_memory_init(pcms, system_memory,
> -                       rom_memory, &ram_memory, hole64_size);

IMHO, it seems more proper to put

+        ram_memory = machine->ram;

here rather than above.

> +        pc_memory_init(pcms, system_memory, rom_memory, hole64_size);
>       } else {
>           pc_system_flash_cleanup_unused(pcms);
>           if (machine->kernel_filename != NULL) {


