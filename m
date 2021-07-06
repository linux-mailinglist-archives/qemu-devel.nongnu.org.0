Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B933BD7CB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:27:25 +0200 (CEST)
Received: from localhost ([::1]:58798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0l6i-0006gT-Pb
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0kyS-0003w9-Ah; Tue, 06 Jul 2021 09:18:52 -0400
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:9824 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0kyQ-00089U-HX; Tue, 06 Jul 2021 09:18:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIeuNsKanA7g6byh6S+/MkElnjiogQyIPYYNax0xE6wMKYj0+t6zNZMTY7MLbSSt+sLoYW36CFjFTIx4gWAe4JuijRW7aOUae7awjk07CoCV6a/oQaK/OMvT06ZURnYJHh87LTiCSsTgMQ1+6chH3nxRYVO2jXQbu6JMFkW1TrJmPNBDo6hiG8YBNsc35H/sxrAWILedeXRRzK0Mp8S5G9bIqMdF5vAbzpOZdY4eBwjj4nSQsf/mvD7sxluRkV/ZKHKqRiK017rjAjHz24b9KeI4OCbX5PNFfkZdqTQyVtcXedQF+R5Yj4LUVH7wUajy2SWKnlYP66GUUlmqYCROsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Htk2zakRNvtiv6MLp79B8eu9hGaNmw6RzqzOpfF5WZU=;
 b=DUG31Oiyq0o4V9O1kzmM4vUwfWGJTnq03nXsDmagB7s9SWThGcyp0HcCR3ltf5HXgne4hOBKFQyXtxvDNtncHN7NWnRov66hy1rDpKgMDZdWtODb0bnjsTU7J1zv3Du1SgX9EmRQFTt2rnYuqbicy5++85QvuU42uaf3RDQuHhi36zdhOVpwmXjv4myWnEFYP5x/eFF5rwzaZGDYytxY0xdX3IwaGHZNpciVxFV6xCnMnjtreZ2eVS2oTRy7akRnq3NU4hvdWvOAGPcJtA51BT4yt7fxLepnbK/WkGTvn4V9y1R7jlDYvPOFcXPo6gWw5uqa3RMZ68j2MIwpjtmZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Htk2zakRNvtiv6MLp79B8eu9hGaNmw6RzqzOpfF5WZU=;
 b=YimMUQT1cACRRGapfK20LOEUWzyjxlFSxyg40yKNatPM7fsKlaKs4eSEmTl3jewRhBGWT5YXgzusVOaYwpbpWHOSBQnyqP6lVSMiOwQrLkSOSaA2l3K7kHVMXc/plZHlirn1dNT5sS0kV/ZsUghkmMs2R2bmHeNgxLYmrmDrcxc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:18:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 13:18:46 +0000
Subject: Re: [PATCH v5 2/6] block: Add bdrv_reopen_queue_free()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, berto@igalia.com, qemu-devel@nongnu.org
References: <20210706112340.223334-1-kwolf@redhat.com>
 <20210706112340.223334-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2dc2b2f2-1ed2-a904-28d2-ffd37b9d0079@virtuozzo.com>
Date: Tue, 6 Jul 2021 16:18:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112340.223334-3-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0092.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 13:18:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c3a2a24-6641-4f29-d2fd-08d9408095f3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631B41243FABA1A013D524CC11B9@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXYtRNmB7nrwe9tRjjGm9QAm/P4iR00WYPrgUg1jmThr3/1TbCXtK/dVtue08QAitA2luJ70pe1X/qOSio1/SG1BNsKPOkjmdS5lhJ02dv0aWEeq8EMdRN0G8ZV33sFudZIpEg2IBZN2RgQY5iwIjjEdMGs0D205ponXTi5/Oyfga1DvVChWciEShqCYxRhRdjaIu6OGEe5AhbipLh2T7osOsCJ4CHr+s42CHmbrH2sYjlVK/n+a4xrLnGBg2GJSRr3W0tVjGsM3E0ogdZ0XJsxXJekmM2OAwPt8PdwB/yJUwAEi8mcH/EGWPFmTKMM5Dcq/NHAnVkAAiev6dYf3XDdxGrh4NVucFrZiZzEr2UPW6ZsLFlnZHHDwo28SmokQwhaobnY3IscuRTS4XaXcNFyQuaI7yHxdMMwBRwlOszQT7NG7uo6zyw76d2dFG751ZkkhaSVfG1l3Dg5P1gTfi8S5IqlEvgrjIMDBmmdwQXchsBQam8YqfYTc7uBjhyR1UOys0XLYoAZhktungw0jpzZlx4u0clZolYxlGkfyzgVj8o34FF92jW2L58AAknTb/TgtQ1BtG/gSAmhIvYdSl7+k1ytbiE0O51jYtPB3tYe99SbQcPMvOns7Kzu5SbIQq7ugnlZu1tPeroVapxNyao9EVAZJqrbqJpAflqFF5emCIUeg0Swe2CtKN345tGIVEloBpVILGNwWqjJkUPbvjXlQ5k/7Q+5apMrd7wYbNswVA9tdikYMqAa5hQslknvzNYUyUnWypO3xfSxZYSiHag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(4744005)(956004)(38100700002)(5660300002)(8936002)(31686004)(86362001)(2616005)(38350700002)(186003)(6486002)(8676002)(316002)(66556008)(66476007)(83380400001)(66946007)(36756003)(4326008)(478600001)(16576012)(2906002)(52116002)(26005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEhHUDk3RXZUWTlOZzBTM1JYTXFRemN0cFQzNGJWSUZDbzZYRXpMT2dZem9X?=
 =?utf-8?B?d3JWLzJkZjBCQzJ4SngxL0VzdTUwTDBiVUpUT0tFMHJwNnRFYWJNNFBUbFhU?=
 =?utf-8?B?bXZ3ZUFVL3pJejZ4TWkvbWhsUVYrdnNjMzRUNzBSM2UvMlB6dE1BWmh0cjl3?=
 =?utf-8?B?YWIwS1RUeVhqRlVxKzF4ZmdxengvdTZ5T3VPL1NyL0lmN3VFVE85blRGeVJB?=
 =?utf-8?B?c1FyRXVaNUVLWUgzMzFxVDVySFMvcnEwUjBOTHY0QmlPelpiK0doSFphRGZ2?=
 =?utf-8?B?ZDFnYVkrY0NuSDB6TTlhY0JMYXQxVEJENzQ5ODNZaE1IWE1hRit3VjlCek43?=
 =?utf-8?B?dGdPWFZoVkZCdW5wOWVFRWgwWDY1a1poZkVveGJuMkJPenRrK2Q3YVY3Tmlr?=
 =?utf-8?B?M2syUy9NZzlBeVAvak1CNERoNkZQUC9EMVdhVzcwSjZWYXFQT3JhUjdkQVFC?=
 =?utf-8?B?b3pCTkt6WTU2U2tLenZjZFdZSjlNSTBISS83Ukx1ZTJPaUpUdGNoWjYxb1hY?=
 =?utf-8?B?bHlERkRiODhhRklYMmtoaUkrSUpXczFOY0VpUDhnelUwc3dsY1ZScFhlUmp2?=
 =?utf-8?B?d1pyRGp3alJ5bVZrMTA5blMzTzBHRjAvMlVBMHdtd0lxYnpTMHhOb2NkemZF?=
 =?utf-8?B?a3ZMRU9HS1MxR2w1SWhlQTJWWGcrTHZoK2VHNXc4S0YvOHd2V3B5NmI4dlVl?=
 =?utf-8?B?RXYwWTl6UzVoSHRYTGd3K3duMjNBZHZ3NENHN3VyRTZta0JLdGlkM2Ztakhw?=
 =?utf-8?B?RGNBNGdQMldwVGNnNnZzcjNDNCtFdUJJU25zYWJjZGFIcXFxL1hBQVc3ZlB5?=
 =?utf-8?B?cnJ4cHRNZkIydE90YmxMc2dJNEdyMExRQkxjNFh4cnVDQXRoU0ZsTzJpMTlX?=
 =?utf-8?B?Rnh4QlY2Nzh4aWxyQzBMcVZSeW1RU3AvZ29RcjlncDN1bkhiTThreHl6cEp1?=
 =?utf-8?B?bXFLWWFVYVFuNEEwa3JIN1VJR3UzbnhIUlp3NE96cXpJbDRNQlc4dm4vWlMv?=
 =?utf-8?B?b085VHpVQm1tK0tMWjhoa2RxK0tEemg5TG9MWVArSGtpanloVFJLSlpxdGtX?=
 =?utf-8?B?clNvdm8wbXc5UHhMVVVGbkRXWFRHQytwMGxvSzk1RG9rVU16VlFWNHRUSU5k?=
 =?utf-8?B?aGt1U003a2VIOFVIOWdkZU9WZFBkVEtLR1dtMnUwcGNaMG5XWFd4TDE3cDFy?=
 =?utf-8?B?VFc0TGxMQWZqOVVaUy84U1UvMTVzQjhPYjdKSDh6UXc0Zk1OclF3Z3diQmRa?=
 =?utf-8?B?UElsMTNyL3kvQVFQQzBLRm9NTXBkY3FzRkJLRFJGNFFEVE45UmZsYlkzNUdE?=
 =?utf-8?B?OTlvS0xkRzFJc0FjQ3ExYkF1T0lnKzJiblU5N1c4aFJJbGVoSENCU1M5Qjh4?=
 =?utf-8?B?ZXNNbm40MUFQUjJJRWh3aDVvenB4RE1GUHpwUExqT0tKRzNmemxYK0tQK2l5?=
 =?utf-8?B?R2h5Wlo0NkwwWWtad1AzcDVFdEtDM2F4MFVmMEdGS0h4NHBXWTJIWGZtRlRJ?=
 =?utf-8?B?a0dKa3JRcElGWHZiOHlEMjZNUTRTeG9Jb0pKSVRZT04xV1hHUmdYb3JwMkRi?=
 =?utf-8?B?WjZxZzYxZUNkcDdKTy9Pa3ZCZVBvUi9uSTk4S2V1d2xZdE9JQ1JzTk9IR3RQ?=
 =?utf-8?B?K1kwQnZPUkt0Sm4wcVVYV2tNNXZ5Mk4zVVJMbDZGMHFIclJPNUppc3BaVERo?=
 =?utf-8?B?TWJ5VmRLY1Vibnhsb094SWxvVVhweTlxSjhTRnZvODc3VXBhWTlKNFowVzBo?=
 =?utf-8?Q?dPWgDNjoetGzq7YAl9KzEvubE0dc+gastnt8WSI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3a2a24-6641-4f29-d2fd-08d9408095f3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:18:46.6068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WQUTBcyOJLPAcVIfvo67bGu/zeZ9B3EziuhNByQ7HoJaIEz46utPueC5XlPS54WyAqPaUttRGgs8N/UChK/13kcc0JjCEdESKKG5CnVWDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.20.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

06.07.2021 14:23, Kevin Wolf wrote:
> From: Alberto Garcia<berto@igalia.com>
> 
> Move the code to free a BlockReopenQueue to a separate function.
> It will be used in a subsequent patch.
> 
> [ kwolf: Also free explicit_options and options, and explicitly
>    qobject_ref() the value when it continues to be used. This avoids
>    memory leaks as we saw them in two recent patches. ]

Hmm, not clear from the context which two patches you mean

> 
> Signed-off-by: Alberto Garcia<berto@igalia.com>
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

