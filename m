Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C2D24BE63
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 15:25:32 +0200 (CEST)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8kZO-0005dw-NQ
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 09:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smooney@redhat.com>)
 id 1k8kYb-00058l-Qb
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 09:24:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57249
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <smooney@redhat.com>)
 id 1k8kYY-00018C-FD
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 09:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597929877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n48rhMjZ4Z/v3a5NZW5TeQMUSzs2EVHjTw27OemSUbE=;
 b=OUqWKZucdiJAZkPQCUS8ZhacEuwp2pYKNhQ43IEen1Ke3ltbQ5ZbQB8cT/0DlojledNhTY
 3gJU+PmgdysxpfBhIMk4WDv2Ce0HHe7CQ8pZESN2xTu3E2cMJ6lFsQsEXQ/LsEhpgRRlql
 Co7CUslD8nwLNa/YfUo1lp9TJuEBpBk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-PH-EtaQqPVmPR5IhEraoqA-1; Thu, 20 Aug 2020 09:24:35 -0400
X-MC-Unique: PH-EtaQqPVmPR5IhEraoqA-1
Received: by mail-wr1-f71.google.com with SMTP id t12so662639wrp.0
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 06:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n48rhMjZ4Z/v3a5NZW5TeQMUSzs2EVHjTw27OemSUbE=;
 b=dHYhrvfQvIw5sykqi760RbGDlFhSvgx+8oXM/ytHsaiFysqLpdWz/ftKV7IynGjyFr
 Bmg8mUVQOeKAf4XnHLpqW7QJbDE0ZV2ltEt4/g0d6bdhy4mmUe4/0EyvDIaS5n1RwVbM
 y8eVBixHPudk0Kq443fDC0/O+CJWB9gPT+vGggVnM/jTsQVtH+X3KarqIDld3kRv37RB
 DAwYU3XdL2kOtVPDpt/Uz1wOT8iJjtddY0hAEtOaIHr0gm6glSwJDWybfe4Z7sIep+om
 HVNmAEzaRhzMEqEQCibdPKWQT8xyOouwHVVU1KE5b5fLYvWf1AXVwfmBg7iFsolVCIGp
 mulQ==
X-Gm-Message-State: AOAM530osdcRr9L1nDpgfAftpHt85f1gVE4PEJpv+xCnzcN36zjV+N36
 K6fvFs9WIaETNbBCwfjPZmcjjQDnXuwUHiOcHdbplOnGlsvGWE2Puv7PWkOOWChPyfRPYvjnjZC
 KLKX28H49CKXsvEU=
X-Received: by 2002:adf:bc4b:: with SMTP id a11mr3038877wrh.381.1597929870959; 
 Thu, 20 Aug 2020 06:24:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywnJ34qAWHYR37Eqe9Veo6zlTBnj0hWN23IhsoxGgd9bAQmvHs83pqgk2Or1JgJeUyayTBDQ==
X-Received: by 2002:adf:bc4b:: with SMTP id a11mr3038825wrh.381.1597929870502; 
 Thu, 20 Aug 2020 06:24:30 -0700 (PDT)
Received: from pop-os ([51.37.51.98])
 by smtp.gmail.com with ESMTPSA id k15sm4144059wrp.43.2020.08.20.06.24.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Aug 2020 06:24:27 -0700 (PDT)
Message-ID: <47d216330e10152f0f5d27421da60a7b1c52e5f0.camel@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
From: Sean Mooney <smooney@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Date: Thu, 20 Aug 2020 14:24:26 +0100
In-Reply-To: <20200820062725.GB24997@joy-OptiPlex-7040>
References: <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <242591bb809b68c618f62fdc93d4f8ae7b146b6d.camel@redhat.com>
 <20200820040116.GB24121@joy-OptiPlex-7040>
 <da140e6d262632e2fb707f69f220915748d25d35.camel@redhat.com>
 <20200820062725.GB24997@joy-OptiPlex-7040>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2
