Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7532F902
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 09:48:07 +0100 (CET)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lISbW-0003B3-9y
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 03:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZ3-0001KO-WE
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:34 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lISZ0-0003CW-2j
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 03:45:33 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsymR58zWzMYBj;
 Sat,  6 Mar 2021 16:43:03 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 6 Mar 2021 16:45:06 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 05/18] migration/rdma: do not need sync main for rdma
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-6-git-send-email-zhengchuan@huawei.com>
 <20210203181015.GP2950@work-vm>
Message-ID: <da67c5b2-6175-922c-a914-5ab2935bf3df@huawei.com>
Date: Sat, 6 Mar 2021 16:45:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203181015.GP2950@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/2/4 2:10, Dr. David Alan Gilbert wrote:
> This patch needs to explain why the sync isn't needed for RDMA.
> 
> Dave
> 
OK. the multifd with tcp will send pages if it has pages to send by the record of multifd_send_state->pages->used while
RDMA is using rdma_write_hooks.

> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/multifd.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 4820702..5d34950 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -583,6 +583,10 @@ void multifd_send_sync_main(QEMUFile *f)
>>      if (!migrate_use_multifd()) {
>>          return;
>>      }
>> +     /* Do not need sync for rdma */
>> +    if (migrate_use_rdma()) {
>> +        return;
>> +    }
>>      if (multifd_send_state->pages->used) {
>>          if (multifd_send_pages(f) < 0) {
>>              error_report("%s: multifd_send_pages fail", __func__);
>> @@ -1024,6 +1028,10 @@ void multifd_recv_sync_main(void)
>>      if (!migrate_use_multifd()) {
>>          return;
>>      }
>> +    /* Do not need sync for rdma */
>> +    if (migrate_use_rdma()) {
>> +        return;
>> +    }
>>      for (i = 0; i < migrate_multifd_channels(); i++) {
>>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>>  
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

