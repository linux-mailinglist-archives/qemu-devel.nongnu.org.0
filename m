Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC364E2030
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 06:41:42 +0100 (CET)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWAnU-0001Yk-1M
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 01:41:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWAha-0000GA-2Q
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:35:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:16571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWAhX-00070P-DC
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647840931; x=1679376931;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iorjzoFBCiA3DGnxeiK5iW/hRVMlM2AMh4EOjCZYqO0=;
 b=G4Zabdg5/vy78uarfHfBdzRgpRkpjUM33NDoJ2rrgugEWyUa57sr8bR0
 PGXSkFs9MwHiMJLjiVvzBD+z6i7rYhDUn3x1Npyq8WEu30SmnvJEYxb4L
 tzADL8GM8vsO+0P4GcYg6L8jALzUgwSrqHB+VgnCaNNaBApUwgqC6pggF
 9Bt4gemqfXE264W11oYjPN7q0le5c2O/SDjRURbcuXVy8c98+qC1gacmX
 xUOE4wgLDwGC7SljyVjJeIJcDqGi587jZk0wNsV8qPQJUI/bg6L8czlY5
 VAXjktgFeX9LoK9/5rLdhbmGuqnDlRYu4+teBjSsV6/nR75xlAYaG/JXR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="244944919"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="244944919"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 22:35:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="559708921"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.245])
 ([10.249.169.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 22:35:18 -0700
Message-ID: <55273e78-d4bb-c15a-2e2e-471b3bfd4719@intel.com>
Date: Mon, 21 Mar 2022 13:35:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 05/36] i386/tdx: Implement tdx_kvm_init() to
 initialize TDX VM context
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-6-xiaoyao.li@intel.com>
 <20220318020700.GA4006347@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220318020700.GA4006347@ls.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/2022 10:07 AM, Isaku Yamahata wrote:
> On Thu, Mar 17, 2022 at 09:58:42PM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> Introduce tdx_kvm_init() and invoke it in kvm_confidential_guest_init()
>> if it's a TDX VM. More initialization will be added later.
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   target/i386/kvm/kvm.c       | 15 ++++++---------
>>   target/i386/kvm/meson.build |  2 +-
>>   target/i386/kvm/tdx-stub.c  |  9 +++++++++
>>   target/i386/kvm/tdx.c       | 13 +++++++++++++
>>   target/i386/kvm/tdx.h       |  2 ++
>>   5 files changed, 31 insertions(+), 10 deletions(-)
>>   create mode 100644 target/i386/kvm/tdx-stub.c
>>
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 70454355f3bf..26ed5faf07b8 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -54,6 +54,7 @@
>>   #include "migration/blocker.h"
>>   #include "exec/memattrs.h"
>>   #include "trace.h"
>> +#include "tdx.h"
>>   
>>   //#define DEBUG_KVM
>>   
>> @@ -2360,6 +2361,8 @@ static int kvm_confidential_guest_init(MachineState *ms, Error **errp)
>>   {
>>       if (object_dynamic_cast(OBJECT(ms->cgs), TYPE_SEV_GUEST)) {
>>           return sev_kvm_init(ms->cgs, errp);
>> +    } else if (object_dynamic_cast(OBJECT(ms->cgs), TYPE_TDX_GUEST)) {
>> +        return tdx_kvm_init(ms, errp);
>>       }
>>   
>>       return 0;
>> @@ -2374,16 +2377,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>       Error *local_err = NULL;
>>   
>>       /*
>> -     * Initialize SEV context, if required
>> +     * Initialize confidential guest (SEV/TDX) context, if required
>>        *
>> -     * If no memory encryption is requested (ms->cgs == NULL) this is
>> -     * a no-op.
>> -     *
>> -     * It's also a no-op if a non-SEV confidential guest support
>> -     * mechanism is selected.  SEV is the only mechanism available to
>> -     * select on x86 at present, so this doesn't arise, but if new
>> -     * mechanisms are supported in future (e.g. TDX), they'll need
>> -     * their own initialization either here or elsewhere.
>> +     * It's a no-op if a non-SEV/non-tdx confidential guest support
>> +     * mechanism is selected, i.e., ms->cgs == NULL
>>        */
>>       ret = kvm_confidential_guest_init(ms, &local_err);
>>       if (ret < 0) {
>> diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
>> index b2d7d41acde2..fd30b93ecec9 100644
>> --- a/target/i386/kvm/meson.build
>> +++ b/target/i386/kvm/meson.build
>> @@ -9,7 +9,7 @@ i386_softmmu_kvm_ss.add(files(
>>   
>>   i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
>>   
>> -i386_softmmu_kvm_ss.add(when: 'CONFIG_TDX', if_true: files('tdx.c'))
>> +i386_softmmu_kvm_ss.add(when: 'CONFIG_TDX', if_true: files('tdx.c'), if_false: files('tdx-stub.c'))
>>   
>>   i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
>>   
>> diff --git a/target/i386/kvm/tdx-stub.c b/target/i386/kvm/tdx-stub.c
>> new file mode 100644
>> index 000000000000..1df24735201e
>> --- /dev/null
>> +++ b/target/i386/kvm/tdx-stub.c
>> @@ -0,0 +1,9 @@
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +
>> +#include "tdx.h"
>> +
>> +int tdx_kvm_init(MachineState *ms, Error **errp)
>> +{
>> +    return -EINVAL;
>> +}
>> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
>> index d3792d4a3d56..e3b94373b316 100644
>> --- a/target/i386/kvm/tdx.c
>> +++ b/target/i386/kvm/tdx.c
>> @@ -12,10 +12,23 @@
>>    */
>>   
>>   #include "qemu/osdep.h"
>> +#include "qapi/error.h"
>>   #include "qom/object_interfaces.h"
>>   
>> +#include "hw/i386/x86.h"
>>   #include "tdx.h"
>>   
>> +int tdx_kvm_init(MachineState *ms, Error **errp)
>> +{
>> +    TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
>> +                                                    TYPE_TDX_GUEST);
> 
> The caller already checks it.  This is redundant. Maybe assert?

the cast is to get TdxGuest pointer for later usage. I can move it the 
patch that really uses tdx pointer.

Thanks,
-Xiaoyao

> 


