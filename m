Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CFF4953EE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:15:52 +0100 (CET)
Received: from localhost ([::1]:55832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbyR-0008Hv-Be
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:15:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgN-0004Bb-Ew
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:52 -0500
Received: from [2a00:1450:4864:20::329] (port=52762
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgJ-00039A-5K
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:50 -0500
Received: by mail-wm1-x329.google.com with SMTP id v123so11818234wme.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rCjIbhNJEV5uXq9iZ6Ai9C5gkbO0LGE04ar7InRdZ14=;
 b=yi6ryGTObW5zXlEuCrydUZkyR8SBkctS5/TC8nrVfkc1wweUC123PAnIysUCdZD1or
 n5g3nK38BqbLm6DEALHMiIQPQkrxv/z9e3eM5qH9hbtbfMjHce3ZtfH7T0VdzH4NhP/r
 D+Jc4ELDP5bWCBVq7r8sp+eZQXoqVzuioQKfglf9z77JU3RxdS6H9qU08dKta62eHYdB
 rzPwqtXlym7qd2DvBZkBanZU0CLj2kO37xrCCDidVxcU5t3g9sIg8/ewyY0uWtfAup+W
 yNo2t0g6QEqM/9IL14oD8O7J/oh3znkDF6dwPXpHr8U+A1ktRwSKQzdZ5JZZwNe1n1q+
 QwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCjIbhNJEV5uXq9iZ6Ai9C5gkbO0LGE04ar7InRdZ14=;
 b=prik3kSNToZYtPL+hwQ+O6/AkwmGkpq79GhWh1piXQ3B5AYOAX30xPKXmthOxd7TuM
 3aQj0VU7HL8EmbTxGBs+7K3UZJDEyW60Xcn3rIIwbfELsXMAzqHzbU6Ji/hsuCWeue0t
 QsIgvWWVvXKscqn5Ex6VKCeYa/k6/ZEtjeusMtozSmQDUWVXjZ+BYmex68pGmavGzdEs
 78Duh2MZ3OCoRJgUp2FEl9HQAHlufrgJ0hnQ4xmNot9hVioRf9XZNIWSsY6uCYjNQy5o
 oQiMoie+Ohs6+1OEpmmsVCtZhJodcOk72oMbLXLA3jLkL91k1xXMSeeW8sYKb8JIwIIW
 wG0w==
X-Gm-Message-State: AOAM532BMzFKp7+CDgZQjorEC+1kAl/MSJIH0K9kkwjas07WxbnVJKZR
 0dECs/2HfQjbZYGdz3/jPyY4iAAHx1g07g==
X-Google-Smtp-Source: ABdhPJxU2xXxx/mdrrWujr71VJOlml7jf5lwYwnMMaERQ1YzwPWOQvuhXvpIFAfqTpMHV8w9jZHAzQ==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr15679793wrd.390.1642682200559; 
 Thu, 20 Jan 2022 04:36:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/38] hw/acpi/aml-build: Support cluster level in PPTT
 generation
Date: Thu, 20 Jan 2022 12:36:01 +0000
Message-Id: <20220120123630.267975-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Yanan Wang <wangyanan55@huawei.com>

Support CPU cluster topology level in generation of ACPI
Processor Properties Topology Table (PPTT).

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20220107083232.16256-6-wangyanan55@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/acpi/aml-build.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6aaedca2e56..bb2cad63b53 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2001,6 +2001,7 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
 void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     GQueue *list = g_queue_new();
     guint pptt_start = table_data->len;
     guint parent_offset;
@@ -2025,6 +2026,23 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
             0, socket, NULL, 0);
     }
 
+    if (mc->smp_props.clusters_supported) {
+        length = g_queue_get_length(list);
+        for (i = 0; i < length; i++) {
+            int cluster;
+
+            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
+                g_queue_push_tail(list,
+                    GUINT_TO_POINTER(table_data->len - pptt_start));
+                build_processor_hierarchy_node(
+                    table_data,
+                    (0 << 0), /* not a physical package */
+                    parent_offset, cluster, NULL, 0);
+            }
+        }
+    }
+
     length = g_queue_get_length(list);
     for (i = 0; i < length; i++) {
         int core;
-- 
2.25.1


