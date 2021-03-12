Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B287433901C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:35:35 +0100 (CET)
Received: from localhost ([::1]:49388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKit4-0000XY-Ng
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKiL6-0006oK-2y
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:00:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:56684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKiKz-0006gX-MA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:00:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8222B12C;
 Fri, 12 Mar 2021 14:00:18 +0000 (UTC)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
 <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
 <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
 <26c2b88b-4c9e-09a0-a1c0-350a01e9a697@redhat.com>
 <d66078f1-9fa0-c3ed-d54c-3d3ada2027e5@suse.de>
 <683d1ccc-503d-3218-2539-a3ed48fee5fb@redhat.com>
 <8ca3a983-05ad-a0de-31e9-65b6c41a2b4c@suse.de>
Message-ID: <14103764-c4d9-e712-47d0-ff8123eef9d4@suse.de>
Date: Fri, 12 Mar 2021 15:00:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8ca3a983-05ad-a0de-31e9-65b6c41a2b4c@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 2:40 PM, Claudio Fontana wrote:
> On 3/12/21 1:02 PM, Paolo Bonzini wrote:
>> On 12/03/21 12:51, Claudio Fontana wrote:
>>> seems to me we already have, as the accel class init, fe, for x86/tcg:
>>>
>>> static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
>>> {
>>>      AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>>>
>>> #ifndef CONFIG_USER_ONLY
>>>      acc->cpu_realizefn = tcg_cpu_realizefn;
>>> #endif /* CONFIG_USER_ONLY */
>>>
>>>      acc->cpu_class_init = tcg_cpu_class_init;
>>>      acc->cpu_instance_init = tcg_cpu_instance_init;
>>> }
>>>
>>> acc->cpu_class_init() call would then be the acc->init_cpu call you mention.
>>>
>>> The only thing we seem to be missing is the cc->init_tcg_ops(cc)..
>>
>> Yes, called by tcg_cpu_class_init or tcg_cpu_instance_init.
>>
>> Paolo
>>
>>
> 
> .. I wonder if we should make it a bit more general like:
> 
> static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
> {
>     CPUClass *cc = CPU_CLASS(klass);
>     AccelCPUClass *accel_cpu = opaque;
> 
>     /*                                                                                                                                      
>      * double dispatch. The first callback allows the accel cpu                                                                             
>      * to run initializations for the CPU,                                                                                                  
>      * the second one allows the CPU to customize the accel cpu                                                                             
>      * behavior according to the CPU.                                                                                                       
>      *                                                                                                                                      
>      * The second is currently only used by TCG, to specialize the                                                                          
>      * TCGCPUOps depending on the CPU type.                                                                                                 
>      */
>     cc->accel_cpu = accel_cpu;
>     if (accel_cpu->cpu_class_init) {
>         accel_cpu->cpu_class_init(cc);
>     }
>     if (cc->init_accel_cpu) {
>         cc->init_accel_cpu(accel_cpu, cc);
>     }
> }
> 
> .. but maybe this is premature, and should wait for actual users of this beyond TCG on ARM?
> 
> Ciao,
> 
> C
> 

I'll put my experiment in the ARM cleanup series.

Ciao and thanks,

Claudio


