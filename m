Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25311444221
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:04:50 +0100 (CET)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miFwe-0002cb-Q9
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miFtT-0001eq-T3; Wed, 03 Nov 2021 09:01:31 -0400
Received: from mail-ve1eur01on0717.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::717]:60733
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miFtO-0004ql-56; Wed, 03 Nov 2021 09:01:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyYvlAGWGkprrxLIMAftzvq8aXtkXQDJd25Onyuy99cx6hGoXBzegcQwAw6J2RvByxJrC82W1dBThx1lgJgUopDDAuGZ2pCMdmAf7YF0fthd5B4x4OsKtuFFTQ2KmaW+IVWhB9F89z+FDz6cy5H8nTMftaw5sf7uBZZeJEEPOfacRNbbkrKipty1uAkHIb3cG4OcSOuG4n+EAbUmBpgo+nudjbnKFIG6/kkpKQalY4Rpb0I+OyO3gOTbLtPowxmsughntYx45QH6Wx/CIxz0akq6+crUw2Gfn4h1CrPjT+mRat5URehIPWdRLZalCvIMORRPb9eZUoya6qJmMsaKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9a3NKqU9kPupNHC4u+aLZZLQCyyncmHrOLeJWm3ejo=;
 b=nU2HfMCg9ai1fCAjf/mf86hueGowURgk+hXHj7YQHOv7Rn1cfskwhT0OkBrpPJ1bAF1RBHwT1ub9rwcx4lc8tndaEnS2fraRGtiD1omi3FTYgOnA1PUHZah2zMGr3GraWnkpRdNEHwDuCGjxU8VFSyrE4fDh3bqXBz5pf410A3VEKBUUKC4XNULfOHdyQ6XOwIVcMJVGZDdStCsKXDRlA2IdC91dcXyTUEVgCF2mTPFV4g+4hWYFwl6tGiu3b5Yn55N2+j7gDOzfX0ok6NPzN5lNsKjg38c9Ahja5XhndJKGzdG6NGjCzLC4Q/Quag3BVqgRnUmVTWxXsK6c3Jc/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9a3NKqU9kPupNHC4u+aLZZLQCyyncmHrOLeJWm3ejo=;
 b=COLQ16afPoDPTAGvwPrCr69A4T51ScqwYkFQFY8Nl2gcuWNyLf3UNv11ZAephDcJgwCh6QyJEQ8k4hGhsEgpqxKaNDMCmS7NdC+WJO79gEE4aN/S9XQSMAKeYF+fPt3EAfA7LhypSroPlCvKtlKZyGBIZkx5kUO1KncsH+Qsyh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2417.eurprd08.prod.outlook.com (2603:10a6:203:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 13:01:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 13:01:14 +0000
Message-ID: <11ab3315-af82-484e-23bb-723b25fc5aee@virtuozzo.com>
Date: Wed, 3 Nov 2021 16:01:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 00/17] iotests: support zstd
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, jsnow@redhat.com
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
 <2e923c5b-0bfa-6870-be68-cd1ccb7b125d@redhat.com>
 <6de70a00-ff7a-9155-ff97-3e28df4c9059@redhat.com>
 <bfa6945a-a90f-9ec6-72f7-ad8402d606ff@virtuozzo.com>
 <YYEvGrKxnF/w8Nzp@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YYEvGrKxnF/w8Nzp@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.4 via Frontend Transport; Wed, 3 Nov 2021 13:01:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbc48ea7-6591-427f-69a6-08d99eca042f
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2417:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24176B31F1BAE26BD5036C8AC18C9@AM5PR0802MB2417.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JL0x7m6Wa00or8ENIVDWGQpxlt0/5oZJDR06+yVFlFvGNIm43sl9DSp65Ks1Evvu8EhS4rqesuv+B8mSuLXYchoz+9UkxAtT6O/qUC6QHRByyHZCmIo4uXD3FnjXIy3RQUa0rtISVrFs05rNPK0F7Br6+XST7CJ/qEj3ui9/J9mtsFMbQTrp7W2GK1kFDgkY9I+DEssjoPjQn/tsZx3XDab3D9wVZAw/uyYF1dgCpnXIbqPNusRo0mR3jdm5NbdDzeRaZXFON41qb7v3/rfUtktrd+U2j8inwPMI6gFFExCuqhB4EIUftFEYKeytN8G49dqre9Pq7I1Ra090Yuj5gN5XUXtlaQceCQdkkZco+U6Fbs0zy/M9zu1vqL4+QBPADb/jAaoIVcQPS7xsYb7qRegWY8TybKHZNdWCnJbGRj9rho+sHBrFlVQP0w1QJPG+OYNpJj3EtfCgAvuq7u/mEkUE7nruo0k6t0/V3CMnWGmi5XDrtua0fucUudiOkujfJE7SAPaROHVWAqly6E/UnqcNVtNJRTlPdBAKfkF7/N6u/vBK+z954L+JDOnNUH400ROd7ifjGCQZBn/G0YB36X897/O5DgY2/6OVpAnGh5QNoEsj1meoc8olYSjC1h9OIXyi+xnMQXtkhZOSePKb1WKsUjZng0cR3Nb2eGBRS4AhaRNPnli+5erTxuv0kSjh0Hv2pA6ma90PCpLdegpQi5IugLPCAnSDGnvrjOJb4+0ncoW+B/UGk+dI2h90n2yA95KcRIm2XJDDQtQSCZSAApg5vBcgrjgY34XGxr07Fk9NQajAX0UrknpGD8tLAYn7nRQu0z5BBKeG4fcewLlwAX98bIFF1V7r3vuT+mVDm34=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2906002)(2616005)(956004)(36756003)(6916009)(5660300002)(16576012)(66556008)(66476007)(66946007)(316002)(38350700002)(38100700002)(186003)(86362001)(31686004)(53546011)(966005)(31696002)(83380400001)(26005)(508600001)(8676002)(4326008)(6486002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWlEaC9mN1JNTlJIUkpKMGpVRVljUndGUVNwS1dIc05PQ3VKNXUycGN5cER5?=
 =?utf-8?B?aVhXQlgwcGdxZnk1TE96MXZTNy9Dd2dyNnQ2S2xyYUdIUitNaEw4Z01rUllH?=
 =?utf-8?B?OUFWRVZrZHFkRTlkWnFoMUpOSWhHOXQydjJ2MkdvamFsOERZblgxYlNKYlhW?=
 =?utf-8?B?K014blFKOUJsUCtadXFBYTdrOFBnK0xYTGE1WEJVQXBmMW1ybkFlYkE5NURY?=
 =?utf-8?B?QTJIM1p0bUh6WGZmQnhFR3EzZy95YTBmdktyd2M3c3cxdXlEc3IySmdqWkRx?=
 =?utf-8?B?b1FsYlAwWmhxNnZzTjliRHlvdzUvc2lmWkpJcFVJemdjZ09nZlBNUzVXdEl6?=
 =?utf-8?B?V212cFJ3Nkk0R1dNK1ZuMFQvbWZrc1pVVkZrcjF2NUdLWWxhZEczcGsvdFJ6?=
 =?utf-8?B?MGdBYytQRkJJUFIrcG5ib1dPU0JrY1NGSlA3QXFSc2hFSmo4WXpNYnJNeTdh?=
 =?utf-8?B?Y2JVOEpXUmxpZWNod2tXZGhwK0M5UmwrU1dGMkZsMVVoM25qWTJCQ1NTTHd6?=
 =?utf-8?B?RGV6Y0d1R2tmeTVFd1p2SzlneE9BQmxFdThMVlpZaDhyYUdTNTkzb1gvV3RH?=
 =?utf-8?B?NS9IM2xYQ2w0d2lhK1MvOVRoVlVWWG1Hci9POXQ1Z0Rxd2E2U1diYmFuMTBy?=
 =?utf-8?B?SGJvelVMSytSNnUwMXQyMEVGeVZhMnRPQjFwNFZnbFkzdFZaYWZMamdicGdo?=
 =?utf-8?B?SEpqRVQ3VG1PZk5kVHdXQmVlVENGdlhHemFjc3MxVjVLeENhaDVYMzYwd29K?=
 =?utf-8?B?di9PemNZUmNPUllNZWV5MVF6UjBVZUtHWmN4U01mR0hjZlA5QmZ3UjFSa1hl?=
 =?utf-8?B?S1NUTCt2S1ljTGJoMm5yTUZ5d0tWSDkyRkV2dGJCRkVTKzZxTzZxTTRiZUhI?=
 =?utf-8?B?d3RIK0p1c0ViMm5jOVhPMTBwby9yVlU5KzdTUzR6Y01xR3c1RjBSR2NtVzl6?=
 =?utf-8?B?ZUlvbTJyZWR2bkhFMUliYUFEYytsdGpyU0RVcm1jZFE1d1VmKzkrSlIxUHlV?=
 =?utf-8?B?U1RpeUxMQTBIV1JmS1NpZzluUDhRai8zd1A5YUNsUlg0bnZ0Y3ZUaHk3VEFp?=
 =?utf-8?B?UzRsdDJZUzRydk9wWkZiSm54TWVqS0VWWHkzazV3KzZnVWdEZ3JUTVhLZzlq?=
 =?utf-8?B?UkFnZzNMTE9YR2JydWxCdFNvcXgzOXhKY205Z0dCL0IvWW5UK0ovZnRLdjFz?=
 =?utf-8?B?TGxvZ2NYWCtMYjFRUGIyeTJLQUw3Vldpb3ZrMHpNUTBkYm5yZ1A5bEM2bytH?=
 =?utf-8?B?dUNENytGc3c4dThPSEQ0OXhRb3RMbVlPVVNwY2VqdnhIV3dhOTlKcWVFTlN5?=
 =?utf-8?B?eFVMVjhDanhjUFRKWDhtRnlpWlBFUHJhMnVlVnVlUkdIUjV5WUZyNFMvN2kv?=
 =?utf-8?B?NzJJcHNpelRndy8rNFVYRldLMUZNUEpCZm04MDN3dVdwOFpzRVNhRHlQSThF?=
 =?utf-8?B?RDE3MW1SczdMSFhRUk9aY0NBSVpMRzJ2ejQ0dUZMT0JsZnhSVm1ycUFwYmZq?=
 =?utf-8?B?WGo0Qyt2VytvSk5kcWIrQ0U2bnppYTN5L2dYM01iNXlQbGg3ZWdndUk1ZThp?=
 =?utf-8?B?SktDSEFET3BVOWIrNGZMMG5OWHZQeXVZK00vWjVETkNScVNVOHhzMExlT3RK?=
 =?utf-8?B?d2dxY1h2aWFVSHV0T05UVXp6TnJNV2IycWg5MUdNNWVsS3BmaUM1RTU1ZGlq?=
 =?utf-8?B?Mkx1S0FmYVIzQ0N0cDRiVVYxeU9abTVXT1JaUE9uYkNYMWxIZTJsViswMy9B?=
 =?utf-8?B?T1EwamwwSEg1NjdxWmw5K1NxTXlBaUR0R2lhYldwajcxUTduc0lhcEwrMHY4?=
 =?utf-8?B?YzVMV2t3NlliWlZZZzVmZWZ2WmFDTnd0a0pKU0s5dHJNWitLb2Fmak9sRDFN?=
 =?utf-8?B?bllId2dHQnVnUFpURFF0SmMxOHFUaUFCclBsYmJJNVc2STVFSHFrUXdLU0NY?=
 =?utf-8?B?Q2xUTmpsTVpzRHduS1o3NWFDRU9hSnBYV3BQczRPcEVFNm16dTNPcHEzUWJK?=
 =?utf-8?B?N0kzdWc1NkNrcVkyL2pHZXJMVWcrNDlLK1pldWk4RGxYRWtRMmtwaytFRElx?=
 =?utf-8?B?cnFuc2VkaVhsN0d1eG1qdE9jMm9MOFZwUDg5SjZ1Qk1QM2RPRCtaa3pRa3pU?=
 =?utf-8?B?TmZKN3N2WmxZQ2tlSW9xWHc1UWRQTUdJdlVjRFBMZHh2TkQ0Sy9lUHExQ2xP?=
 =?utf-8?B?LzZxTGxURGQ4aEUrS2JndzdhS0JPZC93dlZCUkJJaHUyT3NJTlNDL0E5eDFE?=
 =?utf-8?B?d3NZTFdkV2RiSGZKcmdPZVNFODN3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc48ea7-6591-427f-69a6-08d99eca042f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:01:14.2734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WctSdJHnxLuFnvR2xRHDMYVIBPVH3Pd60bBgeXFWuh8zd1j3vBz70J+Em/lfAaNfQuKq5sM6QQTlLzMvBsPksbkmpK2LLV0c+adI2usCGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2417
Received-SPF: pass client-ip=2a01:111:f400:fe1f::717;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.528, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

02.11.2021 15:29, Kevin Wolf wrote:
> Am 17.09.2021 um 20:06 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 17.09.2021 17:49, Hanna Reitz wrote:
>>> On 15.09.21 16:45, Hanna Reitz wrote:
>>>> On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
>>>>> These series makes tests pass with
>>>>>
>>>>>      IMGOPTS='compression_type=zstd'
>>>>>
>>>>> Also, python iotests start to support IMGOPTS (they didn't before).
>>>>
>>>> Unfortunately, the problem I have now is that it makes the tests fail with other IMGOPTS.
>>>>
>>>> My regular test set includes 'refcount_bits=1', 'compat=0.10', and 'data_file=$TEST_IMG.ext_data_file'.  These fail now, because the Python tests don’t have a way to specify which test options they don’t support (like _unsupported_imgopts).  Handling data_file of course is extra tricky because now every disk image consists of two files, and the qemu-img create invocation needs to expand '$TEST_IMG', like _make_test_img does (in the line where imgopts_expanded is set).
>>>>
>>>> I think we need an unsupported_imgopts parameter for Python tests, and it needs to be filled (perhaps https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00082.html can serve as a starting point).  And for the time being, I think Python tests should be skipped altogether when IMGOPTS contains data_file.
>>>
>>> (Perhaps I should explicitly say that this means I didn’t include this series in my pull request this week, because, well, my pre-pull tests were failing :/)
>>
>> That was clean :) I'll resend
> 
> Am I missing something or has this not happened yet?
> 

Not happened yet :(


-- 
Best regards,
Vladimir

