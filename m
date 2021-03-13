Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D37339D71
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:50:13 +0100 (CET)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0uT-0000iU-1C
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sM-00079T-6d
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:03 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:58989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sG-00075u-86
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:01 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MrPVJ-1m73Lr3H6N-00oWK9; Sat, 13 Mar 2021 10:47:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE
 kernel support
Date: Sat, 13 Mar 2021 10:47:46 +0100
Message-Id: <20210313094747.2966948-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210313094747.2966948-1-laurent@vivier.eu>
References: <20210313094747.2966948-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2/s7H0X2AzTU8XmqUkzKe38GLMhxVTEhegdlewSVChNIqK0fkTI
 otm+wHxNEpLJ/G+h5ROsRZdRlhzCofX5Fz9NdQoQtZcGFtwgMMyZ5c+ENsxnjEUbMGKkSon
 WNf3T8e3DzaB65/sIZA95cHXb1Q9bwMA25i9T4hkNb5UtibT9zplVAUEv2iNE5uqj7gd6Y0
 urYM6gfCRxpHdsFVtNLvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z8/tCqKbGTQ=:gP2Zcj1g0opYWib7o01ZFz
 wzvn8aakwBQbVXXUy5c9bFWb2k+wLbZ7LG6oBKZ4gZGJH+omOjqeH9Aik6Zd+jx/GEYyZG7ET
 h4TuedRMpkIj7XqbKvSo3EiIAl+2mCnHSawGkk7uKHwqPSE50vTjYsjB6A8eHZRc2QUfBWxSL
 BfaXcnmPGxT2pNe5UXy41iblokjdsIGKwLUHATft2dE8HNmJRqA56cQUr63ssQC4ptNlj0vJL
 Fk1QRcyVs/luzkmZngLCD0sQUhIJlGNPaQhiOuAOq+y8koOECMznJKJ7wcmTYy50VaPzfKToA
 Gjo6VBlrqh2S4N7Om5VnfcS9XvSmDRM7ok0YrKnxPJtI0KZFQ9D5LToXiQcPoQp0SYjuaVgwu
 lPjQkeymUaMmTh6LrrJWhRSCXTR8m3NuSESebc6ZoZs5pCfzraI+ZV4PnLC4N3Fi/T7BIv2BK
 qyFKjpDRdA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Vincent Fazio <vfazio@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vincent Fazio <vfazio@gmail.com>

Previously, pgd_find_hole_fallback assumed that if the build host's libc
had MAP_FIXED_NOREPLACE defined that the address returned by mmap would
match the requested address. This is not a safe assumption for Linux
kernels prior to 4.17

Now, we always compare mmap's resultant address with the requested
address and no longer short-circuit based on MAP_FIXED_NOREPLACE.

Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fallback")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210131061930.14554-1-vfazio@xes-inc.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 174ee7bad677..e525901659d4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2210,8 +2210,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
                                      PROT_NONE, flags, -1, 0);
             if (mmap_start != MAP_FAILED) {
                 munmap(mmap_start, guest_size);
-                if (MAP_FIXED_NOREPLACE != 0 ||
-                    mmap_start == (void *) align_start) {
+                if (mmap_start == (void *) align_start) {
                     return (uintptr_t) mmap_start + offset;
                 }
             }
-- 
2.29.2


