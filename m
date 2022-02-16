Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD24B85FF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:39:48 +0100 (CET)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHit-0002W9-Vi
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:39:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVj-0000qo-2C; Wed, 16 Feb 2022 05:26:11 -0500
Received: from [2607:f8b0:4864:20::1031] (port=44804
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVh-0005Im-Hi; Wed, 16 Feb 2022 05:26:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so1947537pjh.3; 
 Wed, 16 Feb 2022 02:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RwN2ENv+FQz68DkGfO0cMbM+F5Qw9FausFcvvyZLN0I=;
 b=YvKTRDVkClCqFYPSgTKKmS7QEtTyR4xB6RhLRoDH6ySZm6BGEvRaeiSsCtp5mC74rd
 sBFgp8R+3jUHBoH9BA0YwtkQhCYUSSwJceNesAngUIB0ICBKvXMpfIziz/jcOQQK3zGR
 6bRkGNLhNWRqhl4p2CaFsmoqLemWCbYOdhpiYsXhNd/h5HnfwRY2mjmcECi7oaqEL/wA
 udllABS7T0EGoQN9SAP6NkLfBx/M6Vq5b0z9A4H4MG0FfBNT03N4/lqxC7EAxzYSzXpo
 RdgMWJ+MlXXyerWxEnNeseja4w9A096SNFtErqmvJsvfinbTR1GJTGWuC490kZhNxo/f
 9N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RwN2ENv+FQz68DkGfO0cMbM+F5Qw9FausFcvvyZLN0I=;
 b=5FV+o12z4hZYA0pNc4MjYo4esA8Bd1GFmVO1BunXQLEvPSPiWb9FSJULDsg8aD0Gke
 +wnFeE5BFubpkTOJGl7OfpoGW/RBbFTOqEWhH/5BJlztFDGTpBmM7KDXDA7q/4wBpLTP
 SnYhpajN9xNPXxOA+xcoVsC4mnp6TXsEGrlGc1bUr67wTYGg4MlFTb7PK+oBxYlwCO4J
 AMnPabadB1v4csL3YmzIsqFeLZn/e6V9X4pEsusHQYmoOkhnHT0yCFLEqV8pjL6CjaDx
 6fFp7FebRGGLks9nsDdENd+OioUj7uP+CYqa9tUloDSdMhovQMPHk7hajoIKLh3SiBrj
 WmbQ==
X-Gm-Message-State: AOAM532+u0nWNruBoSIm0gOv6DIB9hYo24YAN2gplBL4jqpFt6b2igXU
 p/ueEbaz2YT2bQRzVN62uAs85svCk/U=
X-Google-Smtp-Source: ABdhPJyZsVr7D8t0/od69tOQc0zW5EYKWHIFI2Nd4S275hSKTbfnbgy+7uWoPEaG0Vmlf0ROrlIKGA==
X-Received: by 2002:a17:902:da84:b0:14e:eb44:40c3 with SMTP id
 j4-20020a170902da8400b0014eeb4440c3mr1699430plx.167.1645007167829; 
 Wed, 16 Feb 2022 02:26:07 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:26:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 3/9] ppc: allow the hdecr timer to be created/destroyed
Date: Wed, 16 Feb 2022 20:25:39 +1000
Message-Id: <20220216102545.1808018-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216102545.1808018-1-npiggin@gmail.com>
References: <20220216102545.1808018-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machines which don't emulate the HDEC facility are able to use the
timer for something else. Provide functions to start and stop the
hdecr timer.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/ppc.c         | 21 +++++++++++++++++++++
 include/hw/ppc/ppc.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index c6dfc5975f..ad64015551 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1083,6 +1083,27 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     return &cpu_ppc_set_tb_clk;
 }
 
+/* cpu_ppc_hdecr_init may be used if the timer is not used by HDEC emulation */
+void cpu_ppc_hdecr_init(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    assert(env->tb_env->hdecr_timer == NULL);
+
+    env->tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
+                                                 cpu);
+}
+
+void cpu_ppc_hdecr_exit(CPUPPCState *env)
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
index 93e614cffd..b0ba4bd6b9 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -54,6 +54,9 @@ struct ppc_tb_t {
 
 uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset);
 clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
+void cpu_ppc_hdecr_init(CPUPPCState *env);
+void cpu_ppc_hdecr_exit(CPUPPCState *env);
+
 /* Embedded PowerPC DCR management */
 typedef uint32_t (*dcr_read_cb)(void *opaque, int dcrn);
 typedef void (*dcr_write_cb)(void *opaque, int dcrn, uint32_t val);
-- 
2.23.0


