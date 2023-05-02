Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7C6F429A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:22:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3h-0000f9-FE; Tue, 02 May 2023 07:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3f-0000dc-1y
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:35 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3c-0003Fh-Ta
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so3497727f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026429; x=1685618429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wY72rBTCusrC/WPaiwfzmoq60/uULSGfuUcD5/U5TwY=;
 b=GNsOKbJwpHz7i1wn7ETbd7GGFUV/S7mblkMoHCcZqn9bXV2m4QUav+4mm9AgqmWpq9
 WQ4byszQtqq1A0eJsVupempRajYkQzj4cnWZcxHgOURR3JGJ5sEpFimoia8UdYTYc6Id
 N5xz9EzY22Ap2cD98Zod+asI5UM9WhOIbiahxBkgSz0SKAdplfp3gdN1X+kbpNLyehhP
 g8LBWDatuVEGq3a0kFsaHv3b+L5rPZwFS7/pxGeWJ+z4zUBJJzFW1BGPGi8ZiIN33uVI
 EQDn5bAyzx2TwQx/hh+Rq5f45zkSq9dxQ1x1Aofy/fo9XUKGaozLG64D8Kr91r1HbGzM
 aCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026429; x=1685618429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wY72rBTCusrC/WPaiwfzmoq60/uULSGfuUcD5/U5TwY=;
 b=W4iVX5KDRgh6YMn6AyTuF6QKhAbwih5ZTbOfUVY8BW7Xv5wA66amzP92MpBbzs6Poq
 95ozG1ynMkVJaAWUi1yTohmB1ajYYgbkc5LRf6lFEnNY75Hlr6Onts7EV77hJoojyXyh
 TBh7gZq0cuPtT2NP/bSMerzVHwYVqgR6F+iMoQMVnX5m8Uc2kBqDq9VZXjZOdIMUv+v5
 9wOhZk+CGyX7Yf0pk5iUicYvRerx8SV559vO7FMBj0897r9i3JV+GXMC+NIdy2pQX68D
 q3EUvo1mFfAOe5k28MpqHANZ0LMuspkCfTdvNHwBOX+gx+KjE2XIiZj5eMgvKLn3vbem
 BCIQ==
X-Gm-Message-State: AC+VfDysDmZX9Gxj+cfDzch4cp8sg+lyo3HaPQpplGhxrweBp9rRfgWy
 78/io8cQogFqdg2BjyUAz4M/PLgEsY+pIeySy/huHQ==
X-Google-Smtp-Source: ACHHUZ6+ML0T420IJEff4r8IFhQKL7bkLWephK86r0r2GO/KprMzxBt5CeS86WwxqHaBIyeZyD6Now==
X-Received: by 2002:adf:f212:0:b0:2ef:b4e1:cf59 with SMTP id
 p18-20020adff212000000b002efb4e1cf59mr10869975wro.58.1683026428907; 
 Tue, 02 May 2023 04:20:28 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 07/12] qemu/int128: Re-shuffle Int128Alias members
Date: Tue,  2 May 2023 12:20:18 +0100
Message-Id: <20230502112023.776823-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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


