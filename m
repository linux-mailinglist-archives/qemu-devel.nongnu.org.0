Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD2604A29
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 16:58:40 +0200 (CEST)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAWl-0004fr-62
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 10:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1olASa-0000k3-ML
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1olASU-0006Ps-A3
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666191252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ivRZc7kDdrLdAQykRcVW+4UfAUQjFHlW0srJiDMuSU4=;
 b=Lx6wKRAxK8pMVKzrhTcmNwrGtJKmXKOxYwkzHqKabFhmiC6yWlDrvGZTc3gnBj2rS2GduU
 xyGj301bXgJutHAkd88KeLCDPX+1SsS9FEsJ4j5Gyrc9EtmDoatvjzer29JIpTQitxtS1+
 VAN9/nVXlcCkJGlnSn0ajGPNHfUPyFU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-OCuMjl8JO163XwOUM_Fe2g-1; Wed, 19 Oct 2022 10:54:10 -0400
X-MC-Unique: OCuMjl8JO163XwOUM_Fe2g-1
Received: by mail-qv1-f72.google.com with SMTP id
 ma6-20020a0562145b0600b004b49a5037aeso9997252qvb.18
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 07:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ivRZc7kDdrLdAQykRcVW+4UfAUQjFHlW0srJiDMuSU4=;
 b=qpRk6kELUmmKWdoHvUsHqIOKnoTFQO1kI33OvtYPUvHj4xjzof7GZwrgjRoYW3zd1W
 k31bg6lWEiicunoVHtwVVWZT+cJqP6mc88orUnIeNA54yatC52kOHq0skmkj76lZK32T
 pBbhfZKXwJ1K3twNSmCmL/r6MKSNubPdrWrK1Ujx1k+47Y9EMo9p20cFydMSmjYUlkD4
 kfqL3+63RO7IGiWKDJvi2b7UB/Zq2DIXhp+rDXdFwASCl0QBlpzEl4sQQvmGtLsOqu2K
 qHFXToY1gxw9nSGkzsLCyi8MRcxZfl3cKk29LVz1uYtIWj/TcHZTqz2Q6Gw6Kjgn56Fo
 ZKEA==
X-Gm-Message-State: ACrzQf2Sc0cWMhcfQtCkya6GFbsFZS/HTctyq+BuFiD6bnQsKhlCAF9b
 8q+B9m/fDybb5GYHZCPwVVCWt1i/5ne/yzMtGQ2fq4fKstaY95mQdedbjxHBQIBGUKDHJXEhtKV
 ZQgucwxn+3ijBV8k=
X-Received: by 2002:a05:620a:400e:b0:6db:18a3:4001 with SMTP id
 h14-20020a05620a400e00b006db18a34001mr5682956qko.427.1666191250232; 
 Wed, 19 Oct 2022 07:54:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5UmnTqicK0pq6JIXRZSbroAlTowlknLq49+TaFFqvo/Q0tG5+Y056ktbdcB189e8ltoAjrQg==
X-Received: by 2002:a05:620a:400e:b0:6db:18a3:4001 with SMTP id
 h14-20020a05620a400e00b006db18a34001mr5682938qko.427.1666191249944; 
 Wed, 19 Oct 2022 07:54:09 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 x7-20020ac85387000000b0039cc944ebdasm4189236qtp.54.2022.10.19.07.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 07:54:09 -0700 (PDT)
Date: Wed, 19 Oct 2022 10:54:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH] x86-iommu: Fail flag registration of DEVIOTLB if DT not
 supported
Message-ID: <Y1APkKgg340u6qym@x1n>
References: <20221018215407.363986-1-peterx@redhat.com>
 <98df60ec-be6d-84aa-d2bd-3bb2ebf0d1a5@redhat.com>
 <Y1ADOivPsgWzOjF6@x1n>
 <1196d8bb-1a4f-06b7-f5e3-43ace827bfb0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1196d8bb-1a4f-06b7-f5e3-43ace827bfb0@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 19, 2022 at 04:12:22PM +0200, Eric Auger wrote:
> Hi Peter,
> 
> On 10/19/22 16:01, Peter Xu wrote:
> > Hi, Eric,
> >
> > On Wed, Oct 19, 2022 at 01:24:15PM +0200, Eric Auger wrote:
> >>> @@ -1484,6 +1485,13 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> >>>                     PCI_FUNC(as->devfn));
> >>>          return -EINVAL;
> >>>      }
> >>> +
> >>> +    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
> >>> +        error_setg_errno(errp, ENOTSUP,
> >>> +                         "Device-iotlb not declared support for vIOMMU");
> >> with current vhost code, vhost will then silently fallbac to UNMAP
> >> notifier registration and this will succeed. It would be nice to clarify
> >> whether the vIOMMU works with vhost in this downgraded mode (at least
> >> ats=off and device-ioltb=off)?
> > I'm slightly confused, why do we need to clarify that?
> >
> > As we have discussed, if a device with ATS capability got attached into a
> > vIOMMU context that does not support ATS, then it should just work like
> > without ATS without any warning.  Isn't this the case here?
> 
> Yes that's the theory and what should happen at baremetal level. However
> I am not sure this is still true with the intel-iommu emulation/vhost
> integration.
> Remember we always assumed vhost was supported on intel with both ats=on
> and device-iotlb=on if I am correct.
> 
> vhost/viommu integration requires unmap notifications to be properly
> sent from viommu to vhost, would it be though DEVIOTLB_UNMAP or UNMAP
> notifiers.
> Does the intel-iommu/vhost works if both ats=off and device-iotlb=off or
> ats=on and device-iotlb=off. This I am not sure. I gave it a try and I
> got some errors but maybe that's something else...

Indeed it's not working.  Obviously my test on this patch is not complete,
as I was testing with pings and even after patch applied the ping can get
lost after a few successful ones.  I should have tried harder.

Yes only device-iotlb=on & ats=on work in my case, all the rest three
combinations won't work reliably or just don't work, but I do expect they
should all work, so I definitely missed something here.  Jason, are you
aware of the problem?

Thanks,

-- 
Peter Xu


