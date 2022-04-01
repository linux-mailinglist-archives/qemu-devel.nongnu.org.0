Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF754EEF55
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:25:57 +0200 (CEST)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIDr-0008WM-Pl
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:25:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coypu@sdf.org>) id 1naFDh-00031Q-T8
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:13:33 -0400
Received: from mx.sdf.org ([205.166.94.24]:52885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coypu@sdf.org>) id 1naFDg-0000xH-C9
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:13:33 -0400
Received: from sdf.org (IDENT:coypu@sdf.org [205.166.94.16])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 231BD9JB020337
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO)
 for <qemu-devel@nongnu.org>; Fri, 1 Apr 2022 11:13:10 GMT
Received: (from coypu@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id 231BD9g7017724
 for qemu-devel@nongnu.org; Fri, 1 Apr 2022 11:13:09 GMT
Date: Fri, 1 Apr 2022 11:13:09 +0000
From: Maya Rashish <coypu@sdf.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] bsd-user: correct notion of return value
Message-ID: <YkbeRTGfQFgfSyfw@SDF.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.166.94.24; envelope-from=coypu@sdf.org;
 helo=mx.sdf.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 01 Apr 2022 10:17:06 -0400
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

Fix EFAULT at startup.

Signed-off-by: Maya Rashish <coypu@sdf.org>
---
 bsd-user/netbsd/target_os_stack.h  | 2 +-
 bsd-user/openbsd/target_os_stack.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/netbsd/target_os_stack.h b/bsd-user/netbsd/target_os_stack.h
index 503279c1a9..f3cfbe8626 100644
--- a/bsd-user/netbsd/target_os_stack.h
+++ b/bsd-user/netbsd/target_os_stack.h
@@ -40,7 +40,7 @@ static inline int setup_initial_stack(struct bsd_binprm *bprm, abi_ulong *p,
     for (i = 0; i < MAX_ARG_PAGES; i++) {
         if (bprm->page[i]) {
             info->rss++;
-            if (!memcpy_to_target(stack_base, bprm->page[i],
+            if (memcpy_to_target(stack_base, bprm->page[i],
                         TARGET_PAGE_SIZE)) {
                 errno = EFAULT;
                 return -1;
diff --git a/bsd-user/openbsd/target_os_stack.h b/bsd-user/openbsd/target_os_stack.h
index 4b37955d3b..3f799ef5d1 100644
--- a/bsd-user/openbsd/target_os_stack.h
+++ b/bsd-user/openbsd/target_os_stack.h
@@ -40,7 +40,7 @@ static inline int setup_initial_stack(struct bsd_binprm *bprm, abi_ulong *p,
     for (i = 0; i < MAX_ARG_PAGES; i++) {
         if (bprm->page[i]) {
             info->rss++;
-            if (!memcpy_to_target(stack_base, bprm->page[i],
+            if (memcpy_to_target(stack_base, bprm->page[i],
                         TARGET_PAGE_SIZE)) {
                 errno = EFAULT;
                 return -1;
-- 
2.35.1


