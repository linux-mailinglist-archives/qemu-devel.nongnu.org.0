Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC235E5475
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 22:23:24 +0200 (CEST)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob6Ff-0007kb-9m
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 16:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ob69g-0004Vj-HK
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:17:20 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:35640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ob69c-0006DI-Pw
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:17:12 -0400
Received: by mail-lf1-x135.google.com with SMTP id z25so11144004lfr.2
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Bd0ADN6kOy/s6hK/meYtB1/WHeNDc88GL+aW20dj/ag=;
 b=Hg8OAkDOIS0xsq/DmCWrait60t9XJ4FEbivosNEaQIZ45VsxjVZvBUYA6JCH1HaQtU
 BZ+lUDNO2+h6NT+cGedkt0vPyWVpBA5JgZSlLGfdVFMQAj5ILl9catOhbCc4JHoVQamM
 NYZGDjjpCoyZMgxn4hJG5PPx0qcLqwwfJ4btEgVCbOpmain59cSqLlNoqs7dh8/6KSIt
 Grprh+fcv+rP2ZWqUpq5YuSohncQbKo00TBDKn7odoWX3ga5r8egP01wQniy7GqfTYS4
 91iNrl/VLzJ1f6HvytJf5PNg2Sta+0UwFYZpNEiGdZodg538zENwIqtGZtl6byxf80YU
 2XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Bd0ADN6kOy/s6hK/meYtB1/WHeNDc88GL+aW20dj/ag=;
 b=0SsbpEP78TwqkLaYNuOm+ssRRrj6/287Ib6N2c3oO63+0qEKD44aL+exsWzGIB/5Ft
 A5m4V+qtx08OifEz7YyELV2vEDZQyHq94/7YNqjwPi0u9IM/AsmLkwppK1PsXQ9G+GyV
 HRU10RT7kWJD1h8SpWiwMOdHZGIc1cU5MccbJpJscN07Z6QFwnGL1QtOwfc0BQmKJMY9
 iVL+V/aG392HFfKw9C82aZaSY0FfWCcVHnexvNf5CVEsf86vFCvlMTDY4tf00+gV9d7j
 PcYkgSpqiVBjrW2xZqNhQjT+qATvYXtGNxWwsybb72SLzGqrPvzg8tJ8NvfxwtynS1dG
 Fwvw==
X-Gm-Message-State: ACrzQf0tuAO8el4S5xip/vArwGtDjaPVZUXL/5gWOq/VW5qg5QQmU41r
 D1NdQ/k2rEQ/HxowmC3IvWEMvbSwM6Yd5A==
X-Google-Smtp-Source: AMsMyM4BVslgASwjDUOvo3RW2W1duEgGY33fFlDDKACUY/AS2HOjER0pSehHHH37xJkpEzY0Tz43Xg==
X-Received: by 2002:a05:6512:31d1:b0:499:fa38:3d7b with SMTP id
 j17-20020a05651231d100b00499fa383d7bmr10459167lfe.544.1663791425835; 
 Wed, 21 Sep 2022 13:17:05 -0700 (PDT)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 h2-20020ac250c2000000b00497aa190523sm569394lfm.248.2022.09.21.13.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 13:17:05 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 edgar.iglesias@amd.com
Subject: [PULL v1 0/1] Xilinx queue
Date: Wed, 21 Sep 2022 22:17:04 +0200
Message-Id: <20220921201705.1309392-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

The following changes since commit 2906f933dd1de6d94c54881cc16ea7390a6ba300:

  Merge tag 'pull-request-2022-09-20' of https://gitlab.com/thuth/qemu into staging (2022-09-20 16:24:07 -0400)

are available in the Git repository at:

  git@github.com:edgarigl/qemu.git tags/edgar/xilinx-next-2022-09-21.for-upstream

for you to fetch changes up to b91b6b5a2cd83a096116929dfc8e016091080adc:

  hw/microblaze: pass random seed to fdt (2022-09-21 19:59:56 +0200)

----------------------------------------------------------------
Xilinx queue

----------------------------------------------------------------
Jason A. Donenfeld (1):
      hw/microblaze: pass random seed to fdt

 hw/microblaze/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

Jason A. Donenfeld (1):
  hw/microblaze: pass random seed to fdt

 hw/microblaze/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.25.1


