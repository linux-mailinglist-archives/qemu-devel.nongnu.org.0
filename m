Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E935ED8E7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:25:41 +0200 (CEST)
Received: from localhost ([::1]:40312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTK0-0007Eh-7r
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEC-0008E1-0d
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:36 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:37057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008CJ-Fx
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:35 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MbSXf-1pFH1H2lOD-00bqJf; Wed, 28
 Sep 2022 10:15:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 23/38] linux-user/hppa: Allow PROT_GROWSUP and PROT_GROWSDOWN
 in mprotect()
Date: Wed, 28 Sep 2022 10:15:02 +0200
Message-Id: <20220928081517.734954-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wIbD77KY6GC0KPfnUEfMvSRwnFhWJwtVnFQfMHZMzrDGHL7QD3e
 ppZ5l/YPBPp6OFqG1GxuQCWJOPQl0OxAIAiiy2ptZgOz8AF32NoFBVsao6Tx/3vyc/AJ34j
 yp+K8hI3zllFwf3FqZ4M0yIP/iZzyCOY9O1zpACGP6Ld0ycO3cWYReA6cHSR6tF5TqPwJNj
 3eNHu/uaoh8mNlyrg6o+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tegVOXc4dTk=:sKn+h2bZzOiXlqC0pIlorx
 zzvTHYmN3bw/7I8jeYjymuLhnlmMGwXTH5Wi/C8uBbw3Be4qHAwBD7hmtuBOFyrcVhgm+CbUC
 HCqYHy/P2KmUJu6mldKR08lmGR/jlQte2ldHuLKRcfGpU61tlrVQ5XmSZ73qMyBrVytGtOcfl
 kaGS9QXpXni+0qY+l507VHrTTYwOrPucPs4u9hQZ8Q1HLTy5L+cdwny5HuD5/JaZ6VQgbKMX2
 ovNIyA7vzM87cqut8KlBhX+vZTiAWvPCAVvxoiHur8VJoU6gIJ3b9NyZv81k9OWk0LMpD0C/4
 E54GkwUpJyo3pzSMdkGXfTKriGEALN8yE2HheTrogIi3wUGKfwa0GlTPF2inCVnXio+FmPEay
 +LNEbpB7bETXdSd/IVazQ/wf5qYElEwAHKnL7q8L4sRNuMzl283puypd2BzhuGfHRXQmKBkxu
 0hLcTrAk2dsGVCPfo9Nv/C2yp/4ta5zm56ZzY81ovmtK6U7x6Z/GI2+sofMbz+FeXZHJlof8R
 f+D51IE1yEIspi+0TAR+GOdh5deyzSfVKkAmImwtOK2y6pTdUT2GbuMhfgmR1aOGnpF25ZbxL
 67sDXLZwx8PjwonTqR0ypi9bf6nfuU4N15J4hu0r0075qTWDMLgcEBI5aMLkm+5omCEpABZys
 38720Jv5i0BgiepGtvvw+UQoOcQlORM0rq+GzBT3jX/ZPNTeXjfRY0Rm52VRsT93CaaY4jMvh
 WMV818MXic0WI9/kSpO+GuJi181lwfFAGIiVA02aisJulZhuflYbL609An0NxzHoyfEX/zlA8
 dUhwOxB
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

From: Helge Deller <deller@gmx.de>

The hppa platform uses an upwards-growing stack and required in Linux
kernels < 5.18 an executable stack for signal processing.  For that some
executables and libraries are marked to have an executable stack, for
which glibc uses the mprotect() syscall to mark the stack like this:
 mprotect(xfa000000,4096,PROT_EXEC|PROT_READ|PROT_WRITE|PROT_GROWSUP).

Currently qemu will return -TARGET_EINVAL for this syscall because of the
checks in validate_prot_to_pageflags(), which doesn't allow the
PROT_GROWSUP or PROT_GROWSDOWN flags and thus triggers this error in the
guest:
 error while loading shared libraries: libc.so.6: cannot enable executable stack as shared object requires: Invalid argument

Allow mprotect() to handle both flags and thus fix the guest.
The glibc tst-execstack testcase can be used to reproduce the issue.

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-7-deller@gmx.de>
[lvivier: s/elif TARGET_HPPA/elif defined(TARGET_HPPA)/]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index e557f3626e5d..28f3bc85ed45 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -106,6 +106,8 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
             page_flags |= PAGE_MTE;
         }
     }
+#elif defined(TARGET_HPPA)
+    valid |= PROT_GROWSDOWN | PROT_GROWSUP;
 #endif
 
     return prot & ~valid ? 0 : page_flags;
-- 
2.37.3


