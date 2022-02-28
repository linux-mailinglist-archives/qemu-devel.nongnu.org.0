Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C74C759F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:55:22 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkEz-0003Jj-EF
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:55:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAa-0002sd-AT; Mon, 28 Feb 2022 12:50:48 -0500
Received: from [2607:f8b0:4864:20::c2e] (port=42581
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAY-00080D-Q0; Mon, 28 Feb 2022 12:50:48 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so19637331oos.9; 
 Mon, 28 Feb 2022 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hhvHRAqMDp+f6RDeOM0Xwma/ZY8DYhuGMgeOoiLgxxc=;
 b=lSDU8pmalQnOcA6grWM02tRVh0XVJ6aaM6omRifkhh5BCx/NrFwofC6W7IQHIpazUz
 dERN7Yb1k8Ih/pmuxpT97wziY3UwCzN45Y/CetxYdIxXn/cD4HzIZDbWK8PPrarUMUN9
 /BG2fkdwN3JVhivuG7nY7+WpCqByZZC3LGpYxMRHX/19jL00hmw/b6e44SBnkaFngwnJ
 lmuhJLrsQtheyNw9yYxQj0lwx9soJOqiAeqMhDukZnBd1dNiO3AnO1cKtV0aovIxF+IT
 P9pnh2mdxoZvptn+RDhhWvEZO2GUb23CAXeTD8p6PK0XL4gzMzCmEoacqRTtczJOl0aX
 TqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hhvHRAqMDp+f6RDeOM0Xwma/ZY8DYhuGMgeOoiLgxxc=;
 b=iWrWt9qvPhQq2H4jyFHDXmmEdgebPhSNUbcMNcs26EHBiTuWiRwnDP6+ZUbqR3dLQi
 Pfz5xNo4zixwE2UgLLM+WkE2JuZIp4B+yCVJE4LGRbVgrvDngMrA0hSEXTj5emHtiaFR
 uRPVIAp8TxGZAPTt6HT6JnzxU8XvZfBSOVlDe2/I6YgkVFEw0Oo+TL8e+S+0UyWd8VoA
 DNsZ/99Uws6WNBD+0S6Mm892+gx/rWNTl40NoZYBuYv3+4izW7dUxTDum0rxyhkxmjQm
 3e7S3lzhqIJdLKwsR8RGP5p1hnO8bxXniKBhm/Jva/+CTECZCKLLlzdyqbqipJ/V1tu8
 I3tw==
X-Gm-Message-State: AOAM531zNWnEUPhwnIuthUDYHN0mu1zOqGrxvqxp9C3Sg/K36J9l1r45
 O7rAX/Oa5dJG4RbZABWHHCLevQB1E3c=
X-Google-Smtp-Source: ABdhPJxE1H4RFLsZS5KCXKhPnyjl5OXY2yVVBQyMTUpQNzg/Rsd592NttmBaRhLHnydde0G1xMui8Q==
X-Received: by 2002:a05:6870:311:b0:d2:c4c0:942a with SMTP id
 m17-20020a056870031100b000d2c4c0942amr8923121oaf.92.1646070645375; 
 Mon, 28 Feb 2022 09:50:45 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/14] hw/ppc/spapr_rtas.c: use g_autofree in
 rtas_ibm_get_system_parameter()
Date: Mon, 28 Feb 2022 14:50:03 -0300
Message-Id: <20220228175004.8862-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_rtas.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index b476382ae6..d7c04237fe 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -279,30 +279,29 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *cpu,
 
     switch (parameter) {
     case RTAS_SYSPARM_SPLPAR_CHARACTERISTICS: {
-        char *param_val = g_strdup_printf("MaxEntCap=%d,"
-                                          "DesMem=%" PRIu64 ","
-                                          "DesProcs=%d,"
-                                          "MaxPlatProcs=%d",
-                                          ms->smp.max_cpus,
-                                          ms->ram_size / MiB,
-                                          ms->smp.cpus,
-                                          ms->smp.max_cpus);
+        g_autofree char *param_val = g_strdup_printf("MaxEntCap=%d,"
+                                                     "DesMem=%" PRIu64 ","
+                                                     "DesProcs=%d,"
+                                                     "MaxPlatProcs=%d",
+                                                     ms->smp.max_cpus,
+                                                     ms->ram_size / MiB,
+                                                     ms->smp.cpus,
+                                                     ms->smp.max_cpus);
         if (pcc->n_host_threads > 0) {
-            char *hostthr_val, *old = param_val;
-
             /*
              * Add HostThrs property. This property is not present in PAPR but
              * is expected by some guests to communicate the number of physical
              * host threads per core on the system so that they can scale
              * information which varies based on the thread configuration.
              */
-            hostthr_val = g_strdup_printf(",HostThrs=%d", pcc->n_host_threads);
+            g_autofree char *hostthr_val = g_strdup_printf(",HostThrs=%d",
+                                                           pcc->n_host_threads);
+            char *old = param_val;
+
             param_val = g_strconcat(param_val, hostthr_val, NULL);
-            g_free(hostthr_val);
             g_free(old);
         }
         ret = sysparm_st(buffer, length, param_val, strlen(param_val) + 1);
-        g_free(param_val);
         break;
     }
     case RTAS_SYSPARM_DIAGNOSTICS_RUN_MODE: {
-- 
2.35.1


