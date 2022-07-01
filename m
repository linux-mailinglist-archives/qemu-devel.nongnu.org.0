Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E9562845
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 03:31:26 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o75VC-0007l8-Ui
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 21:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75Sw-0006oV-As
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:29:02 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:35612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75Sg-000075-4u
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:29:01 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-101d96fe0a5so1680484fac.2
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 18:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fBxhaKEyiDMxysz71LBRg3W39Bm9lcrfPmTo0dJabwk=;
 b=Pgo8BiHQhjXqShe/DwQsDSS5Mf8nKyytt86/b5dTEIMViJ4USZtcuPC8uuSrI6q5F4
 l2axXdoTvMQLUBKBrvFHITIoRB0iVjCTIGlK12CA1Plewvr0Hy9R9M1Nh+GZv4hJF4p3
 ko7xafCZc1bMsPnbzdaCP75gGGn6IhhhcPCpnW4qEo2F04i+uihz/3FeRY3HH4Lf/qXO
 OqJds56ABNTAedPV52787dVxPdOWI49Xe8QGKphWuYzxZ17/Rzy8pR0YHnqq1DEk+Orr
 N9HK1RtuNSHil9t+IDfNE2uMQcmrZ/eywL6PgJ0WhKuGwIbx6b0ZcG1Eh5xOidIFXTaC
 sURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fBxhaKEyiDMxysz71LBRg3W39Bm9lcrfPmTo0dJabwk=;
 b=G0r0ALdrpmU++X25gkWTfhoLWBQX3luRueVtdu9us8H4k57aP3qzqHfTgAUrasO7tP
 DKxrnkaQOQVLIXZ1zMcSSH3Xo49gRnEsTpMMXqff1ZfSVFD68Flv0PSOfL2aFvmw+FaX
 rhZl9Azq/zehWnzWJWqJWTxfZL1j7dnr/yziIk1IHvyFDWXrA9EY9/EOi3v6Bp/t6FYf
 ctHr3oFNSSHgPlubq89+P1Y4Fwf+JWjmEYLAq/v8SVd7odALM9hbmwtOE2BHtkBIMA1J
 wce7WvBl6goOpYiHBH3xDqiv7fobSfP+3TfECcXXJ9rEOzRbkhc3onSvay48hfxFtbfu
 qXSA==
X-Gm-Message-State: AJIora+Zn2tNbzpYUHb70wtfEduVhGPYqXJfPt/iAO0ME2lQTWAqARgo
 1+l8nQHqXeiIT/0mM0KB12l2rQ==
X-Google-Smtp-Source: AGRyM1vQQxylhWLWsXsQ6gRXi6W0+hCdE0vmY5z+Wu8QdPDbc3DGI9rcB3uL0xssmV0QspLpNdnyCw==
X-Received: by 2002:a05:6870:c154:b0:101:d3a2:60d3 with SMTP id
 g20-20020a056870c15400b00101d3a260d3mr7009862oad.71.1656638922621; 
 Thu, 30 Jun 2022 18:28:42 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80e8:1685:38ec:3484:7cff:725b?
 ([2605:ef80:80e8:1685:38ec:3484:7cff:725b])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a9d6108000000b00616c5ce1d83sm8263401otj.68.2022.06.30.18.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 18:28:41 -0700 (PDT)
