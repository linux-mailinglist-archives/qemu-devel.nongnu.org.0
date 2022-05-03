Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B3451812A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:38:37 +0200 (CEST)
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlozM-0005Yo-88
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1nlome-0001NE-18
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:25:28 -0400
Received: from smtp233.sjtu.edu.cn ([202.120.2.233]:33718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1nlomb-0001ve-SW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:25:27 -0400
Received: from proxy02.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
 by smtp233.sjtu.edu.cn (Postfix) with ESMTPS id BC7D11008CBC9;
 Tue,  3 May 2022 17:17:36 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by proxy02.sjtu.edu.cn (Postfix) with ESMTP id A22BE200A5342;
 Tue,  3 May 2022 17:17:36 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy02.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy02.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HxqArLbnzGgU; Tue,  3 May 2022 17:17:36 +0800 (CST)
Received: from guozhi-ipads.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: qtxuning1999@sjtu.edu.cn)
 by proxy02.sjtu.edu.cn (Postfix) with ESMTPSA id D5FA4200A5340;
 Tue,  3 May 2022 17:17:30 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Guo Zhi <qtxuning1999@sjtu.edu.cn>,
	qemu-devel@nongnu.org
Subject: [PATCH v1] vga: avoid crash if no default vga card
Date: Tue,  3 May 2022 17:17:24 +0800
Message-Id: <20220503091724.970009-1-qtxuning1999@sjtu.edu.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.120.2.233;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp233.sjtu.edu.cn
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

QEMU in some arch will crash when executing -vga help command, because
there is no default vga model.  Add check to this case and avoid crash.

Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
---
 softmmu/vl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index c2919579fd..a49e29312b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -977,7 +977,8 @@ static void select_vgahw(const MachineClass *machine_class, const char *p)
 
             if (vga_interface_available(t) && ti->opt_name) {
                 printf("%-20s %s%s\n", ti->opt_name, ti->name ?: "",
-                       g_str_equal(ti->opt_name, def) ? " (default)" : "");
+                        (def && g_str_equal(ti->opt_name, def)) ?
+                        " (default)" : "");
             }
         }
         exit(0);
-- 
2.35.1


