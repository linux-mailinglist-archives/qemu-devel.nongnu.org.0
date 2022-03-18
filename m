Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6E4DDB99
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:23:36 +0100 (CET)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDVv-00054W-5G
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:23:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liucong2@kylinos.cn>)
 id 1nV8T5-0002qE-Lo
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 05:00:21 -0400
Received: from mailgw.kylinos.cn ([123.150.8.42]:24176 helo=nksmu.kylinos.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liucong2@kylinos.cn>)
 id 1nV8Sz-0007QE-1j
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 05:00:19 -0400
X-UUID: 7bb2a2890f2c40558037bd93d8a7a975-20220318
X-UUID: 7bb2a2890f2c40558037bd93d8a7a975-20220318
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 2097548885; Fri, 18 Mar 2022 16:59:17 +0800
X-ns-mid: postfix-62344A0A-6248848230
Received: from localhost.localdomain (unknown [172.20.12.219])
 by cs2c.com.cn (NSMail) with ESMTPA id 7EF983848652;
 Fri, 18 Mar 2022 08:59:54 +0000 (UTC)
From: Cong Liu <liucong2@kylinos.cn>
To: pbonzini@redhat.com,
	kvm@vger.kernel.org,
	qemu-devel@nongnu.org
Subject: [PATCH] kvm/arm64: Fix memory section did not set to kvm
Date: Fri, 18 Mar 2022 16:59:31 +0800
Message-Id: <20220318085931.3899316-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=123.150.8.42;
 envelope-from=liucong2@kylinos.cn; helo=nksmu.kylinos.cn
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_PERMERROR=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Mar 2022 10:21:24 -0400
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
Cc: Cong Liu <liucong2@kylinos.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

on the arm64 platform, the PAGESIZE is 64k, the default qxl rom
bar size is 8k(QXL_ROM_SZ), in the case memory size less than
one page size, kvm_align_section return zero,  the memory section
did not commit kvm.

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 accel/kvm/kvm-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 27864dfaea..f57cab811b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -318,6 +318,7 @@ static hwaddr kvm_align_section(MemoryRegionSection *section,
                                 hwaddr *start)
 {
     hwaddr size = int128_get64(section->size);
+    size = ROUND_UP(size, qemu_real_host_page_size);
     hwaddr delta, aligned;
 
     /* kvm works in page size chunks, but the function may be called
-- 
2.25.1


