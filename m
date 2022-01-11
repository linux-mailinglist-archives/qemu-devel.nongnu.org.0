Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1E148B37C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:17:49 +0100 (CET)
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7KmK-0001RP-3N
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:17:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kff-0005AQ-Ct
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:56 -0500
Received: from [2a00:1450:4864:20::329] (port=33675
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfc-0007H7-NI
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so1014784wms.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UEBAvPKmww5qyhXWHyPh0DcpqRnG4rj2B1wWnUAe9YM=;
 b=kjrIiBaDng6RPICuavgiKj7Feufx8wvRiHVJqKEyWR2eAfUaL0pothYStpNEYaj4/m
 v5oYkb0oR0g+6MD2X7tkDpc+1KFpDfI8DSFHmFUsjMVE+eWGqWCfmi0c2PZt0Kp+VR1P
 dkGLyYOe38HSYwQ4lXLS09FyS5fxrF9FjOpJWztOfKBH5kfmL6LjKcf/Zc3iiIEGI6jC
 d2c03f1x2FjFA+zBnl3iaOFgvKOCGa/t2Rrub2Zt6aoIBpSW/+4+WTKVryYvTuILBrjj
 bfpoT5+aqtY0pjDZZGadFb7oTatZkDF7zlHFuQQJawZ9Q1mApUSoVem//zx8xZmB7HJX
 7soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UEBAvPKmww5qyhXWHyPh0DcpqRnG4rj2B1wWnUAe9YM=;
 b=URYMb8O1bHR9royrZ99aHV2LCg2Twyi1jNB2D+JXp41ANJSc8a21uxBNgdVvLt8sbm
 WQjAx36f6/gCcawv7TalkQhaslGoe4Rr/2nSLiUUa2AOlFb6zID5SBJMJCpbSYvwwWy9
 fJA39hS+C1VsGYc1qfWErcbuDssRMzitXtLpUDpqbPjpxWs/1S0tv8PWTw3RC5ntmbcx
 FgDK/2CE8mnM0C2DQAzYYhwVXK9P83mhdveEBqye5wdEPoso9a4c0Scd8ACXUxBf0xck
 aUFHJaHp/OPbX4hjF4SJY/q8jd0PIstff2Ijsy2N4e8gKBB276poV5XjCbs7nBR5nNkP
 87KA==
X-Gm-Message-State: AOAM533pD95xJ2dyGR3IC0CfZpE3ajPMxArqo6CNN4YQc05GmLoF6apx
 mtGY/OR1sLfpQFIiLA0PwOCHXw==
X-Google-Smtp-Source: ABdhPJwd/igU2783YHTSTDO3m5gM40Ock0gTjFMQZjA3Ec0NjEYND/sp/53xnhbwOWrtu66U10yZ2g==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr3257846wmf.81.1641921050996; 
 Tue, 11 Jan 2022 09:10:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
Date: Tue, 11 Jan 2022 17:10:35 +0000
Message-Id: <20220111171048.3545974-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've been working on the ITS to add support for the GICv4 functionality.
In the course of that I found a handful of bugs in it and also some
places where the code benefited from refactoring to make it a better
base to put in the GICv4 parts. This patchset is just the bugfixes
and cleanups, because there are enough patches here that I figured it
made sense to send them out now rather than holding on to them.

Most of these patches were in v1 and have been reviewed already.

Changes from v1:
 * first half of the series is now upstream
 * patch 1 now has the '1ULL' and uint64_t fixes that were
   partly split across two patches in the old series and partly missing
 * new patches 12 and 13

NB: I left the returns of -1 in patch 11.

Patches still needing review: 1, 12, 13

thanks
-- PMM

Peter Maydell (13):
  hw/intc/arm_gicv3_its: Fix event ID bounds checks
  hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
  hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
  hw/intc/arm_gicv3_its: Don't use data if reading command failed
  hw/intc/arm_gicv3_its: Use enum for return value of process_*
    functions
  hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
  hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
  hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
  hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
  hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
  hw/intc/arm_gicv3_its: Factor out "find address of table entry" code
  hw/intc/arm_gicv3_its: Check indexes before use, not after
  hw/intc/arm_gicv3_its: Range-check ICID before indexing into
    collection table

 hw/intc/arm_gicv3_its.c | 492 ++++++++++++++++++----------------------
 1 file changed, 225 insertions(+), 267 deletions(-)

-- 
2.25.1

