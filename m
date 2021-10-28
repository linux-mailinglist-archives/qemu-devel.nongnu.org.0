Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAEB43D9BB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:15:15 +0200 (CEST)
Received: from localhost ([::1]:41024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvso-0001iA-KT
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPf-0001Yj-Md
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:10 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPd-0006Co-PS
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:07 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e65so4938008pgc.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y4xHy0fvt8edEZwuGcc2OkG2z52vT5Lj+p/53oH5sv8=;
 b=lPruxXd480vjpiHC3SY/cJti/ZvPYXDRNZH1m7JnfaJyh1bQrW3VKOobOzdS7RdCE+
 k36LHpi9BtWIK2c6vGuxCa3943Ju2aDKQCHdQA9rKQpqqpJT78tU90RcS8mmoL/7cQZd
 00AHwmnKias0pbwPa/YWLHzVi+dNLkySPjmyDrIdkZZ7b2ddi23XDf3Qdzo3Txk1Z+0i
 Vd83qMplN38Vnt7OglvpleyRo8SQS3XB9fwn+o7ZZZVcXig5i/KFNlDXHn5mHv/zSxCK
 lzlqL87eKkB2/psY6dM9tpTU/N0/MVxX9/df03xnni/JOhkjh1P31hoRHeZ+W5BaPFth
 ea/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y4xHy0fvt8edEZwuGcc2OkG2z52vT5Lj+p/53oH5sv8=;
 b=IAifyUUJPMAfMsJKB85LIv3ejh0VQOToLTKGmZmf9Ya4dZHAw8Ri2CPgaNNgDEWPhp
 gBfjZqSo5ZDSd4Ns7HG7pxohsGRh6vSUqw/I+/aSBHfc75m/H58jYOdjA4zZc6jBrh2u
 j0kEzuP7YgOfE0xW2+oPMN06lziDNjBZ0Kenr0807Y10CGgIXYBfcG7Ft+fJnuu+Xkj+
 b7qF/x5FSOYVckZgha2joP38UnZWAZ72AvcA3IqQfQX4yIpfH0LwNQ24bH5chgNE6S5M
 ubJP+ZTW2Kcy7LVjkZNyqfP9E1Jsee4onhQgHxp8F6fuXR21yF0Ch2F/aQ5CHOS8pxlj
 LU4w==
X-Gm-Message-State: AOAM532071CwVj51eWTdC1yoJcrr3YuxGfcXlJmfaZrC8dX6+q/PdBi5
 SdQ2HHprsCvJ8mMypIvu+iF3GPapOweeYQ==
X-Google-Smtp-Source: ABdhPJzSNNfxGaK8h/RG9CVJ+ibj6ryfzIzhtBFFHAk/hdFJCPrM9Sb4lfcQI9D7Xq3uC//lUXS7IA==
X-Received: by 2002:a65:6499:: with SMTP id e25mr1198508pgv.146.1635389104478; 
 Wed, 27 Oct 2021 19:45:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/56] tcg/optimize: Use fold_xx_to_i for orc
Date: Wed, 27 Oct 2021 19:41:23 -0700
Message-Id: <20211028024131.1492790-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recognize the constant function for or-complement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e0abf769d0..6d795954f2 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1586,6 +1586,7 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, -1) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_ix_to_not(ctx, op, 0)) {
         return true;
-- 
2.25.1


