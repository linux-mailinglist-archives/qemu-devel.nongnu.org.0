Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D92E3311ED
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:19:10 +0100 (CET)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHf3-0003da-9x
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsurbayrole@quarkslab.com>)
 id 1lJC41-0004M1-Fu
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 04:20:33 -0500
Received: from [2001:bc8:24f6:500::1] (port=42288 helo=mx5.quarkslab.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsurbayrole@quarkslab.com>)
 id 1lJC3o-0007oL-Cx
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 04:20:32 -0500
Received: from Muon.usr.qb (lstlambert-657-1-110-45.w92-154.abo.wanadoo.fr
 [92.154.21.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx5.quarkslab.com (Postfix) with ESMTPSA id 4DvCVR258Gz7srZ;
 Mon,  8 Mar 2021 10:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quarkslab.com;
 s=mail; t=1615195215;
 bh=vwswMcuP4UTAWU/yjiEDFQPedvgysCE5qLHA8C1U0gk=;
 h=From:To:Cc:Subject:Date;
 b=Q4KGsbUFaL2ZepMnqRMRzeMCvZnh9jLpsO32Hcb+w3XqdjeeBsjal99PI1sVvsKsT
 RUwdAHg7TRaULEprcpsHOr5SzunlqCJ07YgJCrU+8FUAQ2x5xjh50x1FUtsSwHUEgm
 vnUgIIhQlweh0mCG6mRfc5wSpZeRTh58LZDAOUFg=
From: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Fix executable page of /proc/self/maps
Date: Mon,  8 Mar 2021 10:19:59 +0100
Message-Id: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:bc8:24f6:500::1
 (failed)
Received-SPF: pass client-ip=2001:bc8:24f6:500::1;
 envelope-from=nsurbayrole@quarkslab.com; helo=mx5.quarkslab.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 Mar 2021 10:17:35 -0500
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
Cc: Nicolas Surbayrole <nsurbayrole@quarkslab.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The guest binary and libraries are not always map with the
executable bit in the host process. The guest may read a
/proc/self/maps with no executable address range. The
perm fields should be based on the guest permission inside
Qemu.

Signed-off-by: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
---
 linux-user/syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 389ec09764..0bbb2ff9c7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7888,9 +7888,9 @@ static int open_self_maps(void *cpu_env, int fd)
             count = dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
                             " %c%c%c%c %08" PRIx64 " %s %"PRId64,
                             h2g(min), h2g(max - 1) + 1,
-                            e->is_read ? 'r' : '-',
-                            e->is_write ? 'w' : '-',
-                            e->is_exec ? 'x' : '-',
+                            (flags & PAGE_READ) ? 'r' : '-',
+                            (flags & PAGE_WRITE_ORG) ? 'w' : '-',
+                            (flags & PAGE_EXEC) ? 'x' : '-',
                             e->is_priv ? 'p' : '-',
                             (uint64_t) e->offset, e->dev, e->inode);
             if (path) {
-- 
2.30.1


