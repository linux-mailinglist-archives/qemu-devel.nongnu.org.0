Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C66D35144B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:12:17 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvFI-0005YY-MN
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <S.E.Harris@kent.ac.uk>)
 id 1lRvDh-0004kk-Vz
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:10:38 -0400
Received: from mail-eopbgr80048.outbound.protection.outlook.com
 ([40.107.8.48]:54547 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <S.E.Harris@kent.ac.uk>)
 id 1lRvDe-0007my-E2
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:10:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxeXgLj1g44RMMzxyG8YMvTnBjzEwcO+e6y7LqU/LixDbFVbIjq29NT7PMXb7DA5ZmIt/WubeXDRuH38/QpjRJrFPehnlWfROg3+t7w5L5BMeQtyOa/JDRg7qrLZY8bfcU688DJc1wDObVIMZUOACA8Gh/Z+yLs1rgwbOGg7/tY65Pr3WrcImf3m4DSuTyWIN6ZDVgSSY5i2c4kpWYKhRaFqLuq5Crl5uw2jgVz6NllSlC2+EhedBYBPgPVlf8lamrHH2hFnkX2wRDi2XHX/i7KWpuVtgUiG1OFuE+a+OirEpB0NogRV4hjaf3s9aklc7Qx4huxPRnA0iN2ObpnesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlVEVMlWUAVdXal9DPRxQX9+N4worMTErKWBYukyfCE=;
 b=ntYkZNq0qUWbAYS/jwqemY2Pw0kwY0XVvcG98qkyAMY7hKf+CC3rEg+nfIIhDTeqPkbXv/abfYOcocP6MTqVC0PKY1G3mQAcwuJTAEZuoyXpbwKI2839RcR7h8RhnBehTtseszBnEvFRHASDr7jIFTcK7ZKf5lBkZuY5woZex6+SOfdAX4FTkql913CJMK1JwQk7zaiFw3NccvZIrwA2y10RwX4vQhKcGl5k4yrmxCBgDoXOobceLHK+rldV6Mmq+/+M6mGBXKVC9KvgGgYi5fFREiaNmEKR9l5cY2hQtlXWsqDAv/aJnBQzhlCIs9iXCIRrc8K+DXA+pFl0kzwlag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kent.ac.uk; dmarc=pass action=none header.from=kent.ac.uk;
 dkim=pass header.d=kent.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livekentac.onmicrosoft.com; s=selector2-livekentac-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlVEVMlWUAVdXal9DPRxQX9+N4worMTErKWBYukyfCE=;
 b=FMCLp2jZJ388ldR62n+gTugpn3935wa7b2Wfb5yY3IN5nNHXIe2nIXkYUJTShE5CtPLwk2q0KjKXoJ7kUpJ0fc3QAfCaoGiJY/2/XbNuqTqleb6fnFbrC5ciPWWMTgIdna23dBHzF+BwuaJsJtmJnu5ZllunbL9v7DFWtq7rGiI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=kent.ac.uk;
Received: from DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13) by DB7PR01MB4235.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 11:10:29 +0000
Received: from DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 ([fe80::29f8:3034:6643:b516]) by DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 ([fe80::29f8:3034:6643:b516%7]) with mapi id 15.20.3977.036; Thu, 1 Apr 2021
 11:10:29 +0000
Date: Thu, 1 Apr 2021 12:18:15 +0100
From: Sarah Harris <seh53@kent.ac.uk>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Drop the lines with Sarah Harris
Message-Id: <20210401121815.1aadaff74327d5b7bec45bff@kent.ac.uk>
In-Reply-To: <20210401062426.3192118-1-thuth@redhat.com>
References: <20210401062426.3192118-1-thuth@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.213.130.164]
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from cadance (195.213.130.164) by
 LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.30 via Frontend Transport; Thu, 1 Apr 2021 11:10:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2a72eb6-bfa4-4512-f9cf-08d8f4fec1f4
