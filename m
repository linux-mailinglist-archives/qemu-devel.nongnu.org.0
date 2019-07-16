Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188AF6AAE8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 16:51:26 +0200 (CEST)
Received: from localhost ([::1]:49712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnOnd-00030E-47
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 10:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48811)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hnOnG-0002A2-8v
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hnOnB-0007ep-Sl
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:50:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:52444)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hnOnA-0007bO-Dv
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:50:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hnOn4-00033A-Sl
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 14:50:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1EA432E80D2
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 14:50:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jul 2019 14:43:56 -0000
From: Peter Maydell <peter.maydell@linaro.org>
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
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156318593102.28533.3075291509963886255.malonedeb@chaenomeles.canonical.com>
 <20190716140133.8578-1-alex.bennee@linaro.org>
Message-Id: <CAFEAcA8V2h3pqC_g5aaD2gsv08c18YZKRcxLM+hDNuMv_C55=Q@mail.gmail.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 32df8da1136858759348dacdd3c4b2a4949a9471
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836558] Re: [RFC PATCH for 4.1] linux-user:
 unparent CPU object before unref
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

Ccing the QOM maintainers to make sure we have the
QOM lifecycle operations right here...

On Tue, 16 Jul 2019 at 15:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When a CPU object is created it is parented during it's realize stage.
> If we don't unparent before the "final" unref we will never finzalize
> the object leading to a memory leak. For most setups you probably
> won't notice but with anything that creates and destroys a lot of
> threads this will add up. This goes especially for architectures which
> allocate a lot of memory in their CPU structures.
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1836558
> Cc: 1836558@bugs.launchpad.net
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  linux-user/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 39a37496fed..4c9313fd9d0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7183,6 +7183,7 @@ static abi_long do_syscall1(void *cpu_env, int num,=
 abi_long arg1,
>                            NULL, NULL, 0);
>              }
>              thread_cpu =3D NULL;
> +            object_unparent(OBJECT(cpu));
>              object_unref(OBJECT(cpu));
>              g_free(ts);
>              rcu_unregister_thread();

I think (as I mentioned on IRC) that we also need to unrealize
the CPU object, because target/ppc at least does some freeing
of memory in its unrealize method. I think we do that by
setting the QOM "realize" property back to "false" -- but that
might barf if we try it on a CPU that isn't hotpluggable...

thanks
-- PMM

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

