Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3276A5355C5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:43:47 +0200 (CEST)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLGj-0007Po-VM
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCI-0001om-1L; Thu, 26 May 2022 17:39:11 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCG-00087q-Je; Thu, 26 May 2022 17:39:09 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 q7-20020a4adc47000000b0035f4d798376so506573oov.6; 
 Thu, 26 May 2022 14:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtaaTkmydv57MS2qQRZNutWbRE00by7MzJJzalxnVwo=;
 b=ogeqBaMf1CnhYX8BQH0vV4kYzQvTL9Reb8YVZjvO6LyVkCZGyVB3Ukmf/rEyHDKsru
 i1Hn4u7YAqekNiWk3nbCavDgUWNmrSnd1OgwNvogw6M8VwdGqVLWd843nIpPirWl+8PQ
 pOwl7G9ZA0rb6RXy/ZaKmWvSgHRDn0APxeec/H1TzPWG8A6JzvfzQQ8YUr1CDbJfwrT2
 WYxapxnKochTFlzzvgLQxbkTkNzhsp1MPKYnLzmETi3AHXNPQ/qVlB3IpBMsv0DF8gHE
 DRy3wC+Z0fdAtvCEcHsbWAWYvYRZNThdSWkc511O1o3CIc3hWyyZqoWK50hVSFYqb5XQ
 rg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtaaTkmydv57MS2qQRZNutWbRE00by7MzJJzalxnVwo=;
 b=hJpqcbuwXZwHiZJ5MPfC7wJTem1s1jliIJalG2WFI76Cn53Lo2ugPaemeiyX+vk1Eb
 tMBOE41VEzKgl2T3BtPIKeBgDgrNZpowb3xw5SbpHcwAnVoAeJfu7Slm+v1Cezy8Ch/P
 CoG2afLp8/bWtTXIGbUleumsGBpq4G23cdVSmq42/e7pBeKYBlRWW0E+C51qIYurZ+0A
 AHyCTZEbFKnHfVw9gXm1IuxlLsCdnBR7LhXEzS1VPwqlU29oSHQknSAQhBZQthysjml8
 NIfKQVs8qRl6GWoVhQCWTWHIePO56KFPr2uyrm3zwV+p4Z0FubFQhRlPTOFAEw7kAjLZ
 rSfw==
X-Gm-Message-State: AOAM531Z6DbDvl/lEhAGpyH560vTvO3cMfXayqtRrKOHrj1siTHQqeZA
 NrX47ASoMBnTB9qKMGbITh7OE/mfF3c=
X-Google-Smtp-Source: ABdhPJzp6gV15ub66Ap0vLfDQLBP4qQrCN33LjYIwXottJi65sHrZfJvWhpZ8+OVdekxGxhGtbKIRQ==
X-Received: by 2002:a4a:c894:0:b0:40e:85a3:484b with SMTP id
 t20-20020a4ac894000000b0040e85a3484bmr9263147ooq.11.1653601147097; 
 Thu, 26 May 2022 14:39:07 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 11/34] target/ppc: declare darn32/darn64 helpers with
 TCG_CALL_NO_RWG
Date: Thu, 26 May 2022 18:37:52 -0300
Message-Id: <20220526213815.92701-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-2-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index aa6773c4a5..44eb6b7b7c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -59,8 +59,8 @@ DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(bpermd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_3(srad, tl, env, tl, tl)
-DEF_HELPER_0(darn32, tl)
-DEF_HELPER_0(darn64, tl)
+DEF_HELPER_FLAGS_0(darn32, TCG_CALL_NO_RWG, tl)
+DEF_HELPER_FLAGS_0(darn64, TCG_CALL_NO_RWG, tl)
 #endif
 
 DEF_HELPER_FLAGS_1(cntlsw32, TCG_CALL_NO_RWG_SE, i32, i32)
-- 
2.36.1


