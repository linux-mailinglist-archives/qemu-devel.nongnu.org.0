Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179D4E3555
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:23:41 +0100 (CET)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWSJI-0001b2-EI
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:23:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1R-0007r4-2p; Mon, 21 Mar 2022 20:05:14 -0400
Received: from [2607:f8b0:4864:20::829] (port=43810
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1M-0007Ik-Hy; Mon, 21 Mar 2022 20:05:11 -0400
Received: by mail-qt1-x829.google.com with SMTP id t7so13288312qta.10;
 Mon, 21 Mar 2022 17:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTfdWEeO7UkuiZBNMdlAE3Mf1b3IlIIqRvP07nFA/Ow=;
 b=nSX2bytwS/RydYbgDvOIbwajfdDqAMh/ojV2HPg0LPZzD7wefe2sLr5ImNmiBMESMm
 CVcCwjxKO4PqDJQh1tZVkdzbdYXeBHOkLKhYzwuoZa/eWtMgQcM0Su2ooMqk4ma4Pn4H
 o60vtF0H8r8pnYMISg6hy09x9dUpDwQ+bVfHNpH4dQJfr7C0AosiWxrbrtJot8Km8/t/
 MmbcBlJVJtRUM1heEKlU7ejTH/iQY0pSgFlEqTckw12/oecfbi6OrqXlks4BD47sn+VU
 vgUGl5JpbYeQ0HbpdPyR2WcanY74vMzX46fHDYbw4xM8PTNEfC95zKoNswlIHvPVqO2f
 NOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTfdWEeO7UkuiZBNMdlAE3Mf1b3IlIIqRvP07nFA/Ow=;
 b=PVMVZxl4g3Qq8FIiUOUjVZlUwasjyq0j43lZHEKAQxjhwa6m1JdIiOUnXN3lSKoe+j
 pTz/v10Ldv5zrkw5sfrQWphE2oJgytg80KKsAI6wJVnITxfF9XT8bwKvamjqQQlJnZk9
 oaE19veGK+yxhEp/KFvITXbOMkDNiSUvXl21MmtE2GRNCi4Lklw/SqXOQpi5U0mYjqgu
 l7RKr8q7eE7Ax2NMGtIR1qrrJJwuhO1aTDaAobBoqSaO5yPE7VZpZjmpHf0HXDguTTCR
 YJ+dJQz2TAnO3iy3ktpgLjCdw1qvO9e99izKbh6xM3TmF/DPIiJneorZi8yzDnAyqIT7
 gapA==
X-Gm-Message-State: AOAM5328Ex0SIUGeuy3ESQ0z4p99lyYIpQg0dMPEv1G6odpXXQ/0MnvN
 AaT5y8/mqlYju4wHolcOr+tu4P0rQkJgjQ==
X-Google-Smtp-Source: ABdhPJwgpT96wtLDAbAN3fGIJlWuZcVT3gs/3SrfMWqHQEGwSxe8BIqUnPZ8XyZySj29BwiPexyPrQ==
X-Received: by 2002:a05:622a:120a:b0:2e1:c9ba:e99b with SMTP id
 y10-20020a05622a120a00b002e1c9bae99bmr18238314qtx.685.1647907501894; 
 Mon, 21 Mar 2022 17:05:01 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:05:01 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 09/11] target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU
 model
Date: Mon, 21 Mar 2022 20:04:39 -0400
Message-Id: <20220322000441.26495-10-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/gen-features.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 22846121c4..499a3b10a8 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -740,7 +740,9 @@ static uint16_t qemu_V6_2[] = {
 
 static uint16_t qemu_LATEST[] = {
     S390_FEAT_MISC_INSTRUCTION_EXT3,
+    S390_FEAT_VECTOR_ENH2,
 };
+
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] = {
     /* generates a dependency warning, leave it out for now */
-- 
2.34.1


