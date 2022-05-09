Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E551FD1A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:41:52 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2hx-0004VY-TS
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22m-00080v-HL
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22k-0001Gn-SY
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id e24so19108668wrc.9
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6W3Bgjhq7uaaxAYbIx+7B2aztwb5IVXKMxHtE0WnVww=;
 b=CPn8Bn/vAYWKn46fra/DRUcRidfnJryBmxNl0fvRCsXtffs50QG+/N0qbv3ncn7d1O
 jnjvuaD8ouB6A8jyBx08uvlZ4lfPEWfauxhJ7HOMQVFeYWB/R84XOw1rwWdmCxD8EkgM
 kQ3fsO8JDHWQxOiunUE55uJGoKfQt22o1X99bfyoClewSaABTgh+5+rq4v1/CJ6ESguy
 DBeJma18ICQ3f2Gui+wrepq3sE8iQok63takUTdqQPywp5KSDJ4mTo6NN2oDdGg3UkXA
 N3DwVNyCjOgbcBpAuBuedhNIDK8YRzZoDj06kV62M5rTSn7Fcq7Oe3psX5WZbjExjKtf
 gSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6W3Bgjhq7uaaxAYbIx+7B2aztwb5IVXKMxHtE0WnVww=;
 b=dlGc4onaubhUi1k93ogPupjhjBpG1eTmyqocPR30ForiMAx93KPwNup96MEZ5cYR/S
 NNrkvzLg+kVrRKIkPtwd7TAu1k1yF7UYPUKm+vF+yabikMojhUT6hi5uN/E4kwo8wY9c
 xdadRqz4d6iZInaMLks+DLCsoq9ZZj4yXvTVgAaz+GdSnV7KXvblc+KDSqLFdO3cDSme
 lzp1khG/ZV8RCWeKU73pJUJzskvwKANWoFORSuaVTkW/ADGQw0i7qhAIVMjcrKOJ7XhM
 dHwLyljO7uSZaJ+mkeo2lUZHW8CYUOp5Z8WPMVJ9nWCkBvHbsWv970tIgwB5/5xwaIkS
 3NvA==
X-Gm-Message-State: AOAM531Yn/pA0pemELecIbClI63KrEb7cC422GAVBsGfhwFbMzGdh/bF
 YrKry+fN15X2+1ixDQHlemzdwUWqOxfI2Q==
X-Google-Smtp-Source: ABdhPJwLylZfdMDGNQVnFtSsA9JSGXunisMMJyrFHGBj/6XMxfIJ0h5qTBzpo3RAI2lhyUx9ViI4eg==
X-Received: by 2002:a05:6000:1f91:b0:20c:d301:2a57 with SMTP id
 bw17-20020a0560001f9100b0020cd3012a57mr229462wrb.400.1652097554161; 
 Mon, 09 May 2022 04:59:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/32] hw/arm/virt: Consider SMP configuration in CPU topology
Date: Mon,  9 May 2022 12:58:45 +0100
Message-Id: <20220509115848.3521805-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Currently, the SMP configuration isn't considered when the CPU
topology is populated. In this case, it's impossible to provide
the default CPU-to-NUMA mapping or association based on the socket
ID of the given CPU.

This takes account of SMP configuration when the CPU topology
is populated. The die ID for the given CPU isn't assigned since
it's not supported on arm/virt machine. Besides, the used SMP
configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
to avoid testing failure

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20220503140304.855514-4-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index da7e3ede563..c25023a083a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2562,6 +2562,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
 
     if (ms->possible_cpus) {
         assert(ms->possible_cpus->len == max_cpus);
@@ -2575,8 +2576,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
+
+        assert(!mc->smp_props.dies_supported);
+        ms->possible_cpus->cpus[n].props.has_socket_id = true;
+        ms->possible_cpus->cpus[n].props.socket_id =
+            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
+        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
+        ms->possible_cpus->cpus[n].props.cluster_id =
+            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
+        ms->possible_cpus->cpus[n].props.has_core_id = true;
+        ms->possible_cpus->cpus[n].props.core_id =
+            (n / ms->smp.threads) % ms->smp.cores;
         ms->possible_cpus->cpus[n].props.has_thread_id = true;
-        ms->possible_cpus->cpus[n].props.thread_id = n;
+        ms->possible_cpus->cpus[n].props.thread_id =
+            n % ms->smp.threads;
     }
     return ms->possible_cpus;
 }
-- 
2.25.1


