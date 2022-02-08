Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0014AD9B8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:25:28 +0100 (CET)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQUo-0006AE-0d
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:25:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-000167-4H
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:44 -0500
Received: from [2a00:1450:4864:20::32a] (port=52219
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOr2-0002Nj-1r
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:23 -0500
Received: by mail-wm1-x32a.google.com with SMTP id r131so6389188wma.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F8KmHfDV6ISGjnmWH8Yf3Cv+WlIGIG6n+5ETsKdMSPc=;
 b=Lib5BiB7MViK2iEssWJCvEguDuJSMwzQNrrTCP38aKqT7SJzHaT8ZNo4OdKUcw7vOA
 H6BS98e+VagHow1EEOv0F2OfrBHyUNOGGqh2Iu0YKnjJ+gvNGkALV5Pf6NjZtmuCdJPV
 WifZHJHNP6ShQS54NQZgzEEOA1P8wqcdgqGD643NH6hIw5D8wizJu3vwOvqvar9SmhGL
 jMRCtaNsBtq7CHF45TsnTr7CGDE2MwLIy8yyF/7NpWpZgA/AxYUofAGqHV5jIglaWrD4
 iXMjC8BNjdrYOFjqJPVw9wObkmTl1e5pdp3Scfh5RaoLNyuSNS+vtJz0jklEjW8f3fpt
 shJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F8KmHfDV6ISGjnmWH8Yf3Cv+WlIGIG6n+5ETsKdMSPc=;
 b=kMOx4e0DsjpkdeOOMrLuYH6M49REWXdRL+yJ2N6APZdBJq/XhGaPlIuCfZXZdgh0Q7
 Sd76KOJTgym5Uuf2P+RgBc1H66346PAk3RsqmoDDsnJ5hW70Fazz1bOraKpe+G7OLpUX
 jx0q3UuoBYlNgY0ZSVR6nkpY2cyF3J2Zb0RuCi+ekLcS1k749nUKDCGDg4sRQQM4tHs4
 3bjsc4LykzjiJT2xLem+W2yfxC39ulXJmGMUkEyEZvuqF0RMr7/f7FTx04esHHQetA1L
 rKgqkVH3fyy8FfIRZgQPVhYfvGeOQPbH5YDCRGe6n05tGpDwzrzuwarouDUleAUa9tMi
 itCw==
X-Gm-Message-State: AOAM532PAANlgh0j9OpXkbCgZjIit32DgAu+AW/cRxZcvMfsVocBAccU
 XJRShOP6pr5J70BBKjjknmnnrhzmVsWEgA==
X-Google-Smtp-Source: ABdhPJyr3ZPozL2z4WvfYHglZmfaSx+8q3dn7pXgiB9viaVVjcGpkuUPM7/kKX7kATyO53ipmKgd8A==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr774280wmq.48.1644320414744; 
 Tue, 08 Feb 2022 03:40:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/39] hw/intc/arm_gicv3_its: Don't allow intid 1023 in
 MAPI/MAPTI
Date: Tue,  8 Feb 2022 11:39:46 +0000
Message-Id: <20220208113948.3217356-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

When handling MAPI/MAPTI, we allow the supplied interrupt ID to be
either 1023 or something in the valid LPI range.  This is a mistake:
only a real valid LPI is allowed.  (The general behaviour of the ITS
is that most interrupt ID fields require a value in the LPI range;
the exception is that fields specifying a doorbell value, which are
all in GICv4 commands, allow also 1023 to mean "no doorbell".)
Remove the condition that incorrectly allows 1023 here.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-13-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 069991f7f36..8dade9440ac 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -406,8 +406,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
 
     if ((icid >= s->ct.num_entries)
             || !dte.valid || (eventid >= num_eventids) ||
-            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
-             (pIntid != INTID_SPURIOUS))) {
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
                       "icid %d or eventid %d or pIntid %d or"
-- 
2.25.1


