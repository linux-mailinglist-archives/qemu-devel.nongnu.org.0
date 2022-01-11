Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0FA48B825
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:17:28 +0100 (CET)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NaB-0005II-Rp
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:17:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCc-00084U-OH
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:06 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:58773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCa-0008Hu-QO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:06 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M26j1-1n4uMJ2Yhd-002Vi3; Tue, 11
 Jan 2022 20:53:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] linux-user: Do not special-case NULL for PR_GET_PDEATHSIG
Date: Tue, 11 Jan 2022 20:52:44 +0100
Message-Id: <20220111195247.1737641-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SE4dYVY2AVKSKSTQZa96vrIh+nZKbCUxvESLmoSeiCoZoGG/CiJ
 sHi5Tb4afJ85hXQft0euyEf4NuI6WleagsYQ0REXyTcll6pecfpYMqI6K8/b7L3r3F/z+o+
 3nVkdO2NNORNalRFy2JzBqu7l0RisZkFyspejCvHabfkcSvworz4kb++XL86PAksz5mM5Vf
 hzLL5cZ41iDCc/MmAqCFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+lhDWaRqzDY=:UEnc7zTG8mdasdjUYyc7yi
 hvgdjsQoDUqe9iia0uuJWEVOGOshJiozrO78kc13h/+8QsgQJiTjD9lTqGM5+N+eOEPEOtt+2
 e2rsgxvPmy9v13JI+LMrMhD+cCvXvNYWwz65zjs507BOlOXrbyhIElUJqJHSNjnyI8/3qXlBo
 kI7wthynA3NZo+z9rFZBeLlMaDOZu1zxfgdc9a4mZ0Ua0kVpgr0GzAG9J4QRKkIIku7/u2xp6
 cPIljZEi2WoATnbO4GopA36wme6VKDpUZ8hafp2UAsxO/EEGdPJ/iuBSKNlOV+wjh8uIFNHBg
 7d/f7g9fP4CmT6CFqXnRnyvf/m7TsAImHCwEE1V/TNaiNQ1Gwv1KPpfawILD9efTyZTiP3GHq
 YkYKsm6jbQhz25u54VHUoJJ21xQQb0LfjGCH+mZ+c4nluSjAsAgI4+piWBNSbDVXdWPuZcwPt
 9MUiYQlpHmOaXLFF0LBYZgcxq24AvbqW/UMk5lF4XGBA9/bUP/HWgSvL0SIqqc5KinRMr0kA6
 vhWRielfV5kj/6Yw1wiMf8QmTwLjstSwLUrp21Oh3RxDk8SbbdxJeYdvY/AD4yJgCCSqeDlP3
 nQdR7YPf0HuSeVZHEZkKYA489a7iM+/mAoOBUEboCvs0XsZEH0rFMbte5DyGKBx/m4XxmV2yl
 cPZgqqb4a3pAm/wQTSb+v7GnxX6D3vSotHCgi0eTQh2r0k/4JrrpfKnhN0t89YKQNfkI=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The kernel does not special-case arg2 != NULL, so
neither should we.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220106225738.103012-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ca6e0b8fb0a1..eff107b8bcfd 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6444,7 +6444,7 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             int deathsig;
             ret = get_errno(prctl(PR_GET_PDEATHSIG, &deathsig,
                                   arg3, arg4, arg5));
-            if (!is_error(ret) && arg2 && put_user_s32(deathsig, arg2)) {
+            if (!is_error(ret) && put_user_s32(deathsig, arg2)) {
                 return -TARGET_EFAULT;
             }
             return ret;
-- 
2.33.1


