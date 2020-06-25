Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1525F20A0E7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 16:35:25 +0200 (CEST)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joSyJ-0002Fu-Rk
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 10:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1joSxW-0001ov-2p
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 10:34:34 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1joSxT-00010a-Sy
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 10:34:33 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef4b5e90000>; Thu, 25 Jun 2020 07:34:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jun 2020 07:34:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jun 2020 07:34:29 -0700
Received: from [10.40.100.228] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Jun
 2020 14:34:12 +0000
Subject: Re: [PATCH QEMU v25 13/17] vfio: create mapped iova list when vIOMMU
 is enabled
To: Alex Williamson <alex.williamson@redhat.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
 <1592684486-18511-14-git-send-email-kwankhede@nvidia.com>
 <20200624125526.5488954c@x1.home>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <b0ee702d-02e5-4cd6-6dcc-047cfcb907b2@nvidia.com>
Date: Thu, 25 Jun 2020 20:04:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200624125526.5488954c@x1.home>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593095657; bh=iP8Add0LqUhTl0yLrmZt9VcOf6WSQ5YIHCkzPpTMaXY=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=TlU7ZDnHwYWcqr9mROht6f/VwkCvSNjQRuVIhMr7BWZU1LoBPDUaZkK5soMzhLWQT
 J9AIht9DbKYZtN+uHx+Xmd/8ChvtcsBIERzSZe2dzSGr7FNL4lQTtnQiSWdrFSCGje
 Lo3gFwEaPal/RqUb1WsysI4DnLn1oh8q7g5Nb6BXlMskL1VrhYn0+BmUiveYnSCbl6
 HAzAcg9gd3rWPjWshLwuebDhWtPYZ9rlTAV/TS2L3Z2DtOwldiIaWEjq2k+DMDGF+T
 K/mBAJsawfO8M/khxA3np4xp5zSerwzT7aMSrfI+bVMYNSEzEUIPB82282vdTCA7bC
 zH1fR3IIECcBQ==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 10:34:30
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, cjia@nvidia.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, dgilbert@redhat.com, changpeng.liu@intel.com,
 eskultet@redhat.com, Ken.Xue@amd.com, jonathan.davies@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/25/2020 12:25 AM, Alex Williamson wrote:
> On Sun, 21 Jun 2020 01:51:22 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> Create mapped iova list when vIOMMU is enabled. For each mapped iova
>> save translated address. Add node to list on MAP and remove node from
>> list on UNMAP.
>> This list is used to track dirty pages during migration.
> 
> This seems like a lot of overhead to support that the VM might migrate.
> Is there no way we can build this when we start migration, for example
> replaying the mappings at that time?  Thanks,
> 

In my previous version I tried to go through whole range and find valid 
iotlb, as below:

+        if (memory_region_is_iommu(section->mr)) {
+            iotlb = address_space_get_iotlb_entry(container->space->as, 
iova,
+                                                 true, 
MEMTXATTRS_UNSPECIFIED);

When mapping doesn't exist, qemu throws error as below:

qemu-system-x86_64: vtd_iova_to_slpte: detected slpte permission error 
(iova=0x0, level=0x3, slpte=0x0, write=1)
qemu-system-x86_64: vtd_iommu_translate: detected translation failure 
(dev=00:03:00, iova=0x0)
qemu-system-x86_64: New fault is not recorded due to compression of faults

Secondly, it iterates through whole range with IOMMU page size 
granularity which is 4K, so it takes long time resulting in large 
downtime. With this optimization, downtime with vIOMMU reduced 
significantly.

Other option I will try if I can check that if migration is supported 
then only create this list.

Thanks,
Kirti

