Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D2176396
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 20:13:31 +0100 (CET)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8qVO-0007TB-Ja
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 14:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1j8qSH-0003uY-Qh
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:10:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1j8qSG-0005Fm-Rl
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:10:17 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:48544)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1j8qSG-0005Er-LG
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:10:16 -0500
Received: from fwd02.aul.t-online.de (fwd02.aul.t-online.de [172.20.26.148])
 by mailout01.t-online.de (Postfix) with SMTP id C08C3421E456;
 Mon,  2 Mar 2020 20:10:15 +0100 (CET)
Received: from linpower.localnet
 (r44a3+ZUYh1HEwfogxLXoOS8jYkKsHoyDYbDBU25v+w2CCzIul-DdxdwLPlrojDght@[79.208.28.226])
 by fwd02.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1j8qSF-03bHiC0; Mon, 2 Mar 2020 20:10:15 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9473621B1C2; Mon,  2 Mar 2020 20:10:04 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 5/5] audio: fix saturation nonlinearity in clip_* functions
Date: Mon,  2 Mar 2020 20:10:04 +0100
Message-Id: <20200302191004.5991-5-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <417bfe2f-e3c1-d83d-b437-47859daf524d@t-online.de>
References: <417bfe2f-e3c1-d83d-b437-47859daf524d@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: r44a3+ZUYh1HEwfogxLXoOS8jYkKsHoyDYbDBU25v+w2CCzIul-DdxdwLPlrojDght
X-TOI-MSGID: 2c7527be-66b1-4209-a59d-a0184378cd26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.80
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
Cc: John Arbuckle <programmingkidx@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current positive limit for the saturation nonlinearity is
only correct if the type of the result has 8 bits or less.

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/mixeng_template.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/audio/mixeng_template.h b/audio/mixeng_template.h
index fc8e1d4d9e..bc8509e423 100644
--- a/audio/mixeng_template.h
+++ b/audio/mixeng_template.h
@@ -83,10 +83,9 @@ static inline int64_t glue (conv_, ET) (IN_T v)
=20
 static inline IN_T glue (clip_, ET) (int64_t v)
 {
-    if (v >=3D 0x7f000000) {
+    if (v >=3D 0x7fffffffLL) {
         return IN_MAX;
-    }
-    else if (v < -2147483648LL) {
+    } else if (v < -2147483648LL) {
         return IN_MIN;
     }
=20
--=20
2.16.4


