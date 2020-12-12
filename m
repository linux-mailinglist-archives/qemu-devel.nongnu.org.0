Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4072D89F3
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:23:38 +0100 (CET)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBQX-0005EY-Pj
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1koA1V-0007NW-14
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:53:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:42300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1koA1R-0006t9-TN
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:53:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5E09AC6A;
 Sat, 12 Dec 2020 11:41:42 +0000 (UTC)
Subject: Re: [PATCH v11 18/25] cpu: Move synchronize_from_tb() to tcg_ops
From: Claudio Fontana <cfontana@suse.de>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-19-cfontana@suse.de>
 <78a7119d-1b4b-47dc-8f16-510708c9fcd4@linaro.org>
 <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
 <15b884b7-94e4-1476-f883-e84379b2661e@linaro.org>
 <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
 <946cb717-d1f3-5b30-5622-0126437420d7@suse.de>
 <b7db8e36-f623-a090-a19a-644b02c3cd76@linaro.org>
 <6c117162-7b6d-14bc-9d6e-f5169d7d1e31@redhat.com>
 <2d76e092-14bf-f9dc-4703-811f7768f1a7@suse.de>
 <20201211200221.GE1289986@habkost.net>
 <8b6e3c41-f778-414d-e62c-8733ecb19dc7@suse.de>
Message-ID: <88d888fb-e0ec-3b30-9409-99a4fe03eebb@suse.de>
Date: Sat, 12 Dec 2020 12:41:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8b6e3c41-f778-414d-e62c-8733ecb19dc7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/20 11:00 AM, Claudio Fontana wrote:
> On 12/11/20 9:02 PM, Eduardo Habkost wrote:
>> On Fri, Dec 11, 2020 at 07:51:54PM +0100, Claudio Fontana wrote:
>>> On 12/11/20 7:26 PM, Philippe Mathieu-Daudé wrote:
>>>> On 12/11/20 7:22 PM, Richard Henderson wrote:
>>>>> On 12/11/20 12:15 PM, Claudio Fontana wrote:
>>>>>> Should I return this file to the original state (without the extra #includes that pretend it to be a standalone header file,
>>>>>> and call it
>>>>>>
>>>>>> tcg-cpu-ops.h.inc
>>>>>>
>>>>>> ?
>>>>>
>>>>> If this header can work with qemu/typedefs.h, then no, because the circularity
>>>>> has been resolved.  Otherwise, yes.
>>>>
>>>> My editor got confused with TranslationBlock, which is why I asked
>>>> to include its declaration.
>>>>
>>>> Easier to forward-declare TranslationBlock in qemu/typedefs.h?
>>>>
>>>> Regards,
>>>>
>>>> Phil.
>>>>
>>>
>>> Hello Philippe,
>>>
>>> ok you propose to move the existing fwd declaration of TranslationBlock from cpu.h to qemu/typedefs.h .
>>
>> It seems simpler to just add a
>>
>>     typedef struct TranslationBlock TranslationBlock;
>>
>> line to tcg-cpu-ops.h.
>>
>> Or, an even simpler solution: just use `struct TranslationBlock`
>> instead of `TranslationBlock` in the declarations being moved to
>> tcg-cpu-ops.h.
>>
>> We don't need to move declarations to typedefs.h anymore, because
>> now the compilers we support don't warn about typedef
>> redefinitions:
>> https://lore.kernel.org/qemu-devel/20200914134636.GZ1618070@habkost.net/
>>
>>
>>>
>>> And what about #include "exec/memattrs.h"?
>>>
>>> I assume you propose to put struct MemTxAttrs there as a fwd declaration too,
>>
>> This can't be done, because MemTxAttrs can't be an incomplete
>> type in the code you are moving (the methods get a MemTxAttrs
>> value, not a pointer).
> 
> 
> 
> I'm confused now on what we are trying to do: if we want the file to be a "proper header" or just a TCG-ops-only convenience split of cpu.h.
> 
> I thought that we were only solving a highlighting issue in some editor (Philippe),
> and I wonder if these changes in qemu/typedef.h help with that?
> 
> I tried adding both to qemu/typedef.h, and since cpu.h is the only user of the file, and it already includes memattrs.h, everything is fine.
> 
> But here maybe you are proposing to make it a regular header, and include this instead of just hw/core/cpu.h in the targets?
> 
> I am thinking whether it is the case to scrap this whole mess, make TCGCPUOps a pointer in CPUClass, and in the targets say for example:
> 
> #include "tcg-cpu-ops.h"
> 
> ...
> 
> +static struct TCGCPUOps cris_tcg_ops = {
> +    .initialize = cris_initialize_tcg,
> +};
> +
>  static void cris_cpu_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -284,7 +292,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_stop_before_watchpoint = true;
>  
>      cc->disas_set_info = cris_disas_set_info;
> -    cc->tcg_ops.initialize = cris_initialize_tcg;
> +    cc->tcg_ops = &cris_tcg_ops;
>  }
> 
> 
> What do you all think of this?
> 
> Thanks,
> 
> Claudio

Not sure it solves all problems: the MMUAccessType is still a cpu.h enum, so we are back to the circular dependency.
Will try the .inc in the next spin, and I hope that the discussion can go on from there, with Eduardo, Philippe and Richard laying out more clearly what your requirements are.

Thanks,

Claudio


