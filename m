Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5349453F29C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:36:39 +0200 (CEST)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMH0-0003jx-E2
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwO-0001jY-23
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:23 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwJ-0003y3-Id
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:17 -0400
Received: by mail-pf1-x429.google.com with SMTP id x4so5356513pfj.10
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IJe3n/nMq/mivvFTnN5CCv0ANALvK/6QwHR+rjkTkNo=;
 b=OIeIJE7ML5SWkBA6guOfSnR/p6kA9TzNL6abYaB288MtRtDjcfMHCINB2gv0M7ajku
 ioCCMmHjXkG+14+lOXjdlFnpYjstxznn5xkeMrW5pGDznjf+gEhqmiIODXOAcCXMIdX3
 zMUNlj1FbpEv1uETJnNrbtXB5IIMKzdU2iE6K3VdGvlOnhdX8RxhNOEZTioQhOAseVRb
 aGYmTfLAv/PnGrsE+QJbAaXrjc8MbcENBQKq6ujzJHeNdHGP/fwCNoSYN7ii7OWDwV/D
 883e+v5QgPvgYqEkKjK1mhEXY3VCbjzIkd8th7z1eeQ1vxnGg2TEgi3DY3lB8HgKleLg
 HXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IJe3n/nMq/mivvFTnN5CCv0ANALvK/6QwHR+rjkTkNo=;
 b=Zcdhpe6DCQCVjTGwHdFWwB5M9VX7mXTZjIokIeO6k1WIZS1pEZD6/szzdO0EoMh17H
 fbSftqOzcQ4g9UwIN97zHYzpWyFFrjLMWy7LW3Tfzf10mWHryjUPPJus4bKWaeQ+sogT
 5KJCeRxEQEnAac2PlVUQDjdwSjoLv6Pb1hGFsG0dQ3fXi0PqLS0trKlGsz03H53okdJV
 EWeRHe6i4cV6XPHFQ5Do/YZnrWe341Kro1zvchke3prsu6Q5GR2S5SXeKRqat9lIcr4T
 HrbxXeA2n37kqj24nB+keSHUd0KKjG5y7raXehnUbG9mdqV8kfU/A+G07PSsWhA88ARM
 w3mw==
X-Gm-Message-State: AOAM5309Ns5OctzrOuvXnGCJlzo5HUcEpujLWB4PKargQfWHKYtdqb03
 JTAz6Fwz4YoI52DdbvI98FRw42qQHzEK6A==
X-Google-Smtp-Source: ABdhPJzRBfgVfR8yvcIk+0PewOXssfwtQWMzkKpSD/kQTte/HFrQma69mLpidV9BDGuiVWp+cxtZzg==
X-Received: by 2002:a65:604d:0:b0:3fc:57c8:e6eb with SMTP id
 a13-20020a65604d000000b003fc57c8e6ebmr23677218pgp.260.1654557311614; 
 Mon, 06 Jun 2022 16:15:11 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 21/43] target/loongarch: Implement qmp_query_cpu_definitions()
Date: Mon,  6 Jun 2022 16:14:28 -0700
Message-Id: <20220606231450.448443-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-22-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 qapi/machine-target.json |  6 ++++--
 target/loongarch/cpu.c   | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 06b0d2ca61..2e267fa458 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -323,7 +323,8 @@
                    'TARGET_ARM',
                    'TARGET_I386',
                    'TARGET_S390X',
-                   'TARGET_MIPS' ] } }
+                   'TARGET_MIPS',
+                   'TARGET_LOONGARCH64' ] } }
 
 ##
 # @query-cpu-definitions:
@@ -339,4 +340,5 @@
                    'TARGET_ARM',
                    'TARGET_I386',
                    'TARGET_S390X',
-                   'TARGET_MIPS' ] } }
+                   'TARGET_MIPS',
+                   'TARGET_LOONGARCH64' ] } }
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 267d96c9a8..aa0e1f9167 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -365,3 +365,29 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
 };
 
 DEFINE_TYPES(loongarch_cpu_type_infos)
+
+static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
+    const char *typename = object_class_get_name(oc);
+
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
+    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
-- 
2.34.1


