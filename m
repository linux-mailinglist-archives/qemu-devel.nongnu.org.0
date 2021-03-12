Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE3333898D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:02:25 +0100 (CET)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeci-00067j-JP
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKeYk-0004Gf-4I
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:58:18 -0500
Received: from mx2.suse.de ([195.135.220.15]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKeYi-0000ig-50
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:58:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6E86AF59;
 Fri, 12 Mar 2021 09:58:10 +0000 (UTC)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
Date: Fri, 12 Mar 2021 10:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 10:45 AM, Philippe Mathieu-Daudé wrote:
> On 3/12/21 10:31 AM, Claudio Fontana wrote:
>> Hello Paolo and all,
>>
>> while debugging a class init ordering issue, I noticed that
>>
>> _all_ class init functions for all types registered in the QEMU QOM are called in select_machine().
>> Expected?
>>
>> In particular it happens here:
>>
>> static MachineClass *select_machine(void)
>> {
>>     GSList *machines = object_class_get_list(TYPE_MACHINE, false);
>>
>>
>> object_class_get_list() ->
>>   object_class_foreach() ->
>>     g_hash_table_foreach() ->
>>       object_class_foreach_tramp ->
>>         type_initialize(type);
>>
>>
>> Is this really desired? It looks suspect to me.
>>
>> (gdb) bt
>> #0  0x0000555555db613f in arm_v7m_class_init (oc=0x555556dca320, data=0x555556a926e0 <arm_tcg_cpus+288>)
>>     at ../target/arm/tcg/tcg-cpu-models.c:849
>> #1  0x0000555555f1deba in type_initialize (ti=0x555556d5b2f0) at ../qom/object.c:364
>> #2  0x0000555555f1f62a in object_class_foreach_tramp (key=0x555556d5b470, value=0x555556d5b2f0, opaque=0x7fffffffda20)
>>     at ../qom/object.c:1069
>> #3  0x00007ffff6562000 in g_hash_table_foreach () at /usr/lib64/libglib-2.0.so.0
>> #4  0x0000555555f1f709 in object_class_foreach (fn=
>>     0x555555f1f866 <object_class_get_list_tramp>, implements_type=0x555556381b09 "machine", include_abstract=false, opaque=0x7fffffffda70)
>>     at ../qom/object.c:1091
>> #5  0x0000555555f1f8e4 in object_class_get_list (implements_type=0x555556381b09 "machine", include_abstract=false) at ../qom/object.c:1148
>> #6  0x0000555555debe94 in select_machine () at ../softmmu/vl.c:1607
>>
>>
>> If not here, where should be the right place, for example, for CPU class inits to be called?
>>
>> At the very least I would put a comment there around the beginning of select_machine() saying:
>>
>> /* all types, all classes in QOM are initialized here, as a result of the object_class_get_list call */
>>
>> Wdyt?
> 
> Are you trying to register types conditionally?
> 

Not really, but I have been using the accel class init function on x86 to register the TCG OPS,

and this instead requires a bit more thought for ARM,

because we currently register for the ARM M Profile the TCG Ops at arm_v7m_class_init time,
which is called already at select_machine() time,

so when we select the accelerator, and we call the tcg_cpu_class_init, we run the risk of overriding the existing tcg_ops,
with the current result that we have to do:

static void tcg_cpu_class_init(CPUClass *cc)
{
    /*                                                                                                                                      
     * do not overwrite the TCG ops, if already set by the                                                                                  
     * arm cpu class (this is the case for the M profile CPUs).                                                                             
     *                                                                                                                                      
     * Otherwise, provide the default ARM TCG behavior here.                                                                                
     */
    if (!cc->tcg_ops) {
        cc->tcg_ops = &arm_tcg_ops;
    }
}

It's a fine result for me, but we do have an "if" inside a class_init.

Ideas? Looks horrible?

THanks,

Claudio

