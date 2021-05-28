Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CE393B47
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:06:11 +0200 (CEST)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmRt4-0000P9-GX
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lmRrw-0007VY-3n; Thu, 27 May 2021 22:05:00 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lmRrr-0006hR-BA; Thu, 27 May 2021 22:04:59 -0400
Received: from dggeml704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FrnvH2SB0zWnmb;
 Fri, 28 May 2021 10:00:11 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml704-chm.china.huawei.com (10.3.17.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 10:04:47 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 10:04:46 +0800
Subject: Re: [PATCH] vfio: Fix unregister SaveVMHandler in
 vfio_migration_finalize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210527123101.289-1-jiangkunkun@huawei.com>
 <fcfa0ad2-4819-8ea3-b69c-01b4d1e97269@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <c9c94ef3-cbb6-3b0c-f67f-94f3d5422910@huawei.com>
Date: Fri, 28 May 2021 10:04:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fcfa0ad2-4819-8ea3-b69c-01b4d1e97269@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-stable@nongnu.org,
 ganqixin@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 2021/5/27 21:44, Philippe Mathieu-Daudé wrote:
> On 5/27/21 2:31 PM, Kunkun Jiang wrote:
>> In the vfio_migration_init(), the SaveVMHandler is registered for
>> VFIO device. But it lacks the operation of 'unregister'. It will
>> lead to 'Segmentation fault (core dumped)' in
>> qemu_savevm_state_setup(), if performing live migration after a
>> VFIO device is hot deleted.
>>
>> Fixes: 7c2f5f75f94 (vfio: Register SaveVMHandlers for VFIO device)
>> Reported-by: Qixin Gan <ganqixin@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> Cc: qemu-stable@nongnu.org
>
>> ---
>>   hw/vfio/migration.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 201642d75e..ef397ebe6c 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -892,6 +892,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>>   
>>           remove_migration_state_change_notifier(&migration->migration_state);
>>           qemu_del_vm_change_state_handler(migration->vm_state);
>> +        unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
> Hmm what about devices using "%s/vfio" id?
The unregister_savevm() needs 'VMSTATEIf *obj'. If we pass a non-null 'obj'
to unregister_svevm(), it will handle the devices using "%s/vfio" id with
the following code:
>     if (obj) {
>         char *oid = vmstate_if_get_id(obj);
>         if (oid) {
>             pstrcpy(id, sizeof(id), oid);
>             pstrcat(id, sizeof(id), "/");
>             g_free(oid);
>         }
>     }
>     pstrcat(id, sizeof(id), idstr);

By the way, I'm puzzled that register_savevm_live() and unregister_savevm()
handle devices using "%s/vfio" id differently. So I learned the commit
history of register_savevm_live() and unregister_savevm().

In the beginning, both them need 'DeviceState *dev', which are replaced
with VMStateIf in 3cad405babb. Later in ce62df5378b, the 'dev' was removed,
because no caller of register_savevm_live() need to pass a non-null 'dev'
at that time.

So now the vfio devices need to handle the 'id' first and then call
register_savevm_live(). I am wondering whether we need to add
'VMSTATEIf *obj' in register_savevm_live(). What do you think of this?

Thanks,
Kunkun Jiang
>
>>           vfio_migration_exit(vbasedev);
>>       }
>>   
>>
> .



