Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946173B0968
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:42:00 +0200 (CEST)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviXH-0000M6-N0
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lviVp-0007oV-3U
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:40:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lviVm-0008NK-Mf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624376425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYHQnJ5iOvg2WDQ92xsZ3l7NoE8Cgt1zPFaKyGayJT0=;
 b=RHhovXNMggj33fohXA1UcivUfrBweybmpajrvAk1wwR66Z44tvHD90icmyUWqe/FDGxh9d
 R0DdBj3WzW4BxcfN749e15ah78ySdQRAdj9Grx104zaTxeGfWWcBlq+ze1D8tH3OpMBgd3
 D4HL3m59gdHj6+k1QdJWpj9UNh8qryo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-hWx4B6erMLOfhRD6IkUfJg-1; Tue, 22 Jun 2021 11:40:24 -0400
X-MC-Unique: hWx4B6erMLOfhRD6IkUfJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FAF5106B7DB;
 Tue, 22 Jun 2021 15:40:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5020160854;
 Tue, 22 Jun 2021 15:40:14 +0000 (UTC)
Date: Tue, 22 Jun 2021 17:40:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210622174013.52422c73@redhat.com>
In-Reply-To: <20210622142915.pekttdvbi3q5vnh3@gator>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com>
 <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
 <20210622142915.pekttdvbi3q5vnh3@gator>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 yangyicong@huawei.com, "wangyanan
 \(Y\)" <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 16:29:15 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Tue, Jun 22, 2021 at 03:10:57PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Jun 22, 2021 at 10:04:52PM +0800, wangyanan (Y) wrote: =20
> > > Hi Daniel,
> > >=20
> > > On 2021/6/22 20:41, Daniel P. Berrang=C3=A9 wrote: =20
> > > > On Tue, Jun 22, 2021 at 08:31:22PM +0800, wangyanan (Y) wrote: =20
> > > > >=20
> > > > > On 2021/6/22 19:46, Andrew Jones wrote: =20
> > > > > > On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrang=C3=
=A9 wrote: =20
> > > > > > > On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote: =
=20
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > This is v4 of the series [1] that I posted to introduce sup=
port for
> > > > > > > > generating cpu topology descriptions to guest. Comments are=
 welcome!
> > > > > > > >=20
> > > > > > > > Description:
> > > > > > > > Once the view of an accurate virtual cpu topology is provid=
ed to guest,
> > > > > > > > with a well-designed vCPU pinning to the pCPU we may get a =
huge benefit,
> > > > > > > > e.g., the scheduling performance improvement. See Dario Fag=
gioli's
> > > > > > > > research and the related performance tests in [2] for refer=
ence. So here
> > > > > > > > we go, this patch series introduces cpu topology support fo=
r ARM platform.
> > > > > > > >=20
> > > > > > > > In this series, instead of quietly enforcing the support fo=
r the latest
> > > > > > > > machine type, a new parameter "expose=3Don|off" in -smp com=
mand line is
> > > > > > > > introduced to leave QEMU users a choice to decide whether t=
o enable the
> > > > > > > > feature or not. This will allow the feature to work on diff=
erent machine
> > > > > > > > types and also ideally compat with already in-use -smp comm=
and lines.
> > > > > > > > Also we make much stricter requirement for the topology con=
figuration
> > > > > > > > with "expose=3Don". =20
> > > > > > > Seeing this 'expose=3Don' parameter feels to me like we're ad=
ding a
> > > > > > > "make-it-work=3Dyes" parameter. IMHO this is just something t=
hat should
> > > > > > > be done by default for the current machine type version and b=
eyond.
> > > > > > > I don't see the need for a parameter to turnthis on, especial=
ly since
> > > > > > > it is being made architecture specific.
> > > > > > >  =20
> > > > > > I agree.
> > > > > >=20
> > > > > > Yanan, we never discussed an "expose" parameter in the previous=
 versions
> > > > > > of this series. We discussed a "strict" parameter though, which=
 would
