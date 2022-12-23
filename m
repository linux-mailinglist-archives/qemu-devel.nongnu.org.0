Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD796552CD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 17:27:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ksw-0003Nd-GU; Fri, 23 Dec 2022 11:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8ksu-0003NS-Mc
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 11:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8ksq-0008V5-4h
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 11:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671812815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z6YLnTZy99M5kq2cxPBwDgPpvo94LAA9X6Xzrr7tJig=;
 b=CVxwkoSZDKv0HNhb7+IbjQ0NGavQ+aHVl/tBpGYNCIXjAlBBPQdMbyZ4Rpc9dP/nq1zKfT
 sSuEPKQvroGlK0DKdMkeQyjbRA7gSBCnuGXZuUFl+U56OJOKAsu3qZMo1BcYbxaMkPEP4s
 fgVnUBMOmOtLhNrtO9LefX/GYyewHfg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-vxAJWC75Oj-Tm_niTN4Rtg-1; Fri, 23 Dec 2022 11:26:53 -0500
X-MC-Unique: vxAJWC75Oj-Tm_niTN4Rtg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bp6-20020a05620a458600b006ffd3762e78so3446444qkb.13
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 08:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z6YLnTZy99M5kq2cxPBwDgPpvo94LAA9X6Xzrr7tJig=;
 b=OAPJ6FN+9sm/egE/wjac1yLwIUCR5Wy0u73OYjCFScEE/rmqkKUiejZ8/AftrUV/Bp
 YbH92ZOjB6CsuBSC5qpkAhStUeTaez+cx/JSdblc+qkiEx8fqSxzR2FeZcqNY1QHX/v3
 0BfnELViif3Ql60xjU7Ryqcot6ms3VJCWTeS3j0WCt0Ei8F3XrKrdXqdTKsGHsV0yRBr
 P2QLL/tPC2YqjHFG3e1Bp9K7FsxGucfzcsCTgO/QsSVy/jFdstGezMfHHpb2jt9seXmb
 NqqfdMEQu7X3XeON9lmqutcR1t6P3ER6dn2o1REHEmxZpdIwVXgw79xtck/9yLk0rJ/5
 Kr3w==
X-Gm-Message-State: AFqh2koBchetEhrDoloSZBypOdcAWnloyw3XPI45JSlgYQQEQFPHOjx5
 CMTAtocARWQFiaX5LHdlOyltBPzRjrAdUaCyor+gUirdQveWMjMvZ1KI3qUkA+PpHZ+0EAGDmw0
 9OKxtawv47I8eKFM=
X-Received: by 2002:ac8:44ac:0:b0:3a8:2ab9:7f9c with SMTP id
 a12-20020ac844ac000000b003a82ab97f9cmr11548165qto.57.1671812813297; 
 Fri, 23 Dec 2022 08:26:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt5m53/0bKJrBGxYxvAWRwhhy+82RqTuDCUXd+MWu1ZsclFV8SboXjxKiF6qR8R8fR35hv9/A==
X-Received: by 2002:ac8:44ac:0:b0:3a8:2ab9:7f9c with SMTP id
 a12-20020ac844ac000000b003a82ab97f9cmr11548145qto.57.1671812813020; 
 Fri, 23 Dec 2022 08:26:53 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac85694000000b003a7e9db074asm2108676qta.67.2022.12.23.08.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 08:26:52 -0800 (PST)
Date: Fri, 23 Dec 2022 11:26:51 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3] intel-iommu: Document iova_tree
Message-ID: <Y6XWy9XPHqhK8BMh@x1n>
References: <20221206221348.396020-1-peterx@redhat.com>
 <CACGkMEtK8w2OkeZR=Ebp3t8t6bfaJusTRyC0eB3BGyA7KuX5-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEtK8w2OkeZR=Ebp3t8t6bfaJusTRyC0eB3BGyA7KuX5-g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Dec 23, 2022 at 03:48:01PM +0800, Jason Wang wrote:
> On Wed, Dec 7, 2022 at 6:13 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > It seems not super clear on when iova_tree is used, and why.  Add a rich
> > comment above iova_tree to track why we needed the iova_tree, and when we
> > need it.
> >
> > Also comment for the map/unmap messages, on how they're used and
> > implications (e.g. unmap can be larger than the mapped ranges).
> >
> > Suggested-by: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> > v3:
> > - Adjust according to Eric's comment
> > ---
> >  include/exec/memory.h         | 28 ++++++++++++++++++++++++++
> >  include/hw/i386/intel_iommu.h | 38 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 91f8a2395a..269ecb873b 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -129,6 +129,34 @@ struct IOMMUTLBEntry {
> >  /*
> >   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
> >   * register with one or multiple IOMMU Notifier capability bit(s).
> > + *
> > + * Normally there're two use cases for the notifiers:
> > + *
> > + *   (1) When the device needs accurate synchronizations of the vIOMMU page
> > + *       tables, it needs to register with both MAP|UNMAP notifies (which
> > + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).
> > + *
> > + *       Regarding to accurate synchronization, it's when the notified
> > + *       device maintains a shadow page table and must be notified on each
> > + *       guest MAP (page table entry creation) and UNMAP (invalidation)
> > + *       events (e.g. VFIO). Both notifications must be accurate so that
> > + *       the shadow page table is fully in sync with the guest view.
> > + *
> > + *   (2) When the device doesn't need accurate synchronizations of the
> > + *       vIOMMU page tables, it needs to register only with UNMAP or
> > + *       DEVIOTLB_UNMAP notifies.
> > + *
> > + *       It's when the device maintains a cache of IOMMU translations
> > + *       (IOTLB) and is able to fill that cache by requesting translations
> > + *       from the vIOMMU through a protocol similar to ATS (Address
> > + *       Translation Service).
> > + *
> > + *       Note that in this mode the vIOMMU will not maintain a shadowed
> > + *       page table for the address space, and the UNMAP messages can be
> > + *       actually larger than the real invalidations (just like how the
> > + *       Linux IOMMU driver normally works, where an invalidation can be
> > + *       enlarged as long as it still covers the target range).  The IOMMU
> 
> Just spot this when testing your fix for DSI:
> 
>         assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> 
> Do we need to remove this (but it seems a partial revert of
> 03c7140c1a0336af3d4fca768de791b9c0e2b128)?

Replied in the othe thread.

I assume this documentation patch is still correct, am I right?  It's
talking about the possibility of enlarged invalidation range sent from the
guest and vIOMMU.  That should still not be bigger than the registered
range in iommu notifiers (even if bigger than the actual unmapped range).

Thanks,

-- 
Peter Xu


