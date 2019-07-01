Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA86142F4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 01:03:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNQA8-0002E1-DZ
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 19:03:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNQ8j-0001ol-2M
	for qemu-devel@nongnu.org; Sun, 05 May 2019 19:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNQ8i-0002SA-4C
	for qemu-devel@nongnu.org; Sun, 05 May 2019 19:01:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hNQ8h-0002Rw-VH; Sun, 05 May 2019 19:01:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3ACAE46233;
	Sun,  5 May 2019 23:01:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C564660851;
	Sun,  5 May 2019 23:01:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 May 2019 01:01:40 +0200
Message-Id: <20190505230140.5661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 05 May 2019 23:01:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/sd/sdcard: Use the available enums
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already define SDCardModes/SDCardStates as enums. Declare
the mode/state as enums too, this make gdb debugging sessions
friendlier: instead of numbers, the mode/state name is displayed.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/sd/sd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index aaab15f3868..a66b3d5b45e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -96,8 +96,8 @@ struct SDState {
     BlockBackend *blk;
     bool spi;
=20
-    uint32_t mode;    /* current card mode, one of SDCardModes */
-    int32_t state;    /* current card state, one of SDCardStates */
+    enum SDCardModes mode;
+    enum SDCardStates state;
     uint32_t vhs;
     bool wp_switch;
     unsigned long *wp_groups;
@@ -1640,7 +1640,7 @@ static int cmd_valid_while_locked(SDState *sd, SDRe=
quest *req)
=20
 int sd_do_command(SDState *sd, SDRequest *req,
                   uint8_t *response) {
-    int last_state;
+    enum SDCardStates last_state;
     sd_rsp_type_t rtype;
     int rsplen;
=20
--=20
2.20.1


