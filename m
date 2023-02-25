Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD5F6A2803
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:01:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPp-0000gZ-AB; Sat, 25 Feb 2023 04:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPd-0000RT-IX
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:18 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPb-00053x-U0
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:13 -0500
Received: by mail-pl1-x629.google.com with SMTP id i3so1860021plg.6
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZK6oEbqt3dxsfuMoTh01mcvLTHjmxZXgAn3bafb5zV4=;
 b=nNZrIHOlLuf4uDxOaAf/xets+ez7AySlDQzQpFYD2VzoMJacHyOTmyTl1ldFCbkFyx
 /pgYzQEHKMm03NUseec6HWkkgt43FlmyGUDGPpyvkuLDVklBEsaZSaMtHANIL9p6PxLo
 1lIr/N2FLr+/r8rkGe1kfrLagWoIA8eRckCSdvIlBfvSEbUoRj6CUx9uqzcve1wBhORh
 o3VjRYf7NtFiaHpwAv0bzSps/BuJNfnJVkkdXtjWQWY63r1muFavM7rxDdoTM+GU1B0Q
 Xk7PW2MlbJs8QPMofKZcX2leRLfiLcTOrr0YISmP3CwUZatIN0vYnykg7MdN9ZP+Lytr
 056w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZK6oEbqt3dxsfuMoTh01mcvLTHjmxZXgAn3bafb5zV4=;
 b=ZcYzo7PXsTwIx9Imqsdf1jZG+ySB6GOXMOa+QAx8ZeQIlcEs5bq4TvOpQML4t60BH9
 8b38X0W1Hy499g3FGB7fpchz2FP1vUXB4CJYmsg9aeSO/1hq0tQ1l0vZnXcTsbbkXJNY
 9JG7FPzpWWWho5DOp/evbTmbbRcpIlTiltYnvma9wcF7MsHvjqJZjMz72FDXnsg6OvfK
 KISPdRJCXkwv4dujwej2jYckA2Y+UsjXXTU16tlgW/CXNBkw3aO6WRVIFEmZYfMuBt9w
 VH9JH32nVWqmWtWCBjMVjJEFjfp08jb+teSI2IoyZlcaONIo2Oo188Ycmg6J/o8Pr3Rz
 Ud0g==
X-Gm-Message-State: AO0yUKVjCWgoYB9N3tcovixPavteiOvz1L+d/Tm8P4RocxJ2m5c9BBNs
 5Cc6dDB42FNNIDr3fwJZeoVgLXSuaZDXqZSE6JE=
X-Google-Smtp-Source: AK7set9MEOEzZPkpLGQd/8zzMxiXngS/EkAOTkJNWLfVb2mOFETEq2A3AbDJkAdrvLK3iA6l5i2AVQ==
X-Received: by 2002:a05:6a20:6a98:b0:cc:9643:1f92 with SMTP id
 bi24-20020a056a206a9800b000cc96431f92mr2725157pzb.29.1677315610107; 
 Sat, 25 Feb 2023 01:00:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v3 14/30] tcg: Use tcg_constant_ptr in do_dup
Date: Fri, 24 Feb 2023 22:59:29 -1000
Message-Id: <20230225085945.1798188-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index a10d406bba..877b0b659b 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -630,7 +630,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
      * stores through to memset.
      */
     if (oprsz == maxsz && vece == MO_8) {
-        TCGv_ptr t_size = tcg_const_ptr(oprsz);
+        TCGv_ptr t_size = tcg_constant_ptr(oprsz);
         TCGv_i32 t_val;
 
         if (in_32) {
@@ -646,7 +646,6 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         if (in_64) {
             tcg_temp_free_i32(t_val);
         }
-        tcg_temp_free_ptr(t_size);
         tcg_temp_free_ptr(t_ptr);
         return;
     }
-- 
2.34.1


