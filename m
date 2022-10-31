Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86640613786
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZG-0001hD-J5; Mon, 31 Oct 2022 09:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYj-0007wm-FW
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0001Fa-JH
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id g12so15892569wrs.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bJIQoi/K9AwRlRvPmx2+d3fGZfR8Up7yVsMefwI7z0=;
 b=bQt8eVy3EqAJ/NPr+YULLCGt+HxehY/+ODs1uT7leYoj8zFom/hcG6ANcH5Y4m3YjQ
 oStnttNKiQUdvgCpdf7bojBzB/BzmzUvLjrW2Sz0c33nyXE8fXw7yC3f2tvDTXGeUK/7
 IrlcPpt9QCGLnVgqQ5Mp9Ut1lXhz8g80vcbHCxrvkr60oKO9FI1Baf7hDEn1Kgs5XV3/
 g0RIfW1nvdK44QRjIGFWV9NIKQ6nQi+ShSbggRKBMIRSD3PfkSTzyLr/Mnh1BV89e04Z
 OPbey+29qTUCAFHpUlTlAnovvI3tGqv6wNbEibWFH7eA9oMt1kKASiVK31Ox0220sqx4
 Hx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bJIQoi/K9AwRlRvPmx2+d3fGZfR8Up7yVsMefwI7z0=;
 b=riqFk6inPF5XNnR3IElih1q4VohSRxHcn0Qo19kJw5Z8duGHArjN9yTOmN3qP6Aurf
 kqZiHMA3k8KLXr85mQr/t834MSgH2sFiEUfkQe7P2mB8RWq5fLE3V/gKcQSq8ro5Arph
 t+oaMGzHm0e37yLBOglbRBKwF7nOiLpGkXr8fcAj+zrdmmc5NlIPrN3d2j3TQrPPMrQD
 Qu8re9vS2BFHvx8XbMfRBYITpMF8Qz8PraurMHe/ZFvnvjHkflaHUGT9pjCk2iD73jVL
 fRnsnEXm5C49Fi3Wmr2ULglkq9SFODu/hgt9pQb5RqksaOMGCpY5xl7XlScuChmV5Ih2
 BmzQ==
X-Gm-Message-State: ACrzQf2dXN5AfEZm3WgQXXYNgR8bZAyH+CsdliyUva0Fm+aE2B+qouYa
 t36hZ6oCfBXCklt8GL+5pSmqNA==
X-Google-Smtp-Source: AMsMyM6/DuyrDPmOPay3nWtreDfgxEJ75wg5NtXsDYnic71j09f+nNpp/dEY97Hth7t6dEPxLh54Sw==
X-Received: by 2002:adf:e30f:0:b0:236:d8ef:9ede with SMTP id
 b15-20020adfe30f000000b00236d8ef9edemr1502869wrj.170.1667221823233; 
 Mon, 31 Oct 2022 06:10:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0023677081f3asm7118372wrw.42.2022.10.31.06.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DD2A1FFC3;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/31] semihosting/arm-compat-semi: Avoid using hardcoded /tmp
Date: Mon, 31 Oct 2022 13:09:51 +0000
Message-Id: <20221031131010.682984-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221006151927.2079583-2-bmeng.cn@gmail.com>
Message-Id: <20221027183637.2772968-11-alex.bennee@linaro.org>

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index bfea9e9337..62d8bae97f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        len = asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
+                       getpid(), (int)arg1 & 0xff);
         if (len < 0) {
             common_semi_set_ret(cs, -1);
             break;
-- 
2.34.1


