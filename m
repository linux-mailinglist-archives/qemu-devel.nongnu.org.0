Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A875666FB7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFulJ-0002ck-NW; Thu, 12 Jan 2023 05:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulH-0002bt-JS
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:24:43 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulF-0000G8-NE
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:24:43 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h16so17584691wrz.12
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pUt2fCbjnP/nxf1w2dJ2Mjx3l0EPof46EnPcs43EofM=;
 b=Frq2lZN83ryyORuYJm/WlA+VZTKwTZ7LhsmfPyF0XRxJ68sPBtFELrOLaKA9t0Eury
 zbQ0S+18tUId1UVAUdF4d7/TbJfMt/lyNA/3VEmpz4WRsnSwDrvLyAwmWAtT5icyGnkO
 RmCNnhZ4ym+K5yMR5c1Vz2klfsodjPH1VZW7kotz2Yfa6qJ9wmSA/9lyFG0Ud/wwNUC0
 uPbJre0HB7bOSOxjTt6McQSSEdI5/1kcr94R5/dD+2MeQ8yv3symtOi/8LxNCVma4RL7
 uE11rYYSvthAVa0Ieib536V8kWQXAOLvcAsFlI+xFBQSscnVf89ujozUjyHKnJHopHBB
 4NPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pUt2fCbjnP/nxf1w2dJ2Mjx3l0EPof46EnPcs43EofM=;
 b=mJDxZGBwxkiTdvzKhv9bTF+muzbhUgRWtPdXmpEM62112/G57+ZEh4hqK+isEQvyfA
 V64pWXx/dz9p1SN6aPxzP77qARMNK2iF9hYPqbjOm/ispZgrsgPVPwJQ1omIE7l5ORT0
 sYrH5YMTiX0t59b/ZNP/xpkTyaW2mefl4RPGSh7PMGN2wqIrvoiRwC+xPad6tXMSX3uX
 VwCzZw924P6vsy/kSN7mXIy+Ts8BQGtL1nMeqoCdID4YHhMf9QtPAgcCQ7iFg1SAfq8P
 HhjweaWa3E7SNHKfD95oeXRzzMNsCfyUDcKtAQJkdsdXDDu6CjDBcPXd2d77T/eySpTG
 9K3A==
X-Gm-Message-State: AFqh2kpYdEwzTU+RBRwf0caQr+paOF7zjF9QzQTbQBdQvLPMnko3ZSf1
 shT8l/2l8nAAkDvoDmrKXo7XdtjoV4LFkz+F
X-Google-Smtp-Source: AMrXdXvc8HxKrRZ0E3GDmIJQcRjQnhdoN1SsmINu6/5ytxYxzKri7XM9EXGMMlI5JFYws4K+W86D5A==
X-Received: by 2002:a05:6000:1245:b0:2bb:33e4:7ce2 with SMTP id
 j5-20020a056000124500b002bb33e47ce2mr13335490wrx.34.1673519079011; 
 Thu, 12 Jan 2023 02:24:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adf9b01000000b0028e55b44a99sm15904126wrc.17.2023.01.12.02.24.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:24:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] target/arm: Introduce aarch64_set_svcr
Date: Thu, 12 Jan 2023 11:24:29 +0100
Message-Id: <20230112102436.1913-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

This is a respin of Richard's patch
https://lore.kernel.org/qemu-devel/20230112004322.161330-1-richard.henderson@linaro.org/
but split in multiple trivial changes, as I was having hard
time to understand all changes at once while reviewing it.

Richard Henderson (7):
  target/arm/sme: Reorg SME access handling in handle_msr_i()
  target/arm/sme: Rebuild hflags in set_pstate() helpers
  target/arm/sme: Introduce aarch64_set_svcr()
  target/arm/sme: Reset SVE state in aarch64_set_svcr()
  target/arm/sme: Reset ZA state in aarch64_set_svcr()
  target/arm/sme: Rebuild hflags in aarch64_set_svcr()
  target/arm/sme: Unify set_pstate() SM/ZA helpers as set_svcr()

 linux-user/aarch64/cpu_loop.c | 11 ++--------
 linux-user/aarch64/signal.c   | 13 ++---------
 target/arm/cpu.h              |  2 +-
 target/arm/helper-sme.h       |  3 +--
 target/arm/helper.c           | 41 ++++++++++++++++++++++++++++++++---
 target/arm/sme_helper.c       | 37 ++-----------------------------
 target/arm/translate-a64.c    | 19 ++++++----------
 7 files changed, 53 insertions(+), 73 deletions(-)

-- 
2.38.1


