Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0549263B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:58:48 +0100 (CET)
Received: from localhost ([::1]:60488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9o4U-0002hr-FE
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:58:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbc-0004Yi-UW; Tue, 18 Jan 2022 07:28:57 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nba-0001uZ-OW; Tue, 18 Jan 2022 07:28:56 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQy0N-1mvHQj1fVv-00NyCU; Tue, 18
 Jan 2022 13:28:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] hw/scsi/megasas: Simplify using the ldst API
Date: Tue, 18 Jan 2022 13:28:40 +0100
Message-Id: <20220118122847.636461-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kA5fMoXBa0wB00HzZofVdfTi95TE04Gb1A9HDOUdB+QwUMk041L
 6vcjl53WEmxp0F7uvkffuL+guM2LpNAfmF07WIDXOMMWCA5nZQ6+8eN0Mx1Tf7Q0g5LZ4Oz
 +PUCKlBuRq/FIX64LGMOIxxq+Dr6WyucEdqUNYS4HhrlZOtWwzC9wWXSj2QLTtq+dFzPKSW
 UMbgHwjafKi96atA8J3Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iUAunBZy8rg=:kvDIGkbx3hSWv05mOfGb8v
 GGWlCnB1vBNjQx8vsUjDX6x7sRxltLyMY7xj3KkWccjLKdYtDGXJQeDkmrtpCCngmbj3ajgGT
 KvoOT9PN3I74jJALA+gV8lc47Td9/Nya5B9UxQITCP6zOAfy9TD99uiA8CBQMCk6dmD0BJLuO
 dyGqB8qkWFKCoEPIezvJCMBeuSAk7j1O0tuWNaUPzsxfB7Pmo8rP4copQoArur5uSXUtSptKr
 dtGY4tgduX+L2DD6VHaJguy21AWRrKjGKQPCF6BlQKfuIEs9tWreVOulF9e6L9+iUOUjkFVEf
 XpVw/vl66uuA36cvterlJqL/3UzPt7UYpCfOE5LKZaQZXxl6Rf5ovEwsW8sH/yBPBVkUy5ysM
 6kZ15+IYnCOEPrgWiX9+QmevyRi8WdQIbd/XHfeatTMIny1lQgIb50xciGar8GSgi8GQl5vsD
 UutNvnwek2T//gmJbTP6B9GC/QPCafri6NNnLU3jFQgv7M3WBpwifJZ/83AsMH+tGCu3xUlxf
 SO1MK4MCheyuqOSTpFLErnikuoz0v1DtTLpmIz3iuyyy5hvA8a9w2NhotzugYNlspdnku1cUn
 7dlkVEiURD+yXRv2lVh54QsFW4sEZkKnBZIGkxUbdbhOka6Los+KvbIJwkzpFE1iOWThNvI6U
 0oIZug3TkaPtmesCJdF3aWcdQ9USQBuH0Xnuasf+5efobhfokwSAHGicEX2ZqVKZSCco=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This code is easier to review using the load/store API.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211218111912.1499377-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/megasas.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index dc9bbdb740e7..83c321ec208a 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -383,8 +383,7 @@ static int megasas_setup_inquiry(uint8_t *cdb, int pg, int len)
         cdb[1] = 0x1;
         cdb[2] = pg;
     }
-    cdb[3] = (len >> 8) & 0xff;
-    cdb[4] = (len & 0xff);
+    stw_be_p(&cdb[3], len);
     return len;
 }
 
@@ -400,18 +399,8 @@ static void megasas_encode_lba(uint8_t *cdb, uint64_t lba,
     } else {
         cdb[0] = READ_16;
     }
-    cdb[2] = (lba >> 56) & 0xff;
-    cdb[3] = (lba >> 48) & 0xff;
-    cdb[4] = (lba >> 40) & 0xff;
-    cdb[5] = (lba >> 32) & 0xff;
-    cdb[6] = (lba >> 24) & 0xff;
-    cdb[7] = (lba >> 16) & 0xff;
-    cdb[8] = (lba >> 8) & 0xff;
-    cdb[9] = (lba) & 0xff;
-    cdb[10] = (len >> 24) & 0xff;
-    cdb[11] = (len >> 16) & 0xff;
-    cdb[12] = (len >> 8) & 0xff;
-    cdb[13] = (len) & 0xff;
+    stq_be_p(&cdb[2], lba);
+    stl_be_p(&cdb[2 + 8], len);
 }
 
 /*
-- 
2.34.1


