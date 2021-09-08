Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF7403D9E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:34:41 +0200 (CEST)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0X3-0006s2-1v
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mO0Vy-0005XD-Cr; Wed, 08 Sep 2021 12:33:34 -0400
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102]:30946 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mO0Vv-0005U2-Rh; Wed, 08 Sep 2021 12:33:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VasusxyWGKNiwcIpn43SUzRZBZI8N6NtwQmlb0KVpj2HZdTJp2l6YKWURWLAMXx9ykpd/Xqx8GXd8hzKDT5sonb1egmwCWdZm8bos29ousAKwp+Y4ANA63wWL/ziO0bI/DzvOorVZsdOz30iE+ItVtUUFZIAdcRstcJQmlDryY21eipm+4DiZOfRlyb7lavxDWOtoy4uDUNGzzPKt9UALltSHMFpUAnkK60fD60++FsUnAQeO7ZCx6Aoe//uI9tL1T6ZKJdKhZbJLDqy9hbITDyU5LyxqlyAN8zHWtDYPzxKGph1QQoFXav1kOMKpJM9RiwRedoL/AosoQ/a60AQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2hqVta+4JlTDs7vxUSrxCypcihOIe63r2A15EhNY/7A=;
 b=Z/iM2TK+QmLSw869zu+jLWfusE+tg9vSSTIoTkwjKfcUyUrWW83ieS6K7I+E5QmOcXMTneM7cagWe5hKPcClaiV953PWUWaHLg4Xqss1/MU2T204Ykz93CFDKoOj//DLfYlhvoF2Dxtg/CsFCyhZTyjrgYIDrl0ZLL7aMQootz+a4iwLgT3tuzwn2fD/4yc793+0s++C1sGanx5Tz5cbRK0qc8Iap2HqCopoSeQkfygKjn2FafmkGVyDQvpP16qw16NspnkpwT9GiZZ7RZOBMpktthvWZ987gVCPOA1oia0yONMXa0ktzFrA9yD35z3M//OrEmR6OKyOMsafIaoCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hqVta+4JlTDs7vxUSrxCypcihOIe63r2A15EhNY/7A=;
 b=YftUBo0YBu8PcST3y0nPto83OyrFoM1q9MucQnfkaQmNQikv3VIBBk0C+HPUIKoxFS4w0Um73g9f1bt6gDuKpwG12MZJlrtXjvaz0X0VxKk/qWDT1XJf7hFL+Eyergi/TxKz/o8/Xa4sj7zEl8i2wupghmy0QNzk6whi6+OnvJY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 16:33:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 16:33:28 +0000
Subject: Re: [PATCH v4 05/12] job: @force parameter for job_cancel_sync()
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
 <20210907124245.143492-6-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7ed34792-cdb0-ce82-33d4-07a37348d3dc@virtuozzo.com>
