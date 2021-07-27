Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF343D7B71
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:57:55 +0200 (CEST)
Received: from localhost ([::1]:33936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QOv-0002jn-TD
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QNt-0001rE-58; Tue, 27 Jul 2021 12:56:49 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:50156 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QNq-0001ib-45; Tue, 27 Jul 2021 12:56:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B36mP4XD06WzXiS/t8D8KItxr0rnJVLc00m3HFgQi61lo/KGIKTTkL9hRGFK+R6WcFSIu4yEw9qSQlvGy24vKytWQK7teSqobEVyeZNjLPKlAqFX9xvR4hk6YOUuzcqSf1VZ1oNgNxoHfxBuZMYo9UOmPoYIgtkPELO7yKZIK5yM2jvnQ80hhSk7mvRzGdYRFNrHKKrHZCH+rb0U5MhrNf2gKUMXaePd+pYnkkzzYuBpJq74fYUEX90MTgE7PKXS5SE3kQYscR7IEEfHiXHuoYrx+2N0khQFEg8oIXrGzf6dD6sp4Bd0+X5g1CAxup3sLsIyq7AcIzd8p4Io+3ZeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiDzq+Ivqz/4zQIC1KeZsD9XesQvoZwz5tz10mAsRn0=;
 b=HM/UKTqFXias2ribReZSyrkpoII7OkdV90gR50KBu6/Hz4W09d9QuIqfvDXof+p2nt+/hnHqm809+8Wdn/RiBOG3+dCeNftHhyc9Ja/GAk0iKsRzaaoQZW4vj30uOEhz4pnTY9D2GmGQresHMJnfiDukJMxBj0ufpotwCX/FbJ40YNVEh3qaRjjIOKR9Ya1Rs7aCLsTkrZLRMTVUAuugm1TpHbKEjX3p7GvvV3UYNa/Cw2zYxvsylZbbWHBQjWXSohZzU122MJhhX+8X2qFZBNktNaizorea1pmY33m+5/L0knbcKh4E4bkI1YgbRX4q93Y0/dXKgUTIaNLDJKKspQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiDzq+Ivqz/4zQIC1KeZsD9XesQvoZwz5tz10mAsRn0=;
 b=QfMh5FIz8zfWIb413LvBk7bdzBlWVHa7v5tXUZxYczSEgdzdW2USyy+VdrzSZu86PjjnpFcjayoBNVKqXhWSVnJJF7hWCDPM0k68Ongrd1m9yfw6figo8pOa9pLHX4QIxPO2arzkaw8Cg8sKXG4bqIXpp0LGXU67zkVrQyyg/uk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 16:56:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 16:56:40 +0000
Subject: Re: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c353b9ca-d181-670b-3388-3b9483d07f44@virtuozzo.com>
Date: Tue, 27 Jul 2021 19:56:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210727164754.62895-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Tue, 27 Jul 2021 16:56:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 984c63bc-63b7-402c-1b46-08d9511f814b
X-MS-TrafficTypeDiagnostic: AM7PR08MB5335:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53359F188B55214247E47DB1C1E99@AM7PR08MB5335.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppp225brLxSX6u3i4G0295PzbzmXXcquQ+wc55nbzQGG9n6bK/HD5cM/xqYfIrodOZNcl/f/RiBQP99Tpr1YJ8nUR3tA0EbOAlP02nUNtvoT0QMXk35Qz1z5s9gzip4/6WW+Kl0H6vZqgpvmwKxZLjp6Fi5N5BR3NxG2G9Z53s+6/pYBujRIzFSGgdpHQwTLgyHBg3QaeZR1YL/UsbiLTxJuPWUtSQvkkh9J6KVpzCc9yObh1cDJiTKvSSg8/HB6Pfm90kfGwrOXuELdWKXWFDzmBQolW4HgoY8Tx/91QBySSgjWjBAH4SCs7voROMdNYawvZqRunQ66/qxmyDLSE214WV6uTosBlublg3htAMgRCOxmelaPxs6ZYh4D/PFF/k39p1i4ayQFU95V0QQaw+bO/BgCtcOb4yrNwT0gSNbhEZMoOLodXndiU+qH3HhGCoyKNze1CQpcxUQ000iYHTfPUSPXGenCisD3P2pTDWPRLOn5gIiSFaU41On7m31lc8GTlEl8d0/pysNAaTReBjN3Zz/f4qypI010SI5RZ+RCsmz5UzIkdHbvf0MMQm7uiL4IGV14qB/lfQgT6inOLcx97hGzxqUW6B1mG5HFTHSEdi69KjrNzMoHkcPgtDXq2ZoHXG8NghDghJB1Ilqri6DO9psmwY0fYF4xjwmYAuw0kQft369FT/+wuCOcJV+FTD1X0Y7E8myVZWbRyL1+Kp88Fu/LdsU1zwz7Dv8nO+ZQScQ9u9PPE+1pXlzbz+OpOMczbnoFinSsRYUPgC4SFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(376002)(136003)(366004)(86362001)(6916009)(31686004)(26005)(8936002)(186003)(2906002)(2616005)(478600001)(52116002)(8676002)(6486002)(66946007)(4326008)(316002)(5660300002)(66556008)(38100700002)(83380400001)(956004)(38350700002)(31696002)(16576012)(66476007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um40OTBKazZuZ0lZVHNGSFFQcEJIMVZBOFJxdVZCaVoxV3d6SFJQQStzN3NI?=
 =?utf-8?B?ZTEzWDlsUTRRYzYxcDZKTTl2dWhmdGtXQlpWdmY4V2IyM0l0QXJjQ01GYnQy?=
 =?utf-8?B?SGRoUXlzNC9tQkIvQ0NHUm1kdUxoQk1YcEFIdWtrMlVSNjRvVGNmUXMwdXlx?=
 =?utf-8?B?UGdwSE1IdHJGTHdmazBpbmhrK0x5N1Y0YUhsM21vbWV5dEhyWmhVUVUwRXFG?=
 =?utf-8?B?VzNGL3haYnRYTHpMVXRLZzl3bzNLYit4NlNYVFFleXJScVpJWHhBQlkxcnNT?=
 =?utf-8?B?dk1WSUt3dWg0Nk9WSlNWNThBZW9KanJobDdyaXh5bFd3R2ZsREJqazhKWFVp?=
 =?utf-8?B?WUVsTEUxbkJjOVV5R3ZEc01BeDBKNm1Kb09kYWFxRWpUbTlYQ0VjNTMzbU5X?=
 =?utf-8?B?d1NZSG1IbVZKR3VqcWs0MEdGd0ttY2djRDBBSDM1MVJxUWFlVFBDbjZlUUt2?=
 =?utf-8?B?VkcwckRlN1VGT21mdU8vdUN6RmFQTHkzb3RTTjNjQVdYZFU1OXFEQjRLbDJt?=
 =?utf-8?B?aFZKZFBmWWdyaHFnRkoybDF3OVkyaUR6UUhmc3JFMTNGWUdHbDVRUkZJdVVN?=
 =?utf-8?B?WVg0Q3FDajRtK0FqOE1xZXhCVlZCWk9RY1BVSjR3RU1LS1B4c2I0RTFNd2ZJ?=
 =?utf-8?B?UkdnU25JQTlJZG1YVVBIclpBaHJ1b2NNczRlc1oxWk9KTHhwVmcwVXhwc1No?=
 =?utf-8?B?ditMaytjVXd5VHpTVnNyY215RnZQRGljUHpJSnVPd21SV3MxQmt1aGFIYmpv?=
 =?utf-8?B?N3pCTnBWbkZxYjdkb0dYQkZRd0U0d21JdkMzMjRHOTJkUmZZUVRDOUZONDJF?=
 =?utf-8?B?VlBLcXZZMVJvTG5HenZDU2xwenpCbFU0VFo3Qi9tV3pQSW5VVGUvODcrUXp5?=
 =?utf-8?B?M0grQ29icllYNnBjOC81TEtmdVBVTWxBVHBqNTlEWUVBZDN1dnZyakxub0FM?=
 =?utf-8?B?b1ZpSGtMeVcrdjljcjVyQ0FyT1BkazZsY1VSaGVMNC9LZWZPd0F2eFZtRXRq?=
 =?utf-8?B?bGs2TVpMRnhsQktLSjVjWkRFbkhqZVZoUWtTVkpzVW94RnY3SUVIWGVaUXVk?=
 =?utf-8?B?UTVJOHd3TXZKcnV2dkpQdmJTL2NtbHBuemJqdTdRK0JiODFKUVRmQXN4V1hq?=
 =?utf-8?B?QWV6SWZscVVuVDhTWWVhNUZJOHphM2Z0Q2djL3VOTXZwNmx3cFlUZkNrUC9C?=
 =?utf-8?B?dVBpRkxDYWJYVkMxdGZjRmd3dVBJQ0orRjA2VmwyU1Y1RlNzQXVRWHQ2ZldE?=
 =?utf-8?B?QXdnZnBGTVA5ZkFWSlhqMmhaWFlwbkluck1rMkJHR1d2UzdEdlRGYm9VZkVO?=
 =?utf-8?B?ZEU3UEhvSXAramlra1Y0WE9JL3dzMnU1MFRFWlBrakdTc1BEdEE0cng5WTE0?=
 =?utf-8?B?MUxXQmF3M2ZDalNldFo0czhod1RlTWJhM1o5R2xjTGxsNWhqQ29acFB3S0hs?=
 =?utf-8?B?SkxlbnJlNXNaRjZTNFZ2NkdDRkkwckM0SGJ3cU5raTBnaDNEdGtySnlNZzlk?=
 =?utf-8?B?emV5SENSZ0Z2b2NOQ2hJVGJUdkJWZlA3M1EyTi9jWUVPRWo2RHF5YXRHYlVU?=
 =?utf-8?B?MzJnZlpIVXNoWkkrNytlZEZZNkxTeUZib0duSkVPaXE5Zk5jaGlDQTYzNGJj?=
 =?utf-8?B?QnhyOG9YVzFKREhETXRSVU0rZyttc0VZZmd2L1lYU2RqeXYxek85WEtLQ3BY?=
 =?utf-8?B?NUUvWWZmYW15ZTU4NmJKenBnNmxzQjQ0YnZsUDJrZUdUZDltN2JjcG5sQS9E?=
 =?utf-8?Q?x94IwfiDarQXZ1M62G9lM+EOWONfs4+Y3Z9dltx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984c63bc-63b7-402c-1b46-08d9511f814b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 16:56:40.5859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNfjv/wOccjfJ49QyDXYdYv9QUoq231GjFasr0AjK2k2V1/ebSeRQINjGlvL5gbvTD7gd6xbUq1ZZ6e1ghc+JEacDivHYYB+OMpK0puAXiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Received-SPF: pass client-ip=40.107.8.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_NONE=-0.0001,
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

27.07.2021 19:47, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> That's an alternative to (part of) Max's
> "[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
> and shows' my idea of handling soft-cancelling READY mirror case
> directly in qmp_block_job_cancel. And cleanup all other job cancelling
> functions.
> 
> That's untested draft, don't take it to heart :)


Side idea:

Instead of this all we can do the following:

1. Add new interface as alternative to soft-cancelling READY mirror.

It may be argument to job-complete qmp command, or some separate command to change job parameters, or just an option for blockdev-mirror command (may be our users actually know what they want when they start the job).

2. Deprecate block-job-cancel command (with recommendation to use job-cancel and new interface [1] instead)

3. Wait for 3 releases and apply patch 3, improved by dropping block-job-cancel at all.


This way, deprecated interface remains buggy until dropped, but that's not bad. It's good actually :)


> 
> Vladimir Sementsov-Ogievskiy (3):
>    job: add job_complete_ex with do_graph_change argument
>    job: use complete(do_graph_change=false) to handle soft cancel
>    job: drop force argument of *job*cancel
> 
>   include/qemu/job.h               | 19 ++++++++----------
>   block/backup.c                   |  2 +-
>   block/mirror.c                   | 33 +++++++++++++++++---------------
>   blockdev.c                       | 13 +++++++++++--
>   job-qmp.c                        |  2 +-
>   job.c                            | 27 ++++++++++++++------------
>   tests/unit/test-bdrv-drain.c     |  2 +-
>   tests/unit/test-block-iothread.c |  2 +-
>   tests/unit/test-blockjob-txn.c   |  8 ++++----
>   tests/unit/test-blockjob.c       |  4 ++--
>   10 files changed, 62 insertions(+), 50 deletions(-)
> 


-- 
Best regards,
Vladimir

