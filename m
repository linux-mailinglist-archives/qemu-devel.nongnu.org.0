Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ED063F88B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 20:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0pU5-00066h-Ni; Thu, 01 Dec 2022 14:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0pU4-00066X-4I
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:44:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0pU0-0001ya-Io
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669923868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WSifK83T5tYi9i5ZRWyl0Hcyo6z7WVW2C1syxlVIYNI=;
 b=ASnMo7piTmvNAUcEmhXGLRHhSlwl/nGmYWz9ei29geNloNYzKudc2Cy2T2c4P4eDCiCirJ
 nIz/PWVqW4X85YuK1KUQ1i9kTiil92uTb8r6Q5Hup9ZTft975Mc0Z21WoegcCvH+1RrbnL
 1cf/4DbfUxN10TccmAAm4bMkzpkpbhw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-2L98R3kdNYeeYTJRCcK8Zw-1; Thu, 01 Dec 2022 14:44:26 -0500
X-MC-Unique: 2L98R3kdNYeeYTJRCcK8Zw-1
Received: by mail-qv1-f71.google.com with SMTP id
 nh17-20020a056214391100b004bb6c16bd4dso7716759qvb.17
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 11:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WSifK83T5tYi9i5ZRWyl0Hcyo6z7WVW2C1syxlVIYNI=;
 b=Q6hzBfqHbjaB3Zq3F6dSZQ7unNf8tQi//AlYiVWDMRkb2Rsah39ZEAgQ+inzd4e3of
 iCzKcZ+ZSNxe7xk7xb5Fl53Hd7iVfD2DOIw/9IiN7dMsoPtBPXX9lHpphUeCsWi1Pi4C
 h4T78UBDc1qdjsTAX8pW5+A51i/FwjjuzSWZyjg6L0Ae+HHqqGpeFExWOhfd+bR4yCZ2
 CXaoBZilRo/R6P9GRABHVqiW/ZvMa1X30GBqnxkrkkLjmMr5lt9MbCc4Ejswy6v4414D
 04QC9Xe1h4aY4vNoARPISc+CnDCKRh4leIsf0FqMq0SXXmPFX9qvZd+HmbHJEDx9GCvz
 fsFg==
X-Gm-Message-State: ANoB5plg2wfzTIVxPUEVFM3SAsfz768CSGWM28u90yExzlTun9ewYLc7
 cin45KOL90VdA3Z6zcV1f3lX0RisY91ct+UrHVYP8UgRE6QHxEpBkUPNbaFhu+RFtC6fmMWj4q8
 S2Kzhi4RtUMsfRmw=
X-Received: by 2002:a05:620a:122d:b0:6fa:14fc:4f3f with SMTP id
 v13-20020a05620a122d00b006fa14fc4f3fmr42212896qkj.364.1669923866430; 
 Thu, 01 Dec 2022 11:44:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4t8DmMj1DikU7PJ9vAInUTx2ZjS8cu8PUBrdAy2nitQwn1EbXD/xVlH81FFNgcVQgadg7DCA==
X-Received: by 2002:a05:620a:122d:b0:6fa:14fc:4f3f with SMTP id
 v13-20020a05620a122d00b006fa14fc4f3fmr42212877qkj.364.1669923866124; 
 Thu, 01 Dec 2022 11:44:26 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bi6-20020a05620a318600b006fa16fe93bbsm3952760qkb.15.2022.12.01.11.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 11:44:25 -0800 (PST)
Date: Thu, 1 Dec 2022 14:44:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] intel-iommu: Document iova_tree
Message-ID: <Y4kEGP3kHeo8HttC@x1n>
References: <20221201162501.3864692-1-peterx@redhat.com>
 <9de7491a-0787-fca5-0738-da5e8288b683@redhat.com>
 <Y4j+8y8EnWkZor2+@x1n>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="L/OOnDhnb8ydTW5q"
Content-Disposition: inline
In-Reply-To: <Y4j+8y8EnWkZor2+@x1n>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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


