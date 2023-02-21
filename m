Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5869D85E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:21:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGQ-0001dX-Ay; Mon, 20 Feb 2023 21:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGF-0001cU-28
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:07 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGD-0008E5-GN
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:06 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 ei9-20020a17090ae54900b002349a303ca5so3220174pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtfS729W8SNygqiwUg2I8CHVdzajfLrBoTMYCRIqeSU=;
 b=GgcWGFyFYNckp3//qU1LAPMmRRlabLwlK6qCYJZOcIQCY0iVDimhnsZRh2K9KRwSIL
 7u8RSx5LvApsE7aptca1e33092HscbxcYpTlPzfjt/8crr6qt1aiIeU/P6FG1Uai8CV/
 B0PWaGT14b9MCvRRfjsUoRVgVY3Ks3xOn2Npd7i92gS/T1yUEpLACxm+1twh7leOtL3L
 OzlCw/Et5dpGIt3sQvfLHRNtq9IdhW8ULWp0Wi5sMl7wRcdU5UzJClp26KsKHZA/u+Ym
 mGv+SrCiXZcFwRrT/P+WfIlTX3V9RNeM3c7Th30netTZx5UVuJ25b9Hb+HKG/Xc/t/m1
 k/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KtfS729W8SNygqiwUg2I8CHVdzajfLrBoTMYCRIqeSU=;
 b=ke3psLe10MmHM1Rdb/XhoPCOaIugEtbkW+EdNdZSBAUYCiy2KuqiFgUxvQ+DBHV9F9
 SIgk+WgRCiZWUt+soXWGEHh4D49pEWnkCW+F9GjShna8IptrwXak6RrW8GDz8sKvGrDQ
 mbgYhVlvuMvfkrMOOH2PcWc+xx5xJna2tPdfUFsebVIEB+pe5Aj7dm/UXs7eKbCB3R7o
 qJ4mrJRtkgE76fWk9k3OIEOVt23bjqo1TTSmTIB25RJ/MRr2kEoVFGtMITQW2D7RVLhk
 7ceaOzlyz9AaHT5e4Of+G6O/ISNx2i023QJv9V/txTHSyGcFOX/0L8ZcfQGiY/qFxvXN
 wOSg==
X-Gm-Message-State: AO0yUKWnRf+BpMwILagM6x2huOXKZKjBCfCD1IeXTrJcjDkr694cNv9l
 BXmXBXN/JEifFKtDRfzENtDkIfaPCmCIB7BaL+Y=
X-Google-Smtp-Source: AK7set+GEeNwHq+S5o7APJupgMCvq1ZBm0M5nViSpZYKsE/y7UqK1kajx7+MsIFpRc7AZVQxadLiOA==
X-Received: by 2002:a17:902:fa87:b0:196:7664:39c with SMTP id
 lc7-20020a170902fa8700b001967664039cmr3364688plb.31.1676946004117; 
 Mon, 20 Feb 2023 18:20:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 06/14] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
Date: Mon, 20 Feb 2023 16:19:43 -1000
Message-Id: <20230221021951.453601-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 070ba20d99..895e19f084 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -283,6 +283,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
+    int pred_width = cpu->sve_max_vq * 16;
     int base_reg = orig_base_reg;
     int i;
 
@@ -319,13 +320,13 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
+                               i, pred_width, base_reg++);
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
+                           pred_width, base_reg++);
 
     /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
-- 
2.34.1


