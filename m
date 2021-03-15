Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A346333B4C1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:40:07 +0100 (CET)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnS2-0005KY-NS
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <S.E.Harris@kent.ac.uk>)
 id 1lLnQd-0004u5-Vg
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:38:40 -0400
Received: from mail-db8eur05on2057.outbound.protection.outlook.com
 ([40.107.20.57]:6225 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <S.E.Harris@kent.ac.uk>)
 id 1lLnQY-0002DW-Go
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:38:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBu8ZmGP1r3jDeyTcrCsiLxqCBGmCmRtRujin2rKrmQpvdhK1TFPxNJYrPiFEZ3Rnnb4FWyHzwqTa43oW4mDYBeoetsUrS4YAZBtk1GPLLf4Unsjf0FLhotlW/KSjSQUcaxUOfxWzN3tCUlYFe5HQ8+Bq/f43HCcr16udn4pTn46mGcFZ7/rQRFmUswSlYSF+jWQPXkbuPrQXbBWjT7t/lDP0JuZvrY09QWPRzC4GjhOFI4Z+RssFz2zQl1S3Bpkppcl9/03Hf3xfUIGq9CXkKbLMzTEdurTZzKEXU7Q9T1fwZn6uEWjZ42E319J2guy4GBGqsV/wUcZcwyTuLNx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3beNJIWzaEmq98TcOJvKbgYhN+lyxLdGCc+3AHgJDE=;
 b=ahGn/gfHuNWeqSbeEBdLKTx63wMltUmMYuES2DRVw+lLC8UFc4vB26htfZktFhPP46+OKsdvihVPUfLH2SSWwSfZ5/NAb4Bo91a+b22TcNeAIB8XLOZNsyXcexnzRrAfX5cZXMQ9WclceYM/6EQYVsavKqQFJYr4YkRlQu6Kx0eF4k03DETTQRi4YYMbhh5hEQf8wCHRv/6OQYMsCUVOz/pJpvUVfkBvYqjZvEr1+aSG7TFqdqT3PZn1SsDLhHIxp+29I4GlW4hzOTGRfDZkC5ls+i+HuGsY0SwQ+UzqZ25VnhGpIyj5X09zg9Wq46vGFjyUXS6pCfSAQA5W7q57AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kent.ac.uk; dmarc=pass action=none header.from=kent.ac.uk;
 dkim=pass header.d=kent.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livekentac.onmicrosoft.com; s=selector2-livekentac-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3beNJIWzaEmq98TcOJvKbgYhN+lyxLdGCc+3AHgJDE=;
 b=L3bGitAOecJY6DG6cecLuCYrZ0vZMdLAE6y66JiyqrEps1iBwxY3wZAWltzb5YolSWSSVSV3gOs0D4+ouDtWVzaTzLrtZ/vgm5n9OYkapZpspTlJ9jwnM2Gbj4w2JmT6ZJMQSWbt2H4yGuuI/P6m1FkFQ85q8mS1sdC5Vp31hsI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=kent.ac.uk;
Received: from DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13) by DB9PR01MB7274.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:21e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:08:24 +0000
Received: from DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 ([fe80::29f8:3034:6643:b516]) by DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 ([fe80::29f8:3034:6643:b516%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:08:23 +0000
Date: Mon, 15 Mar 2021 13:15:45 +0000
From: Sarah Harris <seh53@kent.ac.uk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 03/11] hw/avr: Add limited support for avr gpio registers
Message-Id: <20210315131545.9093ef8229d91a0bde546e27@kent.ac.uk>
In-Reply-To: <20210313165445.2113938-4-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-4-f4bug@amsat.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.213.130.164]
X-ClientProxiedBy: LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::7) To DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from cadance (195.213.130.164) by
 LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:08:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1848a648-9245-4e44-7a05-08d8e7b36849
