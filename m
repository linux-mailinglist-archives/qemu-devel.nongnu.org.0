Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6750F48CD7E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:14:01 +0100 (CET)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7kwS-0008HF-6o
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1n7kqU-0003fi-Hh; Wed, 12 Jan 2022 16:07:54 -0500
Received: from mout.gmx.net ([212.227.17.22]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1n7kqJ-0000ep-Ss; Wed, 12 Jan 2022 16:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642021652;
 bh=KkexLjci6LW1vNBOmGNzhom0/yMwVW+n37nBFA34etI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QR6LBzL3KI0ItYd301DHnmLDbTH+kw7Rz7oYIZh0sJeqHuKRqGcHAUtz2OeFiA1b2
 pPRFLoSzWylSx4y042AWNT3Cf1IYZOZC/1fom6cBpLjZm9km84VviJMj635WYpCwTT
 SIvu+bd4EZhG+3mrmv9biyKFJ1VOSFiuUc6YEzhk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.184.198]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f5T-1n3dhz2Jih-004Csg; Wed, 12
 Jan 2022 22:07:32 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 5/5] hw/display/artist: Fix framebuffer access for Linux
Date: Wed, 12 Jan 2022 22:07:30 +0100
Message-Id: <20220112210730.292775-6-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112210730.292775-1-deller@gmx.de>
References: <20220112210730.292775-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wTjYeZm5AYNTmBIQyTsZJOCQtL5GZdeNa5CWUUvIUuO1SIFqWON
 Nyqv2LUdoQtJH9jVpK8KjRZVVZsnsO8ZTXIwJl/H5sZOx68Nc9p5tNx1PEgjpufvovLezrx
 s0bdSAo7EFe7Je0Zf6LozeFW3XQSBPvb6CMyi2zOryG1IO3OTVoYsqfGZpaadITm9ZlJqFf
 D3blPtIK/Ldpt7wk1p9BQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nTZregWM1UI=:jvMdg4sY6g0TIlkBvcOF9I
 qKiQCjOFVgOuzSueRyjEzdPynL7k3gH/pAo2a7waaUZriDsgFFHSn1s1PPXhp8bHqAZmPEfBq
 iig8uMDiaIPK04J+SfWLeerGrB/obafFVYlDtGL5A09Qot8ycEsM43GfnMF9TgOnQjwUGDXy2
 Vm86iYRIACUOBocMWnjKLx5lyLI1uJmZ7C1oi6E10gFzurZKh5Cm6lavbtBkdKtRSJUAUgK7G
 fhT02IouAt2NMcVVtFEGIpQ1M6Q+MdzvY5nod7wYK5mHwEEsIPSlwFqv3RbxW+OhBtN2KgFNc
 2gRTZ9z1gN7MXHFPfeqaOcbLmx8S2dyzK5kvUjebwWwago15oPWlagBlwff8eHI2jQsHWXCq8
 rBYpJQGnVLQEeWKWt+3N8wgj+HN8TQG2LlDytRJ6BTKc/KM6k2UqhsDQQW5eQAaQHfKQNYqDu
 9XmWFoQJ/Ok5kiuc53Vm87HGjCLzB7rw4bbAFK3TgReh8Pnu0AzmT9zZwKQtFKXMYEv/6/Ny6
 NQ8dMKXiTj5YctMmLE88/FIWhG5twAYeIYnnE8txfTviG3AAe01/8lTUo1D5ClJhQ91IYVaId
 CcMZbuVb3c21pkprOhv1raRD6fpQ66kXipQWN2+q+R8NZrq+Vaom+kVFTAKtmUxCRewIeO72w
 ciPZ9OkG6mKxY2eUXb+KCSL/wPHzSvrYTRylmJxk8vRQmowuTACJyv4yZWQzflrSAsd6PIzLT
 IGolrQ92/2PFTYaY2mUZ7ko1hUtdRS40DpFW94RVZixtC890DT5DQoRd2s8Ntw3aOYe6GPJRp
 C0lm21QrrOvMBEsyC0mTatjs+L04U1maODHAos62mJ8cUYUf4OqRAHAakLxIIXCcJvTSvvygq
 cUKy3bc4ebs+A7tCo+X6b61J0DYmUP5Kve5kv3bE+caq2uOA6hRFCFqkLq7olHjy9JKFTZ5ws
 Kyt2Q8B9ZTC8k8FLEZm9BEWSqGdZdpQvmwbDLlM9WmXtXiMyiZu6sObuju7xTABRtahldg+Cs
 DSokJ4ZwunSUaCA+2ipdZER+pMqBOcGi+9q5+gzFpsVEcctR71xJDoJX2BXJAu8n+wFxE+FRB
 PRaX72rlRxWenw=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes two problems which prevented Linux to access the
artist graphics framebuffer:

The check if the framebuffer or the color map should be accessed was
incomplete. By using the vram_read/write_bufidx() functions we now check
correctly if ARTIST_BUFFER_CMAP should be accessed.

The second fix is to correctly calculate the X- and Y-coordinates and
check against the graphics resolution.

With this fix in place, the Linux stifb driver now works correctly,
shows the penguins at bootup and uses the stifb as graphics console.
I haven't seen any negative side effects when running HP-UX.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: qemu-stable@nongnu.org
=2D--
 hw/display/artist.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 6384076c60..fbf5525334 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1186,7 +1186,7 @@ static void artist_vram_write(void *opaque, hwaddr a=
ddr, uint64_t val,
     unsigned int offset;
     trace_artist_vram_write(size, addr, val);

-    if (s->cmap_bm_access) {
+    if (vram_write_bufidx(s) =3D=3D ARTIST_BUFFER_CMAP) {
         buf =3D &s->vram_buffer[ARTIST_BUFFER_CMAP];
         if (addr + 3 < buf->size) {
             *(uint32_t *)(buf->data + addr) =3D val;
@@ -1195,14 +1195,14 @@ static void artist_vram_write(void *opaque, hwaddr=
 addr, uint64_t val,
     }

     buf =3D vram_write_buffer(s);
-    posy =3D ADDR_TO_Y(addr >> 2);
-    posx =3D ADDR_TO_X(addr >> 2);
+    posy =3D ADDR_TO_Y(addr);
+    posx =3D ADDR_TO_X(addr);

     if (!buf->size) {
         return;
     }

-    if (posy > buf->height || posx > buf->width) {
+    if (posy >=3D buf->height || posx >=3D buf->width) {
         return;
     }

@@ -1242,7 +1242,7 @@ static uint64_t artist_vram_read(void *opaque, hwadd=
r addr, unsigned size)
     uint64_t val;
     unsigned int posy, posx;

-    if (s->cmap_bm_access) {
+    if (vram_read_bufidx(s) =3D=3D ARTIST_BUFFER_CMAP) {
         buf =3D &s->vram_buffer[ARTIST_BUFFER_CMAP];
         val =3D 0;
         if (addr < buf->size && addr + 3 < buf->size) {
@@ -1257,10 +1257,10 @@ static uint64_t artist_vram_read(void *opaque, hwa=
ddr addr, unsigned size)
         return 0;
     }

-    posy =3D ADDR_TO_Y(addr >> 2);
-    posx =3D ADDR_TO_X(addr >> 2);
+    posy =3D ADDR_TO_Y(addr);
+    posx =3D ADDR_TO_X(addr);

-    if (posy > buf->height || posx > buf->width) {
+    if (posy >=3D buf->height || posx >=3D buf->width) {
         return 0;
     }

=2D-
2.31.1


