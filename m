Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F63B45CC01
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:24:03 +0100 (CET)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpww6-0007kJ-0Z
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:24:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mpwux-0006lO-06
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:22:51 -0500
Received: from [2607:f8b0:4864:20::736] (port=36458
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mpwuv-00037m-7s
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:22:50 -0500
Received: by mail-qk1-x736.google.com with SMTP id i9so3813433qki.3
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvwqkwvKY1N2gxuH7VwfxvJ5mQx7rsbXP3TITiOVwJo=;
 b=Qf6f3V0yz1ZrX20U8SWFBGfUTx0bSYEte+8kSnaECy2pbnET/BmG+g5sDNSkrmufb/
 1atPv4tIMytQgcg8DXXfqxTlMh8O3aJOhbgl7/iDtQj5qaKg4bFLmCDPCIakPKxOKHmQ
 5WSN6Mr0t6Nw2+v/H9yvEq5b5h9PnIfknaQORUUUwL45OY7vXyhi8SVCSDn9U5lX+a3v
 4x1SMt75cBkj0uy3UMY/1So2owoYDuNShVo9GPXNqz/HOzdkpK3QrAPqXAKjHUaIuQTr
 mQuXPO5PNyChcZgY3tttZyNBcywbX5B81pin8rENciDQmSvOB9YPqQOKApAkclBe5ki/
 V4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvwqkwvKY1N2gxuH7VwfxvJ5mQx7rsbXP3TITiOVwJo=;
 b=emgY1bQjJ5tjMqcXRCTNeISk70Qj2mHSh0u1YPTy8IcPx6nEJLrabZdHLD4JpIrtzd
 N5i2KMftv0/TIqIxhKfXCrdO4a6MhPb6/9LvOnsTZvNd0AiYZ5I3MoLoG2G0eDZ/uSaR
 8xhZT4zszRlYNNAsHgMOc1ZhMaERs7Z4HVZACgDRyRkmzYxPJ3uDZgRCihqHXpLt7fNJ
 GCSi5Zwwljb3k//l4KfmPhQ1GKYHxx7tLwX+lfc8WcDu35qF8N5+9BCALU76tZJFngKj
 Rwxg49vWjSazpjhRJywcHZOqaN8oUv2wt3GbgTy63e6ePaS6xn7zLxRBgw4EU4HTtEss
 /rPA==
X-Gm-Message-State: AOAM530O4r0C14kmTudTuIiLoh6LCvMv1lrWTo+Ex8dSyD/EPthtG/Cn
 Wk8K/tG74/FVN+pNNTdZuDcEsQ==
X-Google-Smtp-Source: ABdhPJxiOG24f+fKbj2saX2wFJRmY/KDT+E6AJm7LPbl4lRGZ0YSmFGfIKVfs5lfxdY+MnVlfuIbQw==
X-Received: by 2002:a37:5cc:: with SMTP id 195mr256484qkf.680.1637778168235;
 Wed, 24 Nov 2021 10:22:48 -0800 (PST)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-20-142-114-141-224.dsl.bell.ca. [142.114.141.224])
 by smtp.googlemail.com with ESMTPSA id h11sm267904qko.18.2021.11.24.10.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 10:22:47 -0800 (PST)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
Date: Wed, 24 Nov 2021 13:22:46 -0500
Message-Id: <20211124182246.67691-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When Enabled bit is cleared in GITS_CTLR,ITS feature continues
to be enabled.This patch fixes the issue.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 84bcbb5f56..c929a9cb5c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -896,13 +896,14 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
 
     switch (offset) {
     case GITS_CTLR:
-        s->ctlr |= (value & ~(s->ctlr));
-
-        if (s->ctlr & ITS_CTLR_ENABLED) {
+        if (value & R_GITS_CTLR_ENABLED_MASK) {
+            s->ctlr |= ITS_CTLR_ENABLED;
             extract_table_params(s);
             extract_cmdq_params(s);
             s->creadr = 0;
             process_cmdq(s);
+        } else {
+            s->ctlr &= ~ITS_CTLR_ENABLED;
         }
         break;
     case GITS_CBASER:
-- 
2.27.0


