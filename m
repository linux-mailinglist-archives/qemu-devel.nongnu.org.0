Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15474215FC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 20:02:55 +0200 (CEST)
Received: from localhost ([::1]:53998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXSIg-0002ss-IF
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 14:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mXSFp-0001YW-QZ; Mon, 04 Oct 2021 13:59:58 -0400
Received: from mail-db8eur05on2139.outbound.protection.outlook.com
 ([40.107.20.139]:15169 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mXSFm-0005rB-2k; Mon, 04 Oct 2021 13:59:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEO82jYGnYfBpqRUOQ5fGKIPMNf+tqVcpTF/MIr9H5bLXyiNK180VLccvdX8Ka2x9e05Fr1OX8hY7iOZPMIzNOcvTQ1gmELsDKL2wI9S9eRuCDGPvvulczBnA63I5K3akSLTmK8f4WMi/IqRXE2PIILWCkv893nZf5Ykju124qoaDdmQ7D5UC0zCbk3x3FV51hSmIk3hlaxGwYGCfIytERFnLmAEaamoiKBkM6tm4oa7Z4OIWcQeW/B7gPqgyJNqlx0W+INTWHvs+4k4FopgjFPV0Im6K6CSrDGsNe20T/ulTfrvhrpbPQn3CioAwaL2/KJh1srzJzl4HXzKiV8qmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ef71H9bhTyapaTiHSUekCWS8XcNUSDTnA/k+Ac0W04=;
 b=ZvVnUohld44V7mSAxwQQ/7+7nhGRadqt+OwQsEMFLvFS3NpkSDbcAyoOOTcn6cKvP8TTvnYjdCl+8WwulcxR7wf3t8WuSzt9gpV5kiADxal5NMNQlBVFDcvxbaI/+ouVvdab70i7iF4H+ai6I9eF6S2cLyDZq9U/1SX6DyPeBIQehoH+Ou5dMwZUWwa5eMM3S+5VMEjDwsyAEHdWlyDE6JsI+K3dwIkBM9FqBjWrbMkxOVQBTsxhsJOw2M6a1yTALQbdVfpNwUbhRK1NoFtFfo7PNgpuO2nn/JrvVelChM3ZMeIInmlv7Syi55OL6Qj7/2tH3ZVMzFGUa+B80/qb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ef71H9bhTyapaTiHSUekCWS8XcNUSDTnA/k+Ac0W04=;
 b=bH2V+wuruYyYBYKBREwjXA8WkYW882HX5tb4/a3hxQ5oZFEe2yjRX6iHHpxFseb2s01M5kSKtqvUx3DncyK2i+MQmtVQ0yr9KFP9fF5TuUXPKrMIYXx0eSx0xkvxaA7xnFmiq/vJnXBzUT8wF//PsuTMPH6LKVTOXMFB0aZxtI8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4597.eurprd08.prod.outlook.com (2603:10a6:20b:90::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 17:59:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 17:59:45 +0000
Message-ID: <8f382e34-60ca-d848-abb3-531ae369d443@virtuozzo.com>
Date: Mon, 4 Oct 2021 20:59:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/12] jobs: mirror: Handle errors after READY cancel
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 jsnow@redhat.com
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
 <4a51243d-5746-260d-3045-b48650aa5047@linaro.org>
 <46b96d63-e6f4-5dc3-a4ab-ade47ab5f553@virtuozzo.com>
 <085e9e5a-56b5-21ce-e1af-0500acd39937@virtuozzo.com>
 <dedd1e5a-bb91-1ba7-5cd4-06f03dce37a3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <dedd1e5a-bb91-1ba7-5cd4-06f03dce37a3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.214) by
 FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.7 via Frontend Transport; Mon, 4 Oct 2021 17:59:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a7df23-c1aa-4fcf-0ee0-08d98760bfc9
