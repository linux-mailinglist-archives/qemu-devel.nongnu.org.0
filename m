Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D8D2FC009
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:33:26 +0100 (CET)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wkn-0007TD-Qv
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpr-0002XU-Q5
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:35 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpp-0001FZ-RM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:35 -0500
Received: by mail-pl1-x631.google.com with SMTP id be12so11011943plb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vmgl0cCBUCeqGf32LFm/BeaLut9vdoFNMMhbPylJY8A=;
 b=BQkt/YzVn0n5NsRuffKb2BvwQfRcwINdca9ZF+SHwnH8/4WztwfWMmqvJGOwAgdSWC
 LfwYq1dfOZWDjuNbZdNQgSmdPOCKtXK+Q+H/hKR2EprP3wsWofc5PSuvNoamI/u/pXYe
 XYcxN7tiVulTYk9zUcHKUymEiEsFrHq95mOzXCwNKadvbUOk5/6H19pyCeBZ3VHde+Gv
 vJ3PbDHk0spXnIEhR2qWggkKV4eAXUrGLL1MAKk4NhH8Zr7ECFGaHTaZ+ckZ9YMLDa3d
 LjzJkUFI3QYyBduZbDHauIFCqTk7eE55ca4iLyZIB/RRRWS5ifKlWJ320KPPvx81P6J0
 /rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vmgl0cCBUCeqGf32LFm/BeaLut9vdoFNMMhbPylJY8A=;
 b=k4Bt1jGTHlNB0b+54cIpqPY2UO6Und9orDjxIjje5RHOoHWqW0luVrkSMbAWeQ2wak
 WXn0kaEkl2C1JT4qNeEZ83A52WNlagT5OpotAI7Cd57R/VanQ661RLLPgX09PalI0evW
 fkQ03rqOrDJl8ZGY9LEklII6NtGx77+n+Le6fxA4Nol+U83bUZSwS9dkKlWyn08wLbIy
 kxmbZezjjVnEiuayh9uifL4jnwsK9HlavRXsEEGyNj8LpldHneM5VWnwjN1J6NbB4bqx
 8RhUr13OLMs9ganMuaS6g991vlz7+RuSrQd4Cq7/fNJD0sRhaOUrKfTrpx5WCMUaIESx
 7EyA==
X-Gm-Message-State: AOAM531PN/rzh58zOtUHiPoy2dPQirAY2ckyUg5nHQa+brmq4R3kbb8x
 vlCFwuUVeYpEH2j+joqSbsihX53/Y4K80g==
X-Google-Smtp-Source: ABdhPJy16nSh61omwVBHY6NoAgHrLO7xEo2q0xPkxXwm6SmijANY2+FlQnwhxm6gbVQTqXZEhcbt4A==
X-Received: by 2002:a17:90a:ec16:: with SMTP id
 l22mr1137312pjy.214.1611081271857; 
 Tue, 19 Jan 2021 10:34:31 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a136sm20651359pfd.149.2021.01.19.10.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:34:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] tcg: Dynamically allocate temporaries
Date: Tue, 19 Jan 2021 08:34:23 -1000
Message-Id: <20210119183428.556706-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My recent change for caching tcg constants has, in a number of cases,
overflowed the statically allocated array of temporaries.  Change to
dynamic allocation.

I'll note that nothing in check-acceptance triggers this overflow.
Anyone care to add some more test cases there?

Also, there's some outstanding weirdness in gitlab testing that I
cannot reproduce locally.


r~


Richard Henderson (5):
  tcg: Add an index to TCGTemp
  tcg: Introduce and use tcg_temp
  tcg: Make TCGTempSet expandable
  tcg: Adjust tcgv_*_temp/temp_tcgv_*
  tcg: Dynamically allocate temporaries

 include/tcg/tcg.h |  79 ++++++++++++++-----
 tcg/optimize.c    |  23 +++---
 tcg/tcg.c         | 196 +++++++++++++++++++++++++++++++---------------
 3 files changed, 205 insertions(+), 93 deletions(-)

-- 
2.25.1


