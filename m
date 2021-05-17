Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925D383C36
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:28:09 +0200 (CEST)
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihyK-0000nw-7Y
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlN-0005wD-I4
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:45 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:40091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihl9-0004Ky-Gk
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:45 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mnq4Q-1l6Zfb1m02-00pNhd; Mon, 17
 May 2021 20:14:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/59] linux-user: Add strace support for printing arguments of
 llseek
Date: Mon, 17 May 2021 20:13:32 +0200
Message-Id: <20210517181424.8093-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bWJF/UaE+EKpucOF6B6qrXU8SDKzvB5K01bSlpLTiMMdI0EEyUY
 jp30lb9znsSQEQQHze0nEFdVKcvWccWhZlqr0u4YC5PI/eKTo289ugfqg6Nr9eIdyAYRzqh
 oImbxnmf8aTxupkLRzMPhxJ4OYzsdRuOiWDqR70XrsOQ87bhyjNBdBj/qlSHbpSeHNk3+JW
 xRD9dCGOI3RsIC49HIziQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M1WB59yjotA=:vuBSvAPrzQUEEKw7HRKN6S
 g3AMuzZdwpuUZ8ameyXGwfsVirMw+7A6WXQGhzeJ5xUge5EEmUzKDUAJ6qJrRg5LhOeFDCUVT
 asxSsfVd2RXLl5W2lsTgcgPKJSm/Y4d7NOVcQ8qEC93tbfyhj0uZB2rOjdw7a3/7HC/kMzWkR
 nedIQDED7f9JwincsE9avQ7FCiuP3Uk5Fx87H3254vXgeiZCDFRKkepb4RSu/7W2tSmjUPCU9
 Lmzo+PMp89u66CSJzoJaFXYvhwNSD5CKxK6VVfDkD+oh37Gci3gJ2Wj9KBRhvf7lSyq/cwsaG
 Hr11tvOxWsg4kxrPkgdjDkawBYbviOEyJTqP16IVw/B6DlL6MfYbEKyHCBgc9vGJFc+SIaPF2
 YnucyGVcrIK0cXQcaYIp6MZXxNajs83cpo38gsfBvU7CiHOMc+Cv0gCnKhaErUZ52mx+5Ypfk
 sDJ0DXAiy7KtbIdbdw3IuwjSIfWxyhCwzu+HY2auykoOZku7+AuodyPS7oNKIUbJqldBxdR8X
 5tWLrD2D2trxCV+vLF90/U=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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


