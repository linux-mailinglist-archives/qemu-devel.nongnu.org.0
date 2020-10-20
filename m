Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E8287C6E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:23:16 +0200 (CEST)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbVT-0000xi-16
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <cd6975a177d3664b593861e94eb3027430523f31@lizzy.crudebyte.com>)
 id 1kQbMB-00063W-4p
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:13:39 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <cd6975a177d3664b593861e94eb3027430523f31@lizzy.crudebyte.com>)
 id 1kQbM9-0005GT-NR
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Cyyld5a/6X2z/GHtUILwJZBN75BuasEc9WQ7betFIyk=; b=oucZx
 BHQQbm+cxkoSB/2rhtDymtg9SBsQ4xnEkEsv8yPzVsTr5U/S6M8L9IDfLB1WwiDXIYaTVCVKwMQYf
 fuYKbEUextCi4gI7DEnbCrJiwWRShWuPyJHKPvHpZdpveuw5tqxTqkgGJr5+BprTaevJ088+jqqg0
 LROSXza6W/9WQ1KxlqRRAVtuwKpjeWWyZ57SdYfm9NEd4PmXbU9uciHnvK+V9ie3ekK4jbkaElC7w
 Nj0BjI/1dt+vzDA575BJ7Rtv0Zf38enuKtlriHb0IppZTCSj/FVGgyhhnktw5kbImPPJGccB2Sfiv
 kSzxQI0k7Iffs1rSwdODQJa+E0Nyg==;
Message-Id: <cd6975a177d3664b593861e94eb3027430523f31.1602182956.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1602182956.git.qemu_oss@crudebyte.com>
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 8 Oct 2020 20:34:56 +0200
Subject: [PATCH v4 05/12] tests/qtest/qos-test: dump qos graph if verbose
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
    Laurent Vivier <lvivier@redhat.com>,
    Paolo Bonzini <pbonzini@redhat.com>,
    Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
    Greg Kurz <groug@kaod.org>,
    "Daniel P. Berrangé" <berrange@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=cd6975a177d3664b593861e94eb3027430523f31@lizzy.crudebyte.com;
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

If qtests were run in verbose mode (i.e. if --verbose CL argument was
provided) then dump the generated qos graph (all nodes and edges,
along with their current individual availability status) to stdout.

See API doc comment on function qos_dump_graph() for details.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/qos-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 8fdf87b183..d98ef78613 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -322,6 +322,9 @@ int main(int argc, char **argv)
     qos_set_machines_devices_available();
 
     qos_graph_foreach_test_path(walk_path);
+    if (g_test_verbose()) {
+        qos_dump_graph();
+    }
     g_test_run();
     qtest_end();
     qos_graph_destroy();
-- 
2.20.1


