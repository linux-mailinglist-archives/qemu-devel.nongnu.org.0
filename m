Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874B6B999
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 11:55:56 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hngfD-0003DH-Rb
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 05:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44426)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hngez-0002mm-O6
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hngex-0001Ah-Uu
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:55:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:52686)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hngex-00019j-OT
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:55:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hngeu-0007UT-O6
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 09:55:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8C87D2E80CC
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 09:55:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jul 2019 09:41:16 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee alex-bennee pmaydell scherft
X-Launchpad-Bug-Reporter: Daan Scherft (scherft)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156318593102.28533.3075291509963886255.malonedeb@chaenomeles.canonical.com>
Message-Id: <878ssxuhfn.fsf@zen.linaroharston>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19009";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: d29e339a838ad56ecc8d502df2727fd036433b5a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836558] Re: [RFC PATCH for 4.1?] target/ppc:
 move opcode decode tables to PowerPCCPU
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
Reply-To: Bug 1836558 <1836558@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Tue, Jul 16, 2019 at 01:13:52PM +0100, Alex Benn=C3=A9e wrote:
>> The opcode decode tables aren't really part of the CPUPPCState but an
>> internal implementation detail for the translator. This can cause
>> problems with memcpy in cpu_copy as any table created during
>> ppc_cpu_realize get written over causing a memory leak. To avoid this
>> move the tables into PowerPCCPU which is better suited to hold
>> internal implementation details.
>>
>> Attempts to fix: https://bugs.launchpad.net/qemu/+bug/1836558
>> Cc: 1836558@bugs.launchpad.net
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> I've applied this now to ppc-for-4.2.  If there's an argument for
> including it in 4.1 during hard freeze, you'll need to spell it out
> for me.

Well without:

  Subject: [RFC PATCH for 4.1] linux-user: unparent CPU object before unref
  Date: Tue, 16 Jul 2019 15:01:33 +0100
  Message-Id: <20190716140133.8578-1-alex.bennee@linaro.org>

it doesn't matter as we never attempt to free the memory once a thread
is destroyed. This causes all linux-user guests that create and destroy
threads quickly to slowly leak memory. However due to the dynamic opcode
table ppc/ppc64-linux-user guests leak a lot faster than most, in the
order of ~50k each time a thread is created and destroyed.

However I'm happy to defer to you as the maintainer :-)

--
Alex Benn=C3=A9e

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836558

Title:
  Qemu-ppc Memory leak creating threads

Status in QEMU:
  Confirmed

Bug description:
  When creating c++ threads (with c++ std::thread), the resulting binary
  has memory leaks when running with qemu-ppc.

  Eg the following c++ program, when compiled with gcc, consumes more
  and more memory while running at qemu-ppc. (does not have memory leaks
  when compiling for Intel, when running same binary on real powerpc CPU
  hardware also no memory leaks).

  (Note I used function getCurrentRSS to show available memory, see
  https://stackoverflow.com/questions/669438/how-to-get-memory-usage-at-
  runtime-using-c; calls commented out here)

  Compiler: powerpc-linux-gnu-g++ (Debian 8.3.0-2) 8.3.0 (but same problem =
with older g++ compilers even 4.9)
  Os: Debian 10.0 ( Buster) (but same problem seen on Debian 9/stetch)
  qemu: qemu-ppc version 3.1.50


  ---

  #include <iostream>
  #include <thread>
  #include <chrono>

  =

  using namespace std::chrono_literals;

  // Create/run and join a 100 threads.
  void Fun100()
  {
  //    auto b4 =3D getCurrentRSS();
  //    std::cout << getCurrentRSS() << std::endl;
      for(int n =3D 0; n < 100; n++)
      {
          std::thread t([]
          {
              std::this_thread::sleep_for( 10ms );
          });
  //        std::cout << n << ' ' << getCurrentRSS() << std::endl;
          t.join();
      }
      std::this_thread::sleep_for( 500ms ); // to give OS some time to wipe=
 memory...
  //    auto after =3D getCurrentRSS();
      std::cout << b4 << ' ' << after << std::endl;
  }

  =

  int main(int, char **)
  {
      Fun100();
      Fun100();  // memory used keeps increasing
  }

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836558/+subscriptions

