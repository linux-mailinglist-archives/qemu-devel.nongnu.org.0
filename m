Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F27287C46
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:16:14 +0200 (CEST)
Received: from localhost ([::1]:52210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbOf-00084H-Hn
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a35f491b087eafd4f07a14094ef3db1cc94581d9@lizzy.crudebyte.com>)
 id 1kQbMK-0006OQ-8f
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:13:48 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a35f491b087eafd4f07a14094ef3db1cc94581d9@lizzy.crudebyte.com>)
 id 1kQbMI-0005Gv-P1
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=vJf1eCi3O7bwJFdE5qXB2MWVd4uyRMweM8s4xOArQac=; b=E/5Hc
 HbPSREWQ8HXOlrziMafTIoVSV6MVIfrQrhFEVjIG5ycGP2VFrbrfBLsvnG806PzUTLhtGqkZ14wuY
 E2T+yquFppIDAAXF9zSZxnURktRiv+WoIXImGSlKQbyShudHOJrmQioZNnvmJDIlGRATz9vTZ+EQa
 nmkFs/OnOlCiimAX3wipw2afHou0F0+1eNh2W+Wtw0ObVQcgULROEQfyBaoWs+wNF1Nb1K3y6hcDe
 +mYCPZ7eoUxmm3q54GWDh+Gtx5fxjUfh+ZPhZQjKJF0o3nlaxXeJQUhPmwXcv7gdvzhyT+iMpICPT
 MGFINzXu2BesWbmUblLuAtgg0whIw==;
Message-Id: <a35f491b087eafd4f07a14094ef3db1cc94581d9.1602182956.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1602182956.git.qemu_oss@crudebyte.com>
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 8 Oct 2020 20:34:56 +0200
Subject: [PATCH v4 06/12] tests/qtest/qos-test: dump environment variables if
 verbose
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
    Laurent Vivier <lvivier@redhat.com>,
    Paolo Bonzini <pbonzini@redhat.com>,
    Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
    Greg Kurz <groug@kaod.org>,
    "Daniel P. Berrangé" <berrange@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a35f491b087eafd4f07a14094ef3db1cc94581d9@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 15:12:00
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


