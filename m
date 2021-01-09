Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E72EFEE8
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 11:13:03 +0100 (CET)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyBEz-0007pb-Nv
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 05:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBDa-0006kX-8i; Sat, 09 Jan 2021 05:11:34 -0500
Received: from mail-he1eur04on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::702]:43073
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBDX-0001Pr-8m; Sat, 09 Jan 2021 05:11:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbnKViQ112V1bYgBUWkEhm5/kjSdJm77paSOvOyRKu7ro864A2ecY0/JQDI2XUpdM15o7gDby4/kCmwh0H4YcSLh/WRr+YgKCi2PCRsNK+6UnoFG/6I99NspqVcwxWJxneIgh8VQec3ImGowrIC1emBkRTFydq7pIM1yWdjJEprGNFfjoU36fHOv1QwI45qhDjRK+PKeTqwI6JHRzqKS5mAzQypwMZt9GbyNk+uirmPFSx+ZA/xB+ZFS1gd7jR23wO9u2uO6/KZA6wj8j2cDImxhBzb6E7NQw/A5FdJNpM7BzViJFL40VLQDBWzJB+0PaDIOZZq37bGR3PQ6jK+PFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+ndc//cA+P8txja0Mypbyps0X7Kw8rhUNDKgPXDm1Y=;
 b=lZCGl7FLZ/igZQs+tbl9TNJfuLaqSkB5IziqsPsYNrPcknVtobuYj0TkkCQgsg66sXnbEXeMufVLjQWyUWkqE85T9poKn8TI60t7a/HHVxer9Iz7GUsKMtrNcSUcPwsncBvq+3OzVKCdoZq46s3imqF4Aw+oc4MdLB3W58ZmRrhpX+R+aQGzFxFUSIKsDDydwXIQ+Ggggn/nYb6l+q3YvOW9XDl3PjpXS+VO1VCaQ8CsOuJFroZlOl4bavqLQ/lmwXLJqHHKnHs1Grgi3HnPEPCn9FWQThH5PHuO2UNLcCrjEbuoXvZ8Saf7wT+jvJ6wFQ/ch1vJut1ooobR3Lir3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+ndc//cA+P8txja0Mypbyps0X7Kw8rhUNDKgPXDm1Y=;
 b=mX8GCO+Q5YxfXetUQSdNbwlp+/koQirnlbLMsESdFJDISlMFoKvsJBFUWUxhPIxOTRrdqtX5wcHbfI41Ns1ZcoIlIiB5+fSqaBY2qlfQ95FoEqdXkbieh7NYRq4M1IfTNAE3JJQWwetHbZdGf16ZqwA88iUAqt3G/kIIgkgfxcc=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 10:11:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 10:11:10 +0000
