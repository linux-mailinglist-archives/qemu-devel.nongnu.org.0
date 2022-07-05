Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D925670BF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:17:40 +0200 (CEST)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jMw-0006qI-Lw
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1o8jJa-0003uc-77; Tue, 05 Jul 2022 10:14:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1o8jJX-0001qX-5x; Tue, 05 Jul 2022 10:14:09 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265E50wV013588;
 Tue, 5 Jul 2022 14:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KvyuA67+JBp039ymy3VkaWujc0DsKZk6ObMFpKzPn0A=;
 b=AXSDJ3Fxx2Fu26TxM2BAdhguCcuj2k3SXvDN1WUBarkr06JAhfqk72vm0RaIZDq5ZIFV
 UE76orJvBZtE2TU2MkILA+OB63+xGn+rv/glU2IhrBhHE3Ov5L6W6JMAHhcVDySiJrdB
 f4t+OGTnJy6xiUosNREHYV2tkzCPKxunL0/760j/d84mgU35rKtbA/jqeVS7lLsFxkDZ
 qmGvdU4vddg9QhW2qpBhsoKGSp1GcxwVoAoiKLAh1rF7SvXtFrJev4URo7YuZZ6ceaLj
 oAfcaQGRycuan0stCi9TiFBvLQ+Xdsad4lhIr+FtJ3u6tsqHJ4wKjtd3hqrBxYwx0b5K LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4mqqbkkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 14:14:02 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265E5FSV016083;
 Tue, 5 Jul 2022 14:14:01 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4mqqbkj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 14:14:01 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 265E5hTQ030275;
 Tue, 5 Jul 2022 14:13:59 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3h2d9jc50t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 14:13:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 265EDtdJ12976628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jul 2022 14:13:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A94E152051;
 Tue,  5 Jul 2022 14:13:55 +0000 (GMT)
Received: from [9.171.47.233] (unknown [9.171.47.233])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 282775204E;
 Tue,  5 Jul 2022 14:13:55 +0000 (GMT)
Message-ID: <c6c25d8f5c79e460f1a73f89db9033c362265feb.camel@linux.ibm.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Ulrich Weigand <ulrich.weigand@de.ibm.com>
Date: Tue, 05 Jul 2022 16:13:54 +0200
In-Reply-To: <YsQ1fuMRPpA+9AzX@redhat.com>
References: <20220704224844.2903473-1-iii@linux.ibm.com>
 <YsQ1fuMRPpA+9AzX@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YmdmYPO6whpkDQlGmpZIgNx5mV0GWg2O
X-Proofpoint-GUID: KYCXdnwxcVq9Kkv3gcYgjGni9VUnT7EJ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_10,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-07-05 at 13:58 +0100, Daniel P. Berrangé wrote:
> On Tue, Jul 05, 2022 at 12:48:44AM +0200, Ilya Leoshkevich wrote:
> > wasmtime is a WebAssembly runtime, which includes a large
> > testsuite.
> > This testsuite uses qemu-user (aarch64 and s390x are supported) in
> > order to exercise foreign architectures.
> 
> So you're saying that WebAssembly itself is aware of qemu-user
> in its test suite, as opposed to us simply choosing to run its
> test suite under qemu-user ?

WebAssembly can be configured to run tests under qemu-user using
cargo environment variables:

https://doc.rust-lang.org/nightly/cargo/reference/config.html#environment-variables

In this patch build-toolchain.sh sets
CARGO_TARGET_S390X_UNKNOWN_LINUX_GNU_RUNNER.


> Any idea why its limited to just two arches ?  Can it be made
> to cover all QEMU arches, or are these the only ones that
> wasmtime knows how to generate code for ?

I believe their code generator supports only aarch64, s390x and x64 at
the moment:

https://github.com/bytecodealliance/wasmtime/tree/v0.37.0/cranelift/codegen/src/isa

> >                                          Over time it found several
> > regressions in qemu itself, and it would be beneficial to catch the
> > similar ones earlier.
> 
> If we put this job in QEMU CI someone will have to be able to
> interpret the results when it fails.
> 
> How practical is it going to be for QEMU maintainers to understand
> a failure in wasmtime test suite, and correlate that back to a
> problem in QEMU ? The risk with introducing any significant 3rd
> party project to a CI system, is the lack of knowledge around
> that external project creating a signifcant burden for the CI
> system maintainers.

