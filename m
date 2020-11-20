Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367782BBB70
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 02:17:37 +0100 (CET)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgHWx-0002Eq-O4
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 20:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgHVH-0001jQ-US
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 20:15:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:46582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgHVF-0001Ve-NT
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 20:15:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgHVD-00072G-DN
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 01:15:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6034A2E813E
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 01:15:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2020 16:19:33 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1904331@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jdbelanger philmd
X-Launchpad-Bug-Reporter: Jonathan D. Belanger (jdbelanger)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <160545531881.20391.7176019896401260559.malonedeb@soybean.canonical.com>
Message-Id: <20201120161933.2514089-1-f4bug@amsat.org>
Subject: [Bug 1904331] [PATCH-for-5.2?] hw/char/serial: Clean up unnecessary
 code
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 6472e116e7c63e2d4d6522e4f12ce8c946e6b325
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
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
Reply-To: Bug 1904331 <1904331@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 5ec3a23e6c8 ("serial: convert PIO to new memory
api read/write") we don't need to worry about accesses bigger
than 8-bit. Use the extract()/deposit() functions to access
the correct part of the 16-bit 'divider' register.

Reported-by: Jonathan D. Belanger <jbelanger1@rochester.rr.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1904331
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
Cc: Bug 1904331 <1904331@bugs.launchpad.net>
---
 hw/char/serial.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 97f71879ff2..62c627f486f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -24,6 +24,7 @@
  */
 =

 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "hw/char/serial.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
@@ -338,11 +339,7 @@ static void serial_ioport_write(void *opaque, hwaddr a=
ddr, uint64_t val,
     default:
     case 0:
         if (s->lcr & UART_LCR_DLAB) {
-            if (size =3D=3D 1) {
-                s->divider =3D (s->divider & 0xff00) | val;
-            } else {
-                s->divider =3D val;
-            }
+            s->divider =3D deposit32(s->divider, 8 * addr, 8, val);
             serial_update_parameters(s);
         } else {
             s->thr =3D (uint8_t) val;
@@ -364,7 +361,7 @@ static void serial_ioport_write(void *opaque, hwaddr ad=
dr, uint64_t val,
         break;
     case 1:
         if (s->lcr & UART_LCR_DLAB) {
-            s->divider =3D (s->divider & 0x00ff) | (val << 8);
+            s->divider =3D deposit32(s->divider, 8 * addr, 8, val);
             serial_update_parameters(s);
         } else {
             uint8_t changed =3D (s->ier ^ val) & 0x0f;
@@ -478,7 +475,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr=
 addr, unsigned size)
     default:
     case 0:
         if (s->lcr & UART_LCR_DLAB) {
-            ret =3D s->divider & 0xff;
+            ret =3D extract16(s->divider, 8 * addr, 8);
         } else {
             if(s->fcr & UART_FCR_FE) {
                 ret =3D fifo8_is_empty(&s->recv_fifo) ?
@@ -502,7 +499,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr=
 addr, unsigned size)
         break;
     case 1:
         if (s->lcr & UART_LCR_DLAB) {
-            ret =3D (s->divider >> 8) & 0xff;
+            ret =3D extract16(s->divider, 8 * addr, 8);
         } else {
             ret =3D s->ier;
         }
-- =

2.26.2

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904331

Title:
  Coding bug in the function serial_ioport_write in serial.c

Status in QEMU:
  Confirmed

Bug description:
  Branch hash: b50ea0d  (pulled from github).

  I was reviewing the code and noticed the following in the function
  serial_ioport_write:

      assert(size =3D=3D 1 && addr < 8);
          .
          .
          .
      switch(addr) {
      default:
      case 0:
          if (s->lcf & UART_LCR_DLAB) {
              if (size =3D=3D 1) {
                  s->divider =3D (s->divider & 0xff00) | val;
              } else {
                  s->divider =3D val;
              }
          }

  The assert will trigger if the size is > 1, so the else of the if
  (size =3D=3D 1) will never be executed and an attempt to specify a size >
  1 will trigger an assert.

  The documentation for the UART indicates that the 16-bit divisor is
  broken up amongst 2 8-bit registers (DLL and DLM).  There already is
  code to handle the DLL and DLM portions of the divider register (as
  coded).

  This is not exactly going to cause a bug, as there is no code that
  calls this function with a value for size other than 1.  It is just
  unnecessary code.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904331/+subscriptions