X-MS-TrafficTypeDiagnostic: DB9PR01MB7274:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR01MB727458417CE78BCDEE82168AF76C9@DB9PR01MB7274.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +7ySXhZG5Nv0wfL5Jx06FiDYvSocicd9HY+eWTM1xrPRS0ONypvBEX971bjvjLD6R0uXowsBCAfPBrJJ+XgujSkWeoT6RGeHB+q+oMuw+C3G4ltdDBXTVGPbRpjxUnK0HJC6iCXPZrwFMFKKeV5GVXS81kDmIqalqL7o68IHhINGgY9RjrAN0cYA2/pb2jmwz367vGdfS47VqtqeBaJLiN7Q5xoCoOy4lX/dvlRh6eDRuh6FTw+CpDl5FyvwGSuwAdxkYX5NS+zWT6yWstME0Q6u9sg5AxOS1jiCZh81M/zIPDzzJS0dTxR6tQdscMGDiI60t3UsF51DieAjIhYGGGhujvkTB7uKSuXzRMsXJf1jRun5FqOS+dZNPN7bzcDgRxhfepitZpnIhJ0S3l4LjfA6NtMnjlNrrfea+/lbrAUYQuxWK0EFean37+6eSSfwQYr5ytgU1UMaIwQApJLqXqCvJqv3dbxGmN5VagJyscz21rkc2kMmi1GIi+tZoSTnjoy9euKJg4wFuwUpSecwGvRG2In+VPJ/dqVeu1+hNDgeJuVYbDrtUgAzlN6olFzOWGkfLe6SnOQGPwVVugdM7c7OOpo+031luaRp9XzHHfHtSj5oEnSXdaPNePYblOECAZ/PC9eq9qIMKRrEFGLDMQgzGIEIt4HWKmvTz9AVPeRezhM+x02oDLPPnTerWmChre4nLkagmjfR4AhqT978ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR01MB4092.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(6666004)(4326008)(36756003)(52116002)(54906003)(34580700001)(6486002)(66946007)(66556008)(66476007)(2616005)(316002)(478600001)(8936002)(956004)(6496006)(6916009)(45080400002)(1076003)(2906002)(16526019)(8676002)(26005)(5660300002)(786003)(83380400001)(30864003)(186003)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?FznQKHk6IBqmgKzY8xvIL7CBmsY4qMAI+r/RX9X1wsQ+qf/WcuTMVSdfs/?=
 =?iso-8859-1?Q?SETaJwK2QlEmy2G10MtK3wHjd+XcstMh/jWSylryJmxbNTcS9MS8938IY2?=
 =?iso-8859-1?Q?6RBnI0uBvxqEDppV/6NESqK/1bTykfYitaPyUJnwNIZXe7nD7ad6zyHJrd?=
 =?iso-8859-1?Q?Dqf/bzjQyv6Kj96QE1YAzn7tWDR9TzbUCFu+na1+vGYxzePY/ImO6CJY7j?=
 =?iso-8859-1?Q?42EBqAp4f3d3B00I4M/F6AmX2LATwls6rX433r8EtWF3w3SvUQQHDB/MAx?=
 =?iso-8859-1?Q?v/CdR6WAv4eN2QXPwMOZeGDq0xRUYiR4Lte5XPMMi+nT6k8bzcD1bXZ6KX?=
 =?iso-8859-1?Q?5jdJotfUtcGbN3ANF1tMZsHe4t28u6GXxbx2LgCU9Fmce0fFbCrItjpX9X?=
 =?iso-8859-1?Q?rygwSxET/mR6HG36BNlQwFFwjwFoonjN03EDYBD1chmFJiAuECfNGusemB?=
 =?iso-8859-1?Q?09kPB62HM90+71oGkFSRREbPyum13PmUjgOz77aN466uqDmK8qhEZEShVS?=
 =?iso-8859-1?Q?1FeKQOPLU0B1mUu3UphNuTRS8dDKVDMt5x1D/H5kKW0FIhxRDsHbGrOlKt?=
 =?iso-8859-1?Q?/dVMDPCWKWLNrz9I2Xd0QQ/wuRfk0Ke75M+MZKVTdcGxTmlKk0FimzL74L?=
 =?iso-8859-1?Q?MU7ycaycX9IoT4JTnI9QtGRDM4Xkex7iqd2mtChOLDTiDl4oN65YO+Q5yt?=
 =?iso-8859-1?Q?wb4PAds2iMOx3gRtxt+PHwee0iqh3mRNygwGBQdnCiSBpcTQX/Co2Fqzxg?=
 =?iso-8859-1?Q?tifK5jBc4ViO5g4UL8I3cQ1JZAa0Fmfwu5+ZZL10yP5vxSxI7uN+yUMwMz?=
 =?iso-8859-1?Q?arFM0A/w7lseuqmxWEqLb3OkZkFXFSuUFzppCmhwqyR5gNxcDlWd9og1+6?=
 =?iso-8859-1?Q?qnBm6O3CIKILBr2X39MVJDaSdS5FGy9F/jEP4OJ4dQTZo9qV+aAZXAK+aJ?=
 =?iso-8859-1?Q?qtC4qh/uL2M4IB1znmWOjB/gvT4hEtMean6REh6RKWYTkh0Tysa8RP21uo?=
 =?iso-8859-1?Q?nLD8YjPDM8DEer1zyb3IF5+H90SsOrWbKdichDCR1cLCesNVPFSex+skA5?=
 =?iso-8859-1?Q?M8J70y8odjHVrcC8Mp1Sx29EARPZ4wAZsprnFeG8pqb+JTl/P/u+L2EZ+m?=
 =?iso-8859-1?Q?+9tJLnz69mFyE9/v1wKXsmEGbjGAu+voBz9yGVXbjU/bvjYZ/BQyXCeq+W?=
 =?iso-8859-1?Q?5jGtZ2GOdq9rC8gr155FYXPTxfVmfJcUdB4q2Az0Rp/wo/4BpxxeNLV88B?=
 =?iso-8859-1?Q?zT7xbSXdHZR+zpSTROCdAn3sKQ+i30or4UG6PimycBwPl4wUA6KllQIMpd?=
 =?iso-8859-1?Q?YWoD9Ld8f47iUpSRVSo1CHAH+yS4YtyNp6HBaHQU1lCc8ImjV9LVeQm0gv?=
 =?iso-8859-1?Q?1TPq4iBAz+?=
