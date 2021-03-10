Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226113348E0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:26:56 +0100 (CET)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5Py-00072a-MW
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lK5OC-0005wf-8N
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:25:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lK5O8-0004dc-5Y
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615407898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8hCGGc9KhbtQ6p5mtQlLeOnHC4MD+GyDtXyqrPWxfs=;
 b=c/56uSLcqINkMwoTAUl2Op7Te9+7DUIcTMBpV45nY0UIXKh8MAwtMP1LNh0Coj6bWIP0+i
 Y2CJ2a2QKkxPUZluVaWs0jNGjSZq9xIz96ylCH2tHCtrK9NhtB0kMF9mXbu5UB1Lk6ufbp
 gGzLTnXDCYyJGeFhzpOGjL33dEhKhoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-mXGrC8r0PsGEQFln5rzQ1A-1; Wed, 10 Mar 2021 15:24:53 -0500
X-MC-Unique: mXGrC8r0PsGEQFln5rzQ1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 032D0101F00C;
 Wed, 10 Mar 2021 20:24:52 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F3292B3BA;
 Wed, 10 Mar 2021 20:24:47 +0000 (UTC)
Date: Wed, 10 Mar 2021 13:24:46 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH] vfio: Support host translation granule size
Message-ID: <20210310132446.26a621f9@omen.home.shazbot.org>
In-Reply-To: <40a933ef-25bb-d4e2-2284-639e446ee8bc@huawei.com>
References: <20210304133446.1521-1-jiangkunkun@huawei.com>
 <20210309161713.1cc8ad2f@omen.home.shazbot.org>
 <40a933ef-25bb-d4e2-2284-639e446ee8bc@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Liu Yi L <yi.l.liu@intel.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 shameerali.kolothum.thodi@huawei.com, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021 15:19:33 +0800
Kunkun Jiang <jiangkunkun@huawei.com> wrote:

