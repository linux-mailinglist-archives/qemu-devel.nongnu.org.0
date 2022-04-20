Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC9D5090AC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:48:36 +0200 (CEST)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGJX-0006pC-Bz
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFog-00017j-JM
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:42 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFod-0003Ad-Os
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:41 -0400
Received: by mail-pj1-x102b.google.com with SMTP id o5so2869618pjr.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aa7GfLrKnbPUA3z5/lLY+yzkqrRSnD4Vr5dTEmFhIns=;
 b=BH8H0mVqlO9bAbH3qHCIXMgT61xjEVLJ4XxXGeNzragRjVyjNAj4ezStTpoE8U13wE
 1wdey/pms3CtetrZU4SyI4GOU7sHT+iRloOp1UkSeiP3KG+yoJNeh00I1UMy/6jESeAO
 Vl3KDuqRbjJxbnLoEV8SriQqCcYJax/PQ9g9eBthpwYG/W/ICtuSqCOErf6EwaR1h/p0
 oArBEUkckubWaGh+VKRmhgULEYFeyCFfaEWgr3MlBHzPgSeh9aQIN1jyspR6QdPj3Ajx
 MtGqsteybDZUKZVPVl1606ZBQyj3B6SSA86VlwOdmkft22wA2W5y9ZiapouPEZ2INTqt
 n2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aa7GfLrKnbPUA3z5/lLY+yzkqrRSnD4Vr5dTEmFhIns=;
 b=o96ClLMMHXJtmwIyP30gVj+0UQ+C1S8lnrUUwNpx7t64Bq5rhwXe5T5MSwtJAkcr3n
 1KaTQKskqcqok5mtmtzDSuuCND78R+kkETQ7s6ZiP1z1xghtetjE2kyJ1ffTxjz8KJdR
 RcKqg4Yd0ZZsmOjP3uogCs4Tf1hFu9IVbbJUuntZ8YA6FkM0UWuc8/CcwtARM/8Lpd4Y
 hH5SjYrf2Eit0UiIOIbTC80WMDg59ATmWCOl1jUKiqRFeQGBJV9xDEFD2cTzLcG0d4gZ
 7+3Uwqs6jhx5XXoJ4scd+OZFQmDEVe3LupNWC/myCOuisp9WKo8C8tg5jhvydH9awcpJ
 KZ3g==
X-Gm-Message-State: AOAM531x/y6cukDTq2nxotw46lCmqmoNXpB5WCJSUf8mqS+wuZ/6kSH5
 PUyTcZnqoKyGVdfD1z3QmV9QL3AqsrsCkQ==
X-Google-Smtp-Source: ABdhPJwyJD39uxnLp7hSyo9XpvZHF59cHUufp2S06BhqQXzNKBr+09ZtOLyenr3g1+dh9Qo4f4r/Bg==
X-Received: by 2002:a17:902:8504:b0:158:914f:ca3 with SMTP id
 bj4-20020a170902850400b00158914f0ca3mr22178908plb.67.1650482198510; 
 Wed, 20 Apr 2022 12:16:38 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa79058000000b0050612d0fe01sm20599200pfo.2.2022.04.20.12.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:16:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] tcg: Add tcg_constant_ptr
Date: Wed, 20 Apr 2022 12:16:34 -0700
Message-Id: <20220420191634.1402437-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420191634.1402437-1-richard.henderson@linaro.org>
References: <20220420191634.1402437-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to tcg_const_ptr, defer to tcg_constant_{i32,i64}.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 27de13fae0..61505d20ed 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1056,9 +1056,11 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
 # define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i32((intptr_t)(x)))
+# define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
 # define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i64((intptr_t)(x)))
+# define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
 TCGLabel *gen_new_label(void);
-- 
2.34.1


