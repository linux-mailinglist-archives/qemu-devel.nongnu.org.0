Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F1D5EC5A8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:14:11 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBLe-0003OY-Gv
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od9wU-0004Kn-1Y
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:44:06 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od9wQ-0006QB-0E
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:44:05 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MzCMN-1pP3ts33zP-00wFdj; Tue, 27
 Sep 2022 14:43:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 2/2] linux-user: don't use AT_EXECFD in do_openat()
Date: Tue, 27 Sep 2022 14:43:57 +0200
Message-Id: <20220927124357.688536-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927124357.688536-1-laurent@vivier.eu>
References: <20220927124357.688536-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PNxGPKGIJBqHIhgMPLI72G5i76Y9f2wD+0c8VquFP/Zqt/i4FrN
 YpZ9JEh9BZ5bjN7twLseewj8GLlDWXt7DepSpsXrpgypDwaIkmoazCkC1Yh1rZrfG5gitsk
 f83n8vNKBXoQ+HTaYYHfDsZeht5mW2s75rvq162pBgbEuXuu36MNf6cH2NXHIHMIC6TjYVX
 TzkQIht7nKyBxoqrPkVog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NX32nDuxFts=:vgU5AZ8E3QHi+VKwWWRo4G
 0RyvYvojiOIDstg0btAIs6T5EpZVcrCJLaJAXdRn+HcguvwiBxlqmfaGFgXplH0SQXx9sB3Sa
 WzELHgVTvhemGqQXmUQ7mN44tBkIE/gN9xD925v22TpatnkeGIcFa8m5rdc0lw37jIqA2BTei
 8CIDd19IDoVwsydWNAUt0I9tD9lQ6uvTCnDQQxApSrfSGHQ+rL2kU4ozgKFCKSzXHgRGDihNU
 WaSiHjP0K8IPCGUTdpLdQamWtwXAmF/BmGyOoh3T3ofiUXFrJOoFXex74/JGqkAGRxumx5lLn
 ubz0V1o5a7aaJXuqn3VSK5+n2Yv3uph3+yxhlDEUAUV4lu9mLr9utoEsStAZdu57eFP4Sgdw4
 1/Ues7UlRely4rSaJmLfFv9YRl8kwC47EIyqy0CWBwdAwNJNsPf5XLeKvk0JOMy3R3HF08dL2
 ZigxrZvgeZPE3E+Hutk6ir7tO/IBuNzrXoEL6tC4N12zkCTrUsJc/X7EamO+MfloVuhm84LVc
 ncZW0wuqWDf3ltwyGMuOoxh12V6o0BL/SzMS1oW4Sl6fql6WAnIxmChaXqQVJb9IJpa9kOrAL
 9qMxMikhu1x/IDPiC2aTJ6jVj6pQ1PUXB9ylybF63YF7OepDG0rXJU543ONRaZoivi/oMiOQn
 VrW79NwlU/046VczJdPrF63gJZ+jr2K4RzYmNaJcd6fF3jjnjG3v0zhQGueKMkIUSxu3b38yX
 aJaAhVUIFBSv8ftS9cLkZLpBqfo4gcewwH0eB2Emd1te+EWuXM5doxS6AkEnsHc00TXSdmz7Y
 1vsMCSt
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AT_EXECFD gives access to the binary file even if
it is not readable (only executable).

Moreover it can be opened with flags and mode that are not the ones
provided by do_openat() caller.

And it is not available because loader_exec() has closed it.

To avoid that, use only safe_openat() with the exec_path.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ddf09d7eb61a..0c80e9d68e28 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8263,8 +8263,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     };
 
     if (is_proc_myself(pathname, "exe")) {
-        int execfd = qemu_getauxval(AT_EXECFD);
-        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
+        return safe_openat(dirfd, exec_path, flags, mode);
     }
 
     for (fake_open = fakes; fake_open->filename; fake_open++) {
-- 
2.37.3


