Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DCB376319
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 11:49:42 +0200 (CEST)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lex77-0008DD-5R
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 05:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lex4i-00076f-0K
 for qemu-devel@nongnu.org; Fri, 07 May 2021 05:47:12 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lex4a-0008VK-Qc
 for qemu-devel@nongnu.org; Fri, 07 May 2021 05:47:11 -0400
Received: from dggeml757-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fc58n3JNZzWgPn;
 Fri,  7 May 2021 17:42:49 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml757-chm.china.huawei.com (10.1.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 7 May 2021 17:46:58 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 7 May 2021 17:46:56 +0800
Subject: Re: [question] The source cannot recover, if the destination fails in
 the last round of live migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <7d87a3b7-86c9-9248-59dc-e1612a00e7c3@huawei.com>
 <YJPpr0z+sV3lQMxZ@work-vm>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <dd990878-fb0f-5bfc-f390-d6807b158372@huawei.com>
Date: Fri, 7 May 2021 17:46:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJPpr0z+sV3lQMxZ@work-vm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dave,

On 2021/5/6 21:05, Dr. David Alan Gilbert wrote:
> * Kunkun Jiang (jiangkunkun@huawei.com) wrote:
>> Hi all,
> Hi,
>
>> Recently I am learning about the part of live migration.
>> I have a question about the last round.
>>
>> When the pending_size is less than the threshold, it will enter
>> the last round and call migration_completion(). It will stop the
>> source and sent the remaining dirty pages and devices' status
>> information to the destination. The destination will load these
>> information and start the VM.
>>
>> If there is an error at the destination at this time, it will exit
>> directly, and the source will not be able to detect the error
>> and recover. Because the source will not call
>> migration_detect_error().
>>
>> Is my understanding correct?
>> Should the source wait the result of the last round of destination ?
> Try setting the 'return-path' migration capability on both the source
> and destination;  I think it's that option will cause the destination to
> send an OK/error at the end and the source to wait for it.
Thank you for your reply!
The 'return-path' migration capability solved my question. 😁

But why not set it as the default? In my opinion, it is a basic ability
of live migration. We need it to judge whether the last round of the
destination is successful in the way of 'precopy'.

Looking forward to your reply.

Thanks,
Kunkun Jiang
> Dave
>
>> Thanks,
>> Kunkun Jiang
>>
>>


