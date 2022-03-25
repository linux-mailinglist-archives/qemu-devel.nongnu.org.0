Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CED4E78BB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 17:12:30 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXmY9-0002TJ-6f
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 12:12:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1nXm26-0000BS-5I; Fri, 25 Mar 2022 11:39:22 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:58816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1nXm22-0002Np-Vg; Fri, 25 Mar 2022 11:39:20 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 8E2712E125E;
 Fri, 25 Mar 2022 18:39:10 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 JVLMi5BY2Z-dAIqJvBf; Fri, 25 Mar 2022 18:39:10 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1648222750; bh=e1Xmxa9agWggN/NoZPD0f5zvOu/91dlk+UEZvw7DIEY=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=kBv9u8FSoxH+sa2dt1myqUfd9AqKSTuGFBL0+3GDkehg9OcaZfRcKwwW/dg5HMim8
 dP58VKg9xAmDpNxd3205orDaUbEiwcIhMMuWz+NPqGXCxB9B8mYhdWeUHnkB9tFTBR
 lJStHBRyNDyO9iEqb6bjUgRyOWLjqVO6ZvvcOCIo=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Received: from dellarbn.yandex.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 RLr4sOPFvu-dAJOlBcG; Fri, 25 Mar 2022 18:39:10 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Andrey Ryabinin <arbn@yandex-team.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/2] softmmu/physmem: move last_ram_page() call under
 qemu_mutex_lock_ramlist()
Date: Fri, 25 Mar 2022 18:40:12 +0300
Message-Id: <20220325154013.16809-1-arbn@yandex-team.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217; envelope-from=arbn@yandex-team.com;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Mar 2022 12:08:47 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrey Ryabinin <arbn@yandex-team.com>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'ram_list.blocks' modifications protected by 'ram_list.mutex'.
last_ram_page() uses state of 'ram_list.blocks' to identify ram's size.
ram_block_add() calls last_ram_page() before the mutex lock
making the following race possible:

     CPU#0                                       CPU#1
                                      ram_block_add()
                                         old_ram_size = last_ram_page()
                                         qemu_mutex_lock_ramlist()
                                         ...
                                         dirty_memory_extend(old_ram_size, new_ram_size);
ram_block_add()
   old_ram_size = last_ram_page()

					      //insert block to ram_list
					      QLIST_INSERT_*_RCU()
					      qemu_mutex_unlock_ramlist()
   qemu_mutex_lock_ramlist()
   ....
   dirty_memory_extend(old_ram_size, new_ram_size);

Such race may result in leaking some dirty memory bitmaps.

Because of stale 'old_ram_size' value, the dirty_memory_extend() on CPU#0
will allocate and reinitialize some of the already allocated on CPU#1
dirty memory bitmap blocks.

Fix this by moving last_ram_page() call under the qemu_mutex_lock_ramlist()

Cc: qemu-stable@nongnu.org
Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 4e1b27a20e..32f76362bf 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1969,9 +1969,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     ram_addr_t old_ram_size, new_ram_size;
     Error *err = NULL;
 
+    qemu_mutex_lock_ramlist();
     old_ram_size = last_ram_page();
 
-    qemu_mutex_lock_ramlist();
     new_block->offset = find_ram_offset(new_block->max_length);
 
     if (!new_block->host) {
-- 
2.34.1


