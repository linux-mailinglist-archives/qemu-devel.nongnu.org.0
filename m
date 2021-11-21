Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9822645846F
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 16:18:18 +0100 (CET)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moobh-0002ki-7f
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 10:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mooal-00025q-R7
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 10:17:19 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:59903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mooak-0001ac-9f
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 10:17:19 -0500
Received: from quad ([82.142.2.234]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYNaE-1nAAup1Z3q-00VTjH; Sun, 21
 Nov 2021 16:17:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: fix Coverity CID 1464101
Date: Sun, 21 Nov 2021 16:17:11 +0100
Message-Id: <20211121151711.331653-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tMpAsGQXfr/0LOuNJVUnFMG1LpmIw6tAkEqEBe8UF9aLcaKf35I
 5JMRe/44MnBWRDiBc7RQu/a+KaYc3j7Ic48YZWXWdezOKMqgsiJvxOCl+y8XkwFiNVrENZT
 GwxW3rP0Ov4/EN+OeSqbrAnOi2irE4ujRuKjzgUsJ+Cii6VyMmedW9FI/SB8JpQk/jv7Dm8
 5A79x804Pj1jwpEF5Cs8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:29tO9I/cmn0=:zoTcJrIASMJ+A1PWsQPh/T
 4Zz0YcCQKoJbzK6AFFZxFX1XisDGKsTn18WzUQxDRSQqnv/4FAhL07lzfOTm6qHJ+zhN7fe5w
 8G66WMFW034BSg94BBo7/BtjjLUZk5qsKKgWjkMIW+8kthD9MkOvatQRjic54gaG+KulN+Ufb
 /FYaywNwULcgZR3PF/buZCLp+ssxNGMU8gTyH+c0lEJ2z268xfBFQd9v5G10eqa3HVu7vURhT
 1WiNg14tNnCsKZgjYzwIaVVPYIAD3gWxc9KlsWSOYGUYmaBZLpC7s0QKTnUMyt6DNjruRUHbZ
 jqgsGMK/ludUOfUhGpmeHQLpqWefW6oxkx/96bvLWtPpXHuYtbZ/C23FHCDfqNjQM89whmJPL
 QRF69x8J3uGYYltZhMsSFBmvO2vt18wNfj/ltiEk3SL2DKAbPu1NkkyKWE6O1BHtR3FK0m692
 icLRpKbfe9TfTdCGIqKkvBSC+q4p9D8YquM2edMpeBttXDhbW97A+wSaaITn3kWJHUThan2Oj
 YS+fKKT6VD+tOtIC5nwmVQDQyZ49NB4FaY/o+UlgWqYNw8glS5Cn8tPxkN7UezbHxGx1AYPkM
 H4c3RggDjHi1gJklh8oVJ3/ZrGd1hcPswJBjpI1haN6q6lGcdsRndF3zNZmoO7rDeJ666HNSo
 F57FvlukQNPMxJkDh9n80S1jJm5viLhbkgCXGNeUM+QzG6azcpQnJZVgX9+fj8YIY5Po=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_mmap() can fail and return -1, but we don't check for that and
instead assume it's always valid.

Fixes: db2af69d6ba8 ("linux-user: Add infrastructure for a signal trampoline page")
Cc: richard.henderson@linaro.org
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5da8c02d0822..767f54c76dc5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3254,9 +3254,13 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
      * Otherwise, allocate a private page to hold them.
      */
     if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
-        abi_ulong tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
-                                           PROT_READ | PROT_WRITE,
-                                           MAP_PRIVATE | MAP_ANON, -1, 0);
+        abi_long tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
+                                          PROT_READ | PROT_WRITE,
+                                          MAP_PRIVATE | MAP_ANON, -1, 0);
+        if (tramp_page == -1) {
+            return -errno;
+        }
+
         setup_sigtramp(tramp_page);
         target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
     }
-- 
2.31.1


