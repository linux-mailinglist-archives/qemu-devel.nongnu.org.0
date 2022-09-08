Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA95B251F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:49:15 +0200 (CEST)
Received: from localhost ([::1]:49874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLeL-00071f-5N
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNc-0003yC-Sr; Thu, 08 Sep 2022 13:31:57 -0400
Received: from mout.gmx.net ([212.227.15.18]:33797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNM-0002B3-Dv; Thu, 08 Sep 2022 13:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662658295;
 bh=uPyd7/rGq79X5CYUYadT3vXFghOORV+xlXGmB3n27+o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EzszpB61HFWdz26N2B68+zKFsxVyoeaikD/R70mdKPdHR2pUveOtty40+rq2ZGOkC
 kcHufuxdtI7o9FoAPsK7KH/MkZ9rGx2ARAnIsCJO3EVPlJw7joTQ+qyRMa0GpyGRmx
 nqDHs292MULV7UxBmbGVYJ6UVgypGRQY2l9v7VVQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1pHrqt0srk-00yf2i; Thu, 08
 Sep 2022 19:31:35 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH v2 2/5] chardev: src buffer const for write functions
Date: Thu,  8 Sep 2022 19:31:17 +0200
Message-Id: <20220908173120.16779-3-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908173120.16779-1-arwed.meyer@gmx.de>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HFwzM8KNRkA7fW+29nhuyBQiku2xDMh9MOU//2mlLJZ5k7e44IW
 yyR/MvIXSlyKp9tmtYeofzVc0Jj+NuIonEuPEvLh5LYw1CvCjc+pBbsFhIGh0/nR/33U0oS
 vutN2vfymZxGzEsZEXxluNvH0E5GXgZpqwYtJW3SEq8scRKCQ9w1/68lJ9PKGsNR822W1+8
 quRcLZlTKF4syThPhamFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iDhXBZbGu0g=:/IN4HIA44D/iN5/nOc9qiY
 oV8GFRUxMXQQrHvK22dIDg3Ti79SB288i1Aewg4JoOW4aOwXOdDK6nHo6mJbhD9EoReQ+DfuU
 gf4J6jhXYDKqPv2CuXPlzgy5rieO6BkB6Od1R5IrKOItp8tyUnJU0TcoC0Rnt9l3vJzEOXQef
 quV0jOYev382ItM/UJNPscYph7vGsYVDHauUCdrxCZOpdURh5643Jm8CQbfdH/uUYoen7qAPr
 4raopy65AP7DDgWS5bs6zDC2HOGr7pIyNz+8eORKiT33BHdZoXbid22IykFzG+nfcxhk+m8cz
 ZHVZy/KCWQgeOxDkXXCOy2LO3c3FFX0y5KwSW9+rP3dJTSA/PbNor+OyWGan3JIDzYTtm0eNC
 X1vADlte4GveLt+QeUyn+/qIr6mXkafNS67prq+YKgnAqv+1gpT7oOJ1Bn7MoW1/0UDl99rFx
 90QZtYN+Imppp6C77mjhVSEJKF/a36teW7pA+/pX8C+hACrLoEfN/sCTV14GcWfSnMe84ZpCP
 2swCkXBgIfGKLg5lpNUo30iyEEFBptQlTXatC6iKYvK/Mtxr1VwQ5TRX0MwJLDCGo4rXlSvqI
 RZdE/sTLE0ee1PdYfNy16UD6oHnjFFTtSWfbCH4ojl9aeCKJoyKWZ8MLUxcWo1a8gH7fmb3Br
 rKVtc/O+WdH3BFsgUp6CuZMD4RFe1CoY/G8kXUhnhTO+G7f2fYw1BNpPC2BCh5r+KxkuOO4rz
 +rR1kEfxMIuJySRUpANzrQ/VQWGD8VLSMs0drmJZrXyu4sXjGn9MXRCClCYUpZgoASYmCh2Jy
 KomK3kv7zU5cZ51T8xK/38RNOXwkPpWx7xyWFmNwHSFENGX5NlW9E2hyif5hwwYUoWroHtVi0
 MUWc0tfzP3vnLakAwNdGWozDEVVneeuXWb62R3wI0E/X/KpMYj5SvvgifC3Sp4iOrK4uNymsq
 6uzXZR1Ti86JR1FRtr3Wb0NPVilvVolzZ/W7d7uqVxtnr4t6G6AxZW5hcbDvPu41BuR+2vf/l
 GjACHy2IrpIZYapV4wIjx/yGQZfcDw46SUW4H9dBE6fXf94tr3+b73BhMJdVytJ7UUSmPclYX
 Ya2kUiBMOJcTNqstrghsUEoWqnrZ37f7EzTDHFkBtvSUgJzc1EF/Q8eAUzNIctWcxzUaqLcgU
 6RPZa2ezrFLWan9mWEyQA2nECn
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


