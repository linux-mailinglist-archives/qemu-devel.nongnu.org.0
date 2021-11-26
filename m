Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7945E92B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 09:20:16 +0100 (CET)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqWSs-0004H7-U7
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 03:20:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mqWRU-0002ur-3B; Fri, 26 Nov 2021 03:18:48 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mqWRO-0003wo-I7; Fri, 26 Nov 2021 03:18:47 -0500
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J0ncn6cw0z1DJZ6;
 Fri, 26 Nov 2021 16:15:53 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 26 Nov 2021 16:18:28 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Fri, 26 Nov 2021 16:18:27 +0800
Message-ID: <77d40088-e542-0245-458f-7372dfdd5026@huawei.com>
Date: Fri, 26 Nov 2021 16:18:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] block-backend: Retain permissions after migration
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, <qemu-block@nongnu.org>
CC: <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
References: <20211125135317.186576-1-hreitz@redhat.com>
 <20211125135317.186576-2-hreitz@redhat.com>
In-Reply-To: <20211125135317.186576-2-hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 kwepemm600002.china.huawei.com (7.193.23.29)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=liangpeng10@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Peng Liang <liangpeng10@huawei.com>
From:  Peng Liang via <qemu-devel@nongnu.org>

On 11/25/2021 9:53 PM, Hanna Reitz wrote:
> After migration, the permissions the guest device wants to impose on its
> BlockBackend are stored in blk->perm and blk->shared_perm.  In
> blk_root_activate(), we take our permissions, but keep all shared
> permissions open by calling `blk_set_perm(blk->perm, BLK_PERM_ALL)`.
> 
> Only afterwards (immediately or later, depending on the runstate) do we
> restrict the shared permissions by calling
> `blk_set_perm(blk->perm, blk->shared_perm)`.  Unfortunately, our first
> call with shared_perm=BLK_PERM_ALL has overwritten blk->shared_perm to
> be BLK_PERM_ALL, so this is a no-op and the set of shared permissions is
> not restricted.
> 
> Fix this bug by saving the set of shared permissions before invoking
> blk_set_perm() with BLK_PERM_ALL and restoring it afterwards.
> 
> Fixes: 5f7772c4d0cf32f4e779fcd5a69ae4dae24aeebf
>        ("block-backend: Defer shared_perm tightening migration
>        completion")
> Reported-by: Peng Liang <liangpeng10@huawei.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/block-backend.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Thanks for your patch!

Tested-by: Peng Liang <liangpeng10@huawei.com>


