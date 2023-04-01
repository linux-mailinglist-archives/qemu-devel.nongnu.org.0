Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EB6D32F1
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 19:42:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pifEV-0003fe-IR; Sat, 01 Apr 2023 13:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>) id 1pif1m-0000IE-LA
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 13:28:34 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3] helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>) id 1pif1k-0005Le-Jy
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 13:28:34 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1pif1d-0005aS-Ep; Sat, 01 Apr 2023 18:28:25 +0100
Date: Sat, 1 Apr 2023 18:28:25 +0100
From: Ben Dooks <qemu@fluff.org>
To: Joe Komlodi <komlodi@google.com>
Cc: qemu-devel@nongnu.org, venture@google.com, peter.maydell@linaro.org
Subject: Re: [PATCH 00/16] i3c: aspeed: Add I3C support
Message-ID: <20230401172825.tvmfms6qbh3tmi5s@hetzy.fluff.org>
References: <20230331010131.1412571-1-komlodi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 01 Apr 2023 13:41:37 -0400
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

On Fri, Mar 31, 2023 at 01:01:15AM +0000, Joe Komlodi wrote:
> Hi all,
> 
> This series adds I3C bus support to QEMU and adds more functionality to the
> Aspeed I3C controller.
> 
> This implementation is a basic implementation that introduces IBIs
> (including hot-join), CCCs, and SDR data transfer. As-is, it doesnt support
> multi-controller buses or HDR transfers.
> 
> First we add the I3C bus and controller model. With that added we
> gradually extend the functionality of the Aspeed I3C controller so it
> can do transfers.
> 
> With that added, we add 2 targets. The first target is a mock I3C
> target. It's intended to be a very simple target just to verify that I3C
> is working on the guest. Internally, we've used it on Linux to verify
> that i3C devices can be probed and can send/receive data and send IBIs.
> 
> The second target is a remote target. The intention of this is to be
> able to communicate to a target that exists outside of QEMU.
> 
> Lastly we add hotplugging support. The hotplugging doesn't do anything too
> complicated, it just adds the device attempting to hotplug to the bus. It is
> the device's responsibility to hot-join and go through the DAA process to
> participate on the bus.
> 
> Thanks!
> Joe
> 
> Joe Komlodi (16):
>   hw/misc/aspeed_i3c: Move to i3c directory
>   hw/i3c: Add bus support
>   hw/i3c/aspeed_i3c: Add more register fields
>   hw/i3c/aspeed_i3c: Add more reset values
>   hw/i3c/aspeed_i3c: Add register RO field masks
>   hw/i3c/aspeed_i3c: Treat more registers as read-as-zero
>   hw/i3c/aspeed_i3c: Use 32 bits on MMIO writes
>   hw/i3c/aspeed_i3c: Add IRQ MMIO behavior
>   hw/i3c/aspeed_i3c: Add data TX and RX
>   hw/i3c/aspeed_i3c: Add IBI handling
>   hw/i3c/aspeed_i3c: Add ctrl MMIO handling
>   hw/i3c/aspeed_i3c: Add controller resets
>   hw/i3c: Add Mock target
>   hw/i3c: remote_i3c: Add model
>   qtest: remote_i3c: Add remote I3C qtest
>   hw/i3c: Add hotplug support

Isn't this the designware i3c ip block, and as such could we name
it so? I was going to send an i2c only version of this but it seems
you've beaten me to it and got the i3c core going.

>  hw/Kconfig                    |    1 +
>  hw/arm/Kconfig                |    2 +
>  hw/i3c/Kconfig                |   17 +
>  hw/i3c/aspeed_i3c.c           | 2044 +++++++++++++++++++++++++++++++++
>  hw/i3c/core.c                 |  646 +++++++++++
>  hw/i3c/meson.build            |    6 +
>  hw/i3c/mock-target.c          |  314 +++++
>  hw/i3c/remote-i3c.c           |  469 ++++++++
>  hw/i3c/trace-events           |   52 +
>  hw/i3c/trace.h                |    1 +
>  hw/meson.build                |    1 +
>  hw/misc/aspeed_i3c.c          |  384 -------
>  hw/misc/meson.build           |    1 -
>  hw/misc/trace-events          |    6 -
>  include/hw/arm/aspeed_soc.h   |    2 +-
>  include/hw/i3c/aspeed_i3c.h   |  207 ++++
>  include/hw/i3c/i3c.h          |  275 +++++
>  include/hw/i3c/mock-target.h  |   60 +
>  include/hw/i3c/remote-i3c.h   |   72 ++
>  include/hw/misc/aspeed_i3c.h  |   48 -
>  meson.build                   |    1 +
>  tests/qtest/meson.build       |    1 +
>  tests/qtest/remote-i3c-test.c |  610 ++++++++++
>  23 files changed, 4780 insertions(+), 440 deletions(-)
>  create mode 100644 hw/i3c/Kconfig
>  create mode 100644 hw/i3c/aspeed_i3c.c
>  create mode 100644 hw/i3c/core.c
>  create mode 100644 hw/i3c/meson.build
>  create mode 100644 hw/i3c/mock-target.c
>  create mode 100644 hw/i3c/remote-i3c.c
>  create mode 100644 hw/i3c/trace-events
>  create mode 100644 hw/i3c/trace.h
>  delete mode 100644 hw/misc/aspeed_i3c.c
>  create mode 100644 include/hw/i3c/aspeed_i3c.h
>  create mode 100644 include/hw/i3c/i3c.h
>  create mode 100644 include/hw/i3c/mock-target.h
>  create mode 100644 include/hw/i3c/remote-i3c.h
>  delete mode 100644 include/hw/misc/aspeed_i3c.h
>  create mode 100644 tests/qtest/remote-i3c-test.c
> 
> -- 
> 2.40.0.348.gf938b09366-goog
> 
> 

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


