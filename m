Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1C6A6630
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCin-0003py-Q2; Tue, 28 Feb 2023 22:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCig-0003R4-Cg
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:30 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCie-0004NG-Jo
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:30 -0500
Received: by mail-pj1-x1034.google.com with SMTP id y2so11906728pjg.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3K1HyWRkn+UQCp7PAcpWhkAa828mikqSvNlShZv6Mh4=;
 b=twzr0FRppVEX8v9jYuluK+M5Dxuoavg6VO2+Rcj/UvvlI7r3V4YZdx87NpdnnLV5EC
 nlD+/uUf074+RzWGVno0/SIeLqplZMAeWTgGLrf+bRjxajG1b8pnM0AMxlwqLLH3HIRx
 Qg4oAoYXmJU69syU/5KTQtvv5OWJ9cSFDcvPrxYDSokdToCtFVPRq6m52uJ8kRE/Lyv0
 Fbd95ipfHCFBBwFOAwCs/tke1CDY+CF+4Q9bJhhjISMN24j/ug69YIPemOe82Fb9I5uz
 Ot7J97rOKB2mW4fccytwH6eLzF+1wvD9E7pdoOQFegAzGEIa2RJKAlWex3kIt1Y9Q81x
 O7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3K1HyWRkn+UQCp7PAcpWhkAa828mikqSvNlShZv6Mh4=;
 b=VIG0D69eICKlGUApZKiT0l3wEwVF35PsM10cIKxQPMxviiN8zMYNKon04Sn4DS22+3
 cu/8uDa2Rw6NnvIhtwCzb17k+20PPFotEK8qTr5wqzIOnwbBK8+1Pw1wTCrFkM/D4wPN
 +UKIzPA78+Gtj0/yiHtrfWXO9S0ypIgCyPonitM6n5dck9MtYArILB5JD5AQgqfaj57u
 8zutLg3Sf357x3vor4QHt9JLTH7oGQeqWZb6mf0gpcg1DanPxQMO4mPV1ymjfqHhoMsy
 CxC/DeVu4bWCKKgi+Qk/J3RHaep0M9ib+/h+c/4cfHr9lSag6G1Jmd4PKVEJ0B4mj9YX
 GhLg==
X-Gm-Message-State: AO0yUKXHlRgAN00B0gNIj6MHkZYPXCrb3Ps7XvSX1q1s2spyRquxZelX
 CCJgDedzxM0TKIJBfBB9zEisoP6+K0c8YHjg4BA=
X-Google-Smtp-Source: AK7set+W3xW1ImhMkPYFVZNEl9pKFiPLQlAUwLeJAQmOLv5jKUDX2yRj6FC4F1Lru9vtjztkTTxerg==
X-Received: by 2002:a17:902:d2c6:b0:19d:1dfe:eac8 with SMTP id
 n6-20020a170902d2c600b0019d1dfeeac8mr8598425plc.26.1677639687035; 
 Tue, 28 Feb 2023 19:01:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 60/62] exec/gen-icount: Don't use tcg_temp_local_new_i32
Date: Tue, 28 Feb 2023 16:56:41 -1000
Message-Id: <20230301025643.1227244-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Since tcg_temp_new_i32 is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 5b1794188f..aff35d6982 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -16,13 +16,7 @@ static inline void gen_io_start(void)
 
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
-    TCGv_i32 count;
-
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        count = tcg_temp_local_new_i32();
-    } else {
-        count = tcg_temp_new_i32();
-    }
+    TCGv_i32 count = tcg_temp_new_i32();
 
     tcg_gen_ld_i32(count, cpu_env,
                    offsetof(ArchCPU, neg.icount_decr.u32) -
-- 
2.34.1


