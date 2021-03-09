Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF97332E8F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:53:14 +0100 (CET)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhTl-0006bZ-77
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJfPp-00018C-Jw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:41:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:60942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJfPn-0005SS-ES
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:41:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lJfPl-0000Ao-Oe
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 16:40:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B946E2E815B
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 16:40:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Mar 2021 16:35:29 -0000
From: Peter Maydell <1915925@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: semihosting testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee inver7 keithp pmaydell
X-Launchpad-Bug-Reporter: iNvEr7 (inver7)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161356438332.24036.4652954745285513495.malonedeb@chaenomeles.canonical.com>
 <20210309141727.12522-4-alex.bennee@linaro.org>
Message-Id: <CAFEAcA_zFYAWc=03iSdsj-Sy+MN5-DWih4QKzddZJsrRjrzhOw@mail.gmail.com>
Subject: [Bug 1915925] Re: [PATCH v2 3/4] semihosting/arm-compat-semi: deref
 parameter register for SYS_HEAPINFO
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7100fef41f9a5d5fd53de99e6c59312f81a744cf"; Instance="production"
X-Launchpad-Hash: 8dbdd0525ee5bb2ea10cd7f7d71577975d5fba53
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1915925 <1915925@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 14:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> As per the spec:
>
>   the PARAMETER REGISTER contains the address of a pointer to a
>   four-field data block.
>
> So we need to follow the pointer and place the results of SYS_HEAPINFO
> there.
>
> Bug: https://bugs.launchpad.net/bugs/1915925
> Cc: Bug 1915925 <1915925@bugs.launchpad.net>
> Cc: Keith Packard <keithp@keithp.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 733eea1e2d..2ac9226d29 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1210,6 +1210,8 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[2] =3D rambase + limit; /* Stack base */
>              retvals[3] =3D rambase; /* Stack limit.  */
>  #endif
> +            /* The result array is pointed to by arg0 */
> +            args =3D arg0;
>
>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
>                  bool fail;
> --

No, 'args' is the argument array. That's not the same thing
as the data block we're writing, and we shouldn't reassign
that variable here.

What was wrong with the old arm-semi.c code, which just did
appropriate loads and stores here, and worked fine and was
not buggy ?

thanks
-- PMM

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915925

Title:
  ARM semihosting HEAPINFO results wrote to wrong address

Status in QEMU:
  Confirmed

Bug description:
  This affects latest development branch of QEMU.

  According to the ARM spec of the HEAPINFO semihosting call:

  https://developer.arm.com/documentation/100863/0300/Semihosting-
  operations/SYS-HEAPINFO--0x16-?lang=3Den

  > the PARAMETER REGISTER contains the address of a pointer to a four-
  field data block.

  However, QEMU treated the PARAMETER REGISTER as pointing to a four-
  field data block directly.

  Here is a simple program that can demonstrate this problem:
  https://github.com/iNvEr7/qemu-learn/tree/newlib-bug/semihosting-
  newlib

  This code links with newlib with semihosting mode, which will call the
  HEAPINFO SVC during crt0 routine. When running in QEMU (make run), it
  may crash the program either because of invalid write or memory
  curruption, depending on the compiled program structure.

  Also refer to my discussion with newlib folks:
  https://sourceware.org/pipermail/newlib/2021/018260.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915925/+subscriptions

