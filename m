Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ED865150F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:43:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Nu8-0005sV-Oc; Mon, 19 Dec 2022 16:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p7Nu6-0005ro-3m; Mon, 19 Dec 2022 16:42:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p7Nu2-00061a-M4; Mon, 19 Dec 2022 16:42:33 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJLfYpE005159; Mon, 19 Dec 2022 21:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FtsTCDRU07oIKWWVcRHnmE6ZzGRBJ01IScVBeiW7Rmk=;
 b=DFyJAYSBQgzyHw0SYNMTBL3oSp47cn8TnOWirDJCcPI4q8/pRwtS6bvGDz7SwHlrbHjj
 IZzai4Sqi88Xka0e2USSnV2H0QvrUvwg0xSozz48zpYXbgFRK4JwPPZTVfhjPzVrdQC5
 3bCUWD10T52UVslUeqqgeWH2O5+mE/U3uppVQnX84iAAtCrDWNLF7o36dzkbI3SJkzef
 tdPXn0+3bNZIFBs2wEyxLP6nBZ1L68WDEw5A6avb7VzPVvTIipIlnVEbs9IXiVG4NaN7
 jcIDsL/xpmOA/+aDGP0cC9qRLfhlomzIDhF4zGtLx5u61mpjMe/RrN0elYnsBz2tXthE gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk03h81nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 21:42:24 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJLfecU006070;
 Mon, 19 Dec 2022 21:42:23 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk03h81ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 21:42:23 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJEAlJG014393;
 Mon, 19 Dec 2022 21:42:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mh6yw34ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 21:42:21 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJLgHQt44499342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 21:42:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B3CE20043;
 Mon, 19 Dec 2022 21:42:17 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D20F020040;
 Mon, 19 Dec 2022 21:42:16 +0000 (GMT)
Received: from [9.171.48.233] (unknown [9.171.48.233])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 21:42:16 +0000 (GMT)
Message-ID: <a22b5aa0b84306ecdc288762f686bdba81e5f178.camel@linux.ibm.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Ulrich Weigand <ulrich.weigand@de.ibm.com>
Date: Mon, 19 Dec 2022 22:42:16 +0100
In-Reply-To: <877cyrgvea.fsf@linaro.org>
References: <20220704224844.2903473-1-iii@linux.ibm.com>
 <YsQ1fuMRPpA+9AzX@redhat.com>
 <CAFEAcA-4=A6NWrpCo5=cBO=v2-GVwK+b5RcgFiJcZN6e-Kb=GQ@mail.gmail.com>
 <9dc00e0032b3d753a18f2e9bbec4554402dc6aa4.camel@linux.ibm.com>
 <CAFEAcA_Twju4rnn0f97nEshorwbaDK2n0vcdMXDWcwuuguikzQ@mail.gmail.com>
 <ad7a0620ca3279ab857050b2850f3e1e330539c7.camel@linux.ibm.com>
 <877cyrgvea.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aPO5Jvv00EeYoPv1UwcI5K1vcyjlBBZ-
