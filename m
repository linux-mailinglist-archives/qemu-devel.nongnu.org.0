Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF762552F3F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:57:34 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3adZ-0001ve-Ts
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQz-0007mz-DT; Tue, 21 Jun 2022 05:44:35 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:33767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQx-0007OO-W7; Tue, 21 Jun 2022 05:44:33 -0400
Received: by mail-oi1-x233.google.com with SMTP id s124so16459758oia.0;
 Tue, 21 Jun 2022 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7yhW9LpMmKGzBXwAjsWvLaDaxNgxsE3wMeuD2ea0AU=;
 b=H9UZYGLc6STaRXKWyKPbPSy5uS9++6V9Fp/gXV2XgG26SPBJu7aFpQ0l3rhYjhxAzf
 0EY2azf9Ag6ANJrn1FlPqfJLrGRlcSPO2LdR82IDxCFs29YgOiO5tJSDQtmbFp/cOHxF
 7wAxSUe9Fm9jEjdrZN7R7IdP+WgQwjNjIUDs05PUr2/OABvhRCAT75nSEYMcrjgKPrpl
 umV8UsxtA0+eyw2oTl013cBa5HpCNdakdMAvXnSwOxVDNeiAeFy+dhjp/pSroI0wKGl/
 S/UxierJDjO+SWowWGocZbjvU8e2hOzLKYlQd+6AIXoSLKLlaM2dqypMLq9rkJ8LQoIU
 G52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7yhW9LpMmKGzBXwAjsWvLaDaxNgxsE3wMeuD2ea0AU=;
 b=KpF5PRC4R7Yc1vxPwNtmNONrH/shp1KiGoX/yBAA2vYcgVTev6Bkcsf1CHdlF3Vavs
 ySFxFnup4KBO8tSuIIsIUEjox9kM+84oORLHb/SF1bbmL33Yf4sk0ZPdvBXCkfl2Bkrz
 VYbi9OuJWAkq1CZbPIvoZkodF0PBUZXx+eGHoZwVps6/EDxG5GiNREoDskI2jWJf2YVY
 NH3q9Bq4+IRI1K6uOFOcmHamunU6c+kKqogFBCbCS988YB3RV5xuF+Wy+VjvQ4gf6NlN
 8DnRhqsIjbmFoG3ujHqXQMc+LTL64CRrETlraFWkf8sP/xAPPQ9ysQg+1xztjCbaxCml
 FnOg==
X-Gm-Message-State: AJIora+Lj1z2Uou/T+wc43dliAkQUajpn1AsHIqVUYMFc9Mjo+ykY3Tk
 c6vWlTppH0TO7olKSU1g6cLKAbGfJKYcHg==
X-Google-Smtp-Source: AGRyM1ukIgxQ1VNLUiYhfZ9yDj4D12XbxQjy80n8rgv7UW83cTRijAAXmAeWnJ27Qdx4qSDGf21ivw==
X-Received: by 2002:a05:6808:18a6:b0:332:fae8:dbd7 with SMTP id
 bi38-20020a05680818a600b00332fae8dbd7mr8618340oib.172.1655804669541; 
 Tue, 21 Jun 2022 02:44:29 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 10/15] target/ppc: fix vbpermd in big endian hosts
Date: Tue, 21 Jun 2022 06:43:55 -0300
Message-Id: <20220621094400.122800-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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

The extract64 arguments are not endian dependent as they are only used
for bitwise operations. The current behavior in little-endian hosts is
correct; since the indexes in VRB are in PowerISA-ordering, we should
always invert the value before calling extract64. Also, using the VsrD
macro, we can have a single EXTRACT_BIT definition for big and
little-endian with the correct behavior.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/int_helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 16357c0900..11871947bc 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1413,14 +1413,13 @@ XXGENPCV(XXGENPCVDM, 8)
 #define VBPERMQ_INDEX(avr, i) ((avr)->u8[(i)])
 #define VBPERMD_INDEX(i) (i)
 #define VBPERMQ_DW(index) (((index) & 0x40) != 0)
-#define EXTRACT_BIT(avr, i, index) (extract64((avr)->u64[i], index, 1))
 #else
 #define VBPERMQ_INDEX(avr, i) ((avr)->u8[15 - (i)])
 #define VBPERMD_INDEX(i) (1 - i)
 #define VBPERMQ_DW(index) (((index) & 0x40) == 0)
-#define EXTRACT_BIT(avr, i, index) \
-        (extract64((avr)->u64[1 - i], 63 - index, 1))
 #endif
+#define EXTRACT_BIT(avr, i, index) \
+        (extract64((avr)->VsrD(i), 63 - index, 1))
 
 void helper_vbpermd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-- 
2.36.1


