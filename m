Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F4E5B50B7
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:44:05 +0200 (CEST)
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRw3-0001NP-To
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRZ1-0005Ps-8E; Sun, 11 Sep 2022 14:20:15 -0400
Received: from mout.gmx.net ([212.227.15.19]:50979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRYz-0003Tx-B4; Sun, 11 Sep 2022 14:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920409;
 bh=apaOk+iHU5I8xklbSY7HRDjINHyWilhq5B2KR+YX0Sg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EsQX2hLbsvb88Qw4BWIm0lUBSf0BZzegci2S/B+nuUcLuu3Yu0KEQTsB36aZn1HUW
 SSvaJsAu/cGI3dPcsD20a4EVGY4WW1i0lp6Z3e3FCm9665bfso6rvlwRhy+uC1QIqe
 7jE8aomUD91UTCB58qu9EPjVwMUCrGYlchLp72/U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MGyxN-1obYAV3zDn-00E9gz; Sun, 11 Sep 2022 20:20:09 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH v3 2/5] chardev: src buffer const for write functions
Date: Sun, 11 Sep 2022 20:18:37 +0200
Message-Id: <20220911181840.8933-3-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911181840.8933-1-arwed.meyer@gmx.de>
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:794fAuD/Ua4fCaYxi2tOTLg6utLAMXarptY5Zbo2yR2EwXJJPg0
 elZgUfLR9zXgac6GpH0SNn9jWj9FllUGf7X9pqgqXk3S8cobQ8Niggl43n5B/h43hF24lLk
 qNdmQTo+CZKh3YTuyXzkUtj5Ahzx0C5rfrKyCZMHyQiAEWEP8ictUVUfxRpbOYQZYhAwrJf
 //93FBRSk+etulD+Y0vgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2l9NviKshLw=:wQIUnOV5/B92FQHW84x7lg
 Bo+yYMwVA4HsoLrr8jxTTrk2MNAAiSQJX6Zxzw/fE1EjGfhVgmNq83tcWtcWzvVECKw/eYR20
 oHLqkeMFZ894P82HQPgSbODb4PhF2cjdQoEBJvIjkSkf4EnY3yHFpd3t6C6CwpZ64qTMQP6k6
 59YZtLaYoqJ1eYsshqfT/IoclPX3wIn1u03VUF6yZnRiDpbm8aS/b7LXM/3A1SbvVYllqvE3O
 ML/vi9Hd59I33sdyhvZLTGFr+3cNBnJgDvaOu/JtHfnH9QPpx7NOrJxwa3lx1Z0SSVHQ+9crl
 MQbVnm/bpvDFdFR6YX2Qe6OlQnZgORkQ9BRij3qoXz66PB/IOGzIST/NufIR9MzrCbxw8Nuj+
 GGOKXzA1B1Ekko0VBVP25Ry6EamIpw2of46bRs02wABtnA86oKYh6wMo+X3JSIRFKFHid3Kon
 7QnSm4LZJS9rf/NSD/0Rwse5f4TqKSITy06dwyeFL26+DsUQAhMa5M4KsW/kFbYqXkcgmfrwQ
 j1EdOec+prpOZAvi5WCtIGfjqwx2mBywY8Gq/+Okz5JUdQIL+m6NfgtuGJz/TJcq8xixNTzf4
 yr8MDpZ/ZHnPvFk8hFJN8okSNCz2zd2iLOmTvJMAg7lJ1186s5t1+SyZc0isRoxmWe3Zl1y28
 Ic0KttkZJqdeyKeGNurYZECPR3FLdBDO6ZWJIYfQ2ZJJX7/pne+0oPEb8oNhY1CjJMsMnWJD1
 OcE+mmSeqoz+gTe6LdcoyK43lmC6HE65dR8kXNv786sc15EkIOrGV/9CpGIF1AhjHZ1ZTSx+T
 ouK4utwmqK7OY8b1P8CHLj9bcWAYi11HhFam8O2LGwCCjyZYn0RIdHsqVpQ4jt/Im6UHSwaxz
 8pdhdKXefJnukA415H8G+7VkT+q3ItVrJb4f3bdXou4tacccSFLfSBfnDNgiQMBMIqOqlmRGx
 X5LDM6ZEWsqJxhmDHeaspPrIN2ap5w3ndxt45a/s+2UN0+ugBpEp91swpXCAox+uuxgkqUbqn
 7NoJVOuM8EQ6I22BT1rDETT1CuAytKqF3cXyszgIYpjk+xpeKCgMMOMS6ruKE8sj6d1lbmblH
 WCsZfAhrHGGPHXoQtfdL2DDf+Oc5xHF9NxY0a3KIdaL/id3MFRAw1d5nMGgr3En4EyzF2wf4I
 PkYKLQp6gPTyryQjmFAW1a7GS+
Received-SPF: pass client-ip=212.227.15.19; envelope-from=arwed.meyer@gmx.de;
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
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
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


