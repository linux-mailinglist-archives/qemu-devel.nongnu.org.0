Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC67304D7A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 01:41:14 +0100 (CET)
Received: from localhost ([::1]:38970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4YtV-0005PO-Jq
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 19:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <21d77b33c578d80b5bba1068e61fd3562958b3c2@lizzy.crudebyte.com>)
 id 1l4YrU-0004R4-34
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:39:09 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:38823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <21d77b33c578d80b5bba1068e61fd3562958b3c2@lizzy.crudebyte.com>)
 id 1l4YrP-0007JD-LF
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=xJY34z9y4a9luo9WI4JB4/BrWS6UutKjACaKNcoQfdM=; b=jnzMK
 Zvnfd6QPe2ISbcOYXjjm4mLEC7zJ7uZXyMIUIOj7oV+WzZ5De8zrSeKKg0/ZcXus+RDkmddiBmagK
 yv9zMWMKAa6E1EkRxo0wv+rD+u68WADTN35IVdktIhJ9223x/k7o3UubbFV0bZgeCyaCqrnVCliVM
 QLjE74W+/+j85JsYyg+sCVrsEwhtEntjTGmeUIPyWOgbC0wogQGtB73/mSRXjj1VOYkEgxNFVBkjg
 avJ8OnplQ0ni3SDA7QoIBW0k6HnBh3532iqLj+EkEMvk7licvqC3RrKp53vTAHN9fn5UlSoUq5S9o
 uMQ6N3gzKnsYdHfgSwL5TxMzq9eBg==;
Message-Id: <21d77b33c578d80b5bba1068e61fd3562958b3c2.1611704181.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1611704181.git.qemu_oss@crudebyte.com>
References: <cover.1611704181.git.qemu_oss@crudebyte.com>
Date: Wed, 27 Jan 2021 00:17:36 +0100
Subject: [PATCH 4/5] tests/qtest/qos-test: dump environment variables if
 verbose
To: qemu-devel@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=21d77b33c578d80b5bba1068e61fd3562958b3c2@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

If qtests are run in verbose mode (i.e. if --verbose CL argument
was provided) then print all environment variables to stdout
before running the individual tests.

It is common nowadays, at least being able to output all config
vectors in a build chain, especially if it is required to
investigate build- and test-issues on foreign/remote machines,
which includes environment variables. In the context of writing
new test cases this is also useful for finding out whether there
are already some existing options for common questions like is
there a preferred location for writing test files to? Is there
a maximum size for test data? Is there a deadline for running
tests?

Use qos_printf() instead of g_test_message() to avoid the latter
cluttering the output.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/qos-test.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index d98ef78613..b279b6f816 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -313,9 +313,16 @@ static void walk_path(QOSGraphNode *orig_path, int len)
  *   machine/drivers/test objects
  * - Cleans up everything
  */
-int main(int argc, char **argv)
+int main(int argc, char **argv, char** envp)
 {
     g_test_init(&argc, &argv, NULL);
+    if (g_test_verbose()) {
+        qos_printf("ENVIRONMENT VARIABLES: {\n");
+        for (char **env = envp; *env != 0; env++) {
+            qos_printf("\t%s\n", *env);
+        }
+        qos_printf("}\n");
+    }
     qos_graph_init();
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_LIBQOS);
-- 
2.20.1


