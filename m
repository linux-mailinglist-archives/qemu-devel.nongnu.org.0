Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF1842C8AF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:28:55 +0200 (CEST)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maizm-0003re-4q
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maits-0003em-EL
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitq-00030I-GQ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso5062007pjb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i46GtS4jZvhz3YUTttQkHHMj47qcgxPUFuoIgSOj1ts=;
 b=iYmr+oX/654rXqGm3ky/GK/ZO56e9EP+R3c4eHdt5iXvc0kIpMMVCzkQYlYOFk8dLm
 8piiHXE/hTOjpBcmW17TEzQ3UoGAqPa94Q5s3hDLfozf8uOFN5hoyudKoXtTXFqve4wk
 3xCe3qsiJSzMFpWcHKjbZS0y+i+K+QDQmnYej5d4BdgImWF8O7PkIksAiKiJY1E4Hfxv
 wyy01zPv06yunF0MugpnEP/29PFkXB23SHGSPXC4tn87gdPvb9kk/q/sZm6416ogLPar
 t0Un4dsSE6hpoWeuZp2/Zv5vmmritczrfDfofRbTd+W23klODbWx+9pf9kXko2WbRidX
 Af4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i46GtS4jZvhz3YUTttQkHHMj47qcgxPUFuoIgSOj1ts=;
 b=044UY1tpaiiwDfP/Nt5TgHEFVrj/9IZjUl39y8K20z5CHAGg8fIjXT0XobMpqLTinv
 6U10tsCfwbWlgv2xEWX3DR7zIn6Nz8+xzi2G1T3aRFrTdzZIXiXs0RvzS2mFgkHAE64g
 aKsWus4Df/gc5B1p14vi//l3dSBA/PxuzaGHul/BtsqD9VF6kRRS62CD47orxfkaP5Zp
 qm2YM6+eiNVsRRp/ZVNUsc7ON43iw8kd71xqesmN6JRh+7kHF96psexkOqYuK9R6FYp0
 QQGy6dzESArT6FgCpda9zE/Fy7rDtZ8ZN3azGCoRHfACxZTSjCQc91n5sW3l1d8s7kaL
 YvQA==
X-Gm-Message-State: AOAM533+/YQvr56T2MgB6OBetgUfmoNgZ8IXy1XsdM1er4c3QRzUwb4Q
 NRewtgB4223cBCScdnUCPHu5VZe+Uul6+w==
X-Google-Smtp-Source: ABdhPJymOtgvsJJaB7HZrTrIAaDv9sAFQQQV0wQZjAhOIVfFBNew/y4IS0Ttb2BP1BGRxAujUrUqNA==
X-Received: by 2002:a17:90b:1a91:: with SMTP id
 ng17mr925433pjb.61.1634149365181; 
 Wed, 13 Oct 2021 11:22:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] target/i386: Use MO_128 for 16 byte atomics
Date: Wed, 13 Oct 2021 11:22:27 -0700
Message-Id: <20211013182239.991127-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 0fd696f9c1..a207e624cb 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -136,7 +136,7 @@ void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
         Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
 
         int mem_idx = cpu_mmu_index(env, false);
-        MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+        MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
         Int128 oldv = cpu_atomic_cmpxchgo_le_mmu(env, a0, cmpv, newv, oi, ra);
 
         if (int128_eq(oldv, cmpv)) {
-- 
2.25.1