Mime-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=smooney@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=smooney@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 03:03:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel =?ISO-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-08-20 at 14:27 +0800, Yan Zhao wrote:
> On Thu, Aug 20, 2020 at 06:16:28AM +0100, Sean Mooney wrote:
> > On Thu, 2020-08-20 at 12:01 +0800, Yan Zhao wrote:
> > > On Thu, Aug 20, 2020 at 02:29:07AM +0100, Sean Mooney wrote:
> > > > On Thu, 2020-08-20 at 08:39 +0800, Yan Zhao wrote:
> > > > > On Tue, Aug 18, 2020 at 11:36:52AM +0200, Cornelia Huck wrote:
> > > > > > On Tue, 18 Aug 2020 10:16:28 +0100
> > > > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > > 
> > > > > > > On Tue, Aug 18, 2020 at 05:01:51PM +0800, Jason Wang wrote:
> > > > > > > >    On 2020/8/18 下午4:55, Daniel P. Berrangé wrote:
> > > > > > > > 
> > > > > > > >  On Tue, Aug 18, 2020 at 11:24:30AM +0800, Jason Wang wrote:
> > > > > > > > 
> > > > > > > >  On 2020/8/14 下午1:16, Yan Zhao wrote:
> > > > > > > > 
> > > > > > > >  On Thu, Aug 13, 2020 at 12:24:50PM +0800, Jason Wang wrote:
> > > > > > > > 
> > > > > > > >  On 2020/8/10 下午3:46, Yan Zhao wrote:  
> > > > > > > >  we actually can also retrieve the same information through sysfs, .e.g
> > > > > > > > 
> > > > > > > >  |- [path to device]
> > > > > > > >     |--- migration
> > > > > > > >     |     |--- self
> > > > > > > >     |     |   |---device_api
> > > > > > > >     |    |   |---mdev_type
> > > > > > > >     |    |   |---software_version
> > > > > > > >     |    |   |---device_id
> > > > > > > >     |    |   |---aggregator
> > > > > > > >     |     |--- compatible
> > > > > > > >     |     |   |---device_api
> > > > > > > >     |    |   |---mdev_type
> > > > > > > >     |    |   |---software_version
> > > > > > > >     |    |   |---device_id
> > > > > > > >     |    |   |---aggregator
> > > > > > > > 
> > > > > > > > 
> > > > > > > >  Yes but:
> > > > > > > > 
> > > > > > > >  - You need one file per attribute (one syscall for one attribute)
> > > > > > > >  - Attribute is coupled with kobject
> > > > > > 
> > > > > > Is that really that bad? You have the device with an embedded kobject
> > > > > > anyway, and you can just put things into an attribute group?
> > > > > > 
> > > > > > [Also, I think that self/compatible split in the example makes things
> > > > > > needlessly complex. Shouldn't semantic versioning and matching already
> > > > > > cover nearly everything? I would expect very few cases that are more
> > > > > > complex than that. Maybe the aggregation stuff, but I don't think we
> > > > > > need that self/compatible split for that, either.]
> > > > > 
> > > > > Hi Cornelia,
> > > > > 
> > > > > The reason I want to declare compatible list of attributes is that
> > > > > sometimes it's not a simple 1:1 matching of source attributes and target attributes
> > > > > as I demonstrated below,
> > > > > source mdev of (mdev_type i915-GVTg_V5_2 + aggregator 1) is compatible to
> > > > > target mdev of (mdev_type i915-GVTg_V5_4 + aggregator 2),
> > > > >                (mdev_type i915-GVTg_V5_8 + aggregator 4)
> > > > 
> > > > the way you are doing the nameing is till really confusing by the way
> > > > if this has not already been merged in the kernel can you chagne the mdev
> > > > so that mdev_type i915-GVTg_V5_2 is 2 of mdev_type i915-GVTg_V5_1 instead of half the device
> > > > 
> > > > currently you need to deived the aggratod by the number at the end of the mdev type to figure out
> > > > how much of the phsicial device is being used with is a very unfridly api convention
> > > > 
> > > > the way aggrator are being proposed in general is not really someting i like but i thin this at least
> > > > is something that should be able to correct.
> > > > 
> > > > with the complexity in the mdev type name + aggrator i suspect that this will never be support
> > > > in openstack nova directly requireing integration via cyborg unless we can pre partion the
> > > > device in to mdevs staicaly and just ignore this.
> > > > 
> > > > this is way to vendor sepecif to integrate into something like openstack in nova unless we can guarentee
> > > > taht how aggreator work will be portable across vendors genericly.
> > > > 
> > > > > 
> > > > > and aggragator may be just one of such examples that 1:1 matching does not
> > > > > fit.
> > > > 
> > > > for openstack nova i dont see us support anything beyond the 1:1 case where the mdev type does not change.
> > > > 
> > > 
> > > hi Sean,
> > > I understand it's hard for openstack. but 1:N is always meaningful.
> > > e.g.
> > > if source device 1 has cap A, it is compatible to
> > > device 2: cap A,
> > > device 3: cap A+B,
> > > device 4: cap A+B+C
> > > ....
> > > to allow openstack to detect it correctly, in compatible list of
> > > device 2, we would say compatible cap is A;
> > > device 3, compatible cap is A or A+B;
> > > device 4, compatible cap is A or A+B, or A+B+C;
> > > 
> > > then if openstack finds device A's self cap A is contained in compatible
> > > cap of device 2/3/4, it can migrate device 1 to device 2,3,4.
> > > 
> > > conversely,  device 1's compatible cap is only A,
> > > so it is able to migrate device 2 to device 1, and it is not able to
> > > migrate device 3/4 to device 1.
> > 
> > yes we build the palcement servce aroudn the idea of capablites as traits on resocue providres.
> > which is why i originally asked if we coudl model compatibality with feature flags
> > 
> > we can seaislyt model deivce as aupport A, A+B or  A+B+C
> > and then select hosts and evice based on that but
> > 
> > the list of compatable deivce you are propsoeing hide this feature infomation which whould be what we are matching
> > on.
> > 
> > give me a lset of feature you want and list ting the feature avaiable on each device allow highre level ocestation
> > to
> > easily match the request to a host that can fulllfile it btu thave a set of other compatihble device does not help
> > with
> > that
> > 
> > so if a simple list a capabliteis can be advertiese d and if we know tha two dievce with the same capablity are
> > intercahangebale that is workabout i suspect that will not be the case however and it would onely work within a
> > familay
> > of mdevs that are closely related.  which i think agian is an argument for not changeing the mdev type and at least
> > intially only look at migatreion where the mdev type doee not change initally. 
> > 
> 
> sorry Sean, I don't understand your words completely.
> Please allow me to write it down in my words, and please confirm if my
> understanding is right.
> 1. you mean you agree on that each field is regarded as a trait, and
> openstack can compare by itself if source trait is a subset of target trait, right?
> e.g.
> source device
> field1=A1
> field2=A2+B2
> field3=A3
> 
> target device
> field1=A1+B1
> field2=A2+B2
> filed3=A3
> 
> then openstack sees that field1/2/3 in source is a subset of field1/2/3 in
> target, so it's migratable to target?

