Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF91F4B61A0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:28:53 +0100 (CET)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoWK-0000ux-PK
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKs-0006l9-Dx; Mon, 14 Feb 2022 22:17:03 -0500
Received: from [2607:f8b0:4864:20::431] (port=33377
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKq-0002f1-F4; Mon, 14 Feb 2022 22:17:02 -0500
Received: by mail-pf1-x431.google.com with SMTP id d17so4466452pfl.0;
 Mon, 14 Feb 2022 19:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnYRG873D2GVOFro7Kv9ELG7pkTSQbjXdYbn8vZtzXw=;
 b=KR3zypaQeWCeUYvShEFup7kCLA5gxI7IJHiWlVmunRt4rwHlSE1nmceerzGwJFxZM/
 MOc1/hhkVv3yFDwg2w5qmtzNEU1qJ3FgaUdVA344NXXzJsbdDLb23GdZZ2P+AsQW3OJH
 hiREcUB6b1lxVscNMwNJxZriIg/qnfZoOwqNmMhpX902erJF/73mh9B4swLMeTjPSR7N
 WFxpvicQIu3mo5yu5e7RCd4mtdemYmTdyJMoZeHCsHweKWssu5KEafZuEEaflndYczDb
 KNlMsTpl2OdV2rmkzTRCWJWkr2EeJLar4Jy3HeOLN9bVVznULPBOJ8ixg2OlAcl8j0Bi
 xECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SnYRG873D2GVOFro7Kv9ELG7pkTSQbjXdYbn8vZtzXw=;
 b=KCjiGUaqBoDOawW7CxKcnNnGpJKlNNh3fEOw5LrHfLjGayxQVB0Rn/im7odL8OGoaK
 pQus4R0WKczsyUtXUAz12j/oWG3WjkHR2OkoM1nhmTewtSEvWfkGiTO8rbIQ8ObfNjF2
 DA60R4jMpk8lIWO6+XwrAHjdgi555JIcdAgBBujl+LOkiJlsSzN4VQ309JCsquOP0Jju
 9JnfrDIiQm8RbSFcHpfSq/9F/kpBhN2l6FV+e5e5NcpG4NfqPQW3liR3wXYHUNjMxFtk
 kckxgBrUc76XCQoH6OJ0M/zW0DcDJhUBXJSEqFrvk9HTmlrmSXPXFb+ZVz9hXUxAbwjB
 PJZg==
X-Gm-Message-State: AOAM531pcWGucA90DQLriH8dQrK2pY092oZpnhxgndferjJc5n10Xg07
 z2eb889sODzg4X4NtZ/M90D2U05vKhw=
X-Google-Smtp-Source: ABdhPJz9VtLQfJi1+DqLXd7yjcG76UdDa8KCv57N7xXbMX/EtnM70vtZNq6wSFo7dGPlH8gx81iqBw==
X-Received: by 2002:aa7:81c9:: with SMTP id c9mr2098908pfn.9.1644895018794;
 Mon, 14 Feb 2022 19:16:58 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:16:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 3/9] ppc: allow the hdecr timer to be created/destroyed
Date: Tue, 15 Feb 2022 13:16:36 +1000
Message-Id: <20220215031642.1691873-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machines which don't emulate the HDEC facility are able to use the
timer for something else. Provide functions to start and stop the
hdecr timer.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/ppc.c         | 20 ++++++++++++++++++++
 include/hw/ppc/ppc.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index c6dfc5975f..4bfd413c7f 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1083,6 +1083,26 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     return &cpu_ppc_set_tb_clk;
 }
 
+void cpu_ppc_hdecr_init (CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    assert(env->tb_env->hdecr_timer == NULL);
+
+    env->tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
+                                                 cpu);
+}
+
+void cpu_ppc_hdecr_exit (CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    timer_free(env->tb_env->hdecr_timer);
+    env->tb_env->hdecr_timer = NULL;
+
+    cpu_ppc_hdecr_lower(cpu);
+}
+
 /*****************************************************************************/
 /* PowerPC 40x timers */
 
diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index 93e614cffd..fcf9e495a0 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -54,6 +54,9 @@ struct ppc_tb_t {
 
 uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset);
 clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
+void cpu_ppc_hdecr_init (CPUPPCState *env);
+void cpu_ppc_hdecr_exit (CPUPPCState *env);
+
 /* Embedded PowerPC DCR management */
 typedef uint32_t (*dcr_read_cb)(void *opaque, int dcrn);
 typedef void (*dcr_write_cb)(void *opaque, int dcrn, uint32_t val);
-- 
2.23.0


