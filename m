Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811C2E0CD0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 16:37:38 +0100 (CET)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krjjF-0005zM-4f
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 10:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krjhj-0005TW-8E; Tue, 22 Dec 2020 10:36:03 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:56367 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krjhf-0005fb-JO; Tue, 22 Dec 2020 10:36:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dh55Z6O3njtIJyMQ2FGuZSHEae/VNegVrCpUwUcHPYxkCSMuNo+JOs529QX8mNVvvY3CBty1nWSMmqaja9krFYy2/zMgfkME+CpfhcD/cMx9ry32MXZbVUWszLpgGnmBU9ig62h625pOx0wPtz0/4D3iJHPa4gw25kLS88V4ckNLg4CZndePDj2fcwoq+C3XCuTn4T9HJBJLTJ68yTm6QYqgSmLwerF9QuJGV54pXA8YGwEFeocK4vWCoXApUqZbinsTwkIO2ldK/+qNDxLHnEI4glgS/uNrajl87bU9Att3/pkGfPBc4wec2e65WncukI1uqUroB3xMTRkDB4pqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF76HMNjW1NAu+EaDdKyXpBTXYbTag5ue6eqbAqzZn4=;
 b=S6jN/egj9wOubFhgsrWcRw6IAPd+H7hqhZgrmqaMIrPvwuqnvKNOnVxOrAd+Pb4CPHrsPgabbRXyCWZV6M8xQHkz+ZSIfnz/EU9oVySUNS5nJdSxtDpg95kjoDmWrDEq7BNoFkYQqtyjhFydZbo7Y3Sugsu2+UKrRQK72YiEWTAc+GLhKIYjGaj63CmIutoIFAd8h6i7hX54L/7uMKKsJZQOmeyBkjmaGhzdF3FzzgWUoSgO+nKH8NJ6GcnVNP3o3L3oz00lMAhyBNjOGsYhxUTOMzlS8//kZ9zLvi2/bYCkFnLi0Y0pVAaXOyBC+P/JrCtH55fgsasxBZBD25EFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF76HMNjW1NAu+EaDdKyXpBTXYbTag5ue6eqbAqzZn4=;
 b=eF5XueD7wo0wZosZGhhtLqNjg68TcIvz+PYgX/nGLp0edieQ414mQPKHbf346FAq2dFYRzFTfxZxiKb9TMYRYbys6KKenqyRPnA1419F095C1CqyVlnJqBiPD6Xd1YWwNkN0r+3z5M7QrSjnr9vIzJ6hoyQ1UwUZjkQHZ0wxy78=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:ee::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 15:35:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 15:35:55 +0000
Subject: Re: [PATCH] iotests: fix _check_o_direct
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201218182012.47607-1-vsementsov@virtuozzo.com>
 <a5f2a6a0-3638-9bb9-8b54-15a8acc3dc78@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c5191bfb-3f9f-efc4-69d5-83a0b67d5338@virtuozzo.com>
