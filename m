Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A0315847
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:10:12 +0100 (CET)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9aGw-00063z-Pg
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9aCl-0003Xi-91
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:05:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:54966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9aCa-0000c0-Or
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:05:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9aCW-0007AX-Vs
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 21:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C16392E8136
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 21:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Feb 2021 20:52:57 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1625216@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gdb gdbstub mmio write
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andreas-rasmusson pmaydell
X-Launchpad-Bug-Reporter: Andreas Rasmusson (andreas-rasmusson)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <20160919143701.1959.82839.malonedeb@soybean.canonical.com>
Message-Id: <161290397749.32361.29663047951575370.launchpad@gac.canonical.com>
Subject: [Bug 1625216] Re: memory writes via gdb don't work for memory mapped
 hardware
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 662254ae56f274166d48b51628df47292d33d0f7
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
Reply-To: Bug 1625216 <1625216@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: gdbstub

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1625216

Title:
  memory writes via gdb don't work for memory mapped hardware

Status in QEMU:
  Confirmed

Bug description:
  When I remote-debug a qemu-guest and attempt to write to a memory mapped =
location, the
  write-handler for the concerned device will not be called. All write-requ=
iests from
  gdb are delegated to cpu_physical_memory_write_rom(...). a function that =
writes to the =

  underlying ram-block.

  I believe requests to memory mapped hardware should be delegated to =

  address_space_rw(). =


  example:
  ;; a memory mapped device. No effect, the write-handler is not called
  (gdb) set *0xfff3c000 =3D 48

  ;; a ram or rom-block. Thos works. The value is changed.
  (gdb) set *0x100000 =3D 48

  =

  ----------------------------------------

  Here's my suggested patch. As noted in the comment, it could perhaps be
  improved for the (rare) case when the write-request from gdb spans multip=
le =

  memory regions.

  $ git diff   85bc2a15121e8bcd9f15eb75794a1eacca9d84bd HEAD ../exec.c
  diff --git a/exec.c b/exec.c
  index c4f9036..45ef896 100644
  --- a/exec.c
  +++ b/exec.c
  @@ -3676,6 +3676,7 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong=
 addr,
       int l;
       hwaddr phys_addr;
       target_ulong page;
  +    bool is_memcpy_access;
   =

       while (len > 0) {
           int asidx;
  @@ -3691,13 +3692,32 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulo=
ng addr,
           if (l > len)
               l =3D len;
           phys_addr +=3D (addr & ~TARGET_PAGE_MASK);
  +
           if (is_write) {
  +            /* if ram/rom region we access the memory =

  +               via memcpy instead of via the cpu */
  +            hwaddr mr_len, addr1;
  +            AddressSpace *as =3D cpu->cpu_ases[asidx].as;
  +            MemoryRegion *mr =3D address_space_translate(as, phys_addr, =
&addr1, &mr_len, is_write);
  +            is_memcpy_access  =3D memory_region_is_ram(mr) || memory_reg=
ion_is_romd(mr);
  +            if(mr_len < len) {
  +                /* TODO, mimic more of the loop over mr chunks as =

  +                   done in cpu_physical_memory_write_internal */ =

  +                printf("warning: we dont know whether all bytes "
  +                       "to be written are ram/rom or io\n");
  +            }
  +        }
  +        else {
  +            is_memcpy_access =3D false;
  +        }
  +        =

  +        if (is_write && is_memcpy_access) {
               cpu_physical_memory_write_rom(cpu->cpu_ases[asidx].as,
                                             phys_addr, buf, l);
           } else {
               address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
                                MEMTXATTRS_UNSPECIFIED,
  -                             buf, l, 0);
  +                             buf, l, is_write);
           }
           len -=3D l;
           buf +=3D l;

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1625216/+subscriptions

