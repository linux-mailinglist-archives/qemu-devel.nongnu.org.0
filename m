Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6A1281939
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 19:28:30 +0200 (CEST)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOOr7-0003UU-JO
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 13:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8d8b242f38caccd81c27125167862f4457e8a22f@lizzy.crudebyte.com>)
 id 1kOOmY-0006oh-Hp
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 13:23:46 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8d8b242f38caccd81c27125167862f4457e8a22f@lizzy.crudebyte.com>)
 id 1kOOmW-0001jq-Qh
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 13:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=44zIO6oSJBtCMtx0lPpF1Gk4m8vRKjg9xvEFAgJFrqw=; b=hFgB7
 gMjVjv/iw/9uVSUHDXBzaILgWeLdBh73nihuh8KweK0z9eKQQOEPYpTM3CUkkpfuldUpndy/5/qDL
 BaqStNZXbcPZJFzod6TojpA4TxW5M3/vnQc7tKPhaiai6ifHfqr/UiIrqGqls/3xbBUfylUXL0uy9
 TEBtuRfQcpPBekmCw6sGGavvZFOddH4DEmnkLNSVh14NXhmPGaAQukzpiqfe7KAgECSO5kLPuUc5V
 DY1AjHhUICHVKKRc27s2tKvF6DwT7jMDlRgK03YbyIJIkuwTc5rkhGJhzU77yVub93fxvbIIyvxO5
 s7Ea04bHExDNoWAdvfDX6gYWjULUg==;
Message-Id: <8d8b242f38caccd81c27125167862f4457e8a22f.1601655308.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1601655308.git.qemu_oss@crudebyte.com>
References: <cover.1601655308.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 2 Oct 2020 18:15:05 +0200
Subject: [PATCH v3 05/11] tests/qtest/qos-test: dump environment variables if
 verbose
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>, berrange@redhat.com
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=8d8b242f38caccd81c27125167862f4457e8a22f@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 08:18:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If qtests are run in verbose mode (i.e. if --verbose CL argument
was provided) then print all environment variables to stdout
before running the individual tests.

Instead of using g_test_message() rather use printf() in combination
with g_test_verbose(), to avoid g_test_message() cluttering the
output.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/qos-test.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index d98ef78613..fe240b32a7 100644
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
+        printf("ENVIRONMENT VARIABLES: {\n");
+        for (char **env = envp; *env != 0; env++) {
+            printf("\t%s\n", *env);
+        }
+        printf("}\n");
+    }
     qos_graph_init();
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_LIBQOS);
-- 
2.20.1