> > > > > > allow existing command lines to "work" using assumptions of wha=
t the user
> > > > > > meant and strict=3Don users to get what they mean or an error s=
aying that
> > > > > > they asked for something that won't work or would require unrea=
sonable
> > > > > > assumptions. Why was this changed to an "expose" parameter? =20
> > > > > Yes, we indeed discuss a new "strict" parameter but not a "expose=
" in v2 [1]
> > > > > of this series.
> > > > > [1] https://patchwork.kernel.org/project/qemu-devel/patch/2021041=
3080745.33004-6-wangyanan55@huawei.com/
> > > > >=20
> > > > > And in the discussion, we hoped things would work like below with=
 "strict"
> > > > > parameter:
> > > > > Users who want to describe cpu topology should provide cmdline li=
ke
> > > > >=20
> > > > > -smp strict=3Don,cpus=3D4,sockets=3D2,cores=3D2,threads=3D1
> > > > >=20
> > > > > and in this case we require an more accurate -smp configuration a=
nd
> > > > > then generate the cpu topology description through ACPI/DT.
> > > > >=20
> > > > > While without a strict description, no cpu topology description w=
ould
> > > > > be generated, so they get nothing through ACPI/DT.
> > > > >=20
> > > > > It seems to me that the "strict" parameter actually serves as a k=
nob to
> > > > > turn on/off the exposure of topology, and this is the reason I ch=
anged
> > > > > the name. =20
> > > > Yes, the use of 'strict=3Don' is no better than expose=3Don IMHO.
> > > >=20
> > > > If I give QEMU a cli
> > > >=20
> > > >    -smp cpus=3D4,sockets=3D2,cores=3D2,threads=3D1
> > > >=20
> > > > then I expect that topology to be exposed to the guest. I shouldn't
> > > > have to add extra flags to make that happen.
> > > >=20
> > > > Looking at the thread, it seems the concern was around the fact tha=
t
> > > > the settings were not honoured historically and thus the CLI values
> > > > could be garbage. ie  -smp cpus=3D4,sockets=3D8,cores=3D3,thread=3D=
9 =20
> > > This "-smp cpus=3D4,sockets=3D8,cores=3D3,threads=3D9" behaviors as a=
 wrong
> > > configuration, and the parsing function already report error for this=
 case.
> > >=20
> > > We hope more complete config like "-smp 4,sockets=3D2,cores=3D2,threa=
ds=3D1"
> > > for exposure of topology, and the incomplete ones like "-smp 4,socket=
s=3D1"
> > > or "-smp 4, cores=3D1" are not acceptable any more because we are sta=
rting
> > > to expose the topology. =20
> >=20
> > Incomplete specified topologies *are* acceptable.
> >=20
> > The smp_parse method will automatically fill in any missing values.
> >=20
> > ie,
> >=20
> >   -smp 4,cores=3D1
> >   -smp cores=3D1
> >   -smp threads=3D1
> >   -smp sockets=3D4
> >=20
> > are all functionally identical to
> >=20
> >   -smp 4,sockets=3D4,cores=3D1,dies=3D1,threads=3D1
> >=20
> >=20
> > The QEMU man page says this explicitly
> >=20
> >                  For the PC target, the number of cores per die, the
> >     number of threads per cores, the number of dies per packages and th=
e
> >     total number of sockets can be specified. Missing values will be
> >     computed. If any on the three values is given, the total number of
> >     CPUs n can be omitted. =20
>=20
> It doesn't say how it will compute them though, which for the default
> smp_parse and for x86 is to prefer sockets over cores over threads.
> That's not necessarily what the user expects. IMO, we need a 'strict=3Don=
'
> parameter that doesn't allow any collection of smp parameters which
> require unreasonable assumptions. Reasonable assumptions are threads=3D1,
> when threads is not specified and the rest of the math adds up. Also,
> maxcpus =3D=3D cpus when maxcpus isn't specified is reasonable. But, it's=
 not
> as reasonable to decide how to divide cores among sockets or to assume
> threads=3D1 when only sockets and cores are given. How do we know the use=
r
> didn't forget to specify threads if we can't check the math?

or just outlaw all invalid topologies incl. incomplete by default
(without requiring extra option), and permit them only for old machine
types ()using compat machinery) without topo info provided to guest.
And maybe later deprecate invalid topologies altogether.=20


>=20
> Thanks,
> drew
>=20
> >=20
> > note this qemu-options.hx doc will require updating since it will apply
> > to more than just the PC target.
> >=20
> > Regards,
> > Daniel
> > --=20
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> >  =20
>=20


