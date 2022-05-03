Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2EB518D5C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:43:33 +0200 (CEST)
Received: from localhost ([::1]:40390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyQm-0007Wp-3b
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlyOg-0005K1-FB
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlyOe-0007T1-Rm
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651606749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2XMVZRhXOlDx/eBFdoKp2/tHA7MKrCIRZ8NQgPVxYc=;
 b=YQpzOdHJJNE5oNz/8CnosipvB/ywzRGaC3WmsvNHPr5XVyukww1oKxEq81wb3xNovB8+rn
 G8GiMxK36ILg7TLOXs6+q5eP5PRa+oJB+yYd3jGfjEvmv5C+GOGANDt71ZCPr2kPT5tKzP
 Gpp7U86nVp+AKJS2IUJ8/WK6R+eBpC0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-bxhqwJG8OlmLC0C_BUF4NQ-1; Tue, 03 May 2022 11:04:46 -0400
X-MC-Unique: bxhqwJG8OlmLC0C_BUF4NQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C40B9109B93;
 Tue,  3 May 2022 14:03:36 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A56C153841E;
 Tue,  3 May 2022 14:03:27 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, Jonathan.Cameron@Huawei.com,
 drjones@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v9 2/6] qtest/numa-test: Specify CPU topology in
 aarch64_numa_cpu()
Date: Tue,  3 May 2022 22:03:00 +0800
Message-Id: <20220503140304.855514-3-gshan@redhat.com>
In-Reply-To: <20220503140304.855514-1-gshan@redhat.com>
References: <20220503140304.855514-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The CPU topology isn't enabled on arm/virt machine yet, but we're
going to do it in next patch. After the CPU topology is enabled by
next patch, "thread-id=1" becomes invalid because the CPU core is
preferred on arm/virt machine. It means these two CPUs have 0/1
as their core IDs, but their thread IDs are all 0. It will trigger
test failure as the following message indicates:

  [14/21 qemu:qtest+qtest-aarch64 / qtest-aarch64/numa-test  ERROR
  1.48s   killed by signal 6 SIGABRT
  >>> G_TEST_DBUS_DAEMON=/home/gavin/sandbox/qemu.main/tests/dbus-vmstate-daemon.sh \
      QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon         \
      QTEST_QEMU_BINARY=./qemu-system-aarch64                                       \
      QTEST_QEMU_IMG=./qemu-img MALLOC_PERTURB_=83                                  \
      /home/gavin/sandbox/qemu.main/build/tests/qtest/numa-test --tap -k
  ――――――――――――――――――――――――――――――――――――――――――――――
  stderr:
  qemu-system-aarch64: -numa cpu,node-id=0,thread-id=1: no match found

This fixes the issue by providing comprehensive SMP configurations
in aarch64_numa_cpu(). The SMP configurations aren't used before
the CPU topology is enabled in next patch.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 90bf68a5b3..aeda8c774c 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=2 "
+    cli = make_cli(data, "-machine "
+        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
         "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
         "-numa cpu,node-id=1,thread-id=0 "
         "-numa cpu,node-id=0,thread-id=1");
-- 
2.23.0


