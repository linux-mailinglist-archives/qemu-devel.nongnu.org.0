Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9C51FD02
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:35:41 +0200 (CEST)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2c0-0007Vr-FW
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22l-0007xx-RK
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22k-0001GV-2x
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id v12so19069501wrv.10
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/2ZMkN9Xsn+WNKUQIXzmZMqbQpeIw+bxxGpIjA8E3Ao=;
 b=l4ZNMlirTm4jFEKyH1tpc0j3xlzehgGzioDJWL05w9XOgLsaJIeq6w5tszXyD543nZ
 t7jajeAuCPan9Di0Q2t7NbGHQRxi4Led7im8J2Hjc8tg/DzkzuWLdex8kJyL/+KbEE9z
 n9Q1DnUkvSv0U0poBmNY7fGVYkwgvoTgjsmZk8VgwdJQCwaSF8LCLKaTA0sg80WHJaQ4
 pdcsCfjZPwHveFc9c4DCQLEgAKp04P2Nb/+ILeTyYQtWH01wVC0Q9R1bR3fH2Cg0iUuR
 ej6x9JtB5uz529eUQob89StfF5Rj4Rk1FEfS+cOnyraA4c7edmaibPZ9lrWOgpJHXCKu
 sCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2ZMkN9Xsn+WNKUQIXzmZMqbQpeIw+bxxGpIjA8E3Ao=;
 b=auVq7LqxBcujvIN4aQ+LqvkNwiEdhWmYr/Euhyh5tXeETUOSU7IQ5j4DZdMrGJBnSX
 Lf+x909VcfqTLaoGEGydpXwuM46bq+ehzBZvx591cAZtgNE42GxUJnk55oor+GA+qnkL
 fRVxA1nHOcdsVock55IAP1JkOYNTKMLywbOzzI/vMP53YFLuUFOuujWyLO2oLhvSXXF1
 94obOxsMu5IeHTV5dBk/lCCXi2BEJezeqKh6tsMsLmaQ6UQRn8hMiqXJCc/fi9BwlzbY
 raVKRA5Bc6d6T5bkzlUNSMs5h8T/jAgsD9b0tMFt/uHYkXMzLEcASF3VVXnTLTFGLkKg
 e3KA==
X-Gm-Message-State: AOAM533bRnkmuUoGgkY5g3QrqpP0lilen1/1+3NiubwVIrY9bZCEexpQ
 lWclcNdtugEJqD6x3+7234M7qr2dL/8rFg==
X-Google-Smtp-Source: ABdhPJyqYCgRyZnWW1/pLVjE1clg8t/VPQ0ztvIFlu6X0Q5/vB/AlWpYZozBEhfLVHo7o2PQIDllMw==
X-Received: by 2002:a5d:6d0b:0:b0:20c:4ecb:1113 with SMTP id
 e11-20020a5d6d0b000000b0020c4ecb1113mr13324221wrq.203.1652097553312; 
 Mon, 09 May 2022 04:59:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/32] qtest/numa-test: Specify CPU topology in
 aarch64_numa_cpu()
Date: Mon,  9 May 2022 12:58:44 +0100
Message-Id: <20220509115848.3521805-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Gavin Shan <gshan@redhat.com>

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
Message-id: 20220503140304.855514-3-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 749429dd27e..976526e5275 100644
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
2.25.1


