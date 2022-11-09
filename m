Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D64622456
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 08:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osf6c-0006dk-5e; Wed, 09 Nov 2022 02:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osf6X-0006b4-6p
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:02:33 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osf6V-00023w-Gj
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:02:32 -0500
Received: by mail-pl1-x629.google.com with SMTP id j12so16272750plj.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iy3i3TDKrp65yr9vk56M6NY8GgxC8G35CVISVv3lJno=;
 b=NmWxAnjfEkk9wEo1XxKRlSGlCIctP+dmjQk4ztb2to8CutJgyXGHEfSNByXp8kZ9Q5
 ylNCDcyplMX1wRGCQonvt4l0CI6FOsNxix6EuQf9IaM2lNquicKe5ioKFy8+E7tDx0DE
 vfkeXd9bzVZsKq8wEg+HVVrSWkfefwe7GaowCVb80dRpBnowYNQbAUeQkdkVoNd1Dz2b
 PTOonttH3QptSblGkp6XJgndznXcJX5O7SXCXiQ983HoQwZ4e10R2xdPkUUVc+D9gav8
 9BqifYDu4f3N+ebbzXLtlPb1jg4tI9uaV9/foxVJnuDAfR4uGv0D09CfqHTS9xzQWgtj
 gVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iy3i3TDKrp65yr9vk56M6NY8GgxC8G35CVISVv3lJno=;
 b=ACVHu2M0ZUXgKqPcwMoz8PCIntpw/Xd79OJI97vHEEcEpXpQ6/hoHk9+0NWilcZQWr
 pOHqyteNjbG1sFZY4Zn5JvPDIPT6/KBZ894tOZ8szUv+MgzzZSJ9wcn5FBBHHR/dGQ4F
 p4FDjXa0Vc13PQfIsyTngHXhi2arXULS3ceyZky+VL136G8qg4lWlpl85Sc8l3ow7BcW
 BkrKd3suxmZO2Kv6JhECLbJE3FOFRuxPSRMJ9qc//T2UMQGuHEdZe9vOoAC1B4RqzCaJ
 qtELojY3iFwYRLJToX8VX1be7zAK8Twa69aihzIwVBu655zG4jF+uM06Sw+2bdq1J9x/
 +7jg==
X-Gm-Message-State: ACrzQf0fYx1cSyDwBOmx2XyNTp4pD8vHwpxjKEslEni5sC351SVaStFw
 oE/H+k/iaoMZCl/ny1vjTfXp40re0MSgeieJ
X-Google-Smtp-Source: AMsMyM6k8gXDKq8lmDXpHrCcqE0W2yLiEj6tPQ//6bIq6vv3iOU3nXfaD1ae3Mz5VWE0NOFmblR+aQ==
X-Received: by 2002:a17:90a:8a8c:b0:213:c06c:7003 with SMTP id
 x12-20020a17090a8a8c00b00213c06c7003mr58140020pjn.147.1667977349964; 
 Tue, 08 Nov 2022 23:02:29 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-855d-0172-a1c2-6464.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:855d:172:a1c2:6464])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0017bb38e4588sm8158784plk.135.2022.11.08.23.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 23:02:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PULL for-7.2 0/2] tcg patch queue
Date: Wed,  9 Nov 2022 18:02:22 +1100
Message-Id: <20221109070224.13073-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

The following changes since commit 60ab36907ded2918d33683f2b66f603b7400d8f3:

  Update VERSION for v7.2.0-rc0 (2022-11-08 15:53:41 -0500)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221109

for you to fetch changes up to 344b63b380541a63c02ef7a8a6ae66cb0b6f0273:

  accel/tcg: Split out setjmp_gen_code (2022-11-09 12:29:03 +1100)

----------------------------------------------------------------
Fix -Werror=clobbered issue with tb_gen_code

----------------------------------------------------------------
Richard Henderson (2):
      tcg: Move TCG_TARGET_HAS_direct_jump init to tb_gen_code
      accel/tcg: Split out setjmp_gen_code

 accel/tcg/translate-all.c | 68 +++++++++++++++++++++++------------------------
 tcg/tcg.c                 | 12 +++++++++
 2 files changed, 45 insertions(+), 35 deletions(-)

