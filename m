Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD793871DA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:23:59 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lit93-0007nY-Nc
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisL0-0008MT-7X
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:14 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKy-0007IR-Dd
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:13 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MSqbe-1luPBW3iWM-00UMGO; Tue, 18
 May 2021 07:32:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 54/59] linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in
 do_syscall
Date: Tue, 18 May 2021 07:31:26 +0200
Message-Id: <20210518053131.87212-55-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nvqSL6gxEHAc+nguF+PfS0UyMO/WP0J0GgvwFFU6/1X814G5vvX
 vfFSiIMzqnnYxCu1qqu1H/bZhrqg6+aR8XX/9aaHwr6upFrLGIxK5v3i9p+G0bidwQA+RVL
 TGDOjIBWlLhxZQ8TchkOELpw7J6FUg6+8HzIdkwCxAv6RS0fqvDwkEEUuOtwHMmHST8+MhX
 eIWwtbeCGfOvhsu/3NKDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u6PTpLtkKKE=:qMCVVDO0CYR0WP9BLrYYXR
 Yr3ARthjuKeIvgInu8dFryAL7O674wyvP9J0VnxQGdIRGuC+ffjigtSgtdfLl/5bvw84OelCH
 Py1at2lIildOdSfZMJBF/8TQufF7Pa0fFbolK1Vowr2OmoYdYXeuPatlVlqu3GK5SgP6D9CmA
 6ZrKQiLPeMEvqHaWSuhTBBio+nuwpDOXp/4FfkdARAec0Sv4QOB99L8ckx94utL6TEVQ+O+gz
 2EjePoqc2zbCC0Ainw2YclplLwFG+hNhHMCl+fTA2pcqDFh+kYKdbCuAyorgz65wZaVC3tV3p
 S2ACR+WxZCtZLZWby9R/93erisdrSVESm614I1kfQCs7DmKW6UgG4qMJhXqdk8tZwG/rQGkL1
 M1/bcarlVNCQHSetPEpShgxIyV/Hc0Iy5S47dxScOs01sd90Se3d39OwyC7EU9u7Ci9ZIiDOy
 u8n9xALw6M4ASfQq3yTsyAMQEZss7hFSvvAgNgyzMvI+CECgbDmJFVnOZ85EMFmKXer6U2jD4
 22qV5Jpcbw0CLfh70Yq1PM=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
index 15b3af257bef..a2e18b06c6d0 100644
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


