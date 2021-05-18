Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A07387146
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:33:18 +0200 (CEST)
Received: from localhost ([::1]:43636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisM1-0001IH-Ka
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKS-0006gI-5c
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:40 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKQ-0006sP-Et
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:39 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mo7if-1l6ok03Z9P-00pZyc; Tue, 18
 May 2021 07:31:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/59] linux-user: Add strace support for printing arguments of
 llseek
Date: Tue, 18 May 2021 07:30:39 +0200
Message-Id: <20210518053131.87212-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EuJDEBF+kdnzFWYJGjKs3sUc/+x7nNLwHSGaRsn5RFvaETp2xRM
 MSbFWcvOSxHzvt8kyMaTarv2+LYYqk1VjbVq3YjiEwE7rWKqOK6Nr15dstDwJyiqUbnLG+D
 /CeghepaZEjCj+1Gpq59MtR+imu4nC5G6Gi672Kk90Oujt3d3Y4KYkNmtd9LfxzvOeDjutu
 okWv2gaS9f6F78il+wvVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KmLstp49MEw=:q6SnvdeoaT49IfHXyy0mF+
 lgqaD8VJVDJs4Et5svBskrrlVW+FQ0vCXvy5H5AY/qN1MB/kTkbF9RjtLSk6xnLhX++hOh7Rn
 GPmZX+PNPLkKbQRVaMmShxkqVdQLZdor3FgvicVoKuY3HNqnjLkWHTPazTxwFzw7KpbtD8bkn
 oeV159Wh92mNKaeKyM9hvP+C6zWIzDL8cz8iwhS+gfVKpAQzGoriNZt1yGXTWVM3xl6HflCuJ
 zCl88ev7Qjou4X1JL4Z9vxSy8sMAWv3u12Ej8OAknB8gttUlojUgnpRTBW3avUyK/0IUfDTZo
 1MOW2Yvc9ATM35MoLFdswY1CvqPU0BMbCXm+zsOw3muqg7QMhreFR9x+qgk/au9VQDpUR1jRX
 s83VwsQv8aemmA2nxu/kwqzv3WtMjsFr22yv+NVydJJ+TSwDR1hURMF9eLCEIz3q5K5lxZy/N
 w0+4Wh+8pYX++5DMbMIxA8GWIS+foUMdHPN6rO5wLR56uKaWW3eqny8cadkyqNq9iOfMRmZ1g
 cwqCGpXfhfExn8exS3wh+k=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kito Cheng <kito.cheng@sifive.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Some target are using llseek instead of _llseek like riscv,
nios2, hexagon, and openrisc.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210512101358.122781-1-kito.cheng@sifive.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 3 ++-
 linux-user/strace.list | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 1cadb6d50f2d..cce0a5d1e351 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2341,7 +2341,7 @@ print_linkat(void *cpu_env, const struct syscallname *name,
 }
 #endif
 
-#ifdef TARGET_NR__llseek
+#if defined(TARGET_NR__llseek) || defined(TARGET_NR_llseek)
 static void
 print__llseek(void *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
@@ -2361,6 +2361,7 @@ print__llseek(void *cpu_env, const struct syscallname *name,
     qemu_log("%s", whence);
     print_syscall_epilogue(name);
 }
+#define print_llseek print__llseek
 #endif
 
 #ifdef TARGET_NR_lseek
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3b7c15578ca4..18f72172754f 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -511,6 +511,9 @@
 #ifdef TARGET_NR__llseek
 { TARGET_NR__llseek, "_llseek" , NULL, print__llseek, NULL },
 #endif
+#ifdef TARGET_NR_llseek
+{ TARGET_NR_llseek, "llseek" , NULL, print_llseek, NULL },
+#endif
 #ifdef TARGET_NR_lock
 { TARGET_NR_lock, "lock" , NULL, NULL, NULL },
 #endif
-- 
2.31.1


