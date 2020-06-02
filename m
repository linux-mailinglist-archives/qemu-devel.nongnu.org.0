Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC41EB6BD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 09:48:58 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg1fN-0002pM-TP
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 03:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jg1eB-0001z7-57; Tue, 02 Jun 2020 03:47:43 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52284 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jg1eA-0001JW-10; Tue, 02 Jun 2020 03:47:42 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DF705F478B39B70012CC;
 Tue,  2 Jun 2020 15:47:36 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.233) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 2 Jun 2020 15:47:29 +0800
Subject: Re: About the kvm-no-adjvtime CPU property
To: Andrew Jones <drjones@redhat.com>
References: <b4389848-10fd-a906-9901-d1d354ce4842@huawei.com>
 <20200601080718.jul5r4qebpeieyfl@kamzik.brq.redhat.com>
 <3d8729db-067c-31f9-dd69-02a218f1b53e@huawei.com>
 <20200601122917.fyp2kwqzsodahnzu@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <f994141f-0248-fd68-7cd5-9b948cfdbf8d@huawei.com>
Date: Tue, 2 Jun 2020 15:47:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200601122917.fyp2kwqzsodahnzu@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.222.233]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 03:47:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/6/1 20:29, Andrew Jones wrote:
> On Mon, Jun 01, 2020 at 08:07:31PM +0800, Ying Fang wrote:
>>
>>
>> On 2020/6/1 16:07, Andrew Jones wrote:
>>> On Sat, May 30, 2020 at 04:56:26PM +0800, Ying Fang wrote:
>>>> About the kvm-no-adjvtime CPU property
>>>>
>>>> Hi Andrew,
>>>> To adjust virutal time, a new kvm cpu property kvm-no-adjvtime
>>>> was introduced to 5.0 virt machine types. However the cpu
>>>> property was enabled only for host-passthrough and max cpu model.
>>>> As for other cpu model like cortex-a57, cortex-a53, cortex-a72,
>>>> this kvm-adjvtime is not enabled by default, which means the
>>>> virutal time can not be adjust for them.
>>>>
>>>> Here, for example, if VM is configured with kvm enabled:
>>>>
>>>>     <cpu mode='custom' match='exact' check='partial'>
>>>>       <model fallback='allow'>cortex-a72</model>
>>>>       <topology sockets='2' dies='1' cores='2' threads='1'/>
>>>>       <numa>
>>>>         <cell id='0' cpus='0-1' memory='16777216' unit='KiB'/>
>>>>         <cell id='1' cpus='2-3' memory='16777216' unit='KiB'/>
>>>>       </numa>
>>>>     </cpu>
>>>>
>>>> We cannot adjust virtual time even if 5.0 virt machine is used.
>>>> So i'd like to add it to other cpu model, do you have any
>>>> suggestions here ?
>>>>
>>>>
>>>
>>> Hi Fang,
>>>
>>> The cpu feature only requires kvm.  If a cpu model may be used with kvm,
>>> then the feature can be allowed to be used with the model.  What I find
>>> interesting is that the cpu model is being used with kvm instead of 'host'
>>> or 'max'.  Can you explain the reasons for that?  Currently, when using
>> yes，the cpu model is indeed used with kvm.
>>
>> There is a situation where the host cpu model is Cortex-A72 and
>> a 'custom' cpu mode is used to keep insrtuction set compatible between
>> the source and destination host machine when doing live migration.
>> So the host physical machine cpu model is Cortex-A72 but
>> host-passthrough model is mode used here.
I mean host-passthrough model is 'not' used here. Sorry to make it 
confusing.
> 
> Are the source and destinations hosts used in the migration identical?
> If so, then the guest can use cpu 'host' and disable cpu features that
> should not be exposed (e.g. -cpu host,pmu=off).  If the source and
> destination hosts are not identical, then I'm curious what those exact
> differences are.  With the way AArch64 KVM works today, even using the
> Cortex-A72 cpu model should require identical hosts when migrating.  Or,
> at least both hosts must be compatible with Cortex-A72 and any difference
> in ID registers must be somehow getting hidden from the guest.
Yes, you are right.
We have AAarch64 server with cpu based on Cortex-A72 and some extra 
instruction set added. Source host with cpu based on V1 and destination 
host with cpu based on V2 and they are compatible with Cortex-A72. We 
want to use a 'custom' cpu mode here to make it possible to do live 
migration between them. This is the scenario where the 'host' cpu model 
is not used since a 'custom' cpu model Cortex-A72 is used here . However 
the kvm-adjvtime feature is also need. So I think we should move 
kvm_arm_add_vcpu_properties to arm_cpu_post_init, instead of limited to 
'host' and 'max' cpu model[1].

1: https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00091.html
> 
> Thanks,
> drew
> 
> 
> 


