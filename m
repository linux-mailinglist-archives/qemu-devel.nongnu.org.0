Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC421252B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 15:48:19 +0200 (CEST)
Received: from localhost ([::1]:33450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqzZb-0001iz-0N
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 09:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqzX8-0006tO-S3
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 09:45:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:43702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqzX5-0005vf-Bv
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 09:45:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jqzX0-0000GT-Nv
 for <qemu-devel@nongnu.org>; Thu, 02 Jul 2020 13:45:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7397C2E8112
 for <qemu-devel@nongnu.org>; Thu,  2 Jul 2020 13:45:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2020 13:36:58 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1885718@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aleksandar-markovic dcb314 philmd
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Duplicate: 1856706
References: <159352052121.16126.109202599760167358.malonedeb@soybean.canonical.com>
Message-Id: <20200702133701.25237-3-f4bug@amsat.org>
Subject: [Bug 1885718] [PATCH 2/5] target/mips: Remove identical if/else
 branches
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 2383c43279a4398206b35e31dbe26e9b86c8f7c5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 09:45:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1885718 <1885718@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1856706 ***
    https://bugs.launchpad.net/bugs/1856706

From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>

Remove the segment:

      if (other_tc =3D=3D other->current_tc) {
          tccause =3D other->CP0_Cause;
      } else {
          tccause =3D other->CP0_Cause;
      }

Original contributor can't remember what was his intention.

Fixes: 5a25ce9487 ("mips: Hook in more reg accesses via mttr/mftr")
Buglink: https://bugs.launchpad.net/qemu/+bug/1885718
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200701182559.28841-2-aleksandar.qemu.devel@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
Cc: Bug 1885718 <1885718@bugs.launchpad.net>

 target/mips/cp0_helper.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index bbf12e4a97..de64add038 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -375,16 +375,9 @@ target_ulong helper_mftc0_entryhi(CPUMIPSState *env)
 target_ulong helper_mftc0_cause(CPUMIPSState *env)
 {
     int other_tc =3D env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
-    int32_t tccause;
     CPUMIPSState *other =3D mips_cpu_map_tc(env, &other_tc);
 =

-    if (other_tc =3D=3D other->current_tc) {
-        tccause =3D other->CP0_Cause;
-    } else {
-        tccause =3D other->CP0_Cause;
-    }
-
-    return tccause;
+    return other->CP0_Cause;
 }
 =

 target_ulong helper_mftc0_status(CPUMIPSState *env)
-- =

2.21.3

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885718

Title:
  qemu/target/mips/op_helper.c:943:5: style:inconclusive: Found
  duplicate branches for 'if' and 'else'

Status in QEMU:
  New

Bug description:
  Source code is

      if (other_tc =3D=3D other->current_tc) {
          tccause =3D other->CP0_Cause;
      } else {
          tccause =3D other->CP0_Cause;
      }

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885718/+subscriptions

