Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B062D4496
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:44:17 +0100 (CET)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0hU-00014c-J9
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kn0Wr-0000gq-Of
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:33:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kn0Wm-0004sR-RX
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:33:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13D4DAEB9;
 Wed,  9 Dec 2020 14:33:10 +0000 (UTC)
Subject: Re: [RFC v9 18/32] cpu: Move synchronize_from_tb() to tcg_ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-19-cfontana@suse.de>
 <d027f556-9588-ece3-8f45-50f1afc2e096@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <37148d19-cf6f-2555-c5d4-b0926c77ac48@suse.de>
Date: Wed, 9 Dec 2020 15:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d027f556-9588-ece3-8f45-50f1afc2e096@redhat.com>
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
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Philippe,

On 12/9/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> On 12/8/20 8:48 PM, Claudio Fontana wrote:
>> From: Eduardo Habkost <ehabkost@redhat.com>
>>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> [claudio: wrapped in CONFIG_TCG]
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
> ...
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>> index 4475ef0996..109291ac52 100644
>> --- a/include/hw/core/tcg-cpu-ops.h
>> +++ b/include/hw/core/tcg-cpu-ops.h
>> @@ -10,9 +10,6 @@
>>  #ifndef TCG_CPU_OPS_H
>>  #define TCG_CPU_OPS_H
> 
> Missing for TranslationBlock:
> 
>   #include "hw/core/cpu.h"


this file though is only included from hw/core/cpu.h itself under CONFIG_TCG..


> 
>>  
>> -/**
>> - * struct TcgCpuOperations: TCG operations specific to a CPU class
>> - */
> 
> Why remove the comment?

a mistake, will fix.

> 
>>  typedef struct TcgCpuOperations {
>>      /**
>>       * @initialize: Initalize TCG state
>> @@ -20,6 +17,17 @@ typedef struct TcgCpuOperations {
>>       * Called when the first CPU is realized.
>>       */
>>      void (*initialize)(void);
>> +    /**
>> +     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
>> +     *
>> +     * This is called when we abandon execution of a TB before
>> +     * starting it, and must set all parts of the CPU state which
>> +     * the previous TB in the chain may not have updated. This
>> +     * will need to do more. If this hook is not implemented then
>> +     * the default is to call
>> +     * @set_pc(tb->pc).
>> +     */
>> +    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
>>  } TcgCpuOperations;
> ...
> 
> 


