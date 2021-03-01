Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293CA327E5A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:30:04 +0100 (CET)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhgZ-0000t1-4p
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhdW-0004oo-3W
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:54 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhdU-0001r6-01
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:53 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DpzxL6gqqzjSsj;
 Mon,  1 Mar 2021 20:25:26 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 20:26:39 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 07/18] migration/rdma: add rdma field into multifd
 send/recv param
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-8-git-send-email-zhengchuan@huawei.com>
 <20210203183234.GR2950@work-vm>
Message-ID: <c5441c2a-54a8-ddd6-f55a-22dc31ae1537@huawei.com>
Date: Mon, 1 Mar 2021 20:26:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203183234.GR2950@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=szxga06-in.huawei.com
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/2/4 2:32, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Note we do want to export any rdma struct, take void * instead.
> 
> You don't need to make this a void *; add a typedef struct RDMAContext
> into include/qemu/typedefs.h  and then you can use the right type here
> without actually exporting the interesting contents of the type or
> being dependent on rdma being built.
> 
> Dave
>

OK, good to know it, will do it in v5.

>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/multifd.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index d57756c..b17a2c1 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -108,6 +108,10 @@ typedef struct {
>>      QemuSemaphore sem_sync;
>>      /* used for compression methods */
>>      void *data;
>> +    /* used for multifd rdma */
>> +    void *rdma;
>> +    /* communication channel */
>> +    QEMUFile *file;
>>  }  MultiFDSendParams;
>>  
>>  typedef struct {
>> @@ -147,6 +151,10 @@ typedef struct {
>>      QemuSemaphore sem_sync;
>>      /* used for de-compression methods */
>>      void *data;
>> +    /* used for multifd rdma */
>> +    void *rdma;
>> +    /* communication channel */
>> +    QEMUFile *file;
>>  } MultiFDRecvParams;
>>  
>>  typedef struct {
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

