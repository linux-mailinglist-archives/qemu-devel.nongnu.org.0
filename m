Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCBD612FE7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:42:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNYu-0003nX-4T; Mon, 31 Oct 2022 01:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNYg-0003Pk-UF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:42:05 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNYf-0004Q6-DL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:42:02 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso12434115fac.13
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aTEo0Aq3CF9CDtdhcwYs6wkUEncR0N5grPyzOskqywg=;
 b=qJnkd7K1CrDy7zmyaqTgCBAbGpSwGe+CLzYptT6Qtuc+R/nh5EvwVmHmpfw+9cNktJ
 X//ySs0NCubPq0tuZOZBL8ySjemIFcx/D9/ndJKYePQGf2szN0ZbZDjWEBTuMP5YfbcY
 /4TXBKBUpu+M0wqDHrVk2ZLcBZ2p+rMwThlJIvzekPcleWuC6450+YuP1CclNVRN4uhh
 Wf9BeobxjoWfRTBMPs3DKeiDRQajw9DIZGuK6le6dIi0qXiYbOquMU/bw94bk01wKmh5
 dWLIyyr+6OUNjn8g3TLU8TaDo8V78xtivDvq01lZgeqipRKQJZqFwnig/7AH0d9dKxya
 d9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aTEo0Aq3CF9CDtdhcwYs6wkUEncR0N5grPyzOskqywg=;
 b=I7ChU4fFtbN25X6I5n2ZGuMQNHHqWFR3a6LEeqBG3YNm/OruL89zrWyXzJnjv3wE4p
 6EJlKur66VXSKKHFv4xGbRJPrtKTrV07aF+hpQoa6bsgG7zyuUgKrFmKTVDrUtOv3RmR
 sSXIyKFsWwEs+ctxW15mlboMPskZZDx0fpjge2HQa7/5M6A+ITCxYXHXLTpGCkIWQhFN
 VqiGzbwR/oODPv9Yqq2Shzhg3sHAm1qrGb1MCdtbjAtW9UZyRHz4CcQcu3NM9cDOsoqo
 96/GtAkJbe/ZF8VzQ7d8B7l75MEeYHUbvGCkm3KlJnvXG1IJW19P/ItzEYbLRdbpdZt+
 +Htw==
X-Gm-Message-State: ACrzQf1yTQWiyMuG7TW242vTdaBY5qKNTtL5oV2o6EhSHWwt4RtHALUI
 OhOREq7IafN/aRnbzW2QnMIJDu66Gh4ugw==
X-Google-Smtp-Source: AMsMyM40tAjil6vARd18KLa8t2BjUpfh6Pc1F7DcnAnT7y3XXUJX8KlUQwFdy2p63+WC4HWJyM5/hw==
X-Received: by 2002:a05:6870:ea8f:b0:13b:8dad:5895 with SMTP id
 s15-20020a056870ea8f00b0013b8dad5895mr16274503oap.233.1667194920125; 
 Sun, 30 Oct 2022 22:42:00 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 i21-20020a9d68d5000000b006619295af60sm2388837oto.70.2022.10.30.22.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:41:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH] target/arm: Copy the entire vector in DO_ZIP
Date: Mon, 31 Oct 2022 16:41:44 +1100
Message-Id: <20221031054144.3574-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With odd_ofs set, we weren't copying enough data.

Fixes: 09eb6d7025d1 ("target/arm: Move sve zip high_ofs into simd_data")
Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3d0d2987cd..1afeadf9c8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3366,10 +3366,10 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
     /* We produce output faster than we consume input.               \
        Therefore we must be mindful of possible overlap.  */         \
     if (unlikely((vn - vd) < (uintptr_t)oprsz)) {                    \
-        vn = memcpy(&tmp_n, vn, oprsz_2);                            \
+        vn = memcpy(&tmp_n, vn, oprsz);                              \
     }                                                                \
     if (unlikely((vm - vd) < (uintptr_t)oprsz)) {                    \
-        vm = memcpy(&tmp_m, vm, oprsz_2);                            \
+        vm = memcpy(&tmp_m, vm, oprsz);                              \
     }                                                                \
     for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
         *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + odd_ofs + H(i)); \
-- 
2.34.1


