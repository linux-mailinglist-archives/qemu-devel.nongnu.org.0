Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B302FFBF1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 05:47:35 +0100 (CET)
Received: from localhost ([::1]:43906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2oMA-0007GN-Uw
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 23:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l2oKb-0005YS-Gi
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 23:45:57 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l2oKa-0000jL-14
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 23:45:57 -0500
Received: by mail-pj1-x1029.google.com with SMTP id lw17so5882719pjb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 20:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAFdn6IbZBNqvP6S0gWLCOyNml8OyzsyVzQVR6rXHRA=;
 b=dVjPlpHpA5gjaOyrN9kTiPPqEmETELaA7Z3ud0mmVP4BnMOZKRsw72EXI/hLOmkjky
 M1XRzQk4e/6kA7kKFCflufvguEW5dJbKP/5irQ912+H5/Dg54O3Nge9xNXZPc5uYUB4i
 Fp4AwalbU/uFqfYtkp2r3QtdUcmxzn1KzXwcwqbVeD1dYeUMWWL8duZE8HYvDxHczGQK
 fKKGB1R9TN3bdrjnulmYMS7DdtbwTftIXpqWtbquxlgRIfVupgLkkcPflrDYRg8X/JGH
 eneGGelUyfT+DvidTR0uqNUmxW4mNYWgkVurChts34yw3mv99d+x3+WI7RlleFvXR+NV
 lr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAFdn6IbZBNqvP6S0gWLCOyNml8OyzsyVzQVR6rXHRA=;
 b=nZ6WIYehvJ70Ul5NNVK8W7ZUtMHz8a0qSnZ7nlp47dR93wqvS9uXcK4IxYQ3BTiNLp
 cp6TaPfsX+rjNjI0F/Wp9n8xyRT5iWGAHhY2z/OGiwlKhGVKRlA4NSIJ0ol2An0epOhZ
 SaB6p6D1W2aapN/Dg7W0ai+SwRvh0OfOE7V2yFOI0EitAYx2uwI7GCD777kS7jgY3A59
 c0+tchrBxzOuOjlq6k+WSoee4ItS0WMZZc+LjpFyAgCmeQxGkjo6tfy7MBWS80km+1p5
 TtrFA+QYdTTPCmnZiCXUQhc9dVtk7XanV3gqTL5q97C0e6+f/4OBRGiuQv3D6gslLnK7
 W/Wg==
X-Gm-Message-State: AOAM533TuElwMSpN2ZnrYXBEpletkPblhifVnVOKQmQf+tuKuE+z6BTO
 kJNCkjX5mxoWRp04gDqho6JHa/EJdBAmRH2C+381hFWeMy/bKvVlQsiM0wMO/Px/bjMB8aWMMTn
 HvDPn12wvZCuPzxmiPyDxjyWjeGIa6wi4gdfHHL0e8zSLaMIlguluOgmL7hI/aeO+ukA7rHCRMw
 ==
X-Google-Smtp-Source: ABdhPJxcsHfIw8B18Z+z9mtitcvuzuPst8o2kouB5MzxKs4Or0bwsaZVvzv57GZ3Mec7YbxMf9siBQ==
X-Received: by 2002:a17:90b:34b:: with SMTP id
 fh11mr3088150pjb.225.1611290754385; 
 Thu, 21 Jan 2021 20:45:54 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b10sm7050494pgh.15.2021.01.21.20.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 20:45:53 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1
 for "max" AA64 CPU
Date: Thu, 21 Jan 2021 21:45:37 -0700
Message-Id: <20210122044537.1823-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122044537.1823-1-rebecca@nuviainc.com>
References: <20210122044537.1823-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=rebecca@nuviainc.com; helo=mail-pj1-x1029.google.com
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


