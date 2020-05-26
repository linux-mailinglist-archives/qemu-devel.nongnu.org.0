Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62919CFB3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 07:17:06 +0200 (CEST)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKEhV-0000tD-6e
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 01:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jKEgB-0000RZ-HZ
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 01:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jKEgA-00014N-BA
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 01:15:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:49282)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jKEgA-0000zL-5E
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 01:15:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jKEg8-00083l-KC
 for <qemu-devel@nongnu.org>; Fri, 03 Apr 2020 05:15:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9000A2E8105
 for <qemu-devel@nongnu.org>; Fri,  3 Apr 2020 05:15:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Apr 2020 05:03:20 -0000
From: Donghun Kwak <1870477@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kionias
X-Launchpad-Bug-Reporter: Donghun Kwak (kionias)
X-Launchpad-Bug-Modifier: Donghun Kwak (kionias)
Message-Id: <158589020097.22925.10247032490435356173.malonedeb@wampee.canonical.com>
Subject: [Bug 1870477] [NEW] qemu-arm hangs when golang running test
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 15f9e748721adb176294bbce6d83ea71362886aa
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
Reply-To: Bug 1870477 <1870477@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:


1. Environment:
Ubuntu 16.04.5 X86_64
qemu-arm version 4.2.0
go version go 1.14.1 linux/arm

2. Summary:
Sometimes "go run test.go" command hang


3. Reproduction Method (Attempts: 500 Occurred: 1 ): Frequency: 1/500


test.go
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
package main
import "fmt"
func main(){
        for i:=3D0; i<1000; i++ {
                fmt.Printf("[%d] Hello world\n", i)
        }
}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

i tested "go run test.go" command called  500 times at qemu arm env.
qemu hangs about 200~300.

attached strace log.

please check.
thanks

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "qemu_hang_problem.log"
   https://bugs.launchpad.net/bugs/1870477/+attachment/5345418/+files/qemu_=
hang_problem.log

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870477

Title:
  qemu-arm hangs when golang running test

Status in QEMU:
  New

Bug description:
  =

  1. Environment:
  Ubuntu 16.04.5 X86_64
  qemu-arm version 4.2.0
  go version go 1.14.1 linux/arm

  2. Summary:
  Sometimes "go run test.go" command hang

  =

  3. Reproduction Method (Attempts: 500 Occurred: 1 ): Frequency: 1/500

  =

  test.go
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  package main
  import "fmt"
  func main(){
          for i:=3D0; i<1000; i++ {
                  fmt.Printf("[%d] Hello world\n", i)
          }
  }
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  i tested "go run test.go" command called  500 times at qemu arm env.
  qemu hangs about 200~300.

  attached strace log.

  please check.
  thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1870477/+subscriptions