X-MS-TrafficTypeDiagnostic: AM6PR08MB4597:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4597E3430FA8853623EA4599C1AE9@AM6PR08MB4597.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3S0ngsmHI0NyydXIInlOfj/Kv4aCNjqjr9zhw5IaHln/Rf2FrhUtSzv1sGVhBMb7z6jjAms+g9deG5HsfV4wg9B7Sxv+uVBbvuX5RCQlmAPA0sYCgxxT5raRT+qsJy+EibkpWSd25a2Vcmj9plSqzhcECmSKZj81nibWLzjA+zlr9iIqEabYoCW037ViBLKDd91hzLoE+7pF0HYKDQNyJLgw/WiCoBxQzKHhQlsv0mg/hNJAjX2OQSjCS3wq5IfCGaqqeXM0ViMVYZOUCzgUwp4UARLXjCKpOc5lal085Osjj0gfQW112ULBtaLFtXunbR6kJIvWfwgxH0sN9CtrZDONF/sBj86zw70ZQ5fYGg46hNq+g2YPhT24j5O3g6Yu19JBnAfiwFk6XgUS2jG+7fWIvynRHTwcLX3x+ZEmyEMA23GTffMFtRCS1hSb8u+fkvcdChJjD60alT9xPNLoFjf51XDKcy6/cMqOpUHCTd9lDw1yW9bOVSYGPcnPMc1KaBKkuDKlpbSHT0HFNo+/o+m64Y6b8ndTSQUu0cHn1aBeJN5RnepzUKfzg0U0WcPRMy8+Uv06SEnMEG4yIqlawfFApZFG4D38UPiKFd1/w7HNndchqRJ/QQwuGtOEDTRauuSkONTC7PzPh/mY2Z7AVuWX9dyEsQw6uUaIXl7W6msaGlHQ5JGGkBw42dwuL5R5LuZYQ2GKi+xL58r7PaNfeSz5ZcP9k0QHjEFfCSRNDMuMKkX2QMHWsEuBPzQowgsTyh07+mrwhB7FY473Xm2Du3ZybM0eLaaCWgMhsUhu7WI2WpjKS+D3brs1dIDa9V+48Dxl2MZ68zGp08sUlRMZh/0TyNOETGnTIcLvajB4a7RuwlxpiWgmnXFWRg5qpUn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(2616005)(16576012)(66556008)(31696002)(186003)(508600001)(66476007)(6486002)(66946007)(26005)(110136005)(31686004)(956004)(4326008)(8676002)(2906002)(53546011)(38350700002)(38100700002)(86362001)(5660300002)(52116002)(83380400001)(36756003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGE1dHVsUnZpbEJxc20wUzl2NDkrRE1KdTBxNTlmaGRkKzU3eTFkOW1uMEla?=
 =?utf-8?B?SWF4NVN3eTZVRmdQSVluaGhORDFORmIxUE1qMC9EZGkwampYWGV3K1FQZHBF?=
 =?utf-8?B?RjZ3U2NLRkJiVkxiRXBRUEdKaW1EaEJoYnVQVHlaQnhXenEzRjUzWTlzcmZp?=
 =?utf-8?B?R2lleTJIbHR5WEE0MFRGdDRQYW5sWSswVEwrQWJUVXFUZFRPSERKVlQ3TDRC?=
 =?utf-8?B?S3JUdmFRMzVhQlBaWTlqRWMvbUNMSmlNbnJHR013aWtPeXNGQk5QWXJ4dXVD?=
 =?utf-8?B?ODRUdVdBczFYWTdnT2RzWC9NMlRLbkNCMDk4Mjg3d2xRYWVuU3lVckhGZE5q?=
 =?utf-8?B?dVVwc250OE5kSmNIczh3cW5tRzhTR25PVEZISEpCanRBbithVkhHQW5nQlRT?=
 =?utf-8?B?OGR4MmM1Tk1BaHhIV3FVVFVtU3VoWjgvWWZBNkJiMHM5RkFIZDl5QkhqYmdM?=
 =?utf-8?B?bnpRWXdTbUZMMjlmbFFHcDB2QjNqektPNGlnSEpWU0ZBV1ZBNUtIaGNDODBn?=
 =?utf-8?B?MmhwYkY4bENpUERPbklHa0tITHdqVnNRWlVVc1ZiQWtEZFgvWEV5ZVJPZWRL?=
 =?utf-8?B?UkRxQTVLRmxhK2oyV3BGejRrbHJzVGFGZmVVMXpBZU5FVDlPNDRLd01jQk9r?=
 =?utf-8?B?ZVAra1phNlRRVndQbDVxZEYwV1ZYb1FrWS9HOXB6dXVoK2RueXZWTDJ5TVhq?=
 =?utf-8?B?UXFVMnpNd2txeE51YUQyLytqQzBJWDc3QkphdFIvZzFSZE9XakFRNzdBckg3?=
 =?utf-8?B?TE9jdWJSb1RHakQzUFdQQ0FxVUxtV0tramxpTmxhQVhWQUpuNUJZVXRPTm5t?=
 =?utf-8?B?SXRVR1U1Qzk4Uk9nNHFxNTI2SHUxMkJ4eHBXRThUR1VRZFFxV0ZTSjRFa3Vy?=
 =?utf-8?B?MGdRTHZrYTJpbDkybVlPblNETHBqckIvWm95L1d0M3dENnhRNVNVUG1ELzdo?=
 =?utf-8?B?Y1psNEk5RWVkUzdaWXRGcHhwTEtTMWhDOGRWaHJaQ0FoZEZtQm1weUZyMFhx?=
 =?utf-8?B?V3FjQURiYlF2dFFEbVF0ZjNvdUJZaGdHSXlUYkFyR2JHYUszbHAydjhZZ01i?=
 =?utf-8?B?RXFLL1hXZTFWM2s3ZG91aGZuOUxGZFo1YnpJT0lXbkJBcjZHWWRlSkFUZzR5?=
 =?utf-8?B?eGVMRFBXMlZDcGUzWVd5WFFSNEgreXF2ZzBOcWhyR3dQSUtLbk9xbmoyUVcr?=
 =?utf-8?B?TWZLZjF0K0M4WG9NZmZxNzlqR3l2UEl3TEx1anBvLzV6eVV6bkFnT0l1MENu?=
 =?utf-8?B?aFBhUWhCeVZDZmFUUHlzaVVVSEp6NkJqelExTUh6dHFCdUFzb2pTeGhMcnRy?=
 =?utf-8?B?RTdXRVIrdTV2WUFIV3hpUS95OUFNWCtWM0NXNzNkeDVaQno5QWpNa0tPbUZ4?=
 =?utf-8?B?NDV0MzEyZFdiSU1JNkVrZXpzQzZTR1RqUmVIekNqaWVjL0p3bkhleVp2ellD?=
 =?utf-8?B?MG5JZmRUMkVIZVowMjlFRmwzcTNuQXZSVThHSXJvTWdTbjFsMUwrUUl4VUph?=
 =?utf-8?B?T0hjWnprNndSM05LeG5UUDliYkFQUmFPTTlhUFUwNHFNNDBlS0I5bUhGTW0y?=
 =?utf-8?B?TFprNk5wMFE3SDl0SllVRFpjanluMWlrdGJKRXRUVGtXaDZ1cGpxK2VUODV5?=
 =?utf-8?B?M1dZeHBsdStOcCsrWEt2MnZSUzV1Z0FkblJnbEZVL2NWVXh0RTArSElMaGxB?=
 =?utf-8?B?dG1samY0b3ZhNEpxUkNtV2U2M1VhOHBnWitnamhIZ1B1RUtkL3Y3UDkvdE81?=
 =?utf-8?Q?fCCD5DOvaw9kGkYLY28OshdNm/NB0B3K9m7d5Cz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a7df23-c1aa-4fcf-0ee0-08d98760bfc9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 17:59:45.4896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9E5Jh5s/BwkGv/pkZaESmsUa+ud2NmDU06KACzC6V65Iy5j0b0cGVbPxpFnIfmQAVhhZg0dD8aYAqGHhZG6BF/HyfoU4jZZQQ2iHuVCgnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4597
Received-SPF: pass client-ip=40.107.20.139;
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

10/4/21 19:47, Hanna Reitz wrote:
> On 24.09.21 00:01, Vladimir Sementsov-Ogievskiy wrote:
>> 22.09.2021 22:19, Vladimir Sementsov-Ogievskiy wrote:
>>> 22.09.2021 19:05, Richard Henderson wrote:
>>>> On 9/21/21 3:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>>> The following changes since commit 326ff8dd09556fc2e257196c49f35009700794ac:
>>>>>
>>>>>    Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 16:17:05 +0100)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-jobs-2021-09-21
>>>>>
>>>>> for you to fetch changes up to c9489c04319cac75c76af8fc27c254f46e10214c:
>>>>>
>>>>>    iotests: Add mirror-ready-cancel-error test (2021-09-21 11:56:11 +0300)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> mirror: Handle errors after READY cancel
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Hanna Reitz (12):
>>>>>        job: Context changes in job_completed_txn_abort()
>>>>>        mirror: Keep s->synced on error
>>>>>        mirror: Drop s->synced
>>>>>        job: Force-cancel jobs in a failed transaction
>>>>>        job: @force parameter for job_cancel_sync()
>>>>>        jobs: Give Job.force_cancel more meaning
>>>>>        job: Add job_cancel_requested()
>>>>>        mirror: Use job_is_cancelled()
>>>>>        mirror: Check job_is_cancelled() earlier
>>>>>        mirror: Stop active mirroring after force-cancel
>>>>>        mirror: Do not clear .cancelled
>>>>>        iotests: Add mirror-ready-cancel-error test
>>>>
>>>> This fails testing with errors like so:
>>>>
>>>> Running test test-replication
>>>> test-replication: ../job.c:186: job_state_transition: Assertion `JobSTT[s0][s1]' failed.
>>>> ERROR test-replication - too few tests run (expected 13, got 8)
>>>> make: *** [Makefile.mtest:816: run-test-100] Error 1
>>>> Cleaning up project directory and file based variables
>>>> ERROR: Job failed: exit code 1
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/pipelines/375324015/failures
>>>>
>>>
>>>
>>> Interesting :(
>>>
>>> I've reproduced, starting test-replication in several parallel loops. (it doesn't reproduce for me if just start in one loop). So, that's some racy bug..
>>>
>>> Hmm, and seems it doesn't reproduce so simple on master. I'll try to bisect the series tomorrow.
>>>
>>> ====
>>>
>>> (gdb) bt
>>> #0  0x00007f034a3d09d5 in raise () from /lib64/libc.so.6
>>> #1  0x00007f034a3b9954 in abort () from /lib64/libc.so.6
>>> #2  0x00007f034a3b9789 in __assert_fail_base.cold () from /lib64/libc.so.6
>>> #3  0x00007f034a3c9026 in __assert_fail () from /lib64/libc.so.6
>>> #4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, s1=JOB_STATUS_CONCLUDED) at ../job.c:186
>>> #5  0x000055d3b503e7c2 in job_conclude (job=0x55d3b5e67020) at ../job.c:652
>>> #6  0x000055d3b503eaa1 in job_finalize_single (job=0x55d3b5e67020) at ../job.c:722
>>> #7  0x000055d3b503ecd1 in job_completed_txn_abort (job=0x55d3b5e67020) at ../job.c:801
>>> #8  0x000055d3b503f2ea in job_cancel (job=0x55d3b5e67020, force=false) at ../job.c:973
>>> #9  0x000055d3b503f360 in job_cancel_err (job=0x55d3b5e67020, errp=0x7fffcc997a80) at ../job.c:992
>>> #10 0x000055d3b503f576 in job_finish_sync (job=0x55d3b5e67020, finish=0x55d3b503f33f <job_cancel_err>, errp=0x0) at ../job.c:1054
>>> #11 0x000055d3b503f3d0 in job_cancel_sync (job=0x55d3b5e67020, force=false) at ../job.c:1008
>>> #12 0x000055d3b4ff14a3 in replication_close (bs=0x55d3b5e6ef80) at ../block/replication.c:152
>>> #13 0x000055d3b50277fc in bdrv_close (bs=0x55d3b5e6ef80) at ../block.c:4677
>>> #14 0x000055d3b50286cf in bdrv_delete (bs=0x55d3b5e6ef80) at ../block.c:5100
>>> #15 0x000055d3b502ae3a in bdrv_unref (bs=0x55d3b5e6ef80) at ../block.c:6495
>>> #16 0x000055d3b5023a38 in bdrv_root_unref_child (child=0x55d3b5e4c690) at ../block.c:3010
>>> #17 0x000055d3b5047998 in blk_remove_bs (blk=0x55d3b5e73b40) at ../block/block-backend.c:845
>>> #18 0x000055d3b5046e38 in blk_delete (blk=0x55d3b5e73b40) at ../block/block-backend.c:461
>>> #19 0x000055d3b50470dc in blk_unref (blk=0x55d3b5e73b40) at ../block/block-backend.c:516
>>> #20 0x000055d3b4fdb20a in teardown_secondary () at ../tests/unit/test-replication.c:367
>>> #21 0x000055d3b4fdb632 in test_secondary_continuous_replication () at ../tests/unit/test-replication.c:504
>>> #22 0x00007f034b26979e in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>> #23 0x00007f034b26959b in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>> #24 0x00007f034b26959b in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
>>> #25 0x00007f034b269c8a in g_test_run_suite () from /lib64/libglib-2.0.so.0
>>> #26 0x00007f034b269ca5 in g_test_run () from /lib64/libglib-2.0.so.0
>>> #27 0x000055d3b4fdb9c0 in main (argc=1, argv=0x7fffcc998138) at ../tests/unit/test-replication.c:613
>>> (gdb) fr 4
>>> #4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, s1=JOB_STATUS_CONCLUDED) at ../job.c:186
>>> 186         assert(JobSTT[s0][s1]);
>>> (gdb) list
>>> 181         JobStatus s0 = job->status;
>>> 182         assert(s1 >= 0 && s1 < JOB_STATUS__MAX);
>>> 183         trace_job_state_transition(job, job->ret,
>>> 184                                    JobSTT[s0][s1] ? "allowed" : "disallowed",
>>> 185                                    JobStatus_str(s0), JobStatus_str(s1));
>>> 186         assert(JobSTT[s0][s1]);
>>> 187         job->status = s1;
>>> 188
>>> 189         if (!job_is_internal(job) && s1 != s0) {
>>> 190             qapi_event_send_job_status_change(job->id, job->status);
>>> (gdb) p s0
>>> $1 = JOB_STATUS_NULL
>>> (gdb) p s1
>>> $2 = JOB_STATUS_CONCLUDED
>>>
>>>
>>>
>>
>>
>> bisect points to "job: Add job_cancel_requested()"
>>
>> And "bisecting" within this commit shows that the following helps:
>>
>> diff --git a/job.c b/job.c
>> index be878ca5fc..bb52a1b58f 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -655,7 +655,7 @@ static void job_conclude(Job *job)
>>
>>  static void job_update_rc(Job *job)
>>  {
>> -    if (!job->ret && job_is_cancelled(job)) {
>> +    if (!job->ret && job_cancel_requested(job)) {
>>          job->ret = -ECANCELED;
>>      }
>>      if (job->ret) {
>>
>>
>> - this returns job_update_rc to pre-patch behavior.
>>
>> But why, I don't know:) More investigation is needed. probably replication code is doing something wrong..
> 
>  From what I can tell, this is what happens:
> 
> (1) The mirror job completes, we go to job_co_entry(), and schedule job_exit().  It doesn’t run yet, though.
> (2) replication_close() cancels the job.
> (3) We get to job_completed_txn_abort().
> (4) The job isn’t completed yet, so we invoke job_finish_sync().
> (5) Now job_exit() finally gets to run, and this is how we end up in a situation where .cancelled is true, but .force_cancel is false: Yes, mirror clears .cancelled before exiting its main loop, but if the job is cancelled between it having been deferred to the main loop and job_exit() running, it may become true again.
> (6) job_exit() leads to job_completed(), which invokes job_update_rc(), which however leaves job->ret == 0.
> (7) job_completed() also calls job_completed_txn_success(), which is weird, because we still have job_completed_txn_abort() running concurrently...
> (8) job_completed_txn_success() invokes job_do_finalize(), which goes to job_finalize_single(), which leaves the job in status null.
> (9) job_finish_sync() is done, so we land back in job_completed_txn_abort(): We call job_finalize_single(), which tries to conclude the job, and that gives us the failed assertion (attempted transition from null to concluded).
> 
> (When everything works, it seems like the job is completed before replication_close() can cancel it.  Cancelling is then a no-op and nothing breaks.)
> 
> So now we could say the problem is that once a job completes and is deferred to the main loop, non-force cancel should do nothing. job_cancel_async() should not set job->cancelled to true if `!force && job->deferred_to_main_loop`.  job_cancel() should invoke job_completed_txn_abort() not if `job->deferred_to_main_loop`, but if `job->deferred_to_main_loop && job_is_cancelled(job)`. (Doing this seems to fix the bug for me.)
> 
> That I think would conform to the reasoning laid out in patch 7’s commit message, namely that some functions are called after the job has been deferred to the main loop, and because mirror clears .cancelled when it has been soft-cancelled, it’d be impossible to observe `.deferred_to_main_loop == true && .cancelled == true && .force_cancelled == false`.
> 
> 
> Or we continue having soft-cancelled jobs still be -ECANCELED, which seems like the safe choice?  But it goes against what we’ve decided for patch 7, namely that soft-cancelled jobs should be treated like they’d complete as normal.
> 

I think, I can live with either way:)  I still think that best way is implementing "no graph change" mode for mirror instead of soft-cancelling and deprecate soft-cancel (together with block-job-cancel), but that doesn't work in short-term.

-- 
Best regards,
Vladimir

