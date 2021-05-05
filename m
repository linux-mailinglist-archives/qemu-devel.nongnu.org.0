Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4C3735FE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:04:33 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCWG-0004A0-Lv
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCUQ-0002kc-P1; Wed, 05 May 2021 04:02:38 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:32721 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCUO-0000dW-C9; Wed, 05 May 2021 04:02:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV/KW6Y/y7GlVLsc07eArYPUyWqM4ZN4iANgPvfZ+3U/2ZcnTj8ssTOMP4loW/kkZbZUrGUIUrAAOZcz24r4oOkkuc2aowXuSVuCAHc6qG/1iN46wQy0DXjQEYf81M8CffjZyBfuaAcYhqvynTlZvcK093Pyv7qCeSXWbw+sUMiddf7WHpHpo2QiOFYtAFrVa0+CVc39WxowCo0X81SniT3Gui3/684MI9u02Kffs28pMN+6Dr+lX6pkVnQVQev2DL8lZtJJ5ktBJ7elZBL1tiv+Z4d0yhsChMsMb38sTARPvRYnw6anYCE9m2OAZapPZ/sGy5csUWHotdO0xW3YbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egj95w1nvJ34jjEBEfEvdBl4cbFLaisCCgAel+Qy3zk=;
 b=Wd7rEiSyB2ZgMhef6Biq3ZMdESzg4mNmYQnoB/wxsWP9O8tdKoyt0MbVBofLwDMkY5y5XlvpZlsWV5Z6DZHUjR2NlB0U4i6uHnkIQSTSW1FL+gJykvb9V4Qwl7+LKupDDHL5FfG4W8mS5//IOM7Ei/HGN7g5KACPFdHtD2wd5uMf8bGMS08hgpqjjXaRyAPKk+tnua24bLL5lTCzS9sQUk3Q+JbPq54d2/yFeopCHCPAILipGbZ7Jk0TzuWTxRjC+kQS7BaAh0qHLEsh6R0DT8JGPirKENgtDizZowCeiS8tAf6ZeWQX3izoR3Cv1f2KQwdl2m6yVSUAMjUK8vJWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egj95w1nvJ34jjEBEfEvdBl4cbFLaisCCgAel+Qy3zk=;
 b=J3Xv1P6ix/A6XQA5Plw7CDXEJS6H/0FJMuU5xGezfzlUbom6CLz6k8A74DwsCv5vd9lgC7om3cvZeRJvTOE0OcsD95a9J08SjslLIW/SC/KgEhAOViaaNKepxu09LrVASTKXOg2s1e2n7MFmH3L+MQGovw1crRmesXtt6sD5muA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 08:02:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 08:02:32 +0000
