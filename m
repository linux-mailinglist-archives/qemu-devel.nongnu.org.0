Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567704E2201
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 09:18:30 +0100 (CET)
Received: from localhost ([::1]:49670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWDFE-0000Yd-UK
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 04:18:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWDCN-0008BR-7u
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:15:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:60160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWDCK-0002QI-KT
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647850528; x=1679386528;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=emHGj6ghKUk9AmDI87yzqr6a+usVYgHge4IUp6jmt9M=;
 b=ke4eMnDRicid8I2ml16FtaQLMjVKz25oYvYJ4GhIra9YDZDzosJWBLg0
 SH0msu+X6xi+PXZXZwoN2r4HeKDO5S/5Ke5zO0IQIasTHupLT1Re0ZcOx
 s0NWV/Cv+nX+gq3f7N0GnexkEK9GpWcdtKBCr11LLQ8OP27S5ZUKoXIaX
 olWjwQS7BHFDJAB8QoR3fVN/owmCd7VloDPK9vEHhjvcAsitYl/Y4gv5U
 2crHin9RKuSEG6fXo4gFQpK9uG469Z7+tw7aQK+c4v8ipknLxahtmrU+4
 efRkCOz3ZwXmU7t98UtoR4nzNMHmQsdnjgUn064NTvZBxrCa5hEN0ldH4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="238101080"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="238101080"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 01:15:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="500092839"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.249])
 ([10.255.28.249])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 01:15:19 -0700
Message-ID: <398611c0-cccc-2d4c-171f-68a93b55dea5@intel.com>
Date: Mon, 21 Mar 2022 16:15:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 16/36] i386/tdx: Set kvm_readonly_mem_enabled to
 false for TDX VM
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-17-xiaoyao.li@intel.com>
 <20220318171117.GC4049379@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220318171117.GC4049379@ls.amr.corp.intel.com>
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

On 3/19/2022 1:11 AM, Isaku Yamahata wrote:
> On Thu, Mar 17, 2022 at 09:58:53PM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> TDX only supports readonly for shared memory but not for private memory.
>>
>> In the view of QEMU, it has no idea whether a memslot is used by shared
>> memory of private. Thus just mark kvm_readonly_mem_enabled to false to
>> TDX VM for simplicity.
>>
>> Note, pflash has dependency on readonly capability from KVM while TDX
>> wants to reuse pflash interface to load TDVF (as OVMF). Excuse TDX VM
>> for readonly check in pflash.
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   hw/i386/pc_sysfw.c    | 2 +-
>>   target/i386/kvm/tdx.c | 9 +++++++++
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>> index c8b17af95353..75b34d02cb4f 100644
>> --- a/hw/i386/pc_sysfw.c
>> +++ b/hw/i386/pc_sysfw.c
>> @@ -245,7 +245,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
>>           /* Machine property pflash0 not set, use ROM mode */
>>           x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, false);
>>       } else {
>> -        if (kvm_enabled() && !kvm_readonly_mem_enabled()) {
>> +        if (kvm_enabled() && (!kvm_readonly_mem_enabled() && !is_tdx_vm())) {
> 
> Is this called before tdx_kvm_init()?

yes.

pc_init1()/ pc_q35_init()
  pc_memory_init()
     pc_system_firmware_init()

is called after configure_accelerator() to configure kvm.

