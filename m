Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7068E2FE637
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:21:22 +0100 (CET)
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2W9Z-00007U-1Z
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2W7t-0007zh-DG; Thu, 21 Jan 2021 04:19:37 -0500
Received: from mail-eopbgr60135.outbound.protection.outlook.com
 ([40.107.6.135]:64918 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2W7q-000839-Ip; Thu, 21 Jan 2021 04:19:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0uooNJT1r7C3U8QPW6yrv0QZHGXYGs5Skyd6vEyQBf5ygF9yw5Mzpzks8yeU+OgO2ezW4PBQD0lZ2wTPVvfnPaOI82p+rtAC+6GL47N0yS7DJXXHlZBFN4GSO1jl+pdzJomHa8F3gjNFS2auj3cShROBldDpWPpbGUd5rtvVXAX90DTX4ovXdBeTKyVjCJ1fvrJ+1TC0ZcBu9fkHxrr66HxiGZh8d5fo1SemWdmnMuub1Alp84XMess2R2wLFRqZiNV6BlSyrMwiz4hgPTkWUV/M09mrZzBT+LbI31H01KQxOMuGI4r6UCq6YibUrWxhj5rzE9itSMMiA8Lg12BCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7pnFIi+bZB68wGnZjMIoP0dIZCNzwBWzCUQXrfGps0=;
 b=U7f5C1SUwBLEC9V5SScE5w+GQfOGKKJNbwsWXb0WO/BEZIq1z02zvKDBHI3M4Eg7Va4esr6Xw2UcybS7YNcEL13FKy6HhbmYGddLG3WxbqWi/UR4AuEnEZki8mzIYuwaubH6o1cA017yymLuLIBMWl8ZJvaVjLkr8CDRxXt0rGpXWT65xzqpGoWEVHLZJ1TgOOXOu+gj1ZYXh/dhR8pOxQB8lpuj+336rQnfNyuydyO4zdpQmtjQoxaH31mjdUCMv2Hee875jQZwz5PoI0yWVuk83JNUDKAw6LAIR+Xn43j3Y9wk35ldIhn47AaB4dynOXxEMUVz+DbY1tcPsV68sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7pnFIi+bZB68wGnZjMIoP0dIZCNzwBWzCUQXrfGps0=;
 b=WqcXMmdWn52kyeJ8dr9lj02v//mxqQwdpCD8E0aawEEQy2HsWm9gT8dkND2J2pyFj0rhXQyLx5fCRo4boZLF1lvo1ad3Mm8hzyPnpr2oJdl7S3qW+a7DSes6hmGvBe8Eo4OH3aLeOjlX/7xnu7lMBfdtbQQfCXBiBk8RBZNjTvM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 09:19:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 09:19:29 +0000
Subject: Re: [PULL 10/13] iotests: define group in each iotest
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210121023657.1186241-1-eblake@redhat.com>
 <20210121023657.1186241-11-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20edc700-b74d-2a00-0735-42a48963942a@virtuozzo.com>
Date: Thu, 21 Jan 2021 12:19:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210121023657.1186241-11-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR06CA0084.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR06CA0084.eurprd06.prod.outlook.com (2603:10a6:208:fa::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 09:19:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1649c9ea-970f-465b-90f4-08d8bdeda7ad
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6069B3C994B988593A231309C1A10@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sd4URG+04PGBCBjzr3RuQtK+WNj05Gbx4Ql+V5PtpyWIRTiWhd2LwYRzVoUbsHj0ql1fRzQIwU+JNe5Q0gYuHFFb1ZphBytlypJm2sJRh3II79MU3KiMz97i/aknCrPiZvh/AzI9bZ8B4gxIJgCrfdx6XTiQ5kRAAUqJe8+kVWrD4NGlQ/3Ut7SSp6ov/e0vqzf8vn5fxFdPUZhdd7vg5svwpUTP0WzQH+l3jQ+65uFFo2G2bHZYs7gJz+IhvI5LgFi4ayWTO4WV+G7GysZOwjy/aKOpXC4yAFzqVogHxilj7wMErj0jA2kpvHtyU+GksOu7V5vQKK+eH3ddjQdnxzOayHaBnGGneaF3SwKs78QHkXGeEyXn7KXyFKC1DQi3ULrnWvtpbWCHHcK30KCm7n4oa5y8X8nsq252/c+0JpAa2kA9mBt3YAQz1l/0pQpFVxj3otXAjAhg7JgLxpF+51UzOv2GIiCKw+JV56E6nDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(366004)(346002)(396003)(6486002)(86362001)(316002)(2906002)(26005)(4326008)(66946007)(5660300002)(8936002)(31686004)(66556008)(54906003)(66476007)(478600001)(8676002)(16526019)(52116002)(36756003)(83380400001)(16576012)(956004)(2616005)(186003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dE8wcUk1NnBqcTM2VUJjVjE0M1BLOG8rK2k1c0NpdUpvSEd6OGdBdWJYNWVC?=
 =?utf-8?B?VWk3ZEtzOUhBcXQ4TmZzSlBsbHUrckx3UjNCMnZ3dTB1TTdLckhMSkxTL2lT?=
 =?utf-8?B?c2YrVE5Ob2VMWVZFcUpqUnhCWEZZcUI2ME5oWWJEeFp5T3ZWN1ZOWXZsbndt?=
 =?utf-8?B?YXRWbVlxalZ1YWMrODEybjFKWCtMWTVIcW1ZQWRURkJjM2dvTzljc0tsQUZE?=
 =?utf-8?B?RXRlL3ZHWHl3ZVlSeHlHYkFlejdTemNVdkVhN1Nya1JLbVN0Y0tzYk0xZzZS?=
 =?utf-8?B?WmJKa1BPVEVXdUJadjByUkVDRFRqSmFncFczUmlUSWQ4VU1tSGFqMnJIMnJP?=
 =?utf-8?B?STgxYzlLOWJ5Y0NaMGxzYVZJTTR1SUE1dkF1NlhmSDFQR1pGc3I0T285Smdn?=
 =?utf-8?B?cUxTcjg5bW9aR2RhYmpMc1ErN1dRUFVaazlyQVB5dzMxTWhFZnVPWE91SGRu?=
 =?utf-8?B?RjlsUitSa09FTU9ER3gxK2dob0xTSk5tTmk5WVN3Ny8zbmU3TW1PZEVBRkpr?=
 =?utf-8?B?aVRwaTc0cjhZWFlIZjI1ZDBTSUNtWlliZXUxczhkYkU3UlNEbjVYTFF3N3RM?=
 =?utf-8?B?K29xaHhZYXJSbE5qK0F1OTV1ZU1SQ2NQTjF6WU5wZ1E4M2pIYW90citmY2Uv?=
 =?utf-8?B?REpGeTF5VVhVL0IyT1FOL1IxcFI4SHB1Z09TSHh2Y2c5OU11UmJmMm5kUnZh?=
 =?utf-8?B?M1ZMTEdrMmpGVkZiMWgwYWdPdTd5SjRQUDhzU0UxR0k4NDhyR28vSkNiQVI2?=
 =?utf-8?B?dXZyQnBoOGdmdHA0dHVXMjBUdno3UnZucW43M1lwQnJmR0FZaGRGSi9kcFY4?=
 =?utf-8?B?alVjNkpHR201SGhZMEFhQ0ErNEhBanJVTElPN3d3RlVjY3cxR3Y2Q29PdFpk?=
 =?utf-8?B?K3I4RHhmMTNGNDFhUXgvMWpqVXVtd3dhUW0rYWtZOVBJekZIR2JIMldRR1pV?=
 =?utf-8?B?K21ZZlpzOEZVdVZKUFlvRjM5TnBVMHdsRzJKQnBhTm9CVnA3MDFPOVRnUlJX?=
 =?utf-8?B?NE82MHkyNFhlNVB0QnlEdjRkQWRJY0dXcW03R3VzWCtTTmdmREVwNmVCczJ0?=
 =?utf-8?B?cUgzY1BuNHZlYmJDeVd4VFRmaWJacjV5cVFrSUJmTU1TN2R3MkEwRk8rZzU0?=
 =?utf-8?B?NTIwOTZ4NjZUZC9Na1JZa1NLSUR0bDFJdDhPZTQ2VDcyR1hyNjNhOEpIeGk4?=
 =?utf-8?B?Nk9BbFlPSnI5THA3ZURjVUZTSWxQQ3lWWkFGRUF0MW0yN1BBZjRuNUNYUnZI?=
 =?utf-8?B?aFBTWUZYR0x1ZmNZcnFkZnZwQUlCMW4yR2ZLVjRwbGROVnBhOHRNbDdadFI2?=
 =?utf-8?Q?9QqFgk9M4xEps0pH5sf65SXjNpl8B1cOVY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1649c9ea-970f-465b-90f4-08d8bdeda7ad
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 09:19:29.3010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLw1oU5yahW3GFbiK+alprtwOR1Y1XtZgjwMQ2iDNcDTKGeEMYDt+heggCbgRwXQCqHzsbXZq62zxsVskzFaHROWAIfo2CPBpf4bQeZUjLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.6.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 05:36, Eric Blake wrote:
> From: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> 
> We are going to drop group file. Define group in tests as a preparatory
> step.
> 
> The patch is generated by
> 
>      cd tests/qemu-iotests
> 
>      grep '^[0-9]\{3\} ' group | while read line; do
>          file=$(awk '{print $1}' <<< "$line");
>          groups=$(sed -e 's/^... //' <<< "$line");
>          awk "NR==2{print \"# group: $groups\"}1" $file > tmp;
>          cat tmp > $file;
>      done
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake<eblake@redhat.com>
> Message-Id:<20210116134424.82867-7-vsementsov@virtuozzo.com>
> Signed-off-by: Eric Blake<eblake@redhat.com>

Hmm. I think this patch should go together with the main series about refactoring iotests/check, not with preparation fixes. Otherwise we'll diverge if more tests will come in a mean time (or any change in group file). And just for good history, better keep this patch close to dropping of group file.


-- 
Best regards,
Vladimir

