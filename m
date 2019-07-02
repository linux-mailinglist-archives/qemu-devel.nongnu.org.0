Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F515C920
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:12:25 +0200 (CEST)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiC1f-0006z5-Kb
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByd-0004iR-G6
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByb-0002nY-JW
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42631 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByZ-0002lL-7q; Tue, 02 Jul 2019 02:09:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMg1Vrpz9sNs; Tue,  2 Jul 2019 16:09:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047743;
 bh=sJWDo7X3+IYPIgQZSE6X3r0T9cLw7nuTLQqVaTBva9Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V8+HpDa2+W+fBNNR2I7uAqOsrQv/6QeZRDHcTAQUrXLIKao/u1elTCJRiePD7bv19
 mXmS1fpPovLVL5pvClReQtCN4IuepBbvNLTwxAQvzzD/qbri7iJqX0cxEtuW9kACa7
 mkD24zlyhCNDN8m8nnsYkCHoLI/3erzU6L5AO6Vg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:09 +1000
Message-Id: <20190702060857.3926-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 01/49] spapr/rtas: Force big endian compile for
 rtas
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
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

At the moment the rtas's Makefile uses generic QEMU rules which means
that when QEMU is compiled on a little endian system, the spapr-rtas.bin
is compiled as little endian too which is incorrect as it is always
executed in big endian mode.

This enforces -mbig by defining %.o:%.S rule as spapr-rtas.bin is
a standalone guest binary which should not depend on QEMU flags anyway.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-Id: <20190612020723.96802-1-aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 pc-bios/spapr-rtas/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/pc-bios/spapr-rtas/Makefile b/pc-bios/spapr-rtas/Makefile
index f26dd428b7..4b9bb12306 100644
--- a/pc-bios/spapr-rtas/Makefile
+++ b/pc-bios/spapr-rtas/Makefile
@@ -14,8 +14,11 @@ $(call set-vpath, $(SRC_PATH)/pc-bios/spapr-rtas)
=20
 build-all: spapr-rtas.bin
=20
+%.o: %.S
+	$(call quiet-command,$(CCAS) -mbig -c -o $@ $<,"CCAS","$(TARGET_DIR)$@"=
)
+
 %.img: %.o
-	$(call quiet-command,$(CC) -nostdlib -o $@ $<,"Building","$(TARGET_DIR)=
$@")
+	$(call quiet-command,$(CC) -nostdlib -mbig -o $@ $<,"Building","$(TARGE=
T_DIR)$@")
=20
 %.bin: %.img
 	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"Building","$(=
TARGET_DIR)$@")
--=20
2.21.0


