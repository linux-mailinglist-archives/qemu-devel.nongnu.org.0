Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C305AF7A4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 00:07:48 +0200 (CEST)
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVgjT-0007UQ-Dr
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 18:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYa-0004Yy-C5; Tue, 06 Sep 2022 15:48:25 -0400
Received: from mout.gmx.net ([212.227.17.22]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYY-00084l-C9; Tue, 06 Sep 2022 15:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662493697;
 bh=uPyd7/rGq79X5CYUYadT3vXFghOORV+xlXGmB3n27+o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B50pycN1AFRqGR7YVVEQ2rnTlJaK+HOF4j9LwCCE6/F31k+HRkNUDx0Syx25x4g+p
 K255TaZrXbwEpobgi7Guxq7oE+QKLZ8KxRyAThJT8NJdWR710MrZnMuQvMd5wFVqs1
 iZfJLnXLR1Sw+W5xpPla6bf847c3yZuGdMst8y2Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([88.72.97.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1osXAy18tJ-00YTXQ; Tue, 06
 Sep 2022 21:48:17 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH 2/4] chardev: src buffer const for write functions
Date: Tue,  6 Sep 2022 21:47:53 +0200
Message-Id: <20220906194755.98090-3-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906194755.98090-1-arwed.meyer@gmx.de>
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:54+oAnN45h+k17x39v+J4s6svfxHqLuBPOo2gf0NX2Xx8hMhoRr
 9tj/hN8SIWza9XlWr1kRrHFuEFoCBsbAHWi2ceuVvDg0jrUIu2qyVptutVLLhjDDAQXiE+Q
 gZTdavs8tF1q3lOR/ajUcYBvNco/9/Vx91UkCd6dxkcdcAv1CQwpshbfVxe8rPNzG8yV83f
 ZInP3Qvg2beNAL5AyDluQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vBJOEPruJkA=:liTGbIuLE1ZYfj/IKt8Yh/
 pK28TBD/S6ojTbBeLthVT7V2/RDrWHbBL66hUniw6OENZ5EW5MLU22pSKrPDTRbnT/G2QQdbv
 1TC7Wk54Mu0OT43CKXZw6w+S3fFHO3fisObM9Z/yvPiLEBFnZxeu5ZztwtuXzKu0HiPKn50dX
 ffXxiUjQVP4TCr/0WMFo1gz1HSSiHM3OKncip9fbWhnlyxSanNrz4wn0xbwr0ogna1XwveTp9
 E2GDD0umVTRqymtptRmvGuU4MP1ksk9ziCPlp3ghPMRX8c4TbX4Umypa9EhY6v9sWoGDoKET5
 Bv0Tff1bNx3THwbKLsUBh1c/UdjQkbAqhdbWpyu/w1voYkMUa94anHJmgGBR+eT05sf79rGN7
 VZKpDzTCwimvyo1UZDPl0iM/Z8rUVnXgD3/xT6DKImkPeu+4X+9QMRA/Qo6gQQqm0nYLr7hBN
 tF9FEaMVtoSRSbE0XWdvGqheYXdm6c1VXJ2PFQ2pz4KfN7nfyJKhTiizjHwHsdyIQn6sF1LgT
 5LxuZjZNK/A57+GzuIeqqKEMZbRoau4GTudgN5runwn35WfdNK80++52pynLuhQIqbeT2B7PH
 4tkq66dhhonIiWDT4a0j34ocsADBscwsAKdFvN3JwqIFGYZeyHNk+b/qHpxIx9BpAUPchLeNt
 EWeR/HiceC2tfOID9d4AUBWcjx9vjXYbbwmRxQwoQFc4UC2b1RSPLfmBtmrSKQ3HdvsV/76yZ
 r4a4xGoenkKtT/g9+fvbMiHnTuWj256G5UM5fnCzV5TeVxxaQYt0JLyK/dZpLmjKCQpgAzxDi
 NRke3SimtrRD5BDXi1JruxS0vBabgASlJLXIFezIWJvEPZeOb0HfDVwEQZ3thFKa+tX0R8RPf
 1MLuQJimM4PekAaCUYkbBGL1hye8UBogUHX+mqu0S9wdcogqgF9UjCtukg6jwtt3li5dvVBlG
 EASglrpWlCu6XoUnMENf/SFbExpbcO0vgAHZ4CM99s6ssy4a0dNayWZSrlcqTovRw88CbjRNy
 um4PKhkMzROtQU1AdooqLPYCFP7kxzkBisYJP2DAPVEbTbqUbworgZF+F0afj5jPpgsyxXA5C
 H4Uoehw25USQ7qd+y7IINllq9xr4P6NbyuJbEzI5MPsa5Vg9sh5en0vIO+BPefuK82o3JFOm9
 R/r8S86KpaTBwvQuo/q/DooyrO
Received-SPF: pass client-ip=212.227.17.22; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Sep 2022 18:00:42 -0400
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

Make source buffers const for char be write functions.
This allows using buffers returned by fifo as buf parameter and source buf=
fer
should not be changed by write functions anyway.

Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
=2D--
 chardev/char.c          | 4 ++--
 include/chardev/char.h  | 4 ++--
 include/sysemu/replay.h | 2 +-
 replay/replay-char.c    | 2 +-
 stubs/replay-tools.c    | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 0169d8dde4..b005df3ccf 100644
=2D-- a/chardev/char.c
+++ b/chardev/char.c
@@ -193,7 +193,7 @@ int qemu_chr_be_can_write(Chardev *s)
     return be->chr_can_read(be->opaque);
 }

-void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len)
+void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len)
 {
     CharBackend *be =3D s->be;

@@ -202,7 +202,7 @@ void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, =
int len)
     }
 }