Subject: Re: [PATCH 00/11] mirror: cancel nbd reconnect
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <ce2d8ba1-14f2-104a-3304-c15cf0cda954@virtuozzo.com>
Message-ID: <e0d5a602-595e-a5c3-1a21-80919667bfde@virtuozzo.com>
Date: Sat, 9 Jan 2021 13:11:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <ce2d8ba1-14f2-104a-3304-c15cf0cda954@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM9P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM9P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 10:11:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e24d322f-938f-4735-ffab-08d8b486e393
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB628088D446579F0A1D5F6EF4C1AD0@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AT/KpsF16lTXXejH45lwoj33SoPu2igX0Cr0MeZmDjnH69Rhr7v65M11hU1kcZbC+VO9f03ZdnPch0qAK0VaxppN+TXEzZO3aO6180KaxpkdP7fCAH4cNqLbKjXRo4aKbyU48e1kaJ/VbY3b4bwBmL/a/NKocjzWsnir7X5FSrfWsCB7wlzLtpV+i/OT6hu0B5Nqbdq3D8jKjiewMzaOntUbdyH0K56AIEBRFsKrcOfcCf9Vf5T/tFtHD58RGrujdyfJYvv0FfWCcmbbtgkL5t/DaklTJ64VUySr6Nklig7AOmTxkPAjBwHHw1MFjYB9zks8rSIPTQU1aP1ajswmIRwX3fKntdRZ9dEZqRA+a78cA03yKGHpypMQv4onnGveL63gtXdsBoJVEirRfPJVsy9W0s7hTNoFMoq0zhekg2d10TSbrCnqZT17iBA9mwa4gvSkH0jA94QiQgnt2Xz8GCgGek5vf0s0kuXea2LNiV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39840400004)(6486002)(83380400001)(86362001)(16576012)(36756003)(478600001)(316002)(5660300002)(31696002)(31686004)(66556008)(2906002)(66946007)(107886003)(6916009)(8936002)(52116002)(2616005)(66476007)(956004)(8676002)(4326008)(26005)(16526019)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bG1xYnNnN2xhUzliVGYvakN5b3dESGROY2ZLQm1TK1o5NlNkOTNWT3J3NW52?=
 =?utf-8?B?bXM5Z3dybUI3N2Y0NmhXUWxKTnY2aWdZMmkybWFGMlVpcTFKRkJyVktNSlQx?=
 =?utf-8?B?SzNHanRUNDBCZGpGYXNhaG9yM3d3Um5MSG5GQVU4WUtYUTF1Q3Ruc3hRQlZ5?=
 =?utf-8?B?enU3RExGUE5oYUVTL3RDR1J2MVlremxaN0dYWkE4NkV3RE50Q1dLc3JKV2Fh?=
 =?utf-8?B?Sk9yRWgzL3k0TW5GdThqdTl1VWovSE0zeW1zb3oxZzBaNHc3YlA4SGRkdFVm?=
 =?utf-8?B?Tm5DSlF2ZFNmM0xycExYalZ2Umg2dFNGZ2lZenhIZGUrODN0aUZ4QzkrY0da?=
 =?utf-8?B?bk9jRVZ0TG1pckxleHBTZmlPWUtmb1RyOVdPOWZZTTJ5eGlrY2FYVkV2SVow?=
 =?utf-8?B?SlNWRDMveHdCSDl1bTFNdGl0VjNXSUtlUWIxNGFjL2k1MFhNMm5KbnhOcFhL?=
 =?utf-8?B?cWtqVmFVaEgzdVVEKzhrNHlZTHJwRWxiVW8xdlNIQ1JIOFR3YW41bWQvYldP?=
 =?utf-8?B?SW9YRVZiaEJBMDBUdHJKU1p5TTI0cnU4K0U5UDlZMDdhRmFNTjZWWjdhQ3ow?=
 =?utf-8?B?cE9MUzNwZXBtazh1eEJZbUhrR1M4bHRXSW1OMTN1aTlNcVpRTmxPcjlKN1lW?=
 =?utf-8?B?V1ZGS1ZVWG9rdTJmejVBblFFWXhLMUo4ZFRyN05LQnNGUXdZWVFqblNMT2Zv?=
 =?utf-8?B?bzR5VkxCNmJxQk1vVXdnMXB0dElZR1VqakFVbkFHWXJNNWFpc1Z0dVRXbVFY?=
 =?utf-8?B?dnZIM2xoTXpiTjlxbkdNQUNtTnc4M0NBdCtkUUVESXhHTGs0dGZ0WUVDcUJY?=
 =?utf-8?B?bzI2SDFxSlZBd1duS1FrcmpnUzFpSTBiakZSbjlMNnBPeVkrbmFvTFRqYVZj?=
 =?utf-8?B?TTYwMEt6WDVhZCt5NWdHcmY2cEhKZm5jY1hSRGRzUC9rZG9vcEhxRUZNbXky?=
 =?utf-8?B?TFM2K1JQVEtOdC9Ca1FJTUpFSEJzSFFWcDNvbjJTNVB2OHVWSjVVc1ZteTg3?=
 =?utf-8?B?Kzl4Ynh5RlY4ZEZLZ1dOZm95djFGRHZ3ZHRnR1dxdjAwSmxtdVEvVTJMM1FT?=
 =?utf-8?B?QkI3bWtNdXdqYjJzU0M1T1ZnSGg3MGl1dlVTMnBLaVBNUERyY2Z6dC9hSjBj?=
 =?utf-8?B?Rno2d1lVZnIrc1R5VWI5T3N3Nlc2OWljUTJzUEpqM3pHcWZoTVd3aGdGcHdv?=
 =?utf-8?B?MVZWeFdpMlcrSENudFVQV05tRGlHTlp5bWpuWHlDTS93MUF1cW54NzN6Ukdw?=
 =?utf-8?B?L21aWHBLWmNteXpGd3FBQ2RDWHc3dUtiMzl5Kzc3L1ZNL2E5MDBVcHErWFcv?=
 =?utf-8?Q?je/oZGY1t+IbA9UuJhSHNC0mL0q73dLZ2B?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 10:11:10.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: e24d322f-938f-4735-ffab-08d8b486e393
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXV528cxEdNrzcYlHTWy1P7dUg5ySsP5hAmIH0WzCmIPW451ghBE0/s7pF8b8eqZZg9F6zWzxGfXxUB1XYHIEA82CG/aM6YDIhY/Qa5YDnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=2a01:111:f400:fe0d::702;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping ping

18.12.2020 14:05, Vladimir Sementsov-Ogievskiy wrote:
> ping
> 
> 18.11.2020 21:04, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> The problem
>>
>> Assume we have mirror job with nbd target node with enabled reconnect.
>> Connection failed. So, all current requests to nbd node are waiting for
>> nbd driver to reconnect. And they will wait for reconnect-delay time
>> specified in nbd blockdev options. This timeout may be long enough, for
>> example, we in Virtuozzo use 300 seconds by default.
>>
>> So, if at this moment user tries to cancel the job, job will wait for
>> its in-flight requests to finish up to 300 seconds. From the user point
>> of view, cancelling the job takes a long time. Bad.
>>
>> Solution
>>
>> Let's just cancel "waiting for reconnect in in-flight request coroutines"
>> on mirror (and backup) cancel. Welcome the series below.
>>
>> Vladimir Sementsov-Ogievskiy (11):
>>    block: add new BlockDriver handler: bdrv_cancel_in_flight
>>    block/nbd: implement .bdrv_cancel_in_flight
>>    block/raw-format: implement .bdrv_cancel_in_flight handler
>>    job: add .cancel handler for the driver
>>    block/mirror: implement .cancel job handler
>>    iotests/264: fix style
>>    iotests/264: move to python unittest
>>    iotests.py: qemu_nbd_popen: remove pid file after use
>>    iotests/264: add mirror-cancel test-case
>>    block/backup: implement .cancel job handler
>>    iotests/264: add backup-cancel test-case
>>
>>   include/block/block.h         |   3 +
>>   include/block/block_int.h     |   9 +++
>>   include/qemu/job.h            |   5 ++
>>   block/backup.c                |  10 +++
>>   block/io.c                    |  11 +++
>>   block/mirror.c                |   9 +++
>>   block/nbd.c                   |  15 ++++
>>   block/raw-format.c            |   6 ++
>>   job.c                         |   3 +
>>   tests/qemu-iotests/264        | 143 ++++++++++++++++++++++------------
>>   tests/qemu-iotests/264.out    |  20 ++---
>>   tests/qemu-iotests/iotests.py |   6 +-
>>   12 files changed, 173 insertions(+), 67 deletions(-)
>>
> 
> 


-- 
Best regards,
Vladimir

