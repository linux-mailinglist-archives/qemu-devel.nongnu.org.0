Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C436B67040
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 15:40:50 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlvn7-00089q-Nb
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 09:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57594)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvmU-0005lT-OX
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:40:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvmT-0006lJ-R5
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:40:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvmR-0006jA-MQ; Fri, 12 Jul 2019 09:40:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 051EFC057F2F;
 Fri, 12 Jul 2019 13:40:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87E7019C58;
 Fri, 12 Jul 2019 13:39:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:26 +0200
Message-Id: <20190712133928.21394-6-philmd@redhat.com>
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
References: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 12 Jul 2019 13:40:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1? 5/7] vl: Use qemu_strtoi() instead of
 strtol()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we'll move this code around, fix this checkpatch warning
first:

  ERROR: consider using qemu_strtol in preference to strtol

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 vl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/vl.c b/vl.c
index 96de4f74b9..c7f4d01c99 100644
--- a/vl.c
+++ b/vl.c
@@ -978,8 +978,7 @@ static struct bt_device_s *bt_device_add(const char *=
opt)
     pstrcpy(devname, MIN(sizeof(devname), len), opt);
=20
     if (endp) {
-        vlan_id =3D strtol(endp + 6, &endp, 0);
-        if (*endp) {
+        if (qemu_strtoi(endp + 6, (const char **)&endp, 0, &vlan_id) < 0=
) {
             error_report("unrecognised bluetooth vlan Id");
             return 0;
         }
@@ -1019,8 +1018,7 @@ static int bt_parse(const char *opt)
         if (!*endp || *endp =3D=3D ',') {
             if (*endp) {
                 if (strstart(endp, ",vlan=3D", &p)) {
-                    vlan =3D strtol(p, (char **) &endp, 0);
-                    if (*endp) {
+                    if (qemu_strtoi(p, &endp, 0, &vlan) < 0) {
                         error_report("bad scatternet '%s'", p);
                         return 1;
                     }
--=20
2.20.1


