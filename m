Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5738C65F6FF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:47:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYzv-0001NR-UZ; Thu, 05 Jan 2023 17:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDXeR-0003lq-2C
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:19:51 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>) id 1pDXeP-0004fP-F5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:19:50 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3C7A720B92A6;
 Thu,  5 Jan 2023 13:19:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3C7A720B92A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1672953586;
 bh=IRmeoq1dl3YqDk640zQm3nGLr6ydo+N93AmjfiBXHEU=;
 h=From:To:Cc:Subject:Date:From;
 b=iOBLcyvAE5/ljXf4jF8layBJ64nXt2AXmpEeTZqbLVagUD/J8SBqSqkjEHStkvzRI
 IdOrqX13tevDl1ptd42GllvOSAmBS+zL/J/4biQ9FSQfODfJg35qTwFMbod7CGBtY6
 p3s/7nccYcwzsKVWJ09scepmFj8GbytDzWNIpzKg=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Date: Thu,  5 Jan 2023 22:19:40 +0100
Message-Id: <20230105211940.14988-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Jan 2023 17:46:05 -0500
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

Windows open(2) implementations opens files in text mode by default and
needs a Windows-only O_BINARY flag to open files as binary. Qemu already
knows about that flag in osdep.h, so we can just add it to the
host_flags for better compatibility when running qemu on Windows.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 semihosting/syscalls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 508a0ad88c..00f77507e5 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -278,6 +278,8 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
         host_flags |= O_EXCL;
     }
 
+    host_flags |= O_BINARY;
+
     ret = open(p, host_flags, mode);
     if (ret < 0) {
         complete(cs, -1, errno);
-- 
2.34.1


