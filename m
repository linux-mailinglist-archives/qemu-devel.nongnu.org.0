Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C69376E60
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:05:08 +0200 (CEST)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCL5-0007IV-QI
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC58-0004Rf-2E
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:38 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4r-0003dE-IC
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:37 -0400
Received: by mail-pf1-x432.google.com with SMTP id b15so9152597pfl.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qte4K79lCpY0AmN2YUzdHn4+5EUkv6ETvmLEVo/dFmc=;
 b=JH2aEN4ZqIL/iOdwfWrKgMfSk/aLY1x6rO0gC4ew+UAFVNc9BW8LiNBOGo91dEAkXm
 ooyDbuJxWMZpWiWnP6PkSA4Un//SyxZvqbzTREJSqh6sjFO2LhEIcI8mZrpPO8SZYd69
 rqYtPugg1uKZjqhxuNpXsBoGoJ+g3bTN1nFwa9RDMQbxoSwlvW9dPd8FaGLB1CvI1mj5
 F6eHCGt7fIXJMT/6CfssFU7UsZoE5p/ZWfD0sne/WTIBZzMlPmkXt3oEvJ96p8fWmo/m
 NzkP1x7uds2BHnbFFrju71hrMmkUy4Cij2MdmTKFxXPj9ueMvGRO0iqZx5KJA9qzjbeP
 +J8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qte4K79lCpY0AmN2YUzdHn4+5EUkv6ETvmLEVo/dFmc=;
 b=mCdjQbgUzsbT3hGSbkUsWgfLOMULOj95CxfME9CKBntZZo4UnIl0LFX4zhQwSX0Y0T
 R1ibBvD22ibN/3S3NFRgYqjyFC2k6btUXoHUt66kCfpgd9UGD7w2rVarfI3AHqSGbwxK
 edreehh/tM54Uh4MNLbF7xPIWv53ILl82iJhHrNgVAZ+256682ZDOq2Vr+rFitVHzDJg
 WS4jzU/10o1Ss9JoWVTGouYzKV1eMIg2s+Oz6e0vVxRlV7oGCPnd15yeIIa9eWJfDpx+
 ZDyZ8rKORc/xbZ7OpucCKjNnnQ9Hl03Xex8TCb/X8jlpUiSY/9+wuSnxrRjfS9lfy0Xw
 o+HQ==
X-Gm-Message-State: AOAM531nBXDm9eehUccBvLmJAiyr4M8aWiGh/zRvFmjrgaNOXbjigKGW
 Kr/QjQAOm+IVtvfcHXuQwNI0MzotRz5n9w==
X-Google-Smtp-Source: ABdhPJy7w6q8MkrWwxB5epPsnWXuhXkDVkuqStSuhQHoSsrcDUEnQ/kljg7M9bcJbQ5MIFMbrpz3gw==
X-Received: by 2002:a62:aa04:0:b029:28e:f2ee:f7a8 with SMTP id
 e4-20020a62aa040000b029028ef2eef7a8mr13726888pff.62.1620438500101; 
 Fri, 07 May 2021 18:48:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/72] softfloat: Rearrange FloatParts64
Date: Fri,  7 May 2021 18:47:15 -0700
Message-Id: <20210508014802.892561-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shuffle the fraction to the end, otherwise sort by size.
Add frac_hi and frac_lo members to alias frac.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 2123453d40..2d6f61ee7a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -511,10 +511,19 @@ static inline __attribute__((unused)) bool is_qnan(FloatClass c)
  */
 
 typedef struct {
-    uint64_t frac;
-    int32_t  exp;
     FloatClass cls;
     bool sign;
+    int32_t exp;
+    union {
+        /* Routines that know the structure may reference the singular name. */
+        uint64_t frac;
+        /*
+         * Routines expanded with multiple structures reference "hi" and "lo".
+         * In this structure, the one word is both highest and lowest.
+         */
+        uint64_t frac_hi;
+        uint64_t frac_lo;
+    };
 } FloatParts64;
 
 #define DECOMPOSED_BINARY_POINT    63
-- 
2.25.1


