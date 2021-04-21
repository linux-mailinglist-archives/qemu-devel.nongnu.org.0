Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CE3366707
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:32:37 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ8Hj-0005E4-EC
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZ8GN-0004ih-N0; Wed, 21 Apr 2021 04:31:11 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:46112 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZ8GJ-0001kr-Vz; Wed, 21 Apr 2021 04:31:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGj7Du+3NQKm1onmLzH/3u8o47x39yUEWqnnQcM998txxCo3qbPjdUYzJ8XZAHoortvWFesl1XkrWE79lwLpBcOCN29LEyjhI0+i1RxZiQ1xWp9OWkkVXrnwhDzaU5rL5n7RMWGHr0BvFYdxEBjFddli0z8hP0zzSeMP7dFdBu0PwU1ms9BSpvR+pYm/eaj+aZ7POb1bBoQp9iAKqbhPgy0W5HbPBA9+1698KyJC3FgNlSHz5VeYlR5Ywnkyu1okeKdPU3r3Ug4F3qjlr88Hb2m5UCuHg0I3rRWaD5ZiSmJiuVS2w5+e4+Vg3b76zq/nLhsHbdMZ9CKU3QXCc0PQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlpvROQPV6yLEjgz3xGdYd3HgVksFWjGiC7N6prJdw0=;
 b=O/FM2ghqGuhctdWUhEeHoR9AuFh0GlswrP7sxxqtfoswqDjJ1RX6E1TOE3gwmmL/xqB1hK1b7xyuVz4tV2nCX3w2EuaNkoacpQrexSP9BzFnaQ2EEQglHfy5bzhFWhF37YtTSqLDzdezrZXXyR9od2wDAiqLu9Mw0g8i2gfXchFHzBvR0YXVMV96WIVBu+yCBBswTCqGxDiKpsSfJLdEKxOTIsu7z3663KtlWloyGpBnETDM6wFwE443/jrHK+Y+6kbiL7ZP/tG5+UkFolCx9z4i5voz0TQPJhlyRun39TdxmCAXLzkRVCgMcmQllK1flgwfG5xfd6k/7lyYkbeGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlpvROQPV6yLEjgz3xGdYd3HgVksFWjGiC7N6prJdw0=;
 b=EYXvC4tGdJqxcwPtdxty5RGidO2md8Wq3OmQmW3ZrF5p+ZS6wLU/xMdMmXPcqIwsU62HIekRO7Hi9FNGKVSZQiSJ80dj80GjqptbXcF1XaEAVPNqa+2RQrC1KURG7WhZK94/q2gOzGKCUpUH+9raB7FM2lreolyO4Bp8K9Hfi8U=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 08:31:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 08:31:04 +0000
Subject: Re: [PATCH v4 09/23] job: call job_enter from job_pause
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <20210116214705.822267-10-vsementsov@virtuozzo.com>
 <7dea84af-188f-1145-0e4f-afefd9652256@redhat.com>
 <062f350d-5194-393b-5725-953740ad4b0f@virtuozzo.com>
