Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C931654D1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 03:09:17 +0100 (CET)
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4bHA-00079J-JO
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 21:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1j4bF9-0004gw-9a
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 21:07:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1j4bF6-0005pw-Uj
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 21:07:11 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26461
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1j4bF6-0005pe-Pm
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 21:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582164428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XaQPYq/v3CXiYfgvL/YFGiyYoAdrCuYwpIFfBbZvh8I=;
 b=Y/nCEMAT/43BL/JeyfhYAV+TXGp9L/9BLx5zgtuBJzly50jI5X3TM67GjKMIasB8vjH9Fm
 iReCugpSjVDs/FblaTxf8ZqhDVhh171NsofhbWmj2O+shsHuhlCV6vaGGxysyABVEEaVM7
 +jrT3J+1kx4eBqPXwgwg27V23yRx+iI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-487cRl_EMQ6Tz27h4w2xvg-1; Wed, 19 Feb 2020 21:07:01 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED25189F760;
 Thu, 20 Feb 2020 02:07:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-89.rdu2.redhat.com
 [10.10.120.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A36119C4F;
 Thu, 20 Feb 2020 02:06:55 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 0/3] Acceptance test: Add "boot_linux" acceptance test
Date: Wed, 19 Feb 2020 21:06:49 -0500
Message-Id: <20200220020652.16276-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 487cRl_EMQ6Tz27h4w2xvg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This acceptance test, validates that a full blown Linux guest can
successfully boot in QEMU.  In this specific case, the guest chosen is
Fedora version 31.  It covers the following architectures and
machine types:

 * x86_64, pc-i440fx and pc-q35 machine types, with TCG and KVM as
   accelerators

 * aarch64 and virt machine type, with TCG and KVM as accelerators

 * ppc64 and pseries machine type with TCG as accelerator

 * s390x and s390-ccw-virtio machine type with TCG as accelerator

This has been tested on x86_64, ppc64le and aarch64 hosts and has been
running reliably (in my experience) on Travis CI.

Git:
  - URI: https://github.com/clebergnu/qemu/tree/test_boot_linux_v9
  - Remote: https://github.com/clebergnu/qemu
  - Branch: test_boot_linux_v9

Travis CI:
  - Build: https://travis-ci.org/clebergnu/qemu/builds/652694503

Previous version:
  - v8: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04095.html
  - v7: https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg00220.html
  - v6: https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg01202.html
  - v5: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04652.html
  - v4: https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg02032.html
  - v3: https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg01677.html
  - v2: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg04318.html
  - v1: http://lists.nongnu.org/archive/html/qemu-devel/2018-09/msg02530.ht=
ml

Changes from v8:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Renamed "BLD_DIR" to "BUILD_DIR", "SRC_DIR" to "SOURCE_DIR" and dropped
  "LNK_DIR" variables on tests/acceptance/avocado_qemu/__init__.py

* Changed memory allocation to 1024 MB, so that it puts less pressure on
  the host memory, and should be compatible with 32bit hosts (I've found
  no significant effects to the test times)

* Explicitly enabled TCG and skip tests if it's not available

* Added tags for when accel is TCG ("accel:tcg")

* Added additional tags for "pc" alias, that is, "pc-i440fx"

* Renamed tests to make the machine type and accellerator more explicit:
  - BootLinuxX8664.test_pc =3D> BootLinuxX8664.test_pc_i440fx_tcg
  - BootLinuxX8664.test_pc_kvm =3D> BootLinuxX8664.test_pc_i440fx_kvm
  - BootLinuxX8664.test_q35 =3D> BootLinuxX8664.test_pc_q35_tcg
  - BootLinuxX8664.test_kvm_q35 =3D> BootLinuxX8664.test_pc_q35_kvm
  - BootLinuxAarch64.test_virt =3D> BootLinuxAarch64.test_virt_tcg
  - BootLinuxAarch64.test_kvm_virt =3D> BootLinuxAarch64.test_virt_kvm
  - BootLinuxPPC64.test_pseries =3D> BootLinuxPPC64.test_pseries_tcg
  - BootLinuxS390X.test_s390_ccw_virtio =3D> BootLinuxS390X.test_s390_ccw_v=
irtio_tcg

* Renamed target "get-vmimage" to "get-vm-images", and added a help
  entry under "check-help".

* Bumped pycdlib version to 1.9.0, which contains an endianess bug that
  was seen on s390x hosts.

