Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A324AE59
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 07:17:33 +0200 (CEST)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8cx9-0003m7-O6
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 01:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smooney@redhat.com>)
 id 1k8cwJ-0003N9-Gc
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 01:16:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46338
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <smooney@redhat.com>)
 id 1k8cwG-0007k6-Bz
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 01:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597900594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YBmMlDK08ygRLxBOtV4fn8Ya8+7txjXr1BlgEUxCss=;
 b=JHjokFZHYKQzd5z9qp/gu/ZdXLflKomFftXolJ9rSMZa6mZV7dAizgb83ObMvebEggMQAJ
 oF7ikEudiSbfs8PMUWpZw1B49OiyWMZWLKd9AdXEvS1rYJETynrQUiJDMw6xv6bg5Zi4gx
 J/VfefTzWcKAH1MfRKRC5QFC4zHw4g4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-PM0W59DFPKeLZ0eCd4Fm9A-1; Thu, 20 Aug 2020 01:16:33 -0400
X-MC-Unique: PM0W59DFPKeLZ0eCd4Fm9A-1
Received: by mail-ej1-f70.google.com with SMTP id bx27so416522ejc.15
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 22:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YBmMlDK08ygRLxBOtV4fn8Ya8+7txjXr1BlgEUxCss=;
 b=pSipZccnthi9G58Tg1LuLXUncNZxJszzNgi/Z4chXUwAdWyp9Sk442Xo7ymxqBUJns
 wfKfLGKFGAWsXEPUVEPc50BZZDzhY4QGn8Xyaoc1LXSXfpiRiuDgXorczvOgREWQDBgo
 ux2Fx95ess0P9PUz4z6Y/U5hc7gbTlxfJAgvMjKSJMVmCoOLzzB3+XQKZEHvCvIRWIxC
 SZEZBqf4twDEDBMqATNUGtM/DtpHCUmRPapOqdAo9MryLUvbW2Yfye7Fxpf6N0pu8F22
 kzUxX9ipDuLHV1IZgqWv294YpJFLbLAZrEnzVxc5EMNJto7ojqhs4FLopbOD7rQP5Cp8
 6CKw==
X-Gm-Message-State: AOAM532dh/wFc0i/AyvQUVHSm/Xe+7eTC9Elz/BBnzOUxCcYtffUp2DH
 mWj1DGxJxju7+MeTCyQT+NBdFqJLZ9gfQDhg55xmYIAnUPWd0Q2mkKx3fBFq90TZlV/NlHG8rPo
 3M1BYTgp9gSg96TI=
X-Received: by 2002:a17:906:960a:: with SMTP id
 s10mr1623662ejx.60.1597900591861; 
 Wed, 19 Aug 2020 22:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLVGyxG1fhJkbUY7K9ahB2oumCnCBxXdHKmSC3so6VH3GxguXSWKeiO37z2o8foD+A/q4xmQ==
X-Received: by 2002:a17:906:960a:: with SMTP id
 s10mr1623641ejx.60.1597900591553; 
 Wed, 19 Aug 2020 22:16:31 -0700 (PDT)
Received: from pop-os ([51.37.51.98])
 by smtp.gmail.com with ESMTPSA id bd13sm602373edb.38.2020.08.19.22.16.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 22:16:30 -0700 (PDT)
Message-ID: <da140e6d262632e2fb707f69f220915748d25d35.camel@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
From: Sean Mooney <smooney@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Date: Thu, 20 Aug 2020 06:16:28 +0100
In-Reply-To: <20200820040116.GB24121@joy-OptiPlex-7040>
References: <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <242591bb809b68c618f62fdc93d4f8ae7b146b6d.camel@redhat.com>
 <20200820040116.GB24121@joy-OptiPlex-7040>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2
Mime-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=smooney@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=smooney@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 01:16:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, eskultet@redhat.com,
 intel-gvt-dev@lists.freedesktop.org,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-08-20 at 12:01 +0800, Yan Zhao wrote:
