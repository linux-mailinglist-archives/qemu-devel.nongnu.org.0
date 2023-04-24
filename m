Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454D6ED190
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:40:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyHq-0007BF-7R; Mon, 24 Apr 2023 11:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyHl-00078W-JR
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:39:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyHf-0001Tv-MQ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:39:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so23498465e9.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350751; x=1684942751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0jNGQGLAYMBmkguv81DRv0hpSlY3YPxmNo+eS8KRvQc=;
 b=qQxjfReV02y+ZDtGrS52qLOQlzcUTSOuytU2UgEm5ZOu6ldehkX3ApBCWgiVnf9yNt
 tuaY7841ZbeVJLcpHduEa4NhRHv46yxAcfIJvVx1ntk6VNadXWNPa6IYm1N8fnBpO6zY
 EPQBdbOBOgIoUi6OtDQVRYhNjRI0DNL0qJr8WGUvwBCLockTFsplvtA3P0znCX80v+8J
 qAwLumi5gAfVRp/zlv+/LYKgSAd/eIjRlKg2P6ai5lgIhn4xQFL1f+l6q+G3gQtzrdeF
 Rc0jQyOAhr4pbz2RBQsdXIFMjj39FGiktXAoro2AnoFJm82cvZpX7yHP5Ml3I3DZQ+yt
 no9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350751; x=1684942751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0jNGQGLAYMBmkguv81DRv0hpSlY3YPxmNo+eS8KRvQc=;
 b=Y/WA28Qt7A1yyYxMhlWkKtZVurs2cqV7PmCRdU5+e7eHSiD2I+C1SMv0T7QvkZ5oFu
 eN4kDLV5QK0js7Bv2TcPk9iTFYFqaMLx8hKv+J9CQ8ODAIi46R/Be2uJXoEMgPorjPHp
 j1yTJYSTXM8IVcARoAz5d36e5UhPyQEW7YEReaO7E1I8X0vuQCNSq21J+vOzU6q5wLr/
 6V2kM3RmQezb/WYAqCr0BevyBCWp+I5VUP3pnS3qw2X8LqwSwGIjuqsw/0oScm27TmgS
 1caAFBPJRFy4ohcocnvzp3JisP7of/PtE2x3zSxjXl6KqyNWG4Vp2rVXWISZMo3c6m/c
 Vuwg==
X-Gm-Message-State: AAQBX9f/H/ryBwC4ll9eDJvbWd+sTq2ZVx2KXX56UlbTqMKozajun+re
 wFr2FdfA57KOfbzk+6p09ieYeA==
X-Google-Smtp-Source: AKy350ape8OUaJOsMpW/kXDoRxZh/xqsO11EZM5yb3tirSI/phkQPhX/pwL1+3AzkyD7HP0NyRURJw==
X-Received: by 2002:a5d:5246:0:b0:2cf:e517:c138 with SMTP id
 k6-20020a5d5246000000b002cfe517c138mr9064255wrc.66.1682350751106; 
 Mon, 24 Apr 2023 08:39:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b002efb2d861dasm11041241wrj.77.2023.04.24.08.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:39:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 0/2] target/arm: Load correct half of 64-bit fields
Date: Mon, 24 Apr 2023 16:39:07 +0100
Message-Id: <20230424153909.1419369-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This patchset fixes a bug where on a big-endian 64-bit host the
guest would crash immediately when it did an ERET. This happens
because when we load the new PC value from CPUARMState::esr_el[2]
we do a 32-bit load even though the struct field is 64 bits.
So on 64-bit BE we use the wrong half of the register.

Patch 1 defines a new macro to load the low 32 bits from a
64-bit field, and uses it in the two places where we got this
wrong. Patch 2 adds some compile-time assertions to the
existing load_cpu_field() and store_cpu_field() macros that
catch inadvertent uses on struct fields of the wrong size.

This fix is necessary to be able to run the avocado tests for
the orangepi on a 64-bit BE system.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Define and use new load_cpu_field_low32()
  target/arm: Add compile time asserts to load/store_cpu_field macros

 target/arm/translate-a32.h | 24 ++++++++++++++++++++----
 target/arm/tcg/translate.c |  4 ++--
 2 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.34.1