-void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len)
+void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len)
 {
     if (qemu_chr_replay(s)) {
         if (replay_mode =3D=3D REPLAY_MODE_PLAY) {
diff --git a/include/chardev/char.h b/include/chardev/char.h
index a319b5fdff..44cd82e405 100644
=2D-- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -186,7 +186,7 @@ int qemu_chr_be_can_write(Chardev *s);
  * the caller should call @qemu_chr_be_can_write to determine how much da=
ta
  * the front end can currently accept.
  */
-void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len);
+void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len);

 /**
  * qemu_chr_be_write_impl:
@@ -195,7 +195,7 @@ void qemu_chr_be_write(Chardev *s, uint8_t *buf, int l=
en);
  *
  * Implementation of back end writing. Used by replay module.
  */
-void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len);
+void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len);

 /**
  * qemu_chr_be_update_read_handlers:
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 73dee9ccdf..7ec0882b50 100644
=2D-- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -198,7 +198,7 @@ uint64_t blkreplay_next_id(void);
 /*! Registers char driver to save it's events */
 void replay_register_char_driver(struct Chardev *chr);
 /*! Saves write to char device event to the log */
-void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len);
+void replay_chr_be_write(struct Chardev *s, const uint8_t *buf, int len);
 /*! Writes char write return value to the replay log. */
 void replay_char_write_event_save(int res, int offset);
 /*! Reads char write return value from the replay log. */
diff --git a/replay/replay-char.c b/replay/replay-char.c
index d2025948cf..a31aded032 100644
=2D-- a/replay/replay-char.c
+++ b/replay/replay-char.c
@@ -48,7 +48,7 @@ void replay_register_char_driver(Chardev *chr)
     char_drivers[drivers_count++] =3D chr;
 }

-void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
+void replay_chr_be_write(Chardev *s, const uint8_t *buf, int len)
 {
     CharEvent *event =3D g_new0(CharEvent, 1);

diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
index f2e72bb225..3e8ca3212d 100644
=2D-- a/stubs/replay-tools.c
+++ b/stubs/replay-tools.c
@@ -53,7 +53,7 @@ void replay_register_char_driver(struct Chardev *chr)
 {
 }

-void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len)
+void replay_chr_be_write(struct Chardev *s, const uint8_t *buf, int len)
 {
     abort();
 }
=2D-
2.34.1


