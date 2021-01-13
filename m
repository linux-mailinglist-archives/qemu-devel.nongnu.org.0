Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8972F50AF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:12:32 +0100 (CET)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjh9-00024S-9H
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzjYH-0001Br-Lx; Wed, 13 Jan 2021 12:03:21 -0500
Received: from mail-he1eur04on0708.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::708]:50649
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzjYC-0006CR-NR; Wed, 13 Jan 2021 12:03:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+4OSnUHbmAbKferfDYziN3pX3wrT+TBYRkmgtexwoEKYaM5ONwVDbSsErFijSY5AsrfjWDnN6Exc2kXC33cFeOJFzB6leXOKSYXaMnhbRIdufxvSaVyp/YxN/R39VIIMFOz4fqmYkX3TSmiKDUjjv1/Y1qZIs880sNbJXYkRj3O2RXzHI65uvX3E1me2BFd7wXDfw1jWiXUWXjPRdMvd2P8xIatVDsPob8efD6ZCXs/Xt4MqM6S1xcJESA9/X98bMPbPFOSFtFsoIhj+hTRLB5IWOij5O+RJMBa8qHhILld7+rr8tP4bn1fDJh3bnAHwIQFYxu9IvW/rasqzbo6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8Zh1Am7sMdKMmo8I9zlb5w7QNXXXHwCmudVY1wryWo=;
 b=Ronicid2S9qK1W92rfjd7dRAVTmImaZwXMSfLKxH64BJt3F5LKaKFNpI+h950R3JzcncpEiR2c1V+EtIpR2x1NgVAyzSwOvdJkKqdglEpMzEqIUhmD+o8HyR8zXCvfgvbw8nqE1nJHd2liOrb7TgP+n14870Z+sxEcE+Ro+yGEE/wvO5FUhNLzz4DuOGCicGLRkQlLJB28Fxjaptx/RH86M7uWSmx9zdm9pf8JGsu05X33WgQ18J1dp4DEV8vWISmCtEv6KLumTyS2S7YfMrtadwRgpM9uiZkPw2ngNkGWh03Cj7e1NUuw72fOgd7A6LiXlTzneJ1Mbatl23DU4LSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8Zh1Am7sMdKMmo8I9zlb5w7QNXXXHwCmudVY1wryWo=;
 b=mgbEtdqiDVK0+G1lv1+9623SPebxwGa338RjqlUs9gtDLMhVnP80UK1EhNhN7qFA2OJtyG0P8SWKGn3k3U9w4/QyWOJ/01WKJAs6Bhkfc8u3jodq4X04sXkVZN1QswgR9RvHtHnhN+mPlGJWooFSmS+hb1F4Lr+8GkCOy5Gix54=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4535.eurprd08.prod.outlook.com (2603:10a6:20b:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 17:02:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 17:02:59 +0000
Subject: Re: [PATCH 6/7] iotests/129: Limit mirror job's buffer size
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-7-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5837fc24-e89c-a979-9a8b-03d0d218466c@virtuozzo.com>
Date: Wed, 13 Jan 2021 20:02:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113140616.150283-7-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR03CA0049.eurprd03.prod.outlook.com (2603:10a6:208::26)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR03CA0049.eurprd03.prod.outlook.com (2603:10a6:208::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 17:02:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aae2e95d-bbca-4333-a1db-08d8b7e514a9
X-MS-TrafficTypeDiagnostic: AM6PR08MB4535:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45352D10285AD82D723D8CF6C1A90@AM6PR08MB4535.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rxsd56D8tHQtc/JHu2Tskl5Gkj+Ut9QGy5tocMn8mkpt/Go8oHjLOMNtBCROadP33wkLOtkILyeu+BDKZW/CTjcgWyRp0CcWSHZ0k222VsDFmG7buIvHyT2DJ41IL7Uzbcf48BJrJcLhbY7ObqgNqqH+2cMGvhjF3q0ipM9br+jPQWcgIr9/QnTLClR2JbcvmGNxoDI/yhPpQuILzB/DLxoZvp03TmJR1nNJn3+lc2WtYgqQIpapl3Nzvu7npioeQ4M7jvE98iltVFQutLBuuOtOGneWo5X55bdRnbDbGIytri4m6di7qRZsP355N7f/WRCsGG0UctAs0e4O0hSAJRZ03U1mI72gUWQE0touh9jgkU7wZAVi8xSeM/QoGwH5AiBw7NhFnfRgjbPx+ROiBB7Ju20JkSBYJwcFzmyutYBfYWLzq8zFT6+OU2Wy7AggAmFWQN9LfgP0LyxeRDZ2PvvjnN2IgjdskYFd5d6ajdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(136003)(366004)(36756003)(86362001)(4326008)(956004)(5660300002)(2616005)(31696002)(478600001)(66946007)(26005)(2906002)(186003)(16526019)(83380400001)(52116002)(16576012)(31686004)(66476007)(8676002)(8936002)(316002)(6486002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXBQcHdoT3JmZXh5K0ZrUi9Lb2c5amF3U3hZamV3bW1RRXFWOXAwRzBBbTJV?=
 =?utf-8?B?aThsa2RNWHBhRGdpZDZ0Um9hRlJUZGN6T0E4TmVxQXFTN0cvNDh5SWUxa0Rk?=
 =?utf-8?B?ajdrWnpBQ3U4UXZuWUdST2NnbEsrYjM5WU0zZlo1Z0VJWThPY21uY1BCSE4r?=
 =?utf-8?B?UWxPRGFkbUhwT05iakhlQnZramhmWTZqMHlERCt2MHF0R0VZOFlpeGdCRjdj?=
 =?utf-8?B?M3ZWdU14V29qSHd5aVdyNU92aUFyL0tuSnQvQ1lRb3RmdUJJTUtzeEFONXM0?=
 =?utf-8?B?ZnR4aDF1WDVZRjZhWlJHWTIwZVFEbk5XSTVzMlgveFUvdjRmWVhGcms3ZWJR?=
 =?utf-8?B?U1lTSTZjdzdsYUJDY3U2WEk4Nno5aXE2cnR2ZGVyeEZiVnB2d3dlUHJFYVcx?=
 =?utf-8?B?YTdXZmcyOWZDZEs5a3YwbjE2aVV2S1JucHEvTDFwVnVhbjRPSVZCSjZSd2R0?=
 =?utf-8?B?a0tDOERIbVBSREdYa254UWpqdzJOTXBtd2l2TUZGSnBER29VbkxmcUc1SlJt?=
 =?utf-8?B?UHNQL1Ywa1BjNytwMm9zS1ZuU1FHTm5xR3VDRDhKYXYxUFVvcGI3OExlZGd4?=
 =?utf-8?B?bHJxaEFVM3Q1QXlHZDk3ZklzdWNHdlJhbEdJRDNGUXIrZGFpa0gvYk15cTRa?=
 =?utf-8?B?Z1R5TGhIWDdjQm5IREhiaytXS2h6TXN5UW9MTW9WVWg2N0ZxbUVjck1YbExh?=
 =?utf-8?B?WFlxR2EzdWlicVJtOTVNU1prREtoQmlUaktPWXZNV2ZtRUl6eEFQK2YzNks4?=
 =?utf-8?B?bjBqeHRMQVFGWFAzdUN3WUJSUGpXRFMxOXArRlZzZVRpdjhzVXphR3ZkZ2dL?=
 =?utf-8?B?MlR5bFdldmJNNEdYenRVTUFxTGdXK3BISUNxSHAvMGNsKzYvbnJrcEg4a0JJ?=
 =?utf-8?B?YXEzWU8wZ2N0T1FyUzVEM296STV1ZXFIOFpDZjJhbnMvZExzRWJTSGMrMjhj?=
 =?utf-8?B?b2xsRmhvWVEvN2F4OTdYQWp5YkVRWHBYVUNQTDdDdVRUWkx1MUdGN0MwWmtF?=
 =?utf-8?B?cXpxT0s3V3VwVUdVQjUrSDdLNFVMM09XK3MyU0pVNDBBU3FYamtzUEpiV1gw?=
 =?utf-8?B?ZWYvdjNBVlZRVlF4Rmw3aTlTWnNrV2M4QkoxdldGdkorblR3K2R5Qm9OZW10?=
 =?utf-8?B?OE9iZzczWVVudjVmbXJLSnJaNGEvYW5zNWZYUlR4WFN5aXhTN3JOTlRQTDFC?=
 =?utf-8?B?VUU4bE5RMk95Y01pSVBJSElwT0hrb05TRkxaOGNyRjIyM1BaT0ZCRjFLY2pt?=
 =?utf-8?B?YjJ5MU9BSHFDaDFrVFBlZEc2RFRxUllHc1JwazZwWlpWTHVZQWR2bkJXbWs5?=
 =?utf-8?Q?mdkRTxn9D1MuEbtswnnbWHjMdPM3csDhS1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 17:02:59.4452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: aae2e95d-bbca-4333-a1db-08d8b7e514a9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ji3g9UtSkv7ZSgBE5UsA8RFfsQMXlbhsJGZFU6Q9s+PowDlpHSqyrEtPTsnlU//7xTYBwytl0Izd35q2J/83XUES9/ZY8KsLuJSiqvlN7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4535
Received-SPF: pass client-ip=2a01:111:f400:fe0d::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 17:06, Max Reitz wrote:
> Issuing 'stop' on the VM drains all nodes.  If the mirror job has many
> large requests in flight, this may lead to significant I/O that looks a
> bit like the job is being drained.

what do you mean by "looks like the job is being drained"? If "drain"
in Qemu means "flush all in-flight requests, and don't create more during
the drain", then job is exactly "drained" during the drain..

do you mean, that it looks like "job trying to finish copying the whole drive"? Or "job hangs", or "stop hangs"...

> 
> We can limit the I/O in flight by limiting the buffer size, so mirror
> will make very little progress during the 'stop' drain.
> 
> (We do not need to do anything about commit, which has a buffer size of
> 512 kB by default; or backup, which goes cluster by cluster.  Once we
> have asynchronous requests for backup, that will change, but then we can
> fine-tune the backup job to only perform a single request on a very
> small chunk, too.)

OK

> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   tests/qemu-iotests/129 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index e6753c90ef..c3ad584ba2 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -69,7 +69,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>       def test_drive_mirror(self):
>           self.do_test_stop("drive-mirror", device="drive0",
>                             target=self.target_img, format=iotests.imgfmt,
> -                          sync="full")
> +                          sync="full", buf_size=65536)
>   
>       def test_drive_backup(self):
>           self.do_test_stop("drive-backup", device="drive0",
> 


-- 
Best regards,
Vladimir

