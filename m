Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD559C3F3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:21:14 +0200 (CEST)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAAp-00066D-VS
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LQ-0007gY-7e
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LI-0000j5-Cp
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso10989455pjd.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=GSDRuelmXHTBnV2ZkAtPbMvnakhm9Yy5oZigW0sA2/o=;
 b=cHY4ia1PZSpVvJpUxvTTZbwuO2D/HWRflpj0x13V4BecdfuMBpgylaFlqOAQI/8ZnD
 IYwmpO2jIThSBmZF/tnFxk6c/L+28IUZXkMVkaEg8UuBQAlCOfwjHkOK0WKC/+YK9uck
 mlVpdn9IIZpj4I4szremlgvWVUbNr3mv+euxyoyFbZ3VefTXwBdJgaBq/Ng84PSK9xFX
 t3LkcgrzUHzb5Anoky24lm7sQez2DleJ+rNCdXTQz4Blsa1ezTznyfx1uDsCmSz6SmJK
 SO+1X7TmsVI7S3KJsecg8mji9pkNa2Kn2S8KzSmJ9IOnJkwxOsRgYEuKfpPSf9M+du6h
 xO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=GSDRuelmXHTBnV2ZkAtPbMvnakhm9Yy5oZigW0sA2/o=;
 b=mEI3aQX/L7vW9092s+dlcEf0JJQqSNCCwD4JfO7leG3DzgImv2avXNdcTVVOi7nmBT
 rzTGaPnWaIp7NX3AOUgKaW7w7/e66sq479huEbEuig/fAfYjhVLWKIaiAfMpbuhQQYeL
 125z2VRzyU84ohdCnOVt9/WtYP3tl+k4upNZoFq5flgsRoEXLbUf8flV6op0HGdPx2bm
 jPEUjJexK76SXWveXybpIbP8+G8c6FOmUSHDsXWldalQOEcHzQJGbNW2QAVYxvNT/Ps3
 wg5flx4kcnfTVqI1zJNzt8Fjs2bgYi4+a03TJIw0yEEnm3zz3VcklnvVfkr7a1dciTR9
 4jVw==
X-Gm-Message-State: ACgBeo3fqYM/U9XNfEOHROLAcKRoH+PWM3suj2/ybKGR6Mac2b5+8ewD
 rm5ipKGYltwRspbYrTmIC2x6ayU9plSY6A==
X-Google-Smtp-Source: AA6agR74a3Kua1RUQ2FTMYSgGFm4G+xzSJF6XaR3TwflcTqQqJdumkXJ2tmxpngfHg40xSGQT8pE0A==
X-Received: by 2002:a17:902:a511:b0:172:97a7:6f5d with SMTP id
 s17-20020a170902a51100b0017297a76f5dmr20720936plq.159.1661182074999; 
 Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 15/66] target/arm: Add secure parameter to
 get_phys_addr_pmsav8
Date: Mon, 22 Aug 2022 08:26:50 -0700
Message-Id: <20220822152741.1617527-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the use of regime_is_secure from get_phys_addr_pmsav8.
Since we already had a local variable named secure, use that.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a6880d051b..fccac2d71f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1963,10 +1963,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
     bool ret;
 
@@ -2411,7 +2410,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.34.1


