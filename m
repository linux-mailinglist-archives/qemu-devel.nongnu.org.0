Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8542D44DB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:55:44 +0100 (CET)
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0sZ-0002J0-Pr
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kn0hF-0001GP-3J
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:44:01 -0500
Received: from mx2.suse.de ([195.135.220.15]:52730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kn0hD-0000X3-IK
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:44:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44EAAAD2D;
 Wed,  9 Dec 2020 14:43:56 +0000 (UTC)
Subject: Re: [RFC v9 24/32] cpu: move cc->transaction_failed to tcg_ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-25-cfontana@suse.de>
 <18ac9b63-4e35-cfc2-24f6-b61ee5d201b4@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <6f3f261a-8b79-e9d7-80a7-facc4731064e@suse.de>
Date: Wed, 9 Dec 2020 15:43:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <18ac9b63-4e35-cfc2-24f6-b61ee5d201b4@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, haxm-team@intel.com,
 Cameron Esfahani <dirty@apple.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 10:31 AM, Philippe Mathieu-Daudé wrote:
> On 12/8/20 8:48 PM, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
> ...
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>> index 6b9b72e785..0cc0927738 100644
>> --- a/include/hw/core/tcg-cpu-ops.h
>> +++ b/include/hw/core/tcg-cpu-ops.h
> 
> Missing (for MemTxAttrs/MemTxResult):
> 
>   #include "exec/memattrs.h"


right, this is included only from cpu.h though, which already does it, should we still repeat the include here?

Thanks,

Claudio

> 
>> @@ -40,6 +40,15 @@ typedef struct TcgCpuOperations {
>>      /** @do_interrupt: Callback for interrupt handling. */
>>      void (*do_interrupt)(CPUState *cpu);
>>  
>> +    /**
>> +     * @do_transaction_failed: Callback for handling failed memory transactions
>> +     * (ie bus faults or external aborts; not MMU faults)
>> +     */
>> +    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
>> +                                  unsigned size, MMUAccessType access_type,
>> +                                  int mmu_idx, MemTxAttrs attrs,
>> +                                  MemTxResult response, uintptr_t retaddr);
>> +
> ...
> 
> 


