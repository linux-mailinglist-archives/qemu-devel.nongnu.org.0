Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32881338BF2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:55:03 +0100 (CET)
Received: from localhost ([::1]:60250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKgNi-0003Lb-8V
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKgKe-0001LP-6N
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:51:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:53592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKgKV-0004oz-Tw
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:51:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 96D58B02F;
 Fri, 12 Mar 2021 11:51:40 +0000 (UTC)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
 <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
 <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
 <26c2b88b-4c9e-09a0-a1c0-350a01e9a697@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d66078f1-9fa0-c3ed-d54c-3d3ada2027e5@suse.de>
Date: Fri, 12 Mar 2021 12:51:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <26c2b88b-4c9e-09a0-a1c0-350a01e9a697@redhat.com>
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

On 3/12/21 11:39 AM, Paolo Bonzini wrote:
> On 12/03/21 11:25, Claudio Fontana wrote:
>> We can register them from there if needed I think,, but where ever we
>> do it, we still have to point to the one set of ops or the other,
>> depending on the cpu model that is finally chosen.
>>
>> So when we attach the tcg cpu accelerator object to the cpu, we
>> currently should check which cpu it is, and behave accordingly.
>>
>> Maybe this is better? Ie, not set the tcg ops in different places (in
>> the v7m cpu class init and in the tcg cpu accel init),
>>
>> but rather set them just in a single place, when we attach the accel
>> cpu object, checking which cpu profile it is somehow (TBD), and then
>> behave accordingly?
> 
> Take a look at 
> https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence#Basic_phases. 
>   The phases are:
> 
> - creating backends (PHASE_NO_MACHINE)
> 
> - creating machine (after which PHASE_MACHINE_CREATED is entered)
> 
> - creating accelerator (after which PHASE_ACCEL_CREATED is entered)
> 
> - initializing embedded devices (in machine_run_board_init, after which 
> PHASE_MACHINE_INITIALIZED is entered), including CPUs
> 
> - creating devices (in qmp_x_exit_preconfig, after which 
> PHASE_MACHINE_READY is entered)
> 
> And the last is where the guest actually starts.
> 
> I think that you should have a callback in the accelerator that runs 
> after -cpu is processed and before PHASE_MACHINE_INITIALIZED is entered. 
>   So the right place to add it would be machine_run_board_init.
> 
> Maybe some kind of double dispatch, where the accelerator has an 
> acc->init_cpu(acc, cc) method and the CPU has a cc->init_tcg_ops(cc) 
> method.  Then TCG's init_cpu calls into the latter.
> 
> Paolo
> 
> 

Thanks, digesting this.

What you describe as:

acc->init_cpu(acc, cc)

seems to me we already have, as the accel class init, fe, for x86/tcg:

static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
{
    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);

#ifndef CONFIG_USER_ONLY
    acc->cpu_realizefn = tcg_cpu_realizefn;
#endif /* CONFIG_USER_ONLY */

    acc->cpu_class_init = tcg_cpu_class_init;
    acc->cpu_instance_init = tcg_cpu_instance_init;
}

acc->cpu_class_init() call would then be the acc->init_cpu call you mention.

The only thing we seem to be missing is the cc->init_tcg_ops(cc)..

Ciao,

Claudio









