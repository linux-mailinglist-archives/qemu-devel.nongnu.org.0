Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409CD11B78E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 17:09:34 +0100 (CET)
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if4YP-0005VR-5f
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 11:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42535)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1if4UQ-0002wq-Nm
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1if4UP-0003wx-CA
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:26 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:49348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1if4UP-0003uV-1u
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:25 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 08FC196EF2;
 Wed, 11 Dec 2019 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576080323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9uqqC7MBXJw6x4IMhmhvrJzByBygJmHS8WnEfIWnkU=;
 b=ACwC6clbcuEOwrEfPBzMD69UTGdGLofoUDJBLdIHtqZju3UkkhAiORNbXsZjE7AS+QTZ05
 PDWcen6SW/I/UsisZ0d8MaMlm4soEtqewoHko953/55MLymC8wmmLL9vK2Ireq5grBQrdW
 8KD3LlCNAPvDcVVgEfZfkJ7kjfOfwp8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] gdbstub: change GDBState.last_packet to GByteArray
Date: Wed, 11 Dec 2019 17:05:13 +0100
Message-Id: <20191211160514.58373-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211160514.58373-1-damien.hedde@greensocs.com>
References: <20191211160514.58373-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576080323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9uqqC7MBXJw6x4IMhmhvrJzByBygJmHS8WnEfIWnkU=;
 b=aodmYFp5OTDeUF/hTmi362bA6KisxaxaMKl0zfgqBT4yH/d+v4+H3TlmB7xwcmGaNrthIf
 XCou0Ah6tSkkugerdNzIUkS5CkarlVtcK8zrdoE8MyJUXH+AlEDRuZnPAANJ0ihAebsgYx
 sJj2AQyJm+/fnIP6GpXVHjX8wBOiA+U=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576080323; a=rsa-sha256; cv=none;
 b=Woo/Ifp7V3ks/DeOsZnXSvVoElNOvV3Z/gBFUfeSbS8dX1mLsVEtEGG0YnZpz94COCsjdc
 v2TeLKtIdtv4794K/StIERDZENxDARAS8wcW+SsELDG1JxxBrx3x7ZQcU3Sfd5q6DLqvLp
 nxkEKkA1GMV1ft+rkdB4ZxCISO+4Hn4=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, philmd@redhat.com,
 alex.bennee@linaro.org, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the packet size upper limit by using a GByteArray
instead of a statically allocated array for last_packet.
Thus we can now send big packets.

Also remove the last_packet_len field and use last_packet->len
instead.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 7b695bdebe..93b26f1b86 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -351,8 +351,7 @@ typedef struct GDBState {
     int line_buf_index;
     int line_sum; /* running checksum */
     int line_csum; /* checksum at the end of the packet */
-    uint8_t last_packet[MAX_PACKET_LENGTH + 4];
-    int last_packet_len;
+    GByteArray *last_packet;
     int signal;
 #ifdef CONFIG_USER_ONLY
     int fd;
@@ -384,6 +383,7 @@ static void init_gdbserver_state(void)
     gdbserver_state.init =3D true;
     gdbserver_state.str_buf =3D g_string_new(NULL);
     gdbserver_state.mem_buf =3D g_byte_array_sized_new(MAX_PACKET_LENGTH=
);
+    gdbserver_state.last_packet =3D g_byte_array_sized_new(MAX_PACKET_LE=
NGTH + 4);
 }
=20
 #ifndef CONFIG_USER_ONLY
@@ -626,28 +626,29 @@ static void hexdump(const char *buf, int len,
 static int put_packet_binary(const char *buf, int len, bool dump)
 {
     int csum, i;
-    uint8_t *p;
-    uint8_t *ps =3D &gdbserver_state.last_packet[0];
+    uint8_t footer[3];
=20
     if (dump && trace_event_get_state_backends(TRACE_GDBSTUB_IO_BINARYRE=
PLY)) {
         hexdump(buf, len, trace_gdbstub_io_binaryreply);
     }
=20
     for(;;) {
-        p =3D ps;
-        *(p++) =3D '$';
-        memcpy(p, buf, len);
-        p +=3D len;
+        g_byte_array_set_size(gdbserver_state.last_packet, 0);
+        g_byte_array_append(gdbserver_state.last_packet,
+                            (const uint8_t *) "$", 1);
+        g_byte_array_append(gdbserver_state.last_packet,
+                            (const uint8_t *) buf, len);
         csum =3D 0;
         for(i =3D 0; i < len; i++) {
             csum +=3D buf[i];
         }
-        *(p++) =3D '#';
-        *(p++) =3D tohex((csum >> 4) & 0xf);
-        *(p++) =3D tohex((csum) & 0xf);
+        footer[0] =3D '#';
+        footer[1] =3D tohex((csum >> 4) & 0xf);
+        footer[2] =3D tohex((csum) & 0xf);
+        g_byte_array_append(gdbserver_state.last_packet, footer, 3);
=20
-        gdbserver_state.last_packet_len =3D p - ps;
-        put_buffer(ps, gdbserver_state.last_packet_len);
+        put_buffer(gdbserver_state.last_packet->data,
+                   gdbserver_state.last_packet->len);
=20
 #ifdef CONFIG_USER_ONLY
         i =3D get_char();
@@ -2812,20 +2813,22 @@ static void gdb_read_byte(GDBState *s, uint8_t ch=
)
     uint8_t reply;
=20
 #ifndef CONFIG_USER_ONLY
-    if (gdbserver_state.last_packet_len) {
+    if (gdbserver_state.last_packet->len) {
         /* Waiting for a response to the last packet.  If we see the sta=
rt
            of a new command then abandon the previous response.  */
         if (ch =3D=3D '-') {
             trace_gdbstub_err_got_nack();
-            put_buffer((uint8_t *)gdbserver_state.last_packet, gdbserver=
_state.last_packet_len);
+            put_buffer(gdbserver_state.last_packet->data,
+                       gdbserver_state.last_packet->len);
         } else if (ch =3D=3D '+') {
             trace_gdbstub_io_got_ack();
         } else {
             trace_gdbstub_io_got_unexpected(ch);
         }
=20
-        if (ch =3D=3D '+' || ch =3D=3D '$')
-            gdbserver_state.last_packet_len =3D 0;
+        if (ch =3D=3D '+' || ch =3D=3D '$') {
+            g_byte_array_set_size(gdbserver_state.last_packet, 0);
+        }
         if (ch !=3D '$')
             return;
     }
@@ -3209,7 +3212,7 @@ static int gdb_monitor_write(Chardev *chr, const ui=
nt8_t *buf, int len)
     const char *p =3D (const char *)buf;
     int max_sz;
=20
-    max_sz =3D (sizeof(gdbserver_state.last_packet) - 2) / 2;
+    max_sz =3D (MAX_PACKET_LENGTH / 2) + 1;
     for (;;) {
         if (len <=3D max_sz) {
             gdb_monitor_output(&gdbserver_state, p, len);
--=20
2.24.0


