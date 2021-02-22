Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB63221B3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 22:44:56 +0100 (CET)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEJ0h-0004dK-Ip
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 16:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lEIyo-0003bS-0J; Mon, 22 Feb 2021 16:42:58 -0500
Received: from mail-eopbgr10094.outbound.protection.outlook.com
 ([40.107.1.94]:45632 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lEIye-0006Fa-NL; Mon, 22 Feb 2021 16:42:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3eazzmSyuXMt5Hg9Pq/WKvLEfmdkMBBheh/Vh/4ADL+q8VDQyHATQ58o1COUIYBgeuRwh5Cxiobdo5FVaFjDS7hmTLmyCUbGQKstgqgRzYzpxArCRWMV2lz/7DtscjDdqFI9AHdv4eaxRI5LUdjMH7Xf7obemW1aFK2533xqdJdqKgbnXqkv+bvc4OATlTSafJioFf5xbJwnomh3GksuqxA3QOXNrBqOKlV3gH7y3/EcMaKbwd8gJXCVMA09mA7JAtrJEDX7/RbgvyWun+ve+MEjV97ebegYHuu3ScHdJBr1CZSBBdAkA8lzezhQSe/WTtPMNYk15Q9hhj58L9huA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fesnwfe/VOktXh7pTcEf73gWNgVY5uA1pK5DwTeh4U0=;
 b=O79o4Ht9CNrepi/y3AmY1/f+pOEwYANUQVDD+deDyRwCzk5LmsjrcKLMhlzp6ziTygmJeIimdXgsp81t8WoBWk99XqfrWEWxomR0k2aDa6ENgbj+5Jl6Kf5wjoEavS71j7lfUdQMGoA3Ly5ardp3Z85UIfSBvFVZkcFSvYpl2Bbti8+5EdbhVyBDqFaSInyd3FKVwiXYPVKijjfUWeUDVgN9Vwr2QCP3YlP/hrKWaI7RbKpNeoQ0tbmzsLoONN6fncqf7q0E7VVA0kpEZEsd+tHsDn5uYbHPs7DO7fiB4UWS1H3OJAbeXtbjwectvIGvYoby2Kl85El4YwXlemHg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fesnwfe/VOktXh7pTcEf73gWNgVY5uA1pK5DwTeh4U0=;
 b=i05NR05PigX1QGAsHo7gBqYD5nLd/JPp72ooCoVM2FCtao8qwtXRCYTRY/X9V2QdFfumZe8MxZN5g8TrdfxarI39aHfUjUcjuHb74Cx9PiqE03JXUZ5M589OMc2du5fAkybH1UE9JRk09qFeQdWR8NigU7qtXg1UeYNAvsicN2s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3894.eurprd08.prod.outlook.com (2603:10a6:20b:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Mon, 22 Feb
 2021 21:42:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 21:42:44 +0000
Subject: Re: What prevents discarding a cluster during rewrite?
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu block <qemu-block@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>
References: <198596cd-4867-3da5-cd8f-68c1c570a52b@virtuozzo.com>
Message-ID: <21d6f4e3-1512-50b3-d2a0-7969a49f18bb@virtuozzo.com>
Date: Tue, 23 Feb 2021 00:42:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <198596cd-4867-3da5-cd8f-68c1c570a52b@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.196]
X-ClientProxiedBy: AM3PR07CA0075.eurprd07.prod.outlook.com
 (2603:10a6:207:4::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.196) by
 AM3PR07CA0075.eurprd07.prod.outlook.com (2603:10a6:207:4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.11 via Frontend Transport; Mon, 22 Feb 2021 21:42:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4cda102-69f5-480a-9236-08d8d77ac9b3
X-MS-TrafficTypeDiagnostic: AM6PR08MB3894:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3894584614502484BA473E8AC1819@AM6PR08MB3894.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TVP/2TmKuPrEX/gNAOB7vjsvxV3qwwtHY75jwGxXxZ7KKwdFQGyRKWfOP8akUumG2TJuXZ98y2rEurarzwEIR9hxaXp2m1rwESbqBYRvkIqpqZZCBPh67RgFslIqlhH30S2+abh9w+c4WdHbcmjcm5JyTHBABVvSkYFP5BDXYiKBK8cnyVQJr8TKpe31xQNZEUoLYjJ4PAcPSObd+RDM25aufuf1miPH1vHV7oJ57oHJ03luqOixGUe4dt5IsYvHyzpaJwFs8voXiYHO/fLEPES5CwPKlf3NyeiWRGb5Jmdr6tNDpjPZaIF2wZ5+I0iGijOAN1LhQbNFayCgrUrzuPK21gPNaNjIV9nZVyFlncczyWVRKD1bHYpTyr/+Egdz5PHk1eMVPGCzeAarSgVbyuPrqafhmohYnlGsoaFt3vjzxAyYZpFZ5UETykK4jxwr9TK01cPJ3Ui+VXyuq3EGKGDfETprzdOMUGdcE3iLUtKRK1a84fa+v4UkMZOZ6CDAwZfGw0tzVPtvEsmZMx2s40V0AGndjDWcwy/YpUFFVr5jRxNiF8O4nOfT8ICszqnVdY9S8jU869vpi5oaYLzs1X6lrBPYcotAaDnNrc8ZnW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(376002)(136003)(346002)(52116002)(478600001)(2906002)(26005)(6916009)(31696002)(16526019)(186003)(6486002)(4744005)(54906003)(5660300002)(16576012)(956004)(36756003)(86362001)(2616005)(66946007)(66476007)(66556008)(31686004)(8676002)(4326008)(8936002)(316002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkdPNDEwQnQwWkVmTDE2aDNjWU1FOWNjOW1BV3lXWFdLMVp0T21hWWpDeVdQ?=
 =?utf-8?B?WmZWbzA2VG1EeWlxZGgrWHhxWTNyMEJ1b1JBQ1dXQ3F5b2ZwbUd3NmZnK1Fv?=
 =?utf-8?B?VmpUdzJGM0l1L3hRemlkQ2QzUGwwbFR0czJOOG9lUU8rdTMxYmNFZ0lCd2w4?=
 =?utf-8?B?UDNxdGxQK3UrWU04dXduRjJsQmdRVFBqMEpreG9vZHlEckcreGxJRkFVZStB?=
 =?utf-8?B?bWd0T1YwdUw1OWd2YWNGdkM3KzdJbmhXZ0NUcXVTVUNYS2svN1AwZkNoN3dF?=
 =?utf-8?B?N05jcHNIbzNObFhBM29SRmpML1JhbjA4YWVDRFh1eUtvRVdseHJOYnVmbi9N?=
 =?utf-8?B?eUtWelRWQUJScHJIUmxLTVVodno4L000VjJ1RE8vQW4vNUdObzdUdUdOSzlK?=
 =?utf-8?B?UzdLTW1BdGVmQmc4bzhndCtwQWc4WE11QldNeHNiUk8zU0dvMkl1M3ZRT0ZC?=
 =?utf-8?B?OGhmQXRIek1wdzJwazB2ZTBXZnNCU2xRYWJJOE9vdFB2TnBuZ1hFYXNWM09i?=
 =?utf-8?B?eFhKMjQxVnJIQytOZEpZaHhIS3pLMWVEaGVoU3kveW1FbXcweU81UC9tZVpK?=
 =?utf-8?B?OWh6N2l4UEhhdkcrejlGc3QrbUZrOFBjV1ZSeUdGV0FmL3k5eU8rNUNDYjgv?=
 =?utf-8?B?WjNlam9aTTA5T29wRVJEWmJMUEVOdXVtcTc5N2pDTUxXVW1SZnp1UUV4b2dq?=
 =?utf-8?B?UDlHQmx4NnJZcDZrbXFBb1JJS3VMMkZObjNlWnNGM2VXUjNXVXoxUkVEakJx?=
 =?utf-8?B?VnFIUXRteXE0RCt0N3ExK081Uk8ySXNhNkFQcDZYYVk2Q3ZjZEF4TGpKUERq?=
 =?utf-8?B?ZG84VVdQMGhhYUs4N1FGMHU5aTYxUk8yTGJwTEpBL0dRbmp4UTYvcmltanRu?=
 =?utf-8?B?aHoxUEY4WDNnYjd3bk03Vy9UNnFKd2xTeVd1OEZNdWhadjBXTjFnOVBzZy9E?=
 =?utf-8?B?am5Ic2NnUEVFbEN1WSsraXdiSmFXZVExeDR3QzZjRjJidFlKRERmY2dEc1k0?=
 =?utf-8?B?bnNReVlEL3doZTVGQlY4VG9MUXVtcFZwV1krRTc1dDB5ZldjMW9lby8zZElC?=
 =?utf-8?B?clUyQTkzc09CQlA4QXhuMWpOaGZ3MWpPbTdMc0hsb1YzNTFWVzVsL3F6TEJ0?=
 =?utf-8?B?RUtlR3hIMGJwbVB1bGdBUHUxUmhiaVZ2M1lDeHNoNytRWmdzQ25KQWUrRnVB?=
 =?utf-8?B?VWYvSjk3bElaUWJxemEvTHM4Q0hXWnBSZDc0TzF2WDRRcGtHZ2Q4aVlsYUdO?=
 =?utf-8?B?bUI0NVRBRStzVFVjM3FqMGFpVStGZW9NY0V1bUtjNmxZNzBVcEd1QkoyaFk5?=
 =?utf-8?B?WERZUWJhYnl6VENXdWJiTW8yVi8rVXV2UkVsZmo1bTFLMC9JL3p6b0xCaDFP?=
 =?utf-8?B?WHFOSi9tOG1mZEpzM1FuR2pVU2MrVGtnMGJ0MnZmVEFTemdmem1nQmhGMzVu?=
 =?utf-8?B?MUFPODJ3anE3ZGFhTFBHNHRlWkM3emx1M3Raa2VsNFB0bGhUZlJxa1NBRVUr?=
 =?utf-8?B?UVRjc0dtbS91TnFscXJGUHVLcUxhd0ZHM3BhbnMrT3lQMkY0UTRpcnlRYW9P?=
 =?utf-8?B?WldQQlg5bnVLT3JnNkttNDM1ckM0eklPcDk1MllyUTN4V1FEeGtVNVNacWUw?=
 =?utf-8?B?bGlmYlNTa0tHNlpreDE5SWdQMWswNTltRGFMaFFMVC9rMFBlbTRiTGc0amVk?=
 =?utf-8?B?ZFlVU3RqeklrL3A5THlLN3ZQQytSOXpTZlhQeG8yU0R4T2pLejZjMmJ1V2VL?=
 =?utf-8?Q?N/8Na5MA1PMB24iheTWKbI4NYTPP6HyNDhulS9X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cda102-69f5-480a-9236-08d8d77ac9b3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 21:42:44.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlik0QDuQ+B3WrekenFMDEw/srkO0YYDqwwFSM2/gkOQzkKMm1GtQFzaVx6DxqKI2n+sM/Z8ENvcUe4RuGvzNfGrYeBgPZerwxt/l6w4iDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3894
Received-SPF: pass client-ip=40.107.1.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

23.02.2021 00:30, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Thinking of how to prevent dereferencing to zero (and discard) of host cluster during flush of compressed cache (which I'm working on now), I have a question.. What prevents it for normal writes?
> 

I have no idea about why didn't it fail for years.. May be, I'm missing something?

I have idea of fixing: increase the refcount of host cluster before write to data_file (it's important to increase refacount in same s->lock critical section where we get host_offset) and dereference it after write.. It should help. Any thoughts?

-- 
Best regards,
Vladimir

