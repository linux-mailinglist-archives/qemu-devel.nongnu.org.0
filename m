Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7C49537F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:46:47 +0100 (CET)
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbWH-00067A-RU
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:46:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0004JH-M9
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:14 -0500
Received: from [2a00:1450:4864:20::334] (port=40449
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWga-0003Il-Ju
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 r9-20020a1c4409000000b0034e043aaac7so477930wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kfluiZ0u1w9XcLTmFHm1aya7StmZrmXWSd/9Nb9SfiY=;
 b=AnwKOU7/KTCoE78/RqmC4FNCN1OzT/hJHB4pdBzoz3k/Ddl8JCrdKOxocsdnpNQlv2
 /JtyafrjzUBSmr8rE6RIJcGyxo0JHmQ2kXYWTBoUbWKSuEN33yeZXxEBAK7NNNnU3tlT
 K5RmlLxYhZ5xye3V/FS6w2Gbyx4QsxPya7uJmgph+EfhQMinAD2iFS3wUsklNfC9kZXL
 7ypOaMMgsDDL0U6gGqG9mUc/cOitxMdDi4HAtpoR9zlv9CKskr4kFUmAgn+upKN9yaun
 KlyQA6yzNQvHSIdFiEEzq6KN1d8fSYtiPDbJw+iigj0gsoD3nJ+aAQwg6WPt6HjH/w1j
 h/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfluiZ0u1w9XcLTmFHm1aya7StmZrmXWSd/9Nb9SfiY=;
 b=xbmCcMctmWBRBXxPGow9oB27x4jNNvyPqeKXXkKgD7zu44hqvTHPQSG/jQePbSVpSh
 XiC8OD9XlIHn4JkNnyFirz0/fmhjM/WbfSZOu2s0yCtxi/fa6y0ZIAykRD9lsxM6dCDm
 licDeXPE+BYZYcD8GzOegMiqtqj2JpYZ6F8b3kRjfuYZJg9AQij0cIhEdO/f14GSX6XU
 wTFSd8R/gSCkIna95o8KBJzRnRdvm7eecRMP/pVGGbmFfigg08ASqzDO/vexDIoZDhdG
 WZpb8Ei5i3QLYmgwa+AqiBjuLMeDL2UQq0uiWMRMs/1JmOZ70RjFB51H346MtL7ZKohf
 5msg==
X-Gm-Message-State: AOAM530CfFJCFnxn5GeasLzx9InAmnm7mLpAYLu0s3wx2FsRVw+q97A4
 Pv25MnTzr539PrKiTVhDZSN8uMtp8CTtpg==
X-Google-Smtp-Source: ABdhPJyWw7HypOb4hrUlqHbsjeHKf2ps0hTkZ37AldwGLjHV+5XYaBh3b3b1+apHAhePu5P6UH5Ohg==
X-Received: by 2002:adf:d4cd:: with SMTP id w13mr6657766wrk.364.1642682222623; 
 Thu, 20 Jan 2022 04:37:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/38] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
Date: Thu, 20 Jan 2022 12:36:18 +0000
Message-Id: <20220120123630.267975-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The bounds check on the number of interrupt IDs is correct, but
doesn't match our convention; change the variable name, initialize it
to the 2^n value rather than (2^n)-1, and use >= instead of > in the
comparison.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220111171048.3545974-3-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6d11fa02040..5919b1a3b7f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -338,7 +338,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
     uint64_t num_eventids;
-    uint32_t max_Intid;
+    uint32_t num_intids;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -379,11 +379,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
-    max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
+    num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
     if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
             || !dte_valid || (eventid >= num_eventids) ||
-            (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
-- 
2.25.1


