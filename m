Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C954167CD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 00:03:35 +0200 (CEST)
Received: from localhost ([::1]:44098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTWoX-0000uF-3P
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 18:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTWmu-0008Cb-E6; Thu, 23 Sep 2021 18:01:52 -0400
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:18977 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTWmq-0004ZZ-5I; Thu, 23 Sep 2021 18:01:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7JGPnfSKrxdGnXermQ+amg3viss3+oeF8Fg0EyZEMPCLdKLntuT9ZAsYi8LmtuKbQVFR56rP5n0jqX88Fl4qGyb/RX7FhMbjoEGC6LuwUZYQAGJA88AZY+A/1la1t3O8teUfH23z2Pxhc03vD7lFktH3fvsrLDx2BKBaVId9Ttbw6VjDBD4X+i3OmwBSeV19RvFtB20x5FIbjcN56Ls17poFqPBGkv/cebRDYeu6pW381i6P4iM1qHACaMLtyraSF3IGStrT8SHCr4lZ81QnL+C5cgLmQRVF+dJe9cRcPS/wIRoAIyf/fV/7k6bekz4oTqBgUUI+xFKvtVR9etcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dSQJqtqgSKYE65NKMSi3cvNonN3sLzZoL8YXkZj1L/w=;
 b=meE9jsjuE/KMLiYkrsxKFCbv4MmE3e/SPLUybSo6ECpIMV3jKhiokYsozezA8EQTaz1YE9nXksAdM9hM+Ofi5WuSxGVxzlQusAJx4+Q8erKSqNI5QXpMbSfx5bZlh0zr2Xerrkzw7uS2HSsUMJ4NqE1weydmmdGn2t++jExhluJodHWnwnhLgvb32AONVTZopJ/iQbdwVE9XIxgdc0asAw4caub6aw2Fpb5uzM11WjsKYyw9yKBbmeBpwe95Z/tyChFxtW67TdT2Dvl/ZFVfZTuF+U4aL5isRFLAoXLOg4bd4fcakcgUo46U5DAMyzsadgtbnP+Ea3Nc8C6JOY3HJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSQJqtqgSKYE65NKMSi3cvNonN3sLzZoL8YXkZj1L/w=;
 b=Blc7Qtn1Az84lZUkatpxK8TMOGZnII60PKE7Uw6/XqHA7a6IZWQAjbtmFPUVVLw0HJERCwjJ83TOCZnNGCOWEhyVfd1cJZqXgAyVL8zUgTqTnnr8CSCpEW1f3Bc79GQzJ5knA9Y7/HBaXX2VbCL2pH4s42bLSkVWxp61Wavld+c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 22:01:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 22:01:41 +0000
Subject: Re: [PULL 00/12] jobs: mirror: Handle errors after READY cancel
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, jsnow@redhat.com
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
 <4a51243d-5746-260d-3045-b48650aa5047@linaro.org>
 <46b96d63-e6f4-5dc3-a4ab-ade47ab5f553@virtuozzo.com>
Message-ID: <085e9e5a-56b5-21ce-e1af-0500acd39937@virtuozzo.com>
Date: Fri, 24 Sep 2021 01:01:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <46b96d63-e6f4-5dc3-a4ab-ade47ab5f553@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Thu, 23 Sep 2021 22:01:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ac1dbed-f67d-4e12-375d-08d97eddb9b5
X-MS-TrafficTypeDiagnostic: AM7PR08MB5495:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5495001227734BA5A3168622C1A39@AM7PR08MB5495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0GY9n1gRIE1atwYV3Uj1W8JeCtbqTzaVVyuh79lWLoU8sRffZAotP4doF1mlT6OAm4AH0Ks+ZlMjKWxI0f8Eeumv9mB6awvNwWlCNyZYYXw35+l8bd6NwsZIQ7GI07zL083OCYof2sPFTHpzoHeeaLfwpklkslKd7gtPqGcci+MaPO7sxg065LSlBCo1FM5AWaKPZCWgxmHNNVZ1zY4tGG4PxhsbxhD5ND8+STvmieB/puUocGHDjjxG+Wo8iACLuBcNCA26VcAOmooPEPXVWcrGxlButcdpYAbqCBKEQjXCKNqxUR5ANK/Hh3NtU0woE15yurzO63qshNK2n9oR0378Ifk/Pv7PRoK6EmNBJoc7DUUVmieG5FSsxyGNzT+0Iofi298EV7TTu1jUG47pLhICOJUm3uaySZOG/HohxCCWKkCWu4B39PZnUHNhhlpnOtGWHFHhOtNVPONwz+qwU0/aKHHyG6wK/vR79kzpZzNwxBqBDU9YM0BygCFvlxrzZayIrEVWQbnCoUH7cyqg87GqoyBK/3TT5B6wGZz4zZ8eWD0x+pXwFJj34DC0Vl1kJCLYuGBQPndvvTih0uozShvIrnjSQASSJQgEQqKhJPmlVWcJPg50ed6WKq1AtHpAyQtYd7lCwgLhjqdDqTS5qCRqlIsxy/+OIj0SDu3u0y9Kxu2hLoiywmxK6eaRxNTA8xifx7hUYlmJxF5NsUhDYfnosQkYwBE4ns9TgARWCmEbZdaHrh4UFpHM8YJvYmQDEJKRGIZXxW0T6yBK/FoA6KF2YB8WdmP0tqgmpY/O65ZqlKErwyCFV/9CfMLGpz5KZx6O8yxVr5/rKoKH0XR12mcvgX5DZbp2akV4efwQ3Mg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(316002)(5660300002)(86362001)(966005)(2616005)(53546011)(956004)(8936002)(36756003)(16576012)(2906002)(26005)(186003)(8676002)(83380400001)(38100700002)(38350700002)(31696002)(52116002)(66476007)(66556008)(31686004)(66946007)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2ZqenRDay9yWThZOHcvZG1xRUgyRmxQZHhaU0dXMEZUbXBmKzFaQzl1ckhv?=
 =?utf-8?B?eGpPdmlpc2VVYXdXVzBIVHN2R0MzYmltYUthSWQ5OTJuS1dLcFBlMFhBN0Jm?=
 =?utf-8?B?WXYwYitGaU5FWjdrZ0lkQTcwTWloN1JIUWc0OXBLZkZMSnFVc2RIR0FTOS9u?=
 =?utf-8?B?L1YrOEhIYTVzd2QyR3kzTUhvVDBiemVpZFoxMjMySXczcENNcHN0aFlDbk9V?=
 =?utf-8?B?UG9yWWo3TXNGUmUxSmlycEJBeDZCVGlyMlZKVEhPVzJoaC9OL0Mwb2Y4RGFn?=
 =?utf-8?B?Z1QzL3k4emovZTA5SnB5em50K0RnWnZBeE1mSTUxcGUrakM3WmxwdmU4WnMz?=
 =?utf-8?B?SUZBQzBhYTYyVzNxVUsxK2lmQmFKWGV3K0JPTVhha0VUZHNMTU9YNjQyTEpF?=
 =?utf-8?B?d1VNbS8wUHZraENyQkNhdjZiYXozV2cyanhSbGdJdm1jaDNYWFFhZjArcFlU?=
 =?utf-8?B?M3JrU2hZQVZhZm5QdHhiZDNITmlYWjRRT09IcmVGQXFrU0tDRlFQYUY1RWR1?=
 =?utf-8?B?c1U3a2NaekwwSmhDL1ZQaTkxZmxhNUlwVUtiMFNoRFFxZHBFVEI2cDM4TFAr?=
 =?utf-8?B?ZmVyVS93TnljeUhQd2JqU01ET0NWbWswaUtJams1SHA2NTZyWFlvWXBrNjg5?=
 =?utf-8?B?U0pxWW9vb21hNGxMeDVGVkFtdG8zUE1RNzNoV2ltVmYycHpWWUszeXAzN0dK?=
 =?utf-8?B?MW5VWis2TUllQ0g4L0UrUlBaZVBOeU5Zdy9qZWdTSythQk92VVdya0ZoOVdY?=
 =?utf-8?B?ajZ1eFBzNllYL1NURExhVVN1S29OaC9iWGtyR040Z3MzRzZ1dG8xS1JyZTBU?=
 =?utf-8?B?L3BhNlorUjRqQnk2RTE5VXNic0xTdnVQZDZSS1ZMYWVXd0QyczFsZm9oc3RZ?=
 =?utf-8?B?ZDF3NlR0YkI4TE1zeW4xazBBWW9jSzhyYUVLM0E3eHJQbFhubDFxVWJFejlZ?=
 =?utf-8?B?bVF3d3VxNmEyekttNXBCNGsxenJCN1YwZUcyYzJEVDF2YVV2VFQ5bmYvRzAv?=
 =?utf-8?B?MmdEZjZlNGRnNWhCU2g2blk0R0JIYmZHMG8ySXpNUzhreHNGS1NSVEVXSk1K?=
 =?utf-8?B?MkZtd3BjeWM1Z1d4U2h5SVhTTDdlNGtuRytsMWlzTDVqajhkL0F1VFdBcmVX?=
 =?utf-8?B?L3VwM3FNNnA4NmZCQkRQRURjc2Z2d0VUUzdFQlhSTU5DUkxDdVFkZkI4bmRM?=
 =?utf-8?B?cnhtL2FKNWdpUXRHZ0NMWUJTQTd2SFdHMGpxQmo1amtnRXZSZE1xRWkvd2tl?=
 =?utf-8?B?ODkxRjFUSno0M0pEaU1LZGVpbzdxbjdtU3p4THlFVDc4YThYZVU1UHpkNDJq?=
 =?utf-8?B?L1NMd0RDQVkvazU0cGg4UlpNN2RkbStsVngrY0djZkdMc0U4bjA1N3lkZ2dF?=
 =?utf-8?B?b2VQYXZyRlQxOUlSN1ZzWHhGdm5Da3ZqMDhHVytLVlp2dWpaQ2hYTmxnTHFa?=
 =?utf-8?B?aGFCakRwOEtWR1hkWGtsS1ExSUFRZEJmWU5SVEtwYkVkc1BDUlBvZGsrbmVO?=
 =?utf-8?B?Nm1vS1hzd2lud3NRdWtFdHVtNGZyQkZKY1gwRkNJdVJKWllCTmJscUU4djV0?=
 =?utf-8?B?MFVYdjdjNVArZ0dKazJQVFYwNFExRk0zNEY5Y3JZU2tVRzJ4YmRGSmZ0cGE3?=
 =?utf-8?B?RUN5VHcrVGlvRGNJOTUyUklWdmtKSUJqTjg3d0I1QTA5T24wWmRJQ1VNcVEy?=
 =?utf-8?B?WlNMQzFFVm1weXBCQ3BsZDFxdUs0clZzMForZ2NHMW42VXRSVGRBUjhIYW44?=
 =?utf-8?Q?FeNuTh6W98+RgyIm0nkSad4qmDxo91CS59lLJS8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac1dbed-f67d-4e12-375d-08d97eddb9b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 22:01:41.9363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sat/dSnDReCd/RVelHY313+dAzy5Xi/g7Jz9pHh4UjnjUuXcP3sJSBr1rlwT7T9nsb54RUdsaX0lyQS6CiS3hvUDAmzkB358WabizzAE1q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
Received-SPF: pass client-ip=40.107.22.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

22.09.2021 22:19, Vladimir Sementsov-Ogievskiy wrote:
> 22.09.2021 19:05, Richard Henderson wrote:
>> On 9/21/21 3:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> The following changes since commit 326ff8dd09556fc2e257196c49f35009700794ac:
>>>
>>>    Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 16:17:05 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://src.openvz.org/scm/~vsementsov/qemu.git  tags/pull-jobs-2021-09-21
>>>
>>> for you to fetch changes up to c9489c04319cac75c76af8fc27c254f46e10214c:
>>>
>>>    iotests: Add mirror-ready-cancel-error test (2021-09-21 11:56:11 +0300)
>>>
>>> ----------------------------------------------------------------
>>> mirror: Handle errors after READY cancel
>>>
>>> ----------------------------------------------------------------
>>> Hanna Reitz (12):
>>>        job: Context changes in job_completed_txn_abort()
>>>        mirror: Keep s->synced on error
>>>        mirror: Drop s->synced
>>>        job: Force-cancel jobs in a failed transaction
>>>        job: @force parameter for job_cancel_sync()
>>>        jobs: Give Job.force_cancel more meaning
>>>        job: Add job_cancel_requested()
>>>        mirror: Use job_is_cancelled()
>>>        mirror: Check job_is_cancelled() earlier
>>>        mirror: Stop active mirroring after force-cancel
>>>        mirror: Do not clear .cancelled
>>>        iotests: Add mirror-ready-cancel-error test
>>
>> This fails testing with errors like so:
>>
>> Running test test-replication
>> test-replication: ../job.c:186: job_state_transition: Assertion `JobSTT[s0][s1]' failed.
>> ERROR test-replication - too few tests run (expected 13, got 8)
>> make: *** [Makefile.mtest:816: run-test-100] Error 1
>> Cleaning up project directory and file based variables
>> ERROR: Job failed: exit code 1
>>
>> https://gitlab.com/qemu-project/qemu/-/pipelines/375324015/failures
>>
> 
> 
> Interesting :(
> 
> I've reproduced, starting test-replication in several parallel loops. (it doesn't reproduce for me if just start in one loop). So, that's some racy bug..
> 
> Hmm, and seems it doesn't reproduce so simple on master. I'll try to bisect the series tomorrow.
> 
> ====
> 
> (gdb) bt
> #0  0x00007f034a3d09d5 in raise () from /lib64/libc.so.6
> #1  0x00007f034a3b9954 in abort () from /lib64/libc.so.6
> #2  0x00007f034a3b9789 in __assert_fail_base.cold () from /lib64/libc.so.6
> #3  0x00007f034a3c9026 in __assert_fail () from /lib64/libc.so.6
> #4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, s1=JOB_STATUS_CONCLUDED) at ../job.c:186
> #5  0x000055d3b503e7c2 in job_conclude (job=0x55d3b5e67020) at ../job.c:652
> #6  0x000055d3b503eaa1 in job_finalize_single (job=0x55d3b5e67020) at ../job.c:722
> #7  0x000055d3b503ecd1 in job_completed_txn_abort (job=0x55d3b5e67020) at ../job.c:801
> #8  0x000055d3b503f2ea in job_cancel (job=0x55d3b5e67020, force=false) at ../job.c:973
> #9  0x000055d3b503f360 in job_cancel_err (job=0x55d3b5e67020, errp=0x7fffcc997a80) at ../job.c:992
> #10 0x000055d3b503f576 in job_finish_sync (job=0x55d3b5e67020, finish=0x55d3b503f33f <job_cancel_err>, errp=0x0) at ../job.c:1054
> #11 0x000055d3b503f3d0 in job_cancel_sync (job=0x55d3b5e67020, force=false) at ../job.c:1008
> #12 0x000055d3b4ff14a3 in replication_close (bs=0x55d3b5e6ef80) at ../block/replication.c:152
> #13 0x000055d3b50277fc in bdrv_close (bs=0x55d3b5e6ef80) at ../block.c:4677
> #14 0x000055d3b50286cf in bdrv_delete (bs=0x55d3b5e6ef80) at ../block.c:5100
> #15 0x000055d3b502ae3a in bdrv_unref (bs=0x55d3b5e6ef80) at ../block.c:6495
> #16 0x000055d3b5023a38 in bdrv_root_unref_child (child=0x55d3b5e4c690) at ../block.c:3010
> #17 0x000055d3b5047998 in blk_remove_bs (blk=0x55d3b5e73b40) at ../block/block-backend.c:845
> #18 0x000055d3b5046e38 in blk_delete (blk=0x55d3b5e73b40) at ../block/block-backend.c:461
> #19 0x000055d3b50470dc in blk_unref (blk=0x55d3b5e73b40) at ../block/block-backend.c:516
> #20 0x000055d3b4fdb20a in teardown_secondary () at ../tests/unit/test-replication.c:367
> #21 0x000055d3b4fdb632 in test_secondary_continuous_replication () at ../tests/unit/test-replication.c:504
> #22 0x00007f034b26979e in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
> #23 0x00007f034b26959b in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
> #24 0x00007f034b26959b in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
> #25 0x00007f034b269c8a in g_test_run_suite () from /lib64/libglib-2.0.so.0
> #26 0x00007f034b269ca5 in g_test_run () from /lib64/libglib-2.0.so.0
> #27 0x000055d3b4fdb9c0 in main (argc=1, argv=0x7fffcc998138) at ../tests/unit/test-replication.c:613
> (gdb) fr 4
> #4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, s1=JOB_STATUS_CONCLUDED) at ../job.c:186
> 186         assert(JobSTT[s0][s1]);
> (gdb) list
> 181         JobStatus s0 = job->status;
> 182         assert(s1 >= 0 && s1 < JOB_STATUS__MAX);
> 183         trace_job_state_transition(job, job->ret,
> 184                                    JobSTT[s0][s1] ? "allowed" : "disallowed",
> 185                                    JobStatus_str(s0), JobStatus_str(s1));
> 186         assert(JobSTT[s0][s1]);
> 187         job->status = s1;
> 188
> 189         if (!job_is_internal(job) && s1 != s0) {
> 190             qapi_event_send_job_status_change(job->id, job->status);
> (gdb) p s0
> $1 = JOB_STATUS_NULL
> (gdb) p s1
> $2 = JOB_STATUS_CONCLUDED
> 
> 
> 


bisect points to "job: Add job_cancel_requested()"

And "bisecting" within this commit shows that the following helps:

diff --git a/job.c b/job.c
index be878ca5fc..bb52a1b58f 100644
--- a/job.c
+++ b/job.c
@@ -655,7 +655,7 @@ static void job_conclude(Job *job)
  
  static void job_update_rc(Job *job)
  {
-    if (!job->ret && job_is_cancelled(job)) {
+    if (!job->ret && job_cancel_requested(job)) {
          job->ret = -ECANCELED;
      }
      if (job->ret) {


- this returns job_update_rc to pre-patch behavior.

But why, I don't know:) More investigation is needed. probably replication code is doing something wrong..

-- 
Best regards,
Vladimir

