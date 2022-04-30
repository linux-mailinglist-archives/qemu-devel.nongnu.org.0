Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D19515DCB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:43:10 +0200 (CEST)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknNN-0005iN-GX
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAQ-0004kt-NF
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:48 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAP-0006FT-7y
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:46 -0400
Received: by mail-pf1-x436.google.com with SMTP id z16so9064062pfh.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4UV//9Dx1fKTWaO/CeFVHK/oLn3ZgWAg/jUv9V5umM=;
 b=lw3NyF6Inbo1gdkr9ggQWtGFKq2paJ9og67ZfLZtuqvhyAlw7Fm1+vPwZSCwTlnUBr
 Nawh5+jJzZFO637zWxDoVUbHK3adaTIuWd7uj9zhQQAu/A7qW+LWFvPmEY9bT5gm+Kx2
 OUVmY4ZgH1KzO4uG8+3cFAsFYdQmACT8xfau1QEEJVdoK1wV/x79Vkjo4zNb6hHoMU6B
 ybpapnsYeLHygDM4X2srnsErd1Ut7ghK58J7yio+S5h+X49eRsIxp93RciWZnrYO61HF
 KsDcZHZOR/RQ39hml1/Y+8EBwmkywUEgUPGiF+0D22vyRPBbFq7Hw5XNZ5+KS7zsRz/h
 yUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4UV//9Dx1fKTWaO/CeFVHK/oLn3ZgWAg/jUv9V5umM=;
 b=NDoIHr1cawHI/MZoJFeRUUj2Fh6xBAsYX6WQlE4nD+S9X4JnYQufHt7olTQtCHn0A+
 RwTwp86MuOUTEnw01/wTF2Z7WLHSMC/RbMz6wQjNWCXjNmoQWtpOa/5MwnXHS6VmRgAA
 azV02OTEqpQyu4+vcSYEYm5VC2Y1+LQHItbcjOhOqZWoMYBzy8ViTd2HewF+jHCY5547
 QeI4uf3NAsvcGBQLczmpX4ltvRZ4uemsGmSksTPYn3OId+1xxpbrwex0HXSf46Gs9cc6
 yqb67azDu/zZQO7tDVOj1tX5s5mkn9NKPQfYPHCdmSn7tO7/eIuN4eroIr53IKTElKdq
 QZmw==
X-Gm-Message-State: AOAM531YM/CVMXj46Rl2b4c2VMLlmyKyQukrzg/FHevKfC0W0ox3n4YJ
 9DwHfsQk+JWSzjWsKOyYKs5YR/cnSmdDGA==
X-Google-Smtp-Source: ABdhPJxilH77nG9UQQj+bTi7NFDKf4fIxHDQbESDGe4COX3DETvpbB2pUUo0Y+Xq86Q9lKfsw648JA==
X-Received: by 2002:a63:2305:0:b0:39d:1299:29c9 with SMTP id
 j5-20020a632305000000b0039d129929c9mr3173032pgj.244.1651325384006; 
 Sat, 30 Apr 2022 06:29:44 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/43] semihosting: Adjust error checking in common_semi_cb
Date: Sat, 30 Apr 2022 06:28:59 -0700
Message-Id: <20220430132932.324018-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The err parameter is non-zero if and only if an error occured.
Use this instead of ret == -1 for determining if we need to
update the saved errno.

This fixes the errno setting of SYS_ISTTY, which returns 0 on
error, not -1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7030dfd587..18664b1c47 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -276,7 +276,7 @@ static target_ulong common_semi_syscall_len;
 
 static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    if (ret == (target_ulong)-1) {
+    if (err) {
 #ifdef CONFIG_USER_ONLY
         TaskState *ts = cs->opaque;
         ts->swi_errno = err;
-- 
2.34.1