The following is my limited personal experience with the test suite.

While it is quite large, individual test cases tend to be small and
exercise only a single feature. Therefore, while looking into failures
does indeed require some Rust knowledge, normally one doesn't have to
understand the entire WebAssembly code base. Also this means that all
kinds of traces that QEMU can produce for a single test have a
reasonable size.

In addition, bisect is quite a powerful tool here, that's why I tried
to move as much logic as possible from gitlab and dockerfile
definitions to stand-alone scripts - this makes it possible to just use
`git bisect run tests/wasmtime/test s390x`.

The gitlab jobs build the testsuite without debuginfo due to time and
space restrictions on the gitlab builders. Just for some context, the
gitlab docker build runs on 1 CPU and takes ~40 minutes and 5G space.
When I do a local build with debuginfo, on a 4-core i3 it takes ~15
minutes and 20G space.

> > To this end, this patch introduces a job that runs stable wasmtime
> > testsuite against qemu-s390x. The job is split into the following
> > components:
> > 
> > - A script for running the tests. Usable on developers' machines:
> > 
> >     qemu$ mkdir build
> >     qemu$ cd build
> >     qemu/build$ ../tests/wasmtime/test s390x
> > 
> > - A script for building the tests (build-toolchain.sh).
> > 
> > - A dockerfile describing an image with the prebuilt testsuite
> >   (debian-s390x-wasmtime-cross.docker).
> > 
> > - gitlab job definition for building the image.
> > 
> > - gitlab job definition for using the image to run the tests.
> > 
> > It's possible to use this with aarch64 as well, but it segfaults at
> > the moment, therefore this patch does not provide job definitions
> > for
> > it. This needs to be investigated separately.
> > 
> > The example of a resulting pipeline can be seen at [1].
> > 
> > The test job runs for about 30 minutes mostly due to unnecessary
> > rebuilds. They will be gone once [2] is integrated and makes it to
> > a
> > stable release.
> > 
> > This patch depends on madvise(MADV_DONTNEED) passthrough support
> > [3].
> > 
> > [1] https://gitlab.com/iii-i/qemu/-/pipelines/579677396
> > [2] https://github.com/bytecodealliance/wasmtime/pull/4377
> > [3]
> > https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00112.html
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  .gitlab-ci.d/container-cross.yml              | 10 +++
> >  .gitlab-ci.d/container-template.yml           |  2 +-
> >  .gitlab-ci.d/qemu-project.yml                 |  1 +
> >  .gitlab-ci.d/wasmtime-template.yml            |  6 ++
> >  .gitlab-ci.d/wasmtime.yml                     |  9 ++
> >  tests/docker/Makefile.include                 |  6 ++
> >  .../build-toolchain.sh                        | 83
> > +++++++++++++++++++
> >  .../debian-s390x-wasmtime-cross.docker        | 16 ++++
> >  tests/wasmtime/test                           | 39 +++++++++
> >  9 files changed, 171 insertions(+), 1 deletion(-)
> >  create mode 100644 .gitlab-ci.d/wasmtime-template.yml
> >  create mode 100644 .gitlab-ci.d/wasmtime.yml
> >  create mode 100755 tests/docker/dockerfiles/debian-s390x-wasmtime-
> > cross.d/build-toolchain.sh
> >  create mode 100644 tests/docker/dockerfiles/debian-s390x-wasmtime-
> > cross.docker
> >  create mode 100755 tests/wasmtime/test
> > 
> > diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-
> > ci.d/container-cross.yml
> > index b7963498a3..b3c4b76a16 100644
> > --- a/.gitlab-ci.d/container-cross.yml
> > +++ b/.gitlab-ci.d/container-cross.yml
> > @@ -138,6 +138,16 @@ s390x-debian-cross-container:
> >    variables:
> >      NAME: debian-s390x-cross
> >  
> > +s390x-debian-wasmtime-cross-container:
> > +  extends: .container_job_template
> > +  stage: containers
> > +  needs: ['s390x-debian-cross-container']
> 
> This job is in 'containers' stage, but it depends on a container
> built in the same stage. Seems gitlab manages to schedule that
> by effectively delaying the the build. Suggests that actually we
> can entirely get rid of 'containers-layer2' and just let gitlab
> figure out the container dependencies.

