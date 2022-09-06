Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA34A5AE571
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:37:02 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVwz-0006BJ-TV
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSi-00044m-Tr
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:45 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-00032q-22
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id b17so1299540wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=rKEl0ZJJnJEhJKZ7s7QOjUyO8vz3YSFy/pN9kmQB2jI=;
 b=dC/C5noBn/UTt0vys3xh+4IM9b/f4Nrm9jzlYrgboOmUAFrFO8jxLR2p1RVD+e1Nh0
 h7nYdMLQZKkw8UowmIzLzn7afPVSeEoObgsCyvn5A8JOqwGe9zCK54BSD7vd1ZJw3GEn
 7ZbDxqLrKO95qAzhFEcj47zZHJRGRJJeHTLWsbs+VljUCEkw4th4ZIpOqIo5jHh4FKps
 YtTeKt+L8eoLA9RwoG1447U93xfwV3gkUcMxc6O3gyvcPVqBr/XUgcpssO7Xr42/cepb
 /UhubzHXaoSRwfenol0gnWwlJmhPMWIwvIBYHb8rJk4w9FOLJ4e7lvvYxXmIpXa38wZW
 rp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rKEl0ZJJnJEhJKZ7s7QOjUyO8vz3YSFy/pN9kmQB2jI=;
 b=2XcDfKpe6M64vLRyH9QBgv1zAVgZZCpA+aNgorkaw4oUE69zYoTbBOyv12Ckv8/VlX
 S7gvF5dTOBmhuVd2MEibfJIilzvR3tJ8reRSPGXeWLbcbeyF/0yCHR4YEwCixmn4xjUP
 VIVx+URFkG//so93ITRZoBgPvhUtn1xyCdQ2UHAF7bTa1ISJsRkdFTJuJdOPfbiK28g0
 rX/9Y+eSfgTt+eFX8H1CA0/UVdy3q2p/YazMEgF/uI2pDgNh5kLr/PF5DAJhO+6OgfVu
 +rD1nojj8Ugl6l88NV4sXDWG9xL3NTY0gLqRgZwWcnKQe+L5nUg6cm3zQ3lIUW1QeFSl
 uSYw==
X-Gm-Message-State: ACgBeo0PZx0oLv7436hOZRH/B2PCcoqPf3v1bPm+qPkikL7cIo0d5O/i
 q3w1w6Ksz4mr3OhvmhmFboHGqCd0jqwJvxR8
X-Google-Smtp-Source: AA6agR4Q284TFna980hZQytr9OVXHsj4QoyLHBYgpWvRzive/9Co0CHTI/PqnZxzd9DXHYZUnX9fXw==
X-Received: by 2002:a5d:6d89:0:b0:228:da8b:2537 with SMTP id
 l9-20020a5d6d89000000b00228da8b2537mr1022094wrs.585.1662458730496; 
 Tue, 06 Sep 2022 03:05:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 0/9] target/arm: pc-relative translation blocks
Date: Tue,  6 Sep 2022 11:05:19 +0100
Message-Id: <20220906100528.343244-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

This is the Arm specific changes required to reduce the
amount of translation for address space randomization.
This is a re-base and split, with no other significant
changes over v3.


r~


Based-on: 20220906091126.298041-1-richard.henderson@linaro.org
("[PATCH v4 0/7] tcg: pc-relative translation blocks")

branch: https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-pcrel


Richard Henderson (9):
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Change gen_exception_internal to work on displacements
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 target/arm/cpu-param.h        |   2 +
 target/arm/translate-a32.h    |   2 +-
 target/arm/translate.h        |  21 ++-
 target/arm/cpu.c              |  23 ++--
 target/arm/translate-a64.c    | 174 +++++++++++++++----------
 target/arm/translate-m-nocp.c |   6 +-
 target/arm/translate-mve.c    |   2 +-
 target/arm/translate-vfp.c    |  10 +-
 target/arm/translate.c        | 232 +++++++++++++++++++++-------------
 9 files changed, 288 insertions(+), 184 deletions(-)

-- 
2.34.1