--L/OOnDhnb8ydTW5q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 01, 2022 at 02:22:27PM -0500, Peter Xu wrote:
> On Thu, Dec 01, 2022 at 07:17:41PM +0100, Eric Auger wrote:
> > Hi Peter
> 
> Hi, Eric,
> 
> > 
> > On 12/1/22 17:25, Peter Xu wrote:
> > > It seems not super clear on when iova_tree is used, and why.  Add a rich
> > > comment above iova_tree to track why we needed the iova_tree, and when we
> > > need it.
> > >
> > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
> > >  1 file changed, 29 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> > > index 46d973e629..8d130ab2e3 100644
> > > --- a/include/hw/i386/intel_iommu.h
> > > +++ b/include/hw/i386/intel_iommu.h
> > > @@ -109,7 +109,35 @@ struct VTDAddressSpace {
> > >      QLIST_ENTRY(VTDAddressSpace) next;
> > >      /* Superset of notifier flags that this address space has */
> > >      IOMMUNotifierFlag notifier_flags;
> > > -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> > > +    /*
> > > +     * @iova_tree traces mapped IOVA ranges.
> > > +     *
> > > +     * The tree is not needed if no MAP notifiers is registered with
> > 
> > s/no MAP notifiers/no MAP notifier
> 
> Will fix.
> 
> > > +     * current VTD address space, because all UNMAP (including iotlb or
> > > +     * dev-iotlb) events can be transparently delivered to !MAP iommu
> > > +     * notifiers.
> > because all UNMAP notifications (iotlb or dev-iotlb) can be triggered
> > directly, as opposed to MAP notifications. (?)
> 
> What I wanted to say is any PSI or DSI messages we got from the guest can
> be transparently delivered to QEMU's iommu notifiers.  I'm not sure
> "triggered directly" best describe the case here.
> 
> PSI: Page Selective Invalidations
> DSI: Domain Selective Invalidations
> 
> Sorry to mention these terms again, but that's really what the "transparent
> delivery" means here - we get the PSI/DSI messages, then we notify with the
> same ranges in IOMMU notifiers.  They're not the same concept but we do
> that transparently without changing the core of the messages.
> 
> Maybe I should spell out "!MAP" as "UNMAP-only"?  Would that help?
> 
> > > +     *
> > > +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> > > +     * reasons.
> > > +     *
> > > +     * Firstly, there's no way to identify whether an PSI event is MAP or
> > maybe give the decryption of the 'PSI' and 'DSI" acronyms once ;-)
> 
> Please see above. :)
> 
> These are VT-d terms used in multiple places in the .[ch] files, I assume
> I'll just keep using them because otherwise I'll need to comment them
> everytime we use any PSI/DSI terms.  It might become an overkill I'm afraid.
> 
> > > +     * UNMAP within the PSI message itself.  Without having prior knowledge
> > > +     * of existing state vIOMMU doesn't know whether it should notify MAP
> > > +     * or UNMAP for a PSI message it received.
> > > +     *
> > > +     * Secondly, PSI received from guest driver (or even a large PSI can
> > > +     * grow into a DSI at least with Linux intel-iommu driver) can be
> > > +     * larger in range than the newly mapped ranges for either MAP or UNMAP
> > > +     * events. If it directly pass-throughs any such event it may confuse
> > 
> > If it directly notifies the registered device with the unmodified range, it may confuse the drivers ../..
> 
> Will fix.
> 
> > 
> > So the range of the MAP notification can be adapted based on the existing IOVA mappings.  
> 
> Yes, e.g. the iova tree makes sure we don't map something again if it's mapped.

I figured maybe simpler I just attach a v2..

Thanks,

-- 
Peter Xu

--L/OOnDhnb8ydTW5q
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-intel-iommu-Document-iova_tree.patch"

From 67594a4bfad481a2810b69e2b17e6399f39a18a2 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Thu, 1 Dec 2022 11:11:41 -0500
Subject: [PATCH] intel-iommu: Document iova_tree
Content-type: text/plain

It seems not super clear on when iova_tree is used, and why.  Add a rich
comment above iova_tree to track why we needed the iova_tree, and when we
need it.

Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/hw/i386/intel_iommu.h | 37 ++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 46d973e629..d96da8cc75 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -109,7 +109,42 @@ struct VTDAddressSpace {
     QLIST_ENTRY(VTDAddressSpace) next;
     /* Superset of notifier flags that this address space has */
     IOMMUNotifierFlag notifier_flags;
-    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
+    /*
+     * @iova_tree traces mapped IOVA ranges.
+     *
+     * The tree is not needed if no MAP notifier is registered with current
+     * VTD address space, because all UNMAP events the vIOMMU receives (for
+     * either iotlb or dev-iotlb) can be transparently delivered to iommu
+     * notifiers.
+     *
+     * The tree OTOH is required for MAP typed iommu notifiers for a few
+     * reasons.
+     *
+     * Firstly, there's no way to identify whether an PSI/DSI event is an
+     * MAP or UNMAP event within the message itself.  Without having prior
+     * knowledge of existing state vIOMMU doesn't know whether it should
+     * notify MAP or UNMAP for a PSI message it received when caching mode
+     * is enabled (for MAP notifiers).
+     *
+     * Secondly, PSI messages received from guest driver can be enlarged in
+     * range, covers but not limited to what the guest driver wanted to
+     * invalidate.  When the range to invalidates gets bigger than the
+     * limit of a PSI message, it can even become a DSI which will
+     * invalidate the whole domain.  If the vIOMMU directly notifies the
+     * registered device with the unmodified range, it may confuse the
+     * registered drivers (e.g. vfio-pci) on either:
+     *
+     *   (1) Trying to map the same region more than once (for
+     *       VFIO_IOMMU_MAP_DMA, -EEXIST will trigger), or,
+     *
+     *   (2) Trying to UNMAP a range that is still partially mapped.
+     *
+     * That accuracy is not required for UNMAP-only notifiers, but it is a
+     * must-to-have for notifiers registered with MAP events, because the
+     * vIOMMU needs to make sure the shadow page table is always in sync
+     * with the guest IOMMU pgtables for a device.
+     */
+    IOVATree *iova_tree;
 };
 
 struct VTDIOTLBEntry {
-- 
2.37.3


--L/OOnDhnb8ydTW5q--


