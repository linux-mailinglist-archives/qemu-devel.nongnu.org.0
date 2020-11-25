Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB642C37E8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:10:52 +0100 (CET)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khm8p-0001T1-M1
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4w-0004gN-Sc
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:50 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4v-00061p-Dg
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:50 -0500
Received: by mail-pl1-x641.google.com with SMTP id l11so464441plt.1
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUvIZnJazJaOEZboAW1OJSDBnVf8XIUz/RaJk/SSM4M=;
 b=gKo6nG+2jXZE3ogTrnzyGe3McgptHnSF8F6CBBoMM2Q1cJxRZP3ua3mgjowIt5vE0k
 6/P+GHygWDH8cuUMEizCIhUO+NAGIEdLWg5j9m3fZE+8DXpLtvMpTRnqTOOvZj5F/5du
 kY6L/SlyQUevSvHLir/mAQSfl8ImPXj+jQ9EYnBVWKgyX5HDxj9MQp2hUoZ7ILfFNS1C
 vg2y0LoVj5dEC9I/fp3r0wh6Ts48kwG0FOu4ocODVVPAqYVXiLdcndY5i5Nf6uUgZ6zu
 z6o2nnk17tpk61aCnII1ZMBu11tYs9VM9ePmcRs2xRYPM+grCB1wB/dhLDmEP3b2HZ02
 hFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUvIZnJazJaOEZboAW1OJSDBnVf8XIUz/RaJk/SSM4M=;
 b=at7lNpP/hhE73C8cwWNxLSZD7JLd9gpCHMU16dh6zSXnlB9K8LHMlOGOd+TKa8+QIe
 PiMdeLu2m2D9Q6yEKhc3ujMS+jV4iWX5djOaylChBrN68ThTHZ5HRnVWOkEEHJvte1NV
 V2Fkct2agvLEI/XPG5ISu39qJdRueKTDNwrZzUqbEQBwufU51p12fIgcrzKA3izIwxQ6
 GQvTdJ+ThzY7VYfpjDeRNxfI9qdCduYQYWWbZKGQv5+F579HiqKsJfKAUOnwVsMLgi0O
 U8YKMU+CLAN1B6ag0ME6mOL8cJW3UONDb5jLajSg3xDxDygtDrDBAZws9X9aEYvdtP2l
 WpqQ==
X-Gm-Message-State: AOAM530APYbN0wEoGGhUV1y96SqSEZohWV/mR/HxoVjYaxD384DrCe1l
 WCqFxhautEFPwHVc2lKy6zi/DYkI7UN2dg==
X-Google-Smtp-Source: ABdhPJyGmnSUMEkJY27qWB9YHgw+FVaPTafkE04FKKlTCdH1k6sAud48KBBMpc86FJqNUdgJKybqSA==
X-Received: by 2002:a17:902:9a8e:b029:d8:d989:4f80 with SMTP id
 w14-20020a1709029a8eb02900d8d9894f80mr1514185plp.32.1606277207801; 
 Tue, 24 Nov 2020 20:06:47 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
Date: Tue, 24 Nov 2020 20:06:33 -0800
Message-Id: <20201125040642.2339476-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/arm/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 17883d00f4..73b3d8cbbf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6876,7 +6876,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
 
 static bool trans_STL(DisasContext *s, arg_STL *a)
 {
-    return op_stl(s, a, MO_UL);
+    return op_stl(s, a, MO_UL | MO_ALIGN);
 }
 
 static bool trans_STLB(DisasContext *s, arg_STL *a)
@@ -6886,7 +6886,7 @@ static bool trans_STLB(DisasContext *s, arg_STL *a)
 
 static bool trans_STLH(DisasContext *s, arg_STL *a)
 {
-    return op_stl(s, a, MO_UW);
+    return op_stl(s, a, MO_UW | MO_ALIGN);
 }
 
 static bool op_ldrex(DisasContext *s, arg_LDREX *a, MemOp mop, bool acq)
@@ -7033,7 +7033,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
 static bool trans_LDA(DisasContext *s, arg_LDA *a)
 {
-    return op_lda(s, a, MO_UL);
+    return op_lda(s, a, MO_UL | MO_ALIGN);
 }
 
 static bool trans_LDAB(DisasContext *s, arg_LDA *a)
@@ -7043,7 +7043,7 @@ static bool trans_LDAB(DisasContext *s, arg_LDA *a)
 
 static bool trans_LDAH(DisasContext *s, arg_LDA *a)
 {
-    return op_lda(s, a, MO_UW);
+    return op_lda(s, a, MO_UW | MO_ALIGN);
 }
 
 /*
-- 
2.25.1


