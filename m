Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF539588EFF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:58:59 +0200 (CEST)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJFpr-0007Zw-2L
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJFnK-0001mI-Kp
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:56:22 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:55943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJFnI-0005rG-4Q
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:56:22 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MqJuP-1nfIXr0yJf-00nRiC; Wed, 03
 Aug 2022 16:56:16 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 2/3] linux-user: Do not treat madvise()'s advice as a bitmask
Date: Wed,  3 Aug 2022 16:56:12 +0200
Message-Id: <20220803145613.428167-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803145613.428167-1-laurent@vivier.eu>
References: <20220803145613.428167-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VAMSWNedp86XWGTl7VQ8rF3Lak6ecAkA2lUMsKaCDVzlqnLwnBB
 +8L/hUzpQTFf8iP4/eCTCOxgGJg+gtcOemME5pvoJMWymmJhDnF09hQ+qbyoUT4azE4j2ZW
 vUAbDb2FjLwxISQfoa9CpLe+BzR8CbLG32sN+eVQEmc5Y0nXgW1Jx/cBUkV1to5l79wgS2D
 7UgK9bmQeotV4cLXbDpQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o82l1oBSZzo=:PCtL2rj7fNud0oT8PfbDPP
 aP/Lyge1Pc3nWcWcics0OgAedC1jDrJaT3IQO1m/SkfUVuS9MVh+p6K7DHQdMeUPMIGSohXPy
 NiQjHMCVrsFuGXPU6YKkBcQADV6HnRlrGAOjccFwCJYkm76pjGCm6LiHXtLQ9UWwrftg0JJEi
 THmP/9GK9tTcokvcjORVRGztEbsAoXmb4rhYZw82j/TeVFXvBdDWLNR9UXEmEIYOCC4rh1Ljw
 Qw/J5ooBE9r6IYxyL2kzAhfRw8POGHVzerp9HMfpkCkNhhIdSauleAJWXnCghvgvfOCMhWXAR
 yCQUGvIc1jPGOY99P87XC1TBnVKH5H1zGiTFZgxPSkONGYq9EJUU9kNWpFrjIknzCRjTTZCes
 le/1ZMlUaYf7XA4viyM6w5ERGkO71Ho06yZVTzJU5nrLolIIbkWePzmhCJo6Py09om7YIwRSC
 AVA9nHf6hxL5y+hJAzdCisxNHLg+YjGO/WcaOV2nYKZHHlvMWNOSbaFASlca7bhDUANxUEXFQ
 Wc82JZvnlldTnBkr1o85BDsuWv94QUs+3nbt6k3kDIgQt15g+WNCgkjosCpIMh0ZGnHNwmSQW
 RAFjnxOURnz7WKREuvglspKCq99fgnMJuslpzDbtTn6zxkok8C3qW9EWqR2w5/FfSkpv5u8bO
 o5Bo5cqAhoVgMFOWFvlUgTmSoR9MjYlFN+ojo/PlcHDb11SS6L6e1MSWNHaE43HF22TTtIE6t
 ihN/jbJAvdVwzP1aFcBYfip7zg8s6apf5mhCRw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Advice is enum, not flags. Doing (advice & MADV_DONTNEED) also matches
e.g. MADV_MERGEABLE.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220725134100.128035-1-iii@linux.ibm.com>
Fixes: 892a4f6a750a ("linux-user: Add partial support for MADV_DONTNEED")
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 4e7a6be6ee19..edceaca4a8e1 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -891,7 +891,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
      * anonymous mappings. In this case passthrough is safe, so do it.
      */
     mmap_lock();
-    if ((advice & MADV_DONTNEED) &&
+    if (advice == MADV_DONTNEED &&
         can_passthrough_madv_dontneed(start, end)) {
         ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
     }
-- 
2.37.1


