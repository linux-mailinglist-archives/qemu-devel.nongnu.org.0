Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8B4C5E08
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:23:32 +0100 (CET)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOCc-0004yN-Tv
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:23:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAn-0002Xi-93
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:33 -0500
Received: from [2607:f8b0:4864:20::1036] (port=41601
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAl-0007lu-Q5
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:32 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so9436784pjb.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmvSTlRwfQRV5lemLOZaAJQ5k47lKUkX2PmvnCoa19o=;
 b=S/n6+AGKV+rtjBIGIqTxmtFlKIHFthz5nFGIg8fgXdbR64bR7ftCUZBmIqjHkhvc1L
 RV0TxpsEjHXLswJe+T5o2L2fRY4vFzcMGOCGDittYZFG13meMZ8VghIqqlGIYOAgDJbY
 59TF4JiOua+hgbnJx5iqrzrqVFkb/iQlTP5fy3lJALlSm8wVuF5WnSbfq1GWoDZ0iUkH
 +AilJwKeGFOqBzj7ff1rmsqKegvnSl4JdJ2ydQaqcFAu97ho0+A3JEMnCgc0DHZUX84U
 XZg9jDmvcZazzggA8bfiCflfK8JQwU432BgCeKz8udVSMEgBCSpyq5Asar7V+Bf/F2re
 oKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmvSTlRwfQRV5lemLOZaAJQ5k47lKUkX2PmvnCoa19o=;
 b=EK4O+6rIXxYWGTphEy9DZNM9Efji41LiWijtXh8a+7y/Z2KkgnwAMb6L4ebJQMHpuk
 dIP3KwzVeSsMqtpD9MUkjcxVCJmaMmdXHK8aQINl23n+1bla90F39/WXxUMhuvXB03dH
 nPLhj/tJ/tVbP0mDDfO8IAEai/uRaGAcZDboU8B5ro6KZlJWJ5xydmPoOWtvukCwtp8X
 yccct/9yM+1SYv/5E82UvyYS8IDh6BLgTYIl9WbVUxOqvjKOcF8cO0Fn/Y0chpjsQwp3
 /mSKYmctBTSpW/WXB7NrwnV0HPATV4sW0ZvZTY9GJEiaAEziO4Zdq5VLDbRmNW1rlXrv
 r41w==
X-Gm-Message-State: AOAM530uYP2jw9EdXeCH8IikLUZ5Srch4IrRMq/PoOymNmv3jG6dEnsG
 hKjzI4po9y7TNe6+rmSYQcwiP1wy8fNbyQ==
X-Google-Smtp-Source: ABdhPJwYoTfOSa7oxE7naiCffSJTuXEplbYHfqxnY4KoV17EU/uqDvbUevMydAWIcUd4YPg+4J5yag==
X-Received: by 2002:a17:903:32c8:b0:150:1189:c862 with SMTP id
 i8-20020a17090332c800b001501189c862mr17274672plr.134.1645986090037; 
 Sun, 27 Feb 2022 10:21:30 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t41-20020a056a0013a900b004e167af0c0dsm10776252pfg.89.2022.02.27.10.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:21:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/nios2: Rewrite interrupt handling
Date: Sun, 27 Feb 2022 08:21:18 -1000
Message-Id: <20220227182125.21809-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the problems that I pointed out with respect to the
existing Internal Interrupt Controller, and a few cleanups on the way.
It passes check-avocado, which is the only nios2 test I know of,
so more testing would be appreciated.


r~


Richard Henderson (7):
  target/nios2: Remove mmu_read_debug
  target/nios2: Replace MMU_LOG with tracepoints
  target/nios2: Only build mmu.c for system mode
  target/nios2: Hoist R_ZERO check in rdctl
  target/nios2: Split mmu_write
  target/nios2: Special case ipending in rdctl and wrctl
  target/nios2: Rewrite interrupt handling

 meson.build               |   1 +
 target/nios2/cpu.h        |   1 -
 target/nios2/helper.h     |   6 +-
 target/nios2/mmu.h        |   1 -
 target/nios2/cpu.c        |  10 +-
 target/nios2/mmu.c        | 265 ++++++++++++++------------------------
 target/nios2/op_helper.c  |  29 -----
 target/nios2/translate.c  |  71 +++++-----
 target/nios2/meson.build  |   3 +-
 target/nios2/trace-events |  10 ++
 10 files changed, 150 insertions(+), 247 deletions(-)
 create mode 100644 target/nios2/trace-events

-- 
2.25.1


