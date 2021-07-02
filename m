Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997533BA0EB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:07:37 +0200 (CEST)
Received: from localhost ([::1]:34512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzItM-0005CU-Kp
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm8-0007dr-Ur
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm5-0007hz-NZ
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j39-20020a05600c1c27b029020028e48b8fso665800wms.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Im0olX0/F3GtI0a6wJ4ieferDp0z5buiZuvFyYo4YP8=;
 b=m+JEvtuohgiKdGCrweDjTuAqBb9P91M6OI2NGdbgsKtSt/4VHo8lRDrxjDCxcy6Xtv
 tGFtoHnTEtymEMmdeJF29w197HQDUd4MsAoaR7+q0cEJkLiNtMeDyMwDHnH4hXfdQn0A
 /PWf+M0/Dxrb+nKjhuYkGShK0Loi0oFJwWBXuQAIKl8Eumh0sYFdqph6ptkz4bDQdQJ4
 5rfmjaXTTMZQt7ENvw6NYteqdIgx9mbf6C4IWgdopquwvXid6LTjd5LHIMX0iTuhwHBL
 E33lbO3vgzbKcO/n8ksaN0LIXENYsIdFERcSnqiFqrHwQMZcfaIocCp2St+vBQNZNBxv
 JqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Im0olX0/F3GtI0a6wJ4ieferDp0z5buiZuvFyYo4YP8=;
 b=XSQiKa1vOex3vXaBamnQj68WZnLzszmecbgbOrtQSpipnyUb5J4T3kmv2RmffeVG5Z
 QUuC2VT3M+0fbo2JVjbNiTS8LnYZcQa13wH4syGgvqeJbqO1buN0Gg2XajcbZ9m+rDDc
 gy0lx8rCZJxG8rJCEc/nNHJQDRCf6lQvHemsn9yflsxbCzn4/ZPtZN7LdmLYPl75xjmK
 0Q45eviPCL4WPHW1URkYPKGB+sOwFmpmBaKLcUSvZswv4QyQfKO2ASGBJN0YS9x9bUA1
 7KUpuGD1ERoeCUVHyesBptSu+GqCiii6UGXMGXGUxIzpBVgVb6v8pYYy8QFkV3y/VNKU
 DcLg==
X-Gm-Message-State: AOAM533NemcC7lsFaDC/mNQo3gzOGz8oc4PsubTE9j3FPKHqXsGc7zO7
 +51pPf6Fb0wqO8ieVgajkiU8vuBK/w/JR/0h
X-Google-Smtp-Source: ABdhPJwvD609FK0KiZuIVBjpHJ6j1rOCEpIj6X+7MzuBbA6Ehro2XSrYT9FAM5KxvbmCs9nYlBLtrQ==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr8743360wmf.157.1625230804145; 
 Fri, 02 Jul 2021 06:00:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/24] target/arm: Use dup_const() instead of
 bitfield_replicate()
Date: Fri,  2 Jul 2021 13:59:41 +0100
Message-Id: <20210702125954.13247-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Use dup_const() instead of bitfield_replicate() in
disas_simd_mod_imm().

(We can't replace the other use of bitfield_replicate() in this file,
in logic_imm_decode_wmask(), because that location needs to handle 2
and 4 bit elements, which dup_const() cannot.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-6-peter.maydell@linaro.org
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 66781f71cb2..e81cc20d04a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8212,7 +8212,7 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
         /* FMOV (vector, immediate) - half-precision */
         imm = vfp_expand_imm(MO_16, abcdefgh);
         /* now duplicate across the lanes */
-        imm = bitfield_replicate(imm, 16);
+        imm = dup_const(MO_16, imm);
     } else {
         imm = asimd_imm_const(abcdefgh, cmode, is_neg);
     }
-- 
2.20.1


