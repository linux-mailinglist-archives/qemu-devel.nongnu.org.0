Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C5432F13F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:32:20 +0100 (CET)
Received: from localhost ([::1]:50640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEJH-0006zY-D2
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE30-0006Ws-O0
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:30 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2r-0007Rd-MI
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:30 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1102955wmq.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RlYFnBv0whdfki0/tF2YTJLn0lEijjZ8E3Bere5iAHk=;
 b=c9vn2NwotGB82u7y7YB9F45I9eL39BYNt01dJHq08Qs3MXodZ9Zra6XtP8LkcTEQMs
 rY7YNPHc49TtSHMMSESO7JIcV7REcI5q+WiUkjjxi95hgJMXaKxgQv23sJlJVQVYPcQW
 QJh6Y5tUcvygLU2JG1a4Zc28sKUL61Gp39I9t2oqyDbXcrLyH+NnbP5PWiW40SmNs6AA
 Jo26kI/XaX6JHYbLxPTZHoz/p7lnGmCA6eLHk8LVxxmgruV1fDHi4M06rASyvSnt6jgh
 9yTRLKmrvk/FBrfsmcgbKvY47MxzrrqyQ9lQm2WrAV9E4IFnLgfnZhEX5CSyxjqSMDuT
 Rnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RlYFnBv0whdfki0/tF2YTJLn0lEijjZ8E3Bere5iAHk=;
 b=bL1cXuLDOtv6asW+649S8q9J/vVnOWAqOkBGtmS5SxiilceBHyyoGExZ3tcj6fXrzP
 OhKFoqETdf0bio6Xyk1gwoJMscKWITHoHmqIDFFR5rXQ/0WMtAC5hiVdBhuCHXYZMl5y
 kmUOpOTjBKaGH//avpiqmgVrKJ4MSrG0IIK1hpkpPTUxcArdNvilGCZuDvagpKwjRMAK
 i0rZd1gAbN9zKwNn/6ek0YMfLjz5ENZadBfQEA9G5TMmSmjcZ89NIIyZfzZaWId//ZUr
 VsEgXn7XJ9zHBSbZ4RPhOHNNLVWzOqQmIYrSjYzMTU0FRz3j2T7cTpBRsin3KGEXrPTw
 aQpA==
X-Gm-Message-State: AOAM5324V3g6fmlotMuHCcrroC4fe9u1fAB4G8WxE3qtIqyuTyunMjNR
 DUYnsnulEZrVP8yema4aA9lBRAwQ3uBtRQ==
X-Google-Smtp-Source: ABdhPJwa+gIYXm1OCLA3RwKkXhcp5vDz90eQubrs4mAiKvOtGyI1/X+cT+Q9WxdXujdvn26YZNhOSQ==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr9867602wmq.91.1614964520119; 
 Fri, 05 Mar 2021 09:15:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/49] target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
Date: Fri,  5 Mar 2021 17:14:30 +0000
Message-Id: <20210305171515.1038-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

From: Rebecca Cran <rebecca@nuviainc.com>

Set ID_AA64PFR1_EL1.SSBS to 2 and ID_PFR2.SSBS to 1.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210216224543.16142-3-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c255f1bcc39..f0a9e968c9c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -674,6 +674,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
         /*
          * Begin with full support for MTE. This will be downgraded to MTE=0
          * during realize if the board provides no tag memory, much like
@@ -723,6 +724,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = u;
 
+        u = cpu->isar.id_pfr2;
+        u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
+        cpu->isar.id_pfr2 = u;
+
         u = cpu->isar.id_mmfr3;
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->isar.id_mmfr3 = u;
-- 
2.20.1


