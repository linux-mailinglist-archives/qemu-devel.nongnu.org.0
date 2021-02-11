Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C8318BCE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:18:40 +0100 (CET)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABrj-0006Fk-NO
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYt-0007v3-7U
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:11 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYq-0008M2-Fh
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:10 -0500
Received: by mail-wr1-x432.google.com with SMTP id v15so4087957wrx.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3wSv6Cbip4MMdQNJC+tS9CGgkSpKZaUik6k+8A1am0s=;
 b=Y9qsTguq/OTzLz9e84kMScXSq7m2elCEGz3NjNnX1pyMH86+mrMKJdtj0VtlZ+YAt0
 9cXpUx76eEqKTOXzQBb0xNpzAxza5bRAIuaDXISmYFy3sac2X2z8gTuudJp+WpJx/PiF
 eIMLIRv1VYzAq+PJs8f1GqRZYdCx6VkTJW1U4lxAL9f1g6+Q8TCCtVzRjkAQip8cc08H
 RqPEOyO/5nzo7mQ3sJSzG2Qwqgq7NyIPCpQ2StpfFRqmRL0agezV0uje7lVzQK3hQhTW
 XBQ0Ps7fPUWi07H4x0fDuDtmviVKvCWMqmhhYdlCDwZPdUE7Eh7QBmqITw4YGBN0Y6hG
 8hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3wSv6Cbip4MMdQNJC+tS9CGgkSpKZaUik6k+8A1am0s=;
 b=tsRdrHtmtEkIpzkYSYJRhWFQu0ptBMiKqr41trJQeyhNj0G1kekHZx6Echn5jNCvCs
 9DnqqA9CAbdJPRs6f7MTJdwX0h44rSY722An9eDJYtAq1JGw2/Un8aA6MXGk3NKqb1gx
 MV/rgNBO/2Xu1BguBaVNpGJv57EkNYtMpWaVxjtFNwqR/U3TOcgqX+LOyPbnHhdZ4Nd+
 NX+z+OvQHWRVUGdj6zntUHcTzqAtTxqeAvl2w9MVIxRpvC6mH/jc86pS3DzgLkx9Y5Jo
 jPXTj/sjFnqjTxsT4N89DgrbdhWI0CPMyFWvy4Q6oSrdrwDgkH0IXTEotdmzrtqiR0Sw
 CYLw==
X-Gm-Message-State: AOAM531VORnD9CVXxN/sFVtYTivsUESrxQoJlmZjBGIz+sdMeP6UOycv
 H1NG71CzCR1GimnGSCEL0oAsEikCluVByA==
X-Google-Smtp-Source: ABdhPJwRQaWUS0mcUXHQVgwrBDi0qv0ACmhrtgUBVqTTYu0JI1iL08g5z21l45PUop0WGavFygiP7A==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr5621838wri.373.1613048347170; 
 Thu, 11 Feb 2021 04:59:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/45] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for
 "max" AA64 CPU
Date: Thu, 11 Feb 2021 12:58:21 +0000
Message-Id: <20210211125900.22777-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Enable FEAT_DIT for the "max" AARCH64 CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210208065700.19454-4-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 10c51181767..c255f1bcc39 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -669,6 +669,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
@@ -718,6 +719,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
         cpu->isar.id_isar6 = u;
 
+        u = cpu->isar.id_pfr0;
+        u = FIELD_DP32(u, ID_PFR0, DIT, 1);
+        cpu->isar.id_pfr0 = u;
+
         u = cpu->isar.id_mmfr3;
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->isar.id_mmfr3 = u;
-- 
2.20.1


