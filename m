Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5784E06C5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 16:51:39 +0200 (CEST)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMvVa-00008U-A7
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 10:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clement.deschamps@greensocs.com>) id 1iMuiI-0002QL-6L
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 10:00:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clement.deschamps@greensocs.com>) id 1iMuiD-000863-5U
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 10:00:41 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clement.deschamps@greensocs.com>)
 id 1iMuiC-00084f-NB
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 10:00:37 -0400
Received: from chartreuse.bar.greensocs.com (chartreuse.bar.greensocs.com
 [172.16.11.101])
 by beetle.greensocs.com (Postfix) with ESMTPS id 2904796EF0;
 Tue, 22 Oct 2019 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1571752834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8Bl/dB3yMrRzO7X9RsKzoXAfsUARn6t6e6UlCVQ7t14=;
 b=V5dYW4SAn03KFo1L27WE+y9WZe+Rvh72kuxxmSu5+ixdv7s9MkoUt36SptWJYi0s+c1Ln5
 rT/71FEgFf0DTa4SKlMqWln3u5Ko2E4MaxTSB4Odrmp5f1yV7eXuslcQfbrtBgz0TpBUXg
 HeCtfo+ui5439RUAtEiAiynX6tOvgMo=
From: Clement Deschamps <clement.deschamps@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] translate-all: fix uninitialized tb->orig_tb
Date: Tue, 22 Oct 2019 16:00:16 +0200
Message-Id: <20191022140016.918371-1-clement.deschamps@greensocs.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1571752834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8Bl/dB3yMrRzO7X9RsKzoXAfsUARn6t6e6UlCVQ7t14=;
 b=mrtd/F3rGt93d53AqBZUJ7NRXsKlLFtot96c7qWZO4QO4vwlPzmL4Z/vdyYRWai4lWZdFD
 QPP8pa8LcPrtlgi1itz2vcXs+C5+V+14VbxQGO9ghON4gYSaYkI4xV+UoFTbevLqS9TvKb
 es2lvymtIElcyBEZWMLOuHcT4+aad6I=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1571752834; a=rsa-sha256; cv=none;
 b=fE9QGONsOEOtC1qV+XxeKg5k/MBypzrG8AnEzRK3U9Z8Wtq0aLKT1+dvM93gvzJYxOTME2
 z5h62ZFoHiXVOS6MOKqXh7vT/bkL5s5BPbRoD5Fce3+cJs9p/tc9EhnYqlZxmlpV9zwwZq
 g+6B8kqRPfZpcr/FjmCGzIfST8o9EI0=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Clement Deschamps <clement.deschamps@greensocs.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a segmentation fault in icount mode when executing from an IO =
region.

TB is marked as CF_NOCACHE but tb->orig_tb is not initialized (equals
previous value in code_gen_buffer).

The issue happens in cpu_io_recompile() when it tries to invalidate orig_=
tb.

Signed-off-by: Clement Deschamps <clement.deschamps@greensocs.com>
---
 accel/tcg/translate-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 66d4bc4341..f9b7ba159d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1722,6 +1722,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->cs_base =3D cs_base;
     tb->flags =3D flags;
     tb->cflags =3D cflags;
+    tb->orig_tb =3D NULL;
     tb->trace_vcpu_dstate =3D *cpu->trace_dstate;
     tcg_ctx->tb_cflags =3D cflags;
  tb_overflow:
--=20
2.23.0


