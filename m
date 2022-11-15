Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F862B0BC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 02:48:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov7WS-000368-Ku; Tue, 15 Nov 2022 20:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ov5Tq-0003Xo-Ax; Tue, 15 Nov 2022 18:36:38 -0500
Received: from mail.aperture-labs.org ([195.191.197.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <tobias@fiebig.nl>)
 id 1ov5To-0008PC-0O; Tue, 15 Nov 2022 18:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fiebig.nl; s=key01;
 t=1668555387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkFFPTz7QU53bs4OGnL0n5gvoi86dZcQTUHcM22CXkM=;
 b=M+EJBhnSXf/7XYqiT5S9mlyujOCVnmL9NR2yzJRkBQAmgaHKp8L+z35bqmFAV8pMWPLUOZ
 zYLCa9yUPahb2qXw+PY7AmCaHRMs17XDbsOF4iBF+J0BOdljP3ootFO0m6pjF228DPvM9y
 kU9rOscYbWCOpO1XPk3nNlgY00cL8lBT5+isOPTBZ7XbWSdhwG3ew/eCKLBE6LdOnupjV5
 4wKs+TH+rHwqGRcAkKV8jIP9WnSZ2UAZ1h2xXW5mi06tqu+rh/wUVcmLTIJwGJUL3c/fRO
 224wTa5R1EVrZkl7bFqcINit/1LwaNHU9exqOAwr47cNX4EPtvCWAXW2sIUwhg==
Received: from DESKTOP1J9BJ88 (<unknown> [2a06:d1c1:a:0:d0f7:15f4:7842:c716])
 by mail.aperture-labs.org (OpenSMTPD) with ESMTPSA id 89ed3f44
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Tue, 15 Nov 2022 23:36:27 +0000 (UTC)
From: "Tobias Fiebig" <tobias@fiebig.nl>
To: "'Stefan Hajnoczi'" <stefanha@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: <jasowang@redhat.com>, <qemu-stable@nongnu.org>,
 "'Russell King - ARM Linux'" <linux@armlinux.org.uk>
References: <20221115163659.1595865-1-stefanha@redhat.com>
In-Reply-To: <20221115163659.1595865-1-stefanha@redhat.com>
Subject: RE: [PATCH for-7.2] rtl8139: honor large send MSS value
Date: Wed, 16 Nov 2022 00:36:25 +0100
Message-ID: <010001d8f94b$13bd5bf0$3b3813d0$@fiebig.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIsokZAyfqueh54+bOmp3YoqNF9QK2ZUOoA
Content-Language: en-nl
Received-SPF: pass client-ip=195.191.197.3; envelope-from=tobias@fiebig.nl;
 helo=mail.aperture-labs.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 15 Nov 2022 20:47:22 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Heho,
Just to keep you in the loop; Just applied the patch, but things didn't =
really get better; I am currently doing a 'make clean; make' for good =
measure (had built head first), and will also double-check that there is =
no accidental use of system-qemu libs.=20

If that still doesn't show an effect, I'll hold tcpdump to the wire =
again.

With best regards,
Tobias=20

-----Original Message-----
From: Stefan Hajnoczi <stefanha@redhat.com>=20
Sent: Tuesday, 15 November 2022 17:37
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com; qemu-stable@nongnu.org; Stefan Hajnoczi =
<stefanha@redhat.com>; Russell King - ARM Linux <linux@armlinux.org.uk>; =
Tobias Fiebig <tobias+git@fiebig.nl>
Subject: [PATCH for-7.2] rtl8139: honor large send MSS value

The Large-Send Task Offload Tx Descriptor (9.2.1 Transmit) has a =
Large-Send MSS value where the driver specifies the MSS. See the =
datasheet here:
http://realtek.info/pdf/rtl8139cp.pdf

The code ignores this value and uses a hardcoded MSS of 1500 bytes =
instead. When the MTU is less than 1500 bytes the hardcoded value =
results in IP fragmentation and poor performance.

Use the Large-Send MSS value to correctly size Large-Send packets.

This issue was discussed in the past here:
https://lore.kernel.org/all/20161114162505.GD26664@stefanha-x1.localdomai=
n/

Reported-by: Russell King - ARM Linux <linux@armlinux.org.uk>
Reported-by: Tobias Fiebig <tobias+git@fiebig.nl>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1312
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/rtl8139.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

Tobias: Please test this fix. Thanks!

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c index =
e6643e3c9d..ecc4dcb07f 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -77,7 +77,6 @@
     ( ( input ) & ( size - 1 )  )
=20
 #define ETHER_TYPE_LEN 2
-#define ETH_MTU     1500
=20
 #define VLAN_TCI_LEN 2
 #define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN) @@ -2151,8 +2150,8 @@ =
static int rtl8139_cplus_transmit_one(RTL8139State *s)
=20
                 int large_send_mss =3D (txdw0 >> 16) & =
CP_TC_LGSEN_MSS_MASK;
=20
-                DPRINTF("+++ C+ mode offloaded task TSO MTU=3D%d IP =
data %d "
-                    "frame data %d specified MSS=3D%d\n", ETH_MTU,
+                DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
+                    "frame data %d specified MSS=3D%d\n",
                     ip_data_len, saved_size - ETH_HLEN, =
large_send_mss);
=20
                 int tcp_send_offset =3D 0; @@ -2177,9 +2176,13 @@ =
static int rtl8139_cplus_transmit_one(RTL8139State *s)
                     goto skip_offload;
                 }
=20
-                /* ETH_MTU =3D ip header len + tcp header len + payload =
*/
+                /* MSS too small? */
+                if (tcp_hlen + hlen >=3D large_send_mss) {
+                    goto skip_offload;
+                }
+
                 int tcp_data_len =3D ip_data_len - tcp_hlen;
-                int tcp_chunk_size =3D ETH_MTU - hlen - tcp_hlen;
+                int tcp_chunk_size =3D large_send_mss - hlen - =
tcp_hlen;
=20
                 DPRINTF("+++ C+ mode TSO IP data len %d TCP hlen %d TCP =
"
                     "data len %d TCP chunk size %d\n", ip_data_len,
--
2.38.1



