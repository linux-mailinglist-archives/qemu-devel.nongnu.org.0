Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C498F6CC0BC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:27:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9Lj-0007LJ-J3; Tue, 28 Mar 2023 09:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1ph9Ld-0007GX-GO
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:26:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1ph9Lb-0005fB-Lt
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:26:49 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SDCCIp018933; Tue, 28 Mar 2023 13:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Mi2yPHybG2RyYeSd7FbiJe6F/5mXfw6+g5WoRLj0lsM=;
 b=ClWo9+aAzFbdBFT0zLk1VPG7guszM7qXgXWHS73rcUaTdhARoiG+cDAJ1hrGABYjB2LH
 tUsH3GBrLdfWSo3sgPRKX4MVANS4t0G6kYGfdtGxjAUlqmph0OQ6nyeMPVP6zG/pb1TN
 lACIoeyciGC09kn8NiGcCVAq4xmw8f1Teh7i500sfyPq9pHwLDJz5OT5I7UK08os5Ldp
 G0N9MiutqOwt+tYDtkMT7INA3sLMK6CdM+WZpAnR3k7YwqOh7BsOTktbQHp6Er74y5rY
 +ZYBKenr1C+5pXrRq64UWAExCaZVN10F8kSE5UYecJAYBSH/itoLLnkFrEAn1fzq5G5f 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm0wqgcsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:26:36 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SDCMi1019320;
 Tue, 28 Mar 2023 13:26:36 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm0wqgcrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:26:36 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SCnh5N005790;
 Tue, 28 Mar 2023 13:26:35 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3phrk70veg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:26:35 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SDQYDq15467252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 13:26:34 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B9E358057;
 Tue, 28 Mar 2023 13:26:34 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA9D15805D;
 Tue, 28 Mar 2023 13:26:33 +0000 (GMT)
Received: from [9.163.13.29] (unknown [9.163.13.29])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 13:26:33 +0000 (GMT)
Message-ID: <662e8293-6051-e6da-3494-8585d7d020af@linux.vnet.ibm.com>
Date: Tue, 28 Mar 2023 08:26:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] qtest: Add functions for accessing devices on Aspeed
 I2C controller
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au
References: <20230327202416.3617162-1-stefanb@linux.ibm.com>
 <20230327202416.3617162-2-stefanb@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <20230327202416.3617162-2-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: usUZuDieUZ-ziIDPiEUdvRwJ0gI72HvF
X-Proofpoint-ORIG-GUID: teOkD_sbxMBA6VCtENKgZkdbjvrsBm03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=997 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280104
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


On 3/27/23 3:24 PM, Stefan Berger wrote:
> Add read and write functions for accessing registers of I2C devices
> connected to the Aspeed I2C controller.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>

> ---
>   include/hw/i2c/aspeed_i2c.h |   7 +++
>   tests/qtest/qtest_aspeed.c  | 109 ++++++++++++++++++++++++++++++++++++
>   tests/qtest/qtest_aspeed.h  |  34 +++++++++++
>   3 files changed, 150 insertions(+)
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
> diff --git a/tests/qtest/qtest_aspeed.h b/tests/qtest/qtest_aspeed.h
> new file mode 100644
> index 0000000000..529061cf5b
> --- /dev/null
> +++ b/tests/qtest/qtest_aspeed.h
> @@ -0,0 +1,34 @@
> +/*
> + * Aspeed i2c bus interface to reading and writing to i2c device registers
> + *
> + * Copyright (c) 2023 IBM Corporation
> + *
> + * Authors:
> + *   Stefan Berger <stefanb@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef QTEST_ASPEED_H
> +#define QTEST_ASPEED_H
> +
> +#include <stdint.h>
> +
> +#define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
> +
> +static inline uint32_t ast2600_aspeed_i2c_calc_dev_addr(uint8_t bus_num)
> +{
> +    return AST2600_ASPEED_I2C_BASE_ADDR + 0x80 + bus_num * 0x80;
> +}
> +
> +uint8_t aspeed_i2c_readb(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
> +uint16_t aspeed_i2c_readw(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
> +uint32_t aspeed_i2c_readl(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
> +void aspeed_i2c_writeb(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint8_t v);
> +void aspeed_i2c_writew(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint16_t v);
> +void aspeed_i2c_writel(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint32_t v);
> +
> +#endif

