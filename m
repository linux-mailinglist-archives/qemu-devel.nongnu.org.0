Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D442B4D0A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:33:26 +0100 (CET)
Received: from localhost ([::1]:53408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keiNY-0005cr-SZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1keiKr-0004SX-H1
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1keiKm-0002PU-PF
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605547831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yf1r8FftXcdY4q8lihYvUuMvv3ADJI20ZN4OhnoeK6Q=;
 b=d8rySZaTJpvMhnErbp/4cBXdn67/hnHVHB4P42q6ABp/BSj/xqcEDpAp94Odz90nG5yfPP
 n6NQhC3bZuzGMi1X63zc9DQ+TUNCcu4Lz+HvVtZhblsMoLgTsARIDt1RiVbUZQ7/ql6xdF
 a69n3IPMpjYMzXknfclm+QRiXTThc6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-KaBqMsJZO1Gaougn31l2Kw-1; Mon, 16 Nov 2020 12:30:29 -0500
X-MC-Unique: KaBqMsJZO1Gaougn31l2Kw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36DD61075629;
 Mon, 16 Nov 2020 17:30:27 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBF995C1CF;
 Mon, 16 Nov 2020 17:30:16 +0000 (UTC)
Date: Mon, 16 Nov 2020 10:30:15 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116103015.5dc20ab2@w520.home>
In-Reply-To: <20201116145226.57139a21.cohuck@redhat.com>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
 <20201111124853.5a7fa359.cohuck@redhat.com>
 <20201111151449.GC1421166@stefanha-x1.localdomain>
 <20201111163543.2839e4c7.cohuck@redhat.com>
 <20201116110251.GC96297@stefanha-x1.localdomain>
 <20201116145226.57139a21.cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 14:52:26 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, 16 Nov 2020 11:02:51 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> > On Wed, Nov 11, 2020 at 04:35:43PM +0100, Cornelia Huck wrote:  
> > > On Wed, 11 Nov 2020 15:14:49 +0000
> > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >     
> > > > On Wed, Nov 11, 2020 at 12:48:53PM +0100, Cornelia Huck wrote:    
> > > > > On Tue, 10 Nov 2020 13:14:04 -0700
> > > > > Alex Williamson <alex.williamson@redhat.com> wrote:      
> > > > > > On Tue, 10 Nov 2020 09:53:49 +0000
> > > > > > Stefan Hajnoczi <stefanha@redhat.com> wrote:      
> > > > >       
> > > > > > > Device models supported by an mdev driver and their details can be read from
> > > > > > > the migration_info.json attr. Each mdev type supports one device model. If a
> > > > > > > parent device supports multiple device models then each device model has an
> > > > > > > mdev type. There may be multiple mdev types for a single device model when they
> > > > > > > offer different migration parameters such as resource capacity or feature
> > > > > > > availability.
> > > > > > > 
> > > > > > > For example, a graphics card that supports 4 GB and 8 GB device instances would
> > > > > > > provide gfx-4GB and gfx-8GB mdev types with memory=4096 and memory=8192
> > > > > > > migration parameters, respectively.        
> > > > > > 
> > > > > > 
> > > > > > I think this example could be expanded for clarity.  I think this is
> > > > > > suggesting we have mdev_types of gfx-4GB and gfx-8GB, which each
> > > > > > implement some common device model, ie. com.gfx/GPU, where the
> > > > > > migration parameter 'memory' for each defaults to a value matching the
> > > > > > type name.  But it seems like this can also lead to some combinatorial
> > > > > > challenges for management tools if these parameters are writable.  For
> > > > > > example, should a management tool create a gfx-4GB device and change to
> > > > > > memory parameter to 8192 or a gfx-8GB device with the default parameter?      
> > > > > 
> > > > > I would expect that the mdev types need to match in the first place.
> > > > > What role would the memory= parameter play, then? Allowing gfx-4GB to
> > > > > have memory=8192 feels wrong to me.      
> > > > 
> > > > Yes, I expected these mdev types to only accept a fixed "memory" value,
> > > > but there's nothing stopping a driver author from making "memory" accept
> > > > any value.    
> > > 
> > > I'm wondering how useful the memory parameter is, then. The layer
> > > checking for compatibility can filter out inconsistent settings, but
> > > why would we need to express something that is already implied in the
> > > mdev type separately?    
> > 
> > To avoid tying device instances to specific mdev types. An mdev type is
> > a device implementation, but the goal is to enable migration between
> > device implementations (new/old or completely different
> > implementations).
> > 
> > Imagine a new physical device that now offers variable memory because
> > users found the static mdev types too constraining.  How do you migrate
> > back and forth between new and old physical devices if the migration
> > parameters don't describe the memory size? Migration parameters make it
> > possible. Without them the management tool needs to hard-code knowledge
> > of specific mdev types that support migration.  
> 
> But doesn't the management tool *still* need to keep hardcoded
> information about what the value of that memory parameter was for an
> existing mdev type? If we have gfx-variable with a memory parameter,
> fine; but if the target is supposed to accept a gfx-4GB device, it
> should simply instantiate a gfx-4GB device.
> 
> I'm getting a bit worried about the complexity of the checking that
> management software is supposed to perform. Is it really that bad to
> restrict the models to a few, well-defined ones? Especially in the mdev
> case, where we have control about what is getting instantiated?

This is exactly what I was noting with the combinatorial challenges of
the management tool.  If a vendor chooses to use a generic base device
model which they modify with parameters to match an assortment of mdev
types, then management tools will need to match every mdev type
implementing that device model to determine if compatible parameters
exist.  OTOH, the vendor could choose to create a device model that
specifically describes a single configuration of known parameters.

For example, mdev type gfx-4GB might be a device model com.gfx/GPU with
a fixed memory parameter of 4GB or it could be a device model
com.gfx/GPU-4G with no additional parameter.  The hard part is when the
vendor offers an mdev type gfx-varGB with device model com.gfx/GPU and
available memory options of 1GB, 2GB, 4GB, 8GB.  At that point a
management tool might decide to create a gfx-varGB device instance and
tune the memory parameter or create a gfx-4GB instance, either would be
correct and we've expressed no preference for one or the other.  Thanks,

Alex


