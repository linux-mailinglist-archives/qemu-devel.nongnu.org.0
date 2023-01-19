Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FAB673AD5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:57:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVPa-0000Cj-IE; Thu, 19 Jan 2023 08:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVPY-0000Bw-Dp; Thu, 19 Jan 2023 08:57:00 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVPW-0006BU-Uz; Thu, 19 Jan 2023 08:57:00 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A7123F42D;
 Thu, 19 Jan 2023 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674136617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxrWaE16yozIzsy6MYwQ2ElnYdRKzu+lkQhgFbpYZCs=;
 b=NlRRNdGAvSOg6zR76ssvfseWB89iZx3hK7Ot12ezt/RrypwCfxVM07eempfSN/1B6BHYSl
 oNj11537Lfsc6nHonWNYqubX1ZL1lK9Tfwqj41ki2PJJDnHihNug+3uONhsFxuumvKtgB5
 plajpx8dfQmFy5IyyKpYNzR1o69CyCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674136617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxrWaE16yozIzsy6MYwQ2ElnYdRKzu+lkQhgFbpYZCs=;
 b=3syI/HaJ3PkKJOQyQY9hlyKStjMYczEkIgbNbxq/f43izSdTFscuiaEsVMupxq04zbOkEp
 NyoYd20DfqabmjBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D118D134F5;
 Thu, 19 Jan 2023 13:56:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0OMhJSVMyWOCFAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:53 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 07/15] tests/qtest: Adjust qom-test to always set a
 -cpu option
Date: Thu, 19 Jan 2023 10:54:16 -0300
Message-Id: <20230119135424.5417-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

Start using the qtest_get_machine_args function, which explicitly
sets the -cpu option according to the machine default.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/qom-test.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index d380261f8f..462e3c4281 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -78,14 +78,28 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
     qobject_unref(response);
 }
 
+static const char *arch_get_cpu(const char *machine)
+{
+    const char *arch = qtest_get_arch();
+
+    if (g_str_equal(arch, "aarch64")) {
+        if (!strncmp(machine, "virt", 4)) {
+            return "cortex-a57";
+        }
+    }
+
+    return NULL;
+}
+
 static void test_machine(gconstpointer data)
 {
     const char *machine = data;
+    char *args;
     QDict *response;
     QTestState *qts;
 
-    qts = qtest_initf("-machine %s", machine);
-
+    args = qtest_get_machine_args(machine, arch_get_cpu(machine), NULL);
+    qts = qtest_init(args);
     test_properties(qts, "/machine", true);
 
     response = qtest_qmp(qts, "{ 'execute': 'quit' }");
@@ -94,6 +108,7 @@ static void test_machine(gconstpointer data)
 
     qtest_quit(qts);
     g_free((void *)machine);
+    g_free((void *)args);
 }
 
 static void add_machine_test_case(const char *mname)
-- 
2.35.3


