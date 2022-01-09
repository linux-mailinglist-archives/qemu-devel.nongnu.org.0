Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B34888FE
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 12:49:00 +0100 (CET)
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Wh1-0000F5-41
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 06:48:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaI-0001X7-0U
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:42:02 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:59131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaE-0008BM-PA
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:42:01 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MGR3r-1nA9EK0jpl-00GpMf; Sun, 09
 Jan 2022 12:41:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] q800: fix segfault with invalid MacROM
Date: Sun,  9 Jan 2022 12:41:47 +0100
Message-Id: <20220109114149.1275322-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109114149.1275322-1-laurent@vivier.eu>
References: <20220109114149.1275322-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dS/07ofbDPFoTrZaGhAQNSVM8bGULd+POzemwq1+5xdWphV0i2m
 E+0Dgm9YAs6nsQsK3iD+DPEofgurx94HGsc7tFqHFKmGBoUxWdI5xltGgMiTqrVClq4nCH0
 BmpC9McFMiCeXZpM45jyAvb4BOMP13glerdL0cYCh/MtB+SabPXDg82KHyXpfEOsKhr6l2p
 ZnVjx/ImpgwdR1V1wKQKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2m28WwqEG3s=:EqisjpPxz7WuT7smwhwsHk
 Q3kOiM6exS7QOPOdV21GrUS/f5ww8LeOJKsIR1XAIcPxxkj1ITMTIYyDCkO0ObTtzeWOYCthu
 wUjSz1n4ai6kQgxV6PdJPyHEOFvU2FXAmSXP9DTH/R8vdcA0HcFlAWtQsAi+VV7IwYO+rdVdr
 hSnY03CheBz+fqDHPbpsZ10TibVLo/RH0/QkZWikrNAL0F9N8cZBr7saTaktzNmDsOGnyux49
 JQ9mMRADdLHJR95p0xUu7rnZk4EMSu4l1yxX2keM1Z97q4LFEy4ZTL7syr3azOOXJgysZTRdB
 rjscNwuW3QobbhnSjhn1KHjzApTy+Kk5PLRGe+6xWD42zFvFQdsxNNGDfujeiCkT7FAm9roOQ
 xi1HBuPEEMc+kGf4XWorvjeeIouevmqcCwtpZqSS+arsUNpG2iBXfRpp/EF7sMlN6TGVDBL6L
 yhaXLqVg4BfPhMXyb4yyN7+J8NZZ581I4mE3M9EBOP4hp25rorF8IFdtN7IsRo0Mq+HsVAawk
 RMLn6ErOcRMXLDGyD37fayxx9z7PMTH7YigAu2D0XjfKNvC3pfDXe2bjCnCbidf8d7/sNu38f
 0XOsh3cA49AkEA6H1qFj5H1bNdlYByE4Dq1O2rMF4huk6sVenKg9GUBOtnZgNmiBJo+GwGiKu
 hkrVXPudjRVQnav1lCccZFGF5kdtKbjQQEEEl/UEu1ZhRbQHTWIWG7IAcbMlJu4nLdVA=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"qemu-system-m68k -M q800 -bios /dev/null" crashes with a segfault
in q800_init().
This happens because the code doesn't check that rom_ptr() returned
a non-NULL pointer .

To avoid NULL pointer, don't allow 0 sized file and use bios_size with
rom_ptr().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220107105049.961489-1-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index e4c7c9b88ad0..55dfe5036f40 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -672,12 +672,13 @@ static void q800_init(MachineState *machine)
 
         /* Remove qtest_enabled() check once firmware files are in the tree */
         if (!qtest_enabled()) {
-            if (bios_size < 0 || bios_size > MACROM_SIZE) {
+            if (bios_size <= 0 || bios_size > MACROM_SIZE) {
                 error_report("could not load MacROM '%s'", bios_name);
                 exit(1);
             }
 
-            ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
+            ptr = rom_ptr(MACROM_ADDR, bios_size);
+            assert(ptr != NULL);
             stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
             stl_phys(cs->as, 4,
                      MACROM_ADDR + ldl_p(ptr + 4)); /* reset initial PC */
-- 
2.33.1


