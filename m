Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F23469CCB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 16:23:50 +0100 (CET)
Received: from localhost ([::1]:33828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muFqH-0006j0-CV
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 10:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1muFor-0005Tl-6X
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:22:21 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:58829
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1muFoo-0007AW-Ki
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:22:20 -0500
HMM_SOURCE_IP: 172.18.0.218:32968.1289552328
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.245 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 3B3272800FA;
 Mon,  6 Dec 2021 23:22:06 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 9e2399791d1a440c9cdeb0e52329a246 for
 peterx@redhat.com; Mon, 06 Dec 2021 23:22:13 CST
X-Transaction-ID: 9e2399791d1a440c9cdeb0e52329a246
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <259c7876-c938-bcb5-3eeb-18cd78d33665@chinatelecom.cn>
Date: Mon, 6 Dec 2021 23:22:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
To: Peter Xu <peterx@redhat.com>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 <Ya3MROP77Uibicmn@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Ya3MROP77Uibicmn@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.076,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/6 16:39, Peter Xu 写道:
> On Fri, Dec 03, 2021 at 09:39:47AM +0800, huangy81@chinatelecom.cn wrote:
>> +void dirtylimit_setup(int max_cpus)
>> +{
>> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>> +        return;
>> +    }
>> +
>> +    dirtylimit_calc_state_init(max_cpus);
>> +    dirtylimit_state_init(max_cpus);
>> +}
> 
> [...]
> 
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 620a1f1..0f83ce3 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3777,5 +3777,6 @@ void qemu_init(int argc, char **argv, char **envp)
>>       qemu_init_displays();
>>       accel_setup_post(current_machine);
>>       os_setup_post();
>> +    dirtylimit_setup(current_machine->smp.max_cpus);
>>       resume_mux_open();
> 
> Can we do the init only when someone enables it?  We could also do proper
> free() for the structs when it's globally turned off.
Yes, i'll try this next version
> 

