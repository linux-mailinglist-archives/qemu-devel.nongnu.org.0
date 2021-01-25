Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5183020D2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 04:24:47 +0100 (CET)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3sUg-0003zM-58
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 22:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1l3sTf-0003U7-L7; Sun, 24 Jan 2021 22:23:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1l3sTc-0000XB-Tb; Sun, 24 Jan 2021 22:23:43 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DPFXj5Hb3z15y65;
 Mon, 25 Jan 2021 11:22:13 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 25 Jan 2021 11:23:17 +0800
Subject: Re: [PATCH v4 0/7] block: Add retry for werror=/rerror= mechanism
To: Jiahui Cen <cenjiahui@huawei.com>, <qemu-devel@nongnu.org>
References: <20201215123011.4048-1-cenjiahui@huawei.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <c179fd5f-7a7b-15a0-6aa5-b901a0aee98e@huawei.com>
Date: Mon, 25 Jan 2021 11:23:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215123011.4048-1-cenjiahui@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping for it.

Thanks for Stefan's suggestion, we have re-implement the concept by
introducing the 'retry' feature base on the werror=/rerror= mechanism.

Hope this thread won't be missed. Any comments and reviews are wellcome.

Thanks.
Ying Fang.

On 12/15/2020 8:30 PM, Jiahui Cen wrote:
> A VM in the cloud environment may use a virutal disk as the backend storage,
> and there are usually filesystems on the virtual block device. When backend
> storage is temporarily down, any I/O issued to the virtual block device
> will cause an error. For example, an error occurred in ext4 filesystem would
> make the filesystem readonly. In production environment, a cloud backend
> storage can be soon recovered. For example, an IP-SAN may be down due to
> network failure and will be online soon after network is recovered. However,
> the error in the filesystem may not be recovered unless a device reattach
> or system restart. Thus an I/O retry mechanism is in need to implement a
> self-healing system.
> 
> This patch series propose to extend the werror=/rerror= mechanism to add
> a 'retry' feature. It can automatically retry failed I/O requests on error
> without sending error back to guest, and guest can get back running smoothly
> when I/O is recovred.
> 
> v3->v4:
> * Adapt to werror=/rerror= mechanism.
> 
> v2->v3:
> * Add a doc to describe I/O hang.
> 
> v1->v2:
> * Rebase to fix compile problems.
> * Fix incorrect remove of rehandle list.
> * Provide rehandle pause interface.
> 
> REF: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg06560.html
> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> 
> Jiahui Cen (7):
>    qapi/block-core: Add retry option for error action
>    block-backend: Introduce retry timer
>    block-backend: Add device specific retry callback
>    block-backend: Enable retry action on errors
>    block-backend: Add timeout support for retry
>    block: Add error retry param setting
>    virtio_blk: Add support for retry on errors
> 
>   block/block-backend.c          | 66 ++++++++++++++++++++
>   blockdev.c                     | 52 +++++++++++++++
>   hw/block/block.c               | 10 +++
>   hw/block/virtio-blk.c          | 19 +++++-
>   include/hw/block/block.h       |  7 ++-
>   include/sysemu/block-backend.h | 10 +++
>   qapi/block-core.json           |  4 +-
>   7 files changed, 162 insertions(+), 6 deletions(-)
> 

