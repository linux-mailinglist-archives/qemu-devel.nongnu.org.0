Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4043BE11
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:44:12 +0200 (CEST)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfW71-0007Ef-Gq
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdH-000061-Mj
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:27 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:56267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdF-00036X-R9
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:27 -0400
Received: by mail-pj1-x1032.google.com with SMTP id om14so613877pjb.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RV32wXKdXzELrxqTu5Q17Cra2XnriOA/nq2XJNlaAZY=;
 b=JjRpQ1UMvGIStWYeqwv8MuZLiE+df1+kwOnf4oERJZW7OtQ6C/9BfdI1WEbSiq/j4Y
 +nh29o/4gmIdzko6I3ILZCEmc4rgkuaQn2lcqSs7GBTXNdC6bgcQxUuSVlSizxIyXUCZ
 YoRFHdWCVA4dAychBgeid1cA89Ib60dE8/3xG5iXIb4bruc0ukmDOWb7cwuanIhQJRGI
 QGKxwKR+JBFiQO/VyOLx4B5hDxRvqHKIoQ655JLZRvbeNYgKESkg+apl3JVhtT7yVNCf
 HkSr8yMjMn/yOdg7vaBrcXbYdFkTB1IsbRqiUg37mkFxQRBrerAUy+/OVgrPpQqa5x0q
 vK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RV32wXKdXzELrxqTu5Q17Cra2XnriOA/nq2XJNlaAZY=;
 b=hX6bgrofpOiEK2mNAQuqWAzAo56eA+cMEH7pQXNfKkHra3rjcLb2hWFpYAY7kK+M7r
 QZzVn7FYEEGZMIeejqUsqdkcyaQ0yDKvfEpq1FFBQ6c82NeDL4T61B02QwDLbVdzPhQX
 VjqRUbXV2GhB2k8P/t1aPhy3a1urLJSHZdQxpWoOX9mtSSOfmQ7ZIzouS26653c8XKgU
 N5Z+6btySGRqhK9Wwufzq1CvuQh08luptpoM31CLLneeZ3OwjoXvnGUOb7CT8u1QbZjf
 JhfF0zQsSaa7cDNe8321cRwu6zeY4oONPBIoni76uvS3KgYxatK8yCbjYEMLAEgapB4Z
 xL3w==
X-Gm-Message-State: AOAM530StsoiaBgE+iom0Q1RGylWgdR0f+ibdE8sIP1Zh42Y+tBhLynI
 m3UHfWPE47ZlPKcssAT2UY68EXOlfBEvZw==
X-Google-Smtp-Source: ABdhPJysJn+8EPPH4CXqAMtAa7jGJ4chVPTuNF+VbMf3nOUrXVV5EU07U7NDSuVVHVoqeqNuWdIdAw==
X-Received: by 2002:a17:90b:1649:: with SMTP id
 il9mr1893113pjb.167.1635290004692; 
 Tue, 26 Oct 2021 16:13:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 43/51] tcg/optimize: Use fold_xx_to_i for orc
Date: Tue, 26 Oct 2021 16:09:35 -0700
Message-Id: <20211026230943.1225890-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recognize the constant function for or-compliment.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 3207817b68..bea82305db 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1585,6 +1585,7 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, -1) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_ix_to_not(ctx, op, 0)) {
         return true;
-- 
2.25.1


