Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CAB525919
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:49:09 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npJUR-0004TO-OP
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1npJSM-0002Bg-O1
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:46:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:6710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1npJSJ-0005Bf-97
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652402815; x=1683938815;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5c2e/TArcdBeEGS+Y2rMq8nx3fXkMZ3M8isdb3HBWSg=;
 b=ZBRB8IYTGSV2R5zCCCjxOV9k0xRKzY1errEoYHGHYlxvbbzBU8CSyctF
 JkPZD5vqJOYWszWL/9uO8bLg+/1vX3AaALdJpVX7BC0Bo6tIvrDlGdZ8T
 zVNsoECAWRGSpcUA7q5TsLKT26lrBLMuraCuaFHoByNlsZbVkupGAyfxN
 NmZ1z5nZKC0Lt1GreivNC5dHDhj3AWNCjR5jqMggnC3P8fSZxupz2cgEk
 3HhLfrI4a3NiIm43TvVVnEzRp+1dQSD/l4H699PStr/f5z2KnXCSOAOe/
 alabqgQ78zR6ZYRvG8wf6mp2ozv+o46fwTDKZBSvwvPaKNqIC6+Qc8URv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270309811"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="270309811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 17:46:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="594955799"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.175.214])
 ([10.249.175.214])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 17:46:47 -0700
Message-ID: <5c5d9722-6880-4b8e-3293-ff4a8c295b53@intel.com>
Date: Fri, 13 May 2022 08:46:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v4 24/36] i386/tdx: Add TDVF memory via
 KVM_TDX_INIT_MEM_REGION
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, isaku.yamahata@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-25-xiaoyao.li@intel.com>
 <20220512183423.GI2789321@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220512183423.GI2789321@ls.amr.corp.intel.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/2022 2:34 AM, Isaku Yamahata wrote:
> On Thu, May 12, 2022 at 11:17:51AM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> From: Isaku Yamahata <isaku.yamahata@intel.com>
>>
>> TDVF firmware (CODE and VARS) needs to be added/copied to TD's private
>> memory via KVM_TDX_INIT_MEM_REGION, as well as TD HOB and TEMP memory.
>>
>> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   target/i386/kvm/tdx.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
>> index 3e18ace90bf7..567ee12e88f0 100644
>> --- a/target/i386/kvm/tdx.c
>> +++ b/target/i386/kvm/tdx.c
>> @@ -240,6 +240,7 @@ static void tdx_finalize_vm(Notifier *notifier, void *unused)
>>   {
>>       TdxFirmware *tdvf = &tdx_guest->tdvf;
>>       TdxFirmwareEntry *entry;
>> +    int r;
>>   
>>       tdx_init_ram_entries();
>>   
>> @@ -265,6 +266,29 @@ static void tdx_finalize_vm(Notifier *notifier, void *unused)
>>             sizeof(TdxRamEntry), &tdx_ram_entry_compare);
>>   
>>       tdvf_hob_create(tdx_guest, tdx_get_hob_entry(tdx_guest));
>> +
>> +    for_each_tdx_fw_entry(tdvf, entry) {
>> +        struct kvm_tdx_init_mem_region mem_region = {
>> +            .source_addr = (__u64)entry->mem_ptr,
>> +            .gpa = entry->address,
>> +            .nr_pages = entry->size / 4096,
>> +        };
>> +
>> +        __u32 metadata = entry->attributes & TDVF_SECTION_ATTRIBUTES_MR_EXTEND ?
>> +                         KVM_TDX_MEASURE_MEMORY_REGION : 0;
> 
> Please use flags instead of metadata.

Sure. Will change it.

> 
>> +        r = tdx_vm_ioctl(KVM_TDX_INIT_MEM_REGION, metadata, &mem_region);
>> +        if (r < 0) {
>> +             error_report("KVM_TDX_INIT_MEM_REGION failed %s", strerror(-r));
>> +             exit(1);
>> +        }
>> +
>> +        if (entry->type == TDVF_SECTION_TYPE_TD_HOB ||
>> +            entry->type == TDVF_SECTION_TYPE_TEMP_MEM) {
>> +            qemu_ram_munmap(-1, entry->mem_ptr, entry->size);
>> +            entry->mem_ptr = NULL;
>> +        }
>> +    }
>>   }
>>   
>>   static Notifier tdx_machine_done_notify = {
>> -- 
>> 2.27.0
>>
>>
> 


