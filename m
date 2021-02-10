Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA7D315C28
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 02:26:26 +0100 (CET)
Received: from localhost ([::1]:46826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9eGv-000329-AR
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 20:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l9eDp-0002SJ-FA; Tue, 09 Feb 2021 20:23:13 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l9eDl-0002we-8g; Tue, 09 Feb 2021 20:23:13 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Db2600g1Lz7jVD;
 Wed, 10 Feb 2021 09:21:28 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Feb 2021 09:22:39 +0800
Subject: Re: [PATCH v5 0/9] block: Add retry for werror=/rerror= mechanism
To: <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <3375c2f3-4e85-95b1-cb8b-ab77b77be1eb@huawei.com>
Date: Wed, 10 Feb 2021 09:22:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210205101315.13042-1-cenjiahui@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=cenjiahui@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping.
Any comments and reviews are wellcome :)

Thanks,
Jiahui

On 2021/2/5 18:13, Jiahui Cen wrote:
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
> v4->v5:
> * Add document for 'retry' in qapi.
> * Support werror=/rerror=retry for scsi-disk.
> * Pause retry when draining.
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
> Jiahui Cen (9):
>   qapi/block-core: Add retry option for error action
>   block-backend: Introduce retry timer
>   block-backend: Add device specific retry callback
>   block-backend: Enable retry action on errors
>   block-backend: Add timeout support for retry
>   block: Add error retry param setting
>   virtio_blk: Add support for retry on errors
>   scsi-bus: Refactor the code that retries requests
>   scsi-disk: Add support for retry on errors
> 
>  block/block-backend.c          | 68 ++++++++++++++++++++
>  blockdev.c                     | 52 +++++++++++++++
>  hw/block/block.c               | 10 +++
>  hw/block/virtio-blk.c          | 21 +++++-
>  hw/scsi/scsi-bus.c             | 16 +++--
>  hw/scsi/scsi-disk.c            | 16 +++++
>  include/hw/block/block.h       |  7 +-
>  include/hw/scsi/scsi.h         |  1 +
>  include/sysemu/block-backend.h | 10 +++
>  qapi/block-core.json           |  9 ++-
>  10 files changed, 199 insertions(+), 11 deletions(-)
> 

