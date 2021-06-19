Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F43AD9E7
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 14:04:17 +0200 (CEST)
Received: from localhost ([::1]:42846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luZhw-0007Nj-0L
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 08:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luZgQ-0005dl-Mr; Sat, 19 Jun 2021 08:02:43 -0400
Received: from mail-eopbgr10096.outbound.protection.outlook.com
 ([40.107.1.96]:44289 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luZgM-0001G4-3B; Sat, 19 Jun 2021 08:02:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDhd1LxydT1k/t26pYvGiLSIm3ZZiuh9tV9brz86SNjYLVVyAPyOdBpeQJCs/J7CjK52+nI+w5706m9V5irZm+dKdS5iAmnG2pSyk9dfAo3KP+eBH05MnwJNYm+Xpm8Nb2C9It65eWJ4PXVVhZni9oBNGz+lc49jm4MPBpg54AnrYNgSJT3D9m7JyAtFuxOk+va2+rkaZ6KKc5AicL4NnsU5tUOMw429rfRyQ7qiCKbOZYpB6o3C4XbFENqayqzbybiyzTv0OaqTZzGpWaQ+oC1WYemh/iHo0wbxxdJ25l/tB0afkLdZaYtK8Y2kkW32ww2obdyR6thmdImmyEzDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDAo2iXmB/Jjz0b06FQxwPHLJNQW7USw7FyecUkG+PM=;
 b=IY7oESru/Ir43n5berCZWYbVCLHjMvRMRjUYmAzg7SOKZvW7fIHCalubQC4xSRZh0rk269MMynypJnf7JQoor2gujCCR2EaKjP7QEZDn8wucnUFmnA3hkcHHJ1umUgOaYPsRTuOFxFPJfCqNwRMZmzVPPO0oQrh+lxrkXvOmWboi2OXHIYzmlkQQdINUj7NiCStnPzU4ulNDSoYcB2pttSWVmDtZ0kSvdg3+Dmg+gSgGo7dMBOuTmkXLTNVux7H7Be9Olbiz86x9v0uXjo53ooGVqMz8VaMZpbNkNI7zygiC27hU9SSZwj5bfysjb/z6ldmrqsdT/DJJxlXbGOwNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDAo2iXmB/Jjz0b06FQxwPHLJNQW7USw7FyecUkG+PM=;
 b=PyD9TdNXt1mGERQdjZoGrqtTw6f0BUyiHKDNPa/V9YMTOvoPdDEYU37RmaD2D24iQV+lMon3PDGYFgBxIRmr5lksrxDdSNjUddFYETmf/R43ejB+NglfmVZda10601+UBFaZzFPF+0Ll3yYD/61PDydxfMjQ4ca9qG7ua0z+Vfk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Sat, 19 Jun
 2021 12:02:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 12:02:33 +0000
Subject: Re: [PATCH v3 4/5] progressmeter: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614081130.22134-1-eesposit@redhat.com>
 <20210614081130.22134-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f8383a25-0c6e-a453-1bbf-4d7815e64802@virtuozzo.com>
Date: Sat, 19 Jun 2021 15:02:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614081130.22134-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Sat, 19 Jun 2021 12:02:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5d34862-8fd4-439c-405e-08d9331a1f05
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-Microsoft-Antispam-PRVS: <AM6PR08MB40237150AD073CE4C836614FC10C9@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D6i/UEZ5Gf5KiqPndll9wq6iSKhl08SnnkYPyHAi7hky51v5lB9GCHoqaN9LRMsPirguRrm9+jKqgt8h0ShF2yXacsGxs/2nXZ9NeAwsRg8xtjbcxXidfJQ3OCcVbSrNx6asP3NpTc8Xdqp+eZqjrEitdzoHETjNAZQvJfyeZUM8c/DDbPhxgH7yWGYNRRr4En34gnZiY/BbGBO3+kiIaIUCGnAHTgGR2GSEkJ2+87tWVUTLgtscd9FWf5W8QIbyfPtFNY839woFivRNKQ23cEMSBzSpnn3yN0TZnOktlvtriqyZXTHnUAl0ul954kK1ODyoBjSZn3zIRJCkMTAJRkqBCc4/Wwq+poyZHWqh3/93LlSTAGATRvZL1h5Hn5ARf13hAf45YCQtyXGDf+8iFEAkySbsv/jMSwI67+hJHBJ8uBxLui9q6o3ZLT2LTLvCsbUDTtsKDyOGu6wlQGB+TcuLaNXjUcolr1S8sucwJJ1jroW/LfJOktRUhL8DqWkvXdoJYrGyOhUA6SRfXDV1pWnCf6HiGDJY0hvvTSfr1y2bda9+yxmzT8YusCyhms8sS4w4w8wmMN4GcY3rK81wfXc3O7/7UX6aDqXlah1SKFrGW4epMfcQJwZURbKt5J8q+2GgSTjc0WzqPbqjfMcGnOlgY/B6b32zyEjSB80J4YiJYZDrQbXnc2O7A9Qw9ubwUDoaKv7EqKt8g+GQOl6g51g4suqHM6e38o4bDs3JFx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39840400004)(8936002)(16576012)(316002)(5660300002)(4326008)(31696002)(54906003)(86362001)(186003)(16526019)(956004)(2616005)(66476007)(31686004)(38100700002)(66946007)(52116002)(4744005)(6486002)(36756003)(478600001)(66556008)(38350700002)(26005)(83380400001)(8676002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VCs0RVhwbERJc2M5Q3VzVkI4S3RFeThxcHRUQldlM1RvR2FKbzZiYVRSTVNi?=
 =?utf-8?B?T2cwMDZEaFZtOEhrYlJFODhqOFlRaUMzVjgyb0xRRGxkWXJnQjFZLzJab3F3?=
 =?utf-8?B?amJ3amQwSGdUbC9sY1U3N3NZbWtOR21ROENOa3hlVWpyczU1d2V2TysvQXVH?=
 =?utf-8?B?MEFTT3ZIZ0t1NjBwREloOWpkeXIvQ09QWksvMSsvS2taRkZzUGNQTXNrM1M2?=
 =?utf-8?B?bk0wdk4zTEtHQXJydnd6VGQ5S2xRRGIrcEVSLzZVR3J1aVRReENocFhVRnlw?=
 =?utf-8?B?M3lZNnlteEFGdjZGeU80VzYvQ3Qzbkp6dWhUUWU2NW1IWjhDNkdoVW0xeW9Z?=
 =?utf-8?B?TEdCanRycnpib2hKVklhZ2dtUitlMXpkeUJpbXVSd0dDK0FqWlNvMVordnk2?=
 =?utf-8?B?WjZUSXZDSHh1WWY2UmQzcWxGWnl0UjRlMDlnT3doOVBraEJ6L1E1VXU1aVZs?=
 =?utf-8?B?WUJwUDI1U0h4TWMwdjgrUUhLZ0FzWXdCem1XY09HQ0UzUlZmTmtRcUFtWXg0?=
 =?utf-8?B?cHlPVW90Z0NKa3laclRSc1NNRmtrWmIvZVNpYVRnem1oZFRBS2ZyWFFyeEc4?=
 =?utf-8?B?MmJETUFnOHFOMDBmRHhITk53WGMxVldDaEQ2SWwzZVJwR0ZVUVpFSmFkQmxL?=
 =?utf-8?B?ZTRnaE1JRnc5ZUlWMko4N0o4OERRTjl4eDVUaXVacGQyYktPdGhVeHZBTGZP?=
 =?utf-8?B?YkZKWFpiUnNjTjdRdmhlektTNnNSY1pqY1NGYlZvYS9kbDFKejVWRElrU3JF?=
 =?utf-8?B?UjZ0VVNodFRScEw4VjlKRGlmemVEYWEwNHhpYkpudHM0WXhtOUxrNGJXbHB0?=
 =?utf-8?B?YkRnNjVCNlJieW5aT1hrZGtMMlJDakFjMy9MMWl6SkUwdWFHZmZSSEYybUda?=
 =?utf-8?B?RWl6b2pDUjBCSS9iL3NiMzNDNXF0UW5MKzR2Vk16azJ1aHZ1LzY1V1dQaW9O?=
 =?utf-8?B?KzI5bzdMbGdOaHFqcWtrMWdXdzFRSFJVN2ViK0kyNHVUc0M4bzc0UW0xOW9n?=
 =?utf-8?B?VXpEK2s0SHBSaUZFWW1aMUZYQkVRbVM2VjJxd2pkU2REMGRLY3UrNiszamFB?=
 =?utf-8?B?eFhwV09Jb0lTRUowUmRTb1RPUWxvUTJ5Vk1JRkVOdG1WWGpEU21yTmh1bnlJ?=
 =?utf-8?B?dlJ5SHhWMUhkTnBNbktOVENqZENPVVArZFhuQW12Q2ROWXU5ZlYrMG14c0N2?=
 =?utf-8?B?dHZwSGlZZmt4SmtxRUFHYlRRRVVKR3JQNmkwaEJoY05uMmQ0N1hsbGxFOU1t?=
 =?utf-8?B?ZmVxZUU1bXBBUUVHOHdnbG0wdFYrSWF4cmRPN2VmWi84TjFaSTJUVXFkOUR1?=
 =?utf-8?B?bElPQVNwZTJONitCWXhPS1VUZ0w5N0xyZzh5Q205ek13RnBBQlVTQ3lkTGdv?=
 =?utf-8?B?TWp4TXQrL0E5cDdmUGJ6aW04b2daOFNZdHJWdWhRS1VWQlh3RHRuaDZFenVn?=
 =?utf-8?B?UnBwYWpLR2kvdVhFR1NOWHRoUlROdWlJcDNiNEVkR0E4d0JybDRsT3FyZ0l0?=
 =?utf-8?B?Zit3cXI0cWxGKzRXcCtHRWYzTTc3U0Z4Z2ZsSDFDZE1SVDRtQzZ4WWlnMjl6?=
 =?utf-8?B?MC9KeEU4aUkxV1lDbTZWaExMTkI0Q1ZHNzVxRVFzQU1pY3JuZXdHVkduMjNI?=
 =?utf-8?B?NDRUTFI1ZkdjKzNCbmc2V1NVU2FQZmZYMHc3OHNUNjlHYWlVbXM1K0dEMlJV?=
 =?utf-8?B?WXRUZVQ3eVUvWnNqYy9YWldyakl0ZzEwaVJYNGJhVTM3VW9zQlMzMzFla0g5?=
 =?utf-8?Q?6ZOAuLHWrawoxgRSVsRpauwHhqQ2iJW931RjMtG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d34862-8fd4-439c-405e-08d9331a1f05
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 12:02:33.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqUciogClJt7cGHmySgCk96W5R31dT/rqP1084bM8hAWUgpspBvQvEYbI/os3JwT7hC4e35bxayABYN5smiFiaTuxFfVFeF6/u1EIGml+ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023
Received-SPF: pass client-ip=40.107.1.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.06.2021 11:11, Emanuele Giuseppe Esposito wrote:
> Progressmeter is protected by the AioContext mutex, which
> is taken by the block jobs and their caller (like blockdev).
> 
> We would like to remove the dependency of block layer code on the
> AioContext mutex, since most drivers and the core I/O code are already
> not relying on it.
> 
> Create a new C file to implement the ProgressMeter API, but keep the
> struct as public, to avoid forcing allocation on the heap.
> 
> Also add a mutex to be able to provide an accurate snapshot of the
> progress values to the caller.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