Changes from v7:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This version drops a number of commits that had been already reviewed
and have been merged:

 * Dropped commit "Acceptance tests: use relative location for tests",
   already present in the latest master.

 * Dropped commit "Acceptance tests: use avocado tags for machine type",
   already present in the latest master.

 * Dropped commit: "Acceptance tests: introduce utility method for tags
   unique vals", already present in the latest master.

With regards to the handling of the build directory, and the usage of
a qemu-img binary from the build tree, the following changed:

 * Dropped commit "Acceptance tests: add the build directory to the
   system PATH", because the qemu-img binary to be used is now
   explicitly defined, instead of relying on the modification of the
   PATH environment variable.

 * Dropped commit "Acceptance tests: depend on qemu-img", replaced by
   explicitly setting the qemu-img binary to be used for snapshot
   generation.  Also, the newly added "--enable-tools" configure line
   on Travis CI makes sure that a matching qemu-img binary is
   available on CI.

 * Dropped commit "Acceptance tests: keep a stable reference to the
   QEMU build dir", replaced by a different approach that introduces
   variables tracking the build dir, source dir and link (from build
   to source) dir.

 * New commit "Acceptance tests: introduce BLD_DIR, SRC_DIR and
   LNK_DIR".

 * New commit "Acceptance tests: add make targets to download images",
   that downloads the cloud images, aka vmimages, before the test
   execution itself.

 * New commit "[TO BE REMOVED] Use Avocado master branch + vmimage fix"
   to facilitate the review/test of this version.

Additionally:

  * The check for the availability of kvm now makes use of the
    strengthened qemu.accel.kvm_available() and passes the QEMU binary
    as an argument to make sure KVM support is compiled into that
    binary.

 * The timeout was increased to 900 seconds.  This is just one extra
   step to avoid false negatives on very slow systems.  As a
   comparison, on Travis CI, on a x86_64 host, the slowest test takes
   around 250 seconds (boot_linux.py:BootLinuxAarch64.test_virt).  On
   x86_64 systems with KVM enabled, my experience is that a test will
   take around 15 seconds.

Changes from v6:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Bumped Fedora to most recently released version (31).

 * Included new architectures (ppc64 and s390x), consolidating all
   tests into the same commit.

 * New commit: "Acceptance tests: use avocado tags for machine type"

 * New commit: "Acceptance tests: introduce utility method for tags
   unique vals"

 * New commit: "Acceptance test x86_cpu_model_versions: use default
   vm", needed to normalize the use of the machine type tags

 * Added a lot of leniency to the test setup (and reliability to the
   test/job), canceling the test if there are any failures while
   downloading/preparing the boot images.

 * Made use of Avocado's data drainer a regular feature (dropped the
   commit with RFC) and squashed it.

 * Bumped pycdlib version to 1.8.0

 * Dropped explicit "--enable-slirp=3Dgit" (added on v5) to Travis CI
   configure line, as the default configuration on Travis CI now
   results in user networking capabilities.

Changes from v5:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Added explicit "--enable-slirp=3Dgit" to Travis CI configure line, as
   these tests depend on "-netdev user" like networking.

 * Bumped Fedora to most recently released version (30).

 * Changed "checksum" parameter to 'sha256' and use the same hashes as
   provided by the Fedora project (instead of using Avocado's default
   sha1 and compute and use a different hash value).

 * New commit: Add "boot_linux" test for aarch64 and virt machine type

 * New commit: [RFC]: use Avocado data drainer for console logging

Changes from v4:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * New commit "Acceptance tests: use relative location for tests"

 * New commit "Acceptance tests: keep a stable reference to the QEMU build =
dir"

 * Pinned the Fedora 29 image by adding a checksum.  The goal is to
   never allow more than one component to change at a time (the one
   allowed to change is QEMU itself).  Updates to the image should be
   manual. (Based on comments from Cornelia)

 * Moved the downloading of the Fedora 29 cloud image to the test
   setUp() method, canceling the test if the image can not be
   downloaded.

 * Removed the ":avocado: enable" tag, given that Avocado versions
   68.0 and later operate on a "recursive by default" manner, that
   is able to correctly identify this as an Avocado test.

Changes from v3:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * New patch "Acceptance tests: depend on qemu-img"

Known Issues on v3 (no longer applicable):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * A recent TCG performance regression[1] affects this test in a
   number of ways:
   - The test execution may timeout by itself
   - The generation of SSH host keys in the guest's first boot is also
     affected (possibly also a timeout)
   - The cloud-init "phone home" feature attempts to read the host keys
     and fails, causing the test to timeout and fail

   These are not observed anymore once the fix[2] is applied.

