Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE97310376
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 04:22:35 +0100 (CET)
Received: from localhost ([::1]:39714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7rha-0007B3-AD
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 22:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7rfw-0005mr-7y
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 22:20:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:49944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7rfr-0002NF-Nv
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 22:20:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7rfp-0002eX-MS
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 03:20:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A86062E8137
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 03:20:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Feb 2021 02:59:47 -0000
From: lizhijian <1914696@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: zhijianli88
X-Launchpad-Bug-Reporter: lizhijian (zhijianli88)
X-Launchpad-Bug-Modifier: lizhijian (zhijianli88)
Message-Id: <161249398803.13999.15324457641617983607.malonedeb@soybean.canonical.com>
Subject: [Bug 1914696] [NEW] aarch64: migration failed: Segmentation fault
 (core dumped)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 0d7933b0ca7f1357de87acbdf92666e7753845ab
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1914696 <1914696@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a security vulnerability ***

Public security bug reported:

reproduce:

arch: aarch64
source qemu: v4.2.0
destination qemu: 1ed9228f63ea4bcc0ae240365305ee264e9189ce

cmdline:
source: =

$ ./aarch64-softmmu/qemu-system-aarch64     -name 'avocado-vt-vm1'    -mach=
ine virt-4.2,gic-version=3Dhost,graphics=3Don     -nodefaults     -m 1024  =
    -smp 2      -cpu 'host'     -vnc :10      -enable-kvm     -monitor stdio
(qemu) =

(qemu) migrate -d tcp:10.19.241.167:888
(qemu) info status
VM status: paused (postmigrate)

destination: =

./build/aarch64-softmmu/qemu-system-aarch64 -name 'avocado-vt-vm1'  -machin=
e virt-4.2,gic-version=3Dhost,graphics=3Don     -nodefaults     -m 1024    =
  -smp 2      -cpu 'host'     -vnc :10      -enable-kvm     -monitor stdio =
-incoming tcp:0:888
QEMU 5.2.50 monitor - type 'help' for more information
(qemu) Segmentation fault (core dumped)


i have bisected and confirmed that the first bad commit is: [f9506e162c33e8=
7b609549157dd8431fcc732085] target/arm: Remove ARM_FEATURE_VFP*

bisect log:
git bisect log
# bad: [1ed9228f63ea4bcc0ae240365305ee264e9189ce] Merge remote-tracking bra=
nch 'remotes/ericb/tags/pull-nbd-2021-02-02-v2' into staging
git bisect bad 1ed9228f63ea4bcc0ae240365305ee264e9189ce
# good: [b0ca999a43a22b38158a222233d3f5881648bb4f] Update version for v4.2.=
0 release
git bisect good b0ca999a43a22b38158a222233d3f5881648bb4f
# bad: [59093cc407cb044c72aa786006a07bd404eb36b9] hw/char: Convert the Ibex=
 UART to use the registerfields API
git bisect bad 59093cc407cb044c72aa786006a07bd404eb36b9
# bad: [4dabf39592e92d692c6f2a1633571114ae25d843] aspeed/smc: Fix DMA suppo=
rt for AST2600
git bisect bad 4dabf39592e92d692c6f2a1633571114ae25d843
# good: [93c86fff53a267f657e79ec07dcd04b63882e330] Merge remote-tracking br=
anch 'remotes/pmaydell/tags/pull-target-arm-20200207' into staging
git bisect good 93c86fff53a267f657e79ec07dcd04b63882e330
# bad: [2ac031d171ccd18c973014d9978b4a63f0ad5fb0] Merge remote-tracking bra=
nch 'remotes/palmer/tags/riscv-for-master-5.0-sf3' into staging
git bisect bad 2ac031d171ccd18c973014d9978b4a63f0ad5fb0
# good: [4036b7d1cd9fb1097a5f4bc24d7d31744256260f] target/arm: Use isar_fea=
ture function for testing AA32HPD feature
git bisect good 4036b7d1cd9fb1097a5f4bc24d7d31744256260f
# good: [002375895c10df40615fc615e2639f49e0c442fe] tests/iotests: be a litt=
le more forgiving on the size test
git bisect good 002375895c10df40615fc615e2639f49e0c442fe
# good: [c695724868ce4049fd79c5a509880dbdf171e744] target/riscv: Emulate TI=
ME CSRs for privileged mode
git bisect good c695724868ce4049fd79c5a509880dbdf171e744
# good: [f67957e17cbf8fc3cc5d1146a2db2023404578b0] target/arm: Add isar_fea=
ture_aa32_{fpsp_v2, fpsp_v3, fpdp_v3}
git bisect good f67957e17cbf8fc3cc5d1146a2db2023404578b0
# bad: [a1229109dec4375259d3fff99f362405aab7917a] target/arm: Implement v8.=
4-RCPC
git bisect bad a1229109dec4375259d3fff99f362405aab7917a
# bad: [906b60facc3d3dd3af56cb1a7860175d805e10a3] target/arm: Add formats f=
or some vfp 2 and 3-register insns
git bisect bad 906b60facc3d3dd3af56cb1a7860175d805e10a3
# good: [c52881bbc22b50db99a6c37171ad3eea7d959ae6] target/arm: Replace ARM_=
FEATURE_VFP4 with isar_feature_aa32_simdfmac
git bisect good c52881bbc22b50db99a6c37171ad3eea7d959ae6
# good: [f0f6d5c81be47d593e5ece7f06df6fba4c15738b] target/arm: Move the vfp=
 decodetree calls next to the base isa
git bisect good f0f6d5c81be47d593e5ece7f06df6fba4c15738b
# bad: [f9506e162c33e87b609549157dd8431fcc732085] target/arm: Remove ARM_FE=
ATURE_VFP*
git bisect bad f9506e162c33e87b609549157dd8431fcc732085
# good: [bfa8a370d2f5d4ed03f7a7e2987982f15fe73758] linux-user/arm: Replace =
ARM_FEATURE_VFP* tests for HWCAP
git bisect good bfa8a370d2f5d4ed03f7a7e2987982f15fe73758
# first bad commit: [f9506e162c33e87b609549157dd8431fcc732085] target/arm: =
Remove ARM_FEATURE_VFP*


the root cause is that, some feature bit is not consistent any more with be=
low changes in this commit:
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b29b0eddfc..05aa9711cd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1880,7 +1880,6 @@ QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <=
=3D R_V7M_CSSELR_INDEX_MASK);
  * mapping in linux-user/elfload.c:get_elf_hwcap().
  */
 enum arm_features {
-    ARM_FEATURE_VFP,
     ARM_FEATURE_AUXCR,  /* ARM1026 Auxiliary control register.  */
     ARM_FEATURE_XSCALE, /* Intel XScale extensions.  */
     ARM_FEATURE_IWMMXT, /* Intel iwMMXt extension.  */
@@ -1889,7 +1888,6 @@ enum arm_features {
     ARM_FEATURE_V7,
     ARM_FEATURE_THUMB2,
     ARM_FEATURE_PMSA,   /* no MMU; may have Memory Protection Unit */
-    ARM_FEATURE_VFP3,
     ARM_FEATURE_NEON,
     ARM_FEATURE_M, /* Microcontroller profile.  */
     ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
@@ -1900,7 +1898,6 @@ enum arm_features {
     ARM_FEATURE_V5,
     ARM_FEATURE_STRONGARM,
     ARM_FEATURE_VAPA, /* cp15 VA to PA lookups */
-    ARM_FEATURE_VFP4, /* VFPv4 (implies that NEON is v2) */
     ARM_FEATURE_GENERIC_TIMER,
     ARM_FEATURE_MVFR, /* Media and VFP Feature Registers 0 and 1 */
     ARM_FEATURE_DUMMY_C15_REGS, /* RAZ/WI all of cp15 crn=3D15 */

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914696

Title:
  aarch64: migration failed: Segmentation fault (core dumped)

Status in QEMU:
  New

Bug description:
  reproduce:

  arch: aarch64
  source qemu: v4.2.0
  destination qemu: 1ed9228f63ea4bcc0ae240365305ee264e9189ce

  cmdline:
  source: =

  $ ./aarch64-softmmu/qemu-system-aarch64     -name 'avocado-vt-vm1'    -ma=
chine virt-4.2,gic-version=3Dhost,graphics=3Don     -nodefaults     -m 1024=
      -smp 2      -cpu 'host'     -vnc :10      -enable-kvm     -monitor st=
dio
  (qemu) =

  (qemu) migrate -d tcp:10.19.241.167:888
  (qemu) info status
  VM status: paused (postmigrate)

  destination: =

  ./build/aarch64-softmmu/qemu-system-aarch64 -name 'avocado-vt-vm1'  -mach=
ine virt-4.2,gic-version=3Dhost,graphics=3Don     -nodefaults     -m 1024  =
    -smp 2      -cpu 'host'     -vnc :10      -enable-kvm     -monitor stdi=
o -incoming tcp:0:888
  QEMU 5.2.50 monitor - type 'help' for more information
  (qemu) Segmentation fault (core dumped)

  =

  i have bisected and confirmed that the first bad commit is: [f9506e162c33=
e87b609549157dd8431fcc732085] target/arm: Remove ARM_FEATURE_VFP*

  bisect log:
  git bisect log
  # bad: [1ed9228f63ea4bcc0ae240365305ee264e9189ce] Merge remote-tracking b=
ranch 'remotes/ericb/tags/pull-nbd-2021-02-02-v2' into staging
  git bisect bad 1ed9228f63ea4bcc0ae240365305ee264e9189ce
  # good: [b0ca999a43a22b38158a222233d3f5881648bb4f] Update version for v4.=
2.0 release
  git bisect good b0ca999a43a22b38158a222233d3f5881648bb4f
  # bad: [59093cc407cb044c72aa786006a07bd404eb36b9] hw/char: Convert the Ib=
ex UART to use the registerfields API
  git bisect bad 59093cc407cb044c72aa786006a07bd404eb36b9
  # bad: [4dabf39592e92d692c6f2a1633571114ae25d843] aspeed/smc: Fix DMA sup=
port for AST2600
  git bisect bad 4dabf39592e92d692c6f2a1633571114ae25d843
  # good: [93c86fff53a267f657e79ec07dcd04b63882e330] Merge remote-tracking =
branch 'remotes/pmaydell/tags/pull-target-arm-20200207' into staging
  git bisect good 93c86fff53a267f657e79ec07dcd04b63882e330
  # bad: [2ac031d171ccd18c973014d9978b4a63f0ad5fb0] Merge remote-tracking b=
ranch 'remotes/palmer/tags/riscv-for-master-5.0-sf3' into staging
  git bisect bad 2ac031d171ccd18c973014d9978b4a63f0ad5fb0
  # good: [4036b7d1cd9fb1097a5f4bc24d7d31744256260f] target/arm: Use isar_f=
eature function for testing AA32HPD feature
  git bisect good 4036b7d1cd9fb1097a5f4bc24d7d31744256260f
  # good: [002375895c10df40615fc615e2639f49e0c442fe] tests/iotests: be a li=
ttle more forgiving on the size test
  git bisect good 002375895c10df40615fc615e2639f49e0c442fe
  # good: [c695724868ce4049fd79c5a509880dbdf171e744] target/riscv: Emulate =
TIME CSRs for privileged mode
  git bisect good c695724868ce4049fd79c5a509880dbdf171e744
  # good: [f67957e17cbf8fc3cc5d1146a2db2023404578b0] target/arm: Add isar_f=
eature_aa32_{fpsp_v2, fpsp_v3, fpdp_v3}
  git bisect good f67957e17cbf8fc3cc5d1146a2db2023404578b0
  # bad: [a1229109dec4375259d3fff99f362405aab7917a] target/arm: Implement v=
8.4-RCPC
  git bisect bad a1229109dec4375259d3fff99f362405aab7917a
  # bad: [906b60facc3d3dd3af56cb1a7860175d805e10a3] target/arm: Add formats=
 for some vfp 2 and 3-register insns
  git bisect bad 906b60facc3d3dd3af56cb1a7860175d805e10a3
  # good: [c52881bbc22b50db99a6c37171ad3eea7d959ae6] target/arm: Replace AR=
M_FEATURE_VFP4 with isar_feature_aa32_simdfmac
  git bisect good c52881bbc22b50db99a6c37171ad3eea7d959ae6
  # good: [f0f6d5c81be47d593e5ece7f06df6fba4c15738b] target/arm: Move the v=
fp decodetree calls next to the base isa
  git bisect good f0f6d5c81be47d593e5ece7f06df6fba4c15738b
  # bad: [f9506e162c33e87b609549157dd8431fcc732085] target/arm: Remove ARM_=
FEATURE_VFP*
  git bisect bad f9506e162c33e87b609549157dd8431fcc732085
  # good: [bfa8a370d2f5d4ed03f7a7e2987982f15fe73758] linux-user/arm: Replac=
e ARM_FEATURE_VFP* tests for HWCAP
  git bisect good bfa8a370d2f5d4ed03f7a7e2987982f15fe73758
  # first bad commit: [f9506e162c33e87b609549157dd8431fcc732085] target/arm=
: Remove ARM_FEATURE_VFP*

  =

  the root cause is that, some feature bit is not consistent any more with =
below changes in this commit:
  diff --git a/target/arm/cpu.h b/target/arm/cpu.h
  index b29b0eddfc..05aa9711cd 100644
  --- a/target/arm/cpu.h
  +++ b/target/arm/cpu.h
  @@ -1880,7 +1880,6 @@ QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr)=
 <=3D R_V7M_CSSELR_INDEX_MASK);
    * mapping in linux-user/elfload.c:get_elf_hwcap().
    */
   enum arm_features {
  -    ARM_FEATURE_VFP,
       ARM_FEATURE_AUXCR,  /* ARM1026 Auxiliary control register.  */
       ARM_FEATURE_XSCALE, /* Intel XScale extensions.  */
       ARM_FEATURE_IWMMXT, /* Intel iwMMXt extension.  */
  @@ -1889,7 +1888,6 @@ enum arm_features {
       ARM_FEATURE_V7,
       ARM_FEATURE_THUMB2,
       ARM_FEATURE_PMSA,   /* no MMU; may have Memory Protection Unit */
  -    ARM_FEATURE_VFP3,
       ARM_FEATURE_NEON,
       ARM_FEATURE_M, /* Microcontroller profile.  */
       ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
  @@ -1900,7 +1898,6 @@ enum arm_features {
       ARM_FEATURE_V5,
       ARM_FEATURE_STRONGARM,
       ARM_FEATURE_VAPA, /* cp15 VA to PA lookups */
  -    ARM_FEATURE_VFP4, /* VFPv4 (implies that NEON is v2) */
       ARM_FEATURE_GENERIC_TIMER,
       ARM_FEATURE_MVFR, /* Media and VFP Feature Registers 0 and 1 */
       ARM_FEATURE_DUMMY_C15_REGS, /* RAZ/WI all of cp15 crn=3D15 */

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914696/+subscriptions