X-Proofpoint-ORIG-GUID: QNc0m1fdFGil_dSkACcSHvM7k4Tvnvrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190189
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2022-12-16 at 15:10 +0000, Alex Benn=C3=A9e wrote:
>=20
> Ilya Leoshkevich <iii@linux.ibm.com> writes:
>=20
> > On Tue, 2022-07-05 at 15:40 +0100, Peter Maydell wrote:
> > > On Tue, 5 Jul 2022 at 15:37, Ilya Leoshkevich <iii@linux.ibm.com>
> > > wrote:
> > > >=20
> > > > On Tue, 2022-07-05 at 14:57 +0100, Peter Maydell wrote:
> > > > > On Tue, 5 Jul 2022 at 14:04, Daniel P. Berrang=C3=A9
> > > > > <berrange@redhat.com>
> > > > > wrote:
> > > > > > If we put this job in QEMU CI someone will have to be able
> > > > > > to
> > > > > > interpret the results when it fails.
> > > > >=20
> > > > > In particular since this is qemu-user, the answer is probably
> > > > > at least some of the time going to be "oh, well, qemu-user
> > > > > isn't
> > > > > reliable
> > > > > if you do complicated things in the guest". I'd be pretty
> > > > > wary of
> > > > > our
> > > > > having
> > > > > a "pass a big complicated guest code test suite under linux-
> > > > > user
> > > > > mode"
> > > > > in the CI path.
> > >=20
> > > > Actually exercising qemu-user is one of the goals here: just as
> > > > an
> > > > example, one of the things that the test suite found was commit
> > > > 9a12adc704f9 ("linux-user/s390x: Fix unwinding from signal
> > > > handlers"),
> > > > so it's not only about the ISA.
> > > >=20
> > > > At least for s390x, we've noticed that various projects use
> > > > qemu-user-based setups in their CI (either calling it
> > > > explicitly,
> > > > or
> > > > via binfmt-misc), and we would like these workflows to be
> > > > reliable,
> > > > even if they try complicated (within reason) things there.
> > >=20
> > > I also would like them to be reliable. But I don't think
> > > *testing* these things is the difficulty: it is having
> > > people who are willing to spend time on the often quite
> > > difficult tasks of identifying why something intermittently
> > > fails and doing the necessary design and implementation work
> > > to correct the problem. Sometimes this is easy (as in the
> > > s390 regression above) but quite often it is not (eg when
> > > multiple threads are in use, or the guest wants to do
> > > something complicated with clone(), etc).
> > >=20
> > > thanks
> > > -- PMM
> > >=20
> >=20
> > For what it's worth, we can help analyzing and fixing failures
> > detected
> > by the s390x wasmtime job. If something breaks, we will have to
> > look at
> > it anyway, and it's better to do this sooner than later.
>=20
> Sorry for necroing an old thread but I just wanted to add my 2p.

Thanks for that though; I've been cherry-picking this patch into my
private trees for some time now, and would be happy to see it go
upstream in some form.

> I think making 3rd party test suites easily available to developers
> is a worthy
> goal and there are a number that I would like to see including LTP
> and
> kvm-unit-tests. As others have pointed out I'm less sure about adding
> it
> to the gating CI.

Another third-party test suite that I found useful was the valgrind's
one. I'll post my thoughts about integrating wasmtime's and valgrind's
test suites below, unfortunately I'm not too familiar with LTP and
kvm-unit-tests.

Not touching the gating CI is fine for me.

> If we want to go forward with this we should probably think about how
> we
> would approach this generally:
>=20
> =C2=A0 - tests/third-party-suites/FOO?

Sounds good to me.

> =C2=A0 - should we use avocado as a wrapper or something else?
> =C2=A0=C2=A0=C2=A0 - make check-?

avocado sounds good; we might have to add a second wrapper for
producing tap output (see below).

One should definitely be able to specify the testsuite and the
architecture, e.g. `make check-third-party-wasmtime-s390x`.

In addition, we need to either hardcode or let the user choose
the way the testsuite it built and executed. I see 3 possibilities:

- Fully on the host. Easiest to implement, the results are also easy
  to debug. But this requires installing cross-toolchains manually,
  which is simple on some distros and not-so-simple on the others.

- Provide the toolchain as a Docker image. For wasmtime, the toolchain
  would include the Rust compiler and Cargo. This solves the problem
  with configuring the host, but introduces the next choice one has to
  make:

  - Build qemu on the host. Then qemu binary would have to be
    compatible with the container (e.g. no references to the latest
    greatest=C2=A0glibc functions).

    This is because wastime testsuite needs to run inside the
    container: it's driven by Cargo, which is not available on the=C2=A0
    host. It is possible to only build tests with Cargo and then run
    the resulting binaries manually, but there is more than one and I'm
    not sure how to get a list of them (if we decide to do this, in the
    worst case the list can be hardcoded).

    For valgrind it's a bit easier, since the test runner is not as
    complex as Cargo, and can therefore just follow the check-tcg
    approach.

  - Build qemu inside the container. 2x space and time required, one
    might also have to install additional -dev packages for extra qemu
    features. Also, a decision needs to be made on whether the qemu
    build directory ends up in the container (needs a rebuild on every
    run), in a volume (volume lifetime needs to be managed) or in a
    mounted host directory (this can cause selinux/ownership issues if
    not done carefully).

- Provide both toolchain and testsuite as a Docker image. Essentially
  same as above, but trades build time for download time. Also the
  results are slightly harder to debug, since the test binaries are
  now located inside the container.

Sorry for the long list, it's just that since we are discussing how to
enable this for a larger audience, I felt I needed to enumerate all the
options and pitfalls I could think of.

> =C2=A0 - ensuring the suites output tap for meson

At the moment Rust can output either json like this:

$ cargo test -- -Z unstable-options --format=3Djson
{ "type": "suite", "event": "started", "test_count": 1 }
{ "type": "test", "event": "started", "name": "test::hello" }
{ "type": "test", "name": "test::hello", "event": "ok" }
{ "type": "suite", "event": "ok", "passed": 1, "failed": 0, "ignored":
0, "measured": 0, "filtered_out": 0, "exec_time": 0.001460307 }

or xUnit like this:

$ cargo test -- -Z unstable-options --format=3Djunit

# the following is on a single line; formatted for clarity

<?xml version=3D"1.0" encoding=3D"UTF-8"?>
<testsuites>
  <testsuite name=3D"test" package=3D"test" id=3D"0" errors=3D"0" failures=
=3D"0"
tests=3D"1" skipped=3D"0">
    <testcase classname=3D"integration" name=3D"test::hello" time=3D"0"/>
    <system-out/>
    <system-err/>
  </testsuite>
</testsuites>

I skimmed the avocado docs and couldn't find whether it can convert
between different test output formats.=C2=A0Based on the source code, we ca=
n
add an XUnitRunner the same way the TAPRunner was added.

In the worst case we can pipe json to a script that would output tap.

Enhancing Rust is also an option, of course, even though this might
take some time.

> =C2=A0 - document in docs/devel/testing.rst

Right, we need this too; I totally ignored it in this patch.

> Also I want to avoid adding stuff to tests/docker/dockerfiles that
> aren't directly related to check-tcg and the cross builds. I want to
> move away from docker.py so for 3rd party suites lets just call
> docker/podman directly.

We could add the dockerfiles (if we decide we need them based on
the discussion above) to tests/third-party-suites/FOO. My question is,
would it be possible to build and publish the images on GitLab? Or
is it better to build them on developers' machines?

> > Best regards,
> > Ilya

