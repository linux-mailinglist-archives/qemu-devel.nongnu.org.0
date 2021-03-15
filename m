Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D67F33C6A9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:18:05 +0100 (CET)
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsj6-0005CG-91
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsIv-0005Iv-SN
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:51:01 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsIu-0003i4-02
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:51:01 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w65so35501283oie.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/9D8+/gnby+c+NoK4obMKUnF07JV5pN4It8tKgs26m4=;
 b=KE8mozV6tlR9y68LlrbuK32sZoK48kxYY/UqLRQ/U1VoUT/rhkqK+41kr5ygSDg7/A
 PplCfZeajvU3Rmb8R0q1/ZSSp9Uw37HuE8Cnap2E7Jg1JGzzNkBVSJq112V7zKUXJ9g+
 uOc6XWs5ffOeR7t7jVZzBcegIOSlt5Xvuil3O7b+Vq7RgS/PFLs+JWk6KwdQI59Ad8pK
 X5fDwICTxb7Snr8yEVSPEURMq4NFd9qL6wnlZpmkE0f8BxXxoDNPIbStAnpAUgp51Zn3
 9pLhtuxFk/nTzeUnEKPre2oiu9BTmBoIR0MCLbiaQxXbyLSOSP8AcKWAzK2fWb4y9mUw
 XpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/9D8+/gnby+c+NoK4obMKUnF07JV5pN4It8tKgs26m4=;
 b=LThQMuCBVGYBDCv9qEvbSSBYQyY07dQgWWLA0m5uJO4kQ1+5YVrK5YLHp60+Z0KE+o
 dGvKGJJj++w+53CDdWd3jcLd6ZdH4gu9yPkBuhAspekN9yzBUZs+FCwYurw1NPZskDiQ
 b+yiKhvQ5ovE9qwXHB+zoulB7yCxhgHP9dW2ZDdNGOBcEjuaoT1+raauolQdzpik2Pyb
 yaSZ28S++hygNQmwi4gWtpKpV3GATKh34YbNcQEr1WYGJA/Wzp00bGD48yDWZPoy9H9j
 l6o1A4Ru6Ppc5BsZ6/M+2jTRl/j4ck1fVLYj/lvtX8hVyxFosb/84yVKlI9Lunnuex+e
 BapQ==
X-Gm-Message-State: AOAM532nuD1Hjk9l5CN/tgTxcoEUjkvkCRAol+24q7LQvD+f8i55z5f0
 W4KXnIkikYJxDb2IwT6Lz2RiD7KenqUrcKK8
X-Google-Smtp-Source: ABdhPJwUt0XnG8qPRbpLNEUadwpWaIeaEGuPk5bBGsIkzpgmlkp6r/c4Sl+egYioQF7LhJ01eWhPvQ==
X-Received: by 2002:a05:6808:4c1:: with SMTP id a1mr367883oie.37.1615834258568; 
 Mon, 15 Mar 2021 11:50:58 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k9sm7405537ots.24.2021.03.15.11.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:50:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Fix qemu_strtosz regression
Date: Mon, 15 Mar 2021 12:50:54 -0600
Message-Id: <20210315185056.1986167-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

