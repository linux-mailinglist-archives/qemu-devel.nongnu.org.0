Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BB7166E0D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:48:00 +0100 (CET)
Received: from localhost ([::1]:51862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4zIE-0002QT-Ec
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z88-0002Vl-Hg
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z86-0000HL-Am
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:32 -0500
Received: from ozlabs.org ([203.11.71.1]:59453)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z85-0008Pj-Uk; Thu, 20 Feb 2020 22:37:30 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwL0xJ0z9sSx; Fri, 21 Feb 2020 14:37:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256226;
 bh=Wp+k5nVHvdO925ifSYOaM86yY3mKvDBuJKP7l44HrBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XkGr2n1geUz2ar+oKYnbMSD3Si3DWimZQgI+vQfmmys0z5d3i0a+E908Oyg+AVtQV
 hDy4TNkJ1uKelS23bnUL3wK9PbvDuGMyk1EDXSSUf74l1WElcKJiAtn35p5p4kJh1b
 fQhHs1Wa0gHf7gBeZEEI8LE60gOO01P/Ikxmozp0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 20/20] hw/ppc/virtex_ml507:fix leak of fdevice tree blob
Date: Fri, 21 Feb 2020 14:36:50 +1100
Message-Id: <20200221033650.444386-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
 qemu-ppc@nongnu.org, clg@kaod.org, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

The device tree blob returned by load_device_tree is malloced.
We should free it after cpu_physical_memory_write().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Message-Id: <20200218091154.21696-3-kuhn.chenqun@huawei.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/virtex_ml507.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 91dd00ee91..4eef70069f 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -188,6 +188,7 @@ static int xilinx_load_device_tree(hwaddr addr,
     if (r < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     cpu_physical_memory_write(addr, fdt, fdt_size);
+    g_free(fdt);
     return fdt_size;
 }
=20
--=20
2.24.1