X-MS-TrafficTypeDiagnostic: DB7PR01MB4235:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR01MB42355D254A59B5B1F7D758EFF77B9@DB7PR01MB4235.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HwJK3MvOIKuJ+revj89qEqykzxnpda6tVr37ycsb02spY2KEbWNirSmZP/m67RHEipMeNqRkK5zh/t6lV/jRhklU0AdbqATXYywtZ8BaxoOcDc6mDEwHLeHhNVzS0YrsVOSTd6oLg/tD4mDlKOQv3dGDG+kHuqchucP4ijp5MMc+K4A36TxhYa+z7vnKWAhszfPBKorwAaLS6JcI+gfB79GWydjshxm4p4qxABtFAg0PK+iHKOvEMsW28JUlGLf2oFqWfVxnR0kfkVamoKUjUZAe9uJ7xzzy4lgX+BFW0A/gXAIuLEAts6WVtBo/uaXL5Ay5bZt4ue7AMe7S2dg1shRUwi79hKB6/p5OMrhBe3oxYBIt/rXNVNZyn6w+8hiX2rmhCuK7rKw5TuJGBGzg3aHyM/nvSQ/ezqvv6crdeqMABlVUMF+XZVfp1d+ShRYi6SsTdAV4WhSTBeUXZspccChKLGf6s73dThyxP0Ql1itTOXZttcHiNzDXGrZh5w+BwAQoJlLn37r7RalEdREMB8Q7GcIh/qFNIxuppS4XOwCLbLWSKs1+KqrjDaBdWp/xrBwXg3LwbKi9LKLLo6c8XxVxjw4We/2b3xJRAVjyxiE2AydI3ZGwu+ok7diQPqxWEHjOrL+zo9BVepqi4f7W1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR01MB4092.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(26005)(2906002)(6496006)(956004)(66946007)(478600001)(83380400001)(4326008)(8936002)(66476007)(36756003)(786003)(66556008)(6666004)(6916009)(54906003)(5660300002)(8676002)(316002)(6486002)(2616005)(52116002)(16526019)(186003)(1076003)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?ICdkAWWITpBuVIYG0D/bHRlExpwycWTRNPawvrf2s2LUA8qlBsragWt5Q2?=
 =?iso-8859-1?Q?YMsb5ZJcRqq+7ssyn1K4sbII2DFU9eMnT+rGJfz3GXsC0Yq5o6iVXP02FA?=
 =?iso-8859-1?Q?IJCmXkYAmCVCrQkOwgNeLGK/LKCIfd4Z4k9Fx0h2mqLwGmLK19HCiG3FzW?=
 =?iso-8859-1?Q?aOFWfL4rkHQo8EaCCOr7R3EVVvUeEleD4UymylAGl8/atX9KqxhcugtPh+?=
 =?iso-8859-1?Q?O3c3D6SsHMZLIgNQrQkqC4sFHgbYkamqNzLnL3Sc/V/yA6vF9F3PRUUQzd?=
 =?iso-8859-1?Q?jQ4L8SNkXyaExRYBNpVGubhISnjfgmHEjLYqA2L4zntIjFfH4IIzrkPTJP?=
 =?iso-8859-1?Q?Hct++AHMnWgkx2v76MLLU8tmrxEpiQqSZx95x2ZcAzSk+zuIdhtYFOBS1P?=
 =?iso-8859-1?Q?ujNANC9ZFNXvw24n33/xX8YU5FarXJ0H15L4E4TcSvTRSm7ulKEFkz1It5?=
 =?iso-8859-1?Q?RoOnzZhxI2t2gqnAd9wUweLZcRRKIMf7jWZUaAFgmSg0xaf7HA82IeY39A?=
 =?iso-8859-1?Q?43kBxSohwGNcM/3lGDt8CzcvkWm276aEKiVqUlViXY7u5EqpVs3q7ZLAko?=
 =?iso-8859-1?Q?ouWNugzMwTX9BoKilDob6Et05WJN10y4IdKyJO7lwtAaveIztILBeqLk41?=
 =?iso-8859-1?Q?o6y0ipd8sG+T+7///0ioXYpXcKc8Hz9bu497piKca3MMNuHoZXVut7+gP1?=
 =?iso-8859-1?Q?jVl+H4lpg9xDcjsaMBcWNPemKrCtVEo6cT1t3rogFbmkgySG+8V2wRUoQo?=
 =?iso-8859-1?Q?Q7Qi4zxmSncNsWu/ZurgH87nnzpGwjdABRKvJce5raXn1BQLokc/t8FY9g?=
 =?iso-8859-1?Q?korJknz/kZRtuk+HLK/hxmtdUC5vnu6Onts5l7kkTV/6oH0ys/gKgmnAig?=
 =?iso-8859-1?Q?3OvCjFBrJFBsULjOffuHfGS4YAHOEcMKXhij1dzuVMmym5rUrcSbCQ0qeO?=
 =?iso-8859-1?Q?exDHceaCSOsZOuoviO2Qy7Ydf+FT5lQDFKLMka35YO00frCM3ZXoTbUrjT?=
 =?iso-8859-1?Q?AuhKheCoCPzPsP81XC60lojQADKvbhAsDrfgW5HGFExBg/AP2pBXNV8J9p?=
 =?iso-8859-1?Q?NtWvv8EP0lAVs3NSfeK03kQLA8tlpzfbD3Zdcn/akstf8MVNcfovI4rqso?=
 =?iso-8859-1?Q?d5x1eTZKi9nGbviQV2otDeHmxUCcEkqmqtR0B343tJQDKfUrFj5HhVGZlz?=
 =?iso-8859-1?Q?y0SnBzy6JCC+P9OKWKR7R/x93UpxhdVdD6kavrNejUBuE+34XFP2M6WtjF?=
 =?iso-8859-1?Q?qhUZKdJIhHly8DaoCyeUrKeP5OHdgve1Yh+KElzgp/oZ+HwQsmsV25vC3W?=
 =?iso-8859-1?Q?ihmS9pGCUJQFaS23qQ5eSehCquoTx5VgnkSdD2aOvdYknfuTSHf0zvYi3Q?=
 =?iso-8859-1?Q?++4SbK+RGJ?=
