Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4E73BB89D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:09:12 +0200 (CEST)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JfD-00044j-8l
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Je9-0002bb-KN; Mon, 05 Jul 2021 04:08:05 -0400
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:49376 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Je7-00075u-Vv; Mon, 05 Jul 2021 04:08:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iL3A7ArevE48qXp8g3ecgh11GmiT/n/CpL8Nmq5IuR5Vwc1pipi+nJDRP84fAjlSmLY5TNrglyL3XMWquBK0JLshwbWGscF+gO1+7mzA+omV6n4QBEcr1uV+vNoduVqKDk+LnjMNoseGVPYxWQwdWEOGgQGht7qfcQclH/dnQ/jX/f+mvFGVBmFB02K86G+o/7hlfyCMPoZTKin8zSZpDq3MXqKmVtdkEKW+VrBCogwvmty3MRo0piXI7f+m96P08J9IYMIqoW6wOw7JVWJ3Fk+4Jl/fscL+a/BB54wKH7muUGSMHV4Tt7eoiWDDuPcqDWmocYARFL31/hFhdnQyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuHM8kYgMKOd0m8hpNnoB8EMsp00OgAm7LOJKY5V7iM=;
 b=djZFhs8AxerpWKN/X4ePXXMwj0qYGRR9iC9AJ/iGWV+exT2sXcXm5zkeiWkS6sQTCWItjxfyqprehLqbtYB5GHL5iw0RMrZkXWPVBhocdxY6D9W7LE5vcR0ssSpbknSEoo958fjKlnIwjbWAYuY/ETFaw2fOnOgkgYNQ6AgpXkyRt9HvdDJWVyLjh39jBiqyQDz5yRO3/sriRgir/egjFNonw97ErXrEZDVoCCRBAKbhPXw1qqm4ndzzIiimMbUdAD/KwRLpnJdNsH34uKZJijljwbdgY3W3Xh2Ey0aKFSEORN/YjwT8RELZ2ep5AjIM4b2y1oJ2f7G0ak7Ug/jAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuHM8kYgMKOd0m8hpNnoB8EMsp00OgAm7LOJKY5V7iM=;
 b=s0ZSbhxHh98ni9hLesIH0cjUmglwgqxt+7AisnBWjxYYN6APZTVddtShubLaXxJ+UvMluVqJH9cK2+bP9J2jmE0cr/G1QAfkXulZIYR3wuvJOmD3em4gbpZvjrXiLG+PsrkmB08GHC0Mb314UruB4OorTOvboAvTqqmCv54DKqI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3446.eurprd08.prod.outlook.com (2603:10a6:20b:45::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 08:08:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 08:08:00 +0000
Subject: Re: [PATCH resend] nbd: register yank function earlier
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210704125643.69f303ca@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <18481e1c-49e2-c4c5-3206-5e6d026cb9d0@virtuozzo.com>
Date: Mon, 5 Jul 2021 11:07:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210704125643.69f303ca@gecko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0080.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Mon, 5 Jul 2021 08:07:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8807ff31-1ccd-4b11-a798-08d93f8c01a1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3446:
X-Microsoft-Antispam-PRVS: <AM6PR08MB34465A682776CBA60AD71D50C11C9@AM6PR08MB3446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GgZsIcwd9RS1RYlMyQxDmR60HmlpZgCrfmJ8z6UCJsQ8hXiZU2ZV7wX3OHaoVtsu6zU+S5xSMJL0NtzrHsUJOOkrJXh/8mRxzqLU1BX9MLOmy6JxltNwHNrmbSU31aOz1otgKjxQWfSJZVDmK6c1E/F9kKjckMBe4nphu8Vzrk8+/Hzwx2ez7NL0Mp555nfNxXv7gGKNAtDU/JupVrz2Kex8TIaQ53sT602jcY3ASaRMgSuIppL3RIJhHs8wbjZ6cfrms+nubmvGNY5e3ysyfGOvGuzaxux7qzcx4ho2GAzYgjQsSisV+E7xIOag1L6GE2pdFDnic8bG1USsSW7HE9e+tyYiPAB5U2ZPq8E2pPVhnkxoj9ybDvhK3dYxqdgRLRkbx6/2jmkFCZqq7poG/ydfc2n9E6yXF7wJP8Hcu91Ul6x3UqqiYvvUONRzdcSgAPsHKMHa7zZ//Gh0vAMD52A5dXMgSBZN0kO8RxbOJsMgVwKoQAHoYk7lGrHUIGpK7vznIE31Dh1Bu/RWnpEcginoR2078xQv3rgPFDR85NPsAbzD74Fx8XQc05BvR8JeX519+B2wqnzDqI5a3tyl8GdVbtNPPnlEITd6D6F8b/YSGnbnVvVCskBRSQK4WNCRPSqz13kLzPyAxr9B+t1gfaFOyFZw8w393PLfDoa6yjPuavq7Xli6zlqAfIRhY2zticPUfGwMnda2MGMn7mlOcOxNyMZx3BuPYc9iEikm5dTlQkWS+5rR9AtlP6aOYmxlChsOB3iOMjBqB6xcLz1RiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39830400003)(396003)(366004)(346002)(4326008)(86362001)(31696002)(54906003)(110136005)(16576012)(316002)(83380400001)(66556008)(2906002)(52116002)(66476007)(26005)(478600001)(38100700002)(31686004)(36756003)(66946007)(2616005)(6486002)(956004)(38350700002)(8936002)(5660300002)(4744005)(186003)(8676002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?5AWt4GjUTMoxxTDpNjJWGDSoLscKVUSYWnMBsZ3Yh84xdwz3fNNF340m?=
 =?Windows-1252?Q?bwTrjR08CH7GZ9NI8fxZrpJ06q1F4xFxK9WVLs58fKGOTkb8eOCBgxcv?=
 =?Windows-1252?Q?sKUJltnCoFxRhXwp7WkvKPajiji57WLe5BPJ1oKVK0On5uuwP1Etb3RJ?=
 =?Windows-1252?Q?aFIJHqnSEoZK/f9wWmVJuFSB7X+7vNk3VQOXJh4FKcE+YqIi3KwnkZko?=
 =?Windows-1252?Q?6ot5kj02OPU1Sp7ceCXp48NI1rndHIsziKBfFe98pMpspN6xWDh0nY94?=
 =?Windows-1252?Q?e4c9AOgvaeKe8zRdI2WxZV93iIM4J98AO4rcsqjAO5j4/vQEqzo4cu36?=
 =?Windows-1252?Q?9mkmPZ9rk8G6k3rMN90EcyE4Mx94z85Ayn65v5jM+fPqMe+QHVq9KT84?=
 =?Windows-1252?Q?hgkxDNp4TZutR7t1nilDynoGGgbRiQHux19HoaGJD1qAbpxAphSNBkAt?=
 =?Windows-1252?Q?5VRYKZTuDtn2X0e3WCLa6/m9RVHeuUmvUM1BuzQWkn9YaV1lBI+eA5Bz?=
 =?Windows-1252?Q?2GaY2x6/XporcqsOh0AlupK/8BnueO9fgPLJJJGBehJX8gUyUyqg6gkS?=
 =?Windows-1252?Q?ezIvpMjMiHSGBOUFi6R+uvfSZbf+l3Uvd+dG+dQJWSrePDU/1ZZyAKCN?=
 =?Windows-1252?Q?8Ny6LVPtgQVtHUN7dN0n7w6SdNTSQ2Hb4TZotgoOgFe98PKZP3AxmEYS?=
 =?Windows-1252?Q?0w3aKQ0moJFS+JtWV7eqxUsiO2EIj1zwRAi1DyRid+abCSnhfkDWpSI/?=
 =?Windows-1252?Q?SnxfMThG9luLVpsJPTtpffVy9lOQolIgeHWmPN8J55GMuKoT7ViWHwfw?=
 =?Windows-1252?Q?PH3MY9RfVCZLAX1UtV41Ax6KcQn35oLzi2HaGeXCxel/tGSrZOI7X2CF?=
 =?Windows-1252?Q?9cPdjiZlAgj6H6JpITa3VXeL5l8hjK+AP2eidRK97dhp0U4cqO+joJZe?=
 =?Windows-1252?Q?JFppDyujDLkXh6nT8/A7tvC1N4lQP/UsyNNAxqG8HQFNFf/ztwoTF/Al?=
 =?Windows-1252?Q?G86zYH4SlLlkVY85X8k5flOlHlgVK3iPwNQthyL+uSM8yoCiWuPTekkn?=
 =?Windows-1252?Q?Cobvq2SvzlK7ULkeSJmTvLDUUcUM7S+UlbGjcHSNATj26Cyp1TRTTUXn?=
 =?Windows-1252?Q?MtTo42YB7/cMkWApXk9zHJ1xnkcbfeXZTA2j6EO1G/mZzTY2gNBROsjl?=
 =?Windows-1252?Q?FAWzf/Yo0xKUMTbeiT+AamdsyYnDrvILKmaoiKlsL5XOS0CyMF3usfqX?=
 =?Windows-1252?Q?eLDJYrvg7Tb+v13dWxtNvT/YIhNkd8J+38a+6A7+aKy8LKdJlHeabW6w?=
 =?Windows-1252?Q?357G7OIZDzWD7y/uKVifgS0Sb/XW6JdKKjxmpOLae1LE64tgE0G1rX5E?=
 =?Windows-1252?Q?uTf8SCHplWkUqVQL0i+J+cBeV668+Hz2H5dM7C2xb8pceeFtke4AB1dY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8807ff31-1ccd-4b11-a798-08d93f8c01a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:08:00.6870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRSe3fZAXozzDTCnWzsgyE3Jh93N+vu935ILIaYV3WWZ0CY+0c3kkrnCon5pnqlecAxfWVmmWu122rin32V89Jqjb7q5lG+7mUYkKH1CSrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3446
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

04.07.2021 13:56, Lukas Straub wrote:
> Although unlikely, qemu might hang in nbd_send_request().
> 
> Allow recovery in this case by registering the yank function before
> calling it.
> 
> Signed-off-by: Lukas Straub<lukasstraub2@web.de>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

