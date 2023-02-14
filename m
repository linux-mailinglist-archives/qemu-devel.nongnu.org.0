Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6589696FB6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:30:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2qx-00017J-Ud; Tue, 14 Feb 2023 16:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pS2qv-00011u-G0
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:28:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pS2qt-00020s-Bm
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676410118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1IjOWjrynw61gdSih9hODo14kNeW3/cY2jwDygfcZM=;
 b=AEL3W5inqD582Jlf7zkHIrFP9k4pxGlDenx1jJVs+QXx3JTMrw+4t67MOhQ/k1lHtsFVfG
 2UdVkZd95306t6OHyjh0YkquzjefjtWiZKgfC6cn0FNlPAGa9qxxEgKl1qbYd5veUuH9L+
 E12cSTRdwOdNbcDC7lVJ/uiSEivcOJ4=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-1OcQc89cO7S_JeVsukIq6Q-1; Tue, 14 Feb 2023 16:28:37 -0500
X-MC-Unique: 1OcQc89cO7S_JeVsukIq6Q-1
Received: by mail-io1-f70.google.com with SMTP id
 y22-20020a5d94d6000000b007076e06ba3dso10996206ior.20
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1IjOWjrynw61gdSih9hODo14kNeW3/cY2jwDygfcZM=;
 b=uaanCxD7RoxpcnS7tdhzi0XamWm9pUHviQprF2dDbMmIwSvorNTmXlC0/ohCo/0/Lu
 w0SSpuhv+W++xGJvdnN5j1UaR6FWUjCQps70rBxAAEBCZQeiaVbIUJ1XnEeIY49GX6Vm
 8AzokYw3x31dtI13HH1Fx+FLUZmapJjd3NzfatjwneOisvcN225SV5felCs4a+jjQ5AL
 h6nTzR3tRgd7Sv4NMCXqqx+CzMX5LEasLRQYDIJATSlc37dE/+b44UdwK+JqcaY95TAu
 MbwVBX/q/8Y2q2ifLxoJHJBm2q1NQMZtfslODCTMe2fjVU38EZWa0WWlAMSM4Q2sN4hY
 Q4Pg==
X-Gm-Message-State: AO0yUKWahjK9Uz56GoDg5HgEEkAJQs1TkHid08D1647jXvagq2aAmOqe
 EeI6p6vz4LjubfMyjg2/kAz5yHSMY6OBFeN1zMsmA2I8swBUyFqiDQJHhf7FHxU054d/LcotF67
 uBDu4hzkd4eqTOSo=
X-Received: by 2002:a5e:db49:0:b0:722:b81a:cccb with SMTP id
 r9-20020a5edb49000000b00722b81acccbmr186813iop.16.1676410116296; 
 Tue, 14 Feb 2023 13:28:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8MyWJX2mwZXVVhgTE/NqKXNfTAmk05TUHU8v+pFnuo7nGOX7ILZvEixlQ+gUkK4XhN6KNvDw==
X-Received: by 2002:a5e:db49:0:b0:722:b81a:cccb with SMTP id
 r9-20020a5edb49000000b00722b81acccbmr186793iop.16.1676410116048; 
 Tue, 14 Feb 2023 13:28:36 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i18-20020a6b3b12000000b0074065ea4c2asm1082819ioa.55.2023.02.14.13.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 13:28:35 -0800 (PST)
Date: Tue, 14 Feb 2023 14:28:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 05/18] vfio/common: Add VFIOBitmap and (de)alloc functions
Message-ID: <20230214142833.40ee644f.alex.williamson@redhat.com>
In-Reply-To: <5bc7fbe1-8ee6-d839-b128-b323fb7c9b92@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-6-avihaih@nvidia.com>
 <20230127141101.7d21f937.alex.williamson@redhat.com>
 <5bc7fbe1-8ee6-d839-b128-b323fb7c9b92@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 12 Feb 2023 17:36:49 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 27/01/2023 23:11, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Thu, 26 Jan 2023 20:49:35 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:
> >  
> >> There are already two places where dirty page bitmap allocation and
> >> calculations are done in open code. With device dirty page tracking
> >> being added in next patches, there are going to be even more places.
> >>
> >> To avoid code duplication, introduce VFIOBitmap struct and corresponding
> >> alloc and dealloc functions and use them where applicable.
> >>
> >> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >> ---
> >>   hw/vfio/common.c | 89 ++++++++++++++++++++++++++++++++----------------
> >>   1 file changed, 60 insertions(+), 29 deletions(-)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 8e8ffbc046..e554573eb5 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -319,6 +319,41 @@ const MemoryRegionOps vfio_region_ops = {
> >>    * Device state interfaces
> >>    */
> >>
> >> +typedef struct {
> >> +    unsigned long *bitmap;
> >> +    hwaddr size;
> >> +    hwaddr pages;
> >> +} VFIOBitmap;
> >> +
> >> +static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
> >> +{
> >> +    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);
> >> +    if (!vbmap) {
> >> +        errno = ENOMEM;
> >> +
> >> +        return NULL;
> >> +    }
> >> +
> >> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> >> +    vbmap->size =  ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
> >> +                                          BITS_PER_BYTE;
> >> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
> >> +    if (!vbmap->bitmap) {
> >> +        g_free(vbmap);
> >> +        errno = ENOMEM;
> >> +
> >> +        return NULL;
> >> +    }
> >> +
> >> +    return vbmap;
> >> +}
> >> +
> >> +static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
> >> +{
> >> +    g_free(vbmap->bitmap);
> >> +    g_free(vbmap);
> >> +}
> >> +
> >>   bool vfio_mig_active(void)
> >>   {
> >>       VFIOGroup *group;
> >> @@ -421,9 +456,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
> >>   {
> >>       struct vfio_iommu_type1_dma_unmap *unmap;
> >>       struct vfio_bitmap *bitmap;
> >> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
> >> +    VFIOBitmap *vbmap;
> >>       int ret;
> >>
> >> +    vbmap = vfio_bitmap_alloc(size);
> >> +    if (!vbmap) {
> >> +        return -errno;
> >> +    }
> >> +
> >>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
> >>
> >>       unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
> >> @@ -437,35 +477,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
> >>        * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
> >>        * to qemu_real_host_page_size.
> >>        */
> >> -
> >>       bitmap->pgsize = qemu_real_host_page_size();
> >> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
> >> -                   BITS_PER_BYTE;
> >> +    bitmap->size = vbmap->size;
> >> +    bitmap->data = (__u64 *)vbmap->bitmap;
> >>
> >> -    if (bitmap->size > container->max_dirty_bitmap_size) {
> >> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
> >> -                     (uint64_t)bitmap->size);
> >> +    if (vbmap->size > container->max_dirty_bitmap_size) {
> >> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap->size);  
> > Why not pass the container to the alloc function so we can test this
> > consistently for each bitmap we allocate?  
> 
> Hi, sorry for the delay.
> 
> This test is relevant only for VFIO IOMMU dirty tracking. With device 
> dirty tracking it should be skipped.
> Do you think we should still move it to the alloc function?

Ah, ok.  Sounds like we'll have to live with a separate test for the
container path.  Thanks,

Alex


