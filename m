Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B56133B41
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 06:37:07 +0100 (CET)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip41i-0004os-6a
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 00:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oZ-0003qv-M1
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oY-0002gS-JW
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:31 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58611 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ip3oY-0002dJ-8H; Wed, 08 Jan 2020 00:23:30 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47syMB2mtgz9sRp; Wed,  8 Jan 2020 16:23:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578460998;
 bh=iU2bRyLYZIPuyrd3WQb8N58JS77BRz/E1w5KXyLxf3Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ea/zlJERrEbJJjRZjkcBuKWQ9hIOmHNiTBt7N9QHTrrGZmArsnhFOt+Gi6uXV7zvG
 pXx+UA/4gQG3YOGKEerfuTdcLYCzKd7KEJY7mtzzePwwRvK7o7bQTPRaiom1tEUK/b
 ELcZmolZ8q09/ElRgGMNVfuy01anwqYiF4cYLlPA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 10/26] ppc440_bamboo.c: remove label from
 bamboo_load_device_tree()
Date: Wed,  8 Jan 2020 16:22:56 +1100
Message-Id: <20200108052312.238710-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108052312.238710-1-david@gibson.dropbear.id.au>
References: <20200108052312.238710-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

'out' label can be replaced by 'return -1' in all cases.

CC: David Gibson <david@gibson.dropbear.id.au>
CC: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200106182425.20312-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc440_bamboo.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 4d95c0f8a8..b782641b23 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -71,12 +71,12 @@ static int bamboo_load_device_tree(hwaddr addr,
=20
     filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, BINARY_DEVICE_TREE_=
FILE);
     if (!filename) {
-        goto out;
+        return -1;
     }
     fdt =3D load_device_tree(filename, &fdt_size);
     g_free(filename);
     if (fdt =3D=3D NULL) {
-        goto out;
+        return -1;
     }
=20
     /* Manipulate device tree in memory. */
@@ -117,10 +117,6 @@ static int bamboo_load_device_tree(hwaddr addr,
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
     g_free(fdt);
     return 0;
-
-out:
-
-    return ret;
 }
=20
 /* Create reset TLB entries for BookE, spanning the 32bit addr space.  *=
/
--=20
2.24.1


