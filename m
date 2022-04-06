Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1E04F5433
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 06:51:52 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbxe3-0000ji-8D
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 00:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1nbxcc-0008IU-82; Wed, 06 Apr 2022 00:50:22 -0400
Received: from ozlabs.ru ([107.174.27.60]:45434)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1nbxcZ-0007Gd-3g; Wed, 06 Apr 2022 00:50:21 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 20FC2804AA;
 Wed,  6 Apr 2022 00:50:14 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Subject: [PATCH qemu] ppc/vof: Fix uninitialized string tracing
Date: Wed,  6 Apr 2022 14:50:13 +1000
Message-Id: <20220406045013.3610172-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are error paths which do not initialize propname but the trace_exit
label prints it anyway. This initializes the problem string.

Spotted by Coverity CID 1487241.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/vof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 2b63a6287561..5ce3ca32c998 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -294,7 +294,7 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
                             uint32_t nodeph, uint32_t pname,
                             uint32_t valaddr, uint32_t vallen)
 {
-    char propname[OF_PROPNAME_LEN_MAX + 1];
+    char propname[OF_PROPNAME_LEN_MAX + 1] = "";
     uint32_t ret = PROM_ERROR;
     int offset, rc;
     char trval[64] = "";
-- 
2.30.2


