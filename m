Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388612CF64E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 22:39:32 +0100 (CET)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klIna-0007om-No
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 16:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klIkn-0006W0-FN; Fri, 04 Dec 2020 16:36:37 -0500
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:14945 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klIki-0007p5-Ml; Fri, 04 Dec 2020 16:36:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxzinlqoeDOPeaPFpZTd6+KA6le0PYWy2V5DZhS63uA0ydaCs9FkGm14vFI86XpWrdHe/yYqXau/w64L0geuxQLbOxolqJrUwK+J7F61OQg7/X2HJCBSs0NwuaJUm+V29/E6l8Vg22qzXjIhl5lbQpOHzLz40PFAVJAuYLI9J8pc/0P4yWbV1BHsVXAo61GQbHPgmvdTHQsKxlyGXTSVH1h5d+oLNt3RMu93sy564d7HWUO//FFhzc3kqJpw1VdAxi0bmuPWV0dqfMJuT1Xw7Ml9RppF92BbLAxkCHxTOekATU4v/a+t0DnIGCNl/mKOSUaIVyOb4J2ekYELJHEEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+ZZ6YZE+0NEfNBth8OFSMNWuj4QWPpuzFASe6Vaqa8=;
 b=XVeiF8N13sFa9tiLdId8QUarQcb79BFgkl0UqumtNeauv1DWEEX4tqAomclsCAmLV6hVzqMVH/2Q76vlJ5ZlrTEwIpnBYCoqTCdkeQ2a3yhca4P/o50hkFtOi6hbi+ot1cu5mRH34PmWQf2OUDts/pry6gXVj4T1IAv0G/c5qbmjhtUTB/rdOpaTkMOS+TnB4FCMwbiW/+w+WpsZWgjXhjnkek2/6g19HRmxyKyEoxag1Xl1uM0jfpRCYX7XUK7p+G68Nk7qImyExQysWPCU53H8H7AwbOfU5/M3k/B1F3+GD5ApEL6J7iReyNM5jbOwY1VuIyzKCV/HG5g664tyOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+ZZ6YZE+0NEfNBth8OFSMNWuj4QWPpuzFASe6Vaqa8=;
 b=lOo3H31XTn4DApacXNUYVpMjxzIdlFvcL+OgR5MhK/WDHVqzQGChAa8SHouPY8TN7QmLXnJB1/LI7ECkxv8/310qAKi9NhqTPa6btIv4/8XPrWMkQqSLLiDembri2LIKFOvIeDyYB3GV+tjhRijY1NLqycHbzWTQPsaHzncmu4U=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 21:36:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 21:36:26 +0000
