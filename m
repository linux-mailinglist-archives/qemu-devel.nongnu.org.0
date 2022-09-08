Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8665B24CE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:38:52 +0200 (CEST)
Received: from localhost ([::1]:54770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLUJ-0005S7-Ap
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNc-0003yE-Mg; Thu, 08 Sep 2022 13:31:57 -0400
Received: from mout.gmx.net ([212.227.15.18]:39757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNP-0002BK-5n; Thu, 08 Sep 2022 13:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662658297;
 bh=6tNsnvyALQCekAEnGgE4v3vfbs9lSzguI1+wfNRfGJU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=H+oSUyP7e6lRS4hcaJAO3X85kguth4HnGR0xdUyiH2jqyfTiIElthRUayKmQyDbcV
 Pt6YNvZOVE/WWE8wgKncD6HZ3D3Iv+KDlCmzuohDJaPRmldXWzzUwgQmpUar899o9D
 RaIdRq8jSwBA1YYrmw7D7IL+emlYUuRis1BQuDd4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsU6-1of6nh09b6-008uOW; Thu, 08
 Sep 2022 19:31:37 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 5/5] serial: Allow unaligned i/o access
Date: Thu,  8 Sep 2022 19:31:20 +0200
Message-Id: <20220908173120.16779-6-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908173120.16779-1-arwed.meyer@gmx.de>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C+DfGC9Mx9hS4qYSHt+P9guSTmGOFbC3ivCXrl1UAyPVFCtziWk
 +dDxlNZ8WIHQXXmycn8GeK9pbHb6veXBD2kePZj9SSnwY/yOUwlGNf70w+shDpwDVDxdmZo
 BQAWNwI1cie0Pc2sN3wI1470TvE5qWjD6IfAkd/29I8kXtZ9asHem5Wj2OcdmeKDprxo+U5
 KytYJeLrUh11VRva7NdTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6WXX/W6a0bc=:kXY/MxuZQ0r+VhOvk5xNey
 GXPPsSytGLUcH7hcrcxT61cT+wNmfyO5Vm9wC9gQwZRPOzjQUJ23cjx0e7RH5tOTTe/hGf+7k
 6aIXgxIwQzeCyaxoIJaEyXmspO7O5DU7MQA4cnRATmeUScm3ItrldWUcnutfRPHIx/YM6pMOT
 8mUVwvQjUUtn42yZnTw9NATJje0242M537FJbjHrtysAikE73w3OBk1lL29iS6Sb6RHz3GDx5
 /0mMb9SrHb53a0xZ67DPu5GcS2E9TnzKzK92ON66bz2b3cWodQLLy4NNhJJ2Lkii5dJx0LdLa
 2TT8ryscP/XmYfdMAoi02Q6YmcgzVK6l5N7+DmU9lkte3RG/uOn+Pnc7vCed12U9AL/APEu8S
 +LeKqN8B3YneuszPBnur0sOGpMQdWoQ6IsAlA8uXxBKY6ExDdbshjkE3QOxy1uxy4oe2WaXwQ
 W8l/x2OvEJSfxSX5lR6a3qpkdVn6I1OE77arQRgKItR1QZOoAATGEpvhWZbIyacL607f5pCJ1
 U6ICHZ62j6I7Fad/KSVMEATGZEFN5AJYytTwdh92V9gNWgR6dZnS8EN9jo8+yySEMOYyCBJVb
 iZyPS1tywk+F+M2q1Nes0DzEymTB8hfsqN/SZ5l+vNVV93l5p93YMZ4IKtW+vBKtz+aVzFvTD
 jcnZjPks0Zdgf0YVaC7Ae6zlrX5AfaOAezqY87m3jlITtlMdewdnIOi+9DASu7AJeVmB2DSHI
 GZFhl0/V4IAVzdVgk3tisRwZEuJwJV2ph5S1zAflH3n1e/phNSXzLmuZc62v6X7YlICZw+3oK
 rduIrNCBeqzZd01YvuK9+lt4QYMMRi4kPE4ftB0PMsSb9JsTFTdyjpPMitkgKfO9ep9XfwdCe
 0vIOe7nyiVtIwoS/7Ls7BGFOFxuF7UK704xrVLPV4ALqjI6B3J6+aPfoFt/+aFiq76zL4xIpR
 6JK81HWxyL59g1oVKm5b1V79mfy69sPAS2Emt20fWfKHSiL0yFj+FZ4RmkWjJAJuYFRHPEBAq
 DpEu6irNJDUpZi8OOR+CIK6JlhdiQDIju2JmFfrwzDTSDbb2Yc02sSaoz7MDNxNcB1yVf5kX2
 7aMvdGAVXfKnNoCW8qt+OkvJDFnGdQ01byaeaEvzNWtzvunA6ULgv4I+vLECUSfkCOQEDHcjH
 KONCDt+s9Q6vWMQXcVax7Ca/jh
Received-SPF: pass client-ip=212.227.15.18; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unaligned i/o access on serial UART works on real PCs.
This is used for example by FreeDOS CTMouse driver. Without this it
can't reset and detect serial mice.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
=2D--
 hw/char/serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7061aacbce..41b5e61977 100644
=2D-- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint32_t fre=
quency)
 const MemoryRegionOps serial_io_ops =3D {
     .read =3D serial_ioport_read,
     .write =3D serial_ioport_write,
+    .valid =3D {
+        .unaligned =3D 1,
+    },
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
=2D-
2.34.1


