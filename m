Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730441CEA6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:08:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQbqo-0006Lo-ID
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:08:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQbln-000308-4d
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQblm-0002YD-1e
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58396)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQbll-0002Xw-Qm
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F204821D9
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 18:03:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 847A460FE4;
	Tue, 14 May 2019 18:03:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 039AA1138538; Tue, 14 May 2019 20:03:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 20:03:09 +0200
Message-Id: <20190514180311.16028-5-armbru@redhat.com>
In-Reply-To: <20190514180311.16028-1-armbru@redhat.com>
References: <20190514180311.16028-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 14 May 2019 18:03:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/6] gdbstub: Fix misuse of isxdigit()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gdb_read_byte() passes its @ch argument to isxdigit().  Undefined
behavior when the value is negative.  Two callers:

* gdb_chr_receive() passes an uint8_t value.  Safe.

* gdb_handlesig() a char value.  Unsafe.  Not a security issue,
  because the characters come from the gdb client, which is trusted.

The obvious fix would be casting @ch to unsigned char.  But note that
gdb_read_byte() already casts @ch to uint8_t in many places.  Uses of
@ch without such a cast:

(1) Compare to a character constant with == or !=

(2) s->linesum += ch

(3) Store ch or ch ^ 0x20 into s->line_buf[]

(4) Check for invalid RLE count:
    ch < ' ' || ch == '#' || ch == '$' || ch > 126

(5) Pass to isxdigit()

(6) Pass to fromhex()

Change the parameter type from int to uint8_t, and drop the now
redundant casts.  Affects the above uses as follows:

(1) No change: the character constants are all non-negative.

(2) Effectively no change: we only ever use s->linesum & 0xff, and
    s->linesum is int.

(3) No change: s->line_buf[] is char[].

(4) No change.

(5) Avoid undefined behavior.

(6) No change: only reached when isxdigit(ch)

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 gdbstub.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index c41eb1de07..b129df4e59 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1987,7 +1987,7 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
     va_end(va);
 }
 
-static void gdb_read_byte(GDBState *s, int ch)
+static void gdb_read_byte(GDBState *s, uint8_t ch)
 {
     uint8_t reply;
 
@@ -2001,7 +2001,7 @@ static void gdb_read_byte(GDBState *s, int ch)
         } else if (ch == '+') {
             trace_gdbstub_io_got_ack();
         } else {
-            trace_gdbstub_io_got_unexpected((uint8_t)ch);
+            trace_gdbstub_io_got_unexpected(ch);
         }
 
         if (ch == '+' || ch == '$')
@@ -2024,7 +2024,7 @@ static void gdb_read_byte(GDBState *s, int ch)
                 s->line_sum = 0;
                 s->state = RS_GETLINE;
             } else {
-                trace_gdbstub_err_garbage((uint8_t)ch);
+                trace_gdbstub_err_garbage(ch);
             }
             break;
         case RS_GETLINE:
@@ -2070,11 +2070,11 @@ static void gdb_read_byte(GDBState *s, int ch)
              */
             if (ch < ' ' || ch == '#' || ch == '$' || ch > 126) {
                 /* invalid RLE count encoding */
-                trace_gdbstub_err_invalid_repeat((uint8_t)ch);
+                trace_gdbstub_err_invalid_repeat(ch);
                 s->state = RS_GETLINE;
             } else {
                 /* decode repeat length */
-                int repeat = (unsigned char)ch - ' ' + 3;
+                int repeat = ch - ' ' + 3;
                 if (s->line_buf_index + repeat >= sizeof(s->line_buf) - 1) {
                     /* that many repeats would overrun the command buffer */
                     trace_gdbstub_err_overrun();
@@ -2096,7 +2096,7 @@ static void gdb_read_byte(GDBState *s, int ch)
         case RS_CHKSUM1:
             /* get high hex digit of checksum */
             if (!isxdigit(ch)) {
-                trace_gdbstub_err_checksum_invalid((uint8_t)ch);
+                trace_gdbstub_err_checksum_invalid(ch);
                 s->state = RS_GETLINE;
                 break;
             }
@@ -2107,7 +2107,7 @@ static void gdb_read_byte(GDBState *s, int ch)
         case RS_CHKSUM2:
             /* get low hex digit of checksum */
             if (!isxdigit(ch)) {
-                trace_gdbstub_err_checksum_invalid((uint8_t)ch);
+                trace_gdbstub_err_checksum_invalid(ch);
                 s->state = RS_GETLINE;
                 break;
             }
-- 
2.17.2


