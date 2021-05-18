Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C63871BA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:20:27 +0200 (CEST)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lit5e-0002qi-IK
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKt-0007uv-91
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:07 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:56653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007AZ-3M
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:06 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7xml-1lM8hK3Rq7-0155bB; Tue, 18
 May 2021 07:31:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 48/59] linux-user: Add copy_file_range to strace.list
Date: Tue, 18 May 2021 07:31:20 +0200
Message-Id: <20210518053131.87212-49-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dvB6PcrcN6ilYV8bgAKDbF7MKE1+GOPfVuAEQTJ9/JHsDkL7sK6
 s27uS3psFhl56FT0iG58gnaeobkmEFn4aGC1G4IX5bT0zn6VUja4jxRPrleJyzMOkicdBXN
 P6djyhMg2BFP+dtZVO8ntJuXhQua885Th1Cx5IHX9THbjbH67Ipy73HPc+/b56XdVeJVkO2
 xTAtvTxwoIKt7DIRdTgDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/PzF3qIWHQM=:ZR5yHz/zLf2grza3Cd0x+k
 iXvw8CySCQ0Jvzt12RarEeqfnNPn12Y9hEYbS2KRWT+ILyQUIw5GezVusgHLL5n0iktWq96BG
 jHxwQ8uD08hxyiIWyTNhckT67CKM18FVo9fhXniQxrZCha029BTYF2nfUPiQPGMddpldq0iPL
 l7M1jO06QRZ+KHV/td+Y8xR1OeGRoUgxJ3BpYIraw0DBjai08tdM1IQzwy6XtKsf641g92unT
 bxv//cv1U7jmZliYty4P6OCY2FGqoMPL0cc2fal3ifXbN4chVg+g/VtZd4OcnVtKZ/+fTdCbZ
 8PVPuTnG6vv+eJbo291ImBacVVwuDGhoFEJR5dOn+9MiF95fwLB+Y4lQOHomUZ14C89+N7zlo
 Xti+F52B2/QFMGVRpYhIAa57jRIialrrP0v2Twp4RJWlx94m8Z+cDL0BuAqvYoTyRQoMcgjv1
 6yQAuZy42yaiU0OgK8CB/Uk1JJvkwtPj66qafn3dq3pCRpJe+xfIT+qOiin/P1Bn+pXs/H3S4
 kJDoxcWH+6kE/zpfMvt7Uc=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210503174159.54302-2-thatlemon@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 18f72172754f..278596acd131 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1668,3 +1668,6 @@
 #ifdef TARGET_NR_statx
 { TARGET_NR_statx, "statx", NULL, print_statx, NULL },
 #endif
+#ifdef TARGET_NR_copy_file_range
+{ TARGET_NR_copy_file_range, "copy_file_range", "%s(%d,%p,%d,%p,"TARGET_ABI_FMT_lu",%u)", NULL, NULL },
+#endif
-- 
2.31.1


