Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE565A40FB
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:13:22 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUHB-0000Vo-FY
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEB-0003SG-AD
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:15 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUE9-0001bR-NC
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:14 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q63so6429594pga.9
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=J/Iuv1qBW1Q0Rkq4S69aQOiknbfSod0alnGHuF6g37U=;
 b=UOKKl9z0pDVgVjAhr5qSNRYj8gCsivYZ2vUv1BiXakcZM2Bt9Zr6g1E6Dj0wm+povj
 oChEUW8mDelcWz4hLR29bAgFavCO9lYdU86OAHvJbzgoZZlCaFcRGRacaSJmCVKHcNby
 i1gHhsKmjKyOCOpRrKjTz8VhHXOKE4jcxCGK5MvuYQt5OmkFhZD8quIxZmGzGvpnzEe2
 3x47ZUK2iNZj2mZWF/xm/b7UKsCEYDNejEjfkMtBos8Qn4T4iDtadCYPFRMsJrQrHO10
 F28pQ2dCEcYw70Q3oSD3PNcKw+Hxc+QlkIO1r4olHjgFi1bDj9vlMOxS0knY45RYNmKF
 2t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=J/Iuv1qBW1Q0Rkq4S69aQOiknbfSod0alnGHuF6g37U=;
 b=ZtaQEnyNnJMOq5MllKUzFY2p43FK8wT9gWBD+AJxFItSR77d9prlGkbWGJqiwvm99p
 Y4cOoK+sDxORGCkVKcQ4TKy0p2eLfWjG+VehldKDf4CKhT8nu2ovhSgtHsy4q+EscnFM
 k7enG7R5z+WV8QZOXFUR1mNXQ6IezBiuJiszm26gEKu+zZZ3YvGcp26zWoUNy4H2Fulw
 UF7Snm/aeKV8Ng/Bni9s26dqnx7txtkFnURk3YV5n+VFcGq32Ed8pIt0eJ39TQi8o1ZP
 +d3CqO2QGaUB5IH6CTCmgkOM3zcdBC5ozL0tfx/CnA7jGKkw4il+pzkVdN17jKlxOgHl
 vJcw==
X-Gm-Message-State: ACgBeo2VEoDIP71lLPGzEIzMjSy/Udv6ITOKdnJZ5lE53uDiSyyG9J/E
 8neQSIL+l0HPDt4VQK4L/aF7RvxS9hwDkg==
X-Google-Smtp-Source: AA6agR7OeZGF0kOb2owBhpnLGPy6L+xgR20ad8B2ZknkiRr6efvsMACiQxNsstOeIeuyYvKqem9tXg==
X-Received: by 2002:a05:6a00:174b:b0:52f:c4d1:d130 with SMTP id
 j11-20020a056a00174b00b0052fc4d1d130mr14196082pfc.23.1661739012413; 
 Sun, 28 Aug 2022 19:10:12 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 3/8] linux-user: Implement FUTEX_WAKE_BITSET
Date: Sun, 28 Aug 2022 19:10:01 -0700
Message-Id: <20220829021006.67305-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
References: <20220829021006.67305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8fbd5a9556..8bf4b79a9e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7774,6 +7774,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
         val = tswap32(val);
         break;
     case FUTEX_WAKE:
+    case FUTEX_WAKE_BITSET:
         timeout = 0;
         break;
     case FUTEX_FD:
-- 
2.34.1


