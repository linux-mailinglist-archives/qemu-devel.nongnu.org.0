Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91352675E5C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 20:48:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIxLe-0007e0-Db; Fri, 20 Jan 2023 14:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIxLY-0007di-00
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 14:46:44 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIxLV-0007Y7-Vq
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 14:46:43 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8596333800;
 Fri, 20 Jan 2023 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674243999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PVUgDyXmdfkxwp7hT9E8MGYVs61EcZTWEdCzMMlmTeA=;
 b=BKLJl2nGA3o3xknGebFRHC3T22zB25ODcqL4abYeLFDaMzmb+Ha1r33whRtthljAxLoVga
 KZevUp+/PvpcPYFbNd+UBWO1E5qOkDkRo7TikBtV0gJkinFEzydMmLIbIiNY7nXA6gQeQp
 KhKaxU9dgv0Vnvae4tvJYV3f2Am819Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674243999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PVUgDyXmdfkxwp7hT9E8MGYVs61EcZTWEdCzMMlmTeA=;
 b=LOPiQsdGUf/XhMIYT+Ca54Tzz6aD4KQjEgqiSDpAlEsT9NrYm0btiYALR+REMEckh3teuD
 WKrDA7B8HZ7zUyDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 10C8413251;
 Fri, 20 Jan 2023 19:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bsgrMZ3vymPrBwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 19:46:37 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] tests/qtest: Plug memory leaks in qtest_get_machines
Date: Fri, 20 Jan 2023 16:44:35 -0300
Message-Id: <20230120194435.29796-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These leaks can be avoided:

 759 bytes in 61 blocks are still reachable in loss record 56 of 60
    at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
    by 0x4AA313E: g_strdup (in /usr/lib64/libglib-2.0.so.0.7000.5)
    by 0x12083E: qtest_get_machines (libqtest.c:1323)
    by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
    by 0x11556C: main (test-hmp.c:160)

 992 bytes in 1 blocks are still reachable in loss record 57 of 60
    at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
    by 0x120725: qtest_get_machines (libqtest.c:1313)
    by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
    by 0x11556C: main (test-hmp.c:160)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/libqtest.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 6b2216cb20..65abac5029 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1285,6 +1285,18 @@ struct MachInfo {
     char *alias;
 };
 
+static void qtest_free_machine_info(gpointer data)
+{
+    struct MachInfo *machines = data;
+    int i;
+
+    for (i = 0; machines[i].name != NULL; i++) {
+        g_free((void *)machines[i].name);
+        g_free((void *)machines[i].alias);
+    }
+    g_free(machines);
+}
+
 /*
  * Returns an array with pointers to the available machine names.
  * The terminating entry has the name set to NULL.
@@ -1336,6 +1348,8 @@ static struct MachInfo *qtest_get_machines(void)
     qobject_unref(response);
 
     memset(&machines[idx], 0, sizeof(struct MachInfo)); /* Terminating entry */
+    g_test_queue_destroy(qtest_free_machine_info, machines);
+
     return machines;
 }
 
-- 
2.35.3


