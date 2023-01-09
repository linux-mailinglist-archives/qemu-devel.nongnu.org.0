Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D32966343C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:46:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0rt-00059U-6O; Mon, 09 Jan 2023 17:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0rh-0004wL-O9; Mon, 09 Jan 2023 17:43:37 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0rg-00046F-8i; Mon, 09 Jan 2023 17:43:37 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 724FB5CDDF;
 Mon,  9 Jan 2023 22:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673304214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcPvJ2TkX8BmU0xYGg1vpayMTRS1XI7tg4m7dSlXwDU=;
 b=1q/S1jlgKvGsJxOItlLNN7nJvVmPUIJk6RwWsG7iCcndL6hXg8SWxuq4xrU8PAKTMF2hUS
 607JHLI4V5X4NSxftcRQX3iYYFe+v21h18QnidIMABm9EC+UhMSdcO3N9DOyVo2leshRza
 quNCkPksybxSLp5EWXXZlxt+pGhl6Yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673304214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcPvJ2TkX8BmU0xYGg1vpayMTRS1XI7tg4m7dSlXwDU=;
 b=sEkkpLQUHcvJtHvwJaKBbtA7qMjeNgbRGn4fM63RuH+Pr6SjrcDZWSX7s90axsx13flqds
 QjarXhbG2iNW28Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D62CB13583;
 Mon,  9 Jan 2023 22:43:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0Bp1J5OYvGMdIQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:31 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v2 18/19] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG
 code
Date: Mon,  9 Jan 2023 19:42:31 -0300
Message-Id: <20230109224232.11661-19-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This struct has no dependencies on TCG code and it is being used in
target/arm/ptw.c to simplify the passing around of page table walk
results. Those routines can be reached by KVM code via the gdbstub
breakpoint code, so take the structure out of CONFIG_TCG to make it
visible when building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 21309cf567..d5a4f30717 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -135,6 +135,10 @@ typedef struct CPUTLBEntry {
 
 QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
 
+
+#endif  /* !CONFIG_USER_ONLY && CONFIG_TCG */
+
+#if !defined(CONFIG_USER_ONLY)
 /*
  * The full TLB entry, which is not accessed by generated TCG code,
  * so the layout is not as critical as that of CPUTLBEntry. This is
@@ -176,7 +180,9 @@ typedef struct CPUTLBEntryFull {
     TARGET_PAGE_ENTRY_EXTRA
 #endif
 } CPUTLBEntryFull;
+#endif  /* !CONFIG_USER_ONLY */
 
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /*
  * Data elements that are per MMU mode, minus the bits accessed by
  * the TCG fast path.
-- 
2.35.3


