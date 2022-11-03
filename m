Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5800E6178E3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 09:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqVk7-000208-QL; Thu, 03 Nov 2022 04:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oqVjz-0001yt-Fa; Thu, 03 Nov 2022 04:38:25 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oqVjx-0002W8-Pj; Thu, 03 Nov 2022 04:38:23 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 2BB31DA0439;
 Thu,  3 Nov 2022 09:38:17 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 10CA14621B3; Thu,  3 Nov 2022 09:38:17 +0100 (CET)
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] Add missing include statement for global xml_builtin
Date: Thu,  3 Nov 2022 09:38:15 +0100
Message-Id: <20221103083815.464612-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This fixes some compiler warnings with compiler flag
-Wmissing-variable-declarations (tested with clang):

    aarch64_be-linux-user-gdbstub-xml.c:564:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]
    aarch64-linux-user-gdbstub-xml.c:564:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]
    aarch64-softmmu-gdbstub-xml.c:1763:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/feature_to_c.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/feature_to_c.sh b/scripts/feature_to_c.sh
index b1169899c1..c1f67c8f6a 100644
--- a/scripts/feature_to_c.sh
+++ b/scripts/feature_to_c.sh
@@ -56,6 +56,7 @@ for input; do
 done
 
 echo
+echo '#include "exec/gdbstub.h"'
 echo "const char *const xml_builtin[][2] = {"
 
 for input; do
-- 
2.30.2


