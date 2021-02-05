Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C656A311644
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:00:19 +0100 (CET)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A5K-00059k-QU
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A28-0001CS-Bp
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:00 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A26-00039E-QJ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:00 -0500
Received: by mail-pg1-x532.google.com with SMTP id o7so5596249pgl.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/ZgyQAuQvE4YcOG34t++03WUxcDnhNMW/sElkvFii8=;
 b=Sm2DRgcaealHOz6DVWja2oTH7ZYjsKCP9FKO/tiksAfYErg9t6Mp43YGDVYEEi5lYE
 spmLKi8Y6MOxzKH57JRnw2EeEt7czJGgb0705w+HGLadSUhJo654pSU5M4n3Hc2CEVyW
 gq9T6YtQ3lEps9GtREfxNIsP3BVhBeMLpP1LIUO3OjFpOlU1tS3lib19ZAFjwLDKwasv
 bYeQqG3yDfDrZjvoLmQltPN+1IMuRBVamT7Fht2g5xaUIZpkies8PmXfFWl/B54yZaBG
 J7v94qywKLlaBDcIoiaiq7WRZ4We/nlkC8Mmp0L46xLnnjhNoKGOOZwh47zU6xX0mcEd
 iRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/ZgyQAuQvE4YcOG34t++03WUxcDnhNMW/sElkvFii8=;
 b=P/fl7LiDLSqxDm2qHmE6Yyj4lG53oK+Wxw4r1ciAf3vGTnIRPScu9AB4y01HiXRteI
 g++ZvoPAutYRxJgpVPOeGIaV2A4Bf9wP+ucNa7oj74e3RODWW42gUSipNlypSbNHmZBV
 IQrqNHOHMLvC/3BH0GsS7/KCvWkjM0qVULWRuO9VyxpK6neV5NGRITx6YI1UgefqyAn+
 GS84Z5C3a5ssQffneM38gAKL68rxefIiwmDgVkjKrQmrPNxrtoEfYpPgXRCVgkUJbuB3
 Px8eh6MX4F37FlNEpEzMzjerLOnddjbV3IpUY0gjSQhXdzpWB/MlMOfNVGvIKGQGauTM
 YHJA==
X-Gm-Message-State: AOAM530rvz0OqXz+YZmxqTVUl9M73hnzzZyCjMlK51ldYSJfu3IIhPQP
 7tpKYTzPOaDmtM1JI21DjBQRWoGJEtR+5Juf
X-Google-Smtp-Source: ABdhPJyOs5BxPpbK8QhT0kj4SDDR5+3mgVIqBSov6UC205J1M6j9gd7PwN4rB1XBMEPUKGxUdi/rAg==
X-Received: by 2002:a63:2306:: with SMTP id j6mr6591705pgj.187.1612565816421; 
 Fri, 05 Feb 2021 14:56:56 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:56:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/46] tcg/s390: Fix compare instruction from
 extended-immediate facility
Date: Fri,  5 Feb 2021 12:56:05 -1000
Message-Id: <20210205225650.1330794-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The code is currently comparing c2 to the type promotion of
uint32_t and int32_t. That is, the conversion rules are as:

  (common_type) c2 == (common_type) (uint32_t)
                        (is_unsigned
                        ? (uint32_t)c2
                        : (uint32_t)(int32_t)c2)

In the signed case we lose the desired sign extensions because
of the argument promotion rules of the ternary operator.

Solve the problem by doing the round-trip parsing through the
intermediate type and back to the desired common type (all at
one expression).

Fixes: a534bb15f30 ("tcg/s390: Use constant pool for cmpi")
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Reported-by: Richard W.M. Jones <rjones@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210204182902.1742826-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index b67470137c..695d7ee652 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1067,7 +1067,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
                 op = (is_unsigned ? RIL_CLFI : RIL_CFI);
                 tcg_out_insn_RIL(s, op, r1, c2);
                 goto exit;
-            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
+            } else if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
                 op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
                 tcg_out_insn_RIL(s, op, r1, c2);
                 goto exit;
-- 
2.25.1


