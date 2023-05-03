Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25E26F51C1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:35:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pD-0007VH-Ad; Wed, 03 May 2023 03:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oy-0006q5-RJ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ou-0007Iv-5Y
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so47561595e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098552; x=1685690552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wY72rBTCusrC/WPaiwfzmoq60/uULSGfuUcD5/U5TwY=;
 b=VVX2wPC9/yTexd3VORD65jWKPelzoHfjU3HPT4UJsu8POVkU2SW4Lr7nBoovuY/DMp
 tNQtl4lRfUdK/GTL7Q/2Cxex5vvfKGNvAnhGtIW7whIQ0IHP8zi1Rq7ISAqpd3Emeehp
 1nt8pYiFAyB1BCSVhr+DQOKvUyV0tb3/tCZXacCDA3V9AgQPysDm6Kna+/eKkxPI2B7Y
 BPNMOQ4b5ts/9rgVc4vfXPb9BBU+cRjYrCZ/3b75XPbeC+qUcELYZ8Mu4kqi5u0GP+MV
 LsQZr3JXetKPx5dagCS3jMRhq9iOBmwznKFecCDi2lG5najpP3X3cP7XtVo+bDkJlRrF
 UiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098552; x=1685690552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wY72rBTCusrC/WPaiwfzmoq60/uULSGfuUcD5/U5TwY=;
 b=R0iUnWEGa9GAjqM6h4PxqIhg6Xk4DnExpIShZk8BU7wmD1wEyqXtAlHcPk5pKmiDnt
 0Y603qkws3vE9LObp+M7PFLUYUbVt4ZZsRpGmVsTp3Xc9lzRtcl67KMB/YFAxu5Ezm20
 LnlAsakFgU9Tn1OV/GsFNW7SBq5hiA1GUBqNqV+H1pKKhBlJH+Er2LAkdxJNstmnOi/H
 haB3JYezC2KW+46HIAJFClE48/cpm3l4wxuTI4xnoqnMWzjM4LHIWBamn6EBBl9Nw4Ja
 PmQ9J9w9ZFVs3l3Zs+W8kqZq+SwasA2XwbfTi5DkjVinBiJ+xfbtqXe3jDAEmFuF8Eto
 /DNA==
X-Gm-Message-State: AC+VfDycTmW8NcfUz9j0fSaZlOzca3EnxzNuLNYhsrT/BihihajIG0b3
 yF4wFBFU41NvpJ4R7AmIAx19Fupq3ULJu9UkxyjFeQ==
X-Google-Smtp-Source: ACHHUZ5xFlZlteKG1qccpTFZq2BjrZ1yukBNRpmSwRJJzbzNI+K4VNTjIoNeNjU2QwSJJCpMre8NlA==
X-Received: by 2002:a05:600c:2212:b0:3f1:6ebe:d598 with SMTP id
 z18-20020a05600c221200b003f16ebed598mr13505907wml.7.1683098552540; 
 Wed, 03 May 2023 00:22:32 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 07/12] qemu/int128: Re-shuffle Int128Alias members
Date: Wed,  3 May 2023 08:20:59 +0100
Message-Id: <20230503072221.1746802-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Clang 14, with --enable-tcg-interpreter errors with

include/qemu/int128.h:487:16: error: alignment of field 'i' (128 bits)
  does not match the alignment of the first field in transparent union;
  transparent_union attribute ignored [-Werror,-Wignored-attributes]
    __int128_t i;
               ^
include/qemu/int128.h:486:12: note: alignment of first field is 64 bits
    Int128 s;
           ^
1 error generated.

By placing the __uint128_t member first, this is avoided.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230501204625.277361-1-richard.henderson@linaro.org>
---
 include/qemu/int128.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index f62a46b48c..9e46cfaefc 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -483,9 +483,9 @@ static inline void bswap128s(Int128 *s)
  */
 #ifdef CONFIG_INT128
 typedef union {
-    Int128 s;
-    __int128_t i;
     __uint128_t u;
+    __int128_t i;
+    Int128 s;
 } Int128Alias __attribute__((transparent_union));
 #else
 typedef Int128 Int128Alias;
-- 
2.34.1


