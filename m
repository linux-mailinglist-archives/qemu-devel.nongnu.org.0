Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB74A31AD
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 20:49:53 +0100 (CET)
Received: from localhost ([::1]:55470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDtjN-000452-0v
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 14:49:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nDthy-0002h2-Nv; Sat, 29 Jan 2022 14:48:26 -0500
Received: from depni-mx.sinp.msu.ru ([213.131.7.21]:49606)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nDthx-0002PA-8q; Sat, 29 Jan 2022 14:48:26 -0500
Received: from spider (unknown [176.195.59.180])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 594131BF471;
 Sat, 29 Jan 2022 22:48:39 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user/syscall: Translate TARGET_RLIMIT_RTTIME
References: <87y236lpwb.fsf@depni.sinp.msu.ru>
 <4e110850-a303-d0a4-158b-6186367aa739@vivier.eu>
 <87ilu2l473.fsf@depni.sinp.msu.ru>
 <87ee4ql3yk.fsf_-_@depni.sinp.msu.ru>
Date: Sat, 29 Jan 2022 22:48:23 +0300
In-Reply-To: <87ee4ql3yk.fsf_-_@depni.sinp.msu.ru> (Serge Belyshev's message
 of "Sat, 29 Jan 2022 22:46:59 +0300")
Message-ID: <87a6fel3w8.fsf_-_@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: none client-ip=213.131.7.21;
 envelope-from=belyshev@depni.sinp.msu.ru; helo=depni-mx.sinp.msu.ru
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
---
 linux-user/generic/target_resource.h | 1 +
 linux-user/syscall.c                 | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
index f04c93b125..539d8c4677 100644
--- a/linux-user/generic/target_resource.h
+++ b/linux-user/generic/target_resource.h
@@ -33,5 +33,6 @@ struct target_rlimit64 {
 #define TARGET_RLIMIT_MSGQUEUE          12
 #define TARGET_RLIMIT_NICE              13
 #define TARGET_RLIMIT_RTPRIO            14
+#define TARGET_RLIMIT_RTTIME            15
 
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5950222a77..6d41a741ac 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1083,6 +1083,8 @@ static inline int target_to_host_resource(int code)
         return RLIMIT_RSS;
     case TARGET_RLIMIT_RTPRIO:
         return RLIMIT_RTPRIO;
+    case TARGET_RLIMIT_RTTIME:
+        return RLIMIT_RTTIME;
     case TARGET_RLIMIT_SIGPENDING:
         return RLIMIT_SIGPENDING;
     case TARGET_RLIMIT_STACK:
-- 
2.34.1