Date: Tue, 22 Dec 2020 18:35:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <a5f2a6a0-3638-9bb9-8b54-15a8acc3dc78@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 22 Dec 2020 15:35:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d0ad8ba-e2c2-4dfc-a238-08d8a68f45e7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4949:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4949211926A2074B3A70CA0CC1DF0@AM6PR08MB4949.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ws2Vi9+Dz8hcI/sG6oRUTjOpc2InGslV2sPOwyrLmCistsM8dVJrjnABZGVKphjBzz2DaQpyIKlnsqUla2S6N7RnQzGilNVXWzhMuKAwo41LNfsvn501RJE34LuUHWvUk/5YtbkofJKbg1NcwN4g7AkoEL1w41M6iVQv1RiXWySbgOHF98pffoEtfHWt+pJHZbs6uvzvnyptJZeClMF/2jKqU1bIYyTSaHCMTH4IQNo0EcYOyrfg0Xby/+MOtgfRptZZzocyS64rwAKRkWLS6801mEeVQaP8CLgnwjXmEJxeRB79Jo8xfx/FWoQ+5fd+WYa6+ml0HnEAacsbh22CzybgC/8xiSuvms1A6i86NmAXqiXVbcRFtf/H+aVvZ5gZ2BKSotmin4Mxeh2NJEn++JlpDHAlvHjQt2BW3PtUSkU+NBhhd9Ii7N0mVOvEeYHYjclWZBh8BGkw350ltDL27y5hGI4P/nSjQqajAJpIyLVFo9HV0Pd4mLsxP+vHmuJLKxN0iAf7uWEnfH6yog/vj1cbW4FAq8DAUZNs0vurVhfNZOcXaw6xR+jhBpfRkWbMNa3Sfz5pM6FlkffKzOi5uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39840400004)(4744005)(8936002)(6486002)(53546011)(26005)(2906002)(4326008)(8676002)(52116002)(31686004)(966005)(478600001)(86362001)(31696002)(83380400001)(5660300002)(16526019)(186003)(316002)(66556008)(16576012)(956004)(2616005)(66946007)(66476007)(36756003)(33290500001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHhZL3JqZXZDKzRHWTFsOU01WWo5UVlOdnZUdmJMV0JwVG0rR3BZMGcxZDAr?=
 =?utf-8?B?QnQvTjJVdzdvdU04ZlpHVnJjaEV5NGwxeTI4cTVxMFdNSVF4VDBiSFVQSE9m?=
 =?utf-8?B?YXZqOFIzUUxuZ0kySWhhcjgxNmxQaXJqekdEb25ZdE4wSHcwYlJwaGxzazRF?=
 =?utf-8?B?dFpnZzBmQVhRMkRHalpJUmxxZ2N5UHF2RFRUdnRiLzB0eWpCWEh1eHk5K3pP?=
 =?utf-8?B?WEY5TkVMaFVGY3JRR0pha0M3WVpuMXFmdFE5eUtGcWRHMExwbm9ocW8rVGpU?=
 =?utf-8?B?SGtpbHBvUHlLRGUxVWV3eW1HcUM4WWh1VFVITkJyVWNQNE9JNW9wV2p4cWJa?=
 =?utf-8?B?dTNUOUxkTDdYMVlrcmRaZmE4UWpSUGJVZnFvZVZ5MU40OFVnL0RCandiWnJw?=
 =?utf-8?B?d09jM0lKRHVDRjdQSFVHZHR0WGhBZ250R1l2UUF6aG4rU3dUYklkNC9iZE5k?=
 =?utf-8?B?Sk8yVkYrMmMyamh4cWFmY2ZDelJUa2g3Nzl3SDMrelBVZkpNZERpa09FMjlV?=
 =?utf-8?B?MFdkVStPa2Z0V2l5Z2c4aFlxWjVHa1BBMTNkUy84WEpNbmYxYkZBSFAyV0lH?=
 =?utf-8?B?alg4YmVXUjgzZGs5YitRVk1qQzc0dHVuTEIvSGJLamErOU9UWFUxRGtSZ3R3?=
 =?utf-8?B?TVE0ZlJycFg2T1RjY01pNEp1cGw1ejNCdEZaTCtIeHBuNFpkSTdZaGtPM1Zv?=
 =?utf-8?B?QVNBeVZtekhiQWYrMnUvMlE0NnBjRWNSamN0Sk1mWkZIVWxkenlkT2I5Y2tm?=
 =?utf-8?B?WVBhTXBXWmg0TGh2K0tQUWF1UmdlZFBlRFI2a043cWFGNWI4aHZtbHpaRXdh?=
 =?utf-8?B?QnFwcVdsV0ZoWUg0R2RnMzhHVzE3RmZndFRNcHh6N2NwSFFKUGdLV3h6ZnhD?=
 =?utf-8?B?a3FCK2I5NVhYWEdxRUF4dS9CbEsyMy9EWmJucUxhTjNvUy9ycld0MlNQeDFV?=
 =?utf-8?B?TjR2NEhNUDVCUFEwdmJ2VkVMb3BLVGFNNkJNTHhGbW9Ha3UveldSaC9KUldD?=
 =?utf-8?B?REM3N0JlVmRCZ2NNM3I5R2R6Vnh4NGY3WGp6SndBdXE0QmMxdEhEbmRYSk0r?=
 =?utf-8?B?K3VFYnF5ckVCejdNeXN4d2tINDZyZHJWdTdPMDFpeXVDeVcwQWlCdkJnbTVV?=
 =?utf-8?B?eisyTklYN1NnSHpsOG1VVWw4MGJ0YTl3UkNJZ0dTcVB4bXJxTmkxMTA5QUVE?=
 =?utf-8?B?KzJWNVVVMjB4d1lwUm1xQzhRMEN6bXMxZWFpQnZzYzltNk1OZkgvL1dUejU2?=
 =?utf-8?B?a2VmdXlLYkYzWW8zVDNiczlZanB4QmJZaUl3V0VSeTFBVkNtdThQM0cvbkpM?=
 =?utf-8?Q?B2cCwMx6W50+obC7irMhU2utak8BHQHA2L?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 15:35:55.5321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0ad8ba-e2c2-4dfc-a238-08d8a68f45e7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PY4kX7LEHdzkPcpUd2dsRwYead1W7EXzs0gybPN5MiS6j4/b/dNtzTOQ4p9QVSwKSCw1gA8KOSnEBK9cuTsgZkwXAh54ZRM8P6ANisBYO2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.12.2020 18:15, Max Reitz wrote:
> On 18.12.20 19:20, Vladimir Sementsov-Ogievskiy wrote:
>> Unfortunately commit "iotests: handle tmpfs" break running iotests
>> with -nbd -nocache, as _check_o_direct tries to create
>> $TEST_IMG.test_o_direct, but in case of nbd TEST_IMG is smothing like

s/smothing/something/ , sorry.

>> nbd+unix:///... , and test fails with message
>>
>>    qemu-img: nbd+unix:///?socket[...]test_o_direct: Protocol driver
>>      'nbd' does not support image creation, and opening the image
>>      failed: Failed to connect to '/tmp/tmp.[...]/nbd/test_o_direct': No
>>      such file or directory
>>
>> Use TEST_DIR instead.
>>
>> Fixes: cfdca2b9f9d4ca26bb2b2dfe8de3149092e39170
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/common.rc | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> Thanks, applied to my block branch:
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
> 

Thanks!

-- 
Best regards,
Vladimir

