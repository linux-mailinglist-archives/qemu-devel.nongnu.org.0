Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEC1C9925
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 20:21:14 +0200 (CEST)
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWl8z-0006iX-6E
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 14:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1jWl7v-0006Cf-6H
 for qemu-devel@nongnu.org; Thu, 07 May 2020 14:20:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58768
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1jWl7u-0002ZZ-5t
 for qemu-devel@nongnu.org; Thu, 07 May 2020 14:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588875604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgewtUy9bTNyZauHpI56baWIlBcAHHHwwe5CUmUNguk=;
 b=f24JsHq8PIKEvtblQYnI2TrRqm+Qen4tcuhV/o0POV/9Dvx9dcPvhu98fjIUaxy4scESW9
 u5Szl+Dbj7tRAhXWoEX8rov856u3+DmqzAaDIyn1OXOxQbIbPitrqZRpABgA4ojjJQQMYl
 LL/RQjaXv2KXVISaf69TOgPnWrMgFk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-1X-11krePSqtA8qFXcj8yA-1; Thu, 07 May 2020 14:20:00 -0400
X-MC-Unique: 1X-11krePSqtA8qFXcj8yA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C257107ACCD;
 Thu,  7 May 2020 18:19:58 +0000 (UTC)
Received: from x1.home (ovpn-113-95.phx2.redhat.com [10.3.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98CB970559;
 Thu,  7 May 2020 18:19:56 +0000 (UTC)
Date: Thu, 7 May 2020 12:19:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH Kernel v18 4/7] vfio iommu: Implementation of ioctl for
 dirty pages tracking.
Message-ID: <20200507121956.45b2500f@x1.home>
In-Reply-To: <24223faa-15ac-bd71-6c5d-9d0401fbd839@nvidia.com>
References: <1588607939-26441-1-git-send-email-kwankhede@nvidia.com>
 <1588607939-26441-5-git-send-email-kwankhede@nvidia.com>
 <20200506081510.GC19334@joy-OptiPlex-7040>
 <24223faa-15ac-bd71-6c5d-9d0401fbd839@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=alex.williamson@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
Cc: "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 Yan Zhao <yan.y.zhao@intel.com>, "Liu, Changpeng" <changpeng.liu@intel.com>,
 "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 May 2020 01:12:25 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> On 5/6/2020 1:45 PM, Yan Zhao wrote:
> > On Mon, May 04, 2020 at 11:58:56PM +0800, Kirti Wankhede wrote:  
> 
> <snip>
> 
> >>   /*
> >>    * Helper Functions for host iova-pfn list
> >>    */
> >> @@ -567,6 +654,18 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
> >>   			vfio_unpin_page_external(dma, iova, do_accounting);
> >>   			goto pin_unwind;
> >>   		}
> >> +
> >> +		if (iommu->dirty_page_tracking) {
> >> +			unsigned long pgshift =
> >> +					 __ffs(vfio_pgsize_bitmap(iommu));
> >> +  
> > hi Kirti,
> > may I know if there's any vfio_pin_pages() happpening during NVidia's vGPU migration?
> > the code would enter into deadlock as I reported in last version.
> >   
> 
> Hm, you are right and same is the case in vfio_iommu_type1_dma_rw_chunk().
> 
> Instead of calling vfio_pgsize_bitmap() from lots of places, I'm 
> thinking of saving pgsize_bitmap in struct vfio_iommu, which should be 
> populated whenever domain_list is updated. Alex, will that be fine?

I've wondered why we don't already cache this, so yes, that's fine, but
the cached value will only be valid when evaluated under iommu->lock.
Thanks,

Alex


