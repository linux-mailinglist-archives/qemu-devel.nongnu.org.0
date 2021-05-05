Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092A43733DC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 05:16:20 +0200 (CEST)
Received: from localhost ([::1]:58732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le81K-00052w-JT
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 23:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qh-0008GL-AY
 for qemu-devel@nongnu.org; Tue, 04 May 2021 23:05:20 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:36400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qZ-00034L-DT
 for qemu-devel@nongnu.org; Tue, 04 May 2021 23:05:18 -0400
Received: by mail-qk1-x735.google.com with SMTP id i17so313333qki.3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 20:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=05WXkcw2sOlbiq6nu0JNKVFANsscIs2gaD5SDLLLZ56buXsFk0UUyUgHR7GV1gounI
 XNbucrzS3z+xDT+1buUDiiF/mLuDuao0LcVQnrzwnr9TldqlI2hoRwsl3N6KR25Dfbdv
 9n14jqN4ih+adVEXih6Z/fcfcq6ez2sNJXTfm2gROQ4/+4FDh+47YC3xsbXUq84JWIiq
 i//jIGNHhMibUhrXMHrG9AUAGM6KSXAYw9TWWYq7plQ856QoDAaloSbrfnH/sl+uZpHg
 zUa3PtTvelX+/Kk7h831r89wJM6nCm51ruTquXX0epcOqlZFRnOoHadBC5zbhUA2OUe0
 4BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=GFHOGnENx+LUOnput5Gd2vPxc3xbQzbQ0Jm5/XTEwLAyj0zOytduEuk93Gp79Au+KZ
 q4+qwAkgEH8CHzTzJ2scvnZfpsukp69JAjxSP4mi23jXfdXRdJso739VH/YBZsBNsBgK
 e3wTAO+hYeY+UZjBdLIzJwtbotlioN2zYT+9gOuUCNOu2w/rphyX3IQxAw25E5K1lOww
 RzU2mvqW+Ri8QFAeXUpvmXCTW/DlICL94Wlb1sgS4DGUH/Idp0IKK4gQzED0lAgllGTT
 0z/zIDJtcstq0kVXrwMdJbUwF8dduMFAkXiCucM1AyzHcKqpQ8W1bEQzbGiAQHy02f4p
 /sxw==
X-Gm-Message-State: AOAM532jyTG1EAo08cxSNrG6FUKN55Sc0f/B4t4tu07jEGuLmMKgjaGY
 5IVJmgnjUUZsRApvasOgFLtDaA==
X-Google-Smtp-Source: ABdhPJyIdUDWQsjnx2P468PdQcMp4i03Ar0A20MTFP5/m/JakjuJzGQoguhGFr1zVqlmVV+aOxFhkA==
X-Received: by 2002:a37:27cd:: with SMTP id
 n196mr13036119qkn.420.1620183908054; 
 Tue, 04 May 2021 20:05:08 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a63sm12270550qkf.132.2021.05.04.20.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 20:05:07 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 4/4] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Tue,  4 May 2021 21:04:43 -0600
Message-Id: <20210505030443.25310-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210505030443.25310-1-rebecca@nuviainc.com>
References: <20210505030443.25310-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..f42803ecaf1d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2


