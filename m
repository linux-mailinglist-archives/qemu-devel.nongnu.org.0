Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D834715AD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:27:11 +0100 (CET)
Received: from localhost ([::1]:56566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw81X-0001WI-1f
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:27:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7me-0004yO-Cy
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:52 -0500
Received: from [2a00:1450:4864:20::430] (port=33583
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mb-0006Da-Jz
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:48 -0500
Received: by mail-wr1-x430.google.com with SMTP id d24so20466844wra.0
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S9WJzvjYpmxgrrlt3qCuhlC8wT1kSr5boBWat1KdIow=;
 b=vxe0y0ON6PrAIofFTI7Qm7PievJd1al2ZIfvUU29qc4djOQTDr2K2EM3+sKogoq3P9
 k2hQSJGyfdYchb6dtsRA61eDscE9BgXeiYvSoocJSfvhSk+Kar8O6lVIsr9a02nkIHu1
 iToEcJk16ChoUoLfiZX/bvJ7KBBr1iLFxaRyKv62uYw2FaXd1O10qsHELtZzU0qT7JKB
 6ATdRH2/dK/L02hfg12A1KnFEd9if20bgXVAyaCTN4FmfAPPwqukbkxdnP0Xgskl0zr6
 nGruDU3VOA2vS1s2ViSxWi9iJNhNaGjAnAFbfXrQXwR7CNOvSuJ53/ug0/ZKI1RNsLmL
 JaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S9WJzvjYpmxgrrlt3qCuhlC8wT1kSr5boBWat1KdIow=;
 b=fP3jx4EB/PKVpCyVEGEWhtyTyFdGSbVFDHcuoOymY4lDoMUDY5AU1B/axXQbe2sON+
 xIhARfDwmqWvNyI9tAidUd9tatJ/TeS4lArmIMEOe14+D6NXUZ4OqPwJL/CnjPb0/HgB
 eWJNBY1+5DXEw6+c1b9o5h/ng+rzKds3JpmJdn/Z+AKzvYWbH5xibYXGmmBjE1eoKIQQ
 CbFKito3dSdomJT1FP/C3q3JoNOnT6OkZ63sPeRng/3cq/2Gnf4Tzc2/OhXk0wGmrzsu
 2xKISC5BqtBrz+Z6MSa8K+vOCZhTqhE9Txx3KaozLs4/DQVJUd3pQkDUHwXSQdz7q8PL
 slmA==
X-Gm-Message-State: AOAM530XQOGCT2DbSSKoDxAOC9yBz7pIMR2DyLAL+8Z3ORhd6Gp/thZ/
 tm8FlK8IaeA1wmK62R8qV+27+Q==
X-Google-Smtp-Source: ABdhPJzO5qTPLmYg+Pws3AkOBBGpxbLgfRrUOoEZy7ZZTrLy8BGnNgcur3LhpvVbOEF/2MJg/PDPJw==
X-Received: by 2002:a05:6000:1a43:: with SMTP id
 t3mr22220223wry.555.1639249904279; 
 Sat, 11 Dec 2021 11:11:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/26] hw/intc/arm_gicv3_its: Correct setting of TableDesc
 entry_sz
Date: Sat, 11 Dec 2021 19:11:16 +0000
Message-Id: <20211211191135.1764649-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We set the TableDesc entry_sz field from the appropriate
GITS_BASER.ENTRYSIZE field.  That ID register field specifies the
number of bytes per table entry minus one.  However when we use
td->entry_sz we assume it to be the number of bytes per table entry
(for instance we calculate the number of entries in a page by
dividing the page size by the entry size).

The effects of this bug are:
 * we miscalculate the maximum number of entries in the table,
   so our checks on guest index values are wrong (too lax)
 * when looking up an entry in the second level of an indirect
   table, we calculate an incorrect index into the L2 table.
   Because we make the same incorrect calculation on both
   reads and writes of the L2 table, the guest won't notice
   unless it's unlucky enough to use an index value that
   causes us to index off the end of the L2 table page and
   cause guest memory corruption in whatever follows

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 84808b1e298..88f4d730999 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -829,7 +829,7 @@ static void extract_table_params(GICv3ITSState *s)
         }
         td->page_sz = page_sz;
         td->indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
-        td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+        td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE) + 1;
         td->base_addr = baser_base_addr(value, page_sz);
         if (!td->indirect) {
             td->max_entries = (num_pages * page_sz) / td->entry_sz;
-- 
2.25.1


