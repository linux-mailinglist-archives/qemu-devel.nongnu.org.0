Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FFF2E039F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 02:02:27 +0100 (CET)
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krW4H-0006Yz-Rr
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 20:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1krW2m-000681-Rt
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 20:00:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:55224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1krW2k-0002Ee-ML
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 20:00:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1krW2i-0008CJ-2S
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 01:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EC8FA2E8058
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 01:00:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Dec 2020 00:53:29 -0000
From: Alistair Francis <1885350@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=alistair@alistair23.me; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 rpvrverve453-4tr5t34t5
X-Launchpad-Bug-Reporter: Mina Magdy (rpvrverve453-4tr5t34t5)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <159323684589.25927.6403829131374464357.malonedeb@gac.canonical.com>
Message-Id: <160859841035.3532.13112761964048581371.launchpad@wampee.canonical.com>
Subject: [Bug 1885350] Re: RISCV dynamic rounding mode is not behaving
 correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: 478c09a42bde4d8e3abedac29b3d562ae71af21e
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
Reply-To: Bug 1885350 <1885350@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885350

Title:
  RISCV dynamic rounding mode is not behaving correctly

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  I=E2=80=99ve gone through the RISC-V code in latest QEMU release
  (qemu-5.0.0-rc2) and when checking the Floating point encodings I
  found the rounding mode is only updated if the opcode field =E2=80=9Crm=
=E2=80=9D is
  changed =E2=80=9Cctx->frm =3D=3D rm=E2=80=9D. But according to RISC-V Vol=
ume I:
  Unprivileged ISA, there=E2=80=99s a dynamic mode when rm=3D7 where the ro=
unding
  mode is set with frm value.

  So for the same rm value (=3D7) and when changing frm value seeking
  different rounding modes, and according to the below code, the
  rounding mode won=E2=80=99t be updated. Please correct me if I got this
  implementation wrong.

  static void gen_set_rm(DisasContext *ctx, int rm)
  {
      TCGv_i32 t0;
      if (ctx->frm =3D=3D rm) {
          return;
      }
      ctx->frm =3D rm;
      t0 =3D tcg_const_i32(rm);
      gen_helper_set_rounding_mode(cpu_env, t0);
      tcg_temp_free_i32(t0);
  }

  =

  My testcase:
  I set statically the rm field in the instruction to 7 and before this exe=
cution I changed the value of frm field in fcsr register. For the 1st time =
it worked (according to the code above, the rm is updated so the round mode=
 will also be updated). But when changing fcsr register an re-execute the i=
nstruction, there's no difference and the rounding mode is the same like th=
e previous frm value.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885350/+subscriptions

