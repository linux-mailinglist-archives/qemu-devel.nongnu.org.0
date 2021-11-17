Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CAE453DD9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 02:46:50 +0100 (CET)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnA2C-0007Aa-N9
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 20:46:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mn9zI-0006Ai-RW; Tue, 16 Nov 2021 20:43:48 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:3202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mn9zF-0006f5-29; Tue, 16 Nov 2021 20:43:48 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Hv5JM26V3z8vRJ;
 Wed, 17 Nov 2021 09:41:55 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 09:43:38 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 09:43:37 +0800
Message-ID: <ef504fe3-fdf7-117d-d163-8183dc52e7e9@huawei.com>
Date: Wed, 17 Nov 2021 09:43:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] vfio: Fix memory leak of hostwin
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <20211116115626.1627186-1-liangpeng10@huawei.com>
 <20211116120155.109cfd0d.alex.williamson@redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
In-Reply-To: <20211116120155.109cfd0d.alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 kwepemm600002.china.huawei.com (7.193.23.29)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=liangpeng10@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhengchuan@huawei.com, wanghao232@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/2021 3:01 AM, Alex Williamson wrote:
> On Tue, 16 Nov 2021 19:56:26 +0800
> Peng Liang <liangpeng10@huawei.com> wrote:
> 
>> hostwin is allocated and added to hostwin_list in vfio_host_win_add, but
>> it is only deleted from hostwin_list in vfio_host_win_del, which causes
>> a memory leak.  Also, freeing all elements in hostwin_list is missing in
>> vfio_disconnect_container.
>>
>> Fix: 2e4109de8e58 ("vfio/spapr: Create DMA window dynamically (SPAPR IOMMU v2)")
>> CC: qemu-stable@nongnu.org
>> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
>> ---
>>  hw/vfio/common.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index dd387b0d3959..2cce60c5fac3 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -546,11 +546,12 @@ static void vfio_host_win_add(VFIOContainer *container,
>>  static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
>>                               hwaddr max_iova)
>>  {
>> -    VFIOHostDMAWindow *hostwin;
>> +    VFIOHostDMAWindow *hostwin, *next;
>>  
>> -    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
>> +    QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next, next) {
> 
> Unnecessary conversion to _SAFE variant here, we don't continue to walk
> the list after removing an object.

Ok, I'll remove it in the next version.


Thanks,
Peng

> 
>>          if (hostwin->min_iova == min_iova && hostwin->max_iova == max_iova) {
>>              QLIST_REMOVE(hostwin, hostwin_next);
>> +            g_free(hostwin);
>>              return 0;
>>          }
>>      }
>> @@ -2239,6 +2240,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>>      if (QLIST_EMPTY(&container->group_list)) {
>>          VFIOAddressSpace *space = container->space;
>>          VFIOGuestIOMMU *giommu, *tmp;
>> +        VFIOHostDMAWindow *hostwin, *next;
>>  
>>          QLIST_REMOVE(container, next);
>>  
>> @@ -2249,6 +2251,12 @@ static void vfio_disconnect_container(VFIOGroup *group)
>>              g_free(giommu);
>>          }
>>  
>> +        QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
>> +                           next) {
>> +            QLIST_REMOVE(hostwin, hostwin_next);
>> +            g_free(hostwin);
>> +        }
>> +
> 
> This usage looks good.  Thanks,
> 
> Alex
> 
>>          trace_vfio_disconnect_container(container->fd);
>>          close(container->fd);
>>          g_free(container);
> 
> .
> 