> Hi Alex,
> 
> On 2021/3/10 7:17, Alex Williamson wrote:
> > On Thu, 4 Mar 2021 21:34:46 +0800
> > Kunkun Jiang <jiangkunkun@huawei.com> wrote:
> >  
> >> The cpu_physical_memory_set_dirty_lebitmap() can quickly deal with
> >> the dirty pages of memory by bitmap-traveling, regardless of whether
> >> the bitmap is aligned correctly or not.
> >>
> >> cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
> >> host page size. So it'd better to set bitmap_pgsize to host page size
> >> to support more translation granule sizes.
> >>
> >> Fixes: 87ea529c502 (vfio: Get migration capability flags for container)
> >> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> >> ---
> >>   hw/vfio/common.c | 44 ++++++++++++++++++++++----------------------
> >>   1 file changed, 22 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 6ff1daa763..69fb5083a4 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -378,7 +378,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
> >>   {
> >>       struct vfio_iommu_type1_dma_unmap *unmap;
> >>       struct vfio_bitmap *bitmap;
> >> -    uint64_t pages = TARGET_PAGE_ALIGN(size) >> TARGET_PAGE_BITS;
> >> +    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size;
> >>       int ret;
> >>   
> >>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
> >> @@ -390,12 +390,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
> >>       bitmap = (struct vfio_bitmap *)&unmap->data;
> >>   
> >>       /*
> >> -     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
> >> -     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap_pgsize to
> >> -     * TARGET_PAGE_SIZE.
> >> +     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
> >> +     * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
> >> +     * to qemu_real_host_page_size.  
> >
> > I don't see that this change is well supported by the code,
> > cpu_physical_memory_set_dirty_lebitmap() seems to operate on  
> Yes, cpu_physical_memory_set_dirty_lebitmap() is finally to operate on
> TARGET_PAGE_SIZE. But actually it supports pages in bitmap of
> qemu_real_host_page_size to mark those dirty. It uses
> "hpratio = qemu_real_host_page_size / TARGET_PAGE_SIZE" to adapt to
> different translation granule size(e.g. 4K 2M 1G).

Thanks for the explanation, it becomes more clear but I'm still a
little confused.  It appears that
cpu_physical_memory_set_dirty_lebitmap() requires a bitmap in terms of
qemu_real_host_page_size which is translated to target pages using
hpratio.  It's not clear to me by the explanation here and in the
commit log that we're technically using the wrong page size reference
for this function.

> > TARGET_PAGE_SIZE, and the next three patch chunks take a detour through
> > memory listener code that seem unrelated to the change described in the
> > commit log.  This claims to fix something, what is actually broken?
> > Thanks,
> >
> > Alex  
> This patch 87ea529c502 (vfio: Get migration capability flags for container)
> is the start of the bug. The code of [1](marked below) restricts the host
> page size must be TARGET_PAGE_SIZE(e.g. 4K) to set
> container->dirty_pages_supported = true. It is inappropriate to limit the
> page size to TARGET_PAGE_SIZE.

Right, the noted code requires that vfio supports the target page size,
which for all practical purposes implies an hpratio = 1 currently.
That unnecessarily restricts migration support to cases where target and
host use the same page size, but this change allows migration in any
case where vfio dirty bitmap supports the host page size, which is
effectively any case where the device supports migration.  However, the
hpratio calculation requires that qemu_real_host_page_size is >=
TARGET_PAGE_SIZE, otherwise the value becomes zero and it appears we'd
only ever dirty the target zero page.  Is this configuration restricted
elsewhere, ex. 64K guest on 4K host?  Exchanging an unnecessary
restriction for allowing a buggy configuration isn't a good trade-off.
Thanks,

Alex

> >>        */
> >>   
> >> -    bitmap->pgsize = TARGET_PAGE_SIZE;
> >> +    bitmap->pgsize = qemu_real_host_page_size;
> >>       bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> >>                      BITS_PER_BYTE;
> >>   
> >> @@ -674,16 +674,16 @@ static void vfio_listener_region_add(MemoryListener *listener,
> >>           return;
> >>       }
> >>   
> >> -    if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
> >> -                 (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> >> +    if (unlikely((section->offset_within_address_space & ~qemu_real_host_page_mask) !=
> >> +                 (section->offset_within_region & ~qemu_real_host_page_mask))) {
> >>           error_report("%s received unaligned region", __func__);
> >>           return;
> >>       }
> >>   
> >> -    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> >> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> >>       llend = int128_make64(section->offset_within_address_space);
> >>       llend = int128_add(llend, section->size);
> >> -    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> >> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
> >>   
> >>       if (int128_ge(int128_make64(iova), llend)) {
> >>           return;
> >> @@ -892,8 +892,8 @@ static void vfio_listener_region_del(MemoryListener *listener,
> >>           return;
> >>       }
> >>   
> >> -    if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
> >> -                 (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> >> +    if (unlikely((section->offset_within_address_space & ~qemu_real_host_page_mask) !=
> >> +                 (section->offset_within_region & ~qemu_real_host_page_mask))) {
> >>           error_report("%s received unaligned region", __func__);
> >>           return;
> >>       }
> >> @@ -921,10 +921,10 @@ static void vfio_listener_region_del(MemoryListener *listener,
> >>            */
> >>       }
> >>   
> >> -    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> >> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> >>       llend = int128_make64(section->offset_within_address_space);
> >>       llend = int128_add(llend, section->size);
> >> -    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> >> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
> >>   
> >>       if (int128_ge(int128_make64(iova), llend)) {
> >>           return;
> >> @@ -1004,13 +1004,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
> >>       range->size = size;
> >>   
> >>       /*
> >> -     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
> >> -     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap's pgsize to
> >> -     * TARGET_PAGE_SIZE.
> >> +     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
> >> +     * qemu_real_host_page_size to mark those dirty. Hence set bitmap's pgsize
> >> +     * to qemu_real_host_page_size.
> >>        */
> >> -    range->bitmap.pgsize = TARGET_PAGE_SIZE;
> >> +    range->bitmap.pgsize = qemu_real_host_page_size;
> >>   
> >> -    pages = TARGET_PAGE_ALIGN(range->size) >> TARGET_PAGE_BITS;
> >> +    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size;
> >>       range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> >>                                            BITS_PER_BYTE;
> >>       range->bitmap.data = g_try_malloc0(range->bitmap.size);
> >> @@ -1114,7 +1114,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
> >>                  section->offset_within_region;
> >>   
> >>       return vfio_get_dirty_bitmap(container,
> >> -                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
> >> +                       REAL_HOST_PAGE_ALIGN(section->offset_within_address_space),
> >>                          int128_get64(section->size), ram_addr);
> >>   }
> >>   
> >> @@ -1655,10 +1655,10 @@ static void vfio_get_iommu_info_migration(VFIOContainer *container,
> >>                               header);
> >>   
> >>       /*
> >> -     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
> >> -     * TARGET_PAGE_SIZE to mark those dirty.
> >> +     * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
> >> +     * qemu_real_host_page_size to mark those dirty.
> >>        */
> >> -    if (cap_mig->pgsize_bitmap & TARGET_PAGE_SIZE) {
> >> +    if (cap_mig->pgsize_bitmap & qemu_real_host_page_size) {  
> [1]
> >>           container->dirty_pages_supported = true;
> >>           container->max_dirty_bitmap_size = cap_mig->max_dirty_bitmap_size;
> >>           container->dirty_pgsizes = cap_mig->pgsize_bitmap;  
> > .  
> 
> 


