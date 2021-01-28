Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D2307D2D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:57:16 +0100 (CET)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BXf-0002sP-Bj
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5BJU-00084n-Ov; Thu, 28 Jan 2021 12:42:36 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:46094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5BJM-00085y-0m; Thu, 28 Jan 2021 12:42:36 -0500
Received: by mail-qt1-x82a.google.com with SMTP id l23so4649771qtq.13;
 Thu, 28 Jan 2021 09:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YTqzweLn4Nj+ousw+UGIhpuXZgoifpb7xTlV7lJFO3k=;
 b=l5w/z/zUY0+jJ2OpzHmSS2IloOypY/JmC125vyKuxiRJERcNNMXhXIx+Giu2Emv7it
 gPMpSFQO9QbzbNpS1QpthVkU2LS8kznpOLShreUx+iAH7MHw8ONJenFzU4fXxjZU/by2
 SCv7v8lE5ioLlpH0fQMOVkAZqw9eqGQ8yJ3YF4k1zSBfhZJfU5RfI+7pAwxSxfSV6Waq
 W5t6GXmHnzK3fxXZRWZcS5ru5q75BCJtV1EkW0yc5kKBtmreM+GE3gUs1otB/lVjFXD7
 FZ1Yokx1KZrghUGl3cIQu0aOOm2dh5MqeCb1OSJ7ufKStDuTvYOXJjSnFLl4CZcRlSYr
 9pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YTqzweLn4Nj+ousw+UGIhpuXZgoifpb7xTlV7lJFO3k=;
 b=k3mZlSqHv7y6ogvxzUSggK5qfOsaP5PNGEsgHJRlmUL+hKWFz+YlZZ8kggz79PGoN7
 /tUizfHn0bB47+7JtlvSRKx+V3xmzOTuWg9F6/qmkXZxpR3x8ySaDGswXSiqnt8cSjTj
 gEswt8QpwPB7W2ITJnsGwPRsH1DlEoOCImwXXWTdjDQhkZ2Kkf5aGQxnMU3RrZf4xo0o
 Afmw3WpWeOGc9Xv+34kcpSDcorvwLELIGjIRO4xv5tDYknchEwqxv+rj9nAO8LW/21/A
 p6F77RTytMFsXRAA3265vpNeAY/+eXWq0uP+d5eIE7WMmA2zFL4inJAkA821zTFJUySY
 Gjhw==
X-Gm-Message-State: AOAM532se//snEWnRI1B0BuxAlHYkcwAo5JBHmZa+tLN1s6b7ARkkstp
 44hYu1SDzkjXnWoquI1EFD8ROxi7Mb8=
X-Google-Smtp-Source: ABdhPJxlRAkVqQTt223efhe48FzjyR9KOc9stiaD8i7Rzd8eUCom5LT70sEBc8PQpGplQiBaZaAuwA==
X-Received: by 2002:ac8:710d:: with SMTP id z13mr586024qto.329.1611855745270; 
 Thu, 28 Jan 2021 09:42:25 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id i8sm3804038qtr.84.2021.01.28.09.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 09:42:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] spapr: move spapr_machine_using_legacy_numa() to
 spapr_numa.c
Date: Thu, 28 Jan 2021 14:42:11 -0300
Message-Id: <20210128174213.1349181-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128174213.1349181-1-danielhb413@gmail.com>
References: <20210128174213.1349181-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is used only in spapr_numa.c.

Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         | 9 ---------
 hw/ppc/spapr_numa.c    | 9 +++++++++
 include/hw/ppc/spapr.h | 1 -
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6c47466fc2..2d60c6f594 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -295,15 +295,6 @@ static hwaddr spapr_node0_size(MachineState *machine)
     return machine->ram_size;
 }
 
-bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
-{
-    MachineState *machine = MACHINE(spapr);
-    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
-
-    return smc->pre_5_2_numa_associativity ||
-           machine->numa_state->num_nodes <= 1;
-}
-
 static void add_str(GString *s, const gchar *s1)
 {
     g_string_append_len(s, s1, strlen(s1) + 1);
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index b50796bbe3..261810525b 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -19,6 +19,15 @@
 /* Moved from hw/ppc/spapr_pci_nvlink2.c */
 #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
 
+static bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
+{
+    MachineState *machine = MACHINE(spapr);
+    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
+
+    return smc->pre_5_2_numa_associativity ||
+           machine->numa_state->num_nodes <= 1;
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index c27c7ce515..ccbeeca1de 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -851,7 +851,6 @@ int spapr_max_server_number(SpaprMachineState *spapr);
 void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
                       uint64_t pte0, uint64_t pte1);
 void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
-bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr);
 
 /* DRC callbacks. */
 void spapr_core_release(DeviceState *dev);
-- 
2.26.2


