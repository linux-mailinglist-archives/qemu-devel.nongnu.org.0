Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66521D9BEC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 18:04:37 +0200 (CEST)
Received: from localhost ([::1]:56292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb4jM-0000yG-2b
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 12:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jb4gG-0006ZZ-KT
 for qemu-devel@nongnu.org; Tue, 19 May 2020 12:01:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27671
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jb4gE-0002dy-4P
 for qemu-devel@nongnu.org; Tue, 19 May 2020 12:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589904079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlpBq/BXBFnjMr/SkJtxdRR7h+flQXgDwrlXGBm938A=;
 b=Ra8HI4OlPDIPBhdPKpjA1lSr9lO4uBjh6rqfYGWvagMVZ6W/i6sUdiLH1gZe35CcWodrDG
 6W25nyNwhvGanCGlMCnFoXpE6ZWxtdj4YH9uZPg+QVFjYn8BERQ7oxe4OdA/NOZAoJUUuB
 AJYxFTsdZ7M0KMDU8sLEwPcvt8eaaKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-CV9ojqhYOeWSsFwg92gVFg-1; Tue, 19 May 2020 12:01:15 -0400
X-MC-Unique: CV9ojqhYOeWSsFwg92gVFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40BDE18FF663;
 Tue, 19 May 2020 16:01:10 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93B7C5C1C8;
 Tue, 19 May 2020 16:01:01 +0000 (UTC)
Date: Tue, 19 May 2020 18:00:59 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH Kernel v20 4/8] vfio iommu: Add ioctl definition for
 dirty pages tracking
Message-ID: <20200519180059.68f2c338.cohuck@redhat.com>
In-Reply-To: <20200519095356.5d1f6ffa@x1.home>
References: <1589488667-9683-1-git-send-email-kwankhede@nvidia.com>
 <1589488667-9683-5-git-send-email-kwankhede@nvidia.com>
 <20200515125916.78723321.cohuck@redhat.com>
 <bdb9c1d3-e673-5bb1-aced-f7443f4dfe58@nvidia.com>
 <20200519173507.3cd131dd.cohuck@redhat.com>
 <20200519095356.5d1f6ffa@x1.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 09:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, cjia@nvidia.com,
 kvm@vger.kernel.org, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 May 2020 09:53:56 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Tue, 19 May 2020 17:35:07 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Fri, 15 May 2020 23:05:24 +0530
> > Kirti Wankhede <kwankhede@nvidia.com> wrote:
> >   
> > > On 5/15/2020 4:29 PM, Cornelia Huck wrote:    
> > > > On Fri, 15 May 2020 02:07:43 +0530
> > > > Kirti Wankhede <kwankhede@nvidia.com> wrote:
> > > >       
> > > >> IOMMU container maintains a list of all pages pinned by vfio_pin_pages API.
> > > >> All pages pinned by vendor driver through this API should be considered as
> > > >> dirty during migration. When container consists of IOMMU capable device and
> > > >> all pages are pinned and mapped, then all pages are marked dirty.
> > > >> Added support to start/stop dirtied pages tracking and to get bitmap of all
> > > >> dirtied pages for requested IO virtual address range.
> > > >>
> > > >> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > > >> Reviewed-by: Neo Jia <cjia@nvidia.com>
> > > >> ---
> > > >>   include/uapi/linux/vfio.h | 55 +++++++++++++++++++++++++++++++++++++++++++++++
> > > >>   1 file changed, 55 insertions(+)    
> > 
> > (...)
> >   
> > > >> + * When IOCTL is called with VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP flag set,
> > > >> + * IOCTL returns dirty pages bitmap for IOMMU container during migration for
> > > >> + * given IOVA range.      
> > > > 
> > > > "Calling the IOCTL with VFIO_IOMMU_DIRTY_PAGES_GET_BITMAP returns the
> > > > dirty pages bitmap for the IOMMU container for a given IOVA range." ?
> > > > 
> > > > Q: How does this interact with the two other operations? I imagine
> > > > getting an empty bitmap before _START       
> > > 
> > > No, if dirty page tracking is not started, get_bitmap IOCTL will fail 
> > > with -EINVAL.
> > >     
> > > > and a bitmap-in-progress between
> > > > _START and _STOP. > After _STOP, will subsequent calls always give the
> > > > same bitmap?
> > > >      
> > > 
> > > No, return -EINVAL.    
> > 
> > Maybe add
> > 
> > "If the IOCTL has not yet been called with
> > VFIO_IOMMU_DIRTY_PAGES_FLAG_START, or if it has been called with
> > VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP, calling it with
> > VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP will return -EINVAL." ?  
> 
> Let's not specify ourselves into a corner, I think we can simply say
> that the dirty bitmap is only available while dirty logging is enabled.
> We certainly don't need to specify specific errno values that'll trip
> us up later.

"If dirty logging is not enabled, an error will be returned." ?

(...)

> > > >> Caller must set argsz including size of structure
> > > >> + * vfio_iommu_type1_dirty_bitmap_get.      
> > > > 
> > > > s/Caller/The caller/
> > > > 
> > > > Does argz also include the size of the bitmap?      
> > > 
> > > No.    
> > 
> > "The caller must set argsz to a value including the size of stuct
> > vfio_io_type1_dirty_bitmap_get, but excluding the size of the actual
> > bitmap." ?  
> 
> Yes, it wouldn't make sense for argsz to include the size of the bitmap
> itself, that's accessed independently via a user provided pointer and
> we have a separate size field for that.  Thanks,
> 
> Alex

Yes, I just wanted to make it as obvious as possible to make it easier
for folks trying to interact with this interface.


