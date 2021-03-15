Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61BD33C664
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:08:10 +0100 (CET)
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsZV-00038g-Qv
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsJI-0006B6-Mw
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:51:24 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:40896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsJG-0003t9-EJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:51:24 -0400
Received: by mail-oi1-x230.google.com with SMTP id w65so35502385oie.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/9D8+/gnby+c+NoK4obMKUnF07JV5pN4It8tKgs26m4=;
 b=HC/e6U9CrdFGgnb7+42an0qFYHemnS5sCcBq8O2E2r4CuGGQvxdw2FQzeoq/2pG0UW
 SNzV2kUvaFEs1GiwfQq7tu9UcKxYRCVppsAJoVAXz+IPDt5phb571b6k6zt43xpvRwph
 j9iY1wkAJAW3qBvVkGzpf/K2FNeV1dvwigiSj1bm45QfXDRcsmqEIWAna01bENuMxC4D
 UJ/hLPDvEs2EyjX7vzptG44d5hY5dvFsUVx5+l/x7gSWO+9g+aKaauAYSAJXQzfE/D29
 wf0OpnscdL2wC/FzrBW5dS1VJe3aX1iRBA4EhWJp/EgYC30o986QYfmertqaKGrfCRvR
 UmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/9D8+/gnby+c+NoK4obMKUnF07JV5pN4It8tKgs26m4=;
 b=Jy+yY5uSAVO/gDgTGkW7IaJmUX9HVs/0ILeLbB0enN/jTWInuXtMw4Rsx/Dl8DO4fw
 T2RlABhEo8ugvioFM+DIutks32wdxBcfQUh2decenFntiyZ7xDn+ajmo/j+Gh3mml3Ih
 UoAZ8efTwJxshuA8MkX/4fyA7rVXybcew+AWepfH0jMV2cfRFNpGNuOuMR5TBElEF5Pr
 ms2dpDt53L3dJc228zA8AleD7b9HAA2No2aLsWoOeoqZPCDYI+rtVCT5H6L+85cwPWQ7
 OapZCwSgk2fzMURYEz5k7Zvz7KnpOBCMt1Pk7ZrV0HAzWCSkACV0En51Iggw/+U9Dckk
 AA+g==
X-Gm-Message-State: AOAM531dPS7wKrAbPhJ/33h3k2S+Yz1fJH9sa8jqILE3MAEYdZpBrglK
 HnvaneWn5t5H2dR8oxEndYLS3QlzZbEYS5y6
X-Google-Smtp-Source: ABdhPJwDOnzxViYyPN8Ss9fO7EU5ODkYST47TMWXZ0ZwGdn98VXjcIw9Dqco2jhxfJOlDeJ06/C4yg==
X-Received: by 2002:aca:b744:: with SMTP id h65mr398385oif.36.1615834281338;
 Mon, 15 Mar 2021 11:51:21 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w1sm7152041oop.1.2021.03.15.11.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:51:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Fix qemu_strtosz regression
Date: Mon, 15 Mar 2021 12:51:16 -0600
Message-Id: <20210315185117.1986240-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 51204c2f188ec1e2a38f14718d38a3772f850a4b:

  Merge remote-tracking branch 'remotes/bkoppelmann2/tags/pull-tricore-20210314' into staging (2021-03-15 15:34:27 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-misc-20210315

for you to fetch changes up to 7625a1ed013a042748753750c9d9b1a33c9cd8e0:

  utils: Use fixed-point arithmetic in qemu_strtosz (2021-03-15 12:47:08 -0600)

----------------------------------------------------------------
Fix qemu_strtosz testsuite failures for i686.

----------------------------------------------------------------
Richard Henderson (1):
      utils: Use fixed-point arithmetic in qemu_strtosz

 tests/unit/test-cutils.c |  2 +-
 util/cutils.c            | 50 +++++++++++++++++++++++++++++++++---------------
 2 files changed, 36 insertions(+), 16 deletions(-)

