Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088CC2AA194
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Nov 2020 00:53:19 +0100 (CET)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbBXi-0007Qy-1r
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 18:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kbBVl-0006A8-3t
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 18:51:17 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kbBVi-0004XU-EH
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 18:51:16 -0500
Received: by mail-wr1-x444.google.com with SMTP id p1so2959193wrf.12
 for <qemu-devel@nongnu.org>; Fri, 06 Nov 2020 15:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XXCUQnvoJZdisbwnmP+9CQY5Hdvy+AAtXVEP2H4CYLE=;
 b=aZU5lZrFnMrfXZseiCRvKpbcUJC44bYpbP3S8KO6ieb8i4FauYI9SKkfVI/tDso3qN
 2tDQFkVo4XKO9R+Qn+r/6SirzseGOyIW31yGxeWSVDuXwqYVJXn4xlpFon6AthwblUh2
 O7JTBbJhMRXpjd5h0Sh42OhYsnQBz7qvsSumKP32Dkw36dhO4qhlovqJKK/0u5WvgWtV
 Y3Hje7jFIryOiuVul9ZZ/4tQymnZhF/RCo/9tdXWUjVvVl0NvDTEDvXNhd2b9rLf9mkY
 sZh3kC7xGCRnZSUXiXR9MErcr2t4b5Rz1eiRNa42BBgGo5V2Vgqw1ilEB63fB8a93a0b
 q5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XXCUQnvoJZdisbwnmP+9CQY5Hdvy+AAtXVEP2H4CYLE=;
 b=pdj5dkbdLqoSLE23wVNyz3C078BAKHMSmDZtULwiITFHT2N/2mzijS6DwrePMRW55z
 CQ0OK1c6yJr4NFxLa30x87Jz8oKfXptJuulV+T85CJZXHOtMIzDdgDRHypE09udPozmE
 OAVXdEgUCCwHid7AYM15KPG/yLwAZgkuDgBmOQhg56khJmruL7fy539IuFLeiClnzS56
 hYSEO0aM6lYOk+zx7ZLU+/R+ze73gSon6W2Ys3a3HjcY9wq6mFBKwjCcXozIVUDxM6vQ
 Khu9xVv3ew4kIL2ojbnVlz+5ggDYueKBV2W/eQL15t1/Oo0+th0A0B4xnG2EOiVawwxn
 Mz5w==
X-Gm-Message-State: AOAM531thD0DL2YnQFfs0OFA4Nc2G0LUkrTbz19jG+2ARHdX3MuGmsKx
 wT/povHYQypJjw0JtFU9BdaU06zXSpQHFg==
X-Google-Smtp-Source: ABdhPJyzNkMmsjwX+E0d2mgttPUqESkAbd1r5eLFEiXK/cov20QzoLgIU6KTovp9j1I+CpeOp4VJvA==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr4991953wrp.89.1604706671314; 
 Fri, 06 Nov 2020 15:51:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n8sm4025374wmc.11.2020.11.06.15.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 15:51:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] m68k/q800: make the GLUE chip a QOM device
Date: Fri,  6 Nov 2020 23:51:07 +0000
Message-Id: <20201106235109.7066-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is 6.0 material really I think.  It's a bit of cleanup
prompted by a Coverity issue, CID 1421883.  There are another half
dozen or so similar issues, where Coverity is complaining that we
allocate an array of qemu_irqs with qemu_allocate_irqs() in a board
init function -- in this case the 'pic' array in q800_init() -- and
then we return from the board init function and the memory is leaked,
in the sense that nobody has a pointer to it any more.

The leak isn't real, in that board init functions are called only
once, and the array of qemu_irqs really does need to stay around for
the life of the simulation, so these are pretty much insignificant
as Coverity issues go. But this coding style which uses a free-floating
set of qemu_irqs is not very "modern QEMU", so the issues act as
a nudge that we should clean the code up by encapsulating the
interrupt-line behaviour in a QOM device. In the q800 case there
actually is already a GLUEState struct, it just needs to be turned
into a QOM device with GPIO input lines. Patch 2 does that.

Patch 1 fixes a bug I noticed while doing this work -- it's
not valid to connect two qemu_irq lines directly to the same
input (here both ESCC irq lines go to pic[3]) because it produces
weird behaviour like "both lines are asserted but the device
consuming the interrupt sees the line deassert when one of the
two inputs goes low, rather than only when they both go low".
You need to put an explicit OR gate in, assuming that logical-OR
is the desired behaviour, which it usually is.

Tested only with 'make check' and 'make check-acceptance',
but the latter does have a q800 bootup test.

thanks
-- PMM

Peter Maydell (2):
  hw/m68k/q800: Don't connect two qemu_irqs directly to the same input
  hw/m68k/q800.c: Make the GLUE chip an actual QOM device

 hw/m68k/q800.c  | 92 ++++++++++++++++++++++++++++++++++++++++++-------
 hw/m68k/Kconfig |  1 +
 2 files changed, 80 insertions(+), 13 deletions(-)

-- 
2.20.1


