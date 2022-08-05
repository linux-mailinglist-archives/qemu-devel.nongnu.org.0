Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13558B096
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 21:57:42 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3S2-0003Xs-24
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 15:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pn-0006R2-9F
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:23 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pl-0004Ve-J3
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so3810894pjf.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MB0kNBsKeqajf853oKvTERPcRFUevz8GQAfrSDwCPo=;
 b=Y+AanmjielSl7eeqmq/xQF2T/QH4R/aFHpTlJlyy4/xn4BcOhrgliBjFgNPMvPVNM4
 Zf9lT4w/ZpKWZHWfe3JQ02Chd7T8nNM+nuKYYntdKYNTTHsIzffcRG0w9Atrq1UoxwdB
 TjnH+NAxQm4SBntvpOjpoF5q/5hzdHJWlVY6y+YVOBuQPIUOEn3aUd3f6wg+xJglwlmO
 65+dg/m8A2FgGq13W6PvLvomrjhBFHuydq8yNAMyrFx1ywZWy1dSeyyZEmtGUjIwz9MA
 Wc+nC1M4fiKmQk+N6+yaZl2SIGwq4FCESNZHLZlgcyAK2x16eM+P5d677v7aIvnzN9br
 TIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MB0kNBsKeqajf853oKvTERPcRFUevz8GQAfrSDwCPo=;
 b=rMoa5+ZU6BO0z/4zUPP+RymIs9J9uAA1U+9PAdZA19v7LC2rrOC1DaglpjM/cuMrQH
 I75ZI2gXI9CbubE2a4eDzC/cwCiwtsaY2s3xkEYLcUOBNkGlClU7bSEkj/uJQ4EphfuC
 tuf5hAh8lntVCyxHbvXyDtd/eEoL7Jyq8YZF0edZhYgswtSdexVLkN9zYP5ixob+0nBs
 /PvPP60PEBQBMDso340aWz/MmuXg6P0ak2ln87GzrA8bMJW7lp5UIALtaU4CgtdkCGyd
 DLLtHhpQF+WExXLeBoz8usCC1E942VTCmBagf5/wA+i6SUloraSsIRsw30TBUlcplgNA
 /Ofw==
X-Gm-Message-State: ACgBeo02L/jB0E6Gj8eetAijU21mUJD48lYvX/LQTofFQ0ooyFf1kcoV
 xktI7IxKG9AI+1pg/ex6qtWaOJWOuBVCEQ==
X-Google-Smtp-Source: AA6agR6TFuy2T5aLJkLN74un+YmMFEDuAZwW3Eyqs/Aev1sgz2qBJlx7z2AZxqYFQ9/l1OSzwMIzBg==
X-Received: by 2002:a17:902:aa98:b0:16c:d74d:fe6c with SMTP id
 d24-20020a170902aa9800b0016cd74dfe6cmr8527868plr.134.1659729320002; 
 Fri, 05 Aug 2022 12:55:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f70d00b0016f0c2ea158sm3393048plo.157.2022.08.05.12.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 12:55:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/7] hw/loongarch: remove acpi-build.c unused variable 'aml_len'
Date: Fri,  5 Aug 2022 12:55:10 -0700
Message-Id: <20220805195515.349768-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805195515.349768-1-richard.henderson@linaro.org>
References: <20220805195515.349768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

From: Song Gao <gaosong@loongson.cn>

Fix a compiler warning on openbsd:
../src/hw/loongarch/acpi-build.c:416:12: warning: variable 'aml_len'
set but not used [-Wunused-but-set-variable]
    size_t aml_len = 0;
           ^

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220721040046.3985609-1-gaosong@loongson.cn>
[rth: Removing aml_len in turn makes fadt set but not used.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/acpi-build.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 4b4529a3fb..d0f01a6485 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -411,9 +411,8 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     GArray *table_offsets;
     AcpiFadtData fadt_data;
-    unsigned facs, rsdt, fadt, dsdt;
+    unsigned facs, rsdt, dsdt;
     uint8_t *u;
-    size_t aml_len = 0;
     GArray *tables_blob = tables->table_data;
 
     init_common_fadt_data(&fadt_data);
@@ -437,21 +436,13 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, machine);
 
-    /*
-     * Count the size of the DSDT, we will need it for
-     * legacy sizing of ACPI tables.
-     */
-    aml_len += tables_blob->len - dsdt;
-
     /* ACPI tables pointed to by RSDT */
-    fadt = tables_blob->len;
     acpi_add_table(table_offsets, tables_blob);
     fadt_data.facs_tbl_offset = &facs;
     fadt_data.dsdt_tbl_offset = &dsdt;
     fadt_data.xdsdt_tbl_offset = &dsdt;
     build_fadt(tables_blob, tables->linker, &fadt_data,
                lams->oem_id, lams->oem_table_id);
-    aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, lams);
-- 
2.34.1


