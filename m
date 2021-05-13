Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBC137FFEB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 23:55:09 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhJIS-0001jS-CO
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 17:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lhJHa-00013y-Sg
 for qemu-devel@nongnu.org; Thu, 13 May 2021 17:54:14 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lhJHZ-0002gB-7s
 for qemu-devel@nongnu.org; Thu, 13 May 2021 17:54:14 -0400
Received: by mail-oi1-x22b.google.com with SMTP id z3so25456501oib.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 14:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:mime-version
 :content-disposition;
 bh=E9eTAp802xzzHpN7z9mNemBXSS5CRV7MMsvpebvCJ3Y=;
 b=V+yZil1qvjqSbR9V9gfYUpY3LTqyYn5QfwXvkicNuGNt6Yv05orjYZcRfm3WPrdf9g
 murHTkrD8vkExeS5fTGnI1a/g0mJ003oZpYKqpXW9/ZTsVnN75qb4eUOl5c5csR6rL0Y
 Ux51mi+AeBcWsVfSW/QL9XDLFQx6nKjJU3/4UE2cNe975BXAShMHN+yJBIjUyfnDzmoC
 P9txMBktrm777Pg8VLBspb6FvLGHO8Wb5UptkAbfNHvk1rBUvuij8fmDZxf6LxE1AF00
 N5mjQuzkT4QhKaIClKD3Trito88u26+p8yXhQ7jZxWFXWMgOhwv4n02XHQi4HL0DPwpb
 BJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:mime-version:content-disposition;
 bh=E9eTAp802xzzHpN7z9mNemBXSS5CRV7MMsvpebvCJ3Y=;
 b=VODYIZZBU6iy1MBfZ/fL9ADCFrbuaUt3FYoiaZODzQXMKMmCuPKyYGWJganLy2bCzd
 6ld6OwVNIAgrnOZfc2wwT3OjuYPXPyfUXb1x3hSzAnwiVjpjHhJDng7o5n9zooVODjEh
 I7pB9d8BEAPf95JV7vWKfG43fouUw6vgh83xTZn2xe1/JBFEmzvhMlW7Pki6ltkrs3GN
 NybmlP00ponFsmMpwMeIv/u7r11QUOttX8SM4UL3hrtKXBvXqLE/SIPwXOypmHjBE7Q4
 YuaR/JvdgirFylTyE9c4lnvb98kpqN2i6P0RBWDkqVfF2WpsGtM9QIDPUWiXdQNhRRxQ
 ++pA==
X-Gm-Message-State: AOAM531YtQI8GdpgaHByfv4mQgC0Rd5isCx8O3JFr8VdH9dap5sLgqyr
 47/+xq3A8gLy4wfFSGB9sw==
X-Google-Smtp-Source: ABdhPJzZtQzMj0IBSgq1O4H6x0LuOzKY1BRTm6SSJH0nLAV6RBBpZv4A7PA+t2aI3JGxG1OQZ/hCPw==
X-Received: by 2002:aca:f144:: with SMTP id p65mr4469979oih.117.1620942851303; 
 Thu, 13 May 2021 14:54:11 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id w10sm841457ott.75.2021.05.13.14.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 14:54:10 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:412b:6b1b:237c:6ae7])
 by serve.minyard.net (Postfix) with ESMTPSA id 41D2C180052;
 Thu, 13 May 2021 21:54:09 +0000 (UTC)
Date: Thu, 13 May 2021 16:54:08 -0500
From: Corey Minyard <minyard@acm.org>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [GIT PULL] I2C changes for next qemu release
Message-ID: <20210513215408.GC2921206@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the addition of a new devices used in a lot of BMCs, and adds
the infrastructure so other devices of it's type can be added.

I will update the Changelog as necessary.

This was through several revisions on the mailing list recently.

Thanks,

-corey

The following changes since commit 8fe9f1f891eff4e37f82622b7480ee748bf4af74:

  Update version for v6.0.0-rc3 release (2021-04-14 22:06:18 +0100)

are available in the Git repository at:

  https://github.com/cminyard/qemu.git tags/for-qemu-6.1-v1

for you to fetch changes up to 065177eeceff552a5316bff9435188b50a2da1b6:

  hw/i2c: add pca954x i2c-mux switch (2021-04-15 07:10:39 -0500)

----------------------------------------------------------------
Add a bus multiplexer device

This patch set adds a bus multiplexer and the necessary infrastructure
in the I2C code to allow it to work.

These are common on systems with lots of I2C devices, like an IPMI BMC.

----------------------------------------------------------------
Patrick Venture (4):
      hw/i2c: name I2CNode list in I2CBus
      hw/i2c: add match method for device search
      hw/i2c: move search to i2c_scan_bus method
      hw/i2c: add pca954x i2c-mux switch

 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/core.c                    |  55 ++++++--
 hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c.h             |  17 ++-
 include/hw/i2c/i2c_mux_pca954x.h |  19 +++
 8 files changed, 383 insertions(+), 14 deletions(-)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h


