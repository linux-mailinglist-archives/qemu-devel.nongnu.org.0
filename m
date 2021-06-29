Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA9D3B78D6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:45:51 +0200 (CEST)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJg6-0002uz-BL
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItT-00008H-2B
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:35 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000ua-Ez
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:34 -0400
Received: by mail-pg1-x535.google.com with SMTP id g22so1096957pgl.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MS+54kxIfTXZuvkER1/bNkljAmYnUsI7C3BvDWc6sZw=;
 b=GGRftq6Y0ulesKfLDfLjoi/mKkxwHOyr0beTdcWBbP48NZ+jTD1pVOh0u28FDPY3rO
 JGVySeqb9lQ3dmVWN3AWMKkwuMekfP7cedVVMQ9Dvpoywx7I+5iZGfuL+efINCAYc+zw
 2DqH29qizPaPfQ2TiUS50xqAuXRWmFGMIIlN9Mg8iXktb2OidAp82LnS/gruDJCV7+5z
 FPaCBTHvqQgI6jHo5+tf6ToEWJVa5PW+zEovQKTRi1bccPuWQ/K5Fg/3WzISxpCcOrBC
 89J3a0S2c6esjDTKVMksyZsgdga8GnLK6H3y8lIgXY9dQbcCmq9c6GydkOOvrBL5DAT3
 +vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MS+54kxIfTXZuvkER1/bNkljAmYnUsI7C3BvDWc6sZw=;
 b=A0PSIFcFouZR4ah6Yo5i4UnrJH1aYyA/FwlezEFFFs136XV3MePxuS3vEWraX99P/n
 otust/Tp9MQWGCriH7NCDtGJOTqhpalN6s3U/EzAbKTi7iYy90P3wIuWjtLZ5qLKDT7W
 B7NTdKrCEImAL4fHROOY4ngqTzOG2lxUiHNmfleTwtRocApqdmWsZ72boCAXzI6bDaLu
 ucZHMaAi1zl39b9BXZDc6F+jWnZZh6rDArkKYkOTpuYAxy1mVH26QL6UuRDF3+PQyCvi
 m+KCLQxSz0JW0WYUndheRy0zd9oLs9Yf8nXyYVWDahz2e8rmnfcQxSIi1BOBYq+wOelj
 QcxQ==
X-Gm-Message-State: AOAM533lI859am2G/plywFsy/JO35UY3bVJ1wZupMZRL8q0eN7sAA8Mb
 fxmJA28lHr3kDdgJcG6PGFoj0uVqp0O1LQ==
X-Google-Smtp-Source: ABdhPJwcaugpVVWObOxQpLVNiOafmoC4oWXVeUbLZgIbvqQWr4UXdLJJPdBOFZEnTc0XeXIkwfT8pA==
X-Received: by 2002:a63:a44:: with SMTP id z4mr29359549pgk.379.1624992915195; 
 Tue, 29 Jun 2021 11:55:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/63] tcg: Implement tcg_gen_vec_add{sub}32_tl
Date: Tue, 29 Jun 2021 11:54:25 -0700
Message-Id: <20210629185455.3131172-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-Id: <20210624105023.3852-6-zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index e3b274502c..da55fed870 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -420,6 +420,8 @@ void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i64
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i64
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
+#define tcg_gen_vec_add32_tl tcg_gen_vec_add32_i64
+#define tcg_gen_vec_sub32_tl tcg_gen_vec_sub32_i64
 #define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i64
 #define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i64
 #define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i64
@@ -432,6 +434,8 @@ void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i32
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
+#define tcg_gen_vec_add32_tl tcg_gen_add_i32
+#define tcg_gen_vec_sub32_tl tcg_gen_sub_i32
 #define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i32
 #define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i32
 #define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i32
-- 
2.25.1


