Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D676B0908
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:30:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtrD-0001iL-8n; Wed, 08 Mar 2023 08:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqv-0001g2-LH
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:09 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqt-00064l-Gn
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:09 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N0nSN-1qWPjB2UUf-00wpJB; Wed, 08
 Mar 2023 14:29:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Andreas Schwab <schwab@suse.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 06/28] linux-user: fill out task state in /proc/self/stat
Date: Wed,  8 Mar 2023 14:28:35 +0100
Message-Id: <20230308132857.161793-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wJcpOZDzv37yo1RPCyGKNPMIC1slVZhyjjeBqOACCWQgPoZxvzY
 qpML9Ow6cCcnIOP6xUabBkYREPmpVH/Vyr6zOJ88XREWDBJCaluR/ofImHHltbgtl63s8f6
 Tja+ezSIaQYhSd++cCivkzFgpS9u+vYj2G6t+JPpD12u2aAqGre4pumDLo3LEtj/Pheqsoo
 mDbui/8jz+4FhAV/QgkQA==
UI-OutboundReport: notjunk:1;M01:P0:/L1A22qWeaI=;5iuf+2nq8eLR6ojXGlENZIgnUYg
 VBTvovrNCoKtg540/QRBGgSD1Yr++D7d/QnaHvbBLu3cHn+BNah0HVN8E5HjFWLoXddAWa1Rs
 dzEyQtN2lnkm3u3l11YxojSOCQcLYbbFPYY3kUhyYRKazsHCKFY/hABm+0OJvz9WYqq7OdjtY
 jwGGAYObED9fNnT6AGpCty4hj2qDVIH5/T6Sq9mUuQ588Zn1PFddkNpPv16aVI7ZYJMLjrHgn
 j+yGoNl+QbXL/zSIGzp5dmcahmTpMXJtWgT2FLtFHYQAHgdVbmkxXzqht4U8zfU+I9ryb+Duk
 HaWzqkt2uYClrdCgdFUMfaQ2xLGiMdupcxTNp9cK2WwOeXsMnIXxFiGoqaz3g5sp71ngchoNl
 Rx4ySkn0sFC3Iv99eMW8s5dTVeeeEiGxPjcpp0hX2qiv4SFcZAdL+nx0vm37I2eBV5z4qUhKQ
 M+pzqYNLWooU0x7LwcXIwbtnoJiTYoUhyP9WLen6/hkhsItGtBFXdjoBP56XH/3FK83dqwXxa
 qGk6kNjRsYV1nYuYBz6RqSMfSKeVZeqF0hMFt8L/SXNr2eWb1Y9hwpdLBK3J9x9bsCzYs1qhk
 wq9CDfs6cHeX417xXQ1xyXDthhtOiExDLUUxAR284Z7xlpYp0MDLcMVxL/YSSGJ/uUL1E/qkV
 PNkD5EFDVaa+gD07MmXU1XGNPO+YUmpL53HRPYEPtg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Andreas Schwab <schwab@suse.de>

Some programs want to match an actual task state character.

Signed-off-by: Andreas Schwab <schwab@suse.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <mvmedq2kxoe.fsf@suse.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index db27c85abb8d..8ecad83f7f10 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8079,6 +8079,9 @@ static int open_self_stat(CPUArchState *cpu_env, int fd)
             gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
             bin = bin ? bin + 1 : ts->bprm->argv[0];
             g_string_printf(buf, "(%.15s) ", bin);
+        } else if (i == 2) {
+            /* task state */
+            g_string_assign(buf, "R "); /* we are running right now */
         } else if (i == 3) {
             /* ppid */
             g_string_printf(buf, FMT_pid " ", getppid());
-- 
2.39.2


