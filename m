Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7BA20C103
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 13:17:29 +0200 (CEST)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jp8pr-0003uM-P6
	for lists+qemu-devel@lfdr.de; Sat, 27 Jun 2020 07:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jp8oG-0003Bi-32
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 07:15:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:34172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jp8oD-0005CB-Vg
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 07:15:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jp8oC-0002dl-8O
 for <qemu-devel@nongnu.org>; Sat, 27 Jun 2020 11:15:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 383EF2E8107
 for <qemu-devel@nongnu.org>; Sat, 27 Jun 2020 11:15:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2020 11:08:35 -0000
From: Mina Magdy <1885350@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rpvrverve453-4tr5t34t5
X-Launchpad-Bug-Reporter: Mina Magdy (rpvrverve453-4tr5t34t5)
X-Launchpad-Bug-Modifier: Mina Magdy (rpvrverve453-4tr5t34t5)
References: <159323684589.25927.6403829131374464357.malonedeb@gac.canonical.com>
Message-Id: <159325611536.14885.3501767721547790042.malone@wampee.canonical.com>
Subject: [Bug 1885350] Re: RISCV dynamic rounding mode is not behaving
 correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 39b1e57b2f20e0aa47bbc9968f00d6b9362c4887
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/27 07:15:44
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
Reply-To: Bug 1885350 <1885350@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After checking RISCY RTL code, i found the implementation is straight forwa=
rd as stated in specs as follows:
              if (FPU =3D=3D 1) begin
                 if (fp_rnd_mode =3D=3D 3'b111)
                   apu_flags =3D frm_i;
                 else
                   apu_flags =3D fp_rnd_mode;
              end else

where fp_rnd_mode  is the round mode field in the instruction opcode.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885350

Title:
  RISCV dynamic rounding mode is not behaving correctly

Status in QEMU:
  New

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

