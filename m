Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E259E3A7D71
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:44:40 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7Ul-0007MU-Fr
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lt7Ta-0006TT-Tm; Tue, 15 Jun 2021 07:43:27 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lt7TY-00059w-3L; Tue, 15 Jun 2021 07:43:26 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G45wH6RXqzZg1m;
 Tue, 15 Jun 2021 19:40:15 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 19:43:10 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 15 Jun 2021 19:43:10 +0800
Subject: Re: [PATCH] vfio: Fix unregister SaveVMHandler in
 vfio_migration_finalize
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210527123101.289-1-jiangkunkun@huawei.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <acc05cde-9305-6cf7-991f-78824a4817d6@huawei.com>
Date: Tue, 15 Jun 2021 19:42:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527123101.289-1-jiangkunkun@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-stable@nongnu.org,
 ganqixin@huawei.com, Zenghui
 Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping,

Hi everyone,

Will this patch be picked up soon, or is there any other work for me to do?

Best Regards,
Kunkun Jiang

On 2021/5/27 20:31, Kunkun Jiang wrote:
> In the vfio_migration_init(), the SaveVMHandler is registered for
> VFIO device. But it lacks the operation of 'unregister'. It will
> lead to 'Segmentation fault (core dumped)' in
> qemu_savevm_state_setup(), if performing live migration after a
> VFIO device is hot deleted.
>
> Fixes: 7c2f5f75f94 (vfio: Register SaveVMHandlers for VFIO device)
> Reported-by: Qixin Gan <ganqixin@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>   hw/vfio/migration.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 201642d75e..ef397ebe6c 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -892,6 +892,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>   
>           remove_migration_state_change_notifier(&migration->migration_state);
>           qemu_del_vm_change_state_handler(migration->vm_state);
> +        unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>           vfio_migration_exit(vbasedev);
>       }
>   



