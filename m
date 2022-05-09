Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171451FD1C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:42:54 +0200 (CEST)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2iz-0006uy-3r
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22n-00084Q-L6
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22l-0001Gm-TB
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j15so19134476wrb.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=egnDhnogUFgFI8NqjtDufQtOvQlPRiqNP9maTORnA4Y=;
 b=xARfycHHZW+7WWW36+c73ICNdjD0DN00UKN9s+aaJfKMEmkXmMvdPYKrRPIiL1svKs
 0k0qNgaw7N4XM4yyEhnNgV1FF7J74WN/eaIyGM5Hq511Fmj+/mKBMYzZnjd73xw7vA+L
 w3CUHNaGdHJKVXW+HV2l+jR1hoxqjAq1oFBIGXOikFFked0x3Ru2/vyPWL2GMrU3JlAl
 kJthWaZcpNISn9vlR3qfDQGck0ZDRGu0shuwFJb5+cSnqA2Tzo1ZImg6F6JNlIDDpGXh
 /vo/RYpF1fF59CL/F1lLJKBY0Kd8llJstW72+dbXkqKuqNu3JloADEwpFDlr1m7tMOFd
 YE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egnDhnogUFgFI8NqjtDufQtOvQlPRiqNP9maTORnA4Y=;
 b=hxVgyIIes7lhZ+BlX996RPr/a6FaftoEdbEAu3f38slW9+Tw1I3fueoQSt2uXaFmTL
 8wsw42WK2oGJc9bz5kX8Qm4/9T/Kju1Xeb0fCelct7TD2XE2DKGRXbe+pUOJMtknKc/P
 kAz6dGHYpz2f7XK3WLCGZmcQdkFwrQt6NyIsWEqf7UgiIAiXkuO1u+ukeVd+/92IvQsx
 Ixl6hQBe2RaviPrQRBZi+f+QmLlS99qX/Xv42962oUde30dqbbBeGYTOlx5G5kMlXFHN
 UFp1zJpd0amAQ6zYpQSkv3uVV/VxMsylMgr3vL3h5yO4ctRac8+DwOgrcqZcqsfaASMJ
 WPfQ==
X-Gm-Message-State: AOAM5326vdwwsy7tZ8lbXzRghLH/WjaLPi6hZCXb5bl9CF6et0sRQ8XL
 21Uj+KHpqTOIFjJrJpYUnM0chkLyHcUO1g==
X-Google-Smtp-Source: ABdhPJyijoNLg9bVrlv9n28NHesTZOF6Sgn93diA2SO3DDZtCXcc0oOKXwOTJHLoy+FGq4LxuRncfg==
X-Received: by 2002:a05:6000:2ae:b0:20c:57b6:32e1 with SMTP id
 l14-20020a05600002ae00b0020c57b632e1mr13351598wry.285.1652097555057; 
 Mon, 09 May 2022 04:59:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/32] qtest/numa-test: Correct CPU and NUMA association in
 aarch64_numa_cpu()
Date: Mon,  9 May 2022 12:58:46 +0100
Message-Id: <20220509115848.3521805-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

In aarch64_numa_cpu(), the CPU and NUMA association is something
like below. Two threads in the same core/cluster/socket are
associated with two individual NUMA nodes, which is unreal as
Igor Mammedov mentioned. We don't expect the association to break
NUMA-to-socket boundary, which matches with the real world.

    NUMA-node  socket  cluster   core   thread
    ------------------------------------------
        0       0        0        0      0
        1       0        0        0      1

This corrects the topology for CPUs and their association with
NUMA nodes. After this patch is applied, the CPU and NUMA
association becomes something like below, which looks real.
Besides, socket/cluster/core/thread IDs are all checked when
the NUMA node IDs are verified. It helps to check if the CPU
topology is properly populated or not.

    NUMA-node  socket  cluster   core   thread
    ------------------------------------------
       0        1        0        0       0
       1        0        0        0       0

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20220503140304.855514-5-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/numa-test.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 976526e5275..c5eb13f349f 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -224,17 +224,17 @@ static void aarch64_numa_cpu(const void *data)
     g_autofree char *cli = NULL;
 
     cli = make_cli(data, "-machine "
-        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
+        "smp.cpus=2,smp.sockets=2,smp.clusters=1,smp.cores=1,smp.threads=1 "
         "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
-        "-numa cpu,node-id=1,thread-id=0 "
-        "-numa cpu,node-id=0,thread-id=1");
+        "-numa cpu,node-id=0,socket-id=1,cluster-id=0,core-id=0,thread-id=0 "
+        "-numa cpu,node-id=1,socket-id=0,cluster-id=0,core-id=0,thread-id=0");
     qts = qtest_init(cli);
     cpus = get_cpus(qts, &resp);
     g_assert(cpus);
 
     while ((e = qlist_pop(cpus))) {
         QDict *cpu, *props;
-        int64_t thread, node;
+        int64_t socket, cluster, core, thread, node;
 
         cpu = qobject_to(QDict, e);
         g_assert(qdict_haskey(cpu, "props"));
@@ -242,12 +242,18 @@ static void aarch64_numa_cpu(const void *data)
 
         g_assert(qdict_haskey(props, "node-id"));
         node = qdict_get_int(props, "node-id");
+        g_assert(qdict_haskey(props, "socket-id"));
+        socket = qdict_get_int(props, "socket-id");
+        g_assert(qdict_haskey(props, "cluster-id"));
+        cluster = qdict_get_int(props, "cluster-id");
+        g_assert(qdict_haskey(props, "core-id"));
+        core = qdict_get_int(props, "core-id");
         g_assert(qdict_haskey(props, "thread-id"));
         thread = qdict_get_int(props, "thread-id");
 
-        if (thread == 0) {
+        if (socket == 0 && cluster == 0 && core == 0 && thread == 0) {
             g_assert_cmpint(node, ==, 1);
-        } else if (thread == 1) {
+        } else if (socket == 1 && cluster == 0 && core == 0 && thread == 0) {
             g_assert_cmpint(node, ==, 0);
         } else {
             g_assert(false);
-- 
2.25.1