Yes, that sounds reasonable. Using dependencies instead of (or in
addition to) stages for ordering jobs seems to be officially supported
by gitlab:

https://docs.gitlab.com/ee/ci/directed_acyclic_graph/index.html

> 
> > +  variables:
> > +    NAME: debian-s390x-wasmtime-cross
> > +    DOCKER_SCRIPT_ARGS: >
> > +      --extra-files
> > +      tests/docker/dockerfiles/debian-s390x-wasmtime-
> > cross.d/build-toolchain.sh
> 
> 
> > diff --git a/tests/docker/dockerfiles/debian-s390x-wasmtime-
> > cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-s390x-
> > wasmtime-cross.d/build-toolchain.sh
> > new file mode 100755
> > index 0000000000..a28d61a353
> > --- /dev/null
> > +++ b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-
> > toolchain.sh
> > @@ -0,0 +1,83 @@
> > +#!/bin/sh
> > +
> > +# Build the stable wasmtime testsuite and run it with qemu-user
> > from $PATH.
> > +# ".rustup", ".cargo" and "wasmtime" subdirectories will be
> > created or updated
> > +# in the current directory.
> > +#
> > +# Based on
> > https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/.github/workflows/main.yml#L208
> > .
> > +#
> > +# Usage:
> > +#
> > +#     ./test TARGET_ARCH [CARGO_ARGS ...]
> > +#
> > +# where TARGET_ARCH is the architecture to test (aarch64 or s390x)
> > and
> > +# CARGO_ARGS are the extra arguments passed to cargo test.
> > +
> > +set -e -u -x
> > +
> > +# Dependency versions.
> > +export RUSTUP_TOOLCHAIN=1.62.0
> > +
> > +# Bump when
> > https://github.com/bytecodealliance/wasmtime/pull/4377 is
> > +# integrated. Until this moment there will be some unnecessary
> > rebuilds.
> > +wasmtime_version=0.37.0
> > +
> > +# Script arguments.
> > +arch=$1
> > +shift
> > +arch_upper=$(echo "$arch" | tr '[:lower:]' '[:upper:]')
> > +
> > +# Install/update Rust.
> > +export RUSTUP_HOME="$PWD/.rustup"
> > +export CARGO_HOME="$PWD/.cargo"
> > +curl \
> > +    --proto '=https' \
> > +    --tlsv1.2 \
> > +    -sSf \
> > +    https://sh.rustup.rs \
> > +    | sh -s -- -y \
> > +        --default-toolchain="$RUSTUP_TOOLCHAIN" \
> > +        --target=wasm32-wasi \
> > +        --target=wasm32-unknown-unknown \
> > +        --target="$arch"-unknown-linux-gnu
> 
> Why can't we just install the distros' rust packages ?

Unfortunately they are too old. Debian 11's rust toolchain does not
support 2021 edition required by webassembly.

> > +cat >"$CARGO_HOME/config" <<HERE
> > +[build]
> > +# Save space by not generating data to speed-up delta builds.
> > +incremental = false
> > +
> > +[profile.test]
> > +# Save space by not generating debug information.
> > +debug = 0
> > +
> > +[net]
> > +# Speed up crates.io index update.
> > +git-fetch-with-cli = true
> > +HERE
> > +. "$PWD/.cargo/env"
> > +
> > +# Checkout/update wasmtime.
> > +if [ -d wasmtime ]; then
> > +    cd wasmtime
> > +    git fetch --force --tags
> > +    git checkout v"$wasmtime_version"
> > +    git submodule update --init --recursive
> > +else
> > +    git clone \
> > +        --depth=1 \
> > +        --recurse-submodules \
> > +        --shallow-submodules \
> > +        -b v"$wasmtime_version" \
> > +        https://github.com/bytecodealliance/wasmtime.git
> > +    cd wasmtime
> > +fi
> > +
> > +# Run wasmtime tests.
> > +export CARGO_BUILD_TARGET="$arch-unknown-linux-gnu"
> > +runner_var=CARGO_TARGET_${arch_upper}_UNKNOWN_LINUX_GNU_RUNNER
> > +linker_var=CARGO_TARGET_${arch_upper}_UNKNOWN_LINUX_GNU_LINKER
> > +eval "export $runner_var=\"qemu-$arch -L /usr/$arch-linux-gnu\""
> > +eval "export $linker_var=$arch-linux-gnu-gcc"
> > +export CARGO_PROFILE_DEV_OPT_LEVEL=2
> > +export WASMTIME_TEST_NO_HOG_MEMORY=1
> > +export RUST_BACKTRACE=1
> > +ci/run-tests.sh --locked "$@"
> 
> This build-toolchain.sh script is invoked during the dockerfile
> build stage, but it appears you're running the test suite here.
> Shouldn't this be left until the CI build job instead ?

