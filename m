Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECD30D2BA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 06:02:27 +0100 (CET)
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7AJ8-0004bf-Pc
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 00:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7AFG-00012Q-Eb
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:58:26 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:35949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7AFE-0007zL-Tr
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:58:26 -0500
Received: by mail-il1-x134.google.com with SMTP id g9so3127575ilc.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 20:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAFdn6IbZBNqvP6S0gWLCOyNml8OyzsyVzQVR6rXHRA=;
 b=md6LZ7fOncCS/eEN+shzt4NvYz35WxI0DyF0VfkNIR+KwHlEW8S8UAYPJxLsCGT3xN
 Jmo2tVfTRkj1aoj9fTg/Hn1RZCdsjZEKJZFFFKb2X6GZi8dd0R3LRq704cDUi11ojTVM
 GiKRIlmPOMSyYAe9FHZOgR8xbh81M2ulbldDjuDLP7+cIVXXiCZUQ3hZyZMlz+bksn4c
 GmUBTSI4pjFVM7u9Jck1mMGdS5J5ioX+9cIRugqt2jaFPEaBr+rTIvPl0Zhi8mr8+JP8
 OacaGN2udTQr8ZH1Ynu0whjy2tWJpwyyGfS3WjqsAZcZYQblY+LQQaRJ0cy6tMc6Srez
 y2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAFdn6IbZBNqvP6S0gWLCOyNml8OyzsyVzQVR6rXHRA=;
 b=j//cgmNdliej3OFxY6BiGEMMqgmPJpvntFjnnNjWpDhpLFi2O2Oa9iokRcXNWMp/DF
 Xx1C+e9p593ehoIErjwadrteu5tljkCGs00Kp+XHC7lmfZJgfytPWPHrGQ9LsuldCKCE
 hXLgoqCJt4iOyYxjhz5tuqPfkAGaDn4wY9uERLjiTPub//PXWagGFuEXsQFkcTBCXQ+j
 eciF/Yldkns7PMxNYkLaxLaq2fs4/Z9IYvvcb/uhXrOzIDFAHLCOSyogNjAqbr4UbwD3
 YIybD/H8ZqHAdaG6Ks8f+2qwEkyqvCTHp7B4S94+7TtoIGuR19AhDPl3hO8xXbx15g4K
 6yAQ==
X-Gm-Message-State: AOAM530RXio/zPiklYUG4rAlqFM5sugz7LWlZQIf1SrrJKLVy/5g3eCB
 MhEPJYUG07EL1HUBBfmm1VnsUFb+Z7CDX5ATVPBc0rp1QzIqUe9f4MPkCUx8z+LxM/+PJEVB+mI
 hiaU8mRFLUZbz3GnWGzPN+IN8hs2SKRAZTp6O7wlmWpkMp2YwNyW9M7jVzfFN62cnhwJf4TM=
X-Google-Smtp-Source: ABdhPJwfvA/a8Gvzo4+5LvU8pb2NxQx/wmE9li+ZBFRIouoQJ6Cpbxp9DJXIeX5xBhoTAjtuQXpxXQ==
X-Received: by 2002:a92:ad0a:: with SMTP id w10mr1194167ilh.235.1612328303614; 
 Tue, 02 Feb 2021 20:58:23 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a21sm529203ioa.34.2021.02.02.20.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 20:58:23 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1
 for "max" AA64 CPU
Date: Tue,  2 Feb 2021 21:58:15 -0700
Message-Id: <20210203045816.10953-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210203045816.10953-1-rebecca@nuviainc.com>
References: <20210203045816.10953-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x134.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable FEAT_DIT for the "max" AARCH64 CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5e851028c592..9a5cfd4fc632 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -666,6 +666,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
@@ -715,6 +716,10 @@ static void aarch64_max_initfn(Object *obj)
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
2.26.2


