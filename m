Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3669DCAC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:16:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOjz-00044G-68; Tue, 21 Feb 2023 04:15:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pUOju-00043v-Uh; Tue, 21 Feb 2023 04:15:10 -0500
Received: from mail-vi1eur05on2061c.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::61c]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pUOjr-00087M-4G; Tue, 21 Feb 2023 04:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM1McJv1TfhzDWoZClZ7TdI13MqsZojPD9Ug3hREnik=;
 b=zvE2F7bdnwcDsyyt7s7wy3sbows/wPklW47MDwGa20cVCcyRcnRqPatbYl1wvEJVPNif8/mqGHElM9oNVpqo1lj2WR7UsYoj+W2/ykbQtj2vA4AWteP/VvPdfZXrZxiD9v6VyUdFryKamVkGHXtXCLXQ5Fvhz7mLI79H+0/oSbM=
Received: from AM6PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:20b:b2::33)
 by PAWPR08MB8815.eurprd08.prod.outlook.com (2603:10a6:102:337::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 09:15:01 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::f) by AM6PR08CA0021.outlook.office365.com
 (2603:10a6:20b:b2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Tue, 21 Feb 2023 09:15:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.17 via Frontend Transport; Tue, 21 Feb 2023 09:15:01 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Tue, 21 Feb 2023 09:15:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4cfd577839661c63
X-CR-MTA-TID: 64aa7808
Received: from b5b57c6dfe02.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA1EE714-323D-46BC-A9E9-2939C3E2CFA1.1; 
 Tue, 21 Feb 2023 09:14:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5b57c6dfe02.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Feb 2023 09:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZO070JsuTm0O8MkTb5MBdv+qWERMNtDN2bsT8Hrun8rl+VvTQSqDwT3pqu2MVncY2mXtiTcivjWqpmA4LXMf86CiTrpyOGK0CloNCCX/js+5um4tsEzSM9vBYjc3v4u9EY7VYj8ARfr1vI5EcTV4s7o9wWp8uZgpcqt6RfPQVTnhW4uED2gM8UXGnHMIRGFrsraHBpdbo2DEBMqhIBygxCB5gi+AL2CWLfmzMO2qRpY1XtV5cCCj4j87H+JrEij71KpO4/vVreEtKrGLLRiUHciQmXBoQ1ff2GTfc0xR+seUrnf4y40E81CvGVpuwKzS5vHEwHw/HaQpt8u1j9KThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM1McJv1TfhzDWoZClZ7TdI13MqsZojPD9Ug3hREnik=;
 b=CROzyDGML8DP+/KStIzXrybZ+3pDIaogycl6eaZa8VSLRG1KRjE6/t8tu3+Eus1J1wCcgbHBYiTLG32DhFgZpDPZoMG28wVxzGiJqBHuQZtKaOnTSDWIqtgO/jmXjUVYh+4oyznfmmRt1Yo9QKr/gFIVF5aH3D8wudZmOEzs4Yw490Td9ChqZTXg/4Isw9dP1GzHqZ01axnIEt1uwZCxi8Xvfoea1YPsVk8g42GPIaLigXIG7OU3QEPfxk91oe6ZiZ0TRWLsSqp+7PjdvUp74fNLEZfvewXL2lujUyp3C87K1qE4vrTPNSBoZ9ok+KQGNtY00xe8JKyg+b/+h2nG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM1McJv1TfhzDWoZClZ7TdI13MqsZojPD9Ug3hREnik=;
 b=zvE2F7bdnwcDsyyt7s7wy3sbows/wPklW47MDwGa20cVCcyRcnRqPatbYl1wvEJVPNif8/mqGHElM9oNVpqo1lj2WR7UsYoj+W2/ykbQtj2vA4AWteP/VvPdfZXrZxiD9v6VyUdFryKamVkGHXtXCLXQ5Fvhz7mLI79H+0/oSbM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by DU0PR08MB9420.eurprd08.prod.outlook.com (2603:10a6:10:423::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 09:14:52 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%4]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 09:14:52 +0000
Message-ID: <af38e9f5-0d50-f755-2c86-e049f07669f2@arm.com>
Date: Tue, 21 Feb 2023 09:14:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 11/14] target/arm: Implement gdbstub pauth extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-12-richard.henderson@linaro.org>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <20230221021951.453601-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0560.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::18) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3919:EE_|DU0PR08MB9420:EE_|AM7EUR03FT003:EE_|PAWPR08MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 647a1971-ad03-40cb-8f9f-08db13ec1c90
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Yjm8gneRLMC+hQueU+c621gPCRNRmaRYv3WeO7xPvBhbBySFtzy+XHMQVZLtA1R3EvDu4xGrM9VYvKF9YX5SeEsp2hdlXCDtBm4Ox5MARD2eEX6foKb3YbNQWwUmmdCDWH5AnD7yKzHPKu+DVs08OGSluNhg1gkztiboQrZyUD2ajW6YsVGLgcDHyRlA9AZIFVcSNSzUmDGRLP1jgI4XzOygqVQ43qThnAZ/OQuG/iiQURNMhMGoM57l5fTJ0ByOr+R2jjQQ7jAcZ7Tx5NyiQeudZ4USfvSwfFZBbUT3w2zdHk/GQ95H1Nv2lrWPmgN64t4drubq0XXNBePlKVah0xwHZ9Rh+nVqhp67TnOUh5itnJlAWK4plfrFXzjBRgLSk9OMimjh29MVMLXU7M+3YiuXUYXH6J5pmIfvWIPHG1aqEx30rqTfIvoHCM1R62ny7h6QhjfU+sftLkB5y+9pHBl/MinFCqNzT6Gh1Dk5V0nOticP0wxA5eHVBtPyrPlGOrlNtWGfYoRD8YsbhErP2qU1utDKaCC8lTI3p14RkA70DabxQ7BY2yhm9/CKZXkUjFpNY/hslu6gqGsCxK+Ztn2zb/r52CgfITVpUUd4V1CbIf5ZXJUxGWH+fsi0GZlQYtUYoXZHC5vaxGNo2+K954pTqONhG3UO1EMl7VyjGDqHW6x0iCttnPrZZayApBIYeIuaY22wefOZdNqjOU2rp1uivtnYo2NaoCYKpUzLQRenXgP0ehwgixV/ofOlTJrPi1m4mCC966JmmmSwRGlCSpBj71zeRC91cWoWJNxgs2k=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB3919.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(83380400001)(41300700001)(186003)(6512007)(26005)(316002)(53546011)(86362001)(31696002)(478600001)(966005)(6486002)(6506007)(66946007)(36756003)(2616005)(66556008)(8676002)(4326008)(66476007)(2906002)(31686004)(38100700002)(44832011)(8936002)(5660300002)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9420
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4932c200-c41a-4e3a-bb52-08db13ec173e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0W4hqNIsIQy2fSptFByVJ4ldnwmVENk7Qa0YBTH0HHXu27o34w4ZyWzi/QQuFanHFM1xS0bKbKqKjSo2+21p/4j2pPuWQY1N2YNBcbyyNV51A+7/FBJFCVyn5EcC+sALwbUyQzkhRA0ds6OPqEleUSTqcDWLVul/fIHNcuFGoQwLs/WDRGswTvlbPSGpRUswGuFB7QQMTmjh+8OUG0u5ZRAVHCbDq+gGvPu66nIuTFWg2/6CSXLn/aoiH7hjZ4HSNRI6C7yAQCk0VyVRotVIq+iYpFEnWUK6LlntZpZE3P8W2poXkfK7988hwB+Bq9ZhlYrVo/nFU7bl1eyv6w0/fScM17MuB4T9wnp+XtkLz1a4SxpcRTEmRCaX1TU/Eu9cjgZjFNUbzbMLruo7erLZQ8I1hucTaqu/DF5HvuZ8qoWVx4gIOT/L0Aluyt+2QPPM81g43UXzLkbPRHXCMf97MoYhOQnj5oUOyjevBUVochk1/1nZnupFqkxqlenq4j/F/7gL840ItUG1+B+4OyBYzxaACrYQxMjm92ZsZ4szdxKYi7svOnVLDjKTXj9uoQHUzUzEdgHpIkVo2VxSlLmqwvfQHr0miA/uCfccPrSF+Ck0RU2R5qLfEnlzTdCrU6x30O5NhWgADum+zpAfPMRJglPH6Kk30+FzLm+tSp/X9fZ0BJWpjn6Ayn8aRF3bVGLq9HoLlfmU0Vf278DQXI6rI+/0JxEJbeg/toubB6n2Sp0mvTgOALbyyObbCiQOOA/rTuqLb/HYxN+iJCYF4tKeOqZGaCLfYvcFxD4PDy8Rms=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199018)(46966006)(40470700004)(36840700001)(83380400001)(86362001)(478600001)(8936002)(6486002)(53546011)(107886003)(36756003)(5660300002)(966005)(6506007)(186003)(6512007)(26005)(40460700003)(41300700001)(40480700001)(44832011)(2906002)(31696002)(81166007)(70206006)(70586007)(450100002)(31686004)(36860700001)(47076005)(82310400005)(82740400003)(356005)(336012)(2616005)(316002)(4326008)(8676002)(2004002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 09:15:01.4565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647a1971-ad03-40cb-8f9f-08db13ec1c90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8815
Received-SPF: pass client-ip=2a01:111:f400:7d00::61c;
 envelope-from=Luis.Machado@arm.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

Hi,

On 2/21/23 02:19, Richard Henderson wrote:
> The extension is primarily defined by the Linux kernel NT_ARM_PAC_MASK
> ptrace register set.
>
> The original gdb feature consists of two masks, data and code, which are
> used to mask out the authentication code within a pointer.  Following
> discussion with Luis Machado, add two more masks in order to support
> pointers within the high half of the address space (i.e. TTBR1 vs TTBR0).
>
> Cc: Luis Machado <luis.machado@arm.com>
> Cc: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1105
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/aarch64-linux-user.mak    |  2 +-
>   configs/targets/aarch64-softmmu.mak       |  2 +-
>   configs/targets/aarch64_be-linux-user.mak |  2 +-
>   target/arm/internals.h                    |  2 ++
>   target/arm/gdbstub.c                      |  5 ++++
>   target/arm/gdbstub64.c                    | 34 +++++++++++++++++++++++
>   gdb-xml/aarch64-pauth.xml                 | 15 ++++++++++
>   7 files changed, 59 insertions(+), 3 deletions(-)
>   create mode 100644 gdb-xml/aarch64-pauth.xml
>
> diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aar=
ch64-linux-user.mak
> index db552f1839..ba8bc5fe3f 100644
> --- a/configs/targets/aarch64-linux-user.mak
> +++ b/configs/targets/aarch64-linux-user.mak
> @@ -1,6 +1,6 @@
>   TARGET_ARCH=3Daarch64
>   TARGET_BASE_ARCH=3Darm
> -TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
> +TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb=
-xml/aarch64-pauth.xml
>   TARGET_HAS_BFLT=3Dy
>   CONFIG_SEMIHOSTING=3Dy
>   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/configs/targets/aarch64-softmmu.mak b/configs/targets/aarch6=
4-softmmu.mak
> index d489e6da83..b4338e9568 100644
> --- a/configs/targets/aarch64-softmmu.mak
> +++ b/configs/targets/aarch64-softmmu.mak
> @@ -1,5 +1,5 @@
>   TARGET_ARCH=3Daarch64
>   TARGET_BASE_ARCH=3Darm
>   TARGET_SUPPORTS_MTTCG=3Dy
> -TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb=
-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-=
sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-pr=
ofile-mve.xml
> +TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb=
-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-=
sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-pr=
ofile-mve.xml gdb-xml/aarch64-pauth.xml
>   TARGET_NEED_FDT=3Dy
> diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/=
aarch64_be-linux-user.mak
> index dc78044fb1..acb5620cdb 100644
> --- a/configs/targets/aarch64_be-linux-user.mak
> +++ b/configs/targets/aarch64_be-linux-user.mak
> @@ -1,7 +1,7 @@
>   TARGET_ARCH=3Daarch64
>   TARGET_BASE_ARCH=3Darm
>   TARGET_BIG_ENDIAN=3Dy
> -TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
> +TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb=
-xml/aarch64-pauth.xml
>   TARGET_HAS_BFLT=3Dy
>   CONFIG_SEMIHOSTING=3Dy
>   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 370655061e..fb88b16579 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1331,6 +1331,8 @@ int aarch64_gdb_get_sve_reg(CPUARMState *env, GByte=
Array *buf, int reg);
>   int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
>   int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg)=
;
>   int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg);
> +int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg=
);
> +int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg);
>   void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
>   void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
>   void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index bf8aff7824..062c8d447a 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -355,6 +355,11 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *=
cpu)
>                                        aarch64_gdb_set_fpu_reg,
>                                        34, "aarch64-fpu.xml", 0);
>           }
> +        if (isar_feature_aa64_pauth(&cpu->isar)) {
> +            gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
> +                                     aarch64_gdb_set_pauth_reg,
> +                                     4, "aarch64-pauth.xml", 0);
> +        }
>   #endif
>       } else {
>           if (arm_feature(env, ARM_FEATURE_NEON)) {
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 3d9e9e97c8..3bee892fb7 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -210,6 +210,40 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_=
t *buf, int reg)
>       return 0;
>   }
>
> +int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg=
)
> +{
> +    switch (reg) {
> +    case 0: /* pauth_dmask */
> +    case 1: /* pauth_cmask */
> +    case 2: /* pauth_dmask_high */
> +    case 3: /* pauth_cmask_high */
> +        /*
> +         * Note that older versions of this feature only contained
> +         * pauth_{d,c}mask, for use with Linux user processes, and
> +         * thus exclusively in the low half of the address space.
> +         *
> +         * To support system mode, and to debug kernels, two new regs
> +         * were added to cover the high half of the address space.
> +         * For the purpose of pauth_ptr_mask, we can use any well-formed
> +         * address within the address space half -- here, 0 and -1.
> +         */
> +        {
> +            bool is_data =3D !(reg & 1);
> +            bool is_high =3D reg & 2;
> +            uint64_t mask =3D pauth_ptr_mask(env, -is_high, is_data);
> +            return gdb_get_reg64(buf, mask);
> +        }
> +    default:
> +        return 0;
> +    }
> +}
> +
> +int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
> +{
> +    /* All pseudo registers are read-only. */
> +    return 0;
> +}
> +
>   static void output_vector_union_type(GString *s, int reg_width,
>                                        const char *name)
>   {
> diff --git a/gdb-xml/aarch64-pauth.xml b/gdb-xml/aarch64-pauth.xml
> new file mode 100644
> index 0000000000..24af5f903c
> --- /dev/null
> +++ b/gdb-xml/aarch64-pauth.xml
> @@ -0,0 +1,15 @@
> +<?xml version=3D"1.0"?>
> +<!-- Copyright (C) 2018-2022 Free Software Foundation, Inc.
> +
> +     Copying and distribution of this file, with or without modification=
,
> +     are permitted in any medium without royalty provided the copyright
> +     notice and this notice are preserved.  -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name=3D"org.gnu.gdb.aarch64.pauth">
> +  <reg name=3D"pauth_dmask" bitsize=3D"64"/>
> +  <reg name=3D"pauth_cmask" bitsize=3D"64"/>
> +  <reg name=3D"pauth_dmask_high" bitsize=3D"64"/>
> +  <reg name=3D"pauth_cmask_high" bitsize=3D"64"/>
> +</feature>
> +

FTR, I've pushed the gdb-side changes: https://sourceware.org/git/?p=3Dbinu=
tils-gdb.git;a=3Dcommit;h=3D6d0020873deb2f2c4e0965dc2ebf227bc1db3140
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