Subject: Re: [PATCH v13 00/10] Apply COR-filter to the block-stream permanently
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org
References: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <aa39bd4b-a5aa-47c4-c360-23970dea7bfc@virtuozzo.com>
Date: Sat, 5 Dec 2020 00:36:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:205::16)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM4PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:205::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 21:36:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f29e8854-f172-4ac3-b785-08d8989ca726
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119F063FAAAA141B2806D07C1F10@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bovFmm2cTQeFjhNmNtdJ5dNvxV0TPp0w8+MTZklawJmkeaURq/qX6K5zZQcYj4rorwrv4wsmZTg5PnlQ/knG3DY8VCEiMdCfrZ1JU9oIo0cNQmJznv78Q2/Qt0m46A8HTFdWmfyR4BWc474/4mJmaH7QZjhpXC6BTyLjNbvIP9ajB2s7viksOyiP1FE1a+Y/qwaE+PqAVGLsykcB3jdnwpniCAxPcm97oXtzsxBaUgrsXwDY07sh53pEUVqbBR8k6TZ11zEtXTGcUKfuxlN0hnf+1FXhBVr1mEj5jiMxt9nmGG8W3jtUy2T8aoeyvdJBXmwnbJ/dswmIO203cBkeYIc/90DKtKJvn8jVIVgJEWTafIOSUTt9RAzsr7ZJwcVvRIfyhLmpWwzzzFGIpNBP9nXwzgNevAlj83EtieoTMys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(39840400004)(376002)(8936002)(16576012)(36756003)(4326008)(66946007)(478600001)(83380400001)(66476007)(66556008)(26005)(31696002)(6486002)(186003)(16526019)(31686004)(8676002)(5660300002)(86362001)(52116002)(2616005)(316002)(2906002)(107886003)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0dIKy9YYnNqc1RhWm51YTVLbDI2Vmc0ZXNZdTNCQ1Q1eGM0N01jQXJqUjA2?=
 =?utf-8?B?MmZucURoeVRYSDJmTGV6ZXRIUVVEMzF2TDVmQ3Q4a1prbS80cjFYWjkxQXNU?=
 =?utf-8?B?UFBUZXIwWHRRYzhMbFRjWnk4aWJyeUcrcFZwUEt5V2hBbG5CUGFiVWJuWXNG?=
 =?utf-8?B?bGpSN3ppbXVEemVqa0NwMlJqY1Q5VFpLRE9HZGpGZWo4RnYrVFhqT1VmN2VD?=
 =?utf-8?B?SklxZ3dHL3BBcmw3NkNhTjNZWm0za3pFUTh2MVVZQ05vSGpWZlJldjQyOHBI?=
 =?utf-8?B?bktYYnNMU3pnUHhrWEYxajY2TGZOY1JjOElrdVZaYm84K2FLTTdDbWY0NEJB?=
 =?utf-8?B?MlM2WDJLbWVmVGRERjZQZlh6TjYzcmpJT1NtRDQ3RHNpZ2RoTzJzNlRhK082?=
 =?utf-8?B?b3pxellnRlJxeTZRRkd6bGROc3NEamxrQnl3czVZTlJTSE54UFlCZk5PZXdz?=
 =?utf-8?B?eGJyZVB1QkZoazNWRE9ZOXJLNHBlWHQ1OEErUzM2QmdxWnZVNnNXcTlqWWxp?=
 =?utf-8?B?RmZkNFpQZUdHcTBhYnA4WGQ5aldza2t6MHQzT3labG9rSWVrRVp1RUU2VXU3?=
 =?utf-8?B?c2ZEV3pMc1VyZVpVTEd1NThqVE11SkljTUpmalNJRWs4by85aitnSEd2c1kw?=
 =?utf-8?B?dnN4L2I0NTM4NG9EblI3bHduOC9qMVJoOVY2aWdGU3RzWGdSdjQreG5WMjN2?=
 =?utf-8?B?VFlZM2FGa1YwZnNESWIwSFUyTTlEZlZOSnRqOGFzSzdvazdzSTVndDhBV042?=
 =?utf-8?B?UjA0R3JsY3FyeEJmQnlocnNXLzF5NVIzRG1FT2Izbmg4V1B0cDdwbVZHNXc1?=
 =?utf-8?B?T3o4UU9KN3dZa2psdTJiWUdvU0ozZHcza0VTNzJaaklaS0RZWFpvSE5aazY3?=
 =?utf-8?B?aytlZUptcnIvQnB2UE5uUDU2U3ZGYUNGN21sdGkwUEY3eDNiR3NheUxRTEhi?=
 =?utf-8?B?OEZzZTFINGN5RWNIYU5wSXQ5SEpScUdWMmtBaEFPSXY1Sk1STWJUSmlIUkIy?=
 =?utf-8?B?dmNCbHlrM1RkMW5MalI0U2RGMzRhNE9RbzhGWTMveWN5OUNoTEM3RzM4U28x?=
 =?utf-8?B?RGp3ellJR1d5di93SEhRSVE2dUhrSEJ0aXlvN2F0cDZwNWNVRFNjdjhrbDJx?=
 =?utf-8?B?R2Q0YXpYWjN4TXN2OXNGTWM2NGxXMnQwMlBDeFdnKzNHMmtpa0tGcDFvbDdi?=
 =?utf-8?B?QkJoR3lnVXJPSWRaM3NtcVBkcGEzYnJMa2xLVTJFUGlvR0RNWWN5cHFqL21l?=
 =?utf-8?B?RFk3VStRMzlzd0tIRFhsdGpKTWFmWFZOQzY4NDgwN1psdzhrYVlweWJSa2Ns?=
 =?utf-8?Q?w9AGY2yuUah/8St/O1uRl5kDjgbQkIWENq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29e8854-f172-4ac3-b785-08d8989ca726
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 21:36:26.2972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7zEBY9Mjey3bIkhylaDJwixqaTa/rmYtxooJJ27kk0HKi1glq17WY8GA1nCJIcLTysV6xvMF1FKzDiQ41g5tZ8Rd5tcYpbFI2hTmUzIFaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

I still think we should keep dropped iotest by introducing "bottom" interface for stream job. And deprecate old interfaces.
Patch is better than arguing, so I decided to try it myself. Now I'm close to complete v14, so, will send it soon.

02.12.2020 21:30, Andrey Shinkevich wrote:
> The previous version 12 was discussed in the email thread:
> Message-Id: <1603390423-980205-1-git-send-email-andrey.shinkevich@virtuozzo.com>
> 
> v13:
>    02: The bdrv_remove_node() was dropped.
>    05: Three patches with fixes were merged into one.
>    06: Minor changes based on Vladimir's suggestions.
>    08: Three patches with fixes were merged into one.
>    09: The search for format_name of backing file was added.
>    10: The flag BLK_PERM_GRAPH_MOD was removed.
> 
> Andrey Shinkevich (10):
>    copy-on-read: support preadv/pwritev_part functions
>    block: add API function to insert a node
>    copy-on-read: add filter drop function
>    qapi: add filter-node-name to block-stream
>    qapi: create BlockdevOptionsCor structure for COR driver
>    iotests: add #310 to test bottom node in COR driver
>    block: include supported_read_flags into BDS structure
>    copy-on-read: skip non-guest reads if no copy needed
>    stream: skip filters when writing backing file name to QCOW2 header
>    block: apply COR-filter to block-stream jobs
> 
>   block.c                        |  25 +++++++
>   block/copy-on-read.c           | 143 +++++++++++++++++++++++++++++++++++++----
>   block/copy-on-read.h           |  32 +++++++++
>   block/io.c                     |  12 +++-
>   block/monitor/block-hmp-cmds.c |   4 +-
>   block/stream.c                 | 120 +++++++++++++++++++++++-----------
>   blockdev.c                     |  12 ++--
>   include/block/block.h          |  10 ++-
>   include/block/block_int.h      |  11 +++-
>   qapi/block-core.json           |  27 +++++++-
>   tests/qemu-iotests/030         |  51 ++-------------
>   tests/qemu-iotests/030.out     |   4 +-
>   tests/qemu-iotests/141.out     |   2 +-
>   tests/qemu-iotests/245         |  22 +++++--
>   tests/qemu-iotests/310         | 114 ++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/310.out     |  15 +++++
>   tests/qemu-iotests/group       |   1 +
>   17 files changed, 484 insertions(+), 121 deletions(-)
>   create mode 100644 block/copy-on-read.h
>   create mode 100755 tests/qemu-iotests/310
>   create mode 100644 tests/qemu-iotests/310.out
> 


-- 
Best regards,
Vladimir

