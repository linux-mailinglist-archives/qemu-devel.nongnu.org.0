Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817B4E20D6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:01:29 +0100 (CET)
Received: from localhost ([::1]:53838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWC2i-0004H0-2F
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:01:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWBxo-00027m-2v
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:56:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:54378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWBxm-0005v1-6p
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647845782; x=1679381782;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nhvADs+tynBIlqMFJkoupURGmVmdXZA4EkmDJ1XRbig=;
 b=jYqgwt+FHD2qeQTX9zw/g0ODh5qEWYkP9KAmmUYQKjSUTZH3rVmtdybG
 JnxVnPVsrKt7kLlqT6Ce2OALkCYCdEXr60oZZgQKP2OpOexgXV+vuxMRy
 F0pPwp08GSqkSm/VZcaPRixZ+HFzVKxkbbFKfdStY6ARXAR/E3Li06G6I
 y2GShWO/lS9Zd9yYzlNUNMiT9s4AfbiwYjWpX2EYvNvEw4pHjnoMSyHts
 LO0AJ73eq6jXRpQYODpFp8f+W3WYwJkIWS0tw5s/sqFL6L0AZ1vferzGW
 5lTU3w569REhkllNNTqWj2LfO3tN5dyNCSMPaYxZ41enr7MVB2wCcO0CB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="238087015"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="238087015"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:56:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="559734025"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.245])
 ([10.249.169.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:56:08 -0700
Message-ID: <680200c2-d0c5-d36b-c88e-4721bab63443@intel.com>
Date: Mon, 21 Mar 2022 14:56:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 06/36] i386/tdx: Get tdx_capabilities via
 KVM_TDX_CAPABILITIES
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-7-xiaoyao.li@intel.com>
 <20220318020838.GB4006347@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220318020838.GB4006347@ls.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
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

On 3/18/2022 10:08 AM, Isaku Yamahata wrote:
> On Thu, Mar 17, 2022 at 09:58:43PM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
>> index e3b94373b316..bed337e5ba18 100644
>> --- a/target/i386/kvm/tdx.c
>> +++ b/target/i386/kvm/tdx.c
>> @@ -14,10 +14,77 @@
>>   #include "qemu/osdep.h"
>>   #include "qapi/error.h"
>>   #include "qom/object_interfaces.h"
>> +#include "sysemu/kvm.h"
>>   
>>   #include "hw/i386/x86.h"
>>   #include "tdx.h"
>>   
>> +enum tdx_ioctl_level{
>> +    TDX_VM_IOCTL,
>> +    TDX_VCPU_IOCTL,
>> +};
>> +
>> +static int __tdx_ioctl(void *state, enum tdx_ioctl_level level, int cmd_id,
>> +                        __u32 metadata, void *data)
>> +{
>> +    struct kvm_tdx_cmd tdx_cmd;
>> +    int r;
>> +
>> +    memset(&tdx_cmd, 0x0, sizeof(tdx_cmd));
>> +
>> +    tdx_cmd.id = cmd_id;
>> +    tdx_cmd.metadata = metadata;
>> +    tdx_cmd.data = (__u64)(unsigned long)data;
>> +
>> +    switch (level) {
>> +    case TDX_VM_IOCTL:
>> +        r = kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
>> +        break;
>> +    case TDX_VCPU_IOCTL:
>> +        r = kvm_vcpu_ioctl(state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
>> +        break;
>> +    default:
>> +        error_report("Invalid tdx_ioctl_level %d", level);
>> +        exit(1);
>> +    }
>> +
>> +    return r;
>> +}
>> +
>> +#define tdx_vm_ioctl(cmd_id, metadata, data) \
>> +        __tdx_ioctl(NULL, TDX_VM_IOCTL, cmd_id, metadata, data)
>> +
>> +#define tdx_vcpu_ioctl(cpu, cmd_id, metadata, data) \
>> +        __tdx_ioctl(cpu, TDX_VCPU_IOCTL, cmd_id, metadata, data)
> 
> No point to use macro.  Normal (inline) function can works.
> 

OK. Will change it to inline function.