X-OriginatorOrg: kent.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a72eb6-bfa4-4512-f9cf-08d8f4fec1f4
X-MS-Exchange-CrossTenant-AuthSource: DB7PR01MB4092.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 11:10:29.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51a9fa56-3f32-449a-a721-3e3f49aa5e9a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5ISM5mDq6lv1RBad+e9PM2HxbEzMEgTxfW2DEIkMXDdTIWbGOf4zxeXWnoNPdT7WZvV8YIKeS4vhyaDzb36Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB4235
Received-SPF: pass client-ip=40.107.8.48; envelope-from=S.E.Harris@kent.ac.uk;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Apr 2021 08:26:41 +0200
Thomas Huth <thuth@redhat.com> wrote:

> This is done by sending a patch to the list that remove the entries. I ju=
st=20
> did that now - would be great if you could reply to that mail on the list=
=20
> with "Reviewed-by: ..." or "Acked-by: ...".

On Thu, 1 Apr 2021 08:24:26 +0200
Thomas Huth <thuth@redhat.com> wrote:

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 554be84b32..e7b54372c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -174,7 +174,6 @@ F: include/hw/arm/smmu*
> =20
>  AVR TCG CPUs
>  M: Michael Rolnik <mrolnik@gmail.com>
> -R: Sarah Harris <S.E.Harris@kent.ac.uk>
>  S: Maintained
>  F: docs/system/target-avr.rst
>  F: gdb-xml/avr-cpu.xml
> @@ -1045,7 +1044,6 @@ AVR Machines
> =20
>  AVR MCUs
>  M: Michael Rolnik <mrolnik@gmail.com>
> -R: Sarah Harris <S.E.Harris@kent.ac.uk>
>  S: Maintained
>  F: default-configs/*/avr-softmmu.mak
>  F: hw/avr/
> @@ -1058,7 +1056,6 @@ F: hw/misc/avr_power.c
> =20
>  Arduino
>  M: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> -R: Sarah Harris <S.E.Harris@kent.ac.uk>
>  S: Maintained
>  F: hw/avr/arduino.c
> =20
> --=20
> 2.27.0

Thanks for explaining and submitting this patch!
Reviewed-by: Sarah Harris <S.E.Harris@kent.ac.uk>

