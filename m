Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2955FB99
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:17:45 +0200 (CEST)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TpQ-0002Ct-Li
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6ThD-0000k8-Gz; Wed, 29 Jun 2022 05:09:21 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:43615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th9-0003Yw-8P; Wed, 29 Jun 2022 05:09:15 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mv2gw-1np5KX3Fdg-00r4Nr; Wed, 29
 Jun 2022 11:08:53 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Guo Zhi <qtxuning1999@sjtu.edu.cn>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 01/11] vga: avoid crash if no default vga card
Date: Wed, 29 Jun 2022 11:08:39 +0200
Message-Id: <20220629090849.1350227-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:azTnpUKTZfo4xzjCQoghh7P2LUaXo1R+Utkh9IhCQAvJVcjI/sd
 89U70f/fVIbzaPzJ7QcDbmbTwCaFh/kHvCd0pCB3UgJlhw7b/1eDLRyDO+o1SPsCx2XEZUF
 D6G0dA0OPYXa3QKDhsYtgQCFVoq7hBnDqaAvbExf0JDAnKBaEJsAL5WJc465UczQddaCtCB
 86wU0i5ELAIZ8j183tY1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XPf0SWDxnOc=:5aA9rwzkfdrdY1HuQyMl/G
 DSS6GETAWTOfZndAfcpUprC7Ub5J4av0RRhV3s+pL4gaL8hODFaDweCc0dI0BO4cPj7QqELUt
 cspkgpQhboW/2ZyqMeNigZuxVNTkFiR6xr0JivNkckqMnAcyMDuq+IVWKdDdJe3FqDLJdJFoY
 FSssOV1VPaNzBwX2Av+Hjjc10LdKntBd2JhP4ew7EFNCh8Sy87F+YOvlCEbjsOrR1iC5ONOqV
 xTsFQNkyTai4iTsOwGs0aVC2TbQG/8U/t3vMcORCT8qL7FFgktqwRTNt7stAIE+NwW7Hh/pRj
 wotLyRY2SKrir60Hii0uyfxaza+3KBA6YkENZhec4tJsWDJKQlQlSJeJ6P5S6ShwgTTIUGv15
 dHhRSGDLx6o6hDcN3zZdG0Oor7jO7sJnQhgj4f6bFCmaeo4nfUdPb3sTbYu2agWWWI1mRb03K
 ygvVZFmm3onVBtRCMWMnvdvAFBbzGbqTUQHJ2niiLRES9+78bFnCECHCa6nxL+IdJvZS+Y/c7
 afn/mEJAmYYzJBahnuXaaqkTEiYgCX6n4syEJlIzTihHI+Pw11uTl0z/YiOYLighsGJP43LiU
 lzI5hoCb9JS2f8QQZ1Chibvz1Bc0qg7U03GqpNwuqcmpUHC5CcXHStCYNV6JE3PZViCttBvDI
 MedruOYSfNV18IoTnGWQ5TbgiB3zqDbFbLnQCZ7xytzzvtgObOFe6+IK0lU7zQ0BFGPmRynof
 hVX9shMRLZEoda9zQxbATMI1i3SOoUqLyM4wmw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Guo Zhi <qtxuning1999@sjtu.edu.cn>

QEMU in some arch will crash when executing -vga help command, because
there is no default vga model.  Add check to this case and avoid crash.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/978

Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220503091724.970009-1-qtxuning1999@sjtu.edu.cn>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 softmmu/vl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b24772841db3..3f264d4b0930 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -981,7 +981,8 @@ static void select_vgahw(const MachineClass *machine_class, const char *p)
 
             if (vga_interface_available(t) && ti->opt_name) {
                 printf("%-20s %s%s\n", ti->opt_name, ti->name ?: "",
-                       g_str_equal(ti->opt_name, def) ? " (default)" : "");
+                        (def && g_str_equal(ti->opt_name, def)) ?
+                        " (default)" : "");
             }
         }
         exit(0);
-- 
2.36.1


