Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FE510940
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:41:22 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njR3p-0005nu-8h
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1njQnk-0003Xt-PC
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1njQnh-0006nX-PT
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651001080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8JQX3e1SHEkXg04Hw14Z/O/2neriC0qHwfrioTaaCGE=;
 b=L3xgnurE541EMjAYDAVbon58nPEpvvUgpTLFdbRKlklTYaYO2tP97gMl/etL90FxRUQXVD
 tlsnWimw/KDjfiBZRm0XbxKENDl4Q4aamWWR7A3n1nMVKkaZvh4o8LYlXiIZzkI/P7iUfC
 hlVQKK4oB0wqwAe7HJP8S26S9hB5D1c=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-EFJrpx9WMze9FwCkdyk-yw-1; Tue, 26 Apr 2022 15:24:39 -0400
X-MC-Unique: EFJrpx9WMze9FwCkdyk-yw-1
Received: by mail-io1-f69.google.com with SMTP id
 k20-20020a5e9314000000b00649d55ffa67so15105758iom.20
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 12:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=8JQX3e1SHEkXg04Hw14Z/O/2neriC0qHwfrioTaaCGE=;
 b=VHMaU1RiB6NJ59bgRC826FvKQ3pVDaNRTRlAUncMjYXkh4emokY1q01tztPOz7FjYA
 i7gTnAa6RYKgyMbDa271sbZOLN6F4e6LlxvRxZZfvBV+xeyc1PDtQJkWecO4A7JED7AP
 h82MLzjFm4inBFrcRpQWEcOKmw1t7MNPjWB4xZ1K69m7E97Ylj8XwQoIeUNb/77oXDg5
 Ffozyf+5ji31zxHXHe7MBZ8UQ34ETU2Zi4HDHOAQsJiP2jab+1AizlBL9QNkJcnMvY3E
 eBusb3MXsI7H6qLGQB2di+X0j15kO/FnW/IBQWtVBxJA5y/Sk9cc3AlllJxr/vRAK/UW
 Jxng==
X-Gm-Message-State: AOAM531l2mNI3NAWLaSOhebGeTXhQpdL1SBvKQb77FpyaFqZi9YLLuRd
 d3J3LN6np+tH/6ndGN6ovZkaqQ7tgKq60Zso9NY4IXqKyJVIbQ7sRnfOXScDkGv14hOCHXqC4jv
 m7lROYmD/5ZAkF8k=
X-Received: by 2002:a05:6638:329b:b0:328:96c9:771d with SMTP id
 f27-20020a056638329b00b0032896c9771dmr10716301jav.48.1651001078551; 
 Tue, 26 Apr 2022 12:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8zE5yOmVcACo/dOrg9YfDP/mTfj5ZZwrixzWX8n6YYyIdlMbucE34uD0EiuuwCs8A/CpZoQ==
X-Received: by 2002:a05:6638:329b:b0:328:96c9:771d with SMTP id
 f27-20020a056638329b00b0032896c9771dmr10716278jav.48.1651001078339; 
 Tue, 26 Apr 2022 12:24:38 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y126-20020a6bc884000000b00657ae00d56bsm1075463iof.48.2022.04.26.12.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 12:24:37 -0700 (PDT)
Date: Tue, 26 Apr 2022 13:24:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <20220426132435.6ecddd1d.alex.williamson@redhat.com>
In-Reply-To: <20220426164217.GR2125828@nvidia.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220422160943.6ff4f330.alex.williamson@redhat.com>
 <YmZzhohO81z1PVKS@redhat.com>
 <20220425083748.3465c50f.alex.williamson@redhat.com>
 <BN9PR11MB5276F549912E03553411736D8CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220426102159.5ece8c1f.alex.williamson@redhat.com>
 <20220426164217.GR2125828@nvidia.com>
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
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "Daniel P. =?UTF-8?B?QmVycmFu?= =?UTF-8?B?Z8Op?=" <berrange@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, Laine Stump <laine@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 13:42:17 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Apr 26, 2022 at 10:21:59AM -0600, Alex Williamson wrote:
> > We also need to be able to advise libvirt as to how each iommufd object
> > or user of that object factors into the VM locked memory requirement.
> > When used by vfio-pci, we're only mapping VM RAM, so we'd ask libvirt
> > to set the locked memory limit to the size of VM RAM per iommufd,
> > regardless of the number of devices using a given iommufd.  However, I
> > don't know if all users of iommufd will be exclusively mapping VM RAM.
> > Combinations of devices where some map VM RAM and others map QEMU
> > buffer space could still require some incremental increase per device
> > (I'm not sure if vfio-nvme is such a device).  It seems like heuristics
> > will still be involved even after iommufd solves the per-device
> > vfio-pci locked memory limit issue.  Thanks,  
> 
> If the model is to pass the FD, how about we put a limit on the FD
> itself instead of abusing the locked memory limit?
> 
> We could have a no-way-out ioctl that directly limits the # of PFNs
> covered by iopt_pages inside an iommufd.

FD passing would likely only be the standard for libvirt invoked VMs.
The QEMU vfio-pci device would still parse a host= or sysfsdev= option
when invoked by mortals and associate to use the legacy vfio group
interface or the new vfio device interface based on whether an iommufd
is specified.

Does that rule out your suggestion?  I don't know, please reveal more
about the mechanics of putting a limit on the FD itself and this
no-way-out ioctl.  The latter name suggests to me that I should also
note that we need to support memory hotplug with these devices.  Thanks,

Alex


