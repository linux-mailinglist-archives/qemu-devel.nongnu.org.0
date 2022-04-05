Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451474F396F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:47:45 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbkT9-0001tK-S9
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1nbjZs-0004q5-UW
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:50:37 -0400
Received: from smtp180.sjtu.edu.cn ([202.120.2.180]:42920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1nbjZq-0005sU-DX
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:50:36 -0400
Received: from proxy02.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id 87AC21008CBC1
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 21:50:23 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by proxy02.sjtu.edu.cn (Postfix) with ESMTP id 57631200BC2CF;
 Tue,  5 Apr 2022 21:50:23 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy02.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy02.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8zMdpYm6o_T4; Tue,  5 Apr 2022 21:50:23 +0800 (CST)
Received: from guozhi-ipads.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: qtxuning1999@sjtu.edu.cn)
 by proxy02.sjtu.edu.cn (Postfix) with ESMTPSA id D288E200BC2AF;
 Tue,  5 Apr 2022 21:50:20 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: 
Subject: [PATCH v1] configure: judge build dir permission
Date: Tue,  5 Apr 2022 21:48:20 +0800
Message-Id: <20220405134819.3644952-1-qtxuning1999@sjtu.edu.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.120.2.180;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp180.sjtu.edu.cn
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 05 Apr 2022 10:36:02 -0400
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
Cc: Guo Zhi <qtxuning1999@sjtu.edu.cn>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If this patch is applied, issue:

https://gitlab.com/qemu-project/qemu/-/issues/321

can be closed.

Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
---
 configure | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 7c08c18358..9cfa78efd2 100755
--- a/configure
+++ b/configure
@@ -24,7 +24,13 @@ then
     then
         if test -f $MARKER
         then
-           rm -rf build
+            if test -w $MARKER
+            then
+                rm -rf build
+            else
+                echo "ERROR: ./build dir already exists and can not be removed due to permission"
+                exit 1
+            fi
         else
             echo "ERROR: ./build dir already exists and was not previously created by configure"
             exit 1
-- 
2.35.1


