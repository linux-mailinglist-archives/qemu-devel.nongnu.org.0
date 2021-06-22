Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A123B01A6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:44:12 +0200 (CEST)
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdt5-00045Y-Nz
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvdmD-00005M-78
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvdm9-0000lM-PG
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624358220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNMQidApL/OX/RvoVBl0XRaraVUtDcJa4CByiQiTIY8=;
 b=YtLhyVA0S9pghgcI6LGZhUlFlpQfTnYsQHEJ0/Etb1rmgM62VhEmGNrmFsqaaB+3+y8j4M
 bRPmJYBp/7WfkzSaK4RFTq2cHWp5bTvwKWS+WQXEqAeKnqhyHylOOQI4bIPBNqeCK65Nvo
 akR2eVzr+Jid2jceB93+E2p9afeA63s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-XAtS18KOO5ywOOurUv7Wvw-1; Tue, 22 Jun 2021 06:36:57 -0400
X-MC-Unique: XAtS18KOO5ywOOurUv7Wvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE84A5074F;
 Tue, 22 Jun 2021 10:36:55 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6F25DA2D;
 Tue, 22 Jun 2021 10:36:49 +0000 (UTC)
Date: Tue, 22 Jun 2021 12:36:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
Message-ID: <20210622123648.07402d7c@redhat.com>
In-Reply-To: <ca74cc39-6e30-6588-aa5a-48f74d305b56@redhat.com>
References: <20210616152455.1270264-1-imammedo@redhat.com>
 <d10ba45f-c71c-f472-fac7-9f8e5770c735@suse.de>
 <20210618132647.07cf2008@redhat.com>
 <2f7ae379-92e0-3274-6944-84a5bce6e82e@suse.de>
 <20210618152943.2009ad82@redhat.com> <874kdqtj25.fsf@linaro.org>
 <ca74cc39-6e30-6588-aa5a-48f74d305b56@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: lvivier@redhat.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 10:22:19 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 6/22/21 10:07 AM, Alex Benn=C3=A9e wrote:
> > Igor Mammedov <imammedo@redhat.com> writes: =20
> >> On Fri, 18 Jun 2021 14:43:46 +0200
> >> Claudio Fontana <cfontana@suse.de> wrote: =20
> >>> On 6/18/21 1:26 PM, Igor Mammedov wrote: =20
> >>>> On Thu, 17 Jun 2021 18:49:17 +0200
> >>>> Claudio Fontana <cfontana@suse.de> wrote: =20
> >>>>> On 6/16/21 5:24 PM, Igor Mammedov wrote:   =20
> >>>>>>
> >>>>>> Sometimes it's necessary to execute a test that depends on KVM,
> >>>>>> however qtest is not aware if tested QEMU binary supports KVM
> >>>>>> on the host it the test is executed.     =20
> >>>>>
> >>>>> Hello,
> >>>>>
> >>>>> It seems to me that we are constantly re-implementing the same feat=
ure with slight variations?
> >>>>>
> >>>>> Didn't we have a generic series to introduce qtest_has_accel() from=
 Philippe before?   =20
> >>>> It's mentioned in cover letter (PS: part) and in [1/3] with rational=
e
> >>>> why this was posted.   =20
> >>>
> >>> Thought it was separate, but now I see that it uses query-accel under=
neath.
> >>>
> >>> Seems strange to add another check to do the same thing, it may point=
 to qtest_has_accel() needing some update?
> >>> You mention it is time consuming to use qtest_has_accel(), have you m=
easured an important overhead?
> >>> With qtest_has_accel() not even being committed yet, is it already ne=
cessary to work around it because it's too slow?  =20
> >>
> >> Tests are already take a lot of time as is, so I'd try to avoid slowin=
g
> >> them down.
> >>
> >> proposed qtest_has_accel() requires spawning QEMU to probe, which is s=
low.
> >> Worst case would be:
> >>  =3D qemu startup time * number of checks * number of targets
> >>
> >> It's fine to run occasionally, I can take a coffee break while tests r=
un.
> >> But put it in context of CI and it multiplies by the number of push re=
quests
> >> and starts to eat not only time but also limited CI resources.
> >>
> >> In current form qtest_has_accel() is only marginally better functional=
ity
> >> wise, as it reports all built in accelerators while qtest_has_kvm() ac=
counts
> >> only for KVM.
> >>
> >> qtest_has_kvm() is collecting info about built-in accelerators at
> >> configure/build time and that probably could be extended to other
> >> accelerators (not a thing that I'm interested in at the moment).
> >> So it could be extended to support the same accelerators
> >> as currently proposed qtest_has_accel(). =20
> >=20
> > One minor downside is this forever ties the tests to the build. I have
> > spoken with people before about the idea of separating the test
> > artefacts from the build so they can be used either as a) cached test
> > objects or b) other testing environments, for example verifying the
> > kernel has not regressed. However we don't do either of those things at
> > the moment so it's not a major concern. =20
>=20
> This is the feature that is interesting RedHat QE too, run the latest
> qtests on various released binaries to compare performances between
> releases.

