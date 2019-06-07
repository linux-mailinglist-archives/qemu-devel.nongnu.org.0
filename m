Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD1939255
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 18:39:34 +0200 (CEST)
Received: from localhost ([::1]:49472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZHtu-0005Ea-0V
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 12:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53309)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZGzf-0003Tv-QZ
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZGy6-0003SP-BD
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:39:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZGy6-0003Bm-3c
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:39:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 395EB81122;
 Fri,  7 Jun 2019 15:39:35 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF0426266B;
 Fri,  7 Jun 2019 15:39:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Date: Fri,  7 Jun 2019 17:37:21 +0200
Message-Id: <20190607153725.18055-26-philmd@redhat.com>
In-Reply-To: <20190607153725.18055-1-philmd@redhat.com>
References: <20190607153725.18055-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 07 Jun 2019 15:39:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v18 25/29] target/rx: Dump bytes for each insn
 during disassembly
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There are so many different forms of each RX instruction
that it will be very useful to be able to look at the bytes
to see on which path a bug may lie.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20190607091116.49044-24-ysato@users.sourceforge.jp>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/disas.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/rx/disas.c b/target/rx/disas.c
index 5a32a87534..d73b53db44 100644
--- a/target/rx/disas.c
+++ b/target/rx/disas.c
@@ -102,7 +102,21 @@ static int bdsp_s(DisasContext *ctx, int d)
 /* Include the auto-generated decoder.  */
 #include "decode.inc.c"
=20
-#define prt(...) (ctx->dis->fprintf_func)((ctx->dis->stream), __VA_ARGS_=
_)
+static void dump_bytes(DisasContext *ctx)
+{
+    int i, len =3D ctx->len;
+
+    for (i =3D 0; i < len; ++i) {
+        ctx->dis->fprintf_func(ctx->dis->stream, "%02x ", ctx->bytes[i])=
;
+    }
+    ctx->dis->fprintf_func(ctx->dis->stream, "%*c", (8 - i) * 3, '\t');
+}
+
+#define prt(...) \
+    do {                                                        \
+        dump_bytes(ctx);                                        \
+        ctx->dis->fprintf_func(ctx->dis->stream, __VA_ARGS__);  \
+    } while (0)
=20
 #define RX_MEMORY_BYTE 0
 #define RX_MEMORY_WORD 1
--=20
2.20.1


