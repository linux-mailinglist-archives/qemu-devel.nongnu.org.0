Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23213303653
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 07:14:00 +0100 (CET)
Received: from localhost ([::1]:34662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Hbz-00064J-7U
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 01:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1l4HSc-0005gO-BA; Tue, 26 Jan 2021 01:04:18 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1l4HSZ-0002fl-PW; Tue, 26 Jan 2021 01:04:17 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DPx3t1fYbzjCLX;
 Tue, 26 Jan 2021 14:03:06 +0800 (CST)
Received: from [10.174.186.182] (10.174.186.182) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 26 Jan 2021 14:03:55 +0800
Subject: Re: [RFC PATCH v2 0/3] vfio: Some fixes and optimizations for VFIO
 migration
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <76b14984-3574-6093-238a-9b9eb4b2ef2d@huawei.com>
Date: Tue, 26 Jan 2021 14:03:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201209080919.156-1-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.182]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=lushenming@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/12/9 16:09, Shenming Lu wrote:
> This patch set includes two fixes and one optimization for VFIO migration
> as blew:
> Patch 1-2:
> - Fix two ordering problems in migration.
> 
> Patch 3:
> - Optimize the enabling process of the MSI-X vectors in migration.
> 

Hi,

Friendly ping, is there any further comments on this series (especially
for patch 1 and 3)?  :-)

Thanks,
Shenming

> 
> Shenming Lu (3):
>   vfio: Move the saving of the config space to the right place in VFIO
>     migration
>   vfio: Set the priority of the VFIO VM state change handler explicitly
>   vfio: Avoid disabling and enabling vectors repeatedly in VFIO
>     migration
> 
>  hw/pci/msix.c         | 17 +++++++++++++++++
>  hw/vfio/migration.c   | 28 +++++++++++++++++-----------
>  hw/vfio/pci.c         | 10 ++++++++--
>  include/hw/pci/msix.h |  2 ++
>  4 files changed, 44 insertions(+), 13 deletions(-)
> 

