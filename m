Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E395AA426
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 02:17:47 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTuNV-0003wB-Nw
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 20:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oTuIA-0000xu-2O
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 20:12:15 -0400
Received: from mga09.intel.com ([134.134.136.24]:1292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oTuGB-0006aN-FQ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 20:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662077411; x=1693613411;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lnu+YfjA5BVODcb7RD0uVkm1klwexqKt6aaFHvIhwl4=;
 b=PqKU23VRGc2QcHhmmYwBg1vh4Rb4AeneQBVcQWXtKcaPhN5UsEb1JkxI
 GeDFTrRUN0eepNKguJwvTLEjUYS9SEr4tPIH5mjR8i+VW20/oZ9THDB8g
 JuFJtuctPMx2FoLUnrTg186P7N3Lg5zy2pWyGhJav3kUHz+ChowcHN+1A
 lO06jE95jXKs2bDFO1/4JorJoj8k5U+PHWkB5VwRWvDJiSE5iaFMoGB2P
 0I0kkAszJkOOd8bGeBXfy/zGY9xm0Fj3w9IXWCW1hIHoQaaGcizQZ/uI5
 3iJIdjhLn0iZynYR6VP5lhYNTA+ZyEM8ta/aNXKbmjXUSbE1xYWwYmaLS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296639033"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="296639033"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 17:10:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642612565"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.171.28])
 ([10.249.171.28])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 17:10:03 -0700
Message-ID: <34be4132-53f4-8779-1ada-68aa554e0eac@intel.com>
Date: Fri, 2 Sep 2022 08:10:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
 <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
 <f7a56158-9920-e753-4d21-e1bcc3573e27@intel.com>
 <20220901161741.dadmguwv25sk4h6i@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220901161741.dadmguwv25sk4h6i@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=134.134.136.24;
 envelope-from=xiaoyao.li@intel.com; helo=mga09.intel.com
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

On 9/2/2022 12:17 AM, Gerd Hoffmann wrote:
> On Thu, Sep 01, 2022 at 10:36:19PM +0800, Xiaoyao Li wrote:
>> On 9/1/2022 9:58 PM, Gerd Hoffmann wrote:
>>
>>>> Anyway, IMO, guest including guest firmware, should always consult from
>>>> CPUID leaf 0x80000008 for physical address length.
>>>
>>> It simply can't for the reason outlined above.  Even if we fix qemu
>>> today that doesn't solve the problem for the firmware because we want
>>> backward compatibility with older qemu versions.  Thats why I want the
>>> extra bit which essentially says "CPUID leaf 0x80000008 actually works".
>>
>> I don't understand how it backward compatible with older qemu version. Old
>> QEMU won't set the extra bit you introduced in this series, and all the
>> guest created with old QEMU will become untrusted on CPUID leaf 0x80000008 ?
> 
> Correct, on old qemu firmware will not trust CPUID leaf 0x80000008.
> That is not worse than the situation we have today, currently the
> firmware never trusts CPUID leaf 0x80000008.
> 
> So the patches will improves the situation for new qemu only, but I
> don't see a way around that.
> 

I see.

But IMHO, I don't think it's good that guest firmware workaround the 
issue on its own. Instead, it's better to just trust CPUID leaf 
0x80000008 and fail if the given physical address length cannot be 
virtualized/supported.

It's just the bug of VMM to virtualize the physical address length. The 
correction direction is to fix the bug not the workaround to hide the bug.


