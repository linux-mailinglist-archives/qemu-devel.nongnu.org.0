Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBC67E4F6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:19:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNhF-0004N7-9g; Fri, 27 Jan 2023 07:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLNgo-0004If-KJ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLNgl-0008DP-H1
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674821916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVVeR2P6S8mRJ+Y2ONHvQHaqd34ZySsnQbvzzI1vQW8=;
 b=M5Wb1Gmj+Bxl/A6U3Z3u2ab2OZnlwBMl0suOfREbCkzQllRQswygGAYJ4azMiTD/CPlEr4
 0258KA+nXg6XzRU0FEozrAf/WqysMxjwUY22+4VNf7f0l5BJyBxOqLJMsDe7XUgiQFPMmT
 cuelNBzCUnYn/AX8fYwC+n1iaXOrMzI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-D62gnCd1OG2usRRubNgaRQ-1; Fri, 27 Jan 2023 07:18:35 -0500
X-MC-Unique: D62gnCd1OG2usRRubNgaRQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l8-20020a05600c1d0800b003dc25f6bb5dso2629240wms.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 04:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AVVeR2P6S8mRJ+Y2ONHvQHaqd34ZySsnQbvzzI1vQW8=;
 b=x8oiUSuxMATePXqazMOP25UIf2ccpUT9INePNxCgtAdsiXNq2IUjZtN3o08xjYtte8
 CrvsLqcZOMolRICmfWsnh8QGUIELLravRAMOtI9Ozsh/LgGWGEM6mIH+q9WLBov2qf4u
 OHKXeKmFbuEBS2dZvqlBKIYXPrwl5Nfh5nCDNJauexJKZYUoFAuOtp+sgd1fFY97HSFM
 CCqOVb4uduqyHBfH6FcGSCDW3pLay9DaXe7XRT8/V0mmThuoCbVLx8B6EBM0mEZb6kcz
 CsBxzKInNrj8hwq1w5fSupcRz4aa/T5LgayzuvCl434sjzv9+vcOa+XtexYdEPgzrgyp
 KEng==
X-Gm-Message-State: AFqh2kroUFCNCNCOPq6I/2ix6KwgrYd75KsptN7Dy8/M5lUxZqeGT2ZX
 HpNmZYPkswV/s23bc2Ch1d27TYhrSEAoXKyHVRO9E7W0BiDCjT4fNoj59PN14YarrUHaJU3zwKV
 yCjPup6kVHEG/qbVFFRmE06F2YfNB7Bc=
X-Received: by 2002:a05:600c:aca:b0:3da:50b0:e959 with SMTP id
 c10-20020a05600c0aca00b003da50b0e959mr3000498wmr.138.1674821914463; 
 Fri, 27 Jan 2023 04:18:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt2oUNAZJq+5FobR160H/yJyA1IYeHfa66BRViU7wgBFNRlEOCfh5Ck9E1HhUyk3E7A8UnYeNYMibjvFe/N0go=
X-Received: by 2002:a05:600c:aca:b0:3da:50b0:e959 with SMTP id
 c10-20020a05600c0aca00b003da50b0e959mr3000494wmr.138.1674821914197; Fri, 27
 Jan 2023 04:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20230127084604.53175-1-smitterl@redhat.com>
 <87h6wcuv62.fsf@redhat.com>
In-Reply-To: <87h6wcuv62.fsf@redhat.com>
From: Sebastian Mitterle <smitterl@redhat.com>
Date: Fri, 27 Jan 2023 13:17:58 +0100
Message-ID: <CAKgrZ6+Bp9XiL9gkhGVcB7TL1+Z335H9vq5Lqpa+Q4KSjAnNeA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, clegoate@redhat.com, 
 qemu-trivial@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=smitterl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jan 27, 2023 at 11:30 AM Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Fri, Jan 27 2023, Sebastian Mitterle <smitterl@redhat.com> wrote:
>
> > Add some documentation about the zpci device and how
> > to use it with pci devices on s390x.
> >
> > Used source: Cornelia Huck's blog post
> > https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> >
> > Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
> > ---
> > v2: move section below 'Device support'
> > ---
> >  docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
> >  docs/system/target-s390x.rst     |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 docs/system/s390x/pcidevices.rst
> >
> > diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
> > new file mode 100644
> > index 0000000000..fec905d6e6
> > --- /dev/null
> > +++ b/docs/system/s390x/pcidevices.rst
> > @@ -0,0 +1,34 @@
> > +PCI devices on s390x
> > +====================
> > +
> > +PCI devices on s390x work differently than on other architectures.
>
> add "and need to be configured in a slightly different way." ?
>
> > +
> > +To start with, using a PCI device requires the additional ``zpci`` device. For example,
>
> I think the "zpci" device is not technically "required" (ISTR that we
> autogenerate it, if needed); however, you need it if you actually want
> to specify uid/fid/... what about:
>
> "Every PCI device is linked with an additional ``zpci`` device. While
> the ``zpci`` device will be autogenerated if not specified, it is
> recommended to specify it explicitly so that you can pass s390-specific
> PCI configuration."
>
> ?
>
> > +in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
> > +
> > + qemu-system-s390x ... \
> > +                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
> > +                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
> > +
> > +Here, the zpci device is joined with the PCI device via the ``target`` property.
> > +
> > +Note that we don't set bus, slot or function here for the guest as is common in other
> > +PCI implementations. Topology information is not available on s390x. Instead, ``uid``
>
> "Topology information is not available on s390x, and the guest will not
> see any of the bus/slot/function information specified on the command
> line."
>
> ?
>
> > +and ``fid`` determine how the device is presented to the guest operating system.
> > +
> > +In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI identifier, and
> > +``fid`` identifies the physical slot, i.e.::
> > +
> > + qemu-system-s390x ... \
> > +                   -device zpci,uid=7,fid=8,target=hostdev0,id=zpci1 \
> > +                   ...
> > +
> > +will be presented in the guest as::
> > +
> > + # lspci -v
> > + 0007:00:00.0 ...
> > + Physical Slot: 00000008
> > + ...
> > +
> > +Finally, note that you might have to enable the ``zpci`` feature in the cpu model in oder to use
> > +it.
>
> I'm wondering what the current state of that feature is -- is it present
> by default in the newer named models? (My original blog entry was
> written nearly five years ago ;)
>
David Hildenbrand confirmed the feature is default-on in the qemu
model since qemu 4.0 and also for the host model if supported by the
modern hardware. Therefore, I'll omit this sentence.


