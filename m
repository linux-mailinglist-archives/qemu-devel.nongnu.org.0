Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070995136D9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:27:14 +0200 (CEST)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk56u-0004xC-SQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nk54i-0003Rf-Rd
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nk54f-0003LO-UM
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651155892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63r8rWhR8oABNQdnk8OaypleiW++wyFQSOhF8gotzVY=;
 b=ZDPtH91Xjxap9rA2OHTCpMSUtgNNW7g9DzagomS2JBnMAGXB7L/GmxooVKrrlxJCZ2XYZf
 pSu5IMVflEuy2tO3nMCcCL86gbK5ncxuvVXw/qVNnYXPiJroyxNZV4He98djQu6+O/VCDD
 ZUGP9Kk+eSmQlysJYEUY/S7zmiOKSj4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-LhA4ebM5Pzuped3Rwz-1cA-1; Thu, 28 Apr 2022 10:24:51 -0400
X-MC-Unique: LhA4ebM5Pzuped3Rwz-1cA-1
Received: by mail-il1-f199.google.com with SMTP id
 s10-20020a92c5ca000000b002cc45dade1aso1833524ilt.20
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=63r8rWhR8oABNQdnk8OaypleiW++wyFQSOhF8gotzVY=;
 b=Hf5KWWySodA0H5k/FyJ3Wl2t45KBjO4RwAFKojyoGMPv1ri1BSTnLwau40JenMB+B8
 XzoBid1R9nATHSm5ZNrTpm30bRqKpdYLD2JlMdg0daf9lrgbKHuI1LQyYXLTMyAaJB1/
 tIFHPhhVVPbPqovAd0vofjUfDutpEnSlo2IzCJRovYZBXwdGD6JqsHwmbJETYdyE+EZD
 cxVFhqrNxfd9Jht6hmEm6EsxlZQfoixEHAB0M4YyQcdFVLqAokjcFkEHyutixP1q3L/3
 VsWqBOID0T+juMqU+tGxPqc9ZLvOwNoQCHJsMGT4W1C8J845JhK8pCQirsWBsVcDOR3h
 jELA==
X-Gm-Message-State: AOAM530QCAS6h4jBug/h/OFE9src9rImSNxCqK7hGW+Ay2Zz1ezWXc6R
 j8aAciiTZQ8/kHTfCHKt/9GcWIIJ/XElZ+o4SxYEhtDw4Nv27Xv0KBiczf1y7hF0yfWEXRjTcGI
 E/ktHengiLW4v0jQ=
X-Received: by 2002:a5d:8b8f:0:b0:649:ec6d:98e9 with SMTP id
 p15-20020a5d8b8f000000b00649ec6d98e9mr14028108iol.30.1651155890674; 
 Thu, 28 Apr 2022 07:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2U1d0fyvz8Pa/Eh29/m4hiXQ+rLKTZwJ9R/ROlmhzHrrR87J6y6aBkBIOBBO7Fy6bjKArnw==
X-Received: by 2002:a5d:8b8f:0:b0:649:ec6d:98e9 with SMTP id
 p15-20020a5d8b8f000000b00649ec6d98e9mr14028093iol.30.1651155890410; 
 Thu, 28 Apr 2022 07:24:50 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v1-20020a6bac01000000b006575e6d99c7sm12427ioe.29.2022.04.28.07.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:24:50 -0700 (PDT)
Date: Thu, 28 Apr 2022 08:24:48 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <20220428082448.318385ed.alex.williamson@redhat.com>
In-Reply-To: <BN9PR11MB5276189A2A8EACFBF75B22238CFD9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220422160943.6ff4f330.alex.williamson@redhat.com>
 <YmZzhohO81z1PVKS@redhat.com>
 <20220425083748.3465c50f.alex.williamson@redhat.com>
 <BN9PR11MB5276F549912E03553411736D8CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220426102159.5ece8c1f.alex.williamson@redhat.com>
 <BN9PR11MB5276189A2A8EACFBF75B22238CFD9@BN9PR11MB5276.namprd11.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, Laine Stump <laine@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Apr 2022 03:21:45 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Wednesday, April 27, 2022 12:22 AM  
> > > >
> > > > My expectation would be that libvirt uses:
> > > >
> > > >  -object iommufd,id=iommufd0,fd=NNN
> > > >  -device vfio-pci,fd=MMM,iommufd=iommufd0
> > > >
> > > > Whereas simple QEMU command line would be:
> > > >
> > > >  -object iommufd,id=iommufd0
> > > >  -device vfio-pci,iommufd=iommufd0,host=0000:02:00.0
> > > >
> > > > The iommufd object would open /dev/iommufd itself.  Creating an
> > > > implicit iommufd object is someone problematic because one of the
> > > > things I forgot to highlight in my previous description is that the
> > > > iommufd object is meant to be shared across not only various vfio
> > > > devices (platform, ccw, ap, nvme, etc), but also across subsystems, ex.
> > > > vdpa.  
> > >
> > > Out of curiosity - in concept one iommufd is sufficient to support all
> > > ioas requirements across subsystems while having multiple iommufd's
> > > instead lose the benefit of centralized accounting. The latter will also
> > > cause some trouble when we start virtualizing ENQCMD which requires
> > > VM-wide PASID virtualization thus further needs to share that
> > > information across iommufd's. Not unsolvable but really no gain by
> > > adding such complexity. So I'm curious whether Qemu provide
> > > a way to restrict that certain object type can only have one instance
> > > to discourage such multi-iommufd attempt?  
> > 
> > I don't see any reason for QEMU to restrict iommufd objects.  The QEMU
> > philosophy seems to be to let users create whatever configuration they
> > want.  For libvirt though, the assumption would be that a single
> > iommufd object can be used across subsystems, so libvirt would never
> > automatically create multiple objects.  
> 
> I like the flexibility what the objection approach gives in your proposal.
> But with the said complexity in mind (with no foreseen benefit), I wonder

What's the actual complexity?  Front-end/backend splits are very common
in QEMU.  We're making the object connection via name, why is it
significantly more complicated to allow multiple iommufd objects?  On
the contrary, it seems to me that we'd need to go out of our way to add
code to block multiple iommufd objects.

> whether an alternative approach which treats iommufd as a global
> property instead of an object is acceptable in Qemu, i.e.:
> 
> -iommufd on/off
> -device vfio-pci,iommufd,[fd=MMM/host=0000:02:00.0]
> 
> All devices with iommufd specified then implicitly share a single iommufd
> object within Qemu.

QEMU requires key-value pairs AFAIK, so the above doesn't work, then
we're just back to the iommufd=on/off.
 
> This still allows vfio devices to be specified via fd but just requires Libvirt
> to grant file permission on /dev/iommu. Is it a worthwhile tradeoff to be
> considered or just not a typical way in Qemu philosophy e.g. any object
> associated with a device must be explicitly specified?

Avoiding QEMU opening files was a significant focus of my alternate
proposal.  Also note that we must be able to support hotplug, so we
need to be able to dynamically add and remove the iommufd object, I
don't see that a global property allows for that.  Implicit
associations of devices to shared resources doesn't seem particularly
desirable to me.  Thanks,

Alex


