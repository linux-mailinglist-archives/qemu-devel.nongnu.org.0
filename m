Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDC96CC4B5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 17:07:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phAth-0006ke-Qs; Tue, 28 Mar 2023 11:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phAtg-0006j9-3y
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phAtZ-0007oR-F3
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680015956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pEPyvNfuizpzGmeFgKJqGZ9yrUw9NCQa8lDsxlODqnI=;
 b=PhyCRA3QXoF2zC5VtUl+KOUYZkohZkv9BRCfLJmu78BQoXJ1QHixcf6HgF896iG9D291Sk
 EYy2E7oopEzfgvMZiusq2auaRa52BhcBjvmNcZbLB5RXlP1KiEl3UVtNpdRIDmYfwxT2ez
 KIYCXgwCj35tePlxmIUgHTQ1xf4uM64=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-TFV9wJzXO6azG7PeFAAJkg-1; Tue, 28 Mar 2023 11:05:54 -0400
X-MC-Unique: TFV9wJzXO6azG7PeFAAJkg-1
Received: by mail-qt1-f198.google.com with SMTP id
 a11-20020ac85b8b000000b003e3979be6abso8284466qta.12
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 08:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680015953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pEPyvNfuizpzGmeFgKJqGZ9yrUw9NCQa8lDsxlODqnI=;
 b=hXhAEPp3sy/DCSGmz/5A+i78eKehFOr5YAXbsjU4pzH/ha6udfvx2BV+s6b/sKSfwt
 B2n3Ike+JhmgcBgGYXpwzABfRxcfcRDwMxlzT9Zkbhn0Er6fy5f/DLmjdQ9sQ8HlDDt+
 b1la5y98YNb57XKJOWT3zP5JBxQEJ4JyI/v9mmKH6+z9N+tZ6vC5RiqgClr8n93lgHfJ
 sED3kvRvt4P0TQKhso73I2ke71iRb7vKRPz4aEhdGp4s5tRx6ZRtk7pvEeaAE3xDaqwp
 CSlzEOnpVa5TCvt69BqFMKmrsiGKvQjP4IxybhFDYxoS9BqBGRrcnoPX4qUq+VMFYeUy
 rsRg==
X-Gm-Message-State: AO0yUKVSJxjH6EX8QrFdR5UVcmQPQl9RQc8wzeiNwBzv1O7jVKzLmnbp
 UY0FLP6e8GomH6g+N8IoeAmrTqviiTMX/drdarLW1z2NnqxOGIuaP7RLVTrchapbwTudek04QPX
 0u6acVT5O3fbJo5E=
X-Received: by 2002:ac8:59cd:0:b0:3bf:ce15:ff25 with SMTP id
 f13-20020ac859cd000000b003bfce15ff25mr27975266qtf.12.1680015953130; 
 Tue, 28 Mar 2023 08:05:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set++K1xZe7fYy8oEjaYNVFvBFIhwi+VLHYW0I3D0F8ONV4LJzYhzDV4hflE+D0gVP+R+odgbOQ==
X-Received: by 2002:ac8:59cd:0:b0:3bf:ce15:ff25 with SMTP id
 f13-20020ac859cd000000b003bfce15ff25mr27975205qtf.12.1680015952615; 
 Tue, 28 Mar 2023 08:05:52 -0700 (PDT)
Received: from [192.168.8.106] (tmo-099-149.customers.d1-online.com.
 [80.187.99.149]) by smtp.gmail.com with ESMTPSA id
 11-20020a37030b000000b00745a55db5a3sm12004491qkd.24.2023.03.28.08.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 08:05:49 -0700 (PDT)
Message-ID: <601fa241-1b5e-067c-f7b5-7cdd4feaa13f@redhat.com>
Date: Tue, 28 Mar 2023 17:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/3] qtest: Add functions for accessing devices on
 Aspeed I2C controller
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au
References: <20230328135121.3661711-1-stefanb@linux.ibm.com>
 <20230328135121.3661711-2-stefanb@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230328135121.3661711-2-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/03/2023 15.51, Stefan Berger wrote:
