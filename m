Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227B13B5AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 10:59:37 +0200 (CEST)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxn7A-0007KS-5S
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 04:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lxn5s-0005t8-Jh
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lxn5q-0007th-0P
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624870693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4pCN+533K9uKQvovlsAp5U59J+PYCz3h6Hhf6KlUqo=;
 b=WcXzkOGVEFJ1Nc/3tDIXO6TWIwgkehfuI7ZXpKnxhmNCkKXOMs9Cmt/OaStS9mxSB4ai6f
 1PC1NEsZej4s3Gz5LA70WrSjfkDYtlhgR+U0yI2kV4sz8ou/g09b7nvNQPlcWToFoposz3
 R4m8AUVZCZb2BVmTZs+54SgSaUYMNE0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-0ApVwlrpNE-Z3WJ3ZMkklA-1; Mon, 28 Jun 2021 04:58:09 -0400
X-MC-Unique: 0ApVwlrpNE-Z3WJ3ZMkklA-1
Received: by mail-ed1-f70.google.com with SMTP id
 g14-20020a056402424eb02903954930851bso2726869edb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 01:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=T4pCN+533K9uKQvovlsAp5U59J+PYCz3h6Hhf6KlUqo=;
 b=tcIw3GTzG9SgkQtYNMiEkHVVh5jwi0e9tXr7ThBJdeBKao/suNl8PQ8enfHu48S+HD
 0fa0fDrSddEiallly28EJnY9azqsCZQbWYjanvcWVW1nadURvS0Zy0f5Tg9k6yQlCKFm
 xrvWIMwpdwjE+ib214Vgml7OJ5b58fVPLGXLpkAWowMHJ18zBle4Ugdv8T62tvp/JE2Z
 cG6HdRL27FuGebMkO9+wXP12/NwUr3d35yVd0I034Z2r7IgFoWh0bcCNp7/sPE7OZNXn
 N6oSom9hZ1gMWDF7T9Q2BrjP8Txjr9XTiUPx5y4ECZUJFejDYMNaK9aIJIKWwbBgwzYw
 yFZQ==
X-Gm-Message-State: AOAM533us8ihoNU7NSZHL/evstujZVYJMqZHeHOF+rp3b7LUUmaQHQL9
 EVoVkSNd8zH7s0hVyiyHJ/7NKjR2YVhyz8SbX7EuWfBpKxSAK1LhEKOlmAqLF2XQm/+tdL1H56s
 pSsLLXvUv6KwXvjs=
X-Received: by 2002:a50:f68d:: with SMTP id d13mr32141408edn.318.1624870688155; 
 Mon, 28 Jun 2021 01:58:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTJa1cq1AZqH/9aZrdmpi/VVXE9Enqc6kQ4WzLmHMnhHhdgb+PinzAw4nkok81dprxh7/few==
X-Received: by 2002:a50:f68d:: with SMTP id d13mr32141371edn.318.1624870687824; 
 Mon, 28 Jun 2021 01:58:07 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id t17sm9157236edv.75.2021.06.28.01.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 01:58:07 -0700 (PDT)
Date: Mon, 28 Jun 2021 10:58:05 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210628085805.5y7bxvqprx75hwi4@gator>
References: <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
 <20210622142915.pekttdvbi3q5vnh3@gator>
 <20210622174013.52422c73@redhat.com> <YNIacfpt+iHHHzT6@redhat.com>
 <20210622172934.537l7e27sxd6car6@gator>
 <YNIgInK00yNNI4Dy@redhat.com>
 <d695bc58-f648-38e5-cd98-9d91fcebd80a@huawei.com>