> On Thu, Aug 20, 2020 at 02:29:07AM +0100, Sean Mooney wrote:
> > On Thu, 2020-08-20 at 08:39 +0800, Yan Zhao wrote:
> > > On Tue, Aug 18, 2020 at 11:36:52AM +0200, Cornelia Huck wrote:
> > > > On Tue, 18 Aug 2020 10:16:28 +0100
> > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > 
> > > > > On Tue, Aug 18, 2020 at 05:01:51PM +0800, Jason Wang wrote:
> > > > > >    On 2020/8/18 下午4:55, Daniel P. Berrangé wrote:
> > > > > > 
> > > > > >  On Tue, Aug 18, 2020 at 11:24:30AM +0800, Jason Wang wrote:
> > > > > > 
> > > > > >  On 2020/8/14 下午1:16, Yan Zhao wrote:
> > > > > > 
> > > > > >  On Thu, Aug 13, 2020 at 12:24:50PM +0800, Jason Wang wrote:
> > > > > > 
> > > > > >  On 2020/8/10 下午3:46, Yan Zhao wrote:  
> > > > > >  we actually can also retrieve the same information through sysfs, .e.g
> > > > > > 
> > > > > >  |- [path to device]
> > > > > >     |--- migration
> > > > > >     |     |--- self
> > > > > >     |     |   |---device_api
> > > > > >     |    |   |---mdev_type
> > > > > >     |    |   |---software_version
> > > > > >     |    |   |---device_id
> > > > > >     |    |   |---aggregator
> > > > > >     |     |--- compatible
> > > > > >     |     |   |---device_api
> > > > > >     |    |   |---mdev_type
> > > > > >     |    |   |---software_version
> > > > > >     |    |   |---device_id
> > > > > >     |    |   |---aggregator
> > > > > > 
> > > > > > 
> > > > > >  Yes but:
> > > > > > 
> > > > > >  - You need one file per attribute (one syscall for one attribute)
> > > > > >  - Attribute is coupled with kobject
> > > > 
> > > > Is that really that bad? You have the device with an embedded kobject
> > > > anyway, and you can just put things into an attribute group?
> > > > 
> > > > [Also, I think that self/compatible split in the example makes things
> > > > needlessly complex. Shouldn't semantic versioning and matching already
> > > > cover nearly everything? I would expect very few cases that are more
> > > > complex than that. Maybe the aggregation stuff, but I don't think we
> > > > need that self/compatible split for that, either.]
> > > 
> > > Hi Cornelia,
> > > 
> > > The reason I want to declare compatible list of attributes is that
> > > sometimes it's not a simple 1:1 matching of source attributes and target attributes
> > > as I demonstrated below,
> > > source mdev of (mdev_type i915-GVTg_V5_2 + aggregator 1) is compatible to
> > > target mdev of (mdev_type i915-GVTg_V5_4 + aggregator 2),
> > >                (mdev_type i915-GVTg_V5_8 + aggregator 4)
> > 
> > the way you are doing the nameing is till really confusing by the way
> > if this has not already been merged in the kernel can you chagne the mdev
> > so that mdev_type i915-GVTg_V5_2 is 2 of mdev_type i915-GVTg_V5_1 instead of half the device
> > 
> > currently you need to deived the aggratod by the number at the end of the mdev type to figure out
> > how much of the phsicial device is being used with is a very unfridly api convention
> > 
> > the way aggrator are being proposed in general is not really someting i like but i thin this at least
> > is something that should be able to correct.
> > 
> > with the complexity in the mdev type name + aggrator i suspect that this will never be support
> > in openstack nova directly requireing integration via cyborg unless we can pre partion the
> > device in to mdevs staicaly and just ignore this.
> > 
> > this is way to vendor sepecif to integrate into something like openstack in nova unless we can guarentee
> > taht how aggreator work will be portable across vendors genericly.
> > 
> > > 
> > > and aggragator may be just one of such examples that 1:1 matching does not
> > > fit.
> > 
> > for openstack nova i dont see us support anything beyond the 1:1 case where the mdev type does not change.
> > 
> 
> hi Sean,
> I understand it's hard for openstack. but 1:N is always meaningful.
> e.g.
> if source device 1 has cap A, it is compatible to
> device 2: cap A,
> device 3: cap A+B,
> device 4: cap A+B+C
> ....
> to allow openstack to detect it correctly, in compatible list of
> device 2, we would say compatible cap is A;
> device 3, compatible cap is A or A+B;
> device 4, compatible cap is A or A+B, or A+B+C;
> 
> then if openstack finds device A's self cap A is contained in compatible
> cap of device 2/3/4, it can migrate device 1 to device 2,3,4.
> 
> conversely,  device 1's compatible cap is only A,
> so it is able to migrate device 2 to device 1, and it is not able to
> migrate device 3/4 to device 1.

yes we build the palcement servce aroudn the idea of capablites as traits on resocue providres.
which is why i originally asked if we coudl model compatibality with feature flags

we can seaislyt model deivce as aupport A, A+B or  A+B+C
and then select hosts and evice based on that but

the list of compatable deivce you are propsoeing hide this feature infomation which whould be what we are matching on.

give me a lset of feature you want and list ting the feature avaiable on each device allow highre level ocestation to
easily match the request to a host that can fulllfile it btu thave a set of other compatihble device does not help with
that

so if a simple list a capabliteis can be advertiese d and if we know tha two dievce with the same capablity are
intercahangebale that is workabout i suspect that will not be the case however and it would onely work within a familay
of mdevs that are closely related.  which i think agian is an argument for not changeing the mdev type and at least
intially only look at migatreion where the mdev type doee not change initally. 

> 
> Thanks
> Yan
> 
> > i woudl really prefer if there was just one mdev type that repsented the minimal allcatable unit and the
> > aggragaotr where used to create compostions of that. i.e instad of i915-GVTg_V5_2 beign half the device,
> > have 1 mdev type i915-GVTg and if the device support 8 of them then we can aggrate 4 of i915-GVTg
> > 
> > if you want to have muplie mdev type to model the different amoutn of the resouce e.g. i915-GVTg_small i915-
> > GVTg_large
> > that is totlaly fine too or even i915-GVTg_4 indcating it sis 4 of i915-GVTg
> > 
> > failing that i would just expose an mdev type per composable resouce and allow us to compose them a the user level
> > with
> > some other construct mudeling a attament to the device. e.g. create composed mdev or somethig that is an aggreateion
> > of
> > multiple sub resouces each of which is an mdev. so kind of like how bond port work. we would create an mdev for each
> > of
> > the sub resouces and then create a bond or aggrated mdev by reference the other mdevs by uuid then attach only the
> > aggreated mdev to the instance.
> > 
> > the current aggrator syntax and sematic however make me rather uncofrotable when i think about orchestating vms on
> > top
> > of it even to boot them let alone migrate them.
> > > 
> > > So, we explicitly list out self/compatible attributes, and management
> > > tools only need to check if self attributes is contained compatible
> > > attributes.
> > > 
> > > or do you mean only compatible list is enough, and the management tools
> > > need to find out self list by themselves?
> > > But I think provide a self list is easier for management tools.
> > > 
> > > Thanks
> > > Yan
> > > 
> 
> 


