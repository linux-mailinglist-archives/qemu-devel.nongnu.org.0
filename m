Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E123F609A38
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:09:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omptB-0007oM-1H; Mon, 24 Oct 2022 01:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompsC-0006sl-MH
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:43 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omps8-0002Pi-88
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:39 -0400
Received: by mail-pf1-x429.google.com with SMTP id d10so8111298pfh.6
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1vmy8B3i0MTxOCpkYy56RCPt7fyDU4i6hN7JG5wlZ40=;
 b=TQcBUOk9NqlJ7uQE83Nm72JBJnkRXJgWvEKOxP+7DzXAv/RDKjztBHKdCyOWqajPQk
 HPk0nSxxZZH4u1spYhPkPo3zFlgFdfFSijMauzxI37HsESMto6sQbkDaFsfLHbpAjhM4
 EhruGI4BP1ZTD/4LVq90YD0kwamp+M1K6oJQnKJFU7fMEwothaCsrLbppgIkQZjrPF/b
 im73e90DvhwPbxUlMidXMwdJ5p2s8hj8/wZEYb3/BdbOtQS5UDZAmxtFVKhlC26b8+Ur
 Gi+lxHe7WEl4TED+NDDLdVriZJbr+UmWQhVXd5wmXcSb4bpFm5//zutaRucZjI47WXUw
 bZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1vmy8B3i0MTxOCpkYy56RCPt7fyDU4i6hN7JG5wlZ40=;
 b=QGmU+kZU6ByPD+oaXZtF+ZljwP+ithsxbVq72ziN7xCeoU1eSqbhBLatOCOc+mT6U7
 bCuX+Wr0NbS2BlE1DkyAKRRK1+XfMFP+NYsGfJ9O9pSvGMIeR9s2fGevzGGBkDYnRtKI
 nwdUnDcgeNZ9WVlL0eyUS+DG5d/0SKNe4tb0TQk1et3sWxtu2LtM1Qwm2ljveTkPx+CA
 VxKhvL6Zk22tBXV4O26U3t7yMW3s24iEX30BaulJ+u5RgAOYYpjxyIsowIUmURHnObYX
 AWB1pOucwjtV/U43MC6ga4N/KbrYrpxeAa5/FdDjZ2xqZhwhV5eouZ7T5fjtlABd4pga
 6M/A==
X-Gm-Message-State: ACrzQf1pMm5x8bzJX83Pn8pkvlSc8ddBbZq94VtgCSt4DADCRXtu3s7Y
 4s11AyLwDdr4kFttsaj/anPNQhbFa2WLtVcE
X-Google-Smtp-Source: AMsMyM6t5yPg1OLnMWac0wnEC59QLQdZd3/TNboBspyKz2uRi1Yjqu0omrMW5Z8ETdeJmBX9J1adIw==
X-Received: by 2002:a05:6a00:851:b0:563:6c6a:2b7b with SMTP id
 q17-20020a056a00085100b005636c6a2b7bmr31696144pfk.45.1666588768905; 
 Sun, 23 Oct 2022 22:19:28 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 11/14] target/arm: Tidy merging of attributes from
 descriptor and table
Date: Mon, 24 Oct 2022 15:18:48 +1000
Message-Id: <20221024051851.3074715-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace some gotos with some nested if statements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8004ca86df..282828992e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1341,27 +1341,25 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     page_size = (1ULL << ((stride * (4 - level)) + 3));
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
-    /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
-    if (regime_is_stage2(mmu_idx)) {
-        /* Stage 2 table descriptors do not include any attribute fields */
-        goto skip_attrs;
-    }
-    /* Merge in attributes from table descriptors */
-    attrs |= nstable << 5; /* NS */
-    if (param.hpd) {
-        /* HPD disables all the table attributes except NSTable.  */
-        goto skip_attrs;
-    }
-    attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
     /*
-     * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-     * means "force PL1 access only", which means forcing AP[1] to 0.
+     * Extract attributes from the descriptor, and apply table descriptors.
+     * Stage 2 table descriptors do not include any attribute fields.
+     * HPD disables all the table attributes except NSTable.
      */
-    attrs &= ~(extract64(tableattrs, 2, 1) << 6);   /* !APT[0] => AP[1] */
-    attrs |= extract32(tableattrs, 3, 1) << 7;      /* APT[1] => AP[2] */
- skip_attrs:
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
+    if (!regime_is_stage2(mmu_idx)) {
+        attrs |= nstable << 5; /* NS */
+        if (!param.hpd) {
+            attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
+            /*
+             * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+             * means "force PL1 access only", which means forcing AP[1] to 0.
+             */
+            attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
+            attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
+        }
+    }
 
     /*
      * Here descaddr is the final physical address, and attributes
-- 
2.34.1