The name of this script appears to be misleading. I chose it, because
it fit into the existing make/docker framework, but it would be better
to adjust it to support arbitrary names. The appropriate name here
would be something like `wasmtime-cargo-test-wrapper`, since in the
end ci/run-tests.sh just calls `cargo test`.

During the dockerfile build stage it's called with `--no-run`, so it
just compiles the test binaries.

> > diff --git a/tests/docker/dockerfiles/debian-s390x-wasmtime-
> > cross.docker b/tests/docker/dockerfiles/debian-s390x-wasmtime-
> > cross.docker
> > new file mode 100644
> > index 0000000000..d08a66dcc2
> > --- /dev/null
> > +++ b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker
> > @@ -0,0 +1,16 @@
> > +# Image containing pre-built wasmtime tests for s390x.
> > +
> > +FROM registry.gitlab.com/qemu-project/qemu/qemu/debian-s390x-
> > cross:latest
> > +
> > +RUN export DEBIAN_FRONTEND=noninteractive && \
> > +    eatmydata apt-get update && \
> > +    eatmydata apt-get dist-upgrade -y && \
> > +    eatmydata apt-get install --no-install-recommends -y \
> > +            curl \
> > +            libglib2.0-dev && \
> > +    eatmydata apt-get autoremove -y && \
> > +    eatmydata apt-get autoclean -y
> > +
> > +RUN mkdir /build
> > +ADD build-toolchain.sh /build
> > +RUN cd /build && ./build-toolchain.sh s390x --no-run
> 
> 
> Is this '--no-run' arg used by  ci/run-tests.sh in some way ?

Yes, see my answer above.

> > diff --git a/tests/wasmtime/test b/tests/wasmtime/test
> > new file mode 100755
> > index 0000000000..10e2c3f886
> > --- /dev/null
> > +++ b/tests/wasmtime/test
> > @@ -0,0 +1,39 @@
> > +#!/bin/sh
> > +
> > +# Build qemu-user in the current directory, build the stable
> > wasmtime
> > +# testsuite, and test them together. ".rustup", ".cargo" and
> > "wasmtime"
> > +# subdirectories, as well as qemu build files, will be created or
> > updated in
> > +# the current directory.
> > +#
> > +# Based on
> > https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/.github/workflows/main.yml#L208
> > .
> > +#
> > +# Usage:
> > +#
> > +#     ./test TARGET_ARCH [CARGO_ARGS ...]
> > +#
> > +# where TARGET_ARCH is the architecture to test (aarch64 or s390x)
> > and
> > +# CARGO_ARGS are the extra arguments passed to cargo test.
> > +
> > +set -e -u -x
> > +
> > +# Script arguments.
> > +arch=$1
> > +shift
> > +
> > +# Build QEMU.
> > +srcdir=$(cd "$(dirname "$0")" && pwd)/../..
> > +docker_files_dir="$srcdir"/tests/docker/dockerfiles
> > +"$srcdir"/configure \
> > +    --target-list="$arch"-linux-user \
> > +    --disable-tools \
> > +    --disable-slirp \
> > +    --disable-fdt \
> > +    --disable-capstone \
> > +    --disable-docs
> > +make --output-sync -j"$(nproc)"
> > +export PATH="$PWD:$PATH"
> > +
> > +# Run wasmtime tests.
> > +exec \
> > +    "$docker_files_dir"/debian-s390x-wasmtime-cross.d/build-
> > toolchain.sh \
> > +    "$arch" "$@"
> > -- 
> > 2.35.3
> > 
> > 
> 
> With regards,
> Daniel

