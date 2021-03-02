Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F932965C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:06:38 +0100 (CET)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGyB3-0007Od-JR
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lGy3u-0007dg-Cy; Tue, 02 Mar 2021 00:59:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lGy3q-00041G-SU; Tue, 02 Mar 2021 00:59:13 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DqRH33sjgz16DkT;
 Tue,  2 Mar 2021 13:57:19 +0800 (CST)
Received: from [10.174.184.135] (10.174.184.135) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Mar 2021 13:58:50 +0800
Subject: Re: [PATCH v3 0/3] vfio: Some fixes and optimizations for VFIO
 migration
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20210223022225.50-1-lushenming@huawei.com>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <ec7d48cc-d3b1-efd6-a483-cf6e151bf9a7@huawei.com>
Date: Tue, 2 Mar 2021 13:58:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20210223022225.50-1-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Does this series need any further modification? Wish you can pick it up. :-)

On 2021/2/23 10:22, Shenming Lu wrote:
> This patch set includes two fixes and one optimization for VFIO migration
> as blew:
> 
> Patch 1-2:
> - Fix two ordering problems in migration.
> 
> Patch 3:
> - Optimize the enabling process of the MSI-X vectors in migration.
> 
> History:
> 
> v2 -> v3:
> - Nit fixes.
> - Set error in migration stream for migration to fail in Patch 1.
> - Tested Patch 3 with a Windows guest.
> 
> Thanks,
> Shenming
> 
> 
> Shenming Lu (3):
>   vfio: Move the saving of the config space to the right place in VFIO
>     migration
>   vfio: Set the priority of the VFIO VM state change handler explicitly
>   vfio: Avoid disabling and enabling vectors repeatedly in VFIO
>     migration
> 
>  hw/pci/msix.c         |  2 +-
>  hw/vfio/migration.c   | 28 +++++++++++++++++-----------
>  hw/vfio/pci.c         | 20 +++++++++++++++++---
>  include/hw/pci/msix.h |  1 +
>  4 files changed, 36 insertions(+), 15 deletions(-)
> 

