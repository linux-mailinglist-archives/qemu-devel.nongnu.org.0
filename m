Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEBE53119F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:34:00 +0200 (CEST)
Received: from localhost ([::1]:57550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntA4F-0008K9-9T
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntA10-0004Vx-SK
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:30:41 -0400
Received: from mga06b.intel.com ([134.134.136.31]:18298 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntA0y-0003zo-3d
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653319836; x=1684855836;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7OenGLB7dGpptwRRzjJaPmhu5ShRYU9QhFSj1l1mbT8=;
 b=UzcBEGKL1Wu/KphG8gADqESTRDsbuTUfkClpOqDTtSDzdyqk1FylQUDq
 ysA8Wz4Mj4uYZOWWWF3qi8KgCVlvDgz9YQ5yoTwSya76zZmpCo8zWU6Yr
 m2P2VzDnZ2Nn3I9c6ZVtvOldPWwU1NCfayc9HIZ+oWpB2+z0yaygYMYXc
 G9E4Isc/pA1gaM9aLGddPilHUvk9HGfcjz0x9KDBzLWmH8o5X+wmg2tyq
 3C9tGiuQI0YO/E6vc9nIsYeISA8hSBpqtpBLOVmytQvYBot2lo52PUI8N
 T+An3TDYbwNTlOjcgLqeFI7l+0nDIRkQG0qtnncVfLwFNEhUHE7icQdWo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="333901290"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="333901290"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:30:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600706775"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.171.127])
 ([10.249.171.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:30:24 -0700
Message-ID: <ee52e4e9-e84f-4654-5414-a9a3fe3a46d7@intel.com>
Date: Mon, 23 May 2022 23:30:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 06/36] i386/tdx: Get tdx_capabilities via
 KVM_TDX_CAPABILITIES
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-7-xiaoyao.li@intel.com>
 <20220523084530.baedwpbwldc7cbnz@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220523084530.baedwpbwldc7cbnz@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/2022 4:45 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> +    do {
>> +        size = sizeof(struct kvm_tdx_capabilities) +
>> +               max_ent * sizeof(struct kvm_tdx_cpuid_config);
>> +        caps = g_malloc0(size);
>> +        caps->nr_cpuid_configs = max_ent;
>> +
>> +        r = tdx_platform_ioctl(KVM_TDX_CAPABILITIES, 0, caps);
>> +        if (r == -E2BIG) {
>> +            g_free(caps);
>> +            max_ent *= 2;
>> +        } else if (r < 0) {
>> +            error_report("KVM_TDX_CAPABILITIES failed: %s\n", strerror(-r));
>> +            exit(1);
>> +        }
>> +    }
>> +    while (r == -E2BIG);
> 
> This should have a limit for the number of loop runs.

Actually, this logic is copied from get_supported_cpuid().

Anyway, I can put a maximum limit as 256 (it should be large enough) or 
maybe re-use KVM_MAX_CPUID_ENTRIES. When it gets hit, we know we need to 
update QEMU to fit with TDX on new platform.

> take care,
>    Gerd
> 