Date: Wed, 8 Sep 2021 19:33:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210907124245.143492-6-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0112.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR10CA0112.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 16:33:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beb815e1-a34f-4a57-97d5-08d972e6632a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4533A29CB0DAD8860736B559C1D49@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qET5EBzwDgKjItbje83uSPtgqvJWg9ueTuEq9jgiMb6i+7GTN21xswB0pUKt6DBaf+ratXBh2aJWAm2vbeAT1nECMI+DgV8U4WuABQDlF8CK2rrOzAqQzmTzxJvpTZoC4kxoVJdl9hIdDoMKDjwrJwMG/piiaEFIT7d6MNJVcU0ORRn+Shz50zSvcN5i+NF0lvtkKgbVoxI+RGdeXhDg+h+kBpnbNUatWw1hnu+J37SaYnr1vEiFCT0PbX/QOVrcvHJ6FY8XL/60PqPodrwpAE7ZHaZnT3eZM+1YMofR050c4cdTLPN9NVnaYiDtTNhjOFYUhC0jHmDxNRbDsNY9NfrE6xB2dqUdSYslD52QoO3C9i+8c7tnRccFM2lS6erkkW3EBRRpghxxvn7wL7+RfzOGohlVWEPVstR1JZ5h57ZYXVDz8WZ48A28xmWVKBWITad2ngAN9HdsBlG/Zjpjdjx8KfM+6auTp+qOD5rjz/cAkkWeSixz2Ke4Fl8TGHhSowrPGCR0V4kAXPcrsYNWr4EpLLNgWBlBJIe0kMRRyTp4wMeF39ccBCdMh4FCRiYfUXSRv9wWpo2c1ktJ51KKAjDzOGi6L8dvUU18Zl2TRf5HTrskuJ1JxT0inB/9jPpWp/hO+JlGuCwCbkupEG5nKWbTCwG2Ec0ShXc1rqri4lF45OcOuBcDvqe0yVw9pJHUmSPMhxXAhYe5mjUKjd0vILt+7qQCpWm/1529wPm5guulSAY8F/wv+OMyXdEvl+Rg1fKEdCMY40paNwPs639bkIF9DPdsEoDfhMEkI47VveLkJRsX5dOLrgLDL6vSQ/W1CKPhBK7ytwpvRigSgzY20+aDLwRH4ZwwXiO+FfwNIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(8936002)(2616005)(66556008)(66476007)(66946007)(8676002)(26005)(956004)(36756003)(16576012)(316002)(6486002)(31686004)(4326008)(2906002)(54906003)(5660300002)(478600001)(38350700002)(38100700002)(186003)(86362001)(31696002)(83380400001)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0c3dFdCWjZDcHd2Nk5qNHRBY0kyYVJVTC9KdFlyUkszMytjRkxtR2I4cFhW?=
 =?utf-8?B?VHdpYkhPZC9TMXVwNXNqeEFsSEdiZkdubjIzL0l2TGJ4WVlpZmtYMjlUSGZK?=
 =?utf-8?B?dXFEdlQ3SzZJSWJ6UW5TWjVjc0ZKVHVuR0hrNlJydXJTckphVHZuRlB6TS9x?=
 =?utf-8?B?SE5Nb3R5R3dnRUcvb01nQXQydVNqOUdrcmVjWlhuQ3hrWEI3dzZDRUNoQjlq?=
 =?utf-8?B?dDBRYm9VWnRWK1ZrV1AxOFNoRVo4eVRGQzB0N04zSU9UeTcyVmRNNXZyVEY5?=
 =?utf-8?B?TU1PZVhZd2cwV2ljamJGOWE5TWZ3cmlDUCs5eTVhUmpleEdZQk9kMlF0dk1s?=
 =?utf-8?B?S3BTVWtmTG1pVmFZT3UxS1c2VWxvK3dsZDVGQ2JUOXpjNzAzYUtlUng5NEoy?=
 =?utf-8?B?MWRXNG1UdUI3ZVgrSUh4UlY0dkh3ZEdoRk5FbEg3VjFCZmZiNHREblZIN05z?=
 =?utf-8?B?dFMyZjF3cFB2ZFMxVHEzRGVGc0ZYRWw2YjVqL0VuZ3B0ZEs0WjBOYS9Kei9O?=
 =?utf-8?B?RmxMMzBIc21WeVB6MWFDRDJpcFdkWXJpclJpVkY4S3VQTlBLK2p1K0syTGlH?=
 =?utf-8?B?UFRuNk0rV21ncUlLTGFrSW9rR1pTRFJrYjRTUGxueXc5ZjJUcmRlM3RTNDJF?=
 =?utf-8?B?MllmYlBPbGIrOWU3MkZNd0NVZGJGTFRFbUFiY2diWm80NDFmUWhIZG56Sk8z?=
 =?utf-8?B?b0JsSFFhRVVwTEJZUUpyZjY1RndYNmRqalo5TnhsS2Z2SmRuanFuQVh2RFJQ?=
 =?utf-8?B?Y3pCRWZCZGc5VHA2OGZoZGVzZmI2ejNBMEc3Y1NUMWI0aE9hL1dLL2c5UjU3?=
 =?utf-8?B?YjJVMDBHZVRpUUJVQm1TRkcyUkdFL2xsSjRKQjdVV3lHNlhnNGhLNzNKQUxE?=
 =?utf-8?B?Uys3dVNLa1JUcXV0SW5xeFViMHJhWXBXMXdQdHU2aUI2Ty83NXF2dVNsVGdB?=
 =?utf-8?B?cUkzNDJSK3o2bFc4TGpxWHdUMXJjRzNIUDNtcUtlNWVuZWJmSzVrRzdjTmFG?=
 =?utf-8?B?UUhCRGxDVTVKTzdGMEF0ZW0xVndzdCt5WVprVGc0ZUVTNTdEalBiQXFTK3hm?=
 =?utf-8?B?dE1lRVVJSktZa3VyY1AvRGdIVFNHTnFwandpbnZVQzhHS1dtTVUrbGFpUnIr?=
 =?utf-8?B?ZUZyZGY0bi83cTQ0NFFyUEd2YVUzNkplM2tkV3lVc0pCT05Sd0lxZ0RRR2hT?=
 =?utf-8?B?WE1sSTIwQkthRzhBdTlVRFF2WENzZDF6cjZIR2NCUDlVS004YThrRVIwK1pY?=
 =?utf-8?B?cnppa0dRRmovRTkwYVJHYTREMjRWV1FzZnJKdFQ0cTRrRTh2TUNGNlBKZXM4?=
 =?utf-8?B?K1I2ZTRuRTVhZXc5U1VRdHhXWU9XT1Vib2JnYWhWUm5kcUZKcnRPQXpYVFM0?=
 =?utf-8?B?R0tXOFpiY1NnZm5UMTRKcGM5blF4b0o1Z1FHM01QZlJxNlBHdHJXL1NnWDZJ?=
 =?utf-8?B?anNjaC9Ha0F6NVp6T0FsSmJRbERSM0hhVmtkZ0IxMGdwa2lTWGdpNGFQK3NO?=
 =?utf-8?B?NVlHdldBemE3WERsT2t2Y0JxeSszVDdvTlFRbmxIOEFkbTNGT1l6RHMxNGRW?=
 =?utf-8?B?WWg0amg4SS93cDV5ZlpnY0Q5TlpSSTMycnk5M24rd09MREs1U3U2MTZtVzlp?=
 =?utf-8?B?SGZOZ05FdGFHa2hWMVQrNFdPcFF1bFdFZndTY3lQZWltdjcxZEdwTCtCdTNJ?=
 =?utf-8?B?bm1tRkJGUHhSRzhZZnhKQ2x5Wk45WFc0b1BRVDlKWDdaN3kvKzBFRVd6dUJq?=
 =?utf-8?Q?mE21XXasGU2mE3dOOl0jKSOBHvgO4ldjNfjrx4j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb815e1-a34f-4a57-97d5-08d972e6632a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 16:33:28.2521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0k105XIzfV1ljG/EUZriFhMFoT0OyNrB7xhkE3p5TMsWEeTOIwzqMQBcw8OpfHqKORmzzzSdqXuyVVKomi+yxpAthdesEBmDMP814ru7fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.8.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_NONE=-0.0001,
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

07.09.2021 15:42, Hanna Reitz wrote:
> Callers should be able to specify whether they want job_cancel_sync() to
> force-cancel the job or not.
> 
> In fact, almost all invocations do not care about consistency of the
> result and just want the job to terminate as soon as possible, so they
> should pass force=true.  The replication block driver is the exception,
> specifically the active commit job it runs.
> 
> As for job_cancel_sync_all(), all callers want it to force-cancel all
> jobs, because that is the point of it: To cancel all remaining jobs as
> quickly as possible (generally on process termination).  So make it
> invoke job_cancel_sync() with force=true.
> 
> This changes some iotest outputs, because quitting qemu while a mirror
> job is active will now lead to it being cancelled instead of completed,
> which is what we want.  (Cancelling a READY mirror job with force=false
> may take an indefinite amount of time, which we do not want when
> quitting.  If users want consistent results, they must have all jobs be
> done before they quit qemu.)
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

