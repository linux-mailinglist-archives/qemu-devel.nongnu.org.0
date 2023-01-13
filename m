Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2626698D7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:41:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKHM-0007pz-5L; Fri, 13 Jan 2023 08:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHJ-0007pK-SQ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:29 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHH-00052p-31
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:29 -0500
Received: by mail-wm1-x333.google.com with SMTP id q8so3491241wmo.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ag3EpefCySV9M7Y3LSu+cq8fLDk2WVcuBhQ1vB2AV0Q=;
 b=ffMeSMxEU3S1W3VzMY/uKy6VO2P1gV6iwK5gbBiVt2h0z25X+g6XaK5x+BSiiWZrSJ
 5xTCdX5qpDAmRJFwASEMZReYZg0LU4TNehchieXO/crSDodCHWRABQ5sTYj0fFYMoPRq
 e2c/LlZsq/utCq53cy/uOREw9FTETXdAGj4dfpN/6FccO0ZXFuCGIIkp8cxBnrk99Yw/
 HLT7CV+OZGBzUsHa1WRRisZZiWyb9vuTosT+CoNKpg5j532n932lx5xifGbOb2EIb0TJ
 YqXowydTLRsPIG76VYk79NdWxdDjqN9T63RWWjMz5cV86GnDVrShMSONSXKpaccK40VH
 CfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ag3EpefCySV9M7Y3LSu+cq8fLDk2WVcuBhQ1vB2AV0Q=;
 b=03UyZh9Sl8OhbaKeMajdjYWNb6NToEc/m4moMGAr/+fV9wrMoCugmEy3lormkFhQ5z
 7Ll5aTVDp8zada1bCmTU0e3wl64qyxUn77EPPkfpx1ofCjjLv+Rfpp4j/NHo4E2SyIHK
 EVD7pXikGTQpNZeIQen9U2ImiRFohcs+v9wBLMxYbUAVycGXMLplJd8o8iLWvSKSC79D
 wW3mpqfwAEPnLmXWyfdpOWK6h+QD13UBIMFb6NQjSgl9SaOnvFm/Vd5RIUAiSAtGa+R5
 gyLSZf9sIlaxjfmXeLsionjxDr+UTWyzfF/Bg4TkYtO4pV3MzE8G3V6Ial1vpfPH2CFo
 MY4Q==
X-Gm-Message-State: AFqh2kqu94kE4wgMLn8VNqqLfA/xdh1AKhrVgdu/Pk43RUg5kUEhBFpd
 A8U2MAJToPU9TTAjBHkij7q05A==
X-Google-Smtp-Source: AMrXdXtC1GaOSo9DfmROrxqR+oqpHnbttN3y786VS4vSePMTmieMB9CfE9MUG6/HpbqoHc35TRY+KA==
X-Received: by 2002:a05:600c:4f02:b0:3d9:f217:6f6b with SMTP id
 l2-20020a05600c4f0200b003d9f2176f6bmr14094880wmq.33.1673617165272; 
 Fri, 13 Jan 2023 05:39:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj27-20020a0560001e1b00b0023659925b2asm19584830wrb.51.2023.01.13.05.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 05:39:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 600D31FFB7;
 Fri, 13 Jan 2023 13:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, peter.maydell@linaro.org,
 Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: [PATCH 0/4] Improve the introductory documentation
Date: Fri, 13 Jan 2023 13:39:19 +0000
Message-Id: <20230113133923.1642627-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

I've split this off from my bigger branch for hopefully fast review
turnaround. This also includes the new semihsoting documentation and
takes into account feedback from Peter on IRC.

Let me know what you think.

Alex Bennée (4):
  docs: add hotlinks to about preface text
  docs: add a new section to outline emulation support
  semihosting: add semihosting section to the docs
  docs: add an introduction to the system docs

 docs/about/emulation.rst      | 183 ++++++++++++++++++++++++++++
 docs/about/index.rst          |  17 +--
 docs/devel/tcg-plugins.rst    |   2 +
 docs/interop/qemu-qmp-ref.rst |   2 +
 docs/system/arm/emulation.rst |   2 +
 docs/system/index.rst         |   4 +-
 docs/system/introduction.rst  | 216 ++++++++++++++++++++++++++++++++++
 docs/system/multi-process.rst |   2 +
 docs/system/quickstart.rst    |  21 ----
 docs/tools/index.rst          |   2 +
 docs/user/index.rst           |   2 +
 qemu-options.hx               |  30 ++---
 12 files changed, 436 insertions(+), 47 deletions(-)
 create mode 100644 docs/about/emulation.rst
 create mode 100644 docs/system/introduction.rst
 delete mode 100644 docs/system/quickstart.rst

-- 
2.34.1


