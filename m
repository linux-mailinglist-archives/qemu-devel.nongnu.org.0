Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2912D31D9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:13:33 +0100 (CET)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhUS-0001WD-A8
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIx-0007cZ-U4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:39 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIs-0006M8-Um
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:39 -0500
Received: by mail-oi1-x242.google.com with SMTP id l207so17414004oib.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUfNI6lSQTHtTIy/R3dj+quaDZ+MrAap7g+O0IjmyH8=;
 b=XP8TVatDueQeXKCgPRZA8Y4OOTa2lT8MrzBY2MU3P44NYgOWuUOcebfowwALjA6vKl
 FmAzAf2BeRwnTqKVP178WlnDXg2l0GaNR70B+ac4I8jIHS0IXswM1wloVKU5FvioAGAq
 eSakmxEvtyMUVzvDPYkp+maQOBctI83QeVh2c2z2IdG6lZjPNqKNwA0T+oyXFJSHpO3Y
 SAmi9d+8TADd4Odt8moOjqlaPYa8C1BuV0Q7+J6cZlBhO8IxIQ6DakIgucfql69Bhjoh
 VryqozlkKjfDH5POZogG71JqiQgT282ZUg6ghEmCDk/aSGYpIxDHKZBI3p0uVLw4JWuh
 48Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUfNI6lSQTHtTIy/R3dj+quaDZ+MrAap7g+O0IjmyH8=;
 b=VGf3o1NBZWsFFyISM4XZwgJkvA+hAbT0ZOPGHbamq0pipkzO4ia6FHWSUE2QuyAUpn
 9UFkXWxtw35ELsHE/QdMnmcEs75dhb269Tzq1v/hvzsnCT3IKaYT9s73jbMocUPoPBUP
 Q0N583y1T/tRdZeX3pmWNSyWB4KJIDlHR9fSSB2/q+72L/G5Tcd0Yu2YrnxRNBym6QQS
 mtDlZUM9hQuGjQgUuU3Pxtyb0z+tTDHgojXITmA+ptI0vL5+PvG626/KzW/e5HvHmzWd
 yNtOeXaBe3N5nIQzkLm0gICEFxhVWtprvkNucEGDAz95VowRr/XHQuHJB6+e3ASqXMBR
 OXXg==
X-Gm-Message-State: AOAM531roQCXrNCy16t6YrITVYBCjMwLF1ne8yAKi6okaZB8/eaiSPcd
 b6YrXp9BSl6r30Xs5398iAMX69jL/AvzoNkz
X-Google-Smtp-Source: ABdhPJxiDf5mI80rEtfScP+BGF/CCFhPZkQUy1oz5f9rtiwDalci+5YtGubL9cghpYAPUh2HrvqgWA==
X-Received: by 2002:aca:3ad6:: with SMTP id h205mr3700619oia.119.1607450493653; 
 Tue, 08 Dec 2020 10:01:33 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
Date: Tue,  8 Dec 2020 12:01:02 -0600
Message-Id: <20201208180118.157911-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9ca06cb373..1bfa209884 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6876,7 +6876,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
     tcg_temp_free_i32(tmp);
@@ -7032,7 +7032,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
     tcg_temp_free_i32(addr);
 
-- 
2.25.1