Message-ID: <3c296a0a-13f6-9fff-33fe-d087b0da27e4@linaro.org>
Date: Fri, 1 Jul 2022 06:58:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/27] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220630112411.1474431-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/22 16:53, Cédric Le Goater wrote:
> The following changes since commit 621745c4f349ac09b72706c46febee983abca916:
> 
>    Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-06-30 04:49:40 +0530)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220630
> 
> for you to fetch changes up to 55c57023b740c29151d42600af9ac43ba00e56cc:
> 
>    hw/misc/aspeed: Add PECI controller (2022-06-30 09:21:14 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * m25p80 improvements (Iris)
> * Code cleanup in preparation of multi SoC machine (Peter)
> * New MAX31785 model (Mahesh)
> * New Qualcomm machines (Jae and Graeme)
> * Core I2C slave mode (Klaus)
> * Aspeed I2C slave mode for old and new register interface (Peter and Klaus)
> * New Aspeed PECI model (Peter)
> * Various small fixes

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Cédric Le Goater (4):
>        aspeed: Set the dram container at the SoC level
>        aspeed/scu: Add trace events for read ops
>        aspeed/i2c: Change trace event for NORMAL_STOP states
>        aspeed/smc: Fix potential overflow
> 
> Graeme Gregory (1):
>        hw/arm/aspeed: add Qualcomm Firework BMC machine
> 
> Iris Chen (2):
>        hw: m25p80: add WP# pin and SRWD bit for write protection
>        hw: m25p80: add tests for write protect (WP# and SRWD bit)
> 
> Jae Hyun Yoo (2):
>        hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
>        hw/arm/aspeed: firework: add I2C MUXes for VR channels
> 
> Joel Stanley (1):
>        aspeed/hace: Accumulative mode supported
> 
> Klaus Jensen (3):
>        hw/i2c: support multiple masters
>        hw/i2c: add asynchronous send
>        hw/i2c/aspeed: add slave device in old register mode
> 
> Maheswara Kurapati (4):
>        hw/i2c: pmbus: Page #255 is valid page for read requests.
>        hw/sensor: add Maxim MAX31785 device
>        hw/arm/aspeed: Add MAX31785 Fan controllers
>        hw/arm/aspeed: firework: Add Thermal Diodes
> 
> Peter Delevoryas (10):
>        aspeed: Set CPU memory property explicitly
>        aspeed: Add memory property to Aspeed SoC
>        aspeed: Remove usage of sysbus_mmio_map
>        aspeed: Map unimplemented devices in SoC memory
>        aspeed: Remove use of qemu_get_cpu
>        hw/i2c/aspeed: Fix R_I2CD_FUN_CTRL reference
>        hw/i2c/aspeed: Fix DMA len write-enable bit handling
>        hw/i2c/aspeed: Fix MASTER_EN missing error message
>        hw/i2c/aspeed: Add new-registers DMA slave mode RX support
>        hw/misc/aspeed: Add PECI controller
> 
>   include/hw/arm/aspeed_soc.h   |  16 ++
>   include/hw/i2c/aspeed_i2c.h   |  11 +
>   include/hw/i2c/i2c.h          |  30 +++
>   include/hw/misc/aspeed_peci.h |  29 +++
>   hw/arm/aspeed.c               | 136 +++++++---
>   hw/arm/aspeed_ast10x0.c       |  59 +++--
>   hw/arm/aspeed_ast2600.c       | 104 +++++---
>   hw/arm/aspeed_soc.c           | 143 ++++++++---
>   hw/arm/pxa2xx.c               |   2 +
>   hw/block/m25p80.c             |  82 ++++--
>   hw/display/sii9022.c          |   2 +
>   hw/display/ssd0303.c          |   2 +
>   hw/i2c/aspeed_i2c.c           | 236 ++++++++++++++---
>   hw/i2c/core.c                 |  70 +++++-
>   hw/i2c/pmbus_device.c         |   6 +-
>   hw/i2c/smbus_slave.c          |   4 +
>   hw/misc/aspeed_hace.c         |   6 +-
>   hw/misc/aspeed_peci.c         | 152 +++++++++++
>   hw/misc/aspeed_scu.c          |   2 +
>   hw/nvram/eeprom_at24c.c       |   2 +
>   hw/sensor/lsm303dlhc_mag.c    |   2 +
>   hw/sensor/max31785.c          | 573 ++++++++++++++++++++++++++++++++++++++++++
>   hw/ssi/aspeed_smc.c           |   4 +-
>   tests/qtest/aspeed_smc-test.c |  62 +++++
>   hw/arm/Kconfig                |   2 +
>   hw/i2c/trace-events           |   2 +
>   hw/misc/meson.build           |   3 +-
>   hw/misc/trace-events          |   6 +
>   hw/sensor/Kconfig             |   4 +
>   hw/sensor/meson.build         |   1 +
>   30 files changed, 1573 insertions(+), 180 deletions(-)
>   create mode 100644 include/hw/misc/aspeed_peci.h
>   create mode 100644 hw/misc/aspeed_peci.c
>   create mode 100644 hw/sensor/max31785.c


