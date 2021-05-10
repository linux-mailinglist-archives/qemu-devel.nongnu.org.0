Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C837977C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:12:43 +0200 (CEST)
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBKc-0003cx-RB
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGx-0000Zd-8d
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:08:55 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGr-0004uR-9E
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:08:55 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n2so17781726wrm.0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Brpjl91FNbgNkC1s6ukF6xIzfG/+Bi80rWCJ3iDuHSY=;
 b=T07b31jken9Y0vfNN1MvjuKwcmxntlqLD32YhNiql3iECMlywhuSHRKJdl/JERp5Ne
 dbI7iT+jv/46jsazGzI9sZuQFnF3QHsAM+m0Ljn2JX8DFp+vtj3miubCpZbfmiLA21fl
 9LdInlQy79UV7SLe7Minx1BPHXogZFo7ucIE32zRUO7kalHINx7Zf3m1QgVLjEd7QDVF
 E+gtx5GQCuAgRzITp6Zv6AR0dPjcjQM0WurJmsRjTJ/OgFUeW/1c3ZWIk7hIygjG+0+t
 KiadzDOBjE4MfscHhktyu11hVqtyCv/vRzFIXfqqlITIpQOizQPGfngE7I2aTYt9xfb/
 MO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Brpjl91FNbgNkC1s6ukF6xIzfG/+Bi80rWCJ3iDuHSY=;
 b=bvByl2qg2so8/V+QM3B5LM5D19VTL8BSsFdshedM5PosMYc0vkfTRbloOfQ64YRaLn
 FtNoZgdFdtDB8q/FIaYJn/DQpIEEGyRQx+g0Hve1fHPqDpq+Ol+tvRt7x0AiHGjezA9T
 RK7yi532FptdY6jWjizxYaGPpRgZtoNBeyvJR2gWPY3GKEsRBeuYQVBP9U4ajr4CMeCM
 kSlBMznIJzq+Ps2U73jL4bLGp3an+kcVjoNL5xv4JvUj+CC3pa6TLpbVKb1EWcoD/0K5
 KuO+mw0UVe3nr8CZerB+z3Teld/HjsnTCgijwP1UVG/tdOsbjB+tZYOXAcKMrx7wyMUC
 5jDA==
X-Gm-Message-State: AOAM531zzORnMuXJptB2843s8KrcBTS+NDNRUsnWTCiIN/xUgl+GfiyJ
 hJoMkeyjmGFrlzOyMMvbAtYw2A==
X-Google-Smtp-Source: ABdhPJxemyIgVYkhqtqkeoik4Dfz18NP3AB1lEASzoVb4ZmuO7AeTsdaJ/A7Q5v67zOhDgu9MFZNjg==
X-Received: by 2002:adf:e845:: with SMTP id d5mr32267824wrn.96.1620673727616; 
 Mon, 10 May 2021 12:08:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/arm: Fix modelling of SSE-300 TCMs and SRAM
Date: Mon, 10 May 2021 20:08:38 +0100
Message-Id: <20210510190844.17799-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes some bugs in how we were modelling the
TCMs and the SRAM in the SSE-300 which were preventing
Arm TF-M from booting on our AN547 model; there are also
some fixes to things I noticed while I was in the code.

The specific bugs preventing boot were:
 * SRAM_ADDR_WIDTH for the AN547 is 21, not 15, so the SRAM
   area was too small
 * we were putting the SRAMs at the wrong address (0x2100_0000
   for SSE-300, not 0x2000_0000 as for SSE-200)

The other stuff I've fixed is:
 * we were modelling the SRAM in the AN524 both in the SSE
   and in the board model (harmlessly, as the board-model
   memory was just always shadowed in the memory map and
   unreachable)
 * we were modelling the TCMs in the AN547 board model,
   which is conceptually wrong because in hardware they're
   part of the SSE-300. No guest-visible change, but it will
   avoid problems if/when we add another SSE-300 board model

thanks
-- PMM

Peter Maydell (6):
  hw/arm/mps2-tz: Don't duplicate modelling of SRAM in AN524
  hw/arm/mps2-tz: Make SRAM_ADDR_WIDTH board-specific
  hw/arm/armsse.c: Correct modelling of SSE-300 internal SRAMs
  hw/arm/armsse: Convert armsse_realize() to use ERRP_GUARD
  hw/arm/mps2-tz: Allow board to specify a boot RAM size
  hw/arm: Model TCMs in the SSE-300, not the AN547

 include/hw/arm/armsse.h |  2 ++
 hw/arm/armsse.c         | 35 +++++++++++++++++++++++++++++------
 hw/arm/mps2-tz.c        | 39 ++++++++++++++++++++-------------------
 3 files changed, 51 insertions(+), 25 deletions(-)

-- 
2.20.1


