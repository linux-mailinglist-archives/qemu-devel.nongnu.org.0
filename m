Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2393CC96E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 15:59:21 +0200 (CEST)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m57KC-0001CJ-Pp
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 09:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1m578X-0004D2-MA
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 09:47:17 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65364
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1m578V-0007fx-IA
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 09:47:17 -0400
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id 6EE012FF0934; Sun, 18 Jul 2021 15:47:11 +0200 (CEST)
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] Only check CONFIG_NVMM when NEED_CPU_H is defined
Date: Sun, 18 Jul 2021 15:46:49 +0200
Message-Id: <20210718134650.1191-2-reinoud@NetBSD.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210718134650.1191-1-reinoud@NetBSD.org>
References: <20210718134650.1191-1-reinoud@NetBSD.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Reinoud Zandijk <Reinoud@NetBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Userland targers will otherwise use a poisoned CONFIG_NVMM

Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
---
 include/sysemu/nvmm.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
index 6d216599b0..833670fccb 100644
--- a/include/sysemu/nvmm.h
+++ b/include/sysemu/nvmm.h
@@ -10,8 +10,7 @@
 #ifndef QEMU_NVMM_H
 #define QEMU_NVMM_H
 
-#include "config-host.h"
-#include "qemu-common.h"
+#ifdef NEED_CPU_H
 
 #ifdef CONFIG_NVMM
 
@@ -23,4 +22,6 @@ int nvmm_enabled(void);
 
 #endif /* CONFIG_NVMM */
 
-#endif /* CONFIG_NVMM */
+#endif /* NEED_CPU_H */
+
+#endif /* QEMU_NVMM_H */
-- 
2.31.1


