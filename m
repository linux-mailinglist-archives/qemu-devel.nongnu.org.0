Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B96496D7B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:59:59 +0100 (CET)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLcE-0000Gc-DT
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4x-0005m3-Em
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:36 -0500
Received: from [2a00:1450:4864:20::42a] (port=39590
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4u-0007gQ-L3
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id az25so5905035wrb.6
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NxBpkMVebkfvJDaKJYbHagp3Kx3QPxuJ4FSTved8Gug=;
 b=LO6JD28SSRveVnVEfo4UpGmhleAw9kCGUklXWSWAgFkqsu0jt/qlOZ5BCFCqF2CJHI
 I9UyZWvQzzmeGFQzLHYhourEfjI8Nc7Y4SoYJw5mhMQNkyY3WGvakRI6fQha0QFEbx/+
 +8Hei9OocwARhVjS6T+pVXRPVwM2uk6ASPtPPH9jDMAE+d9AfSVc9BJHlulx/aU1XasW
 HGYbm3qJZyw/K0TSv+3LhNXTroukQuqWFTXwfxqh4cI3+zlxCp8dMd3qo/7Uhr3pZiR2
 WK/ggKFxdbtLjgvgfEH+rHHs9UHE7QV06M46EwNE8Cj17HvJrKdQymFIV3UDfcom6Fbu
 nB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxBpkMVebkfvJDaKJYbHagp3Kx3QPxuJ4FSTved8Gug=;
 b=RpradmooCH4KpgEi92C49xbq10qJ4CpbY1s3mPnpkDKpiNdwAv5G7fNkS1xU50amiM
 cPg2gU7kz9bVH5Q/Sl0SU8zVUj6ZwJXDm1ztvM5rsYu8igPh/EpF2ViwvyEnRcGRqM7E
 QU7m38UH7m0wVWeG6sffjkJqkCWOIkiUm9lnzWMcLojWLIWsIU8hhgnKL/2EMnFDmhq2
 4q00qbOZNIqBinJuovOpUxMzhVLrZUWOYnkYGkWC7gRLPdhD6F0T+JrsOKmxCCB7FetU
 WibGQM/p+Zd7EUJXFL2kV+ZsJT1WeeU+Pl6fDKJ+xdxmFbItbtNz6Hq6SaqwwMOOfffs
 Qn4w==
X-Gm-Message-State: AOAM530HEdxzMpSjp9LUDRjFu/VcD2qLyOORB2hNPe1jAVn3yfad4Oyw
 ihLRzcdmYHWbCp9c0pCZ+BvfNw==
X-Google-Smtp-Source: ABdhPJwE1hCRNxWPHu+QxeUccvBHfki0iMe7vAfrQHmiyhI6zBcCE0F7P9pCAou2WjBgoH889JjEkw==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr8408980wry.352.1642875889199; 
 Sat, 22 Jan 2022 10:24:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/14] hw/intc/arm_gicv3_its: Don't clear GITS_CREADR when
 GITS_CTLR.ENABLED is set
Date: Sat, 22 Jan 2022 18:24:34 +0000
Message-Id: <20220122182444.724087-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current ITS code clears GITS_CREADR when GITS_CTLR.ENABLED is set.
This is not correct -- guest code can validly clear ENABLED and then
set it again and expect the ITS to continue processing where it left
off. Remove the erroneous assignment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 67f12d98af3..1763ba4a671 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -853,7 +853,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
             s->ctlr |= R_GITS_CTLR_ENABLED_MASK;
             extract_table_params(s);
             extract_cmdq_params(s);
-            s->creadr = 0;
             process_cmdq(s);
         } else {
             s->ctlr &= ~R_GITS_CTLR_ENABLED_MASK;
-- 
2.25.1


