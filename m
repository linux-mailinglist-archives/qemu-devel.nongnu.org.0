Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C3542154
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:41:55 +0200 (CEST)
Received: from localhost ([::1]:35232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoS2-0002xa-Pw
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyoNF-0000LK-Qe
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:36:58 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyoNB-0004cX-Lw
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:36:57 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q140so2871948pgq.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MnQrOAjzL/E38dXvym3OX7h70hOrLcs50bzurVXKR7c=;
 b=wTxP9ssWzggSC0NZJZLOuARynfuHmwCzSFM/c4eZ3PJ7fcxK1iBOQkLzp9QVz52wrF
 xeJDFkFvFZ1NJm5xIsS6Z/eRK2xQ6lusn/qlh+ThoAoZoCcSKnI5L4AyI1tuq70H4UCM
 Oln7YwAIM5Okp80XHigemXfPj4oHS5Bg856lM0sAnR0IKFyyY6XnKnyrrt19ZnCY6RRM
 5m3KY5Pmk9nApWIq9Stt/SD0lZrbHrar0+eZs55NH6UIwFy5tiR6rYrPJOQPwYGvPlAb
 d8El5bMKtmaUXSAzr6xEOFP5UVrT3TCRqxJcwGFUhWs/ltTaLp97vQe9p4iYGdzCYywI
 +r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MnQrOAjzL/E38dXvym3OX7h70hOrLcs50bzurVXKR7c=;
 b=jRJpHnc/yuHjR57FI6wc7EFB4C19Bvmje5ttZDdl9VRtar1AArXcHb5ErArFVQlh2j
 nLGgajjMfcOmR5KRcRqtR5x/sgeyJIm2GgtSKEvGDkyxCo3VD4/Utd9SgFC1IpO+ZJUK
 Q/VffWXLGYumWe4Tvj0sgBzcZD4lFOw47OI+lvP149yJQ5B3qVHfCt2ozmJEzmO5EGvU
 TxaEbPiIvMqhgJ35y0Rf1JrmmXPk8dT1Bygm/IW8vlgGSpbXy1QhCBQn5PKX44X1M8yT
 nL4+UYZxE9LV0h7Neu1kOB9MvRjJ3/2kFs0eXocs9mYBtTdFGMJiTfY+9NiHb8jyLkQe
 K22A==
X-Gm-Message-State: AOAM530Y0vR5paHHDW0jRyq9U7462nI1MezMAJLtMvqNI8CgCGfPK9Hb
 oFaH+gTiO4114nYFK+L0COKLlcOyXpmyxA==
X-Google-Smtp-Source: ABdhPJySpZ/6HYj4eWpEhV7p2EX/KO+chj9AFNKsDZFcEqDWbMGK4u/Tbc1BH3IKL83hDbd/Q5WkPA==
X-Received: by 2002:a05:6a00:2244:b0:51b:b974:4294 with SMTP id
 i4-20020a056a00224400b0051bb9744294mr33052983pfu.67.1654666611487; 
 Tue, 07 Jun 2022 22:36:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a1709028c8600b001636c0b98a7sm13507703plo.226.2022.06.07.22.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:36:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: jcmvbkbc@gmail.com
Subject: [PATCH v4 0/2] target/xtensa: semihosting cleanup
Date: Tue,  7 Jun 2022 22:36:48 -0700
Message-Id: <20220608053650.811947-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
("[PATCH v4 00/53] semihosting cleanup")

Changes for v4:
  * Split out of v2.
  * Undo the gdb errno thing; continue to convert between host and xtensa.


r~


Richard Henderson (2):
  target/xtensa: Use an exception for semihosting
  target/xtensa: Use semihosting/syscalls.h

 target/xtensa/cpu.h         |   3 +-
 target/xtensa/helper.h      |   3 -
 hw/xtensa/sim.c             |   3 -
 target/xtensa/exc_helper.c  |   4 +
 target/xtensa/translate.c   |   3 +-
 target/xtensa/xtensa-semi.c | 326 +++++++++++-------------------------
 6 files changed, 106 insertions(+), 236 deletions(-)

-- 
2.34.1


