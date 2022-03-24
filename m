Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70D94E6047
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:24:50 +0100 (CET)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIm0-0000EW-CD
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:24:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhm-0005wJ-4A
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:26 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhk-0003OF-Ao
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:25 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mxlmw-1oHAUs2r8g-00zHFM; Thu, 24
 Mar 2022 09:20:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] linux-user/alpha: Fix sigsuspend for big-endian hosts
Date: Thu, 24 Mar 2022 09:20:08 +0100
Message-Id: <20220324082016.3463521-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:43bgUBuOuPLymVy2drw/4Xgq5LQTluwPpkoFEOmKPZ2duv5PnCW
 ZpWiF3dZW8gLgJTbVsHNNtYh8Naq93PJBY73MxKhwVI41r3fb6rWYNU+ok1rCE2CkGD8Fj+
 TozOzgVhC63z8EA6iNQT6RpT3+lsmPsI3vP4Brup6pxdJBEj0qf8Y+lVtMt3vcwZLfaVviT
 CE+a5hG+0nyJLxAmkvcgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h7SI9Mo7S84=:P6PGxjkOyd+M02QKJv7UCP
 etm+Kj0tZ074dvtbpTeo0WKtxdZvkw0P1gVuTglaTnoD2+i1kcNWTq2OZub/nNG2DpFWG/C2c
 GeTsHIrmYeWN9Fz0jlb2cfLJfQYD/dQwx2dgSsy/yZMZL6VlLdjAYn9H5vDttiKGqq8gYsxhx
 smQxIm+uXgBT/VS4nW6o+Xj8GZZaYYkoDB1PcxAS0C46aO2ByXjARnjd34BbTA18TsP2aQ7e2
 S7lWEFi6Qdol/YbT2AcdCAi0jBjUIewU7tJDYS0+F+EHYPU2Ro/x/wh2gjLszsuTUn9e/JqFW
 Z5Ibr5lO/vUPjdAtwmDQTaHiwUI6/vfBhuqjZafHJ3Mz7ULNXckGIP4b/s2ovwh9snbzHjvAL
 ahwy6cQARp81HRA0jcz4LRMaFeZ/TOL8HmsI+TRfJ0qTjECO9wR/gu8/siEzMv3YZyBZWEjEs
 2ERDoSE4yglRGaf/4yWOuLFVIT7to12aXtUIvrCiSNrZuTMZDCwOHTMMsEWt6bFybv/EjkWGF
 LhavNZVUEhf1WJ6Is4jhZQMyDYA4rPXXX58xe1Sqe8GY0Dkl/Xeym8PR3pvsffXOxgGuR6gNS
 Wupd49ffLxJAcGdrV2BSrsZ92I85j1MFOHYijUxz1/qFFOZSAnZ4pDNW6fqvzv4kPL0ck8+3+
 A3xSAiPI+KEzE+Lo5GoFMjUyav9gOMVUJUEyxdINMibJaeRhxKtdoVXgvfVORx4Le+bE=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On alpha, the sigset argument for sigsuspend is in a register.
When we drop that into memory that happens in host-endianness,
but target_to_host_old_sigset will treat it as target-endianness.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220315084308.433109-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 75ed71eb461d..77cd88b53785 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9559,7 +9559,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             TaskState *ts = cpu->opaque;
 #if defined(TARGET_ALPHA)
-            abi_ulong mask = arg1;
+            /* target_to_host_old_sigset will bswap back */
+            abi_ulong mask = tswapal(arg1);
             target_to_host_old_sigset(&ts->sigsuspend_mask, &mask);
 #else
             if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))
-- 
2.35.1


