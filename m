Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F0327A0CA
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Sep 2020 14:15:54 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMVar-0006a6-Ov
	for lists+qemu-devel@lfdr.de; Sun, 27 Sep 2020 08:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0101be73855284d25a44e7d3051d515456db94b9@lizzy.crudebyte.com>)
 id 1kMVZD-00064a-Ca
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 08:14:11 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0101be73855284d25a44e7d3051d515456db94b9@lizzy.crudebyte.com>)
 id 1kMVZC-0006Ib-2J
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 08:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=GtJHuwyoegajjaKgnQ0LAhrlyUdI4zEzua7f4qjZ8wI=; b=GvNOp
 fH5t8mNUTu4srnb/TGDuOdPQLcfvpYVKtYDRrLVFOwX1+MI7tBNlu8ir1BXiBJARfUom7tFKA34Cs
 ZNV0WsWappRzgciEil/eGpLxdf0vziSeNtffSVyJA9nkPR5oNMrTXMBAA2q5GyfCUcpYtELG3F/jJ
 5PBZDJRGGBprk9zanVU37QmJErOzrBQbA4LNrj6l8lTq76EmmeWx62N9SZFRYcvudZvCd1jBki1nj
 fhBr3CA+i171hcRhgwNRkrvwycEZPP91TjOYslz9lhjJ2wcL1espUVwG19wd4bKsXNN8/x++t60ec
 vZr+EZl3Je7rOymIMy3gRQtAEw5kA==;
Message-Id: <0101be73855284d25a44e7d3051d515456db94b9.1601203436.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1601203436.git.qemu_oss@crudebyte.com>
References: <cover.1601203436.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 27 Sep 2020 12:39:34 +0200
Subject: [PATCH 04/12] tests/qtest/qos-test: new QTEST_DUMP_GRAPH environment
 variable
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0101be73855284d25a44e7d3051d515456db94b9@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/27 07:42:27
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

Setting this new QTEST_DUMP_GRAPH environment variable causes qos-test
to dump the created qos graph (all nodes and edges, along with their
current individual availability status) to stdout.

See API doc comment on function qos_dump_graph() for details.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/qos-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 8fdf87b183..db667e16da 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -322,6 +322,9 @@ int main(int argc, char **argv)
     qos_set_machines_devices_available();
 
     qos_graph_foreach_test_path(walk_path);
+    if (getenv("QTEST_DUMP_GRAPH") != NULL) {
+        qos_dump_graph();
+    }
     g_test_run();
     qtest_end();
     qos_graph_destroy();
-- 
2.20.1


