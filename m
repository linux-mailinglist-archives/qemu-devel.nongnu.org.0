Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A75D63750A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 10:22:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy8Py-0000xf-TT; Thu, 24 Nov 2022 04:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oy8Pn-0000wh-Op
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 04:21:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oy8PZ-0000VO-BQ
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 04:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669281648;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Lpeu5Ss2ivhrSfRq54gOr5bohU3P8pE/EFC1tBLppY=;
 b=Rk7e2o3wTzqgoyCRSyKmyeas0b/DnLRhEtA2Jt/8N0zpsyktc4N1F0TeIs9RgYFC/4C8gL
 FF9uH57rQGG2JkSd9iibc7926fPqSVj9O9PMS8TbO2tDwQWSNEAEPhxvUTghRuTK1CLLTa
 1inHb/NBe2uzfF0tcm4SOz3/LtaauWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-pbPwJV6MPwSEovI57nIYng-1; Thu, 24 Nov 2022 04:20:42 -0500
X-MC-Unique: pbPwJV6MPwSEovI57nIYng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20BB9811E7A;
 Thu, 24 Nov 2022 09:20:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4EE2166B26;
 Thu, 24 Nov 2022 09:20:40 +0000 (UTC)
Date: Thu, 24 Nov 2022 09:20:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Message-ID: <Y383Y03gZI77KeWK@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com>
 <87fse9bvmf.fsf@linaro.org>
 <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 23, 2022 at 07:13:09PM +0100, Philippe Mathieu-Daudé wrote:
> On 23/11/22 15:12, Alex Bennée wrote:
> > Thomas Huth <thuth@redhat.com> writes:
> > > On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
> > > > On 18/11/22 12:33, Alex Bennée wrote:
> > > > > The old URL wasn't stable. I suspect the current URL will only be
> > > > > stable for a few months so maybe we need another strategy for hosting
> > > > > rootfs snapshots?
> > > > > 
> > > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > > ---
> > > > >    tests/avocado/boot_linux_console.py | 4 ++--
> > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/tests/avocado/boot_linux_console.py
> > > > > b/tests/avocado/boot_linux_console.py
> > > > > index 4c9d551f47..5a2923c423 100644
> > > > > --- a/tests/avocado/boot_linux_console.py
> > > > > +++ b/tests/avocado/boot_linux_console.py
> > > > > @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
> > > > >            dtb_path =
> > > > > '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
> > > > >            dtb_path = self.extract_from_deb(deb_path, dtb_path)
> > > > >            rootfs_url =
> > > > > ('http://storage.kernelci.org/images/rootfs/buildroot/'
> > > > > -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
> > > > > -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
> > > > > +                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
> > > > > +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
> > > > If Avocado doesn't find an artifact in its local cache, it will fetch it
> > > > from the URL.
> > > > The cache might be populated with artifacts previously downloaded, but
> > > > their URL is not valid anymore (my case for many tests).
> > > > We can also add artifacts manually, see [1].
> > > > I'd rather keep pre-existing tests if possible, to test older
> > > > (kernel / user-space) images. We don't need to run all the tests all
> > > > the time:
> > > > tests can be filtered by tags (see [2]).
> > > > My preference here is to refactor this test, adding the
> > > > "kci-2019.02"
> > > > and "baseline-20221116.0" releases. I can prepare the patch if you /
> > > > Thomas don't object.
> > > 
> > > IMHO we shouldn't keep tests in the upstream git repository where the
> > > binaries are not available in public anymore. They won't get run by
> > > new contributors anymore, and also could vanish from the disks of the
> > > people who previously downloaded it, once they wipe their cache or
> > > upgrade to a new installation, so the test code will sooner or later
> > > be bitrotting. But if you want to keep the tests around on your hard
> > > disk, you could also stick the test in a local branch on your hard
> > > disk instead.
> > 
> > CI/Workstation splits aside I tend to agree with Thomas here that having
> > tests no one else can run will lead to an accretion of broken tests.
> 
> Following this idea, should we remove all boards for which no open
> source & GPL software is available? I.e:

No of course not, that's totally ridiculous.

Don't equate what scenarios we cover in CI, with what features
QEMU implements in code.

The CI coverage merely influences what we tell people about
the level of quality we can guarantee for respective features.


> > > The other possibility is to upload the binaries to a new public
> > > location in the web ... but for software that contains GPLed software,
> > > you should then also make sure to provide the source code to comply
> > > with the license.
> > 
> > This is the traditional reason we've lent so hard on external hosting
> > for binaries because the upstream doesn't want the hassle of maintaining
> > that sort of zoo of binaries. That said we have tests where binaries are
> > served from fileserver.linaro.org but its then only my problem to deal
> > with GPL requirements and not the upstream.
> 
> Maybe we are discussing 2 different topics. I am in possession of
> old Solaris installation CDROMs and could boot some of them with
> qemu-system-sparc. I want to automatize my testing, and wrote Avocado
> scripts doing that. I suppose other QEMU users have similar CDROMs.
> If I contribute my tests, they can run them. Isn't it in the interest
> of the community to have such examples and tests available?

Potentially yes, but remember that all code has a maintenance cost,
and we're massively struggling to keep even our current avocado
setup running reliably. The CI for Avocado is in a state of almost
constant brokeness throughout recent merges :-(

Given the instability and time invested chasing failures in current
tests we have, I don't think we can commit to adding arbitrary user
contributed tests to our gating CI.

I think we need to strictly focus our Avocado gating CI testing on
a small set of OS that give maximum value for our usersr. IMHO that
means primarily focus testing resources on modern non-EOL OS distros
and hardware platforms.

We could take tests for other old OS / old hardware platforms and
NOT run them in CI, but then they're at even greater risk of
bitrotting than the stuff we already struggle to keep running.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


