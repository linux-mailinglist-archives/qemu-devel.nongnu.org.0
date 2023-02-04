Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA77B68AB16
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:10:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5x-0005Ls-Ow; Sat, 04 Feb 2023 11:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5o-0005CN-V5
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5m-0006w8-FS
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:44 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M6m5o-1pG7MM2jxm-008MEt; Sat, 04
 Feb 2023 17:08:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 13/22] linux-user: Improve strace output of getgroups() and
 setgroups()
Date: Sat,  4 Feb 2023 17:08:21 +0100
Message-Id: <20230204160830.193093-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yRChEJ7Ba1AWgTnS+fmQyxbTgisMENhq5AuoFIhUK0Acw9aBOm3
 jvHcC3Z19RCi2qZOlpgp3/WBlAP0vy5c0OMD7NtsqKmYphlcXxZulC442cA0Ul1eY7u23e6
 tHllPD6s8G2HYv9af1qHOnT2h/odvSbZmoP4YGeDOD9cZVcWWeq6Dp1TaC38MxCLoFtQHHM
 wdhWUgy4O54re2EbG1bBw==
UI-OutboundReport: notjunk:1;M01:P0:qQ3kTK21Wqo=;jTH5aSeWNScW/tsRFxyRoe6S4fI
 U01wYXyvx96sBKMRnIY3q24RQQIzqu1KOnbkWpL/3946SN6o6oWqbmu/nWsRgdVywIdmkzj+w
 fsf3b3bhF2rdHTo6g+vaXjKu1PG9z6vi8VzrL9FJjR8qEoVHaZAV+JWRIhVBasXsAijzXHpWU
 qQuqftrgVraG8WpM/3BZO8m+WVHfZA3QFAkX9SqU13iN0rhCSbFS2U5K0O80qm3V5ghgwGVPL
 Q1VgFtznXHl/4CO1A3lPfgUXxkLeB7pGgCZAEkbDIcvtxUIF4KIOH0sK2K4kRtxQqW8KYWgtb
 sTa1CSH01PjwysdWKOySt111XFcMOc/AIfKV25UysItTDjjQiMBfRHm7avA/riZebBYF6bP9/
 7FtxNPAD042DLewYh44jwjHt4B71marl5UByR+ELiXYh8ggGngN9ktMS3tkHVOm0f13RpIj4K
 Ek6VZREh/ITFL5MWMOdfRKdMZzPbR/CGYfY5Lk7QqT8M0ShmmqfahI87mu/K+nTHpjU9heVHA
 KnF3JB8rMXOKB/fouqZZsBSaGzva09VGURZQ21q6AVed++YaitWUxyaGzM12Fb8OPwm6QYjTD
 A5QovOPiK7fvKl+h9+Fyh2DKx63out6frFF6rQXI4HGofbxm5ZfY8L6uICDz+chNx+NOeCd1w
 oaOqOnuKyfgFmrwvB13m+ixg9gEFDWqebe7CXa3fXw==
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

From: Helge Deller <deller@gmx.de>

Make the strace look nicer for those syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230115210057.445132-1-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 64db8e6b8412..cf291d02edfe 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -321,10 +321,10 @@
 { TARGET_NR_getgid32, "getgid32" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getgroups
-{ TARGET_NR_getgroups, "getgroups" , NULL, NULL, NULL },
+{ TARGET_NR_getgroups, "getgroups" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getgroups32
-{ TARGET_NR_getgroups32, "getgroups32" , NULL, NULL, NULL },
+{ TARGET_NR_getgroups32, "getgroups32" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_gethostname
 { TARGET_NR_gethostname, "gethostname" , NULL, NULL, NULL },
@@ -1304,10 +1304,10 @@
 { TARGET_NR_setgid32, "setgid32" , "%s(%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setgroups
-{ TARGET_NR_setgroups, "setgroups" , NULL, NULL, NULL },
+{ TARGET_NR_setgroups, "setgroups" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setgroups32
-{ TARGET_NR_setgroups32, "setgroups32" , NULL, NULL, NULL },
+{ TARGET_NR_setgroups32, "setgroups32" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sethae
 { TARGET_NR_sethae, "sethae" , NULL, NULL, NULL },
-- 
2.39.1


