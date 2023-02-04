Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B568AB14
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5t-0005E8-FA; Sat, 04 Feb 2023 11:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5m-00054v-9A
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:42 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5j-0006uI-Ov
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:42 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MpUpW-1oqAXp1W5E-00puS1; Sat, 04
 Feb 2023 17:08:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 06/22] linux-user: Add missing MAP_HUGETLB and MAP_STACK flags
 in strace
Date: Sat,  4 Feb 2023 17:08:14 +0100
Message-Id: <20230204160830.193093-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XiaAp+TTEsJR9aSqgLqynKu2dBnzmWzQwc4qFGC/nLCsy9a+2V6
 0t0+VR2VK3oxpWfQP42i4S3BWEp0Mz4OT/GzwdB507oe98fxBzYN+IZuOA9qiJaudih/AgR
 ZHCJE9BjGPxQqOrHUBb67Oo7NLNnGLk70bymVpnClZFwb5+5I/8wfqdE3XL3+Gbj8YGm5TC
 7cI8+i38BkWj2oiXSc5fw==
UI-OutboundReport: notjunk:1;M01:P0:/O4a5IIlNAQ=;Soutl/AAgfUISe0A0IxFGf+EaBb
 Hd5hUKVsQXo4HpxaQsHQu1q0DuzPVaflEdhfBpW4271TlDV8lPLAY+YxOppxXG/1YkNlNRYJO
 /MPZlomzTTxIHWGO+deL6YB9yYAyHaWKXVDmP63Qb1lvyvRbxLnbUrJ9F7DG2x+dgb6eXR32B
 Fv/xo/f6IZnhqPUXb/vpQiS3Ekk6QkzYcMse6Cn2VDROKG9NA6ZGpXtnXVqAoPrwsX4RZbYgI
 JXzSIYTSuU+6cykPf17dcPfaPX8r+qKqgRISPNjyqM9Tqt/5OKmZvRb8C7vIePHMt/CZTvQkJ
 Xkr4evSMhCO0LLeUWfvZxueqUNQM3W8UqMvb3VpLn+W4jV8cd9nLXLXmxJDlzMa9CEfFZq02g
 FtGDQavQb9/hcM1zgF2rNqMMz+WJHA2clA2p6jU6YcOkXmMddAI9pOSizYcYAm+3L3nRe4oJB
 yhyHgCVpk0uBL+jTRYbdPp96Pnr6i4HQcJEJBmjJDqnYA5007kYF9Jo0PULTlL5HmlEEHm28Q
 2HvBiglEMnetwjiqmvHKKC0tK3DmtM4qYn3yyn4RDGsQ32NXcr+Y3G41qQhLnnYatY3iEM8dE
 RyR5vPDWeF1Qa+7dpUHFlN6MJbPML7E5LEIDOTYegvIkTS0wn+1rg9tXshm0PHonrxpi8PGRd
 B/2J+yoef/twxZgVoEyk2TflQwVdlQFagYSMIIkgAA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

Add two missing mmap flags.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Message-Id: <Y5iiED4PpnGAHpyz@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7bccb4f0c067..5027289bdde4 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1057,6 +1057,8 @@ UNUSED static const struct flags mmap_flags[] = {
 #ifdef TARGET_MAP_UNINITIALIZED
     FLAG_TARGET(MAP_UNINITIALIZED),
 #endif
+    FLAG_TARGET(MAP_HUGETLB),
+    FLAG_TARGET(MAP_STACK),
     FLAG_END,
 };
 
-- 
2.39.1


