Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9C581657
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:24:33 +0200 (CEST)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMQC-0003ac-Pu
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMM7-0006Nd-6O
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMM5-00062X-EQ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id a11so8946082wmq.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZzyAgYoa6uNLZTiIWNp3MXyMKFoL8B4Ig4Rg0wdDoA=;
 b=du44jIXQtwGUuF0YXIuiIG0smt/MpMEnRDah3Cq7xAxX+wF0MS6Sy+lI0mGg/1WErQ
 TJjjmwWYRMiNe5P9Jw8VXCgYEieoMauxpWZLpG/g6/TQHZMZHsuyic/2uWEKYHj2AaNs
 adPor2YVKVIAzLPyhT0XW345zODJzmhywaesUf9oMKrzQkOMogyTW3zqjmL7z2ZIVsh/
 AmbzFQkYj5ZnW57VwxB1qswaewqyMh2sTQ96Zips+hf5GRlqRQEQ2WvKH8CfE5WO8Fek
 +6u1N4SyoAF/tG7ywIwMAc/LHBVFhGJfzXeyQ4gWn7qfrebI617atKmOL7BnSuu1OsYw
 wsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZzyAgYoa6uNLZTiIWNp3MXyMKFoL8B4Ig4Rg0wdDoA=;
 b=WNsGEHT2xUnQU12BgPAOkAewFqbY+g4pGJq3EAyz6gV508vigQxmtqb3gchfO4V+nJ
 6OHHgTe7O+Z2xPfVrp1NRiuDWfaMyxZqmY36qV3j4nAic8IaxPaZ55wEPzKIANCqiCh7
 JEotmmaMEuelpTz3A/t36QhUCQV0ZTKStXRba+bM4Vp2+NbiFW82kJ4ep/H2hx/5GavG
 GHu9ma2owF3boPA2NJbDY7RsCDAbQkW7UkXJjI9mBQB8sktvEhb1doVND0H9wRc//fOV
 w432f45etA+5PTx2g+L6llHByq2HUKXOkDHq6pckcDMTWovDKpB4/RRdh3kNMB5y8BlM
 EaRw==
X-Gm-Message-State: AJIora8i/DyE0kJLwwpqw610uHtqv6qwVmN3eoNJvCZeCLA2XAwwt5Y2
 Yv+n3eWKMInqLq2XbxfKRpZjP4FoM/LYXA==
X-Google-Smtp-Source: AGRyM1utRoVKsNZ9rz9KjqVqDSkqD9/vv7clNIyS/C6vdtKXbIraYjAqlzfgzTQ5ZuhSfQjnUyActA==
X-Received: by 2002:a05:600c:34c9:b0:3a3:74a1:2754 with SMTP id
 d9-20020a05600c34c900b003a374a12754mr2156781wmq.35.1658848815585; 
 Tue, 26 Jul 2022 08:20:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] target-arm queue
Date: Tue, 26 Jul 2022 16:20:03 +0100
Message-Id: <20220726152012.1631158-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

A last lot of bug fixes before rc0...

thanks
-- PMM

The following changes since commit 0d0275c31f00b71b49eb80bbdca2cfe244cf80fb:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-26 10:31:02 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220726

for you to fetch changes up to 5865d99fe88d8c8fa437c18c6b63fb2a8165634f:

  hw/display/bcm2835_fb: Fix framebuffer allocation address (2022-07-26 14:09:44 +0100)

----------------------------------------------------------------
target-arm queue:
 * Update Coverity component definitions
 * target/arm: Add MO_128 entry to pred_esz_masks[]
 * configure: Fix portability issues
 * hw/display/bcm2835_fb: Fix framebuffer allocation address

----------------------------------------------------------------
Alan Jian (1):
      hw/display/bcm2835_fb: Fix framebuffer allocation address

Peter Maydell (8):
      scripts/coverity-scan/COMPONENTS.md: Add loongarch component
      scripts/coverity-scan/COMPONENTS.md: Update slirp component info
      target/arm: Add MO_128 entry to pred_esz_masks[]
      configure: Add missing POSIX-required space
      configure: Add braces to clarify intent of $emu[[:space:]]
      configure: Don't use bash-specific string-replacement syntax
      configure: Drop dead code attempting to use -msmall-data on alpha hosts
      configure: Avoid '==' bashism

 configure                           | 20 +++++++-------------
 target/arm/cpu.h                    |  2 +-
 hw/display/bcm2835_fb.c             |  3 +--
 target/arm/translate-sve.c          |  5 +++--
 scripts/coverity-scan/COMPONENTS.md |  7 +++++--
 5 files changed, 17 insertions(+), 20 deletions(-)

