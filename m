Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D85788BC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:47:15 +0200 (CEST)
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUpu-0008SI-VT
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSG-0007tp-FY; Mon, 18 Jul 2022 13:22:48 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:39748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSF-0001pL-0M; Mon, 18 Jul 2022 13:22:48 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10c0119dd16so25522888fac.6; 
 Mon, 18 Jul 2022 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mw+Vl7qJFaRHvBXWjasQlSulEgxJHWWFDxforAjHB7o=;
 b=SwySCPkqKHMSVO3p4tQqXGEwLMK4eaGzUMDrjnRd1Hj/EvQcRDZBgN2QZyu7uA20Hd
 66GnLg3cP2dts0OlEs56jH6namQBbiJ/vqFBphzWxK6lGwdRNPJ7LvZc5nux8kHcisVd
 FwvYoyGVy4nBm2Uwc1qHRnps8pE9k4DO0ovDNmQShd6EAu7d3YvZB+6vjwURctoVvOGr
 kLjDyG5T7OSYukUV1AhSoHk7/TmZyR53UFqyzPzlD3YpLVQMypCTAI//LpgoBu017Era
 4dF5hDS8bgDZONk/qQB/exdlBM7qogjyI7jqCxQ/kbEdgCPVrM9+0KLvVnXQzD2C6/Sd
 t1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mw+Vl7qJFaRHvBXWjasQlSulEgxJHWWFDxforAjHB7o=;
 b=isHeZ7Iqa9bG9+igtyEI5H38OMQaV5rqowD1D6ASzDhtR4C4vJB+q63aAwJLBEP70f
 +bqXdYiXN53wkbU15aeH3USKh5Q44p9FIVyytrwIowxCJDiNHpdwNJXbViF87qdJ3Hau
 0ycziw98Dsz9fXI6NEyAgfGD2F64BRTsbVg7PU9JejXz8RNfpxHGOrPi4nNXIlZJ1t3w
 HtpGY3Fj11sc5SIT29ReiStOgK1sEx0yMhYeP+ifC8jZ/frSbabqZmb5Ue/R8Cdzn826
 eu/wuiOvddadbUSMMToJYDjAcX+lsX+2XDI0Wo0bf2k9WNx2FUac5+rpWpGw97v9FiRh
 zyTQ==
X-Gm-Message-State: AJIora8dfCETRzZtuH6JRkmM9UbVxrSket7785pjutMNzt8uoh9ahafH
 RkjyLRexrruiSZu8SW1gFMVQsfZ7zRg=
X-Google-Smtp-Source: AGRyM1skvD04DN+wos+mTe7GHV3PaInyoS6dNBgFRTzQ1m6Hl1HIqxXJTAU3LFx6GJhTumjkA/Z+Vw==
X-Received: by 2002:a05:6871:811:b0:10c:32ba:8adc with SMTP id
 q17-20020a056871081100b0010c32ba8adcmr16279064oap.22.1658164965438; 
 Mon, 18 Jul 2022 10:22:45 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 13/30] target/ppc: fix exception error code in
 spr_write_excp_vector
Date: Mon, 18 Jul 2022 14:21:51 -0300
Message-Id: <20220718172208.1247624-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

The 'error' argument of gen_inval_exception will be or-ed with
POWERPC_EXCP_INVAL, so it should always be a constant prefixed with
POWERPC_EXCP_INVAL_. No functional change is intended,
spr_write_excp_vector is only used by register_BookE_sprs, and
powerpc_excp_booke ignores the lower 4 bits of the error code on
POWERPC_EXCP_INVAL exceptions.

Also, take the opportunity to replace printf with qemu_log_mask.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220627141104.669152-7-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 30dd524959..da11472877 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -907,9 +907,9 @@ void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
     } else if (sprn >= SPR_BOOKE_IVOR38 && sprn <= SPR_BOOKE_IVOR42) {
         sprn_offs = sprn - SPR_BOOKE_IVOR38 + 38;
     } else {
-        printf("Trying to write an unknown exception vector %d %03x\n",
-               sprn, sprn);
-        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+        qemu_log_mask(LOG_GUEST_ERROR, "Trying to write an unknown exception"
+                      " vector 0x%03x\n", sprn);
+        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
         return;
     }
 
-- 
2.36.1


