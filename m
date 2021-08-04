Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D53DFB44
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 07:51:03 +0200 (CEST)
Received: from localhost ([::1]:47002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB9nx-0006xE-W9
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 01:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1mB9mp-0005r9-SC
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 01:49:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:30089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1mB9mn-0004CR-Je
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 01:49:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="201021404"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="201021404"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 22:49:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="521700570"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.133])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 22:49:38 -0700
Date: Wed, 4 Aug 2021 13:57:04 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled
Message-ID: <20210804055703.GA5925@gao-cwp>
References: <20210804034803.1644-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804034803.1644-1-jasowang@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chao.gao@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, Wei.Huang2@amd.com, dgilbert@redhat.com, peterx@redhat.com,
 qemu-devel@nongnu.org, Sriyash.Caculo@amd.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 11:48:00AM +0800, Jason Wang wrote:
>Hi:
>
>We currently try to enable device IOTLB when iommu_platform is
>set. This may lead unnecessary trasnsactions between qemu and vhost
>when vIOMMU is not used (which is the typical case for the encrypted
>VM).
>
>So patch tries to use transport specific method to detect the enalbing
>of vIOMMU and enable the device IOTLB only if vIOMMU is enalbed.
>
>Please review.

Tested-by: Chao Gao <chao.gao@intel.com>

Tested with TDX; this series fixes the performance issue we saw in a TD
when vhost was enabled.

Thanks
Chao

>
>Thanks
>
>Jason Wang (3):
>  virtio-bus: introduce iommu_enabled()
>  virtio-pci: implement iommu_enabled()
>  vhost: correctly detect the enabling IOMMU
>
> hw/virtio/vhost.c              |  2 +-
> hw/virtio/virtio-bus.c         | 14 ++++++++++++++
> hw/virtio/virtio-pci.c         | 14 ++++++++++++++
> include/hw/virtio/virtio-bus.h |  4 +++-
> 4 files changed, 32 insertions(+), 2 deletions(-)
>
>-- 
>2.25.1
>

