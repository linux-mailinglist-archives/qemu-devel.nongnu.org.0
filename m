Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E88A39DD45
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:06:22 +0200 (CEST)
Received: from localhost ([::1]:52708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqExQ-0001yh-SR
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1lqDqJ-0001ru-5B
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:54:55 -0400
Received: from mout.gmx.net ([212.227.17.22]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1lqDqH-0001uR-DF
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623066888;
 bh=Bq6UTiSaLI9PYDWj/fbD3aZNXdDwU1l/Kn2YexqvHZw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=YO3I/RXvoZSYJsaPfATSxrD0fg4O7zKXCtHRrAjDPdUyXSMe7An16gBdcwZn70Fpe
 /1I1iITLmjlv2cKJl94x5OCNfOjwpcayKk/TCT7mIwnfxGetY0LPLLl1h9igFQ0B4M
 3XJzQjmYtsOOtlI9PxebQo+CmFMjbGORPFpmex8Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([88.130.62.208]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MQeA2-1m1re21C0k-00Nk4M; Mon, 07 Jun 2021 13:54:48 +0200
From: =?UTF-8?q?Dennis=20W=C3=B6lfing?= <denniswoelfing@gmx.de>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] vga: Allow writing VBE_DISPI_ID5 to ID register
Date: Mon,  7 Jun 2021 13:53:03 +0200
Message-Id: <20210607115303.228659-1-denniswoelfing@gmx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DyPMkUFu0qmpAnZgRWuJeWOg1oaDq5AC6LrZLf2RniRq7opWOao
 HZI/q0YTskS1tuQ+YOThYNFylfahEnmbIzhIipN0ZcISWgfzvwpDNdHcB6wT9VdsP45gr6A
 umEMDXjdWLUmdlwrP/pAcuiQcaw/EWSstH4lfWTd6MFfKuCtQaa/IwKwpjiG+yURuGtU17K
 bo5ffUsv4pybj2eaJxL0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wn41h9VhCWQ=:sHQ44A0yZQcnvFmBhd3g8H
 2tsnRQ5Tx/pHUUSQJ2SYxwZMSxvjWtwHw7ZeUrtmCEmdFbmbCzU+HW/ugesYuwEOJGk74JkTf
 OaeEKGStBRSbwT8NEraDMOM1hBqMnIznloWnU9wGFolkSdbRSnw0HdGMcPimcBQxtnjkqFfHs
 m3Md4jl8TNXUMAliVzt4jfx3cbrKl8Uydzwy70ogQvOuhxpit9P62Ruo9XX2cDWg3KMwr1dqL
 PNk+viKWP2HO+dsBXsFqEhWfsGYALcVBXS4lCLCJIWNEz7p9DGR3CMEnRbEOg8CDOvqzfNpSw
 Ej1sZQ37QLfxWtIeCbMCucUq+7h/QaFnEjMiAQrOPzu9eIk1QAVevYpzsLGnmj3af5PM0EfvD
 6EcbW/120o3O9IAJTWgOHAeiXJx1faOfIvgMVKeTHBDpbExgxWQK3wRpa9uhjYmKXjfxo5Bft
 0sNFBg4aLcjj1TA2hk8kDUstpYu5QlI5y8goevKIdpXRFdw7A1fdUqrV9f1gSr5JZDPE+s396
 nDXrgoI7cXu1+lzuFSe9WHu9hcpo5TfXK01+ScIhFxcpHBfegG+eFe3RGWBnl2ZYRBR39PaNV
 QqZ6a6UpyBMh1x8GN9WKD5NcyMzlFfGxSJ8ecvtzWzaxg5I/JzXUo0yqaeHckF5l18synaoiY
 MgvtpSelEcFa//KHpk2corYjw3if06MQy904EcidO0+Bx5mJ5qbuzt7u6iwjkUXgkuRy8QCVq
 k2ij8OmZIH2ANIMiWZYtajFKNSwgeN2MZdoayoYl+v6yQyLB3xqKnQwUs1WOrd/wMSAUo95UE
 1JylxXXrSMY8cBMQKR49Lx7n5RjqyB+Tt6AFOgqmmBQhI3QIHUftswrM8AhcOqIfsWFUHkT+u
 B7MiweWgnERBuqX4/QaPPEh5p6qYmPOMLq/isKRD9H8ExY1EM8hlM1b4qlNdTOzR2Q5yvaP+j
 ick6xPjG4FvfSbZoHW/nmh3HKwEdVFTGLLa6By4FlKvwitsrgRSgLUs/8q01/1hypeZWlO4yQ
 23kc5VdA0ZauRNgcYpIzBnPIZRClApjs9RbN5rkJCtPjB1VV3XRPyFK6MUzwDgSNMIVQOVfhu
 eUx58mro6U0VxC85pON9ASTx0XgRKHqGZ59erBAjro3qGs+dql3oYOi/w==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=denniswoelfing@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Jun 2021 09:04:40 -0400
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
Cc: =?UTF-8?q?Dennis=20W=C3=B6lfing?= <denniswoelfing@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The highest VBE_DISPI_INDEX_ID version supported by QEMU is
VBE_DISPI_ID5. But currently QEMU only allows writing values up to
VBE_DISPI_ID4 to the VBE_DISPI_INDEX_ID register.

As a result of this when a lower version is written to this register and
later VBE_DISPI_ID5 is written back, reads from the register will
continue to report the lower version.

Indeed SeaBIOS is doing that during VGA initialization which causes
guests to always read VBE_DISPI_ID0 instead of the correct version.

Signed-off-by: Dennis W=C3=B6lfing <denniswoelfing@gmx.de>
=2D--
 hw/display/vga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 28a90e30d0..9d1f66af40 100644
=2D-- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -752,7 +752,8 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr=
, uint32_t val)
                 val =3D=3D VBE_DISPI_ID1 ||
                 val =3D=3D VBE_DISPI_ID2 ||
                 val =3D=3D VBE_DISPI_ID3 ||
-                val =3D=3D VBE_DISPI_ID4) {
+                val =3D=3D VBE_DISPI_ID4 ||
+                val =3D=3D VBE_DISPI_ID5) {
                 s->vbe_regs[s->vbe_index] =3D val;
             }
             break;
=2D-
2.31.1


