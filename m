Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FDF3BE870
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:57:20 +0200 (CEST)
Received: from localhost ([::1]:50508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1779-0005Mh-9f
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m175k-0004gB-Mc
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:55:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:44122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m175f-0007dp-5p
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:55:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m175a-0003Lc-C0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 12:55:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 45C072E816A
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 12:55:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Jul 2021 12:48:08 -0000
From: Alexey <1757363@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dantachen janitor philmd str1ker
X-Launchpad-Bug-Reporter: dantachen (dantachen)
X-Launchpad-Bug-Modifier: Alexey (str1ker)
References: <152162151775.22331.14638507477656772309.malonedeb@soybean.canonical.com>
Message-Id: <162566208903.3177.9330249448635776526.malone@gac.canonical.com>
Subject: [Bug 1757363] Re: infinite loop due to improper deal with "eret" on
 mips32
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 4986e41de196c2c2f5c94b698e733e32b6bddc07
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
Reply-To: Bug 1757363 <1757363@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This seems to affect me too; I have a loop on interrupt handler after
the first interrupt called.

The version of qemu is latest 3.1 from upstream, so this is not Ubuntu
issue.

However, have you done with it? Just commenting out

env->CP0_Status &=3D ~(1 << CP0St_EXL);

does not help.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1757363

Title:
  infinite loop due to improper deal with "eret" on mips32

Status in QEMU:
  Expired

Bug description:
  1.qemu 2.9.1 release on the official web build with tcg
  2.cmd: qemu-system-mips -kernel kernelfile
  3. host: ubuntu 16.04.1 with linux kernel 4.6.2 x86_64
     guest: mips bigendian 32bit (tplink firmware)

  =

  detail:

  static inline void exception_return(CPUMIPSState *env)
  {
      debug_pre_eret(env);
      if (env->CP0_Status & (1 << CP0St_ERL)) {
          set_pc(env, env->CP0_ErrorEPC);
          env->CP0_Status &=3D ~(1 << CP0St_ERL);
      } else {
          set_pc(env, env->CP0_EPC);
          env->CP0_Status &=3D ~(1 << CP0St_EXL);=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> ISSUE????
      }
      compute_hflags(env);
      debug_post_eret(env);
  }

  void helper_eret(CPUMIPSState *env)
  {
      exception_return(env);
      env->lladdr =3D 1;
  }

  =

  In the Issue Line, there is no check CP0_Status whether int is disabled (=
should not enter int routine),
  that result in the cpu can not jump out the int routine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1757363/+subscriptions

