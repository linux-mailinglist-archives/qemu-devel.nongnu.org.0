Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A21254EC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 22:40:21 +0100 (CET)
Received: from localhost ([::1]:32848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihh3M-0001xq-Fw
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 16:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1ihh2J-00013c-8X
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:39:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1ihh2F-0006jw-Tk
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:39:12 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46325
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1ihh2F-0006iG-Is
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 16:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576705150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9TtCci2FuLajUtFOw5B/HodtCZRSzWxgnpe0HYK4bg=;
 b=e/PHyS+WzhcioDHG9fRTHI83wk3APbJCx+9CCS8qu8du02DJwvLP3D9rCEsvsBFrmXZ3ie
 5FQ0lMlfvJiayczd6EVY1XceHcKAxru0qqGHeeS4HxDiZaFdRshbIobdZ1G91NThJKBjJz
 9g616ZkG29WSP1yAiZZ40+Ze2nJnNoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-TtPgruxiOy2jW2yv518w1w-1; Wed, 18 Dec 2019 16:39:07 -0500
X-MC-Unique: TtPgruxiOy2jW2yv518w1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08FF7801E6D;
 Wed, 18 Dec 2019 21:39:05 +0000 (UTC)
Received: from x1.home (ovpn-116-26.phx2.redhat.com [10.3.116.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C0426DEC;
 Wed, 18 Dec 2019 21:39:03 +0000 (UTC)
Date: Wed, 18 Dec 2019 14:39:02 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v10 Kernel 4/5] vfio iommu: Implementation of ioctl to
 for dirty pages tracking.
Message-ID: <20191218143902.3c9b06df@x1.home>
In-Reply-To: <17ac4c3b-5f7c-0e52-2c2b-d847d4d4e3b1@nvidia.com>
References: <1576527700-21805-1-git-send-email-kwankhede@nvidia.com>
 <1576527700-21805-5-git-send-email-kwankhede@nvidia.com>
 <20191217051513.GE21868@joy-OptiPlex-7040>
 <17ac4c3b-5f7c-0e52-2c2b-d847d4d4e3b1@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

On Tue, 17 Dec 2019 14:54:14 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> On 12/17/2019 10:45 AM, Yan Zhao wrote:
> > On Tue, Dec 17, 2019 at 04:21:39AM +0800, Kirti Wankhede wrote:  
> >> +		} else if (range.flags &
> >> +				 VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP) {
> >> +			uint64_t iommu_pgmask;
> >> +			unsigned long pgshift = __ffs(range.pgsize);
> >> +			unsigned long *bitmap;
> >> +			long bsize;
> >> +
> >> +			iommu_pgmask =
> >> +			 ((uint64_t)1 << __ffs(vfio_pgsize_bitmap(iommu))) - 1;
> >> +
> >> +			if (((range.pgsize - 1) & iommu_pgmask) !=
> >> +			    (range.pgsize - 1))
> >> +				return -EINVAL;
> >> +
> >> +			if (range.iova & iommu_pgmask)
> >> +				return -EINVAL;
> >> +			if (!range.size || range.size > SIZE_MAX)
> >> +				return -EINVAL;
> >> +			if (range.iova + range.size < range.iova)
> >> +				return -EINVAL;
> >> +
> >> +			bsize = verify_bitmap_size(range.size >> pgshift,
> >> +						   range.bitmap_size);
> >> +			if (bsize)
> >> +				return ret;
> >> +
> >> +			bitmap = kmalloc(bsize, GFP_KERNEL);
> >> +			if (!bitmap)
> >> +				return -ENOMEM;
> >> +
> >> +			ret = copy_from_user(bitmap,
> >> +			     (void __user *)range.bitmap, bsize) ? -EFAULT : 0;
> >> +			if (ret)
> >> +				goto bitmap_exit;
> >> +
> >> +			iommu->dirty_page_tracking = false;  
> > why iommu->dirty_page_tracking is false here?
> > suppose this ioctl can be called several times.
> >   
> 
> This ioctl can be called several times, but once this ioctl is called 
> that means vCPUs are stopped and VFIO devices are stopped (i.e. in 
> stop-and-copy phase) and dirty pages bitmap are being queried by user.

Do not assume how userspace works or its intent.  If dirty tracking is
on, it should remain on until the user turns it off.  We cannot assume
userspace uses a one-shot approach.  Thanks,

Alex


