Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C6383CE7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:06:54 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiZp-0004vv-MW
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm7-00075x-2V
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:31 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihla-0004aE-V2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:30 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MVrXh-1lsv3z1RSv-00RsVI; Mon, 17
 May 2021 20:14:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 54/59] linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in
 do_syscall
Date: Mon, 17 May 2021 20:14:19 +0200
Message-Id: <20210517181424.8093-55-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U19fCq8n1yeaOx3WZmmu9QX6E03U6ewNYqTR3Rp6Qp7GW5Y8pKp
 3w6i3/T91Ytve8HKBEbpKVoRV5R5/fmGvllwEFTNXFLbfnFCzWbvy4UkBi2F7qaC/+E7bUv
 3qVOVLmhUDNi96xUVKUGbjDJ3zZE5XaymNDAUMnJOyMgGamYGYAsTi3rsy1T5Wxy/9p1Ghj
 ktvnWjLjxL/RWUwfR2b7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K7mfQV6am8Y=:KlNU0bs3MP/TJZ0cEZOWs4
 Mu/vf9fpFsm5IyW+DC2OSe8H4V08b/zWCCXiRLybtKsfsBEFjwFqLuAxN0nJsdHq1x5GG0Dk4
 tOa3A6CjljIajDAv4ekePJ/90BlRZNyfrdd9pQ8CWBID0BGvpcnsb/Pmo+hzI+ZIVvehDbqsF
 AWCxrMDo5yaa/yer8MiLjz7aCWJuY6gBEMX/VJT7YFElmDtt6EEq7WdkA445G2EB5fQ66L01I
 H+WcoGSKavBFHX2tZc7b4bHBZ2VYoGBNx8KctGFh0baHiMtVba2MIQwytWreW+gZfV9EUGAzx
 XgB2K2qxxyZMyEhbvsZscMhSYAzvHb50byKNgJefyNXpQ5vED8zA/ZwaWQXzIKzfRGUSqlNyz
 QXg3IhHEo8WPAM+n4HCjJdAdWcFbAO5B4jUqcOx6hT6O15fQWmHUUq0SLrTa8O45qYjedvfXD
 O15B7ZZesS0lWBYcDAL4avyyFIjAHDxz2J0ZnjS96aguNZdms59iISgkB5m4aCg8xJN8TnrCB
 EIarAhLha1KCJkhD4HlinI=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Do not access a field that may not be present.  This will
become an issue when sharing more code in the next patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210422230227.314751-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f282574a12c..7b139a9c3a55 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9038,7 +9038,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 act._sa_handler = old_act->_sa_handler;
                 target_siginitset(&act.sa_mask, old_act->sa_mask);
                 act.sa_flags = old_act->sa_flags;
+#ifdef TARGET_ARCH_HAS_SA_RESTORER
                 act.sa_restorer = old_act->sa_restorer;
+#endif
                 unlock_user_struct(old_act, arg2, 0);
                 pact = &act;
             } else {
@@ -9051,7 +9053,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 old_act->_sa_handler = oact._sa_handler;
                 old_act->sa_mask = oact.sa_mask.sig[0];
                 old_act->sa_flags = oact.sa_flags;
+#ifdef TARGET_ARCH_HAS_SA_RESTORER
                 old_act->sa_restorer = oact.sa_restorer;
+#endif
                 unlock_user_struct(old_act, arg3, 1);
             }
 #endif
-- 
2.31.1


