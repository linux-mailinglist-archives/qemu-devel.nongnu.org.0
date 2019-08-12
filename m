Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD50896B9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 07:25:09 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx2pQ-0001mz-Kk
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 01:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57113)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hx2oT-0008WM-57
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hx2oR-00065j-Un
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hx2oR-00064y-Oz
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D54B8DA5B
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 05:24:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68DBC1001947;
 Mon, 12 Aug 2019 05:24:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0B1011384AA; Mon, 12 Aug 2019 07:23:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 07:23:36 +0200
Message-Id: <20190812052359.30071-7-armbru@redhat.com>
In-Reply-To: <20190812052359.30071-1-armbru@redhat.com>
References: <20190812052359.30071-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 12 Aug 2019 05:24:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 06/29] trace: Eliminate use of TARGET_FMT_plx
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hw/tpm/trace-events uses TARGET_FMT_plx formats with uint64_t
arguments.  That's wrong, TARGET_FMT_plx takes hwaddr.  Since hwaddr
happens to be uint64_t, it works anyway.  Messed up in commit
ec427498da5, v2.12.0.  Clean up by replacing TARGET_FMT_plx with its
macro expansion.

scripts/tracetool/format/log_stap.py (commit 62dd1048c0b, v4.0.0) has
a special case for TARGET_FMT_plx.  Delete it.

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/tpm/trace-events                  | 4 ++--
 scripts/tracetool/format/log_stap.py | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
index 0b94aa1526..89804bcd64 100644
--- a/hw/tpm/trace-events
+++ b/hw/tpm/trace-events
@@ -1,8 +1,8 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
 # tpm_crb.c
-tpm_crb_mmio_read(uint64_t addr, unsigned size, uint32_t val) "CRB read =
0x" TARGET_FMT_plx " len:%u val: 0x%" PRIx32
-tpm_crb_mmio_write(uint64_t addr, unsigned size, uint32_t val) "CRB writ=
e 0x" TARGET_FMT_plx " len:%u val: 0x%" PRIx32
+tpm_crb_mmio_read(uint64_t addr, unsigned size, uint32_t val) "CRB read =
0x%016" PRIx64 " len:%u val: 0x%" PRIx32
+tpm_crb_mmio_write(uint64_t addr, unsigned size, uint32_t val) "CRB writ=
e 0x%016" PRIx64 " len:%u val: 0x%" PRIx32
=20
 # tpm_passthrough.c
 tpm_passthrough_handle_request(void *cmd) "processing command %p"
diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/for=
mat/log_stap.py
index 3ccbc09d61..9ab0cf2cce 100644
--- a/scripts/tracetool/format/log_stap.py
+++ b/scripts/tracetool/format/log_stap.py
@@ -30,9 +30,6 @@ def c_macro_to_format(macro):
     if macro.startswith("PRI"):
         return macro[3]
=20
-    if macro =3D=3D "TARGET_FMT_plx":
-        return "%016x"
-
     raise Exception("Unhandled macro '%s'" % macro)
=20
 def c_fmt_to_stap(fmt):
--=20
2.21.0


