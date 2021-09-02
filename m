Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6071D3FEFE4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:11:18 +0200 (CEST)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoN3-0002tQ-DU
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL5-0000Ou-Nt
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:15 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL3-0003Nr-Va
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:15 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so1704279wmn.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZrYWryMji2cS8E64N0cPJbqxFDojNEZjXg9qTOb2Ak=;
 b=nXFqTXM9ihSZBu0zD65VODxbub3LqUOwkYTd2cNBnWfZ8Y/pm+ervd/YsAcuV14oK6
 bnumdarpLBRJQFzvVjYIz3AdQbqt1T8lRSev4qS0dS+Db5mu05zXWKDWpuM2F9Wqy2/M
 W5oX1v6KBpHXyPWWYpU+MLLF7e3UMxj9rfhwmNzAUO1cnt9eQlIGZTKrqzRwqBbYGx+/
 LCfSjPCScMQ74euT8NfvH8v53/FAtkh+UzR2/xHYN4r+InSNr31QN6IQAaxrerV5JEC8
 9JG5PM5iMftNWmnuvkK68Y15at4q1oIL4h8FzTSXBba5njvNDqbqVmF5eIcKqEzxBKu6
 FZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZrYWryMji2cS8E64N0cPJbqxFDojNEZjXg9qTOb2Ak=;
 b=Yllux1PY6gOU+rcagPsE9WtjVu4ssKa2yAByUMPfckUxL3ewWuPdXGU4QjIiav91Ba
 E2rR8NM3+FcNisd4Q8gs692pxhAXckILcCzcUexPHLnARue3lyuMtW+T8BQIi5KrN6t1
 E+ScA6RROw1ZmYnBMHbqte0auNLjkS17YJ67riUs7UxahO4VfkdPKW0o2oG3faHwJPrl
 jAYyE6oXcrYPBZrk8LNoY7ipHLazWu058nACZs3NFxwSw5BDDIfo1lv85VlFeh1km0p4
 23VdFScnDuK6Ul6WOPhVylJugtt1hwOHK/jEFqlM56wXOU431RSdNELTTvplym+M0mZH
 on/A==
X-Gm-Message-State: AOAM532tgDEKd+5TG6/H3zWqffqQt1UrU9t5AEURPCYXYFgOZof+Jwts
 5lY00J9kZtOKDUmFNzLqGlfo0mmKTL4vxw==
X-Google-Smtp-Source: ABdhPJzTVoT2XiBtlvap25I+lSskBjuo9bS9hbCgPO9ZM5VnrekZDL2vIxboOlrnaZWDMbliMEE7XQ==
X-Received: by 2002:a7b:c408:: with SMTP id k8mr3704357wmi.184.1630595352061; 
 Thu, 02 Sep 2021 08:09:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: Use TCG vector ops for MVE
Date: Thu,  2 Sep 2021 16:09:06 +0100
Message-Id: <20210902150910.15748-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset uses the TCG vector ops for some MVE
instructions. We can only do this when we know that none
of the MVE lanes are predicated, ie when neither tail
predication nor VPT predication nor ECI partial insn
execution are happening.

Patch 1 adds a TB flag so we can track whether we can
safely assume that the insn operates on the entire vector,
and patches 2, 3, 4 use that to vectorize some simple
cases (bitwise logic ops, integer add, sub, mul, min, max,
abs and neg).

This small initial patchset is intended as a check that
the general structure for handling this makes sense;
there are almost certainly other places we could improve
the codegen for the non-predicated case.

Richard: if you have time to scan through the MVE insns
and suggest which ones would benefit from a vectorized
version that would be very helpful...

thanks
-- PMM

Peter Maydell (4):
  target/arm: Add TB flag for "MVE insns not predicated"
  target/arm: Optimize MVE logic ops
  target/arm: Optimize MVE arithmetic ops
  target/arm: Optimize MVE VNEG, VABS

 target/arm/cpu.h              |   4 +-
 target/arm/translate.h        |   2 +
 target/arm/helper.c           |  23 ++++++++
 target/arm/translate-m-nocp.c |   8 +++
 target/arm/translate-mve.c    | 102 ++++++++++++++++++++++------------
 target/arm/translate-vfp.c    |   3 +
 target/arm/translate.c        |   4 ++
 7 files changed, 110 insertions(+), 36 deletions(-)

-- 
2.20.1


