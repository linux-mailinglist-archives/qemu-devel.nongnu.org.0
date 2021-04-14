Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7535F1CC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:59:40 +0200 (CEST)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWdFD-0002Rb-0C
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lWdER-00022B-Sb
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:58:51 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:39101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lWdEP-0005U5-BF
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:58:51 -0400
Received: from localhost.localdomain ([82.142.18.94]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mysa4-1lj5Zz2SQc-00vyrf; Wed, 14 Apr 2021 12:58:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/elf_ops: clear uninitialized segment space
Date: Wed, 14 Apr 2021 12:58:38 +0200
Message-Id: <20210414105838.205019-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M3fe91IA2xSYigQOk49iE22uRYlE0CUTdrFsULb6rHCbzUoAaw0
 SDrQUcqSEWw/HipjHr0owHrZksyh+LF0vjeJIqCVYOxurDUJ/HjkXAAJx8YYJQfcKik9sIZ
 T+HrkXKPEZum64cQqm0txeW8pj7/M9CpZ7GyEVgHFLuTdaPzvhCWPB7eMS1ZC7aiR5C6Nqp
 GGy6WDmfFkxlyL8udQjNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t20dXKRM/m4=:Ti/gGoXKHTMxeBPPuGtuL9
 f5hbITFqY8OcMtz6D/cIZE7ZTPsTeRo2V3/qaS1uVguqTKygzL8k0aqVyEhbVRAcRqN25PGfd
 lz4FRjw1m7+JSfcZsn8dbwyUP3QHNYXTUtSqER1Wguo1DTcSKTO316UIo1D6ndBjGi8EhV70E
 d4XFlv1fBvFS4PA12tnW/+9WdYUDXqoT4Ej12xharQUSw4+zVSIHGqv9+uJ++BFjONkO/giuo
 x+SXfv4peP3kp/D3pkbD0FUQ4sC/bSFdmWhMSq8o2ctAl+ujUijiCWNH6Oq7lPG6BiknF5Z9A
 07u4ghiVqD5oMJQHPdcYnh+wp08OYG/i30D2GB7SBb4N0MOD/o55zydBO9ylp7494QA/yLOwC
 qvTjaC2pYLir9cSMzA5557kFCjt3iSbfPWDZ1PY8cKjSMP9i2kM2OXRcty4SkiBmcExzayHvQ
 QLXY77iILnmk1tbnPiVE2KOYvE75sPMZqk7aoRorAdyqJ0wFMKHQXMv/EoDmP+KqLjiZw1bO8
 zaavdAm4TzTaV/6V4OfSHY=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Stefano Garzarella <sgarzare@redhat.com>
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
---
 include/hw/elf_ops.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 6ee458e7bc3c..e3dcee3ee349 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -562,6 +562,23 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                     if (res != MEMTX_OK) {
                         goto fail;
                     }
+                    /*
+                     * We need to zero'ify the space that is not copied
+                     * from file
+                     */
+                    if (file_size < mem_size) {
+                        static uint8_t zero[4096];
+                        uint64_t i;
+                        for (i = file_size; i < mem_size; i += sizeof(zero)) {
+                            res = address_space_write(
+                                         as ? as : &address_space_memory,
+                                         addr + i, MEMTXATTRS_UNSPECIFIED,
+                                         zero, MIN(sizeof(zero), mem_size - i));
+                            if (res != MEMTX_OK) {
+                                goto fail;
+                            }
+                        }
+                    }
                 }
             }
 
-- 
2.30.2


