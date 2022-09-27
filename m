Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5085EC5B8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:16:05 +0200 (CEST)
Received: from localhost ([::1]:36184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBNU-0005b2-WA
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od9wW-0004Me-1U
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:44:12 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od9wR-0006RN-Uq
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:44:06 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MJFpj-1owctg1ciJ-00Khxz; Tue, 27
 Sep 2022 14:43:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 1/2] linux-user: handle /proc/self/exe with execve() syscall
Date: Tue, 27 Sep 2022 14:43:56 +0200
Message-Id: <20220927124357.688536-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927124357.688536-1-laurent@vivier.eu>
References: <20220927124357.688536-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eFbn0zVyxAhSR5Uws4BGEMF9gVCpWmgK0GTzbtOYXzZUAsZMmMb
 xbP268Th4VL+FApqPhi3diqhFQwyGJywCQFoYFzK06G/eMeprxkEZYmwKjNqtvV4U9tQy4t
 1zfHTgAU7+7E/I8lbpyiWafW4R4R0ODsRt2ZjTiyagX5AYFQQPMT/mu5qrztNz9ojlMK0qA
 pCkEzl3InHBfXxrp4wIgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wnBcP7SiOSg=:4cVDZ6Djd2hMvdu7eTWJjc
 RlC78fJimWaBz0e/f29c7viTuyHQeopEpWBfju3A8AGIsyhbdPKX3C4Wtp7jhETIzwdSqtZIa
 YTTBwEsBJ0n1rCHA2zscd30YHpUkaeLbTEPvSAMz0+im4onTnsUkOtPe5ddWa2l4goPM3VTJv
 PgGNqZ6M53MgCLW0Do4tc41vhX2TgtxWq+ZwbHRscVwxp/GkMsY0bkxduTBg418xQYnwc2qxt
 c/alI1IdSNODcPM4B5TcdsRfDI44Ekds8a6593GdukKoEpekhS8bfv8/WA3n6S0w4EaB3zQf8
 +/s/CxsWV/2utxFPpY0LE0ZSG2l3a74Yjz0jgHhGbxkloaiLUc1FSWM5ZaoB0N9jQcHhfYfzr
 JFY8zRvDDfW4ybLxLH2UT6iXefjPIa1g45X2NrrfuSgKrB4YbIWTGsp2Nj5Bzzv9m1G75DfhP
 MqTD2vTwVTmt8zTNvfSzKh1pVLwz3FwgE6R5m6VmDoYTQ2jgO+Wdt2NgGj+SBbe2g/KWgkvss
 sSys3/gwzm2HYq8pSLMTbbSVAuujpO2VvzgaT4QpfTtw+zUaVc5KkG28o58Lygc6p2OZcGPML
 +tiHDoEQrkhwXWt3bac2iXgCLEuXKpIlTs0wvLeOYEOarl2Vrg+McpA998wxoIcIRKl4MzF39
 I647kP0u0B235EAjpOJyVJe+nZTogzfZzQvX7dundwQLR+wbEG8O44qukJVcyZSQFFEuI+vbl
 5q81zqF8TOaxfeXahM7jY13jrVSr0/BYjwrTFoEjmSCLD6JNCDETVHPwQ3gB2IZd8esSkTBXw
 CRizizf
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

If path is /proc/self/exe, use the executable path
provided by exec_path.

Don't use execfd as it is closed by loader_exec() and otherwise
will survive to the exec() syscall and be usable child process.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f4091212027c..ddf09d7eb61a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8843,7 +8843,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
              * before the execve completes and makes it the other
              * program's problem.
              */
-            ret = get_errno(safe_execve(p, argp, envp));
+            if (is_proc_myself(p, "exe")) {
+                ret = get_errno(safe_execve(exec_path, argp, envp));
+            } else {
+                ret = get_errno(safe_execve(p, argp, envp));
+            }
             unlock_user(p, arg1, 0);
 
             goto execve_end;
-- 
2.37.3


