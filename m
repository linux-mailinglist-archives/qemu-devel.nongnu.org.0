Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3F233C78A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:18:02 +0100 (CET)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtf7-00069O-0U
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLtd2-0004F6-SX; Mon, 15 Mar 2021 16:15:52 -0400
Received: from mail-eopbgr60131.outbound.protection.outlook.com
 ([40.107.6.131]:58119 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLtd0-0007ny-M5; Mon, 15 Mar 2021 16:15:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUERqpKZmqiJuLEiGw78qtyhmra0WpHDrNf89yPulmtuDO7DdBw1p7KAuD6Aayp5G7ZIEfCYTAibeeq8iVXKwWCHD/p2y6uIMOb0MuyW8mIiNfa4WZu/RkxjXsNrTzok3Yitt40YLDskuayepUvhzCBbMs4/j4B/nr4PWUKyppQYeDtn45+mE3mCUaj80FG/Qjevzn10HCeySqQzGFyy+3Wq0wObFHyv4z8OkSiDYHHH+KrAvM9ipxgPrbsjNgTsXbf44Srs1x/2hBiFKXrpKFSELatXOQeBMh6HS1pkJToO4xWKSxmIqOEHaeHcveAr+qmFyXblweTPi4EoCq71Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nICAhkT9XTbNQGq0Zn5m9HsHySsFgekCHL2qq4tscp4=;
 b=Xiap4MBZNVEi0JY7gGM6i/I+slV3DGlclTcnVesRdeRhMg/AbOk3X1MUv14uiutDtL4g7jlMYHmjPhkVwNk2KBNmneZOtaRwpSmxQas6FCY2vQIXzzNh31c5aSyfwNXX3F1Lbp/7afM7Dtb2nf3W+anTEym6OB8thsaLeuXR/B3qYxnKW9iGbSiyGqf6Ib/umFE/3oRQtf26XfJEFBNKBXORwlv7bFhcDCnH6bsqp15foUZPz7JCKRJDCfviUGsIZJB2O7GKDXTAzBRadE7v+n7ZyRnjiX8d+nN/bIKLCUYTpVbbwCdYeu74BPqJVjN5PboMp8/hyhMVZUl3kiclPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nICAhkT9XTbNQGq0Zn5m9HsHySsFgekCHL2qq4tscp4=;
 b=ZqNxyluwwv2WcQETbngolSq4ZEXhJsu03WwgMnBxEC9bPuI4pWH5bIN7pvA7f4c7HN1OQ5eTNg5CzgbM2zan0IEIXniGx3FqDmQGjVP+edJXx8lsq4B0hbT+YmVpSH2AGe1P0M9C//hvgWMrUHzQJpBpK9YfjOxlivLvZPuHTVc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 20:15:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 20:15:47 +0000
Subject: Re: [PATCH 7/7] block/nbd: stop manipulating in_flight counter
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-8-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <de4fd61f-ccd3-125b-b636-aa06efe5823a@virtuozzo.com>
Date: Mon, 15 Mar 2021 23:15:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210315060611.2989049-8-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM8P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 20:15:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb174608-afe1-4388-67f4-08d8e7ef1ec6
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2034DD9888F6CA76B8A4D447C16C9@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zIz7YVsBIwezUYD05XmZ4c8F6Pk0Sr4snnv2+do6t0sQSDFnav/NoTvapTs/pKxQr0zTCrc/FouC/dSNEexWcD/eehAv2Y9BrvxCqyLD0NVo0z0L08hwstK9xXm8FTLYLBJ8agxVU6F2ysj9SDqmNKDjD9Va9WDTX6OWKDyvvcDfSb05EBpdhwRWMk30lRk2D3HfN43dkNt6XWJ5MtqytoTd41vta0ydNtwwVmH1qous4oKDx7KBQxo4In7SmyDNHJvncz29ZwR45K3QIuYLt1mefyZmgx/9ZESWv8JtQYiOwx0zsPP5AME9CGT6T/Xr4YoNbAGtK0ZwEeBYGSIvDeD0oaWnIWA91SblCyy/T1yQ0mjuDK48B4ObotaxjDb6zBBUh80wAAxmpaZXwgT2AgrbNy6xNvpqd0dDgK15x56lL55kefRPfLcIBQennw2snVKZ9nB6pgcnVV1/fm+NNYYLQ7v8mrN+9zpsIVBZqK37W9zqHFdeP/lMVBJXPHDTBkg4+4q738yHGm4GdkwV1zZQkzBnI2GZVgCne97t48hpvEaGvpYNd1R5MH6RyOs8txMjrw3KkvRT+0k8KDrsuXUCLpGkpyVuZME7/EnYknNJNYbRodUnXGyd9LH3dPq+/XDZGidiJ3uX5BVQEjmTYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(366004)(376002)(136003)(6486002)(478600001)(36756003)(66476007)(16576012)(4744005)(4326008)(956004)(316002)(86362001)(66556008)(26005)(66946007)(31686004)(31696002)(8676002)(2906002)(2616005)(186003)(16526019)(8936002)(52116002)(5660300002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2N3dmkvTG1TNklOQUdmZ0xQWjhlOUhNUU4xSHo4eVN3WWoxeTd3L2kwbldV?=
 =?utf-8?B?aS9Qa1F3UXBYZitoK1ZPNmJCWklnSUVMcXdMUUlPdzQvODFYcTlEWjFEWXZm?=
 =?utf-8?B?MjRpREJiWnNWNnAyMSswcWRpbW9ETmMxaTZwZWFJTW1jU0gyVWdiMHNkVTB5?=
 =?utf-8?B?eUNwWjZqc0xVWUdyQlRZZFdiS1VTdHY4TGNlUFpvNWsxa3BTdm1GdHZia2t6?=
 =?utf-8?B?bi9EcVY4SmI4NzBCcGxoMGt6d3o1d0hBRkh2YVJaUWw4OXB1QnVGMWJQQ2J6?=
 =?utf-8?B?VmNpTG1HZ3Y3bHhBMFhWdk5Xa25nWXRWZkMrSGZ1dXlyTk1vY0Y1OWUrLzYr?=
 =?utf-8?B?eHNKWVpzc2pucTBPWk5SaG1IWGdManJEdEZlNWpsZHl0K1QzUkszNW1lOXFa?=
 =?utf-8?B?UUhZcVFKcXFuS2kvVzBsdWZKKzlEUmxVcjV4MFRYRGtzSDVwZk9CYUtIVExN?=
 =?utf-8?B?VU1TTGM1ZUpQSkIvNjRZOElpeXFBKzUzdG9sZ0UyeDFJdVJhNWh3ZWVadHVw?=
 =?utf-8?B?c3NYdlM1K2tPR0tRWTFUZmlJWU8rNWhKREd6a2dENHBZSGEzM3BiVG96NU41?=
 =?utf-8?B?TlM3NTQ1dS9FMEhheUFjN3hzR09RWlkrSGNCYTQxRGtjV2FwaUhYUnAvSUtm?=
 =?utf-8?B?T3F5MXJMLzJSUFVrNDk2elZ2d09MdHJJVnZCOGNHZVg3V2Q2eStTc1QveldT?=
 =?utf-8?B?M1dPWW40WTZna2ZVUlIrcXdMODdJYm1LWUlLRko1WEdBZkVUK3FaU0YySE04?=
 =?utf-8?B?cEZWckRMd3NVRlR3Q0NFWjdhZUxIOFZVbllId0tETFEwY2IxVXA1ZEQ1TXZl?=
 =?utf-8?B?Wm5hVWxxdEFkS2oxd1dFMGNSRU8zdm1VcEZLY2dSYVJWMWhDQVAvRm5JTUVV?=
 =?utf-8?B?TzZRcDVOZ0p6b2ZIWU5XRmFHenAxOHVONkk4cHd6VWdCWUZRbEFjSVVQYUxO?=
 =?utf-8?B?WnpRRElmREdrdUdFelRRcHVGNDFMczlOeUhTR2NKMFRrbUx0TTV2UlREbDc1?=
 =?utf-8?B?dGllbDNvWGM1R04wZTlxNVVuNS85QlJxNUw3MHJIVVZBQ01sUUxEbC84NnFk?=
 =?utf-8?B?REpuN0JGdkZhYVJ3Mmh2YjRzZlVlWUVLK2ZuYms1L3lvdVRJSkhPWkpZM0p2?=
 =?utf-8?B?a3NySW9XdHBsVWNpM2JzU2xYemRNNTBKZ210cGtKdWkzNjdaNUVmWjl0eWp5?=
 =?utf-8?B?RkF6aUNCa1RlMnlBNGhac1lZV01OLy9GejFRYWRXRXhGVEpWQ0Y5Y0FBbWRn?=
 =?utf-8?B?Sk80Q3VpVWxORkxrMm1MMGUyU1hCUUhGTU9HSDVKN3p6MmpsQmZqUHBwL29o?=
 =?utf-8?B?ZHp5cmgwNmlXMVJYZ2V4bjBNQTZPTGExWVB6Z0F6RFREVm43RXhwWnpmbFFS?=
 =?utf-8?B?OWh3VjhMU2Zac0cvYXBwb0Jhb2xlQk9QOU9RRmlmU3RJTlkrd2ZlbmNYMjRw?=
 =?utf-8?B?cHZ5K0pBc3hHZ3dCSkNNMmpQdUpiYUdra1JlRXBwV3pQakNmUXRGNE5WQk1Q?=
 =?utf-8?B?dWs0V3A1Nnd2VzVRbTNuOUN6bFZvdG9LaWZRcnMxcnRncGhlZ1Z1ekRQd0lM?=
 =?utf-8?B?R1NabFFSV2F3VnlZbVVCaTUwOGhwenF0TjB3Z3ZBcWtXT3NldUdESERlaEtJ?=
 =?utf-8?B?UXF2MjNXbDBUVlA4TmtnMEhLUFF5THRJeDFDcVFCUWJGYm13Qkh6d3hlc3ZS?=
 =?utf-8?B?RG81cE14c1piSkYxU0FPNXMxVVJvRzJRUmVXbStVUkpOczA0TnRsS1J0b0lE?=
 =?utf-8?Q?tBS4HMHkWkcGSnQhAd59BXLq3BhYEJpYZPx15HR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb174608-afe1-4388-67f4-08d8e7ef1ec6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 20:15:47.3898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z438btRYkBfpAYjJgncttn7LpgrZvZ/Q/FtY/bCVavdkCv3AhNxdIExnG1mJwNcM61eh0xEg9fAgpCyWFtmgfSzMUgYWujD0YJ/P5Mx7lsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.6.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

15.03.2021 09:06, Roman Kagan wrote:
> As the reconnect logic no longer interferes with drained sections, it
> appears unnecessary to explicitly manipulate the in_flight counter.
> 
> Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")

And here you actually allow qemu_aio_coroutine_enter() call in nbd_client_attach_aio_context_bh() to enter connection_co in any yield point which is possible during drained section. The analysis should be done to be sure that all these yield points are safe for reentering by external qemu_aio_coroutine_enter(). (By external I mean not by the actual enter() we are waiting for at the yield() point. For example qemu_channel_yield() supports reentering.. And therefore (as I understand after fast looking through) nbd_read() should support reentering too..


-- 
Best regards,
Vladimir

