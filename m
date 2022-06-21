Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDDF552F42
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:58:19 +0200 (CEST)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aeI-0003YZ-VT
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQs-0007iV-AX; Tue, 21 Jun 2022 05:44:27 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQq-0007N5-4e; Tue, 21 Jun 2022 05:44:26 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-101ec2d6087so7202287fac.3; 
 Tue, 21 Jun 2022 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qPWT3juBHtZ/QDmogkBLJLVVTuDNOQQhStTTzFMbikg=;
 b=frQrqV8GVz6UrX1MfwEN7gd79LzIXcczuzL4zhPMG3UznEEdT694g9bVwhUWJd1Xin
 5VPQop8qGXSLlUMYnAHyX9JUYXfQIM+RCHZhcoDLGlUGrrSxZd30U8g9u5tGYkEBB+aB
 alvOwDMIu6oUENyGcFHnZwVA/dUFBE2zMK4iZV6cUi8zRKt/C8lJsLMMEXh3949AuCdB
 LaRwShkEgKA7wcLxvApxn/bK469Y5wEToWMXA/yRgVzpYIhlPz0vohVwe5fKml3XgieX
 Ma2MS/wFSuH5h/uoB9q+0SAZM2PfTUvvqoMUEPtbCf4PviyJxrrLl2BJdDA7WsclsiDM
 zPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPWT3juBHtZ/QDmogkBLJLVVTuDNOQQhStTTzFMbikg=;
 b=UxKyQ15UY0hx/JX/xEE97KX2i8hgXvraxusVtofMWkGcUfJkvuDcBeyVTlnW8GOfUl
 Oh61VYmn+veJQlMH9CSH3B2K51YIIkJ1O64deMrrBWIphyOea0t3q/sFo+/3UDUr4dJe
 Jqa+hfHLGkbrOqyMaC6nOkPxI5EciGwa5wl8OOaBto8C4PoixcDD3jvRYV6oawm0K59W
 Nkk3S2Wp32nIDF3i5cmT5yYt1PA0j0pakw+egDgKWjHayRgoyz90Zspop3d9eBnLCj23
 SbInAKWcgNzI78PH8R5mfDT2F494HU1hrIvtB+qDJSpPBeiUDq4AVFht759A1yh1i+Xa
 yUBg==
X-Gm-Message-State: AJIora848DZElCugVCNog0tXr3K2p5ezvNJhBfSx1elmiZhE0oAMi7GC
 zL7uwTVfqA/dkhHQHwdMjoE4m+FL0ZDQ2Q==
X-Google-Smtp-Source: AGRyM1vBtCJ8T3g1WnWOE0l5SVtu2FS0dazATeNtZ+5W/0zSG1CWSP5wwNC4v7DK4Jdb+ByRDTCpyQ==
X-Received: by 2002:a05:6870:f597:b0:101:342:9722 with SMTP id
 eh23-20020a056870f59700b0010103429722mr14481240oab.54.1655804662452; 
 Tue, 21 Jun 2022 02:44:22 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 07/15] target/ppc: Implemented vector module word/doubleword
Date: Tue, 21 Jun 2022 06:43:52 -0300
Message-Id: <20220621094400.122800-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vmodsw: Vector Modulo Signed Word
vmoduw: Vector Modulo Unsigned Word
vmodsd: Vector Modulo Signed Doubleword
vmodud: Vector Modulo Unsigned Doubleword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220525134954.85056-8-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/translate/vmx-impl.c.inc | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5b2d7824a0..75fa206b39 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -802,3 +802,8 @@ VDIVESD         000100 ..... ..... ..... 01111001011    @VX
 VDIVEUD         000100 ..... ..... ..... 01011001011    @VX
 VDIVESQ         000100 ..... ..... ..... 01100001011    @VX
 VDIVEUQ         000100 ..... ..... ..... 01000001011    @VX
+
+VMODSW          000100 ..... ..... ..... 11110001011    @VX
+VMODUW          000100 ..... ..... ..... 11010001011    @VX
+VMODSD          000100 ..... ..... ..... 11111001011    @VX
+VMODUD          000100 ..... ..... ..... 11011001011    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index f00aa64bf9..78277fb018 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3365,6 +3365,11 @@ static void do_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
 DIVS32(do_divesw, do_dives_i32)
 DIVU32(do_diveuw, do_diveu_i32)
 
+DIVS32(do_modsw, tcg_gen_rem_i32)
+DIVU32(do_moduw, tcg_gen_remu_i32)
+DIVS64(do_modsd, tcg_gen_rem_i64)
+DIVU64(do_modud, tcg_gen_remu_i64)
+
 TRANS_FLAGS2(ISA310, VDIVESW, do_vdiv_vmod, MO_32, do_divesw, NULL)
 TRANS_FLAGS2(ISA310, VDIVEUW, do_vdiv_vmod, MO_32, do_diveuw, NULL)
 TRANS_FLAGS2(ISA310, VDIVESD, do_vx_helper, gen_helper_VDIVESD)
@@ -3372,6 +3377,11 @@ TRANS_FLAGS2(ISA310, VDIVEUD, do_vx_helper, gen_helper_VDIVEUD)
 TRANS_FLAGS2(ISA310, VDIVESQ, do_vx_helper, gen_helper_VDIVESQ)
 TRANS_FLAGS2(ISA310, VDIVEUQ, do_vx_helper, gen_helper_VDIVEUQ)
 
+TRANS_FLAGS2(ISA310, VMODSW, do_vdiv_vmod, MO_32, do_modsw , NULL)
+TRANS_FLAGS2(ISA310, VMODUW, do_vdiv_vmod, MO_32, do_moduw, NULL)
+TRANS_FLAGS2(ISA310, VMODSD, do_vdiv_vmod, MO_64, NULL, do_modsd)
+TRANS_FLAGS2(ISA310, VMODUD, do_vdiv_vmod, MO_64, NULL, do_modud)
+
 #undef DIVS32
 #undef DIVU32
 #undef DIVS64
-- 
2.36.1


