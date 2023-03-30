Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F45B6D0D62
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwd6-0003DI-5w; Thu, 30 Mar 2023 14:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcr-00038M-Ds
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:54 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcp-00020p-Th
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:53 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2430F1F86C;
 Thu, 30 Mar 2023 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sk83qEGaqZFWkA6OXTepi0U673ImA1hvV5Fb8G0U1QU=;
 b=xSJwDUXJ46/3mfXHNfkMxpUgwYYde3XfIvo5PvnHAWsRopeTO0JPCR4OMX/9mNiPKYoKAR
 PoxG8Uw4CRkPY77evHucOpo5ivBAV3qa3F250qYYHJ6oqvXDH5nK4shYzdRmv+QzcURiUh
 qV762rtuAmXpUyPKkjwoUvIXk9IT79s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sk83qEGaqZFWkA6OXTepi0U673ImA1hvV5Fb8G0U1QU=;
 b=snNOiWBP8rg59tROOHWrYQ+5bEw86us+sY2Df0o6OrdlW00yxFcS7iF4MtfuLZoqkoxGFi
 YN6fne0VXgLie1Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CAB61348E;
 Thu, 30 Mar 2023 18:03:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wAjfNALPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:03:46 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH v1 03/26] tests/qtest: migration: Add migrate_incoming_qmp
 helper
Date: Thu, 30 Mar 2023 15:03:13 -0300
Message-Id: <20230330180336.2791-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Nikolay Borisov <nborisov@suse.com>

file-based migration requires the target to initiate its migration after
the source has finished writing out the data in the file. Currently
there's no easy way to initiate 'migrate-incoming', allow this by
introducing migrate_incoming_qmp helper, similarly to migrate_qmp.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-helpers.c | 19 +++++++++++++++++++
 tests/qtest/migration-helpers.h |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index f6f3c6680f..8161495c27 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -130,6 +130,25 @@ void migrate_qmp(QTestState *who, const char *uri, const char *fmt, ...)
     qobject_unref(rsp);
 }
 
+
+void migrate_incoming_qmp(QTestState *who, const char *uri, const char *fmt, ...)
+{
+    va_list ap;
+    QDict *args, *rsp;
+
+    va_start(ap, fmt);
+    args = qdict_from_vjsonf_nofail(fmt, ap);
+    va_end(ap);
+
+    g_assert(!qdict_haskey(args, "uri"));
+    qdict_put_str(args, "uri", uri);
+
+    rsp = qtest_qmp(who, "{ 'execute': 'migrate-incoming', 'arguments': %p}", args);
+
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+}
+
 /*
  * Note: caller is responsible to free the returned object via
  * qobject_unref() after use
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index a188b62787..53ddeaebb7 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -31,6 +31,10 @@ QDict *qmp_command(QTestState *who, const char *command, ...);
 G_GNUC_PRINTF(3, 4)
 void migrate_qmp(QTestState *who, const char *uri, const char *fmt, ...);
 
+G_GNUC_PRINTF(3, 4)
+void migrate_incoming_qmp(QTestState *who, const char *uri,
+                          const char *fmt, ...);
+
 QDict *migrate_query(QTestState *who);
 QDict *migrate_query_not_failed(QTestState *who);
 
-- 
2.35.3


