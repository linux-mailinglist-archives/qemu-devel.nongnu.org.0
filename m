Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5339B5AE6F4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:54:46 +0200 (CEST)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXAC-0004nr-D2
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVek-0003OJ-Hp
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVee-0005BA-Gf
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id b16so14691883wru.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4qIVKig9S9x8D14AyFcGhgg5zmaJDwxxAfigArX0KMk=;
 b=ka6HnR0GKsnZWZf2We/HRNR00iuXU6SuXO6UqDXQgJF8E4tgpKqfdIR6V3UrF86rPd
 Tvv2PQhu8m67YWdJ8nma+EWDJ+zKORTmv/ZKQBV5GU+ECd9eA3t48sn1s/K24wrlBRwU
 DzlgNa2Q8RXjwW7b2WzJ4ZxvovFqhHwZh66P0cYvlbHU2IEJziIwdZfnP1ThJC9Q4MAq
 NKasE7tRqGFrpgxi25MC9wpwYFvjgusYZ+Ag5FCd/wQjjPD0ZRxHyhOlBGsBeOfu9b2E
 7l7Dv5ojeEWix2ceiwx+VLW5tlrb3W3nbMIN2Ic+zA1uS5zqJ0HVG081F4w5V2knznLh
 3GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4qIVKig9S9x8D14AyFcGhgg5zmaJDwxxAfigArX0KMk=;
 b=cfrR7PW1dKCqrcCP7caPNGAkrZ3y0DmyFk07KRwwxQx/UUaLOf/sZCsrCW+lxuu0OU
 Z+b3uY97LzCDcN3I+OlDuj+4eJML20p0ISUdsiCKxcu+ZqwBcC7P0wq8gJ7+y7PJC/wR
 kLGT0W1u05diI8tGISTt6QlJkgODOsk8187UhLwo2PGB0bAs4z1kt1EcC2dCyrjeB27i
 nEV7gTZGPiCMFvB823dPOROaa6dud+k1ERABzva9sr2FwwNCHEl0NLzcMayIwzZ1ufJq
 CO5BxXYCIuy5lIYtHZ/8gqhD0juO86wh7j9zHn8OaxqF6vKHdRVmX0TfqTJIEcR7Slil
 s3hQ==
X-Gm-Message-State: ACgBeo3LPz5ZyfZftB0klaxmDYf6HOJwsOqtEb6Ljw69w20gnGicYaac
 qFSsJaXfZZgUTbuSePt6TN9D0ZzgI4Vq7xll
X-Google-Smtp-Source: AA6agR6ZzKin1hbzscImvPJQH6dRIXxGjdsyTV83X/K63ov6Exi7kuNBp4YNd5LrxZ5os90YVOvSww==
X-Received: by 2002:adf:f94e:0:b0:225:63aa:27b4 with SMTP id
 q14-20020adff94e000000b0022563aa27b4mr26527207wrr.611.1662459483462; 
 Tue, 06 Sep 2022 03:18:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 14/26] target/s390x: Don't set gbea for user-only
Date: Tue,  6 Sep 2022 11:17:35 +0100
Message-Id: <20220906101747.344559-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The rest of the per_* functions have this ifdef;
this one seemed to be missing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a20c3bc4f0..868895b9ae 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -384,7 +384,9 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
 
 static void per_breaking_event(DisasContext *s)
 {
+#ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
+#endif
 }
 
 static void update_cc_op(DisasContext *s)
-- 
2.34.1


