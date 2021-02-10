Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC08B315F5A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:23:58 +0100 (CET)
Received: from localhost ([::1]:52568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iur-00084i-QV
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip5-0001ZM-25; Wed, 10 Feb 2021 01:17:59 -0500
Received: from ozlabs.org ([203.11.71.1]:58921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip3-0000M7-9g; Wed, 10 Feb 2021 01:17:58 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gm0pysz9sW4; Wed, 10 Feb 2021 17:17:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937860;
 bh=yoV3QidJsvB1AUcOtwCr1rj1XQPDTazNLqoASW1P0Jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jf1A1u8qQ/Mavv7iDdJEHU2bfnGA3cMGPfYDRr+GFfryYLt4XlK/FZScy3ry0YvO/
 c60h9kJ6/lf0bSYLYf5NkHFAb4e4rfenwZXvTmqA97NHc2uKg35H1HesqxVnfMlynI
 3pvtKCBCPSzaeBqXrld/CuzSIW2NvtjgKHJDbaII=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/19] ppc/pnv: Use skiboot addresses to load kernel and ramfs
Date: Wed, 10 Feb 2021 17:17:23 +1100
Message-Id: <20210210061735.304384-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The current settings are useful to load large kernels (with debug) but
it moves the initrd image in a memory region not protected by
skiboot. If skiboot is compiled with DEBUG=1, memory poisoning will
corrupt the initrd.

Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210126171059.307867-4-clg@kaod.org>
Reviewed-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 14fc9758a9..e500c2e243 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -65,9 +65,9 @@
 #define FW_MAX_SIZE             (16 * MiB)
 
 #define KERNEL_LOAD_ADDR        0x20000000
-#define KERNEL_MAX_SIZE         (256 * MiB)
-#define INITRD_LOAD_ADDR        0x60000000
-#define INITRD_MAX_SIZE         (256 * MiB)
+#define KERNEL_MAX_SIZE         (128 * MiB)
+#define INITRD_LOAD_ADDR        0x28000000
+#define INITRD_MAX_SIZE         (128 * MiB)
 
 static const char *pnv_chip_core_typename(const PnvChip *o)
 {
-- 
2.29.2


