Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668912D2670
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:42:16 +0100 (CET)
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYZb-0006uN-H7
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmYYK-0006BW-Au
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:40:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:38228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmYYH-0001WS-Kv
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:40:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kmYYE-0000pa-Iq
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 08:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8CA832E8029
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 08:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Dec 2020 08:28:58 -0000
From: Matic Kres <1907210@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kresko5007
X-Launchpad-Bug-Reporter: Matic Kres (kresko5007)
X-Launchpad-Bug-Modifier: Matic Kres (kresko5007)
Message-Id: <160741613811.15859.17314995772376635210.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1907210] [NEW] QEMU gdbstub command "?" issue
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 751a3e208926d4f2c35a461c1e81c6c09f16bd9e
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
Reply-To: Bug 1907210 <1907210@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I am using some third party GDB client, and I have noticed that every time =
"?" command is send from the client, QEMU gdbstub removes all break points.=
 This behaviour is not expected since "?" command should only return stop r=
eason.
Here is documentation from official gdb:
=E2=80=98?=E2=80=99 Indicate the reason the target halted. The reply is the=
 same as for step and
continue. This packet has a special interpretation when the target is in no=
n-stop
mode; see Section E.10 [Remote Non-Stop], page 733.
Reply: See Section E.3 [Stop Reply Packets], page 693, for the reply specif=
ications.

With some help on the irc, we have been able to pin point the failure point=
(in attachement file gdbstub.c).
Function that handles "?" command has this comment in it:
=C2=A0=C2=A0=C2=A0=C2=A0/*
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove all the breakpoints when this query =
is issued,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* because gdb is doing an initial connect and=
 the state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* should be cleaned up.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
>From which it is clear that developer that wrote that code assumed, that be=
cause most popular gdb client only uses "?" command at initial connect, it =
is safe to also remove all BPs.
In my opinion initial connect should be detected in some other way, and not=
 with "?" command.
Also note that official gdbserver does not remove the BPs when this command=
 is send, this issue is present in QEMU and apparently also on kgdb(I was t=
old that on irc, have not tested it myself)

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "qemuissue.jpg"
   https://bugs.launchpad.net/bugs/1907210/+attachment/5441925/+files/qemui=
ssue.jpg

** Description changed:

  I am using some third party GDB client, and I have noticed that every tim=
e "?" command is send from the client, QEMU gdbstub removes all break point=
s. This behaviour is not expected since "?" command should only return stop=
 reason.
  Here is documentation from official gdb:
  =E2=80=98?=E2=80=99 Indicate the reason the target halted. The reply is t=
he same as for step and
  continue. This packet has a special interpretation when the target is in =
non-stop
  mode; see Section E.10 [Remote Non-Stop], page 733.
  Reply: See Section E.3 [Stop Reply Packets], page 693, for the reply spec=
ifications.
  =

  With some help on the irc, we have been able to pin point the failure poi=
nt(in attachement file gdbstub.c).
  Function that handles "?" command has this comment in it:
-     /*
-      * Remove all the breakpoints when this query is issued,
-      * because gdb is doing an initial connect and the state
-      * should be cleaned up.
-      */
- From which it is clear that developer that wrote that code assumed, that =
because most popular gdb client only uses "?" command at initial connect, i=
t is safe to also remove all BPs. =

+ =C2=A0=C2=A0=C2=A0=C2=A0/*
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove all the breakpoints when this quer=
y is issued,
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* because gdb is doing an initial connect a=
nd the state
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* should be cleaned up.
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
+ From which it is clear that developer that wrote that code assumed, that =
because most popular gdb client only uses "?" command at initial connect, i=
t is safe to also remove all BPs.
  In my opinion initial connect should be detected in some other way, and n=
ot with "?" command.
+ Also note that official gdbserver does not remove the BPs when this comma=
nd is send, this issue is present in QEMU and apparently also on kgdb(I was=
 told that on irc, have not tested it myself)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907210

Title:
  QEMU gdbstub command "?" issue

Status in QEMU:
  New

Bug description:
  I am using some third party GDB client, and I have noticed that every tim=
e "?" command is send from the client, QEMU gdbstub removes all break point=
s. This behaviour is not expected since "?" command should only return stop=
 reason.
  Here is documentation from official gdb:
  =E2=80=98?=E2=80=99 Indicate the reason the target halted. The reply is t=
he same as for step and
  continue. This packet has a special interpretation when the target is in =
non-stop
  mode; see Section E.10 [Remote Non-Stop], page 733.
  Reply: See Section E.3 [Stop Reply Packets], page 693, for the reply spec=
ifications.

  With some help on the irc, we have been able to pin point the failure poi=
nt(in attachement file gdbstub.c).
  Function that handles "?" command has this comment in it:
  =C2=A0=C2=A0=C2=A0=C2=A0/*
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove all the breakpoints when this quer=
y is issued,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* because gdb is doing an initial connect a=
nd the state
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* should be cleaned up.
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
  From which it is clear that developer that wrote that code assumed, that =
because most popular gdb client only uses "?" command at initial connect, i=
t is safe to also remove all BPs.
  In my opinion initial connect should be detected in some other way, and n=
ot with "?" command.
  Also note that official gdbserver does not remove the BPs when this comma=
nd is send, this issue is present in QEMU and apparently also on kgdb(I was=
 told that on irc, have not tested it myself)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907210/+subscriptions

