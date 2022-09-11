Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18465B50B9
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:47:27 +0200 (CEST)
Received: from localhost ([::1]:43692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRzK-0003j2-Po
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRZ3-0005YR-BS; Sun, 11 Sep 2022 14:20:17 -0400
Received: from mout.gmx.net ([212.227.15.18]:50139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRZ1-0003Vf-5a; Sun, 11 Sep 2022 14:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920411;
 bh=6tNsnvyALQCekAEnGgE4v3vfbs9lSzguI1+wfNRfGJU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=A1fkn5Dwfx2CvPKl0keA+eyZ7RAJ+WRIWrQgBTa6LgW23ot0n8IRR9d3uGZDyf/dv
 ERWtlstHK0Y9aq65tkdkVfhLxJGrFS+xY6FxBPispegmiu9U/ZP9z8QaLUAdF0o7ka
 JIMcvTBNUO+ALfu9VMnzml6K6DPzpWweVlarh/XY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N5VHM-1pQ5Jp077i-016w8S; Sun, 11 Sep 2022 20:20:11 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 5/5] serial: Allow unaligned i/o access
Date: Sun, 11 Sep 2022 20:18:40 +0200
Message-Id: <20220911181840.8933-6-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911181840.8933-1-arwed.meyer@gmx.de>
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qU94FYFuIO0wuh8O2fL7EaCNs8iDWdHktmifAvJD8N4EdvpIcx4
 o98fPRWcuuIMx84Dkp4wJCPRbJqKvXrD1OJ6+WoAHgpGcY2nlBeXmBvIFIvVeRVdgF07Wa9
 7L4JxDp1QA6Nufj4X1E8Sm3NGnYtrYA2T5hvXd5uVQYhtfwSDgjTGDQ9O4zkJpS9sRfL7Ka
 xeOwqt2dJfASRZC6au3ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LY/N6H4Dsys=:yseZBKgfw8KD4vbg2cRyfj
 BxAY2RWiaFRGFF5jZOpPd2P9nyVpT+9BhEQMDGk63+jeH+LVBzucW9Az8ag5FGu7P0UsEg3ot
 R9s6p/G7Yxj+erX0Codt0MQyL2Tpr12q/duIalpN6+UkDx/9NnKuL4aKZMurdcuVejHNY7OVQ
 A0OX7SVhLTxl4ZmXpockeXT6loSw/KW27CY6xnvaeDHX+xMykcWwFoUqpUM1E637f382W335w
 GdPoe+sCxr8Z3i58vqvNsgkMr9CJ/W/FGFZzV7a0AdtpGfYyRG3o0EunGmrn5d5u16B/wXiyJ
 0Z4pn6GqIjtUABsK57ZJnyRiO/LIfGfa164kXEhpaDX2A738reZKwptY+ugYVM8kkKWr6G7Xu
 GG+AgDDxUvBmnwL6zHJevy3CwzphBU60lgBX0z8LOlv5rP3ZM6xpedkUMHSFdEofkdOlZbK7L
 YNAVLziQJHVC8O6b+N89VaVr61HEOSuqJ9LBbHjDgpKhYbpNdtfJi0Y+8W534Gj4lFelPbhi5
 rOM3XlLVLmkhwMCbZTSoUrjDw1rDlQJyKwRbA7mkLwFXtnrTdn2FUpuOWmaiJN/1IRSJQEWHH
 +IvzwO4MwlA6lega9NbA3TtTr2f5b8rPCd8aMNsobQG2iIph1TmNRfSeEUWpkZLFb0kUoUlw+
 ySIODtTS1FPBrt4LFTh6Vkc0O9drSlgr9Vy+E1fTLymPSIT4tttLXsMAqo7GSbPFjEr5r0I9E
 ut0YnihFi4hzcoI9kOaTLACi9co73MszXQU20r784MsDfnlfT3yJlVoqJ1bFrBfOVCX9IAo7q
 xdQ8SPETNXi9qKuKscR0qh5oyNguXymvY2A82pmb9exyzNygLXA8/2M/phmJnq55Ei94o+uAH
 /AjlVPti0aYOXVF8ZcXDBParo341yzjosTE0KVE8mKSDNqD/fAcZL1AKcQg4KMSDV64kWNO6S
 oP4JSmYteallDgDp8aBAOecGe8OwM2L4BRv4JKRTB2qf1EW2XxgaQ/V/sMnSo2epUuXYT4cvo
 lA7mLDpb94Mb2oPKn9EPZb/yk5Wfe7DYyagpoTyWE9gG9mATMQmd5W3kQ6CnxqmIKLNEXJ3AU
 JQtthP8guak5EGICXHO7Pci6tWca/pZwMAzgvFbxSwkRKYIx19kpFS3p2lwN6ObRnED1oevuo
 b2Te2mBUlFhyHCNJHewRdfqC7e
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


