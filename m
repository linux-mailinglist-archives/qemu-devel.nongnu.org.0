Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01A92791
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 16:52:00 +0200 (CEST)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzj0p-0000yj-MH
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hziyX-0006jn-VK
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 10:49:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hziyW-0001a2-Fs
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 10:49:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49846)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hziyW-0001Yz-97; Mon, 19 Aug 2019 10:49:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E6B6E190C034;
 Mon, 19 Aug 2019 14:49:34 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C35A01C0;
 Mon, 19 Aug 2019 14:49:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 16:49:26 +0200
Message-Id: <20190819144926.5297-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 19 Aug 2019 14:49:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/ppc/spapr: Use the proper include that
 defines 'target_ulong'
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
 qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As its name implies, the Option/Architecture Vector is not target
(per cpu) specific but arch-related.
Use the proper arch-related header, allowing to use this header
with non cpu-specific objects.

This fixes this error when using this header with $common-obj:

  include/hw/ppc/spapr_ovec.h:76:44: error: unknown type name =E2=80=98ta=
rget_ulong=E2=80=99; did you mean =E2=80=98gulong=E2=80=99?
     SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, =
int vector);
                                                ^~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/ppc/spapr_ovec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
index 7891e9caac..b6b8811998 100644
--- a/include/hw/ppc/spapr_ovec.h
+++ b/include/hw/ppc/spapr_ovec.h
@@ -37,7 +37,7 @@
 #ifndef SPAPR_OVEC_H
 #define SPAPR_OVEC_H
=20
-#include "cpu.h"
+#include "exec/cpu-defs.h"
=20
 typedef struct SpaprOptionVector SpaprOptionVector;
=20
--=20
2.20.1