Currently qtest is only a build only and hard tied to concrete release test=
s.
And it's usually mercilessly altered to fit any QEMU interface changes
new version brings, which in turn breaks idea of testing other QEMU version=
s
with it.

I'd guess it would take *a lot* of effort to make and maintain it
as external test harness for various QEMU versions.

I think build time qtest used as public CI and external test suite
are conflicting goals, for the former we probably minimize used
compute resources while the later is probably run by QA in a more
controlled manner (unless one integrates that into another CI)

If I needed something that were to be usable as external test suite,
I'd look towards acceptance tests which are less depended on QEMU
internals and versions.
=20
> > If the worry is about extending test times by having an extra round tri=
p
> > of a spawn and query step for every test could we not consider caching
> > the information somewhere? Really any given binary should only need to
> > be queried once per run, not per test. =20
>=20
> Good idea.

Yep, it should be less taxing, than the currently posted qtest_has_accel()
version.
It will reduce worst complexity little bit to
   probbing_time * #test_binaries * number_targets * #push_req (all_forks)
but that's still explosive path.

> >> Given a less expensive approach exists, the qtest_has_accel()
> >> in its current form might be not justifiable.=20
> >>
> >>     =20
> >>>>> Does this series work with --disable-kvm builds? (TCG-only builds?)=
   =20
> >>>> I'll test. But on the first glance it should work without issues.
> >>>> (i.e. kvm only tests will be skipped).
> >>>>    =20
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>> CLaudio
> >>>>>
> >>>>>   =20
> >>>>>>
> >>>>>> For an example:
> >>>>>>  test q35 machine with intel_iommu
> >>>>>>  This test will run only is KVM is available and fail
> >>>>>>  to start QEMU if it fallsback to TCG, thus failing whole test.
> >>>>>>  So if test is executed in VM where nested KVM is not enabled
> >>>>>>  or on other than x86 host, it will break 'make check-qtest'
> >>>>>>
> >>>>>> Series adds a lightweight qtest_has_kvm() check, which abuses
> >>>>>> build system and should help to avoid running KVM only tests
> >>>>>> on hosts that do not support it.
> >>>>>>
> >>>>>> PS:
> >>>>>> there is an alternative 'query-accels' QMP command proposal
> >>>>>> https://patchwork.kernel.org/project/qemu-devel/patch/202105032110=
20.894589-3-philmd@redhat.com/
> >>>>>> which I think is more robust compared to qtest_has_kvm() and
> >>>>>> could be extended to take into account machine type.
> >>>>>> But it's more complex and what I dislike about it most,
> >>>>>> it requires execution of 'probing' QEMU instance to find
> >>>>>> execute 'query-accels' QMP command, which is rather resource
> >>>>>> consuming. So I'd use query-accels approach only when it's
> >>>>>> the only possible option to minimize load on CI systems.
> >>>>>>
> >>>>>> Igor Mammedov (2):
> >>>>>>   tests: acpi: q35: test for x2APIC entries in SRAT
> >>>>>>   tests: acpi: update expected tables blobs
> >>>>>>
> >>>>>> root (1):
> >>>>>>   tests: qtest: add qtest_has_kvm() to check if tested bynary supp=
orts
> >>>>>>     KVM
> >>>>>>
> >>>>>>  tests/qtest/libqos/libqtest.h    |   7 +++++++
> >>>>>>  meson.build                      |   1 +
> >>>>>>  tests/data/acpi/q35/APIC.numamem | Bin 0 -> 2686 bytes
> >>>>>>  tests/data/acpi/q35/DSDT.numamem | Bin 7865 -> 35222 bytes
> >>>>>>  tests/data/acpi/q35/FACP.numamem | Bin 0 -> 244 bytes
> >>>>>>  tests/data/acpi/q35/SRAT.numamem | Bin 224 -> 5080 bytes
> >>>>>>  tests/qtest/bios-tables-test.c   |  10 +++++++---
> >>>>>>  tests/qtest/libqtest.c           |  20 ++++++++++++++++++++
> >>>>>>  8 files changed, 35 insertions(+), 3 deletions(-)
> >>>>>>  create mode 100644 tests/data/acpi/q35/APIC.numamem
> >>>>>>  create mode 100644 tests/data/acpi/q35/FACP.numamem
> >>>>>>      =20
> >>>>>   =20
> >>>>    =20
> >>> =20
> >=20
> >  =20
>=20


