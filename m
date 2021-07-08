Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882673C192F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:29:17 +0200 (CEST)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ylw-0003pi-BG
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiJ-00014g-8V
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:31 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiA-0007qr-G5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:25 -0400
Received: by mail-pg1-x52d.google.com with SMTP id a2so7093348pgi.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LYwdLGdxFBqRUG0Nl6JfEy7jBaqOaBmdsLuMoOqVtCU=;
 b=TuIAIJvcq27rsPLad6HLK1J/heEpmKK7qqlOr/es0TtHbp0W+2l6UmS+eZK4/3/NUM
 mchrPTbQ01hhmLk2JeDza31HGJ/DfzulRgfa7LPyBPnKg0PFy1efofRicODy6lRQeCdQ
 IcziZf3SMEgcBrItudR4uIxLjPQZYSHIkd7HfP6xoWOxI7dIvNFOJyRh6dzyeHEqaXju
 U8TKnH3R+CSl6lLUA0HK9UEMS/T5JLzWKxe0bDiLwDKSTtvLQDiiJyYmoeXl4bvigrDd
 8oyRUXhqnAK+8TB9DTn7J/a3UKn9TLjFMOmvX9cV0xu3Azjxd9eP3dfp0u5llURKcNEA
 aYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYwdLGdxFBqRUG0Nl6JfEy7jBaqOaBmdsLuMoOqVtCU=;
 b=CMiXHEM6UcNxbBi1Mi0+q+EqI8oyXcVn57BayTeBW34xl55ixoPaD5OK+5dedeXLvK
 REMy4IJb6sQZnoDkUgKARtx4l2M5OLzO/tqavWH3gy2MrRyYA1h4qwDvw8HDBByjyc+p
 74VgSbJpH/D9qHRf63HtAwZUhDCW3dVnqRfh3dNDaK2ljRGli9s7mOW9xyXSE/iQ1pOX
 5IOghwvpottiqLNo4cqFwWgTqKWd2A59yfxLh+zL3Nzo5rAl1lRxa0ATVc1ABJvWXXFx
 wQHRBxKoTL6ZmYVwGri7i3fvXlNpxRLvDo4PH0idc46IuUJUxJUTxJkkJfmZR0IfIQpl
 gIMQ==
X-Gm-Message-State: AOAM531iGpzUNAYJ5B7TAoxAXw+Yvx+CnE2ErwrG96KNNKrrtou11Sqf
 hofO8IC0rRsFQJoGJmis1tvi3uNd3dsJYQ==
X-Google-Smtp-Source: ABdhPJzKHaGNNo1BIj/pfJ2WEy2cYjHdaC8M7wxBdFszbqIFrgm/PTNjPr0nAbVGmS8Xm5evc6Ho9Q==
X-Received: by 2002:a63:af18:: with SMTP id w24mr33243122pge.375.1625768720644; 
 Thu, 08 Jul 2021 11:25:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d67sm2751810pfd.81.2021.07.08.11.25.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:25:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/alpha: Store set into rx flag
Date: Thu,  8 Jul 2021 11:25:16 -0700
Message-Id: <20210708182519.750626-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708182519.750626-1-richard.henderson@linaro.org>
References: <20210708182519.750626-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A paste-o meant that we wrote back the existing value
of the RX flag rather than changing it to TMP.

Use tcg_constant_i64 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index f2922f5f8c..d8bd47de75 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -1116,15 +1116,11 @@ static void gen_msk_l(DisasContext *ctx, TCGv vc, TCGv va, int rb, bool islit,
 
 static void gen_rx(DisasContext *ctx, int ra, int set)
 {
-    TCGv tmp;
-
     if (ra != 31) {
         ld_flag_byte(ctx->ir[ra], ENV_FLAG_RX_SHIFT);
     }
 
-    tmp = tcg_const_i64(set);
-    st_flag_byte(ctx->ir[ra], ENV_FLAG_RX_SHIFT);
-    tcg_temp_free(tmp);
+    st_flag_byte(tcg_constant_i64(set), ENV_FLAG_RX_SHIFT);
 }
 
 static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
-- 
2.25.1


