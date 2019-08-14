Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2308D373
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 14:48:55 +0200 (CEST)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxshy-0003bz-Ir
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 08:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1hxsfg-00025L-Pd
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hxsfe-0005yk-Mk
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:46:32 -0400
Received: from 2.mo7.mail-out.ovh.net ([87.98.143.68]:38394)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hxsfd-0005w7-4y
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:46:30 -0400
Received: from player746.ha.ovh.net (unknown [10.108.42.119])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id BA3F812E076
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 14:46:26 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 4A5FF8F2ED3F;
 Wed, 14 Aug 2019 12:46:18 +0000 (UTC)
To: Rashmica Gupta <rashmica.g@gmail.com>, peter.maydell@linaro.org
References: <20190730054501.32727-1-rashmica.g@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <440d3bd1-57fd-20eb-dce4-3d61d7163b8e@kaod.org>
Date: Wed, 14 Aug 2019 14:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730054501.32727-1-rashmica.g@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 189714135027190739
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvkedghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.143.68
Subject: Re: [Qemu-devel] [PATCH v3 0/3] Add Aspeed GPIO controller model
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
Cc: andrew@aj.id.au, qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/07/2019 07:44, Rashmica Gupta wrote:
> There are a couple of things I'm not confident about here:
> - what should be in init vs realize?
> - should the irq state be in vmstate?
> - is there a better way to do composition of classes (patch 3)?

You can not do twice : 

     obj = object_new(TYPE_ASPEED_GPIO "-ast2600");

in aspeed_2600_gpio_realize(). This feels wrong. 

Let's see if we can instantiate two GPIO devices with different types 
under the AST2600 SoC instead.

Thanks,

C.

> 
> v3:
> - didn't have each gpio set up as an irq 
> - now can't access set AC on ast2400 (only exists on ast2500)
> - added ast2600 implementation (patch 3)
> - renamed a couple of variables for clarity
> 
> 
> v2: Addressed Andrew's feedback, added debounce regs, renamed get/set to
> read/write to minimise confusion with a 'set' of registers.
> 
> Rashmica Gupta (3):
>   hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
>   aspeed: add a GPIO controller to the SoC
>   hw/gpio: Add in AST2600 specific implementation
> 
>  hw/arm/aspeed_soc.c           |   17 +
>  hw/gpio/Makefile.objs         |    1 +
>  hw/gpio/aspeed_gpio.c         | 1103 +++++++++++++++++++++++++++++++++
>  include/hw/arm/aspeed_soc.h   |    3 +
>  include/hw/gpio/aspeed_gpio.h |   91 +++
>  5 files changed, 1215 insertions(+)
>  create mode 100644 hw/gpio/aspeed_gpio.c
>  create mode 100644 include/hw/gpio/aspeed_gpio.h
> 


