Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C841A43
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 04:09:27 +0200 (CEST)
Received: from localhost ([::1]:56312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hashb-0003Js-6m
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 22:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57440)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aik@ozlabs.ru>) id 1hasgE-0002Kw-U3
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 22:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1hasgD-0003ku-Vh
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 22:08:02 -0400
Received: from ozlabs.ru ([107.173.13.209]:50020)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1hasgD-0003jl-QQ; Tue, 11 Jun 2019 22:08:01 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 0F609AE80011;
 Tue, 11 Jun 2019 22:07:27 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2019 12:07:23 +1000
Message-Id: <20190612020723.96802-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 107.173.13.209
Subject: [Qemu-devel] [PATCH qemu REPOST] spapr/rtas: Force big endian
 compile for rtas
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment the rtas's Makefile uses generic QEMU rules which means
that when QEMU is compiled on a little endian system, the spapr-rtas.bin
is compiled as little endian too which is incorrect as it is always
executed in big endian mode.

This enforces -mbig by defining %.o:%.S rule as spapr-rtas.bin is
a standalone guest binary which should not depend on QEMU flags anyway.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 pc-bios/spapr-rtas/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/pc-bios/spapr-rtas/Makefile b/pc-bios/spapr-rtas/Makefile
index f26dd428b79e..4b9bb1230658 100644
--- a/pc-bios/spapr-rtas/Makefile
+++ b/pc-bios/spapr-rtas/Makefile
@@ -14,8 +14,11 @@ $(call set-vpath, $(SRC_PATH)/pc-bios/spapr-rtas)
 
 build-all: spapr-rtas.bin
 
+%.o: %.S
+	$(call quiet-command,$(CCAS) -mbig -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
+
 %.img: %.o
-	$(call quiet-command,$(CC) -nostdlib -o $@ $<,"Building","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) -nostdlib -mbig -o $@ $<,"Building","$(TARGET_DIR)$@")
 
 %.bin: %.img
 	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"Building","$(TARGET_DIR)$@")
-- 
2.17.1


