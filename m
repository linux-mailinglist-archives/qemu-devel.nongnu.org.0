Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A114619E9C8
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Apr 2020 09:51:44 +0200 (CEST)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jL04F-0005j0-N1
	for lists+qemu-devel@lfdr.de; Sun, 05 Apr 2020 03:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1jL02w-0004pR-DC
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 03:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1jL02u-0001G1-HQ
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 03:50:21 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:33420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jL02u-0001F4-Bz
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 03:50:20 -0400
Received: from fwd09.aul.t-online.de (fwd09.aul.t-online.de [172.20.27.151])
 by mailout05.t-online.de (Postfix) with SMTP id 1F46C4264B80;
 Sun,  5 Apr 2020 09:50:19 +0200 (CEST)
Received: from linpower.localnet
 (XdmDP8ZYrh-ZXOm3GMCCmNBLNZ+jZE7MUUfxOQmQjJ9IUXX3URLscVa8j-zdmtlZ8x@[93.236.147.242])
 by fwd09.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jL02s-0OvOrI0; Sun, 5 Apr 2020 09:50:18 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 8E211200463; Sun,  5 Apr 2020 09:50:17 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 1/3] dsoundaudio: fix never-ending playback loop
Date: Sun,  5 Apr 2020 09:50:15 +0200
Message-Id: <20200405075017.9901-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <f28b8915-d9df-8de3-7298-cc4c74f0a8d1@t-online.de>
References: <f28b8915-d9df-8de3-7298-cc4c74f0a8d1@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: XdmDP8ZYrh-ZXOm3GMCCmNBLNZ+jZE7MUUfxOQmQjJ9IUXX3URLscVa8j-zdmtlZ8x
X-TOI-MSGID: c9bea177-c07a-4908-8339-2b1841df00e8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.82
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the DirectSound backend fails to stop audio playback
in dsound_enable_out(). To detect a lost buffer condition
dsound_get_status_out() incorrectly uses the error code
DSERR_BUFFERLOST instead of flag DSBSTATUS_BUFFERLOST as a mask
and returns with an error. As a result dsound_enable_out()
returns early and doesn't stop playback.

To reproduce the bug start qemu on a Windows host with
-soundhw pcspk -audiodev dsound,id=3Daudio0. On the guest
FreeDOS 1.2 command line enter beep. The image Day 1 - F-Bird
from the QEMU Advent Calendar 2018 shows the bug as well.

Buglink: https://bugs.launchpad.net/qemu/+bug/1699628
Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/dsoundaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index bd57082a8d..9e621c8899 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -279,7 +279,7 @@ static int dsound_get_status_out (LPDIRECTSOUNDBUFFER=
 dsb, DWORD *statusp,
         return -1;
     }
=20
-    if (*statusp & DSERR_BUFFERLOST) {
+    if (*statusp & DSBSTATUS_BUFFERLOST) {
         dsound_restore_out(dsb, s);
         return -1;
     }
--=20
2.16.4


