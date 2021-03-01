Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F1327E55
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:29:38 +0100 (CET)
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhg9-0000WZ-AR
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhdb-0004vl-54
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhdX-0001u6-JW
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:58 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DpzwZ5qtKzlR1b;
 Mon,  1 Mar 2021 20:24:46 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 20:26:45 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 08/18] migration/rdma: export getQIOChannel to get
 QIOchannel in rdma
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-9-git-send-email-zhengchuan@huawei.com>
 <20210203184933.GS2950@work-vm>
Message-ID: <3010309f-be48-ca1d-e50d-83f3f42cb7d6@huawei.com>
Date: Mon, 1 Mar 2021 20:26:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203184933.GS2950@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
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



On 2021/2/4 2:49, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
>> ---
>>  migration/qemu-file.c | 5 +++++
>>  migration/qemu-file.h | 1 +
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>> index be21518..37f6201 100644
>> --- a/migration/qemu-file.c
>> +++ b/migration/qemu-file.c
>> @@ -260,6 +260,11 @@ void ram_control_before_iterate(QEMUFile *f, uint64_t flags)
>>      }
>>  }
>>  
>> +void *getQIOChannel(QEMUFile *f)
>> +{
>> +    return f->opaque;
>> +}
>> +
> 
> Unfortunately that's not right, since the opaque isn't always a
> QUIChannel, so getOpaque would be a suitable name here.
> 
> It's a shame this is needed; I'm surprised you ever have a QEMUFIle* in
> the rdma code in somewhere you don't have the QIOChannel; could you
> avoid this by adding a QIOChannel pointer into the RDAMContext to point
> back to the channel which it's for?
> 
> Dave
> 
OK, i'll try it.
>>  void ram_control_after_iterate(QEMUFile *f, uint64_t flags)
>>  {
>>      int ret = 0;
>> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
>> index a9b6d6c..4cef043 100644
>> --- a/migration/qemu-file.h
>> +++ b/migration/qemu-file.h
>> @@ -165,6 +165,7 @@ void qemu_file_set_blocking(QEMUFile *f, bool block);
>>  void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>>  void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
>>  void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
>> +void *getQIOChannel(QEMUFile *f);
>>  
>>  /* Whenever this is found in the data stream, the flags
>>   * will be passed to ram_control_load_hook in the incoming-migration
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

