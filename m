Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D8C5F1DCE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:44:17 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefb6-00057h-OC
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHa-0006l4-3v
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:07 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHW-0006Dr-1K
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:04 -0400
Received: by mail-qt1-x82a.google.com with SMTP id r20so4338428qtn.12
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=P8opVlBK6qS9SIIhCXO8x07deEen8LaeMoy6ZbnmA70=;
 b=XAdRu//vQrtm6MSyDktvSrC/IqCmY012tqjZz2Xrsz/bOM3CXp0EpydwCu/meiwmDX
 RT/71PsrNX2vJbfW5/Jiw5Fm3UpTRadqPl4trnWoBfxwWt4UZqn0bpVS0KKm4fcnoeRw
 Z31LUjfBRwCQCiBn56kJSQBYbtx/eid8dynmBXrdAyIqINOzOhj+StKzPXNi5mmE4Sx+
 pBbc/4bp+Z6gi2mKUjv4kQ5PpgGj8mLR76ILvFg7cxBiJ6e4o5grJJfNG20sYCW9PMsu
 J3p5JiRO1yzPaqMkfM26Fbj+kVL9WN4IuB2CZibuz3o9bwysa85m/n7ebDeKJVI1HY9k
 Io4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=P8opVlBK6qS9SIIhCXO8x07deEen8LaeMoy6ZbnmA70=;
 b=M+DfIgjGGHiusbbGQiPc9WVNA5MSveGPQxlWrKyicaigWZq8sPFrjN6Ppb16u2dy/V
 OjKL7JNoP82zGAD/pjHw+SbhFuHwv/YwSdeF+TNmZfey910aE1DhvfDrDZItig/QhrVt
 y9ZbGtAacNgAfJIu7gwFllQEc63eQIYBTuJjQlKXsIHfQ3VxJi9p6bmhiTkzVC8U+ba0
 cbgWscX3NVLjyIAIYmhRWG+vRt7wUWXoQHYUaEjm7xchS91S/zTwR6D22C+FYaA7HYBa
 dbsu8dN/nAJKR2spn7iDDXF0CAQtmJiTosIdr3GScA7xGRt6K9r4VlihKFrNrDhQ6GPu
 FssQ==
X-Gm-Message-State: ACrzQf3HFafsdKOvLfRtTHXVPBbZr+g23zapXetLcKkODcZ1C8OUaVLG
 rAhJbqXhfxEu+Ims1vi1++XWqcYNOwBP5A==
X-Google-Smtp-Source: AMsMyM6DXj7R9KsmdFBTut3hAEDzVtOr+cTMPs7XCZC3atgNcxGc7/pKnvqnskoTTJOFiXDNZeLNiw==
X-Received: by 2002:ac8:57cc:0:b0:35c:b5d1:9024 with SMTP id
 w12-20020ac857cc000000b0035cb5d19024mr11070281qta.214.1664641439948; 
 Sat, 01 Oct 2022 09:23:59 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 15/42] target/arm: Remove env argument from
 combined_attrs_fwb
Date: Sat,  1 Oct 2022 09:22:51 -0700
Message-Id: <20221001162318.153420-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cb072792a2..2f0eeee161 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2172,8 +2172,7 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
  * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
  * combined attributes in MAIR_EL1 format.
  */
-static uint8_t combined_attrs_fwb(CPUARMState *env,
-                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
+static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     switch (s2.attrs) {
     case 7:
@@ -2246,7 +2245,7 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
 
     /* Combine memory type and cacheability attributes */
     if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        ret.attrs = combined_attrs_fwb(env, s1, s2);
+        ret.attrs = combined_attrs_fwb(s1, s2);
     } else {
         ret.attrs = combined_attrs_nofwb(env, s1, s2);
     }
-- 
2.34.1


