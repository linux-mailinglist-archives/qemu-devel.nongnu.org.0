Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490EA36EC36
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:15:42 +0200 (CEST)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7S9-000743-Au
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lc7QC-0005PC-Oa
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:13:40 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lc7Q8-0004PU-K7
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:13:40 -0400
Received: from quad ([82.142.25.254]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M4rkF-1lcw6I29f5-0020DG; Thu, 29
 Apr 2021 16:13:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/elf_ops: clear uninitialized segment space
Date: Thu, 29 Apr 2021 16:13:25 +0200
Message-Id: <20210429141326.69245-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429141326.69245-1-laurent@vivier.eu>
References: <20210429141326.69245-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:viLJk4n520eg09CF1TiSSwulH4BUJ85htBBKNhaLy05Ks3p/rO6
 MNJ69xdBtzW0niT7bd7t6eRffj0O0/+bMdcL7upBDU1fdhT9taWePuSkWoFLqUmZHeNXANy
 SSFr8XbvWReMQeQYHR/c63Jmau6+C2uOiH5hhEPZL9XHQBR1afwdvnTO9tO8wkIxeWxG/bg
 iPmcEVvC6YXIfkxkRaoDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MNNvyC8tVd4=:j875aqkGwTHEFF0wTPS6hE
 M8uxw893HKW08ulezI0o6XceaaQ4z53J1wx1xVOZG1CHM+IqFxRtaa4VHvzhLArsnRPqiqua1
 i4pPRWDWjhT6IGBVlDNw4d8ip8j/V5c5I49nvwgEJVfjcJ60zNn3KTckkOxjDb5bY7OMxbHVs
 m72ufIsYl5dqaBVjyysBfD488lILHspvlm0wq6mbCer7CWqy122SQEJ66g3bFDYnDmNzR6C+A
 8r0ivJ5C6L4I+T1MYJ7+mO/hIbliBYINnI4erDhVd1hKx0n80pqjYU0sZRKJLeMMtDEbyaR5z
 iIOA1oeTbwUDUV+M2CE+FmxCFwsappcjwuN5qawro7hCmc2vBMLDdBj5pnz82tzNyz1fBY+vR
 YAoqeyHtsHBtCkP/vZiXHYmmOlIjmzvzp/oKmTZJ05qmNJ2uj+kEje4p6J+eo1Gjt8uAHgrZO
 V/lM7HBwzuOuFB2vT0zYO3XpgPBPuNjV1cgsRvfYMJF0VJy6hmW7BUHoFyMKVA+ZABGVNJzuF
 GnuOddFeAC1bXGGi1Ew7D8=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the mem_size of the segment is bigger than the file_size,
and if this space doesn't overlap another segment, it needs
to be cleared.

This bug is very similar to the one we had for linux-user,
22d113b52f41 ("linux-user: Fix loading of BSS segments"),
where .bss section is encoded as an extension of the the data
one by setting the segment p_memsz > p_filesz.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
[PMD: Use recently added address_space_set()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/elf_ops.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 6ee458e7bc3c..29f4c43e231d 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -562,6 +562,19 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                     if (res != MEMTX_OK) {
                         goto fail;
                     }
+                    /*
+                     * We need to zero'ify the space that is not copied
+                     * from file
+                     */
+                    if (file_size < mem_size) {
+                        res = address_space_set(as ? as : &address_space_memory,
+                                                addr + file_size, 0,
+                                                mem_size - file_size,
+                                                MEMTXATTRS_UNSPECIFIED);
+                        if (res != MEMTX_OK) {
+                            goto fail;
+                        }
+                    }
                 }
             }
 
-- 
2.31.1


