Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3215DA21
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 16:02:10 +0100 (CET)
Received: from localhost ([::1]:39944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2cTp-000604-RV
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 10:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j2cSl-0004Z6-2L
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:01:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j2cSg-0002yY-2g
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:01:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:53486)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j2cSf-0002xx-SD
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:00:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j2cSe-00043W-Mm
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 15:00:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A86DC2E80CB
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 15:00:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Feb 2020 14:51:25 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: mttcg tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee yifanlu
X-Launchpad-Bug-Reporter: Yifan (yifanlu)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <158154486735.14935.3370403781300872079.malonedeb@soybean.canonical.com>
Message-Id: <158169188584.24991.8510013578266900899.malone@gac.canonical.com>
Subject: [Bug 1863025] Re: Use-after-free after flush in TCG accelerator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 27438567e46f93af39f10626cbabd13b0400ebe6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1863025 <1863025@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've attached a variant of the suggested patch which simply expands the
exclusive period. It's hard to test extensively as not many things use
the EXCP_ATOMIC mechanism. Can I ask how you found the bug and if you
can re-test with the suggested patch?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863025

Title:
  Use-after-free after flush in TCG accelerator

Status in QEMU:
  Confirmed

Bug description:
  I believe I found a UAF in TCG that can lead to a guest VM escape. The
  security list informed me "This can not be treated as a security
  issue." and to post it here. I am looking at the 4.2.0 source code.
  The issue requires a race and I will try to describe it in terms of
  three concurrent threads.

  Thread A:

  A1. qemu_tcg_cpu_thread_fn runs work loop
  A2. qemu_wait_io_event =3D> qemu_wait_io_event_common =3D> process_queued=
_cpu_work
  A3. start_exclusive critical section entered
  A4. do_tb_flush is called, TB memory freed/re-allocated
  A5. end_exclusive exits critical section

  Thread B:

  B1. qemu_tcg_cpu_thread_fn runs work loop
  B2. tcg_cpu_exec =3D> cpu_exec =3D> tb_find =3D> tb_gen_code
  B3. tcg_tb_alloc obtains a new TB

  Thread C:

  C1. qemu_tcg_cpu_thread_fn runs work loop
  C2. cpu_exec_step_atomic executes
  C3. TB obtained with tb_lookup__cpu_state or tb_gen_code
  C4. start_exclusive critical section entered
  C5. cpu_tb_exec executes the TB code
  C6. end_exclusive exits critical section

  Consider the following sequence of events:
  =C2=A0=C2=A0B2 =3D> B3 =3D> C3 (same TB as B2) =3D> A3 =3D> A4 (TB freed)=
 =3D> A5 =3D> B2 =3D>
  =C2=A0=C2=A0B3 (re-allocates TB from B2) =3D> C4 =3D> C5 (freed/reused TB=
 now executing) =3D> C6

  In short, because thread C uses the TB in the critical section, there
  is no guarantee that the pointer has not been "freed" (rather the
  memory is marked as re-usable) and therefore a use-after-free occurs.

  Since the TCG generated code can be in the same memory as the TB data
  structure, it is possible for an attacker to overwrite the UAF pointer
  with code generated from TCG. This can overwrite key pointer values
  and could lead to code execution on the host outside of the TCG
  sandbox.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863025/+subscriptions

