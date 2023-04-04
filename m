Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E05C6D62C2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:27:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgh4-0004xB-Is; Tue, 04 Apr 2023 09:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjgh2-0004wa-Ej
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:27:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjgh0-0001Dl-Ke
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:27:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id l12so32788242wrm.10
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680614840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G4a+0UzYz8IcQFqhelgb80JtN2L7EbyDw/QzAw2HH0s=;
 b=mg1k/A7JghaiRh1Uij/CBx/+NBQNVFSXc1XGSnMps7N3uJ9dIdK7mmtzZkmirAdBFL
 hoG/k6XZESIziXmgYd2DbhwISxDTjA9Jn1GtnumenTPM3l+yEvcCjAMGu4J5vohTxX4y
 O616ymzK7E6vnRMLNQqcRV+4yIOuRH0kRxc07aq8vWKu+5UjwUW43nTreWLLi++V/SAW
 5OsVOa/wXLPoY1MYE5M53SwqBDUzqigH8rQ5mV+QpdB8ySDCmkFQmPNAd41addeqDpV/
 7uj+yyC1i+dUlpUlNwJdCxGyY+VaSSnd9pASG522dd3JINnAOkafm4e6JUzSUVC785x9
 zGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680614840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4a+0UzYz8IcQFqhelgb80JtN2L7EbyDw/QzAw2HH0s=;
 b=eTOmDQmaXzBGbibU6/BUS6LBPQPu4aryFgIxZM4n5K3CrCrCgGZ2GFwgkAXV38PC8T
 2a3CTza+dkF+cgTp/bDeER3y6D5Cno2ePe26ZpHeJr6x7i2xKYdOUHfyC1LDBmyfzpar
 K3rlYG7pp8F1nJ1TeLzYevsqsJMeo0EyJxJoRpIH+qmJusxUj1qT+D31SeA+YT4Q7uOZ
 0CCzys9FUeRMy9HRG1tyFv/2rSLo+bnE/BW+E1Ag6tWBrkVN7A3O5Ud4BGwbiXKRmc4E
 QXJt57TQRLkuDU24cTF0gPd2u8rHXjmKiM9PHTnONLXMrcWIJeNZzttXN2eHoZn5lXDF
 4iFA==
X-Gm-Message-State: AAQBX9dQ+a+KkFje4oyg70PPZVMagh5LZhh9UmxnoxDy1XezNBu3uqDa
 cgL4Eh38DSsF2IytU42lIXWjLg==
X-Google-Smtp-Source: AKy350bYqlDXT19A5g/6QvKHHHOAqNHICNLmciRzYfDHljHg5FKdvLYxpye+8UzaNH8KN8mhg4q4kA==
X-Received: by 2002:a5d:4573:0:b0:2e0:f63a:2324 with SMTP id
 a19-20020a5d4573000000b002e0f63a2324mr1590205wrc.23.1680614840442; 
 Tue, 04 Apr 2023 06:27:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a5d4ccd000000b002cff0e213ddsm12311518wrt.14.2023.04.04.06.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:27:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE5E71FFB7;
 Tue,  4 Apr 2023 14:27:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>
Subject: [RFC PATCH] hw/intc: don't use target_ulong for LoongArch ipi
Date: Tue,  4 Apr 2023 14:27:11 +0100
Message-Id: <20230404132711.2563638-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

The calling function is already working with hwaddr and uint64_t so
lets avoid bringing target_ulong in if we don't need to.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/loongarch_ipi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index aa4bf9eb74..bdba0f8107 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -50,7 +50,7 @@ static uint64_t loongarch_ipi_readl(void *opaque, hwaddr addr, unsigned size)
     return ret;
 }
 
-static void send_ipi_data(CPULoongArchState *env, target_ulong val, target_ulong addr)
+static void send_ipi_data(CPULoongArchState *env, uint64_t val, hwaddr addr)
 {
     int i, mask = 0, data = 0;
 
-- 
2.39.2


