Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C32E9C34
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:41:58 +0100 (CET)
Received: from localhost ([::1]:58784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTrh-0000sL-IM
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwTlS-0003uG-Pt
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:35:31 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwTlM-0005zx-TY
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:35:28 -0500
Received: by mail-pg1-x52d.google.com with SMTP id n25so19512768pgb.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T4//Q2GCuPy7as6bx6wtUDgAn+xSz8nl2x8ziXjxGSQ=;
 b=c2eSPGW7PizGHA2sRC+OCDiEm3eF9IHpa5Hr8HQI9E5Y59c1tt9nKFxufYL2x1GAly
 58eFRhVIsvlyUw+5kRRXE5SSDuJtYpiqgzMXkP4M25Yd3PZXLdiIS2V6ueOI/hvdC9bp
 wyb0ViKX4gVoAblonN6u5+zEhlGSlga5MdWPxcL2sSyS6nYQWVAJvP/fdCcaKVAO+EEn
 drkyjXXi7Zorkz9Lqvo7r8tnQGLrpSl0y20u+2qIZRZmCPx0pD1Wtt8hYWncz9w9RwHJ
 dMIql1VtPS7W2vCppMKkwLYB2uDLFii8aQycPzyuWOKmEX7vxcWil4IEVXZqvqDjIW4X
 BMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T4//Q2GCuPy7as6bx6wtUDgAn+xSz8nl2x8ziXjxGSQ=;
 b=WcbGc8lltjaaVx/pUEvxTL7jmm0VREHEC5LtZobZSwgBhpQoNoeg5RVGRgUxMvnsnD
 9SklYt3r6GMNp7gqHYkRc8m6Q22DwexXWXzbTqyIyrXWVTWxfbW7Vhu4wnRxs3blWBpF
 sYRVAhKzl3YbnFmi4rLd0c7cS7HQVnv9Z42gbx7f+D9uiHMgtKTNxhKU4yXYhH5vMUeR
 LVS+ruP2ezoi1N50uv3QZYWBG4cQsXaavbW0uv4VwmdB+sE5OSrtg9cpXUkX6ewpeTR+
 Dy9awZax53Yomz2vgLNulHieNyubj2ddLiDoZ2dg5x6yAmylRUJ8mojfPJjAQzB3CF+p
 Z0gg==
X-Gm-Message-State: AOAM5315Qy7eRiZ+1JZTxJIZ63gfhoOTSUDqBpc2K1r8Lnt3gGxxs1HU
 GBevUaXOAstxLDYK9e4HUnDkFb1KRC+3XA==
X-Google-Smtp-Source: ABdhPJyi/rEgJfkG2fFjR9YIi7QkxL/i7hw+VH+NgDn1kMPmXp5VHGqeoG5NhmZpM3Fq1AQqz48mOw==
X-Received: by 2002:a62:7b84:0:b029:19c:7146:4bbb with SMTP id
 w126-20020a627b840000b029019c71464bbbmr66747940pfc.52.1609781723249; 
 Mon, 04 Jan 2021 09:35:23 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a131sm50706933pfd.171.2021.01.04.09.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 09:35:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] tcg: Add tcg_gen_bswap_tl alias
Date: Mon,  4 Jan 2021 07:35:15 -1000
Message-Id: <20210104173515.198921-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104173515.198921-1-richard.henderson@linaro.org>
References: <20210104173515.198921-1-richard.henderson@linaro.org>
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
Cc: Frank Chang <frank.chang@sifive.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The alias is intended to indicate that the bswap is for the
entire target_long.  This should avoid ifdefs on some targets.

Reviewed-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 5abf17fecc..5b3bdacc39 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1085,6 +1085,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_bswap16_tl tcg_gen_bswap16_i64
 #define tcg_gen_bswap32_tl tcg_gen_bswap32_i64
 #define tcg_gen_bswap64_tl tcg_gen_bswap64_i64
+#define tcg_gen_bswap_tl tcg_gen_bswap64_i64
 #define tcg_gen_concat_tl_i64 tcg_gen_concat32_i64
 #define tcg_gen_extr_i64_tl tcg_gen_extr32_i64
 #define tcg_gen_andc_tl tcg_gen_andc_i64
@@ -1197,6 +1198,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_ext32s_tl tcg_gen_mov_i32
 #define tcg_gen_bswap16_tl tcg_gen_bswap16_i32
 #define tcg_gen_bswap32_tl tcg_gen_bswap32_i32
+#define tcg_gen_bswap_tl tcg_gen_bswap32_i32
 #define tcg_gen_concat_tl_i64 tcg_gen_concat_i32_i64
 #define tcg_gen_extr_i64_tl tcg_gen_extr_i64_i32
 #define tcg_gen_andc_tl tcg_gen_andc_i32
-- 
2.25.1