MIME-Version: 1.0
In-Reply-To: <d695bc58-f648-38e5-cd98-9d91fcebd80a@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, ehabkost@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 04:43:05PM +0800, wangyanan (Y) wrote:
> Hi,
> On 2021/6/23 1:39, Daniel P. Berrangé wrote:
> > On Tue, Jun 22, 2021 at 07:29:34PM +0200, Andrew Jones wrote:
> > > On Tue, Jun 22, 2021 at 06:14:25PM +0100, Daniel P. Berrangé wrote:
> > > > On Tue, Jun 22, 2021 at 05:40:13PM +0200, Igor Mammedov wrote:
> > > > > On Tue, 22 Jun 2021 16:29:15 +0200
> > > > > Andrew Jones <drjones@redhat.com> wrote:
> > > > > 
> > > > > > On Tue, Jun 22, 2021 at 03:10:57PM +0100, Daniel P. Berrangé wrote:
> > > > > > > On Tue, Jun 22, 2021 at 10:04:52PM +0800, wangyanan (Y) wrote:
> > > > > > > > Hi Daniel,
> > > > > > > > 
> > > > > > > > On 2021/6/22 20:41, Daniel P. Berrangé wrote:
> > > > > > > > > On Tue, Jun 22, 2021 at 08:31:22PM +0800, wangyanan (Y) wrote:
> > > > > > > > > > On 2021/6/22 19:46, Andrew Jones wrote:
> > > > > > > > > > > On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrangé wrote:
> > > > > > > > > > > > On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:
> > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > This is v4 of the series [1] that I posted to introduce support for
> > > > > > > > > > > > > generating cpu topology descriptions to guest. Comments are welcome!
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Description:
> > > > > > > > > > > > > Once the view of an accurate virtual cpu topology is provided to guest,
> > > > > > > > > > > > > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > > > > > > > > > > > > e.g., the scheduling performance improvement. See Dario Faggioli's
> > > > > > > > > > > > > research and the related performance tests in [2] for reference. So here
> > > > > > > > > > > > > we go, this patch series introduces cpu topology support for ARM platform.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > In this series, instead of quietly enforcing the support for the latest
> > > > > > > > > > > > > machine type, a new parameter "expose=on|off" in -smp command line is
> > > > > > > > > > > > > introduced to leave QEMU users a choice to decide whether to enable the
> > > > > > > > > > > > > feature or not. This will allow the feature to work on different machine
> > > > > > > > > > > > > types and also ideally compat with already in-use -smp command lines.
> > > > > > > > > > > > > Also we make much stricter requirement for the topology configuration
> > > > > > > > > > > > > with "expose=on".
> > > > > > > > > > > > Seeing this 'expose=on' parameter feels to me like we're adding a
> > > > > > > > > > > > "make-it-work=yes" parameter. IMHO this is just something that should
> > > > > > > > > > > > be done by default for the current machine type version and beyond.
> > > > > > > > > > > > I don't see the need for a parameter to turnthis on, especially since
> > > > > > > > > > > > it is being made architecture specific.
> > > > > > > > > > > I agree.
> > > > > > > > > > > 
> > > > > > > > > > > Yanan, we never discussed an "expose" parameter in the previous versions
> > > > > > > > > > > of this series. We discussed a "strict" parameter though, which would
> > > > > > > > > > > allow existing command lines to "work" using assumptions of what the user
> > > > > > > > > > > meant and strict=on users to get what they mean or an error saying that
> > > > > > > > > > > they asked for something that won't work or would require unreasonable
> > > > > > > > > > > assumptions. Why was this changed to an "expose" parameter?
> > > > > > > > > > Yes, we indeed discuss a new "strict" parameter but not a "expose" in v2 [1]
> > > > > > > > > > of this series.
> > > > > > > > > > [1] https://patchwork.kernel.org/project/qemu-devel/patch/20210413080745.33004-6-wangyanan55@huawei.com/
> > > > > > > > > > 
> > > > > > > > > > And in the discussion, we hoped things would work like below with "strict"
> > > > > > > > > > parameter:
> > > > > > > > > > Users who want to describe cpu topology should provide cmdline like
> > > > > > > > > > 
> > > > > > > > > > -smp strict=on,cpus=4,sockets=2,cores=2,threads=1
> > > > > > > > > > 
> > > > > > > > > > and in this case we require an more accurate -smp configuration and
> > > > > > > > > > then generate the cpu topology description through ACPI/DT.
> > > > > > > > > > 
> > > > > > > > > > While without a strict description, no cpu topology description would
> > > > > > > > > > be generated, so they get nothing through ACPI/DT.
> > > > > > > > > > 
> > > > > > > > > > It seems to me that the "strict" parameter actually serves as a knob to
> > > > > > > > > > turn on/off the exposure of topology, and this is the reason I changed
> > > > > > > > > > the name.
> > > > > > > > > Yes, the use of 'strict=on' is no better than expose=on IMHO.
> > > > > > > > > 
> > > > > > > > > If I give QEMU a cli
> > > > > > > > > 
> > > > > > > > >     -smp cpus=4,sockets=2,cores=2,threads=1
> > > > > > > > > 
> > > > > > > > > then I expect that topology to be exposed to the guest. I shouldn't
> > > > > > > > > have to add extra flags to make that happen.
> > > > > > > > > 
> > > > > > > > > Looking at the thread, it seems the concern was around the fact that
> > > > > > > > > the settings were not honoured historically and thus the CLI values
> > > > > > > > > could be garbage. ie  -smp cpus=4,sockets=8,cores=3,thread=9
> > > > > > > > This "-smp cpus=4,sockets=8,cores=3,threads=9" behaviors as a wrong
> > > > > > > > configuration, and the parsing function already report error for this case.
> > > > > > > > 
> > > > > > > > We hope more complete config like "-smp 4,sockets=2,cores=2,threads=1"
> > > > > > > > for exposure of topology, and the incomplete ones like "-smp 4,sockets=1"
> > > > > > > > or "-smp 4, cores=1" are not acceptable any more because we are starting
> > > > > > > > to expose the topology.
> > > > > > > Incomplete specified topologies *are* acceptable.
> > > > > > > 
> > > > > > > The smp_parse method will automatically fill in any missing values.
> > > > > > > 
> > > > > > > ie,
> > > > > > > 
> > > > > > >    -smp 4,cores=1
> > > > > > >    -smp cores=1
> > > > > > >    -smp threads=1
> > > > > > >    -smp sockets=4
> > > > > > > 
> > > > > > > are all functionally identical to
> > > > > > > 
> > > > > > >    -smp 4,sockets=4,cores=1,dies=1,threads=1
> > > > > > > 
> > > > > > > 
> > > > > > > The QEMU man page says this explicitly
> > > > > > > 
> > > > > > >                   For the PC target, the number of cores per die, the
> > > > > > >      number of threads per cores, the number of dies per packages and the
> > > > > > >      total number of sockets can be specified. Missing values will be
> > > > > > >      computed. If any on the three values is given, the total number of
> > > > > > >      CPUs n can be omitted.
> > > > > > It doesn't say how it will compute them though, which for the default
> > > > > > smp_parse and for x86 is to prefer sockets over cores over threads.
> > > > > > That's not necessarily what the user expects. IMO, we need a 'strict=on'
> > > > > > parameter that doesn't allow any collection of smp parameters which
> > > > > > require unreasonable assumptions. Reasonable assumptions are threads=1,
> > > > > > when threads is not specified and the rest of the math adds up. Also,
> > > > > > maxcpus == cpus when maxcpus isn't specified is reasonable. But, it's not
> > > > > > as reasonable to decide how to divide cores among sockets or to assume
> > > > > > threads=1 when only sockets and cores are given. How do we know the user
> > > > > > didn't forget to specify threads if we can't check the math?
> > > > > or just outlaw all invalid topologies incl. incomplete by default
> > > > > (without requiring extra option), and permit them only for old machine
> > > > > types ()using compat machinery) without topo info provided to guest.
> > > > > And maybe later deprecate invalid topologies altogether.
> > > > This feels like it is creating pain for users to fix a problem that
> > > > isn't shown to actually be causing any common issues.
> > > > 
> > > > We've supposed that users are having problems when forgetting to
> > > > specify "threads" and not having the compute value be desirable,
> > > > but where are the bug reports to back this up ?
> > > > 
> > > > The partial topologies are valid and have well defined semantics.
> > > > Those semantics may not match everyone's preference, but that
> > > > doesn't make them invalid.
> > > > 
> > > If we adopt the [undocumented] semantics of x86 for arm, then we may
> > > surprise some users that expect e.g. '-smp 16' to give them a single
> > > socket with 16 cores, because they'll start getting 16 sockets with 1
> > > core each. That's because if we don't describe a topology to an arm linux
> > > guest then it assumes cores. Maybe we shouldn't worry about this, but I'd
> > > prefer we require explicit inputs from users and, if necessary, for them
> > > to explicitly opt-in to requiring those explicit inputs.
> > Even for x86, defaulting to maximising sockets over cores is sub-optimal.
> > In real world x86 hardware it is very rare to have sockets > 2 or 4. For
> > large CPU counts, you generally have large cores-per-socket counts on x86.
> > 
> > The QEMU preference for sockets over cores on x86 (and PPC too IIUC)
> > is a fairly arbitrary historical decision.
> > 
> > It can cause problems with guest OS licensing because both Windows
> > and RHEL have been known to charge differently for sockets vs cores,
> > with high core counts being cheaper.
> > 
> > We are not tied into the precise behaviour of the computed topology
> > values, as we have no made any promises. All that's required is that
> > we keep ABI compat for existing machine types.
> If based on this point of view that we haven't made any promises for the
> precise behavior of the computed topology, things may get much easier.
> I have the following understanding (also a proposal):
> 
> We will introduce the support for exposing cpu topology since machine
> type 6.2 and we will also describe the computed topology for the guest.
> We will not make any stricter parsing logic, however the -smp content in
> qemu-options.hx should be rearranged to clearly explain how the missing
> values will exactly be computed. And this is what QEMU is responsible for.
> 
> We know that a well designed cpu topology configuration can gain much
> benefit for the guest, while a badly designed one will also probably cause
> negative impact. But the users should be responsible for the design of the
> -smp cmdlines. If they are using an incomplete cmdline for a 6.2 machine,
> then they should have known what the computed values will be and that
> the computed topology will be exposed to the guest.
> > 
> > So we could decide to change the computed topology so that it prefers
> > high core counts, over sockets, whem using new machine types only.
> > That would seem to benefit all arches, by making QEMU more reflective
> > of real world CPUs topology.
> If we really decide to prefer cores over sockets over threads for new
> machine
> types, then I think we should also record this change in qemu-option.hx.
>

I agree. The proposal sounds good to me. I'd like to hear Eduardo's
opinion too (CC'ed).

Thanks,
drew 


