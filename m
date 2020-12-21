Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D72DF9AA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 08:59:07 +0100 (CET)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krG5y-0007xh-Gi
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 02:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1krG4S-0007Rv-1I; Mon, 21 Dec 2020 02:57:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1krG4O-0000yw-R7; Mon, 21 Dec 2020 02:57:31 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CzsHS0VZgz15gnS;
 Mon, 21 Dec 2020 15:56:36 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 21 Dec 2020 15:57:10 +0800
Subject: Re: [PATCH v4 0/7] block: Add retry for werror=/rerror= mechanism
To: <qemu-devel@nongnu.org>
References: <20201215123011.4048-1-cenjiahui@huawei.com>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <9dbf70e5-b545-9ffc-8aa5-2d9236960cff@huawei.com>
Date: Mon, 21 Dec 2020 15:57:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201215123011.4048-1-cenjiahui@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.299,
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
 fangying1@huawei.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping...

On 2020/12/15 20:30, Jiahui Cen wrote:
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
>   qapi/block-core: Add retry option for error action
>   block-backend: Introduce retry timer
>   block-backend: Add device specific retry callback
>   block-backend: Enable retry action on errors
>   block-backend: Add timeout support for retry
>   block: Add error retry param setting
>   virtio_blk: Add support for retry on errors
> 
>  block/block-backend.c          | 66 ++++++++++++++++++++
>  blockdev.c                     | 52 +++++++++++++++
>  hw/block/block.c               | 10 +++
>  hw/block/virtio-blk.c          | 19 +++++-
>  include/hw/block/block.h       |  7 ++-
>  include/sysemu/block-backend.h | 10 +++
>  qapi/block-core.json           |  4 +-
>  7 files changed, 162 insertions(+), 6 deletions(-)
> 