> Add read and write functions for accessing registers of I2C devices
> connected to the Aspeed I2C controller.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   include/hw/i2c/aspeed_i2c.h |   7 +++
>   tests/qtest/qtest_aspeed.c  | 109 ++++++++++++++++++++++++++++++++++++
>   tests/qtest/qtest_aspeed.h  |  36 ++++++++++++
>   3 files changed, 152 insertions(+)
>   create mode 100644 tests/qtest/qtest_aspeed.c
>   create mode 100644 tests/qtest/qtest_aspeed.h
> 
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index adc904d6c1..51c944efea 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -38,6 +38,13 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
>   #define ASPEED_I2C_OLD_NUM_REG 11
>   #define ASPEED_I2C_NEW_NUM_REG 22
>   
> +#define A_I2CD_M_STOP_CMD       BIT(5)
> +#define A_I2CD_M_RX_CMD         BIT(3)
> +#define A_I2CD_M_TX_CMD         BIT(1)
> +#define A_I2CD_M_START_CMD      BIT(0)
> +
> +#define A_I2CD_MASTER_EN        BIT(0)
> +
>   /* Tx State Machine */
>   #define   I2CD_TX_STATE_MASK                  0xf
>   #define     I2CD_IDLE                         0x0
> diff --git a/tests/qtest/qtest_aspeed.c b/tests/qtest/qtest_aspeed.c
> new file mode 100644
> index 0000000000..2fcafc22fc
> --- /dev/null
> +++ b/tests/qtest/qtest_aspeed.c
> @@ -0,0 +1,109 @@
> +/*
> + * Aspeed i2c bus interface for reading from and writing to i2c device registers
> + *
> + * Copyright (c) 2023 IBM Corporation
> + *
> + * Authors:
> + *   Stefan Berger <stefanb@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qtest_aspeed.h"
> +#include "hw/i2c/aspeed_i2c.h"
> +#include "libqtest-single.h"
> +
> +static void aspeed_i2c_startup(uint32_t baseaddr, uint8_t slave_addr,
> +                               uint8_t reg)
> +{
> +    uint32_t v;
> +    static int once;
> +
> +    if (!once) {
> +        /* one time: enable master */
> +       writel(baseaddr + A_I2CC_FUN_CTRL, 0);
> +       v = readl(baseaddr + A_I2CC_FUN_CTRL) | A_I2CD_MASTER_EN;
> +       writel(baseaddr + A_I2CC_FUN_CTRL, v);
> +       once = 1;
> +    }
> +
> +    /* select device */
> +    writel(baseaddr + A_I2CD_BYTE_BUF, slave_addr << 1);
> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_START_CMD | A_I2CD_M_RX_CMD);
> +
> +    /* select the register to write to */
> +    writel(baseaddr + A_I2CD_BYTE_BUF, reg);
> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
> +}
> +
> +static uint32_t aspeed_i2c_read_n(uint32_t baseaddr, uint8_t slave_addr,
> +                                  uint8_t reg, size_t nbytes)
> +{
> +    uint32_t res = 0;
> +    uint32_t v;
> +    size_t i;
> +
> +    aspeed_i2c_startup(baseaddr, slave_addr, reg);
> +
> +    for (i = 0; i < nbytes; i++) {
> +        writel(baseaddr + A_I2CD_CMD, A_I2CD_M_RX_CMD);
> +        v = readl(baseaddr + A_I2CD_BYTE_BUF) >> 8;
> +        res |= (v & 0xff) << (i * 8);
> +    }
> +
> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
> +
> +    return res;
> +}
> +
> +uint32_t aspeed_i2c_readl(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
> +{
> +    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint32_t));
> +}
> +
> +uint16_t aspeed_i2c_readw(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
> +{
> +    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint16_t));
> +}
> +
> +uint8_t aspeed_i2c_readb(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
> +{
> +    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint8_t));
> +}
> +
> +static void aspeed_i2c_write_n(uint32_t baseaddr, uint8_t slave_addr,
> +                               uint8_t reg, uint32_t v, size_t nbytes)
> +{
> +    size_t i;
> +
> +    aspeed_i2c_startup(baseaddr, slave_addr, reg);
> +
> +    for (i = 0; i < nbytes; i++) {
> +        writel(baseaddr + A_I2CD_BYTE_BUF, v & 0xff);
> +        v >>= 8;
> +        writel(baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
> +    }
> +
> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
> +}
> +
> +void aspeed_i2c_writel(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint32_t v)
> +{
> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
> +}
> +
> +void aspeed_i2c_writew(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint16_t v)
> +{
> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
> +}
> +
> +void aspeed_i2c_writeb(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint8_t v)
> +{
> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
> +}

For helper functions like this, I'd recommend to not use libqtest-single.h 
and rather pass in a QTestState* as parameter to use qtest_writel() and 
qtest_readl() instead. That will make the code future-proof in case someone 
wants to use these function for migration-related tests later.

  Thomas


