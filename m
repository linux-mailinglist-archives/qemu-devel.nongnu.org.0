Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F6F4EE7C2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 07:30:28 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na9re-00073f-R0
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 01:30:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1na9py-0006Mo-KK
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 01:28:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:27096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1na9pv-0007mA-MN
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 01:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648790919; x=1680326919;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v8kHqwFcC17b9E8ewbOBQNedtItz8Sjy5JphL6kxsCs=;
 b=D8O7sIWaktNwuGGrJlxmPlL9rrJefeOxiv+3mx1Bpv57ixMtgkd45gLt
 vojSC/IY0eF1rZ95tCbrY+1f6+ZNQD0tmEKREMqaCgqVfgXLnou596x9f
 Rl+hX6Mmtk0ibte/utd6Myr8ZFCvcMJwb53lkG2G0+YLvEwL3I2H+GtCJ
 N6sweFPlAuER3p4Jc5RZy8xydNERevlDtcWOuBxIM/Fj2ol11VHXnOJan
 I71aEwvoJ1PQmrmLEfVhwFNmJrBN36yxgopAOsfJlbz7YaBDz9EiuYA9L
 7O+jBuqOrCJVTAESZ0s+HfuuGFr6Qh2sKEuaC6PIjpB3VTi81X0ZpkuE8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260225277"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="260225277"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 22:28:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="567163332"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.171.24])
 ([10.249.171.24])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 22:28:33 -0700
Message-ID: <af45db70-0d65-a4f2-89da-2bd86dfab5a8@intel.com>
Date: Fri, 1 Apr 2022 13:28:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] i386: factor out x86_firmware_configure()
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-3-kraxel@redhat.com>
 <73f3b878-1b3d-c292-d124-410a20acfa62@gmail.com>
 <20220401050818.hbj4qkebwggvc6x3@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220401050818.hbj4qkebwggvc6x3@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=xiaoyao.li@intel.com;
 helo=mga14.intel.com
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

On 4/1/2022 1:08 PM, Gerd Hoffmann wrote:
>>>                if (sev_enabled()) {
>>
>>                      ^^^
> 
>> Can we remove the SEV check ...
> 
>>> +    pc_system_parse_ovmf_flash(ptr, size);
>>> +
>>> +    if (sev_enabled()) {
>>
>> ... because we are still checking SEV here.
> 
> Well, the two checks have slightly different purposes.  The first check
> will probably become "if (sev || tdx)" soon, 

Not soon for TDX since the hacky pflash interface to load TDVF is rejected.

> whereas the second will
> become "if (sev) { ... } if (tdx) { ... }".
> 
> We could remove the first.  pc_system_parse_ovmf_flash() would run
> unconditionally then.  Not needed, but should not have any bad side
> effects.
> 
> take care,
>    Gerd
> 