yes this is basically how cpu feature work.
if we see the host cpu on the dest is a supperset of the cpu feature used
by the vm we know its safe to migrate.
> 
> 2. mdev_type + aggregator make it hard to achieve the above elegant
> solution, so it's best to avoid the combined comparing of mdev_type + aggregator.
> do I understand it correctly?
yes and no. one of the challange that mdevs pose right now is that sometiem mdev model
independent resouces and sometimes multipe mdev types consume the same underlying resouces
there is know way for openstack to know if i915-GVTg_V5_2 and i915-GVTg_V5_4 consume the same resouces
or not. as such we cant do the accounting properly so i would much prefer to have just 1 mdev type
i915-GVTg and which models the minimal allocatable unit and then say i want 4 of them comsed into 1 device
then have a second mdev type that does that since

what that means in pratice is we cannot trust the available_instances for a given mdev type
as consuming a different mdev type might change it. aggrators makes that problem worse.
which is why i siad i would prefer if instead of aggreator as prposed each consumable
resouce was reported indepenedly as different mdev types and then we composed those
like we would when bond ports creating an attachment or other logical aggration that refers
to instance of mdevs of differing type which we expose as a singel mdev that is exposed to the guest.
in a concreate example we might say create a aggreator of 64 cuda cores and 32 tensor cores and "bond them"
or aggrate them as a single attachme mdev and provide that to a ml workload guest. a differnt guest could request
1 instace of the nvenc video encoder and one instance of the nvenc video decoder but no cuda or tensor for a video
transcoding workload.

if each of those componets are indepent mdev types and can be composed with that granularity then i think that approch
is better then the current aggreator with vendor sepcific fileds.
we can model the phsical device as being multipel nested resouces with different traits for each type of resouce and
different capsities for the same. we can even model how many of the attachments/compositions can be done indepently
if there is a limit on that.

