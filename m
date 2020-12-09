Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C332D4098
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:03:21 +0100 (CET)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxFg-0000Ai-B6
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmxEV-0008AQ-Bc
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:02:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:58764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmxER-0007L1-7w
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:02:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 607D9AD0E;
 Wed,  9 Dec 2020 11:02:01 +0000 (UTC)
Subject: Re: [RFC v9 19/32] cpu: Move cpu_exec_* to tcg_ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-20-cfontana@suse.de>
 <e6a0a0b9-da4e-60fa-050b-62ee7da9628f@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2c22aee3-e056-6e6d-551c-3309aec0dded@suse.de>
Date: Wed, 9 Dec 2020 12:02:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e6a0a0b9-da4e-60fa-050b-62ee7da9628f@redhat.com>
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
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 10:28 AM, Philippe Mathieu-Daudé wrote:
> On 12/8/20 8:48 PM, Claudio Fontana wrote:
>> From: Eduardo Habkost <ehabkost@redhat.com>
>>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> [claudio: wrapped in CONFIG_TCG]
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
> ...
> 
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>> index 109291ac52..e12f32919b 100644
>> --- a/include/hw/core/tcg-cpu-ops.h
>> +++ b/include/hw/core/tcg-cpu-ops.h
>> @@ -10,6 +10,9 @@
>>  #ifndef TCG_CPU_OPS_H
>>  #define TCG_CPU_OPS_H
>>  
>> +/**
>> + * struct TcgCpuOperations: TCG operations specific to a CPU class
>> + */
> 
> Oh, added back ;)


Fixed this "back and forth", thanks!

Claudio


> 
>>  typedef struct TcgCpuOperations {
>>      /**
>>       * @initialize: Initalize TCG state
>> @@ -28,6 +31,12 @@ typedef struct TcgCpuOperations {
>>       * @set_pc(tb->pc).
>>       */
>>      void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
>> +    /** @cpu_exec_enter: Callback for cpu_exec preparation */
>> +    void (*cpu_exec_enter)(CPUState *cpu);
>> +    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
>> +    void (*cpu_exec_exit)(CPUState *cpu);
>> +    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
>> +    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
>>  } TcgCpuOperations;
> 