[1] - https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg00338.html
[2] - https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg01129.html

Changes from v2:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Updated the tag to include the "arch:" key, in a similar fashion as to
   the tests in the "Acceptance Tests: target architecture support":
   - https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg00369.html

 * Renamed the test method name to test_x86_64_pc, again, similarly to the
   boot_linux_console.py tests in the series mentioned before.

 * Set the machine type explicitly, again similarly to the
   boot_linux_console.py tests in the series mentioned before.

 * Added messages after the launch of the VM, to let test runners know
   the test know waits for a boot confirmation from the the guest (Eduardo)=
.

 * Updated commit message to reflect the fact that this version does
   not allow for parameterization of the guest OS, version, etc.

 * Dropped the RFC prefix on patch "RFC: Acceptance tests: add the
   build directory to the system PATH"

 * Changed the comments on "RFC: Acceptance tests: add the build
   directory to the system PATH" to make it clear the addition of a
   the build directory to the PATH may influence other utility code.

Changes from v1:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * The commit message was adjusted, removing the reference to the
   avocado.utils.vmimage encoding issue on previous Avocado versions
   (<=3D 64.0) and the fix that would (and was) included in Avocado
   version 65.0.

 * Effectively added pycdlib=3D=3D1.6.0 to the requirements.txt file,
   added on a56931eef3, and adjusted the commit message was also
   to reflect that.

 * Updated the default version of the guest OS, from Fedora 28 to 29.
   Besides possible improvements in the (virtual) hardware coverage,
   it brings a performance improvement in the order of 20% to the
   test.

 * Removed all direct parameters usage.  Because some parameters and
   its default values implemented in the test would prevent it from
   running on some environments.  Example: the "accel" parameter had a
   default value of "kvm", which would prevent this test, that boots a
   x86_64 OS, from running on a host arch different than x86_64.  I
   recognize that it's desirable to make tests reusable and
   parameterized (that was the reason for the first version doing so),
   but the mechanism to be used to define the architectures that a
   given test should support is still an open issue, and has been
   discussed in other threads.  I'll follow up those discussions with
   a proposal, and until then, removing those aspects from this test
   implementation seemed to be the best option.  A caveat: this test
   currently adds the same tag (x86_64) and follows other assumptions
   made on "boot_linux_console.py", that is, that a x86_64 target
   binary will be used to run it.  If a user is in an environment that
   does not have a x86_64 target binary, it could filter those tests
   out with: "avocado run --filter-by-tags=3D'-x86_64' tests/acceptance".

 * Removed most arguments to the QEMU command line for pretty much the
   same reasons described above, and by following the general
   perception that I could grasp from other discussions that QEMU
   defaults should preferrably be used.  This test, as well as others,
   can and should be extended later to allow for different test
   scenarios by passing well documented parameter values.  That is,
   they should respect well-known parameters such as "accel" mentioned
   above, so that the same test can run with KVM or TCG.

 * Changed the value of the memory argument to 1024, which based on
   my experimentations and observations is the minimum amount of RAM
   for the Fedora 29 cloud image to sucessfully boot on QEMU.  I know
   there's no such thing as a "one size fits all", specially for QEMU,
   but this makes me wonder wether a x86_64 machine type shouldn't
   have its default_ram_size bumped to a number practical enough to
   run modern operating systems.

 * Added a new patch "RFC: Acceptance tests: add the build directory
   to the system PATH", which is supposed to gather feedback on how to
   enable the use of built binaries, such as qemu-img, to code used by
   the test code.  The specific situation here is that the vmimage,
   part of the avocado.utils libraries, makes use of qemu-img to create
   snapshot files.  Even though we could require qemu-img to be installed
   as a dependency of tests, system wide, it actually goes against the
   goal of testing all QEMU things from the source/build tree.  This
   became aparent with tests running on environments such as Travis CI,
   which don't necessarily have qemu-img available elsewhere.

Cleber Rosa (3):
  Acceptance tests: introduce BUILD_DIR and SOURCE_DIR
  Acceptance test: add "boot_linux" tests
  Acceptance tests: add make targets to download images

 .travis.yml                               |   2 +-
 tests/Makefile.include                    |  19 +-
 tests/acceptance/avocado_qemu/__init__.py |  25 ++-
 tests/acceptance/boot_linux.py            | 215 ++++++++++++++++++++++
 tests/requirements.txt                    |   3 +-
 5 files changed, 254 insertions(+), 10 deletions(-)
 create mode 100644 tests/acceptance/boot_linux.py

--=20
2.21.1


