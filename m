Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3346397DAD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 02:29:41 +0200 (CEST)
Received: from localhost ([::1]:59820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loElQ-0002dV-6m
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 20:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1loEjP-0001Ef-Au
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 20:27:35 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:60626
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1loEjM-0005pq-Tj
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 20:27:34 -0400
HMM_SOURCE_IP: 172.18.0.48:35850.1746061569
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-110.184.66.8?logid-6a2457510f35480f852050c9164a9a69
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id B234D28009A;
 Wed,  2 Jun 2021 08:27:23 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 6a2457510f35480f852050c9164a9a69 for
 dgilbert@redhat.com; Wed Jun  2 08:27:24 2021
X-Transaction-ID: 6a2457510f35480f852050c9164a9a69
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v1 2/6] KVM: introduce dirty_pages into CPUState
To: Peter Xu <peterx@redhat.com>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
 <78cc154863754a93d88070d1fae9fed6a1ec5f01.1622479161.git.huangy81@chinatelecom.cn>
 <YLbAoEWOE+no+a7H@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <2749938b-f775-ec5a-6ac5-d59cde656999@chinatelecom.cn>
Date: Wed, 2 Jun 2021 08:27:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YLbAoEWOE+no+a7H@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.613,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/2 7:20, Peter Xu 写道:
> On Tue, Jun 01, 2021 at 01:04:06AM +0800, huangy81@chinatelecom.cn wrote:
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 044f668a6e..973c193501 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -375,6 +375,8 @@ struct CPUState {
>>       struct kvm_run *kvm_run;
>>       struct kvm_dirty_gfn *kvm_dirty_gfns;
>>       uint32_t kvm_fetch_index;
>> +    uint64_t dirty_pages;
>> +    bool stat_dirty_pages;
> 
> Shall we make this bool a global one?  As I don't think we'll be able to only
> enable it on a subset of cpus?
Yes, it's a reasonable advice, i'll apply this on the next version
> 

-- 
Best regard

Hyman Huang(黄勇)

