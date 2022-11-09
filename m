Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC976230EE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:02:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoS1-00041E-RB; Wed, 09 Nov 2022 12:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osoQx-0003mq-Jj
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:00:15 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osoQv-00019P-JZ
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:00:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so1724299wmi.3
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 09:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V5aTWKgcN43+Gn8Ya/Jicxm7hCiOiDyKLSwHBQnrTgs=;
 b=j7iYK6jbkxxgBEaK9hwd7ZWm526D6cDxC7OiDAnuMvPvKZgHGFCIVkAW7le7Pkb5HW
 WekmEF0pDyhc9eifFJyQvY25oI2dqiLEfII8jiilBs+jDFTs8K36WXhv5/q6Aou9/Z0b
 q3ySFQFXkXy00Pf+8jZ9JR7zsJjqecrdVC2opwU+oGGOgmVk6iyz6PEZFim39oPPtvPu
 5LVRimAiGp3VyhzRhnw/8kjvKJnnsx3KAQ2cGHWkr9G7jZdkqDz0pIYCxGd3dJiIb/VX
 bQoNBuV04xUW7B7DVT5biFhGDvQM0vPm3bm+ynyRpjajH1u5bC/VkJePVrWNio87A2lG
 WDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V5aTWKgcN43+Gn8Ya/Jicxm7hCiOiDyKLSwHBQnrTgs=;
 b=h6M5hBA+4if8QuuFK6bmT9tvCvHzDxQ7kzGML+m5P2oMtEdgvH2mFOuPn/rcYDMIQo
 WQ55lL9CQIjsDJ5/TWnfBfJoM2V8ISfWUgIW/Zzgm112ENH0Rr0JeVvbn9VWzoO/ALtu
 3402YgV1G3VwZGBZkga2DKf/fo49xr3agb+FAsMhG031QxD302N4L1twDe9H3vycRFfn
 /u4koxivRC5JLrahCwnVqOQ75wRvAAotONwz2Oc62kcDMyh3ne7+jH1xisHgulTvxPYq
 mSLFAh9ZESi1c6CWH7GAhcLSFNSTuxwPyHoHI9OhJUTYMUq8TRC+R5DxUtAEJC4bAtc0
 +NBw==
X-Gm-Message-State: ANoB5pnaUCQhQS+4bFW+K/PAIEQ8NTYidQGyVeQXOC+KxixnV57Ix5BL
 rbl08wMT5PpV1lZceW49fT7D4nFDSEl+kQ==
X-Google-Smtp-Source: AA0mqf6gDvvnfZ1ubKJ5WJ0EXs9yuHj4RNNq4XMAGvleioW6mDS++xRP55z9jPJ0zyNkZCi3uWW6TA==
X-Received: by 2002:a05:600c:4e92:b0:3cf:a6d9:7b03 with SMTP id
 f18-20020a05600c4e9200b003cfa6d97b03mr13111624wmq.205.1668013211487; 
 Wed, 09 Nov 2022 09:00:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003c6b9749505sm2514932wmq.30.2022.11.09.09.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 09:00:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH for-8.0 0/2] hw/input/ps2: Convert to 3-phase reset
Date: Wed,  9 Nov 2022 17:00:07 +0000
Message-Id: <20221109170009.3498451-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

This patchset converts the ps2 keyboard and mouse devices to 3-phase
reset. The rationale here is that it would be nice to get rid of the
device_class_set_parent_reset() function, which is used by
legacy-reset subclasses which want to chain to their parent's reset
function. There aren't very many of these devices in total, and if we
convert them all to 3-phase reset they can use the 3-phase-reset
equivalent (resettable_class_set_parent_phases()).  Eventually this
will then let us simplify the transitional code for handling old-style
device reset.

This is one of a number of patchsets to do this that I'm planning to
write and send out over the next few weeks. It's all 8.0 material.

thanks
-- PMM

Peter Maydell (2):
  hw/input/ps2: Convert TYPE_PS2_DEVICE to 3-phase reset
  hw/input/ps2.c: Convert TYPE_PS2_{KBD,MOUSE}_DEVICE to 3-phase reset

 include/hw/input/ps2.h |  2 +-
 hw/input/ps2.c         | 45 +++++++++++++++++++++++++++++-------------
 2 files changed, 32 insertions(+), 15 deletions(-)

-- 
2.25.1


