Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E835FCCF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:40:49 +0200 (CEST)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWmJc-0003sz-Rh
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBp-0005E4-J1
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:45 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:33387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBo-0004qS-0S
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:45 -0400
Received: by mail-qt1-x844.google.com with SMTP id 1so16517865qtb.0
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 13:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=bbKaddtfzFSlozFgmHJO+5yNaKkKDuUwQyPnQACuGfzIG2e86HLso7gMyvc10oXU4y
 M+oDx2/xPvSwd9BJV/RXz3IGzVDPijG8NWzi28WI5l3W6nGX1GeGqqP2PHCaTQbLFaML
 XlMu5I/cwxyMqwmQtiH1BlWVvgga7dCAjTXsFhinHCQ/ZMIxIKkZZd7d84O788a8tidz
 WnqoPyjTfPPd5MDsiWf5l06cRSIHUQxFq5cXyWlxau4bBQdz8u0UlqciG11Olaf0pxil
 Yih+pFP70X6GTVP7hndUKJl9ewvPlAIjmdRGv8Vc2LEllIwvX6xvHHQ7sMlOS+iGNVVw
 MoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=RsVpeQh3dqwNh0C2UllgO6qOdV5MpGjUuTCN5TdUwCPAJNdxMgez6REi6AcMjdZOi1
 fckAihgmnCKoSJ3h2QRdDjXA3qJiqOPwNLNOkoKKDBvimEeh2Gr4iayZ0S1Q1+UDtp+l
 5GqXz6HclDkqhXwH+JrylicgV+U8sM4Iy4SC6AZtRTEF1Ng+lJigHacEZbeTAdUS7D9N
 8x1xOHhdylYvNz0WjQZtBUBLzkbN/JoXUMlpf8RjlFR7fvBaJSz7celTNFldUd89/dt0
 Rwwfo8w0uKu9e1DU9Rcl+p/YQN4HnJiLZ7AmSINCfX6Wxq3vvj4Z6XGpP6jKxVQJLLOm
 ABNg==
X-Gm-Message-State: AOAM533e1OEJAb0zy1ywvpiyPulxNVQI/jhJdUDfK+WR+Deky2ynUrW6
 TYeT/Ao5LcY3P/G7etwpRq2q6w7efrVOdFxP
X-Google-Smtp-Source: ABdhPJz2lKaItOA58Mm/DgnvpdRn4JCUFDzpj72bhtOZYbwVaZUAc/wz5R6bzp74XjcAIdtIstVNeA==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr37597145qte.301.1618432363225; 
 Wed, 14 Apr 2021 13:32:43 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id q3sm304692qtw.40.2021.04.14.13.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 13:32:42 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v7 4/4] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Wed, 14 Apr 2021 14:32:31 -0600
Message-Id: <20210414203231.824-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210414203231.824-1-rebecca@nuviainc.com>
References: <20210414203231.824-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::844;
 envelope-from=rebecca@nuviainc.com; helo=mail-qt1-x844.google.com
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


