Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E10C6B53DF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:10:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvk-0008Ck-Mr; Fri, 10 Mar 2023 17:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvh-0008Ag-2O
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:37 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvf-00030M-14
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:36 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M2wbS-1pZeSm0fIC-003OJb; Fri, 10
 Mar 2023 23:09:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Andreas Schwab <schwab@suse.de>
Subject: [PULL 06/28] linux-user: fill out task state in /proc/self/stat
Date: Fri, 10 Mar 2023 23:09:05 +0100
Message-Id: <20230310220927.326606-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zZNYbCpF0r2BGRB37Nbzx89tz/Ied2/S6Jlj3hSpvunw3X6pgad
 rrEnzK4ajF5BM3jy+UW1bMdXdWUPilTihCkkLydQSLstq5ZmfjxrdplYwFddaxLpEOhCaAD
 5s1mmW0Dfqo5E7TaLy3GfGv7X+tcITchvzgNQ2rKYaA7JhhKj1vUgo1DD26J4B2nPK3xCnC
 WVnZCV2MPEmiRI7HqFomw==
UI-OutboundReport: notjunk:1;M01:P0:/HZSFq5qN+s=;HgS8MTUZJ1S01RgL3OI/vnwORFt
 aON5tPmYG0MSSjdG80ynWKPUo7YUhOo3SEiXJZzOryy4bBveHX0QM4k+gwME/iq1i5g2x/f7A
 gxUNRvCVEgMgDA4+u7+C8sa0zfkolM4fpIQMKG50qblRYJ963QfKnGUrfK+MCWAO8jyinGlSm
 eiYoKo8+Q7MhSU/tc+H0mwdT2EXSHe2a0bMNyERQCS0FEOgBVRG4hwxk+5cjaZkvbSvJwieHs
 SosgtqqGVD7ZgUcOZgK33ioVDVaoqa+EjFKin6Kls2Ybj3n7SJ3kcZ/GEgGvHzxpv0aq1y+A2
 PZcTxVsYz25mf0aV1AhbZwlyGDxepPf4Q8Qs0C4fwXoPSnHbZHG4CqBaMizHVnGNqwLIPdACo
 /F7rTSWKMH0AnatZXdeMfJznZHpgtMasAlepqCx1hRINJgUduX5lKV0l/9rlad//iMsKibe7c
 UAZ8xPwas2EuQ7lSUQiFrHjM/yfnhmlNJ5JPcQf9e7J8MbFo7ghwZmuCLwV4lTqLCoTyUUdnr
 apmSPKGGAtm58bhyWTAIdVms6Ho8Hu58yU2Eeyr8bEXWq1sF4UFfRX9inYL86sIk6uf9c773J
 YACMip1la9WvlR6wcd/+dYSwyaQm9Kmt5P/OKFlAxl+aFCCLOloGeO/ttd5+CFMPtR484MNmt
 YqZyKwx3OQZw31jz1fErps5cMzMtBvt/3wVqtdRuXw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
index 69cc4b6e4219..49a4fee89918 100644
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


