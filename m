Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DF8F125
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 18:46:49 +0200 (CEST)
Received: from localhost ([::1]:44392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyIth-0005TY-UP
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 12:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyIir-0001WX-ED
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyIin-0002FV-F4
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58802)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyIin-0002F5-AC
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 12:35:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E186302C07A;
 Thu, 15 Aug 2019 16:35:28 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-19.ams2.redhat.com
 [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 889353737;
 Thu, 15 Aug 2019 16:35:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Aug 2019 17:34:38 +0100
Message-Id: <20190815163504.18937-8-dgilbert@redhat.com>
In-Reply-To: <20190815163504.18937-1-dgilbert@redhat.com>
References: <20190815163504.18937-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 15 Aug 2019 16:35:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/33] migration/postcopy: reduce one operation
 to calculate fixup_start_addr
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
Cc: quintela@redhat.com, yury-kotov@yandex-team.ru,
 richardw.yang@linux.intel.com, marcandre.lureau@redhat.com,
 ivanren@tencent.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

Use the same way for run_end to calculate run_start, which saves one
operation.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190710050814.31344-2-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 4bb5e24459..da399f2c8a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2973,10 +2973,12 @@ static void postcopy_chunk_hostpages_pass(Migrati=
onState *ms, bool unsent_pass,
         host_offset =3D run_start % host_ratio;
         if (host_offset) {
             do_fixup =3D true;
-            run_start -=3D host_offset;
-            fixup_start_addr =3D run_start;
-            /* For the next pass */
-            run_start =3D run_start + host_ratio;
+            fixup_start_addr =3D run_start - host_offset;
+            /*
+             * This host page has gone, the next loop iteration starts
+             * from after the fixup
+             */
+            run_start =3D fixup_start_addr + host_ratio;
         } else {
             /* Find the end of this run */
             unsigned long run_end;
--=20
2.21.0


