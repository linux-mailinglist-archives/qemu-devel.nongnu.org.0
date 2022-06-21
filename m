Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5091552F1B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:48:51 +0200 (CEST)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aV8-0003Sb-KM
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQu-0007jl-2f; Tue, 21 Jun 2022 05:44:29 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:43742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQs-0007Nj-6w; Tue, 21 Jun 2022 05:44:27 -0400
Received: by mail-oi1-x22d.google.com with SMTP id q11so16377118oih.10;
 Tue, 21 Jun 2022 02:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJmxT2IfCe25w3p6faQqmcfgtSmeyNtjvIQRoWdUbow=;
 b=A7qfG13vplFlhsJ57wb19gqSOsJGvPB1kea0SKSjOQ8WkW2HkMTLIAS1hcuESdg0j2
 kRbYh4nTidKteid8YsZHr0IohOj5RYFcqSD1Flx91f5ML+eg+/pAw/xYjj+YpfqgdNdg
 wfExoGFAF9hPC2UzzskRgqgvewG2qVChMYUCPPtKL5PUhUThuq38+lvBlUSTSEWUdcqF
 nAl99qR5IEVYPP7Q12A5KMY+Le7a3BZ2DhSVWF9DXQT+aFzPQQcBm765uOi0QTWnzcKC
 dwfEyXiLkPlgKUjKdqa8p8/WwI/iJs53IWnB2OSGFsI2mg87etSGp8VjSd8VNTg+MLxB
 6V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJmxT2IfCe25w3p6faQqmcfgtSmeyNtjvIQRoWdUbow=;
 b=QqK+c8tuoMfYxe1hy15A5Fh4TmMk5TU8lqpqqs7vkzGskvoqgelJzmPs/TYxpdzVt0
 ZHoE7nQhOD7YLnUJejbEmz+ZvvDRsBy/Kt6U+6qFMQTztPtUPp0bj3MQUwGySgS6qbt4
 SxhVuAhPgpZhv0gWJui4T6j+0BWbeHJwcM7I8l7VvR50d1CWe8AR6+b1mQptCVo3UcZE
 o9VwkhZxdlqePcOGp243DQmi8fn27NxKC3agOE+A9CwXFCTRrCAw0+bUbdnMbZ7cSH6F
 U1i8zm+E8Zl6fpcZiyoxPK4cXCk9AasJ8ZozWY8+c28S12l6BG0Q1qEZilYMPJ2RWXCV
 NPCw==
X-Gm-Message-State: AOAM530YbA+RAWCimCMfzUk2xt+iJ5PJlLcYZHPxQo7j7/3EcK9edFjE
 +cjpFWQQVUHXS6AoJfGNp1qsThSXxT3Iww==
X-Google-Smtp-Source: ABdhPJymV4FNTQu8iIJXxiTzxqcPeWHOajTFGG8HhMQLef4HH5WAxbTt7mo69jIn1plujweNEmbTNw==
X-Received: by 2002:a05:6808:200d:b0:32e:e0c8:add8 with SMTP id
 q13-20020a056808200d00b0032ee0c8add8mr19453354oiw.35.1655804664606; 
 Tue, 21 Jun 2022 02:44:24 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 08/15] target/ppc: Implemented vector module quadword
Date: Tue, 21 Jun 2022 06:43:53 -0300
Message-Id: <20220621094400.122800-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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
vmodsq: Vector Modulo Signed Quadword
vmoduq: Vector Modulo Unsigned Quadword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/744
Message-Id: <20220525134954.85056-9-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 ++
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             | 21 +++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc |  2 ++
 4 files changed, 27 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index e7624300df..d627cfe6ed 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -181,6 +181,8 @@ DEF_HELPER_FLAGS_3(VDIVESD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVEUD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVESQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVEUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMODSQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMODUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 75fa206b39..6ea48d5163 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -807,3 +807,5 @@ VMODSW          000100 ..... ..... ..... 11110001011    @VX
 VMODUW          000100 ..... ..... ..... 11010001011    @VX
 VMODSD          000100 ..... ..... ..... 11111001011    @VX
 VMODUD          000100 ..... ..... ..... 11011001011    @VX
+VMODSQ          000100 ..... ..... ..... 11100001011    @VX
+VMODUQ          000100 ..... ..... ..... 11000001011    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 42f0dcfc52..16357c0900 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1247,6 +1247,27 @@ void helper_VDIVEUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
     }
 }
 
+void helper_VMODSQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    Int128 neg1 = int128_makes64(-1);
+    Int128 int128_min = int128_make128(0, INT64_MIN);
+    if (likely(int128_nz(b->s128) &&
+              (int128_ne(a->s128, int128_min) || int128_ne(b->s128, neg1)))) {
+        t->s128 = int128_rems(a->s128, b->s128);
+    } else {
+        t->s128 = int128_zero(); /* Undefined behavior */
+    }
+}
+
+void helper_VMODUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    if (likely(int128_nz(b->s128))) {
+        t->s128 = int128_remu(a->s128, b->s128);
+    } else {
+        t->s128 = int128_zero(); /* Undefined behavior */
+    }
+}
+
 void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 78277fb018..0b563bed37 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3381,6 +3381,8 @@ TRANS_FLAGS2(ISA310, VMODSW, do_vdiv_vmod, MO_32, do_modsw , NULL)
 TRANS_FLAGS2(ISA310, VMODUW, do_vdiv_vmod, MO_32, do_moduw, NULL)
 TRANS_FLAGS2(ISA310, VMODSD, do_vdiv_vmod, MO_64, NULL, do_modsd)
 TRANS_FLAGS2(ISA310, VMODUD, do_vdiv_vmod, MO_64, NULL, do_modud)
+TRANS_FLAGS2(ISA310, VMODSQ, do_vx_helper, gen_helper_VMODSQ)
+TRANS_FLAGS2(ISA310, VMODUQ, do_vx_helper, gen_helper_VMODUQ)
 
 #undef DIVS32
 #undef DIVU32
-- 
2.36.1