Message-ID: <97630ba3-af42-9c33-30b3-bdd9aeb0a5d9@virtuozzo.com>
Date: Wed, 21 Apr 2021 11:31:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <062f350d-5194-393b-5725-953740ad4b0f@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Wed, 21 Apr 2021 08:31:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 686913b9-9e7b-4939-5844-08d9049fcd4c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6808:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB680811A3DFD8BF0671E5E255C1479@AS8PR08MB6808.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0fhrEVFPILm4Xr4IvfCLtYCBBm26SejVxL501FdipXRhcnkZm9u29LwxFeNy+UEqWCcE2qxmmBhl7hH/PbFXqcRw686pmChKV1tVVkS61b6LnMWt6q7bKOYDBlc3xL3STb8Z2mbOITx+MqtzbJOfHGbVAG56QKAWBZZdCtnlmOeEYxbj2Rh2NFOoen0ehQSFJvS8lq88x3wDVUJC5We/NUuq45wskC8BIJeqiANuL8OQNWD4HUJnA9n5fUd4CRdNODG1cWlNhCDLeT2ZoFv2gsSPanK4BxM2kIsjnmXDuPUekX1E+BliWyF3ZmrqM/TDDUC0+iGuCMwKQ4N9IgEt/qC2cWuWRuuJcQcacDKbsIRnGEC+KsrZkG4UUCFqPVn1m7UV+RIyr9Y7n/mU2ySqTH+S832R6kptKq8QYGTj7EzrPdgtfkyFskZkOdUidow1GMl+uq589BLt0+8CkknUG2yPmfDw5Q+O0yJhKpVKpa+tormxw+T8CmqTD2e8mhKdaOfMhO6AohBFX5U6r8ul766PzNjoz1eNij4naiESg7vYRxM1m/viEf6/hUwG7/xU1iP7krIVHYF1WOJB9WNikoEusPw1dG+De/X8mY8XpiQJiYW3Oni/vQZ+JquhsZRdr/n/D+RnS9uTfheEJRwUapV9Mdq3sqpGYDPXqxFBvfYZZOeDaYBr92XQuS9y5LsiaAikrXbXU3YyID13zBON0EzRLtbutKtZRGiHJCKOVEZC0XLxdRMcDlRCjZaQhPVgLOk0P0qj4iH5U/WzJLtjDpFKOcnLd9Phlom6xWOeTY+HG1oHHdorwVGukyzx7hSv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39840400004)(376002)(136003)(26005)(186003)(16576012)(66556008)(38100700002)(956004)(4326008)(52116002)(36756003)(53546011)(8676002)(966005)(16526019)(2906002)(2616005)(5660300002)(38350700002)(86362001)(6486002)(31686004)(478600001)(107886003)(8936002)(31696002)(83380400001)(66476007)(316002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUdER2xDOHVoUmsyT2hMVmwxZTRHclpPTCtXckg4ejhod0ZKSGR2M3JpMERn?=
 =?utf-8?B?MjZjaHphc01JeENRVzZ4bW04Rzk1MDdBa2w1RHY3SHlJOVhRd21KZEV2cUVE?=
 =?utf-8?B?V3FWd09XenE3SVBqVG5YbitGZVM0TjBCdVdjRGlTampvcHgzMHBsaUhPN2Ja?=
 =?utf-8?B?S2ZtUWRreHlrTG10RXNJOGtNd21QQVFnbW5TM2ZmdFFNelM3Z2JDZDFVVnVz?=
 =?utf-8?B?WUlRTGxMTWh1c0dLcmpHSkhxMzJ2QWd1YXNTTEVOUTF4Nkp0YlJMSnY0SGhs?=
 =?utf-8?B?dVVUZmQvbTFQOW1GMjVpanBQbnJPelcxeCtiRURMeVgrVW5qQjBXM1J4QUJR?=
 =?utf-8?B?ZmNPYlMrYitZbk5lMnlOMEgrMnNYVWc3alpITVg2SHB4WnlTcFNqSnEwcXJV?=
 =?utf-8?B?UC9RVE9Bb1pvUC9Qb2xlVURwbldXQ1NPZkRDdVJyaVVOdkp3MlpqSmF3TCtn?=
 =?utf-8?B?a2M4cnYwSXRZdjV4SVNCeTZDbk1SQ1IzOGlsSUdlRkZTWmlzT01NaWJSU0ZJ?=
 =?utf-8?B?UE5NWENnK0pobHBqY3VYUEhSMzI4SmF2bXlKdGcxdzhveEZEMmc1dC90WjRh?=
 =?utf-8?B?d2Y5bUlrRUY0aFJ6ckFIRWxJa2QxOFdRNEVLd085anpnb3NwQ05yQ2lSL0hS?=
 =?utf-8?B?YThLdVo1Y2pnMzVPZE9SV1ZkOWttcmtwcnE3RlZ3SDNlWEZCeUVJY21VcXdO?=
 =?utf-8?B?MGZKNll5alJyeVRSc1ZjMzVyQlNuUUw0MzJUY3kxVzRwNFg0R2dMRjJ6ZFdk?=
 =?utf-8?B?SndxUnZWbEdUbm96b1lLaktwZTQxT3JweGZyOEhOVy9LSkQxdnBVaEgrUHdy?=
 =?utf-8?B?Q1NJeGRUY1FBWXpnQlVNWGdnVFNKNHJPWWhQZ1Z1dWE5c2RNdzRCWG54ME5G?=
 =?utf-8?B?bTl0RHR4M0tSV1dKUmtFUHdVUEhCWC82d3FveEZ3dVpJb2hLTUhOR1MvNjVa?=
 =?utf-8?B?bGNrSnNCN2F1alNuMXBFL3FUdzVNaGE1NXo3ZmFmSHBkWU9RYWdLTTl2ZFBi?=
 =?utf-8?B?VHJ6YXJ0MXNmdXh4WjJ4dnB2ekVjT3o3SDlWYVI2YTBkMDRIWkhqRUM0WWFt?=
 =?utf-8?B?WHlEdG1hY2JYUXBmWXowVVBmVnRoT0k3YkMyTFBVVmZ5ZU5iSnpJVmFGUUJF?=
 =?utf-8?B?T05QbWlRZXY5ejRGTkMxWGVFZmZGK2lzMmNqTUNPVE5xYkdGU1g3OFIyT05E?=
 =?utf-8?B?L3hXNFZQWXNYMk43WlphSERUT3gxK2EwMnlsOVBXRlUydldlYTd3R1F5MUNi?=
 =?utf-8?B?bC9xdGNmRnAxdUwreXhwc1ZxZ294Q1I3Nld3aEdnN3dwcTZXdzVEV1RoY0M1?=
 =?utf-8?B?c0FaZE1ONk1kM0NpVXJ0aFVhNDBieG1QRkFTRzV0TUFObVQ4MG9UZ2JmTzlq?=
 =?utf-8?B?K2VPVFBERFhFc2JXY1hiQ2RacnRydXE0OW9HNFFSV1dCTjNXd1l5RDR5b1N6?=
 =?utf-8?B?bFpKQ3dPUzY4U2ZxOGFOSWJJTVJ4ZTJCbE1FQ09JcE5sQ0t6Nks3dGdrNndC?=
 =?utf-8?B?N1kzQ09FQVh6dGVWazNUU2RFTEpnUWdnNzN0MHFkTUJzZFlmNTFObHJEaERj?=
 =?utf-8?B?M29tWU1YTXg0ditzU3I4d3ROckdLMXlpQm1TeXpQK2Q1OEtRK1R0TGtmUVQz?=
 =?utf-8?B?MC95bk96SS9ud0ZhUFRkUGdZU0ZSYVN4OS9BdlZvQXE4US9hNFhVeUJKRzRC?=
 =?utf-8?B?SmRSNms0K29sbnhua2V6N0R6ci9vYWhGcldxblgzMUROVitqZFc0QnMwVUVZ?=
 =?utf-8?Q?e7FKOAdMzonvahHxqGsw6EwrH7GP+Iq79f+QWwc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686913b9-9e7b-4939-5844-08d9049fcd4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 08:31:04.4406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGvMtKFCwerIKwAyj1ElBE1PDuUWLZrOb6UbYUcLWUIdYCcrrPdgm5P3oA513PtnLnNihheqqb7YWpWPmsnbg8Zu8Vd7XfzJ5KUYAoJLkew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6808
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

07.04.2021 14:38, Vladimir Sementsov-Ogievskiy wrote:
> 07.04.2021 14:19, Max Reitz wrote:
>> On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
>>> If main job coroutine called job_yield (while some background process
>>> is in progress), we should give it a chance to call job_pause_point().
>>> It will be used in backup, when moved on async block-copy.
>>>
>>> Note, that job_user_pause is not enough: we want to handle
>>> child_job_drained_begin() as well, which call job_pause().
>>>
>>> Still, if job is already in job_do_yield() in job_pause_point() we
>>> should not enter it.
>>>
>>> iotest 109 output is modified: on stop we do bdrv_drain_all() which now
>>> triggers job pause immediately (and pause after ready is standby).
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   job.c                      |  3 +++
>>>   tests/qemu-iotests/109.out | 24 ++++++++++++++++++++++++
>>>   2 files changed, 27 insertions(+)
>>
>> While looking into
>>
>> https://lists.gnu.org/archive/html/qemu-block/2021-04/msg00035.html
>>
>> I noticed this:
>>
>> $ ./qemu-img create -f raw src.img 1G
>> $ ./qemu-img create -f raw dst.img 1G
>>
>> $ (echo '
>>     {"execute":"qmp_capabilities"}
>>     {"execute":"blockdev-mirror",
>>      "arguments":{"job-id":"mirror",
>>                   "device":"source",
>>                   "target":"target",
>>                   "sync":"full",
>>                   "filter-node-name":"mirror-top"}}
>> '; sleep 3; echo '
>>     {"execute":"human-monitor-command",
>>      "arguments":{"command-line":
>>                   "qemu-io mirror-top \"write 0 1G\""}}') \
>> | x86_64-softmmu/qemu-system-x86_64 \
>>     -qmp stdio \
>>     -blockdev file,node-name=source,filename=src.img \
>>     -blockdev file,node-name=target,filename=dst.img \
>>     -object iothread,id=iothr0 \
>>     -device virtio-blk,drive=source,iothread=iothr0
>>
>> Before this commit, qemu-io returned an error that there is a permission conflict with virtio-blk.  After this commit, there is an abort (“qemu: qemu_mutex_unlock_impl: Operation not permitted”):
>>
>> #0  0x00007f8445a4eef5 in raise () at /usr/lib/libc.so.6
>> #1  0x00007f8445a38862 in abort () at /usr/lib/libc.so.6
>> #2  0x000055fbb14a36bf in error_exit
>>     (err=<optimized out>, msg=msg@entry=0x55fbb1634790 <__func__.27> "qemu_mutex_unlock_impl")
>>     at ../util/qemu-thread-posix.c:37
>> #3  0x000055fbb14a3bc3 in qemu_mutex_unlock_impl
>>     (mutex=mutex@entry=0x55fbb25ab6e0, file=file@entry=0x55fbb1636957 "../util/async.c", line=line@entry=650)
>>     at ../util/qemu-thread-posix.c:109
>> #4  0x000055fbb14b2e75 in aio_context_release (ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
>> #5  0x000055fbb13d2029 in bdrv_do_drained_begin
>>     (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false, parent=parent@entry=0x0, ignore_bds_parents=ignore_bds_parents@entry=false, poll=poll@entry=true) at ../block/io.c:441
>> #6  0x000055fbb13d2192 in bdrv_do_drained_begin
>>     (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false, bs=0x55fbb3a87000) at ../block/io.c:448
>> #7  0x000055fbb13c71a7 in blk_drain (blk=0x55fbb26c5a00) at ../block/block-backend.c:1718
>> #8  0x000055fbb13c8bbd in blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:498
>> #9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
>> #10 0x000055fbb1024863 in hmp_qemu_io (mon=0x7fffaf3fc7d0, qdict=<optimized out>)
>>     at ../block/monitor/block-hmp-cmds.c:628
>>
>> Can you make anything out of this?
>>
> 
> Hmm.. Interesting.
> 
> man pthread_mutex_unlock
> ...
>      EPERM  The  mutex type is PTHREAD_MUTEX_ERRORCHECK or PTHREAD_MUTEX_RECURSIVE, or the mutex is a
>               robust mutex, and the current thread does not own the mutex.
> 
> So, thread doesn't own the mutex.. We have an iothread here.
> 
> AIO_WAIT_WHILE() documents that ctx must be acquired exactly once by caller.. But I don't see, where is it acquired in the call stack?
> 
> The other question, is why permission conflict is lost with the commit. Strange. I ss that hmp_qemu_io creates blk with perm=0 and shread=BLK_PERM_ALL.. How could it conflict even before the considered commit?
> 


Sorry, I've answered and forgot about this thread. Now, looking through my series I find this again. Seems that problem is really in lacking aio-context locking around blk_unref(). I'll send patch now.


-- 
Best regards,
Vladimir

