Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C202F693C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:19:16 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07DH-0004cf-D0
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071H-0001ws-Fu; Thu, 14 Jan 2021 13:06:51 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071E-00051h-U0; Thu, 14 Jan 2021 13:06:51 -0500
Received: by mail-qt1-x82b.google.com with SMTP id b9so4183068qtr.2;
 Thu, 14 Jan 2021 10:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7QBtqcNg7aG0gJ0K9jeHZaycMU0I9AIukcktQjr9V6s=;
 b=WIW2kTvedhfznMB+XvneXOUJR7P0FoDV4f+V+RsXr5b2bRPNhutiQP/Li5a0aA+zzu
 X5c6iRx9+aKQfQ9uYpy3G9mG0YKPyzFG60N8Db4KfRn9p2EbnvRXCIH25eiIeoKF0xQS
 JKG5nWovj7SZ89MHvs1Yr19bqj8bSIYPfju+/UDRSRlHPkClXQV5vqxVW93IxRzWMBhB
 EU5tZMB77KSg5LUyveDi4D4+dHbWujfXq5b+PatNqDD7fxxJen7hSNIoEBPokqiBWeez
 dIHKyKvMY+zTTrX2qzHMizGfGmDQKKlX/8xATW0X8RP8ub+2fp4t0aJEvghdvUP6ho0b
 eJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7QBtqcNg7aG0gJ0K9jeHZaycMU0I9AIukcktQjr9V6s=;
 b=NU5O/YUtHSlrBEoGYW4iwwJNJV2D5PLtagftxphOxfGSit+oxmCl9LoBghhFbjcWnp
 HEs1pqtobKwDB7D7pALZVafnhr/wRmzALVEHfNo0/o9Nz3JyX9Hs1l44hY7tY/Yys71M
 +fSmGOGvIptWf8iWnWkGfIox+5AkuTdpjFhlZTL9H/TOFN6nhBOyJS0a4hPhvxGJ90ji
 R/8bgff41XoyXpyqAXJmhM2lg77dcdNHNA0grhMFo843xJjT8TicOl04RttkSo0ZhLiK
 7i78vimDxEo2z5kE8wufi4vQIaQQh4YYNRHUq0CXG+XWelrh7qas7jFTpUC6Iuxwn0uW
 DgbA==
X-Gm-Message-State: AOAM530H1fB/5YLIDVqcoPKO7zk8Clc2HQjh3MX9OonRkrLddahHyDf0
 NBaKyYHrJib3YsgZHlbCe5DSWOoNrPKdaA==
X-Google-Smtp-Source: ABdhPJz/ifny92NVOEYCk3S1kXUhSIlTDxNfBSSQLFu/xy3jmyBJ2/7weuGzgpnEMviHnafKfLl4NA==
X-Received: by 2002:ac8:24ee:: with SMTP id t43mr8162730qtt.215.1610647607022; 
 Thu, 14 Jan 2021 10:06:47 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:b984:ff01:270:b51c:24a5])
 by smtp.gmail.com with ESMTPSA id a1sm3448129qkn.104.2021.01.14.10.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:06:46 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/7] spapr_cpu_core.c: use g_auto* in spapr_create_vcpu()
Date: Thu, 14 Jan 2021 15:06:26 -0300
Message-Id: <20210114180628.1675603-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114180628.1675603-1-danielhb413@gmail.com>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use g_autoptr() with Object and g_autofree with the string to
avoid the need of a cleanup path.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_cpu_core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 2f7dc3c23d..4f316a6f9d 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -277,8 +277,8 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
 {
     SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_GET_CLASS(sc);
     CPUCore *cc = CPU_CORE(sc);
-    Object *obj;
-    char *id;
+    g_autoptr(Object) obj = NULL;
+    g_autofree char *id = NULL;
     CPUState *cs;
     PowerPCCPU *cpu;
 
@@ -293,23 +293,17 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
     cs->start_powered_off = true;
     cs->cpu_index = cc->core_id + i;
     if (!spapr_set_vcpu_id(cpu, cs->cpu_index, errp)) {
-        goto err;
+        return NULL;
     }
 
     cpu->node_id = sc->node_id;
 
     id = g_strdup_printf("thread[%d]", i);
     object_property_add_child(OBJECT(sc), id, obj);
-    g_free(id);
 
     cpu->machine_data = g_new0(SpaprCpuState, 1);
 
-    object_unref(obj);
     return cpu;
-
-err:
-    object_unref(obj);
-    return NULL;
 }
 
 static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
-- 
2.26.2


