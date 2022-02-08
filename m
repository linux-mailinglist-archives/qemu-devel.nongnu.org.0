Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644E4AD565
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:17:14 +0100 (CET)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNYf-00012J-2t
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:17:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nHLnL-0008L9-By
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:24:16 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:57491
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nHLnI-0002K1-Cc
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:24:14 -0500
HMM_SOURCE_IP: 172.18.0.218:59218.1330262312
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 69FFA2800A5;
 Tue,  8 Feb 2022 16:23:34 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 18959c05d8164865a0323d9c417b5ebc for
 peterx@redhat.com; Tue, 08 Feb 2022 16:23:46 CST
X-Transaction-ID: 18959c05d8164865a0323d9c417b5ebc
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <02e4c99b-65d1-3f26-108b-ac5f295c1ae1@chinatelecom.cn>
Date: Tue, 8 Feb 2022 16:23:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 1/5] accel/kvm/kvm-all: refactor per-vcpu dirty ring
 reaping
To: Peter Xu <peterx@redhat.com>
References: <cover.1643026714.git.huangy81@chinatelecom.cn>
 <b5b435c3e2baa417879c9475ad5f3e6a01f89126.1643026714.git.huangy81@chinatelecom.cn>
 <YgIZpjogm7BuYNrQ@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YgIZpjogm7BuYNrQ@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/2/8 15:20, Peter Xu 写道:
> On Mon, Jan 24, 2022 at 10:10:36PM +0800, huangy81@chinatelecom.cn wrote:
>> @@ -2956,7 +2959,7 @@ int kvm_cpu_exec(CPUState *cpu)
>>                */
>>               trace_kvm_dirty_ring_full(cpu->cpu_index);
>>               qemu_mutex_lock_iothread();
>> -            kvm_dirty_ring_reap(kvm_state);
>> +            kvm_dirty_ring_reap(kvm_state, cpu);
> 
> Shall we keep passing in NULL in this patch, and make it conditionally taking
> cpu parameter if dirty limit enabled?
> 
Ok，so we should pass the cpu parameter only if dirtylimit in service.
> Ring reset can still be expensive, so ideally we can still try the best to reap
> as much PFNs as possible, as long as we still don't need accuracy on RING_FULL
> exit events.
> 
>>               qemu_mutex_unlock_iothread();
>>               ret = 0;
>>               break;
>> -- 
>> 1.8.3.1
>>
> 

-- 
Best regard

Hyman Huang(黄勇)

