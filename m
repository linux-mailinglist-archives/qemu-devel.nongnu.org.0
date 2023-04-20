Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120386E98F6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:59:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWf6-0000Af-21; Thu, 20 Apr 2023 11:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf2-00009y-13
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf0-0007tl-8Y
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:27 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o9-20020a05600c510900b003f17012276fso3297234wms.4
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006245; x=1684598245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vAdNEFQvv1ZcttnJXS5Hs7iy0AoFGSXOdxVi76amA+w=;
 b=eDm87Gb4+MCcFN72cRJ4BYi7S+nvAIy6WsJfHejcPo1tYuZF8VHrAnZAi1Min2nLI7
 e5c2q8cLblnkcRsEoBpPOPJAXhy+ZAz1uNXz+vaxervnsjqCa4CGn8MYAvx7MHG4Xhbk
 PMWSLBwqIA64bMAx1UEksn6iV6Wf0Mq0mum2/F426u3leTq2L+tCXAPT6z+jAn0VoxZN
 s0ieOdfHU7JXYqexNSBbaXzyLZOVkSIOcRJeozNnbi6bU/3DCcVjJ7ZCeSuuHGU4Iu7q
 w5/L9ddzlOEDfZRFLX8E95bcXFqRuseHNwNMcA9w26rHSj5AABumAfuFG92wVWAxdpeR
 Pnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006245; x=1684598245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vAdNEFQvv1ZcttnJXS5Hs7iy0AoFGSXOdxVi76amA+w=;
 b=jcSkoKXhDD4//qJxw/VNrtjpB/CpV+tm4PYBtZxBk3bqmpaIbAWFANtsphwIT5sel2
 FU4GEJJ65Ig5RNh7LnrlM+H1M5DwirRDYLrDi11bzlxsIbFL1nH0JJdHDr0MYhHTgo6O
 nPMYLxsjD/OWnBNXn6xgJi9kUQ+R8EjvzQkL2NgyJga+aObtLoEhGmko7+DBEpy81E0t
 Nz0KJkbGcWoibEI7gN4eMSw7Pl+C38LgJI7Nk2lT7JbUn+2Nm+wv3pLOGeZ3lh8xpinb
 Xsz/7rohXaPjMwTwmq0pQpIk5AmKhNzsJALDb2+E7SyCsT59YSz4eJBksw0hIenhMF8U
 H6ww==
X-Gm-Message-State: AAQBX9eyNPeq4b9xJbbS5bUEwHp/Gm3gfSZiE/CzddLjEMc47xsHYWji
 OjiZDAt5Ax193XbVWnsATyox3Q==
X-Google-Smtp-Source: AKy350bQl+S02RN8+7SXJ9aDmEt1/dVBSDysc6b/Fa3QCTAalit+RWEd4qUiw7wChvyGg+JE/7IuoA==
X-Received: by 2002:a05:600c:2055:b0:3f0:9ff5:79fb with SMTP id
 p21-20020a05600c205500b003f09ff579fbmr1526016wmg.39.1682006244855; 
 Thu, 20 Apr 2023 08:57:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002f79ea6746asm2251259wrq.94.2023.04.20.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80DB51FFB7;
 Thu, 20 Apr 2023 16:57:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 0/9] docs: various (style, punctuation and typo fixes)
Date: Thu, 20 Apr 2023 16:57:14 +0100
Message-Id: <20230420155723.1711048-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I accumulated some doc fixes that didn't make it into 8.0 and thought
I might as well see if there was anything worth adding to the coding
style while at it.

Let me know what you think.

Alex Bennée (4):
  docs/system: remove excessive punctuation from guest-loader docs
  docs/devel: make a statement about includes
  docs/devel: mention the spacing requirement for QOM
  docs/style: call out the use of GUARD macros

Juan Quintela (1):
  MAINTAINERS: Add Juan Quintela to developer guides review

Peter Maydell (1):
  docs/devel/kconfig.rst: Fix incorrect markup

Stefan Weil (2):
  docs: Fix typo (wphx => whpx)
  docs/cxl: Fix sentence

Yohei Kojima (1):
  qemu-options.hx: Update descriptions of memory options for NUMA node

 MAINTAINERS                  |  1 +
 docs/devel/kconfig.rst       |  2 +-
 docs/devel/qom.rst           |  2 +
 docs/devel/style.rst         | 79 ++++++++++++++++++++++++++++++++++++
 docs/system/devices/cxl.rst  |  2 +-
 docs/system/guest-loader.rst |  6 +--
 docs/system/introduction.rst |  2 +-
 qemu-options.hx              | 25 ++++++++----
 8 files changed, 104 insertions(+), 15 deletions(-)

-- 
2.39.2


