Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA18D4BB6D3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:26:10 +0100 (CET)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0Sn-0000DA-FY
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:26:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nL0PR-0006wF-AW
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 05:22:41 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:58794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nL0PP-0003GT-F7
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 05:22:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4EF6219A4;
 Fri, 18 Feb 2022 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645179756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dugz9vRHh12lMPR9qnwhun1ziXLugz+P12IgwRkgZGo=;
 b=MZ7opK3yU1rLmosUljND1s/VvHUSC9tTJhXY3Xo3mqJwcxN6hV1V/vE18j6p9tXBSPbnoe
 i/MBmO82eXNkwVwtxlgbXnlGKXun/GXa4PVpxt5IKCndRkntylkp2WM3qUjkbyT50vaXTS
 8440gg1bJUt+je4boQQZWWJFyWZs7hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645179756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dugz9vRHh12lMPR9qnwhun1ziXLugz+P12IgwRkgZGo=;
 b=+8mzkIdRqvBqCB3co5l4fCh8md7Io7CSVfMWOd7sOeKr2gjUdmfXU6LIvYyFQQ0+nS/5HB
 6+OnXE4aZ8d9+JBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 638CE13C5B;
 Fri, 18 Feb 2022 10:22:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bPy0FmxzD2LfBwAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 18 Feb 2022 10:22:36 +0000
From: Li Zhang <lizhang@suse.de>
To: imammedo@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] numa: check NUMA nodes with memdev specified
Date: Fri, 18 Feb 2022 11:22:09 +0100
Message-Id: <20220218102209.8263-1-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If there is no memdev in numa configuration, it always reports
the error as the following:

total memory for NUMA nodes (0x0) should equal RAM size (0x100000000)

This error is confusing, and the total memory is the memory of
NUMA nodes with memdev specified actually. The memory size of a node
without memdev specified is always 0. So it's better to remind
users to check the memory of the NUMA nodes with memdev specified.

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 hw/core/numa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 1aa05dcf42..7e1dbab0d5 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -688,7 +688,8 @@ void numa_complete_configuration(MachineState *ms)
             numa_total += numa_info[i].node_mem;
         }
         if (numa_total != ms->ram_size) {
-            error_report("total memory for NUMA nodes (0x%" PRIx64 ")"
+            error_report("total memory for NUMA nodes specified"
+                         " with memdev backend memory (0x%" PRIx64 ")"
                          " should equal RAM size (0x" RAM_ADDR_FMT ")",
                          numa_total, ms->ram_size);
             exit(1);
-- 
2.31.1


