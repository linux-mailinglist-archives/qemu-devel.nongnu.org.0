Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1227E5FF076
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:40:11 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLr7-0000c4-Ol
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ncopa@alpinelinux.org>)
 id 1ojLmQ-0006fS-3A
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:35:20 -0400
Received: from mx1.tetrasec.net ([66.245.177.37]:39668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ncopa@alpinelinux.org>)
 id 1ojLmO-0001Q9-8L
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:35:17 -0400
Received: from mx1.tetrasec.net (mail.local [127.0.0.1])
 by mx1.tetrasec.net (Postfix) with ESMTP id D7B8CDE1AF;
 Fri, 14 Oct 2022 14:35:11 +0000 (UTC)
Received: from ncopa-desktop.lan (ti0056a400-4229.bb.online.no
 [85.167.239.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alpine@tanael.org)
 by mx1.tetrasec.net (Postfix) with ESMTPSA id 2EA1DDE1AE;
 Fri, 14 Oct 2022 14:35:10 +0000 (UTC)
From: Natanael Copa <ncopa@alpinelinux.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Natanael Copa <ncopa@alpinelinux.org>
Subject: [PATCH] edk2: fix TPM 2.0 regression
Date: Fri, 14 Oct 2022 16:35:01 +0200
Message-Id: <20221014143501.5458-1-ncopa@alpinelinux.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=66.245.177.37;
 envelope-from=ncopa@alpinelinux.org; helo=mx1.tetrasec.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a regression that was introduced with the edk2 202202 upgrade
(commit e2f3137c7344).

Upstream changed TPM_ENABLE to TPM1_ENABLE and TPM2_ENABLE. This led to
TPM 2.0 (which is needed for windows 11) silently got disabled.

Ref: https://github.com/tianocore/edk2/commit/4de8d61bcec02a13ceed84f92b0cf3ea58adf9c5
Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
---
I have not really been able to test this, due to issues with building
the OVMF_CODE.fd from the qemu source tree. I do have tested building
OVMF_CODE.fd for the Alpine Linux package, and adding -D TPM2_ENABLE dis
solve the issue in windows guests. So I believe it is fine.

I don't think an explicit -D TPM1_ENABLE is needed as I believe it is
the default.
https://github.com/tianocore/edk2/blob/8fc06b6e19e3df93cc989b4f85877d8a7783e5bf/OvmfPkg/OvmfTpmDefines.dsc.inc#L8

The -D TPM_CONFIG_ENABLE can probably be removed. It was not found
anywhere when grepping the sources.

 roms/Makefile.edk2 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
index 485f2244b1..eb47f008c6 100644
--- a/roms/Makefile.edk2
+++ b/roms/Makefile.edk2
@@ -101,7 +101,7 @@ submodules:
 		-D NETWORK_IP6_ENABLE \
 		-D NETWORK_HTTP_BOOT_ENABLE \
 		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
+		-D TPM2_ENABLE \
 		-D TPM_CONFIG_ENABLE
 	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
 
@@ -113,7 +113,7 @@ submodules:
 		-D NETWORK_IP6_ENABLE \
 		-D NETWORK_HTTP_BOOT_ENABLE \
 		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
+		-D TPM2_ENABLE \
 		-D TPM_CONFIG_ENABLE \
 		-D SECURE_BOOT_ENABLE \
 		-D SMM_REQUIRE
@@ -127,7 +127,7 @@ submodules:
 		-D NETWORK_IP6_ENABLE \
 		-D NETWORK_HTTP_BOOT_ENABLE \
 		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
+		-D TPM2_ENABLE \
 		-D TPM_CONFIG_ENABLE
 	cp edk2/Build/OvmfX64/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
 
@@ -140,7 +140,7 @@ submodules:
 		-D NETWORK_IP6_ENABLE \
 		-D NETWORK_HTTP_BOOT_ENABLE \
 		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
+		-D TPM2_ENABLE \
 		-D TPM_CONFIG_ENABLE \
 		-D SECURE_BOOT_ENABLE \
 		-D SMM_REQUIRE
-- 
2.38.0