X-OriginatorOrg: kent.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 1848a648-9245-4e44-7a05-08d8e7b36849
X-MS-Exchange-CrossTenant-AuthSource: DB7PR01MB4092.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:08:23.3578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51a9fa56-3f32-449a-a721-3e3f49aa5e9a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkvEWTCgpu2YxHODsAeCT35XRUF+ARPCmt51BpdZQveuqKFssXgVNrbZiGgEEal91kqmfQk54K9Hg9ZHt1S6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7274
Received-SPF: pass client-ip=40.107.20.57; envelope-from=S.E.Harris@kent.ac.uk;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Heecheol Yang <heecheol.yang@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Mar 2021 17:54:37 +0100
Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wrote:

> From: Heecheol Yang <heecheol.yang@outlook.com>
>=20
> Add some of these features for AVR GPIO:
>=20
>   - GPIO I/O : PORTx registers
>   - Data Direction : DDRx registers
>   - DDRx toggling : PINx registers
>=20
> Following things are not supported yet:
>   - MCUR registers
>=20
> Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
> Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
> Message-Id: <DM6PR16MB247368DBD3447ABECDD795D7E6090@DM6PR16MB2473.namprd1=
6.prod.outlook.com>
> [PMD: Use AVR_GPIO_COUNT]
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/avr/atmega.h            |   2 +
>  include/hw/gpio/avr_gpio.h |  53 ++++++++++++++
>  hw/avr/atmega.c            |   7 +-
>  hw/gpio/avr_gpio.c         | 138 +++++++++++++++++++++++++++++++++++++
>  hw/avr/Kconfig             |   1 +
>  hw/gpio/Kconfig            |   3 +
>  hw/gpio/meson.build        |   1 +
>  7 files changed, 203 insertions(+), 2 deletions(-)
>  create mode 100644 include/hw/gpio/avr_gpio.h
>  create mode 100644 hw/gpio/avr_gpio.c
>=20
> diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
> index a99ee15c7e1..e2289d5744e 100644
> --- a/hw/avr/atmega.h
> +++ b/hw/avr/atmega.h
> @@ -13,6 +13,7 @@
> =20
>  #include "hw/char/avr_usart.h"
>  #include "hw/timer/avr_timer16.h"
> +#include "hw/gpio/avr_gpio.h"
>  #include "hw/misc/avr_power.h"
>  #include "target/avr/cpu.h"
>  #include "qom/object.h"
> @@ -44,6 +45,7 @@ struct AtmegaMcuState {
>      DeviceState *io;
>      AVRMaskState pwr[POWER_MAX];
>      AVRUsartState usart[USART_MAX];
> +    AVRGPIOState gpio[GPIO_MAX];
>      AVRTimer16State timer[TIMER_MAX];
>      uint64_t xtal_freq_hz;
>  };
> diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
> new file mode 100644
> index 00000000000..498a7275f05
> --- /dev/null
> +++ b/include/hw/gpio/avr_gpio.h
> @@ -0,0 +1,53 @@
> +/*
> + * AVR processors GPIO registers definition.
> + *
> + * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef AVR_GPIO_H
> +#define AVR_GPIO_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +/* Offsets of registers. */
> +#define GPIO_PIN   0x00
> +#define GPIO_DDR   0x01
> +#define GPIO_PORT  0x02
> +
> +#define TYPE_AVR_GPIO "avr-gpio"
> +OBJECT_DECLARE_SIMPLE_TYPE(AVRGPIOState, AVR_GPIO)
> +#define AVR_GPIO_COUNT 8
> +
> +struct AVRGPIOState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +
> +    struct {
> +        uint8_t pin;
> +        uint8_t ddr;
> +        uint8_t port;
> +    } reg;
> +
> +    /* PORTx data changed IRQs */
> +    qemu_irq out[8u];
> +
> +};
> +
> +#endif /* AVR_GPIO_H */
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 44c6afebbb6..19c3122189f 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -283,8 +283,11 @@ static void atmega_realize(DeviceState *dev, Error *=
*errp)
>              continue;
>          }
>          devname =3D g_strdup_printf("atmega-gpio-%c", 'a' + (char)i);
> -        create_unimplemented_device(devname,
> -                                    OFFSET_DATA + mc->dev[idx].addr, 3);
> +        object_initialize_child(OBJECT(dev), devname, &s->gpio[i],
> +                                TYPE_AVR_GPIO);
> +        sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
> +                        OFFSET_DATA + mc->dev[idx].addr);
>          g_free(devname);
>      }
> =20
> diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
> new file mode 100644
> index 00000000000..cdb574ef0d8
> --- /dev/null
> +++ b/hw/gpio/avr_gpio.c
> @@ -0,0 +1,138 @@
> +/*
> + * AVR processors GPIO registers emulation.
> + *
> + * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +#include "hw/gpio/avr_gpio.h"
> +#include "hw/qdev-properties.h"
> +
> +static void avr_gpio_reset(DeviceState *dev)
> +{
> +    AVRGPIOState *gpio =3D AVR_GPIO(dev);
> +
> +    gpio->reg.pin =3D 0u;
> +    gpio->reg.ddr =3D 0u;
> +    gpio->reg.port =3D 0u;
> +}
> +
> +static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
> +{
> +    uint8_t pin;
> +    uint8_t cur_port_val =3D s->reg.port;
> +    uint8_t cur_ddr_val =3D s->reg.ddr;
> +
> +    for (pin =3D 0u; pin < AVR_GPIO_COUNT ; pin++) {
> +        uint8_t cur_port_pin_val =3D cur_port_val & 0x01u;
> +        uint8_t cur_ddr_pin_val =3D cur_ddr_val & 0x01u;
> +        uint8_t new_port_pin_val =3D value & 0x01u;
> +
> +        if (cur_ddr_pin_val && (cur_port_pin_val !=3D new_port_pin_val))=
 {
> +            qemu_set_irq(s->out[pin], new_port_pin_val);
> +        }
> +        cur_port_val >>=3D 1u;
> +        cur_ddr_val >>=3D 1u;
> +        value >>=3D 1u;
> +    }
> +    s->reg.port =3D value & s->reg.ddr;
> +}

Unless I've misunderstood something about how this is designed to be used, =
I think the logic here and below is slightly wrong.

PORT should be set to the value written, regardless of the state of DDR.
From re-reading the ATmega2560 datasheet (http://ww1.microchip.com/download=
s/en/DeviceDoc/Atmel-2549-8-bit-AVR-Microcontroller-ATmega640-1280-1281-256=
0-2561_datasheet.pdf) description of the GPIOs (section 13):
PORT is defined to be read/write in 13.1 and the diagram in 13.2 (by my und=
erstanding) indicates that reading PORT gives the state last written.
Reinforcing this, zero bits in DDR indicate a pin in input mode (13.2.3), i=
n which case the corresponding bit in PORT controls the pull up resistor an=
d shouldn't be discarded.

This can be fixed by: s->reg.port =3D value;

> +static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int =
size)
> +{
> +    AVRGPIOState *s =3D (AVRGPIOState *)opaque;
> +    switch (offset) {
> +    case GPIO_PIN:
> +        return s->reg.pin;
> +    case GPIO_DDR:
> +        return s->reg.ddr;
> +    case GPIO_PORT:
> +        return s->reg.port;
> +    default:
> +        g_assert_not_reached();
> +        break;
> +    }
> +    return 0;
> +}
> +
> +static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
> +                                unsigned int size)
> +{
> +    AVRGPIOState *s =3D (AVRGPIOState *)opaque;
> +    value =3D value & 0xF;
> +    switch (offset) {
> +    case GPIO_PIN:
> +        s->reg.pin =3D value;
> +        s->reg.port ^=3D s->reg.pin;
> +        break;
> +    case GPIO_DDR:
> +        s->reg.ddr =3D value;
> +        break;
> +    case GPIO_PORT:
> +        avr_gpio_write_port(s, value);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +        break;
> +    }
> +}

Again, I think the logic here isn't quite right.
Writing ones to PIN toggles the corresponding bits in PORT (section 13.2.2)=
, but shouldn't change the state of PIN itself because it's read only (sect=
ion 13.1)
Judging by the diagram in 13.2, PIN is controlled only by the voltage on th=
e pin itself (and synchronisation logic), confirming that it shouldn't be m=
odified here when writes to PORT don't change it.
This code also won't generate pin change interrupts for pins toggled via PI=
N that would generate interrupts if toggled via PORT.

This can be fixed by:
case GPIO_PIN:
    avr_gpio_write_port(s, s->reg.port^value);
    break;

Also, note that I don't think masking the value with 0xF is right (should b=
e 0xFF), though this is already fixed by a later patch in this series.

Given that this patch generates pin change interrupts when pins states are =
written, which I assume only happens in hardware due to the voltage on the =
pin changing, it might actually be arguable that the value read from PIN sh=
ould always be equal to PORT (i.e. pins set output-high or input-pull-up re=
ad high).

> +
> +static const MemoryRegionOps avr_gpio_ops =3D {
> +    .read =3D avr_gpio_read,
> +    .write =3D avr_gpio_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void avr_gpio_init(Object *obj)
> +{
> +    AVRGPIOState *s =3D AVR_GPIO(obj);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->out, ARRAY_SIZE(s->out));
> +    memory_region_init_io(&s->mmio, obj, &avr_gpio_ops, s, TYPE_AVR_GPIO=
, 3);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +}
> +static void avr_gpio_realize(DeviceState *dev, Error **errp)
> +{
> +    /* Do nothing currently */
> +}
> +
> +
> +static void avr_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->reset =3D avr_gpio_reset;
> +    dc->realize =3D avr_gpio_realize;
> +}
> +
> +static const TypeInfo avr_gpio_info =3D {
> +    .name          =3D TYPE_AVR_GPIO,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(AVRGPIOState),
> +    .instance_init =3D avr_gpio_init,
> +    .class_init    =3D avr_gpio_class_init,
> +};
> +
> +static void avr_gpio_register_types(void)
> +{
> +    type_register_static(&avr_gpio_info);
> +}
> +
> +type_init(avr_gpio_register_types)
> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> index d31298c3cce..16a57ced11f 100644
> --- a/hw/avr/Kconfig
> +++ b/hw/avr/Kconfig
> @@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
>      select AVR_TIMER16
>      select AVR_USART
>      select AVR_POWER
> +    select AVR_GPIO
> =20
>  config ARDUINO
>      select AVR_ATMEGA_MCU
> diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
> index f0e7405f6e6..fde7019b2ba 100644
> --- a/hw/gpio/Kconfig
> +++ b/hw/gpio/Kconfig
> @@ -13,3 +13,6 @@ config GPIO_PWR
> =20
>  config SIFIVE_GPIO
>      bool
> +
> +config AVR_GPIO
> +    bool
> diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
> index 79568f00ce3..366aca52ca2 100644
> --- a/hw/gpio/meson.build
> +++ b/hw/gpio/meson.build
> @@ -13,3 +13,4 @@
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'=
))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c=
'))
> +softmmu_ss.add(when: 'CONFIG_AVR_GPIO', if_true: files('avr_gpio.c'))
> --=20
> 2.26.2

Regards,
Sarah Harris

