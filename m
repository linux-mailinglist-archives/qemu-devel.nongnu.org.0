Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FC4EF3E9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:28:26 +0200 (CEST)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJCL-0001BX-S6
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:28:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1naJ9p-0004t8-Cj
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:25:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:22062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1naJ9m-0001KR-Iy
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648826746; x=1680362746;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fsm5U/gVnzY5Tx66fpSH3+fXiZ4i6sV/xlidLgQ60UY=;
 b=MnU1iUFxcoxoZrpg6rfa13kSrx5+hJCQeKFOhCgFDwRXiPMgUcGaKUKV
 JmovQBsNxbWNDEvTQ12RiUMtt7rivoF0cDki85Kvv9PQKzc9anV3CDupq
 86rHYKcRy+XaxubQ953adFoUSWi8ai5/HcLwCuiijKhJCdYtIP3KQhzKp
 5tuX5LrK/zKKrNfynz5NiJxTF/VpXl8Ql1f+8VYaQM3VBHG27lF9MZH3B
 b2lpiItG/4EQLQaH1hIbl6yjzp3mt0+cr2iadjc5vmrC3NEH0yZYRCVDK
 K/x1dH95Or27MblnYiK5qm6NkRGRYziK4ePxCM+MF6yLL4KBthIcwcbz7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="257740750"
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; d="scan'208";a="257740750"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 08:25:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; d="scan'208";a="567568447"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.171.24])
 ([10.249.171.24])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 08:25:40 -0700
Message-ID: <da1a4362-5402-154b-088d-b4d7c3b523d9@intel.com>
Date: Fri, 1 Apr 2022 23:25:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] i386: factor out x86_firmware_configure()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-3-kraxel@redhat.com>
 <73f3b878-1b3d-c292-d124-410a20acfa62@gmail.com>
 <20220401050818.hbj4qkebwggvc6x3@sirius.home.kraxel.org>
 <af45db70-0d65-a4f2-89da-2bd86dfab5a8@intel.com>
 <86f9c4c9-1b7f-7c55-3379-cb93c4456f29@gmail.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <86f9c4c9-1b7f-7c55-3379-cb93c4456f29@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/2022 6:36 PM, Philippe Mathieu-Daudé wrote:
> On 1/4/22 07:28, Xiaoyao Li wrote:
>> On 4/1/2022 1:08 PM, Gerd Hoffmann wrote:
>>>>>                if (sev_enabled()) {
>>>>
>>>>                      ^^^
>>>
>>>> Can we remove the SEV check ...
>>>
>>>>> +    pc_system_parse_ovmf_flash(ptr, size);
>>>>> +
>>>>> +    if (sev_enabled()) {
>>>>
>>>> ... because we are still checking SEV here.
>>>
>>> Well, the two checks have slightly different purposes.  The first check
>>> will probably become "if (sev || tdx)" soon, 
>>
>> Not soon for TDX since the hacky pflash interface to load TDVF is 
>> rejected.
> 
> You can still convince us you need a pflash for TDX, and particularly
> "a pflash that doesn't behave like pflash". 

I'm fine with "-bios" option to load TDVF. :)

> Also, see the comment in
> the next patch of this series:
> 
> +         * [...] there is no need to register
> +         * the firmware as rom to properly re-initialize on reset.
> +         * Just go for a straight file load instead.
> +         */

Yes, Gerd's this series make it easier for TDX to load TDVF via -bios.

>>> whereas the second will
>>> become "if (sev) { ... } if (tdx) { ... }".
>>>
>>> We could remove the first.  pc_system_parse_ovmf_flash() would run
>>> unconditionally then.  Not needed, but should not have any bad side
>>> effects.
> 
> OK, then:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> 


