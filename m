Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7D4366B9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:47:24 +0200 (CEST)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaHr-0005qT-G5
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx7-0000NQ-Fa
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx4-0002fN-VW
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:57 -0400
Received: by mail-pl1-x636.google.com with SMTP id s1so636940plg.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ntlLu6jx+KTwzSkrUsKE+JzLZz72IPGPPdjKz27oBkU=;
 b=M51voO5g0DxYMDP8IZDRWYKV/4ohiXkkArbpQxnk60pJptHhMCD6xBA0pmdgDVZKd5
 Cj6AMF8DmdfCOUfSAE701EfmGCzppuCVA22O8JpKlWrmXBKcXRzx/AaSk7xBhf/yncGW
 sSRQYYMUxPx79D8Ib6FpL709a6du/oAuqLWTzU0rdYOcavuvhbxtef/fYcDMfViTiX8A
 /Drt/QODiE5QN5VgjK0v7URpZw6Fsy8SDLZhbEdZAhyOcxtzej25Rh2V54j165rCo83h
 PevOFQ0FOrwz0/9GQcli+VeC/UFC8nURJEgb2jh37Q6OT+K6s/MctunmyN4wkNKaLpLr
 I4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ntlLu6jx+KTwzSkrUsKE+JzLZz72IPGPPdjKz27oBkU=;
 b=TbOnEXCtNRp4GsOjbi4U9ZwJGDpc4Wi6QaCgWMYqqCxfY30oH7WMOBMUb78zJz0LbM
 ko45ksiRTQh5IHcyKV87K/NB9loPxzXdFYkcNE7lzEYIJnt5KijR/snRRmy+v7zqi9dP
 3lmT6+jsyK0TvgC7OE6ZqU1v+Ly5k9juysBid/ASjgDsRl2JagrYjqvtvN9Qz2VvDyYN
 jLy9RwtXGrSFbatDg6eKs4yI4/gjmLCuyTdGbcZQih31anjsNZJEW+hi9RerHT7V4IED
 ST81WeNhr2OVr6h2A9BwswEggBo3E5NPAbXojaVmdZAGX5J9ZuJSrAA2zfQwDTEZCwVI
 cByg==
X-Gm-Message-State: AOAM530bH2mlKOFhw3xMFJ+dsgmcFA5rL6gdxADods/lb+9hN6iVf03S
 e+9tUY5yTanp/bihjhKoUzUhCNida3p0dg==
X-Google-Smtp-Source: ABdhPJxpMSImUmRCOeEE5X15SljI6Sqgp6AjuJO37VgAiK0a0FfZ2Ri+OLr+4LHcegPi5Ia46xskUQ==
X-Received: by 2002:a17:902:f551:b0:13f:2b8:aff7 with SMTP id
 h17-20020a170902f55100b0013f02b8aff7mr5798229plf.89.1634829953621; 
 Thu, 21 Oct 2021 08:25:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/19] hw/acpi/aml-build: Add Processor hierarchy node structure
Date: Thu, 21 Oct 2021 08:25:37 -0700
Message-Id: <20211021152541.781175-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Henglong Fan <fanhenglong@huawei.com>, Ying Fang <fangying1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Add a generic API to build Processor hierarchy node structure (Type 0),
which is strictly consistent with descriptions in ACPI 6.3: 5.2.29.1.

This function will be used to build ACPI PPTT table for cpu topology.

Co-developed-by: Ying Fang <fangying1@huawei.com>
Co-developed-by: Henglong Fan <fanhenglong@huawei.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20211020142125.7516-5-wangyanan55@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/acpi/aml-build.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 76af0ebaf9..5195324585 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1964,6 +1964,36 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
     acpi_table_end(linker, &table);
 }
 
+/*
+ * ACPI spec, Revision 6.3
+ * 5.2.29.1 Processor hierarchy node structure (Type 0)
+ */
+static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
+                                           uint32_t parent, uint32_t id,
+                                           uint32_t *priv_rsrc,
+                                           uint32_t priv_num)
+{
+    int i;
+
+    build_append_byte(tbl, 0);                 /* Type 0 - processor */
+    build_append_byte(tbl, 20 + priv_num * 4); /* Length */
+    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
+    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
+    build_append_int_noprefix(tbl, parent, 4); /* Parent */
+    build_append_int_noprefix(tbl, id, 4);     /* ACPI Processor ID */
+
+    /* Number of private resources */
+    build_append_int_noprefix(tbl, priv_num, 4);
+
+    /* Private resources[N] */
+    if (priv_num > 0) {
+        assert(priv_rsrc);
+        for (i = 0; i < priv_num; i++) {
+            build_append_int_noprefix(tbl, priv_rsrc[i], 4);
+        }
+    }
+}
+
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
-- 
2.25.1


