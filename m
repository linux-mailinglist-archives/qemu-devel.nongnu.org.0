Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C260223FCE7
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Aug 2020 07:35:39 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k4dze-00048E-MK
	for lists+qemu-devel@lfdr.de; Sun, 09 Aug 2020 01:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1k4dow-0006IJ-U0
 for qemu-devel@nongnu.org; Sun, 09 Aug 2020 01:24:34 -0400
Received: from mout.gmx.net ([212.227.17.20]:47993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1k4dov-0002qd-38
 for qemu-devel@nongnu.org; Sun, 09 Aug 2020 01:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596950647;
 bh=UM40+2G2vyXFjKCGqiCh/R4Twx07UdJyaTx0+Ksjn+o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=acwuMDI1xQ9lGJDDQIK/K0uuKlV1kQO3mgiO1Gb5mySpv8mlBqFZggWtQbhXNu5vO
 1sjb6r2w6BIHOyi35+CH6Jebv+iG0Hwk5UaaJ883fJIMse/k2TIp5PTBnORjyo5R5x
 qzGQqFL//975I3UC5zl1hzBosNG6o0SHStnxeMmE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.185.161]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1kbUf11C9o-00bcRI; Sun, 09
 Aug 2020 07:24:07 +0200
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 10/12] hw/display/artist: Unbreak size mismatch memory
 accesses
Date: Sun,  9 Aug 2020 07:24:00 +0200
Message-Id: <20200809052402.31641-11-deller@gmx.de>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200809052402.31641-1-deller@gmx.de>
References: <20200809052402.31641-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Na6y4G11RFxFivFaxGLyKTc7yT+sls/y5uNFm8kxZdzWNH3IIxr
 sFcuIUV18a2yRqZSJSU+/IF9v2Akbc62eEbupWlIZ+7+7Z40wGINeFebQFlbtt5Li+cxb9H
 OYWe93huk9FqG4/tOWymMoTvlJp2wtrHgeJkUcIm/hlju2tYwhmAnD0cLxmDw5RnwtVGNbn
 X7quj8uOB5WjsdQDIgdbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EnZluhXh8YU=:A4RK/TwB9SMzBvY6IugFKM
 NmHAsXQiGgvFt5iXMAo0IofvTCHarsSJ1zbHgGyfWEXlpOZjDCNDnQaoWmRE4VTX7/AN8vhCw
 k479eciu29bVH2yxZUN/JGha36V0PRD0MtxbdgH9lkgo+G5kC5RZfuxXt16EiaCLLx/D5hv3M
 TgCQe5HDxVapyd+TVv8htJGkACyI2OD6K7MYbEC2srPy7u7VCEDNLnkW5IPi9u/m7TOr+b9Eq
 Ug1afbOiBNkReZs1W6cWpKXTPzsInmqmNZEfdA6Qwfw9WHF71BZ0Abv0HPRfT+vtcKfgXTAKa
 7W2CwmHVFd2QQ149dcEhmfX/bVx/hUra4xZP0H5F8qwFp40c2NUqVyv5bbiHqPTdicLiXz0gc
 vsgfe4RRnXFflQPK6L3KulWdHyutizBS6coRZDVjjWZkGB7po444Z1SQKspZ1mElWEZjGBj1n
 zc7h5OyEgds3O9e+5G9T6jricLrEF+KF1DezO241PoPFUQNC0pLhP36w3axNXHIeNln4A0upf
 1u0++WwDdgcBVjr2REhML2VgnZJcK5vo/7xHzPa3AKTjcZXsyidJATry/LqHowtYhOTqDrCgM
 H2+dmTA5aTOCisl926S8PP++EhSWfNKBqpDyeqBF59Abx8Bz0JK5Np8ZNN5+kobvgrVIRMsAI
 8zGjSIXVgiZAXkpXSXma6L6hk0COTylGtiE8lpJ9p5VDZ6F/oBOo/EwS1zxQWiX7RK5AISxnb
 3hek3zw1X5zUihHtSKFdNx2pcwif2nEOOxhGHvbA/1mDaiEZqeeNbb+g6SRfD1b/iEhEhuUP0
 wiFkbbv/baKdiwUP9N63WMgAJBv5pJooV5sn6fzrs4qZhWefBoor4vd4FrMrJKHnFG6vPM4ml
 2Vm+26XairoNHrK8WkCOYFCr3OfcKY8KbT6Db2pcW9lo4ir3o1dPHgq+ETLJ0Qn+1+TWqCGMm
 d/VGt9irP/HMSKOzqXIXOkAs+/MHaNmLryscjIxSb220Ba6eO623KB1xq2kJMGBKMv5nqwSp0
 ClfR6xPwnn9Xyu46JXihCwUnXUdgNFVRIGUkIS9gUYsN0kILtAmbIZpvi3iqkwRdDetnxuduA
 HyRAG/pbjqeGcVP6CG7/rxkxlFq6X2+woYgaRYZRD9i5TMwEXowquaHQ8LCF2d51pM0fdtQ6S
 su2XjeiArvG6b7lln1PdLj/83Il0zaQmkDsDYSTD6/4r/h3pePPGKghMBjTcHjfKMOuoG2Jsi
 83L8XbtQC/UtCgUEY
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/09 01:24:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 5d971f9e6725 ("memory: Revert "memory: accept mismatching sizes
in memory_region_access_valid") broke the artist driver in a way that
the dtwm window manager on HP-UX rendered wrong.

Fixes: 5d971f9e6725 ("memory: Revert "memory: accept mismatching sizes in =
memory_region_access_valid")
Signed-off-by: Sven Schnelle <svens@stackframe.org>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/display/artist.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 904a955aff..e7452623f9 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1234,20 +1234,16 @@ static const MemoryRegionOps artist_reg_ops =3D {
     .read =3D artist_reg_read,
     .write =3D artist_reg_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
-    .valid =3D {
-        .min_access_size =3D 1,
-        .max_access_size =3D 4,
-    },
+    .impl.min_access_size =3D 1,
+    .impl.max_access_size =3D 4,
 };

 static const MemoryRegionOps artist_vram_ops =3D {
     .read =3D artist_vram_read,
     .write =3D artist_vram_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
-    .valid =3D {
-        .min_access_size =3D 1,
-        .max_access_size =3D 4,
-    },
+    .impl.min_access_size =3D 1,
+    .impl.max_access_size =3D 4,
 };

 static void artist_draw_cursor(ARTISTState *s)
=2D-
2.21.3


