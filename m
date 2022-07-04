Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF682564F34
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:00:27 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8H0M-0001t5-8g
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1o8Gyi-00014Q-BY
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:58:44 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:33198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1o8Gyg-0007ah-OD
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:58:44 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB46522C1A;
 Mon,  4 Jul 2022 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656921519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ykR3i/67VDF4q38UQFA98LIQRSGYu2puJFyOYv/WaEU=;
 b=nW4nE/CphNL8zWeI/nZan+S8GKK2WRDPE9PtA7X8ZworbFefvswJGXLGJi/xacYuIQoy5A
 ezha1mw1ZPMmkjIrVlA7WXRI3L5hd91nkj+FHm5J09/1G2eoSzOjsJyCcjy6zSrWrkztx2
 yte7gZ6WE65R3gu8UYn3vJwWY8Evhb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656921519;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ykR3i/67VDF4q38UQFA98LIQRSGYu2puJFyOYv/WaEU=;
 b=sUG031xJPa04I99qvS6RVDZo1BllJI+lX14exdceKdYH36BBGuffGeCJafEelymFGj/kNX
 h+4FhrqWXXNccNAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BCBC1342C;
 Mon,  4 Jul 2022 07:58:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yx2GIK+dwmJqMQAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 04 Jul 2022 07:58:39 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: [PATCH] stubs: update replay-tools to match replay.h types
Date: Mon,  4 Jul 2022 09:58:32 +0200
Message-Id: <20220704075832.31537-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

detected with GCC 13 [-Werror=enum-int-mismatch]

Solves Issue #1096.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
---
 stubs/replay-tools.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
index 43296b3d4e..f2e72bb225 100644
--- a/stubs/replay-tools.c
+++ b/stubs/replay-tools.c
@@ -7,13 +7,14 @@ bool replay_events_enabled(void)
     return false;
 }
 
-int64_t replay_save_clock(unsigned int kind, int64_t clock, int64_t raw_icount)
+int64_t replay_save_clock(ReplayClockKind kind,
+                          int64_t clock, int64_t raw_icount)
 {
     abort();
     return 0;
 }
 
-int64_t replay_read_clock(unsigned int kind, int64_t raw_icount)
+int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount)
 {
     abort();
     return 0;
@@ -48,11 +49,11 @@ void replay_mutex_unlock(void)
 {
 }
 
-void replay_register_char_driver(Chardev *chr)
+void replay_register_char_driver(struct Chardev *chr)
 {
 }
 
-void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
+void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len)
 {
     abort();
 }
-- 
2.26.2


