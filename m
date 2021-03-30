Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44E34E921
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:30:32 +0200 (CEST)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRERz-0002s8-1i
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENh-0006r6-Hf
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:05 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENd-0003cc-QC
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id j18so16252814wra.2
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PNqwnnCZ5fWRV3b8fDgCxIuqTPRmrag5LEpt92bVsfw=;
 b=jNxtu40Oty+gxZuTq00zLdgDZjiFxWuJSuccfL4cQ5PNnhG57dwktbtT+FjzYuoSM1
 la3H5/8Q6PCnKlmXphlbLkN4H5dtjfCHXZzt/w/Ish/IVWjy17dQ+h4PkTcfulXtWWqb
 nO6/YCBDD/Lg/HvElFboAvBVAStA84SXZjAQ1BzXV3H+s93giXaNWGNjawfi83WCmqlb
 gbDmyMhtxJjTxJ0xLNVPiYiqBrjD30VFWZjNC9yu85GlyZNKEBzI0zeV3aZorYABmkzE
 69bPEOyzMwMksT2m6fbLstIWAJA5lYGBRCwPk1FkPiXZ14VLIjyh+R6y2OywEbMsLRbd
 MSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNqwnnCZ5fWRV3b8fDgCxIuqTPRmrag5LEpt92bVsfw=;
 b=TwOpSS7weU1uusfTT6BA0Mt8zoYvBHSZYVZ7P88gGRc/5sBwO1kdeqQnKzYZKtM52D
 XuTwzlY51A5ZHuOw/XOaZ0qVO/QOQNjeI6h118+GjbP96W+T0CkC5MSR2kj7ax184BTb
 SzkaYSuH1pGxzDBWSNURM2S36dN/aLpeFh4flJ8wgucbU0UFSipJfk/49s3X3yhjGUzM
 FOSeqxzC3cPOWyOQnPGNMxjO5PWuKg8eegozTl/LbKic6ldLpoj86PN6P9YOG2iQQyoN
 jGtgZaSd3dyYoc1/w9tw6wF7toWZtnsAqh/gyO7JxWy9JwUjtQsLvcTyqum43dOeWPjP
 hAWA==
X-Gm-Message-State: AOAM531JYvtlI5FhJQ1Zvlw9QIfETHrU4gzmsU/LDbpzuDd7pVJDTR7P
 CG1VNZRJhhEO6PTL/9NJoJZNRO3PaQd+I1qf
X-Google-Smtp-Source: ABdhPJzGEgAb53wdgt79Sp9YN3LcRxIEkkQdHfUE/eFj8iXY1hVZ/Na86dral5LtmXUfPliobBdvqQ==
X-Received: by 2002:adf:e392:: with SMTP id e18mr35015168wrm.189.1617110759245; 
 Tue, 30 Mar 2021 06:25:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p18sm33140892wrs.68.2021.03.30.06.25.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:25:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()
Date: Tue, 30 Mar 2021 14:25:53 +0100
Message-Id: <20210330132555.8144-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330132555.8144-1-peter.maydell@linaro.org>
References: <20210330132555.8144-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

They were introduced in commit 9bde7f0674fe ("hw/arm/smmuv3: Implement
translate callback") but never actually used. Drop them.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210325142702.790-1-yuzenghui@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index b6f7e53b7c7..3dac5766ca3 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -595,13 +595,6 @@ static inline int pa_range(STE *ste)
 #define CD_A(x)          extract32((x)->word[1], 14, 1)
 #define CD_AARCH64(x)    extract32((x)->word[1], 9 , 1)
 
-#define CDM_VALID(x)    ((x)->word[0] & 0x1)
-
-static inline int is_cd_valid(SMMUv3State *s, STE *ste, CD *cd)
-{
-    return CD_VALID(cd);
-}
-
 /**
  * tg2granule - Decodes the CD translation granule size field according
  * to the ttbr in use
-- 
2.20.1


