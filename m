Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E879494B4C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 11:00:48 +0100 (CET)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAUFL-0002DZ-7h
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 05:00:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ptesarik@suse.com>) id 1nATjQ-0003cq-7H
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:27:56 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ptesarik@suse.com>) id 1nATjN-0001Lm-QC
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:27:47 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E4CC212C3;
 Thu, 20 Jan 2022 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1642670861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BiZeHQxQqBC1alhKJpQDV+jFzhA1vx8TjLEBL82vQ+M=;
 b=bNXD++ywTCW7rsEI7I5K7vWKpmsfTR5tWHY3jZKL2LyUW/xQOK5L5cMCOY8LXLL33nG8ux
 N4yvvqAIGGlniQQV3MhIDEExyJV5d1FoZQmpSMhzxNYFvWSWeBv10S0n+CNfcilSVaDJ8q
 alnavyASOFJ4HQsCYAHM6kBka1NooGk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACCA41330C;
 Thu, 20 Jan 2022 09:27:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MrtTKQwr6WE9QgAAMHmgww
 (envelope-from <ptesarik@suse.com>); Thu, 20 Jan 2022 09:27:40 +0000
From: Petr Tesarik <ptesarik@suse.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@xilinx.com>,
 Petr Tesarik <ptesarik@suse.com>, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 1/1] Allow setting up to 8 bytes with the generic loader
Date: Thu, 20 Jan 2022 10:27:15 +0100
Message-Id: <20220120092715.7805-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=ptesarik@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation for the generic loader says that "the maximum size of
the data is 8 bytes". However, attempts to set data-len=8 trigger the
following assertion failure:

../hw/core/generic-loader.c:59: generic_loader_reset: Assertion `s->data_len < sizeof(s->data)' failed.

The type of s->data is uint64_t (i.e. 8 bytes long), so I believe this
assert should use <= instead of <.

Fixes: e481a1f63c93 ("generic-loader: Add a generic loader")
Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 hw/core/generic-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index 9a24ffb880..504ed7ca72 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -56,7 +56,7 @@ static void generic_loader_reset(void *opaque)
     }
 
     if (s->data_len) {
-        assert(s->data_len < sizeof(s->data));
+        assert(s->data_len <= sizeof(s->data));
         dma_memory_write(s->cpu->as, s->addr, &s->data, s->data_len,
                          MEMTXATTRS_UNSPECIFIED);
     }
-- 
2.31.1