Subject: Re: [PATCH 0/4] iotests/297: Cover tests/
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210329132632.68901-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c8a0c410-e4fe-5061-ba61-73f6bd5a8bfe@virtuozzo.com>
Date: Wed, 5 May 2021 11:02:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210329132632.68901-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR3P191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR3P191CA0051.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 5 May 2021 08:02:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5280d181-2812-4312-3184-08d90f9c22be
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53338C146934F1C761ADA12AC1599@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KlMPICfqqam2N9WoowGh79GpTxlFEtTK79rVJKZsHT7I1niLgJvSOJFpzByOk8O5dPjZhuTWR59mW4UKT9FM/RHNMzIuiKJKbE0opbFLJEVdpVCWtk0sPwgy7i6qbQ9gRdfvMGEvRGSPr1ONQYVMIziU0Bc01zAmmCp49Isav348nRftDUDvz42CrcXEI9brV5L+oUqBJJZpATQzA8ZzF6wIi4OWs+q0f6bDKN4W1xIT/ty0fNgKRD84mFJgjSABQypJPlVMRNZ910RjTqJVAmI2mJDUXQJvC+Ta/QgSl0uchuSxTMmcvlfioEKaVd6wCigValXhn60nu4UJa3z7zqb6EinTWzbuUXZs7X5TsNB+dPZ62TQbfh05wFrv2kjOnHja7eaE/LsY1sH+lnegyTptU93oB1aivjEmmaxdPd6a8CrPO0l3gwtS9fz4udXCxPXgpXvy06snGJeCNcDIraW7EjeKW8iM0BcloOJI2OJBO38Fg83AgwLgjPHC9ev/ckkiBEs1sX0Qof3V13BbtTiB0KVqyIkT2cU5Hb+ItA57CdsJlZLOhvrxbpH//k5S0A9SxeAhRwkuioMb2pPnWln8DAxul47lKDDIXuxyUNdGqebqmue9Tgm6E45YO74JEB4DpmfR1x4xZyssfqNtpPLyUZBAtEnEZK/z8xXceqgcpv6Font/YMQjwS/ZatAAccnvjk2h50fI0+Pz53IVLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39840400004)(366004)(396003)(346002)(83380400001)(8936002)(5660300002)(4744005)(16576012)(66556008)(26005)(2906002)(16526019)(66476007)(186003)(38350700002)(316002)(6486002)(31696002)(36756003)(38100700002)(8676002)(52116002)(956004)(86362001)(4326008)(2616005)(478600001)(31686004)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVQxUTByTWkzajh6RjRQcGEwOXkxdElGSm5OS3FyVC95Q1p5em44K0U0dXZB?=
 =?utf-8?B?UlY2ZFRwTlRGaHk3R3E2MG9kbVBPSnJwTGRjbjRDUVYwNk9kNERCZmRlZ2Rm?=
 =?utf-8?B?RW5MNjRyV0NqSmtQQktZK1dhOHhmRHRlWTA5RWEzc0UwYjhscFFTUjdReXhu?=
 =?utf-8?B?bFhFNGc3ZjF4YkQ2YzFXNnY4elZYc05ObldnTUZVOVdNTThhSmFISEVYWnMz?=
 =?utf-8?B?Q2k3dDZCd3IvQ0lXZFVrcUFSTk5UL2x0ZkxjTUc2aEhVOUJDRFFKajAzYS9x?=
 =?utf-8?B?Rmw0RXBVd2tLQTVHV1pnSHVwbk5pL1VxZWU2MmNCYVBhMDhwc3VENURLaXZQ?=
 =?utf-8?B?V0laSkhQeE1xcjJJVkhZNENiblBYdGdZNW13QnFWZ0k2MThlOUNvblF5cG43?=
 =?utf-8?B?ZERwOEdRMldmYVYxTWRPUmd5R2x5cHRTUThQbGd6VnJ4dUNZU2NiUERTeXc3?=
 =?utf-8?B?RUx1aGlraE5QMFBySlUyNU9uQi9qaDcxTlZUNHdXRG14RmJEZHBlS2hUNGVC?=
 =?utf-8?B?YkxEY3lsTWsxVm95TDY2ek9qOGJpcW40OG9USFNnZTlUNnJ3SE9MaGlrMFBz?=
 =?utf-8?B?SEVRNUV4ZXVUM3JBbGFxM3NXSTJPeU1sTTNCcVZvSmFZVXgyMDNwanA5UjFN?=
 =?utf-8?B?bWZ3ZjJoNndtY1hScENZeUp3TUIrU3dPd2FxQzhBam5qa25qNkVpcWRCRXdH?=
 =?utf-8?B?cmNleU90K1dKYksvSGlETzNpenlGNzJDUG1aU3VIMjNlNVl5SDF0M0ZuVzBl?=
 =?utf-8?B?bS8vNk1uUVBDd1VvZWZESWN2cEtUUXEzUHFveHR0OHZaajQvdFJvenQxSE1C?=
 =?utf-8?B?S0tEZWM2dXd4S002NzNoeEFVWFNacnNOTkJ0bXZHK0N2SzFIL3RuRWpOR0t6?=
 =?utf-8?B?YW1MS3B5UmdnUm5DLzhvM1lvMzJMN2xWU2JSZjEyNHphWTNqa0kwMEpnMWkv?=
 =?utf-8?B?U2l5UHlHRVJwdnFsT0hGTkNGSXl0R1VTa1UzUVdIanRJeXFHSDNsQUp4Rnho?=
 =?utf-8?B?aHVXTGhNSGxoQWlzYjR3UHhQVVdvWkJ4cXV6eG4wV3FZWGhWamp6QUJnMkVq?=
 =?utf-8?B?RFJXOXI0L3JNcGFGcVJ5d0h4b3RBUitqOGtmZC90NDFjQ3J0Vys2OTlGZGlm?=
 =?utf-8?B?NGo5Vm9IaGlZOXdtakZoVXR6VDFHRlJBRVJvQmNnUFlTWTJnNERGbTB5L3g0?=
 =?utf-8?B?ZVZpbkVEQ3hQUENBOUQ1bENDMFE4Q0JrSGFHRlU4T2p0RkNuVG95L1VnMjNz?=
 =?utf-8?B?eWMwNHBUcWtSdlo1R1Z6WlJuNmV3R21ncjFhclJjcVBBazFHTmZnRWtLRnZa?=
 =?utf-8?B?OTJGNWcyNys4UWVhbzAxb3U3RTRFN0MweE1RNWIzYys1OElnMzBEQU1lN0t3?=
 =?utf-8?B?anRHWXZzQ3UyNzB2cWU4SVNmTmRsUC9paTFXUUt1YXNqdzhwZGRJb0tSbG5M?=
 =?utf-8?B?MitPQnoyOHJsekUvTGJuRTh0VUlNRnVya1ZVdUJrc1BSUWlWdnNoRTk3LzM2?=
 =?utf-8?B?VlFUOFBVODF0RHByZnliK2xiY3V6MlY2bnhYWUlLTTE0MzYyNUx1WW1DMSsy?=
 =?utf-8?B?cmJ1RjY3TXFQZXgxTTVSdHEwYTVWcG5NZmRkLzJ2cmFmS3lsa0hVSEFTNTIx?=
 =?utf-8?B?OHIzQnYzM1RQR1dLMlFvaWkzT2ZKc1poZ1JKZnZ0clFnZ3FpRGlYZnlNWnpQ?=
 =?utf-8?B?bCt5cTRYOVN3cGNlcU52Y1MzcUFiYlcvMFFtY3I0VDdWb240VG1iUjBVd3RL?=
 =?utf-8?Q?KZPtcVkddK3EayraactmuJbQGtFunmLoWa5Cn7s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5280d181-2812-4312-3184-08d90f9c22be
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 08:02:32.3373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0K9z4pzVOWwvy1bXqo6Zkj2y57Q24k2lv1DJ7ANweDxwFOKBOwi1t4Unpm37LQEIUVVnIrx74vjHoquUP27W47vi/OQfjih3N6BRVdXeU4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.14.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

Kindly remind. Didn't you forget? I'm responsible for these two tests, let me know if you don't have time, and I'll resend this series :)

29.03.2021 16:26, Max Reitz wrote:
> Hi,
> 
> When reviewing Vladimir’s new addition to tests/, I noticed that 297 so
> far does not cover named tests.  That isn’t so good.
> 
> This series makes it cover them, and because tests/ is rather sparse at
> this point, I decided to also fix up the two tests in there that don’t
> pass pylint’s scrutiny yet.  I think it would be nice if we could keep
> all of tests/ clean.
> 
> 
> Max Reitz (4):
>    iotests/297: Drop 169 and 199 from the skip list
>    migrate-bitmaps-postcopy-test: Fix pylint warnings
>    migrate-bitmaps-test: Fix pylint warnings
>    iotests/297: Cover tests/
> 
>   tests/qemu-iotests/297                        |  7 ++--
>   .../tests/migrate-bitmaps-postcopy-test       |  3 ++
>   tests/qemu-iotests/tests/migrate-bitmaps-test | 38 ++++++++++---------
>   3 files changed, 27 insertions(+), 21 deletions(-)
> 


-- 
Best regards,
Vladimir

