Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E5943DA61
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:28:33 +0200 (CEST)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfx1k-00023n-50
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mfx01-0001LJ-9l
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:26:45 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:55876
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mfwzy-0005LG-1j
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:26:45 -0400
HMM_SOURCE_IP: 172.18.0.188:53394.2135161757
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 00C9C28008F;
 Thu, 28 Oct 2021 12:26:25 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 1ea4455d03b043b08c263108b2fd0d87 for
 xiexiangyou@huawei.com; Thu, 28 Oct 2021 12:26:32 CST
X-Transaction-ID: 1ea4455d03b043b08c263108b2fd0d87
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
Subject: Re: [PATCH v12 0/6] support dirtyrate at the granualrity of vcpu
To: Zheng Chuan <zhengchuan@huawei.com>, Peter Xu <peterx@redhat.com>
References: <cover.1624982116.git.huangy81@chinatelecom.cn>
 <YWjaQ80LZGvPPoeX@t490s>
 <78929c64-ca4d-6c6a-f371-99cd508e958a@chinatelecom.cn>
 <c5c179f1-6b3c-0aa5-7f69-f8d7ad554373@huawei.com>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <90a0b1ed-5742-ae91-47a9-4115cfb79af5@chinatelecom.cn>
Date: Thu, 28 Oct 2021 12:26:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c5c179f1-6b3c-0aa5-7f69-f8d7ad554373@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.847,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Xiexiangyou <xiexiangyou@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/10/27 14:31, Zheng Chuan 写道:
> Hi.
> I have no objection for the implement code itself.
> But we should know or let the user know the performance penalty and conflicted with migration compared to the hash method, especially for the performance of vm with hugepages.

i dirty guest memory with 1G and do the measurement with two method.

the copy rate is almost 1,665 MB/s in vm

the following output is guest memory performance when do measurement 
with dirty ring method:
/init (00001): INFO: 1635392998977ms copied 1 GB in 00616ms
/init (00001): INFO: 1635392999593ms copied 1 GB in 00615ms
/init (00001): INFO: 1635393000211ms copied 1 GB in 00616ms
----------------- start measurement -----------------------
/init (00001): INFO: 1635393000884ms copied 1 GB in 00672ms		
/init (00001): INFO: 1635393001849ms copied 1 GB in 00963ms	
/init (00001): INFO: 1635393002578ms copied 1 GB in 00727ms
----------------- end measurement -----------------------
/init (00001): INFO: 1635393003195ms copied 1 GB in 00615ms
/init (00001): INFO: 1635393003811ms copied 1 GB in 00614ms
/init (00001): INFO: 1635393004427ms copied 1 GB in 00615ms

guest memory performance do not trigger any changes almostly with hash 
method:

the following is test results (measurment interval=1s):

method		measurement result  	copy rate during measurement
hash		44 MB/s			1,665MB/s	
dirty ring   	1167 MB/s		1,523MB/s、1,063MB/s、1,408MB/s

the max penalty is 36% during test interval(1s), the average penalty is 
20%。

if we trade off accurance, the dirty ring method may be a availiabe 
method for user. users can select a appropriate method as they need.

> 
> On 2021/10/15 10:07, Hyman Huang wrote:
>>
>>
>> 在 2021/10/15 9:32, Peter Xu 写道:
>>> On Wed, Jun 30, 2021 at 12:01:17AM +0800, huangy81@chinatelecom.cn wrote:
>>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>>
>>>> v12
>>>> - adjust the order of calculating dirty rate
>>>>     let memory_global_dirty_log_sync before calculating as
>>>>     v11 version description.
>>>
>>> Ping for Yong. >
>>> Dave/Juan, any plan to review/merge this series (along with the other series of
>>> dirty logging)?
>>>
>>> I found it useful when I wanted to modify the program I used to generate
>>> constant dirty workload - this series can help me to verify the change.
>>>
>>> I still keep thinking this series is something good to have.  Thanks,
>> the dirtyrate calculation has already been used to estimate time of live migration in "e cloud" production of chinatelecom, it also predict the migration success ratio, which provide valuable information for the cloud management plane when selecting which vm should be migrated.
>>>
>>
> 

-- 
Best regard

Hyman Huang(黄勇)

