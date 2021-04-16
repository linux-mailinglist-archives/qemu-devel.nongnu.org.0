Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFF362A41
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:26:10 +0200 (CEST)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXVyb-0001Lr-Li
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcN-0004OG-4a
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:11 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcI-0001Bt-3U
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:10 -0400
Received: by mail-pg1-x534.google.com with SMTP id y32so19997445pga.11
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
 b=s1IFdpLlqQ1L5fv0FTDrAIpbnnxa6QiLP2RYTVXO0aGQK7AL53Gsn/7oc9NWL7EAYK
 wfaFpkqhVwtpaDE6Ln7pG367e6S5EBUWs9LRiSxaFVeyxo/hQEgsx2rxFGLMDfuaC678
 +iZiSK1Hc6wWZrsx5VH6nA2OkDytIx+ewOgAag6RDrY+6DKd6fnIrguOUPVQx4RnVXHf
 ec57JUryNlheRWbMciUOFrR7LaS557vgapX+X8fk9L75f8YliAiDc35sKWJdt+EOqRRv
 Ji2gw0R6QmOaYD3+c9eCc0of/U3kGRi6zLfNg3lb+fA6WTx7AtkXHs2JElsZkXByp7Yt
 +2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
 b=B3nqaOeA3I50SnmobFz5XQlQiPg9UuDtV6XPYQ3XKuc4FTa0anRRhGrYb0lTByPrBA
 X5gVwajD5x7pIqdbX57RvfLzFxEDYH7vWnAbsLIu1NJtp7YOlQ5pPIHRfbJsugH2X2sr
 vIWHkRDZbxDL0844jkVZpcfRXh9JvZffVpRdlAu/IPhmWaTDsKAdVlVpyKeOtCUKbf82
 vAMipPmlLDRJaf0R0JMmepz5cn8pJTzEshMzZsYzg57XxwTNqTX1mPMw2DHeBSSGCSSJ
 1sOLJGc+6YDf89azcBqn7FI7h+lfCdaDiQ3HbsqybtkemOXXqqg/olFvGOHiv/4SePy7
 M90A==
X-Gm-Message-State: AOAM533B04KjOtImCHk3wnbc/Ge3n5wu9gJYtdgngFz8E40MKqTfrgDV
 L265cJF47vdtrq15b9mA8JMriFrbQzVP/Q==
X-Google-Smtp-Source: ABdhPJzYNZS+2SE5rMoxl4De0t3I+TgYHLjwT8p4Sg3mIFMYYZ3HjbCQ+YibCXRbnRerKIVpagTDKg==
X-Received: by 2002:a63:2c92:: with SMTP id s140mr819968pgs.39.1618606984307; 
 Fri, 16 Apr 2021 14:03:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/81] target/arm: Implement SVE2 bitwise shift and insert
Date: Fri, 16 Apr 2021 14:01:41 -0700
Message-Id: <20210416210240.1591291-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d3c4ec6dd1..695a16551e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c11074cccc..d74a15d8b8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6428,3 +6428,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sli);
+}
-- 
2.25.1


