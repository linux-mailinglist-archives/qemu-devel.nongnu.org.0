Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE9151FCB1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:25:28 +0200 (CEST)
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2S5-0001ZP-Uf
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22o-00086r-U2
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:18 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22n-0001MO-C1
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 125-20020a1c0283000000b003946c466c17so47404wmc.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GAKojUArTipjlz2CUBGk94csiNAnp/cdOHeIZmJ/G7k=;
 b=a6suQOZdhGln2FMk/CT5buKH0UElF3/j1XNo9et4bw33WoQtHs4W0LXGF2Nxbi38Nv
 QerNQEpYthuSNLAfG33r2xsoUC9758SOHyGsAwgDGkypkmkq2DBN+iTmH5tgKzIqro+A
 epWR1XBsRnX7cf5rHiwEWDnzjx2wo96AVSS4FjWJPfyfLEohlzdljuFp0qcovJeWUs4j
 /XlxKatr/9HIgPLH2md2hYz+NbPcWy6DJG/s12nCCZCKed+D2N1mJwtP2U81wo/2JsyK
 +9au6IS+aoQLua9+xgTApDvN7QojDaN6vu2hV8fZWE0LrPxNzvEKvKrrIsibFbFXX4Ep
 60Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAKojUArTipjlz2CUBGk94csiNAnp/cdOHeIZmJ/G7k=;
 b=3OHzU8sEUsLhuK9TqGByiuLXNrrN+GQkv4IEslA6fsBfLgLTxjm+NpTmnqKiOFGNHB
 +zLaHhXhqDw8l525HxrX3fYNtk4jdzSfplSb1fyL1YKPTQGbe0wBp39aqZe19uqxaAXc
 m0GR5q9f1Yze00btmwEiOJcDJwndIL2HYauAKUYeUShg8PoQ2/uWcc61TPiopT/FdrGH
 crC7EqqEUr+CkMwGeRttLMuyOhvfC1Ah/yGb/gx+JUhYlFrRMZM5kFnHAD/D32tpt98L
 HDgJOItX8SndP4mUQNOVjCtD+z0hD0N0sUMwPtNRM5L0wtH0i6/RqNaIMhTqRonZSEKr
 Gm9A==
X-Gm-Message-State: AOAM5333ThC4wrKKWfYAUkDM30Rrfv8kCUKyCpnNY1QGlI+eRWhyzyeW
 kp4w7kPz8YxrXO/Bv4CzZH/3HjtM/5sF8g==
X-Google-Smtp-Source: ABdhPJybtteFGKKe+afAYBYTrmmO9T/SObzgzj0VpDhMXPvfg5Lk0zzIWDhNDPaBivU25KNe760aiQ==
X-Received: by 2002:a1c:4b12:0:b0:394:3558:a95e with SMTP id
 y18-20020a1c4b12000000b003943558a95emr15556137wma.147.1652097556035; 
 Mon, 09 May 2022 04:59:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/32] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Mon,  9 May 2022 12:58:47 +0100
Message-Id: <20220509115848.3521805-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

When CPU-to-NUMA association isn't explicitly provided by users,
the default one is given by mc->get_default_cpu_node_id(). However,
the CPU topology isn't fully considered in the default association
and this causes CPU topology broken warnings on booting Linux guest.

For example, the following warning messages are observed when the
Linux guest is booted with the following command lines.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host                                               \
  -smp 6,sockets=2,cores=3,threads=1                      \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=128M            \
  -object memory-backend-ram,id=mem1,size=128M            \
  -object memory-backend-ram,id=mem2,size=128M            \
  -object memory-backend-ram,id=mem3,size=128M            \
  -object memory-backend-ram,id=mem4,size=128M            \
  -object memory-backend-ram,id=mem4,size=384M            \
  -numa node,nodeid=0,memdev=mem0                         \
  -numa node,nodeid=1,memdev=mem1                         \
  -numa node,nodeid=2,memdev=mem2                         \
  -numa node,nodeid=3,memdev=mem3                         \
  -numa node,nodeid=4,memdev=mem4                         \
  -numa node,nodeid=5,memdev=mem5
         :
  alternatives: patching kernel code
  BUG: arch topology borken
  the CLS domain not a subset of the MC domain
  <the above error log repeats>
  BUG: arch topology borken
  the DIE domain not a subset of the NODE domain

With current implementation of mc->get_default_cpu_node_id(),
CPU#0 to CPU#5 are associated with NODE#0 to NODE#5 separately.
That's incorrect because CPU#0/1/2 should be associated with same
NUMA node because they're seated in same socket.

This fixes the issue by considering the socket ID when the default
CPU-to-NUMA association is provided in virt_possible_cpu_arch_ids().
With this applied, no more CPU topology broken warnings are seen
from the Linux guest. The 6 CPUs are associated with NODE#0/1, but
there are no CPUs associated with NODE#2/3/4/5.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-id: 20220503140304.855514-6-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c25023a083a..1a45f44435e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2554,7 +2554,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 
 static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
-    return idx % ms->numa_state->num_nodes;
+    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
+
+    return socket_id % ms->numa_state->num_nodes;
 }
 
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
-- 
2.25.1


