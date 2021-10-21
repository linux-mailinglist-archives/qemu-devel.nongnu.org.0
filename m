Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C444366BB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:48:52 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaJI-0000Oi-1D
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx6-0000Iv-E2
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:56 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx2-0002Wn-Nc
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:56 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m26so966193pff.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zq+vUL3+l8EwtzFQ0nupHEnvpxTTs/A/ZF3RDm4/SUA=;
 b=P864iVT3ZhO7qiP9K9ZMnWLKgOdh0EGZmmtWcg4ytTiBgtrFepdLTipbp6BNAOmWcD
 6M36GV78S6/m8RhxWIaaBoLQhvcDOs11pJiz4WcUeNWoGzhuFbbgJ7+IrR0DGIhLF9Db
 4G9IBa5t6vbCqrfgx7LB9P+o25PgCWKyCKUGj9XC8R85U0UQutYkqT3XJf+upQ8O7xaK
 JfnE604rqrPgBPDh27HA2SGmvCsKfSNloKpzUlD9cOLGlxIueNqdYbEs0Z9o+LodgZiB
 nUVdju+cg+AtqIMGVAjwW0gy1eOHKMJdhHpex4sCjVIXqWyjyla4NLlw5WhlM6xc1PuB
 N9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zq+vUL3+l8EwtzFQ0nupHEnvpxTTs/A/ZF3RDm4/SUA=;
 b=ZuO9dWG5zMWv/I/j3+WFlrXyY+JScqKwqntODXZAIhrdrJMclBYyB7l4rruI8YsDjW
 HXQPwh/MoAsFj+128svXXlNabPr5YFHLJZWDHYR2lidJuFcX8SaJHfWQOvNbAopWxyDn
 NlGwi8CqzCXKFYCH2YxpHLxERi1IeVT2AWrh11IUbgvPkA/3rc+H8JuKRNGUvxnKXHO5
 odpY9Wa0fPO7uwak1eeiv7mUaqxL3jbL4A/mJC5AyQ4zjsOejzmbm5Uq9IN7++r5LFf2
 Tel0eYUQAEBBcep+v94O7pMURh+anqM0w0MbmukgqpOHbumwaw1qAiPipmRNiS1+McrZ
 Vv0Q==
X-Gm-Message-State: AOAM532CDKnVXlzAhNK0BKk2EjtwUkm7j8YK3flnj6RDTkIkAHr45spa
 XM+2f0N79/dn1c7lO1ebfL1GUgLv6qpKCQ==
X-Google-Smtp-Source: ABdhPJy3hzkD1BoswJ6tfg7xV9tStuRDpbeDYuVIlWmR9rXd3TfC9vI3UlPYsmkGJxAJPriAMk7bLQ==
X-Received: by 2002:a62:9215:0:b0:44c:4de1:f777 with SMTP id
 o21-20020a629215000000b0044c4de1f777mr6144791pfd.31.1634829951350; 
 Thu, 21 Oct 2021 08:25:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/19] hw/arm/virt: Only describe cpu topology since virt-6.2
Date: Thu, 21 Oct 2021 08:25:34 -0700
Message-Id: <20211021152541.781175-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

On existing older machine types, without cpu topology described
in ACPI or DT, the guest will populate one by default. With the
topology described, it will read the information and set up its
topology as instructed, but that may not be the same as what was
getting used by default. It's possible that an user application
has a dependency on the default topology and if the default one
gets changed it will probably behave differently.

Based on above consideration we'd better only describe topology
information to the guest on 6.2 and later machine types.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-Id: <20211020142125.7516-2-wangyanan55@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/arm/virt.h | 4 +++-
 hw/arm/virt.c         | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index b461b8d261..dc6b66ffc8 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -125,11 +125,13 @@ struct VirtMachineClass {
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
-    bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
+    bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
     bool no_secure_gpio;
+    /* Machines < 6.2 have no support for describing cpu topology to guest */
+    bool no_cpu_topology;
 };
 
 struct VirtMachineState {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4160d49688..15e8d8cf4a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2816,6 +2816,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     mc->smp_props.prefer_sockets = true;
+    vmc->no_cpu_topology = true;
 
     /* qemu ITS was introduced with 6.2 */
     vmc->no_tcg_its = true;
-- 
2.25.1


