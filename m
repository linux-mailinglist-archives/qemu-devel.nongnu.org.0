Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426886134FA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTMu-0004nV-1R; Mon, 31 Oct 2022 07:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTMm-0004nA-R6
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:08 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTMl-00054Z-2N
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id v7so1207376wmn.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hbsfP1wXS2z7hFfPrQ6qQWVBhSL/DXWHGbl0qlhHLqQ=;
 b=Nr5xn566hvjSwiZwzWR1kiZpngcMlzTMCfXBW+hPCdD3WnFQeMasS2nkVaRKfGuE5y
 pMqJ4liv02QDz13XDDuHdj7WUfCsv9Jkm/8ptyZ1nHyEcSy+a0BOK/t1PStMUbLsVkKL
 uQKovldONfRE9aBXi5oGSI4/ev4vWlI3fFAyhjl5oLD69VZyj4hPpurt8YbJL476EUk/
 5xrpaMWxIu49GVgBntpNKmyTEJYnhUqHptpe1L7cJTGkge0dxEJ7HF6nYV5jLn1xMDf+
 k11Wfbikg2uo7xgCpGd/xOrkMomHO5GAxjk26ZUDtNY2I8GM+ohVgJBJDuY8BdOMPLXS
 1GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hbsfP1wXS2z7hFfPrQ6qQWVBhSL/DXWHGbl0qlhHLqQ=;
 b=pOCsRIeDd9aiFhKglgypb6I0M78zv93Wyy8L6zyjQJSy1NZNdDKLOc+QSsS6iBNpED
 mN3ZPSvQya+tYLjGHnXHw4ieaaePuM47qGlUJXrOfn7alJLs12/o9hwtDxVcHxoq/RRh
 SxoYHWB6FdEOVmJ252rDzKygF6rw+P66cL5EfW4u++USq6fI3J/wHdeCLEB2t1ZtnLo+
 Z3Opn7+L1KXFmrFT52PywbvVfxQlFBbDIpneoP0MsVWgDZ+GKWAK3yhZ4d44HYHQsRNS
 shsipzVK9XFdM933R5kxtsPvPgRK0/Q4g0TKph+N7yKd0QLP5yULV3+ZsHWlBHZDNJ9W
 4qlQ==
X-Gm-Message-State: ACrzQf2pgNZZDzdmdwtAQO9pz7zclxSjsCCwBAxZgmdII3U70LfkKOJJ
 LIE+sxc/ZLKKliVfYvVbXb7TlR9JU2Nu9Q==
X-Google-Smtp-Source: AMsMyM7MMb6o8v+ZxyQcikgvlNlLLd43zf+wy8Oqe38CGKHyP3L6oQnVTFKR54efwmjAAHU3PtAu3g==
X-Received: by 2002:a1c:4c03:0:b0:3c4:c76:9fe3 with SMTP id
 z3-20020a1c4c03000000b003c40c769fe3mr17737246wmf.13.1667217244971; 
 Mon, 31 Oct 2022 04:54:04 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a05600c384400b003c3a1d8c8e6sm7082827wmr.19.2022.10.31.04.54.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Oct 2022 04:54:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 0/6] ppc/e500: Add support for two types of flash, cleanup
Date: Mon, 31 Oct 2022 12:53:56 +0100
Message-Id: <20221031115402.91912-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a respin of Bernhard's v4 with Freescale eSDHC implemented
as an 'UNIMP' region. See v4 cover here:
https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/

Only tested with the ppce500 machine (no further regression testing).

Since v4:
- Do not rename ESDHC_* definitions to USDHC_*
- Do not modify SDHCIState structure

Bernhard Beschow (4):
  hw/block/pflash_cfi0{1, 2}: Error out if device length isn't a power
    of two
  docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
  hw/ppc/e500: Implement pflash handling
  hw/ppc/e500: Add Freescale eSDHC to e500plat

Philippe Mathieu-Daudé (2):
  hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
  hw/sd/sdhci: Map host controller interface in host endianess

 docs/system/ppc/ppce500.rst |  38 +++++++++--
 hw/block/pflash_cfi01.c     |   8 ++-
 hw/block/pflash_cfi02.c     |   5 ++
 hw/ppc/Kconfig              |   3 +
 hw/ppc/e500.c               | 127 +++++++++++++++++++++++++++++++++++-
 hw/ppc/e500.h               |   1 +
 hw/ppc/e500plat.c           |   1 +
 hw/sd/sdhci.c               |   6 +-
 8 files changed, 180 insertions(+), 9 deletions(-)

-- 
2.37.3


