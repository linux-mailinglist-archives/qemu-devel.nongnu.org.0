Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A6141BE7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 08:01:52 +0200 (CEST)
Received: from localhost ([::1]:56868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hawKV-000651-5L
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 02:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58513)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8n-0004Xr-Ce
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8l-000740-Qq
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:45 -0400
Received: from ozlabs.org ([203.11.71.1]:53911)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1haw8l-000721-Du; Wed, 12 Jun 2019 01:49:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45NwtR5PZlz9sNk; Wed, 12 Jun 2019 15:49:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560318575;
 bh=7/ss7KjQXSPnRKSlVh6aYkEwnLkYZP9whziMKOPd0nE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fk9fuRRoj7HfKsoEwuDDSd+NTxOyRR0cw1QYoeHd+zb96FxKas0OPUXggBbwQ5wWy
 dqQRL1xvI9Xba/JZVSHJJRRLpuwisonCDlqBNE5u0oaxzfMNGQMuYeFWMw/63JBSHS
 f8KZgDxwbKh2fW2ki2Ddtybv+iBddYjFHSHGLplg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 12 Jun 2019 15:49:28 +1000
Message-Id: <20190612054929.21136-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612054929.21136-1-david@gibson.dropbear.id.au>
References: <20190612054929.21136-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 12/13] ppc/pnv: activate the "dumpdtb" option on
 the powernv machine
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

This is a good way to debug the DT creation for current PowerNV
machines and new ones to come.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190606174732.13051-1-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 046f0a83c8..ed68924667 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -23,6 +23,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
 #include "sysemu/cpus.h"
+#include "sysemu/device_tree.h"
 #include "hw/hw.h"
 #include "target/ppc/cpu.h"
 #include "qemu/log.h"
@@ -554,6 +555,7 @@ static void pnv_reset(void)
     /* Pack resulting tree */
     _FDT((fdt_pack(fdt)));
=20
+    qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
     cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
 }
=20
--=20
2.21.0


