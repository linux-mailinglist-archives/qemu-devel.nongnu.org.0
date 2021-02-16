Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF9C31D2CC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 23:49:01 +0100 (CET)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC99Q-0003h1-47
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 17:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96U-0000sE-Ub
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:46:00 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:40301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96Q-0004se-9S
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:45:58 -0500
Received: by mail-ot1-x32f.google.com with SMTP id b8so5805904oti.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 14:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97kB+nyl96mKMiXXe0WJ0gyYIf0q0XHV2YeMSKLBYDo=;
 b=tgSyp9fQIY/GiS8e29th3+Jda8Xjm87jKfEOil0hS70pgrRgDv/iIltSQslk76J2FS
 ukfy40+KPlbDMz+Nov2EYkNA9JGo7yHm1/vUjoC6IZhJhVVDr4C+zeEzPfzsBH9Oi1hc
 WUSrpYNRKN5jpBtlGoLH+IVo9UpbKtsF0HwNPXmmCXxh+etAj+UZxtfzgCTlibbv6epL
 et1o4GS7w4HxkOYacbNu0s1TKebsyq21uwky3ERISJplWxpPIMlCR+hTRXNR6G+Mvcmz
 PFqdF97kCEs2E/wVggknFX5Taz9Lev9Laf6x72cE7BN3k0ZgKvKEK1KYz51VJLeB+lw8
 fD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97kB+nyl96mKMiXXe0WJ0gyYIf0q0XHV2YeMSKLBYDo=;
 b=HS27Rf1OxPopyN1FzGTbBJXOWg2jk2OUwRsaSNWQCpsGF9JTQ7dj5kGDoEStapWKBk
 Yp5/VoKBK832cYl0U+q+4isgmz1iQ9ve4uT0KMTZWN52/EGfDt+Aq6OIpLA1jKVbMze+
 jR7aLGD9fmCqH4bfeJ9kR/a6OccStW1Iknmeb48zBUDFtcSA02wx9ZG/ciWV9IStB2ym
 4dmwIcBS4y5qZJjg8oqpK6I1ZPKraMaXG8JLOdLc47zbvQqwPxoToUX+pu1zK72KPkpo
 YVEfzsQAIJGuHSEGhOcc7V0gGuY8+0roBxahGUSuqH14lWCQuMnys+bwWqGC9osDz44L
 lNAw==
X-Gm-Message-State: AOAM5316PwToY7Xo9ccb70TIvBStirdpUEUp1T9fk4U52vFCRE4yKL9R
 jdpWTx9iJ6Zbfc7GsRK5NO1mrQ==
X-Google-Smtp-Source: ABdhPJwkdyfi3Y5YB45ww5bqfCZVrt6qhMG5NxVlXMbYJmlQldDDz2hIZ2SIdRnubKiKQEh6kBOS5Q==
X-Received: by 2002:a9d:6d85:: with SMTP id x5mr4634595otp.338.1613515553326; 
 Tue, 16 Feb 2021 14:45:53 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b12sm32909oti.65.2021.02.16.14.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 14:45:52 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/3] target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
Date: Tue, 16 Feb 2021 15:45:42 -0700
Message-Id: <20210216224543.16142-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216224543.16142-1-rebecca@nuviainc.com>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set ID_AA64PFR1_EL1.SSBS to 2 and ID_PFR2.SSBS to 1.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c255f1bcc393..f0a9e968c9c1 100644
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
2.26.2


