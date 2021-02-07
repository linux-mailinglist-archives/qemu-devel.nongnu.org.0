Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E43124D1
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 15:48:46 +0100 (CET)
Received: from localhost ([::1]:52512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8lMj-0003pm-4Q
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 09:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l8lLV-0003PF-8i
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 09:47:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l8lLQ-0001jD-OZ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 09:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612709241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1N+ssVaxn9jqBD2d3tWHHzxF/a6CzSvM8lDNZZ3lAc=;
 b=SaLwjnWOULWhZxzwBVxWn/JInQ3t6hczqsl+o7m8Q9J05FBvO5w/S6YawnvPFWwbypuXWb
 5dzK9FbpsJECriXCSrYU7NLSRUs9OBAkPnMFMY85nI8TMyZq0mb/Vlsyu3SUeYFCO2pWYE
 Vwezppd9gpcaBZgN7f+rcNdWatHLwks=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-HqOTJVhHN_S0R1eDOnYFYg-1; Sun, 07 Feb 2021 09:47:19 -0500
X-MC-Unique: HqOTJVhHN_S0R1eDOnYFYg-1
Received: by mail-qk1-f200.google.com with SMTP id o16so10519439qkj.15
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 06:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q1N+ssVaxn9jqBD2d3tWHHzxF/a6CzSvM8lDNZZ3lAc=;
 b=kaaGAGNf28aArJallYRqxMl2XpJ7iaBKnP/tL0jmnHMucx5AK2Ful6idEW1dgQspVX
 90tROPmVKDkMGO+D/e1SA4hSTcQ1strkA7SSnOvjRSC/ekKFS5bq1LxuDxlzQXYxP98m
 xBJNTqX1UpDRL8TLd43UEJhhnu6fKZhIX83F8Z6PlkjwgW+6/y8OAkCyvQXVfwFsc7k6
 cGlwJ4PbTE5xbKi8obKdaYvRgAd5MbgshvrQ4svJkwcoyTV/XgZTUe6kJubdePJUROe8
 yhU1X7LuXDeavb9xFB756YZ1vKkCIIL8+n8/0+0I5hL7cDApL+Fb7NHta8tS+umURj4C
 7VyA==
X-Gm-Message-State: AOAM531VcV7bfLDAam5E8mU74LtTD/4GT4eJjWPjtjzVxNG20BEtwMOT
 BPMq4CMu7f6tHzGRdz0mI0QqDd2OIyi/agoG25pKq2w6QQ8NPen9k3GaPTvXPQRNLDjuUkBlSry
 eoEIAGb9mEa4kRYk=
X-Received: by 2002:a37:7304:: with SMTP id o4mr13254654qkc.140.1612709238899; 
 Sun, 07 Feb 2021 06:47:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSPieFHqWyemJkIVGBfyXsdHQuxhh76HPML2GuJFUNvC/s3d0kne5DdOu9rb6hnTO8hWafYQ==
X-Received: by 2002:a37:7304:: with SMTP id o4mr13254637qkc.140.1612709238666; 
 Sun, 07 Feb 2021 06:47:18 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id 62sm14856682qkn.136.2021.02.07.06.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 06:47:17 -0800 (PST)
Date: Sun, 7 Feb 2021 09:47:15 -0500
From: Peter Xu <peterx@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Message-ID: <20210207144715.GG3195@xz-x1>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <MWHPR11MB1886DACA066190C94FD2C27F8CB09@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1886DACA066190C94FD2C27F8CB09@MWHPR11MB1886.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Auger Eric <eric.auger@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Kevin,

On Sun, Feb 07, 2021 at 09:04:55AM +0000, Tian, Kevin wrote:
> > From: Peter Xu
> > Sent: Friday, February 5, 2021 11:31 PM
> > 
> > > >
> > > >
> > > >> or virtio-iommu
> > > >> since dev-iotlb (or PCIe ATS)
> > > >
> > > >
> > > > We may need to add this in the future.
> > > added Jean-Philippe in CC
> > 
> > So that's the part I'm unsure about..  Since everybody is cced so maybe good
> > time to ask. :)
> > 
> > The thing is I'm still not clear on whether dev-iotlb is useful for a full
> > emulation environment and how that should differ from a normal iotlb, since
> > after all normal iotlb will be attached with device information too.
> 
> dev-iotlb is useful in two manners. First, it's a functional prerequisite for
> supporting I/O page faults.

Is this also a hard requirement for virtio-iommu, which is not a real hardware
after all?

> Second, it has performance benefit as you don't
> need to contend the lock of global iotlb.

Hmm.. are you talking about e.g. vt-d driver or virtio-iommu?

Assuming it's about vt-d, qi_flush_dev_iotlb() will still call qi_submit_sync()
and taking the same global QI lock, as I see it, or I could be wrong somewhere.
I don't see where dev-iotlb has a standalone channel for delivery.

For virtio-iommu, we haven't defined dev-iotlb, right?  Sorry I missed things
when I completely didn't follow virtio-iommu recently - let's say if
virtio-iommu in the future can support per-dev dev-iotlb queue so it doesn't
need a global lock, what if we make it still per-device but still delivering
iotlb message?  Again, it's still a bit unclear to me why a full emulation
iommu would need that definition of "iotlb" and "dev-iotlb".

> 
> > 
> > For real hardwares, they make sense because they ask for two things: iotlb is
> > for IOMMU, but dev-iotlb is for the device cache.  For emulation
> > environment
> > (virtio-iommu is the case) do we really need that complexity?
> > 
> > Note that even if there're assigned devices under virtio-iommu in the future,
> > we can still isolate that and iiuc we can easily convert an iotlb (from
> > virtio-iommu) into a hardware IOMMU dev-iotlb no matter what type of
> > IOMMU is
> > underneath the vIOMMU.
> > 
> 
> Didn't get this point. Hardware dev-iotlb is updated by hardware (between
> the device and the IOMMU). How could software convert a virtual iotlb
> entry into hardware dev-iotlb?

I mean if virtio-iommu must be run in a guest, then we can trap that message
first, right?  If there're assigned device in the guest, we must convert that
invalidation to whatever message required for the host, that seems to not
require the virtio-iommu to have dev-iotlb knowledge, still?

Thanks,

-- 
Peter Xu


