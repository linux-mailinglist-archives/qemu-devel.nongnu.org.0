Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B11BD643
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 09:42:12 +0200 (CEST)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jThMB-0007tm-Kr
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 03:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTh27-0007uJ-Pd
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:22:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTh1j-0003zZ-05
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:21:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34005
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTh1h-0003uW-KD
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588144856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7bpX1iXJErQuyCFTBQ9FX3q8b7UtGzaD9CWLu+A9OI=;
 b=L0qOlvY9K1Qg52INXkYpab4P2I5pOTNfh/vGeby96fCIsRev9JvKsEeARnEWI39bzKE3aS
 J3nyPx3RENiv/MqgabAW+qqRjnOck/sXlqOB9wVHCgvwJsUWC0iAMcilp2JU/BiYKyR4rV
 VkPrYreciCYzAvLjcAXHBJrKUULUfUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-cQx5e_4rOpOVt9j_fDD6zA-1; Wed, 29 Apr 2020 03:20:54 -0400
X-MC-Unique: cQx5e_4rOpOVt9j_fDD6zA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B0E21895A2C
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 07:20:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 697BB5D9F3;
 Wed, 29 Apr 2020 07:20:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1CBE311358CB; Wed, 29 Apr 2020 09:20:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/32] cpus: Proper range-checking for -icount shift=N
Date: Wed, 29 Apr 2020 09:20:30 +0200
Message-Id: <20200429072048.29963-15-armbru@redhat.com>
In-Reply-To: <20200429072048.29963-1-armbru@redhat.com>
References: <20200429072048.29963-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:18:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

timers_state.icount_time_shift must be in [0,63] to avoid undefined
behavior when shifting by it, e.g. in cpu_icount_to_ns().
icount_adjust() clamps it to [0,MAX_ICOUNT_SHIFT], with
MAX_ICOUNT_SHIFT =3D 10.  configure_icount() doesn't.  Fix that.

Fixes: a8bfac37085c3372366d722f131a7e18d664ee4d
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200422130719.28225-5-armbru@redhat.com>
---
 cpus.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/cpus.c b/cpus.c
index 1b542b37f9..5670c96bcf 100644
--- a/cpus.c
+++ b/cpus.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/config-file.h"
+#include "qemu/cutils.h"
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
 #include "qapi/error.h"
@@ -801,7 +802,6 @@ void configure_icount(QemuOpts *opts, Error **errp)
     bool sleep =3D qemu_opt_get_bool(opts, "sleep", true);
     bool align =3D qemu_opt_get_bool(opts, "align", false);
     long time_shift =3D -1;
-    char *rem_str =3D NULL;
=20
     if (!option && qemu_opt_get(opts, "align")) {
         error_setg(errp, "Please specify shift option when using align");
@@ -814,9 +814,8 @@ void configure_icount(QemuOpts *opts, Error **errp)
     }
=20
     if (strcmp(option, "auto") !=3D 0) {
-        errno =3D 0;
-        time_shift =3D strtol(option, &rem_str, 0);
-        if (errno !=3D 0 || *rem_str !=3D '\0' || !strlen(option)) {
+        if (qemu_strtol(option, NULL, 0, &time_shift) < 0
+            || time_shift < 0 || time_shift > MAX_ICOUNT_SHIFT) {
             error_setg(errp, "icount: Invalid shift value");
             return;
         }
--=20
2.21.1


