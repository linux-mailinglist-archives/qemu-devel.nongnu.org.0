Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FD30C4C6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:04:44 +0100 (CET)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yAV-0005cU-QK
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6xvK-00060d-Vh; Tue, 02 Feb 2021 10:49:04 -0500
Received: from mail-db8eur05on2094.outbound.protection.outlook.com
 ([40.107.20.94]:60975 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6xv8-0006pp-4H; Tue, 02 Feb 2021 10:49:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyIp70UKUsk0A4wRZ8PUMVxJNqQoSqQfkkmNQi3JDDYp46Rs0eqEOar4CMiyg65DVsRAZPRge1tGR4NfmUKPT4dfqRi+GJ/LW5CMUHjr4s8EkDHygEa0kNmqhXAx1EdJHxs4R0+M20XMvqBpLUeOmcHJaEAwIDd2VR0JjqazR0eJegIpmbchGzdj3ZKtiv4fVwExl0v5w0r5jocdNYMYn8j6oLwBOMXlm8gq53OfX5YmtBAz5ERD9QrcF0ozzZ0ZVKJSqZ7xjR6MUaz3KCIb2r+z5cuNaD7SR6Ob4LBLCUG3FBE99lmozv9GTwC1EtMzCbetg6wwQdd+OWqD220dJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqgxPzCXbxOqaJYX95xahet1OB8q4V5y9iKgLbakOOo=;
 b=IqdBrDiRedRUVrMlfarsJA9Iy+tjQVf6hFu9vSkGB9DISeL8lBlwls+Yrx0t4zXPHGwLCML5QUVhj+qO7qmouinGcKf4Fky6B1kzZAeTU7wlFIkBYqVrEFXqojdrnXZXNlVLxnLdiKsoVT9cwKE1OF6Wl6oQgIBeMSWezZ4tko8H13ONc8FQ0SBn2oh7r6cX+CnmPztVgXDqw26+cE2U48oG3ZS/C5y7W0RpfCWfnnVdSKibuoZ/wrR/xLMH6GYk51odPOqyHaAWRIj4KRFsu+irF+QML/IAv/xObfagtvjsM3+URs0uQDlHgHWL/d/aQlH+l1HC9Sqrjrv1T1vtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqgxPzCXbxOqaJYX95xahet1OB8q4V5y9iKgLbakOOo=;
 b=v5wqWrzBhUul+mARecakeb1hI7E43n2WXTLOfL0aJOlzgClQr7MG7NmM1w2S75lQKeMycXdI27eWujCqaT4QBz45gx2VOdOPheTebyX6AYWkEhot8ZV0nCSLQtRjUKiR2yyTfxsuaI0/K4adcNf/vxAD6NvzZZAMWU5ihpSB5h4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 2 Feb
 2021 15:48:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 15:48:44 +0000
Subject: Re: [PATCH] iotests: Revert emulator selection to old behaviour
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210202142802.119999-1-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b92202af-43e5-7508-c0a1-2cf9a6b75189@virtuozzo.com>
Date: Tue, 2 Feb 2021 18:48:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202142802.119999-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.13 via Frontend Transport; Tue, 2 Feb 2021 15:48:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5895e39f-a139-4816-e8b0-08d8c7920554
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-Microsoft-Antispam-PRVS: <AS8PR08MB60384BF4E13A0F4A8313CB47C1B59@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XutkMT701jlvhqdnJiBrdxZS/z2U+VgdfOH0OCs0NISNkFwMbYx3/ePrHg5TGGegFFC7W+ECsQImWA3RFBDdZH7H8/aLl+ZmctIQrcN3LNlAYCJAC5J8NbCC2gbP2+gTpo2Q2jw6yRUMy7/QA3qiJaTyghp4+WJDmfkZCGo2007YrI7PmEwln9S4HR6Br+42rBTX9DjBnPM9iHaU5O3hNSkE9IWkpDnvbCxMmnigIXnsWXc2J1qhqBVem3qiHYVz2iMg5lzsXQ1/J2oWrZLqW1OxnMg32L/KhekBxDVsfQXoV5Wyz5fPStNG1BPKeNqHyHsH3uvDz4PxASpO/b6Z0hwxLh4IENXqSAgGm6XjcQwuoBAdplT6FOAC6tLiSL4ig96xsI6gZE8px3ijtGLFo9SLC4J78bSZDQ8ABSSJTLgQBnFZWfZlCQnLKOQuc3eQ8UEMD1svT5N8D4Tm/6n/3rmJSl4E5DPqRmR0IKZbt5mcjczTYzlRJOUzYi4H5eNmp81R6mPbRCfZ5ClTOt8qJ3sY3XMH1BxUEH8YVbaGZGgVxcMKT1w1w18YTz7IZzucGRLDfJkrnGVp9JAiSNXcMvFsxkYDbly0XQD+/10tcRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(136003)(366004)(346002)(478600001)(16576012)(66476007)(316002)(6486002)(31686004)(4326008)(2906002)(66946007)(956004)(66556008)(83380400001)(86362001)(5660300002)(52116002)(26005)(16526019)(36756003)(186003)(2616005)(8676002)(8936002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1dhNDlaUjdaOHhoR0kxQi82Vmk4MWtZZ0lVd3NzZlRJNEt0cnAySm9LYldM?=
 =?utf-8?B?Q3VxWThZSzB1OFU0eXk3cjF3d3FXRmxZY09welkwRUFiOVlDRmV2NDBwYlZ5?=
 =?utf-8?B?aG9KcXRYMWluQlhNNDVHcXVNbmo5cldaNU1PYnZkUEtud0xBVlJmb0dzcXkx?=
 =?utf-8?B?bzduN3lLeW5TTEhobHczMFB3akVSWVUwTXdieG5laHBiNENBbFZqZEFMci9n?=
 =?utf-8?B?Vm9GcHVrZlZ0ZXJ4aWIwOUx5cjlGWnEwcUxEUXgxckV5bGZpMWZWRkp3TEpn?=
 =?utf-8?B?UFFBZEIreTQrVC9oRU91NDZWRmE4UUd1dXFwM2pheVZLOWhRMmVtQW9BQ1Er?=
 =?utf-8?B?QzNYU011T2dXT1piNFdKQzZXd3dXbklBbzFvYldVcEd5NFZVc1V4dEt1TU1L?=
 =?utf-8?B?OG84WEdMcjN3ZFgxUkZ3dW9ub25ERFpSdVJ5MmxDQlMxbXpxNkFIYklLdnA0?=
 =?utf-8?B?Vy81czdFZTF1UVZuNDQ5RnRhdWY2dFdpeWdQTWVGczBWTW8yQVRxS01abjkv?=
 =?utf-8?B?OXFzYll4WmI2cXU5OWdCS0VROVhUdHgrdHVWMmhjNm9rbGxITFhJMkZkOVBl?=
 =?utf-8?B?ZVA3RDNZaDZQcmd4LzJIYzFOc1QrY3hmSWxjUDR0M0puY0Nub1pCbHlhbVRS?=
 =?utf-8?B?WkhVNkhBTHZhU1QyMXhZbDFLRlBhUWRlOW9kMTcrdEIwOGFwV3lwTllKSFNh?=
 =?utf-8?B?UkE4MnFDbkZoYW9XRGVheW8waUxlWUo5cDVIanBPc1FOYXYzK0ltbFJoYkUw?=
 =?utf-8?B?eTZJWjY0LzBOVE9TUHY3dExGa1pneWphMGZTZVpmdUQzdWcrVFVvVy9iMDg5?=
 =?utf-8?B?eGhHVDBvM0F6OGlFRnNZZnlVM2pNbkRMdlZENXBydDdFN0xESExWUktQQjRp?=
 =?utf-8?B?M0ZiT0pMaDJiWVE0WVEvZUNONmlVWHhDL1BSMjdYdmk0S3RhSjRnM1c5Mlpq?=
 =?utf-8?B?bFQ0aHg1UXhBaUF4Z21vZ3F2czIxOEx1cEE5Rld4TG41TXFlbUNtZzRxeFFT?=
 =?utf-8?B?UFNEcHI1ak1WYWMweDBKVmtodkdSejJsRmdCRWdGeUY0Sk5idkxRN3JUSkVP?=
 =?utf-8?B?bm5EOFBEK2NSZjJnb2doMm4weVhjTm0rS3IzZDVBQlI2R3I4bUlBZFFQRm0y?=
 =?utf-8?B?c0NCM2FlVGh5eHgzdXcxdEVoMjJ2ZG1xRFh6Y2RyUlZyL3pFdWlKc3FWdERN?=
 =?utf-8?B?SzlWdmZCb3ptK2NraktWalBlZWdxZ1JVY210MjR2S2srd1R3ZCsyUzVZNCth?=
 =?utf-8?B?d3lyVU4vOXpYczkyMjE1YVgzWmQ0Y1BSVkF1Rm9xWkRwaXhvZy9kMktocUhm?=
 =?utf-8?B?c0ZFVGdlMnRoR2hZVnY5dms1SjYrUEJzbVpsTU5pR3VsS1RJeWl5TnVDT2NS?=
 =?utf-8?B?ZHlzdGdXQitKQTdJV2pENTZaL0lCL0dpNEw3Z2R5U24yRTgvb3V2UVFZNWZL?=
 =?utf-8?B?SEFYTVk5SlBNU200aG5CTG8xempWeWpqM25mb0JBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5895e39f-a139-4816-e8b0-08d8c7920554
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 15:48:44.3011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2z2JD49xSNxa5Bqm6/tbT/b5zURyuRTp7WPlXhlDPnqJbAtMMhJMinyXOeKDdDbFdrodfc9/iKivVDpch5F+RSlJ6sWsVb81DH1lU0wr+yU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.20.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 17:28, Kevin Wolf wrote:
> If the qemu-system-{arch} binary for the host architecture can't be
> found, the old 'check' implementation selected the alphabetically first
> system emulator binary that it could find. The new Python implementation
> just uses the first result of glob.iglob(), which has an undefined
> order.
> 
> This is a problem that breaks CI because the iotests aren't actually
> prepared to run on any emulator. They should be, so this is really a bug
> in the failing test cases that should be fixed there, but as a quick
> fix, let's revert to the old behaviour to let CI runs succeed again.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   tests/qemu-iotests/testenv.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index b31275f518..1fbec854c1 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -135,7 +135,7 @@ class TestEnv(ContextManager['TestEnv']):
>           if not os.path.exists(self.qemu_prog):
>               pattern = root('qemu-system-*')
>               try:
> -                progs = glob.iglob(pattern)
> +                progs = sorted(glob.iglob(pattern))
>                   self.qemu_prog = next(p for p in progs if isxfile(p))
>               except StopIteration:
>                   sys.exit("Not found any Qemu executable binary by pattern "
> 

Great that you find the problem! Anyway sorted is better than random. Probably we should print some warning when we have to chose from several binaries.. But nobody will read it anyway.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

