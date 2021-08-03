Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613283DE64C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 07:45:19 +0200 (CEST)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAnEs-0004XW-Ds
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 01:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1mAnDq-0003i1-A2
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:44:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:4010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1mAnDl-0001W8-AT
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:44:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="213626514"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="213626514"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 22:44:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="479225382"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 22:44:02 -0700
Date: Tue, 3 Aug 2021 13:51:29 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: use large iotlb entry if no IOMMU translation is
 needed
Message-ID: <20210803055127.GA31303@gao-cwp>
References: <20210721075402.203711-1-chao.gao@intel.com>
 <20210803042927.GA30466@gao-cwp>
 <5321eefb-7177-2009-6aae-f8c398731eac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5321eefb-7177-2009-6aae-f8c398731eac@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chao.gao@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 12:43:58PM +0800, Jason Wang wrote:
>
>在 2021/8/3 下午12:29, Chao Gao 写道:
>> Ping. Could someone help to review this patch?
>> 
>> Thanks
>> Chao
>> 
>> On Wed, Jul 21, 2021 at 03:54:02PM +0800, Chao Gao wrote:
>> > If guest enables IOMMU_PLATFORM for virtio-net, severe network
>> > performance drop is observed even if there is no IOMMU.
>
>
>We see such reports internally and we're testing a patch series to disable
>vhost IOTLB in this case.
>
>Will post a patch soon.

OK. put me in the CC list. I would like to test with TDX to ensure your patch
fix the performance issue I am facing.

>
>
>
>> >   And disabling
>> > vhost can mitigate the perf issue. Finally, we found the culprit is
>> > frequent iotlb misses: kernel vhost-net has 2048 entries and each
>> > entry is 4K (qemu uses 4K for i386 if no IOMMU); vhost-net can cache
>> > translations for up to 8M (i.e. 4K*2048) IOVAs. If guest uses >8M
>> > memory for DMA, there are some iotlb misses.
>> > 
>> > If there is no IOMMU or IOMMU is disabled or IOMMU works in pass-thru
>> > mode, we can optimistically use large, unaligned iotlb entries instead
>> > of 4K-aligned entries to reduce iotlb pressure.
>
>
>Instead of introducing new general facilities like unaligned IOTLB entry. I
>wonder if we optimize the vtd_iommu_translate() to use e.g 1G instead?

using 1G iotlb entry looks feasible.

>
>    } else {
>        /* DMAR disabled, passthrough, use 4k-page*/
>        iotlb.iova = addr & VTD_PAGE_MASK_4K;
>        iotlb.translated_addr = addr & VTD_PAGE_MASK_4K;
>        iotlb.addr_mask = ~VTD_PAGE_MASK_4K;
>        iotlb.perm = IOMMU_RW;
>        success = true;
>    }
>
>
>> >   Actually, vhost-net
>> > in kernel supports unaligned iotlb entry. The alignment requirement is
>> > imposed by address_space_get_iotlb_entry() and flatview_do_translate().
>
>
>For the passthrough case, is there anyway to detect them and then disable
>device IOTLB in those case?

yes. I guess so; qemu knows the presence and status of iommu. Currently,
in flatview_do_translate(), memory_region_get_iommu() tells whether a memory
region is behind an iommu.

Thanks
Chao

