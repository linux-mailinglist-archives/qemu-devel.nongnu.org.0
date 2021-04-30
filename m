Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E136F7FD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:36:27 +0200 (CEST)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPZS-0007kb-Kd
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPKf-0004Mx-Sv
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:21:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:37486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPKb-00009E-4Y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:21:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcPKX-0003HV-EQ
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:21:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C98172E81D5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:20:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 09:14:40 -0000
From: Thomas Huth <1909256@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=roolebo@gmail.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell roolebo
X-Launchpad-Bug-Reporter: Peter Maydell (pmaydell)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160884296870.1780.12540070136312087397.malonedeb@soybean.canonical.com>
Message-Id: <161977408189.13919.4408169211534255654.launchpad@wampee.canonical.com>
Subject: [Bug 1909256] Re: compile failure if gnutls headers not on default
 include path
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: ce0c54677259c4683953f31b8051f4202cd74152
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
Reply-To: Bug 1909256 <1909256@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909256

Title:
  compile failure if gnutls headers not on default include path

Status in QEMU:
  Fix Released

Bug description:
  If the gnutls headers are not on the default compiler include path,
  then configure correctly finds them and config-host.mak sets up the
  variables:

  GNUTLS_CFLAGS=3D-I/opt/homebrew/Cellar/gnutls/3.6.15/include -I/opt/homeb=
rew/Cellar/nettle/3.6/include -I/opt/homebrew/Cellar/libtasn1/4.16.0/includ=
e -I/opt/homebrew/Cellar/libidn2/2.3.0/include -I/opt/homebrew/Cellar/p11-k=
it/0.23.22/include/p11-kit-1
  GNUTLS_LIBS=3D-L/opt/homebrew/Cellar/gnutls/3.6.15/lib -lgnutls

  but meson fails to put GNUTLS_CFLAGS in the compiler arguments and so
  you get compile failures like:

  [2/1865] Compiling C object qemu-nbd.p/qemu-nbd.c.o
  FAILED: qemu-nbd.p/qemu-nbd.c.o =

  cc -Iqemu-nbd.p -I. -I../.. -Iqapi -Itrace -Iui -Iui/shader -I/opt/homebr=
ew/Cellar/glib/2.66.4/include -I/opt/homebrew/Cellar/glib/2.66.4/include/gl=
ib-2.0 -I/opt/homebrew/Cellar/glib/2.66.4/lib/glib-2.0/include -I/opt/homeb=
rew/opt/gettext/include -I/opt/homebrew/Cellar/pcre/8.44/include -Xclang -f=
color-diagnostics -pipe -Wall -Winvalid-pch -std=3Dgnu99 -g -DOS_OBJECT_USE=
_OBJC=3D0 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstri=
ct-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototype=
s -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition -Wtype-li=
mits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempt=
y-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wno-initiali=
zer-overrides -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-stri=
ng-plus-int -Wno-typedef-redefinition -Wno-tautological-type-limit-compare =
-fstack-protector-strong -iquote /Users/pm215/qemu/tcg/aarch64 -iquote . -i=
quote /Users/pm215/qemu -iquote /Users/pm215/qemu/accel/tcg -iquote /Users/=
pm215/qemu/include -iquote /Users/pm215/qemu/disas/libvixl -MD -MQ qemu-nbd=
.p/qemu-nbd.c.o -MF qemu-nbd.p/qemu-nbd.c.o.d -o qemu-nbd.p/qemu-nbd.c.o -c=
 ../../qemu-nbd.c
  In file included from ../../qemu-nbd.c:30:
  In file included from /Users/pm215/qemu/include/block/nbd.h:25:
  /Users/pm215/qemu/include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/g=
nutls.h' file not found
  #include <gnutls/gnutls.h>
           ^~~~~~~~~~~~~~~~~
  1 error generated.

  =

  The compiler errors happen for any .c file that includes block/nbd.h and =
also for files in tests that include gnutls.h directly, and for files that =
directly or indirectly include crypto/tlssession.c.

  My meson-foo is insufficient to suggest the correct fix...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909256/+subscriptions