|- [parent physical device]
|--- Vendor-specific-attributes [optional]
|--- [mdev_supported_types]
|     |--- [<type-id>]
|     |   |--- create
|     |   |--- name
|     |   |--- available_instances
|     |   |--- device_api
|     |   |--- description
|     |   |--- [devices]
|     |--- [<type-id>]
|     |   |--- create
|     |   |--- name
|     |   |--- available_instances
|     |   |--- device_api
|     |   |--- description
|     |   |--- [devices]
|     |--- [<type-id>]
|          |--- create
|          |--- name
|          |--- available_instances
|          |--- device_api
|          |--- description
|          |--- [devices]

a benifit of this appoch is we would be the mdev types would not change on migration 
and we could jsut compuare a a simeple version stirgh and feature flag list to determin comaptiablity
in a vendor neutral way. i dont nessisarly need to know what the vendeor flags mean just that the dest is a subset of
the source and that the semaitic version numbers say the mdevs are compatible.
> 
> 3. you don't like self list and compatible list, because it is hard for
> openstack to compare different traits?
> e.g. if we have self list and compatible list, then as below, openstack needs
> to compare if self field1/2/3 is a subset of compatible field 1/2/3.
currnetly we only use mdevs for vGPUs and in our documentaiton we tell customer
to model the mdev_type as a trait and request it as a reuiqred trait.
so for customer that are doing that today changing mdev types is not really an option.
we would prefer that they request the feature they need instead of a spefic mdev type
so we can select any that meets there needs
for example we have a bunch of traits for cuda support
https://github.com/openstack/os-traits/blob/master/os_traits/hw/gpu/cuda.py
or driectx/vulkan/opengl https://github.com/openstack/os-traits/blob/master/os_traits/hw/gpu/api.py
these are closely analogous to cpu feature flag lix avx or sse
https://github.com/openstack/os-traits/blob/master/os_traits/hw/cpu/x86/__init__.py#L16

so when it comes to compatiablities it would be ideal if you could express capablities as something like
a cpu feature flag then we can eaisly model those as traits. 
> 
> source device:
> self field1=A1
> self field2=A2+B2
> self field3=A3
> 
> compatible field1=A1
> compatible field2=A2;B2;A2+B2;
> compatible field3=A3
> 
> 
> target device:
> self field1=A1+B1
> self field2=A2+B2
> self field3=A3
> 
> compatible field1=A1;B1;A1+B1;
> compatible field2=A2;B2;A2+B2;
> compatible field3=A3
> 
> 
> Thanks
> Yan
> 
> 
> > > 
> > > 
> > > > i woudl really prefer if there was just one mdev type that repsented the minimal allcatable unit and the
> > > > aggragaotr where used to create compostions of that. i.e instad of i915-GVTg_V5_2 beign half the device,
> > > > have 1 mdev type i915-GVTg and if the device support 8 of them then we can aggrate 4 of i915-GVTg
> > > > 
> > > > if you want to have muplie mdev type to model the different amoutn of the resouce e.g. i915-GVTg_small i915-
> > > > GVTg_large
> > > > that is totlaly fine too or even i915-GVTg_4 indcating it sis 4 of i915-GVTg
> > > > 
> > > > failing that i would just expose an mdev type per composable resouce and allow us to compose them a the user
> > > > level
> > > > with
> > > > some other construct mudeling a attament to the device. e.g. create composed mdev or somethig that is an
> > > > aggreateion
> > > > of
> > > > multiple sub resouces each of which is an mdev. so kind of like how bond port work. we would create an mdev for
> > > > each
> > > > of
> > > > the sub resouces and then create a bond or aggrated mdev by reference the other mdevs by uuid then attach only
> > > > the
> > > > aggreated mdev to the instance.
> > > > 
> > > > the current aggrator syntax and sematic however make me rather uncofrotable when i think about orchestating vms
> > > > on
> > > > top
> > > > of it even to boot them let alone migrate them.
> > > > > 
> > > > > So, we explicitly list out self/compatible attributes, and management
> > > > > tools only need to check if self attributes is contained compatible
> > > > > attributes.
> > > > > 
> > > > > or do you mean only compatible list is enough, and the management tools
> > > > > need to find out self list by themselves?
> > > > > But I think provide a self list is easier for management tools.
> > > > > 
> > > > > Thanks
> > > > > Yan
> > > > > 
> > > 
> > > 
> 
> 


