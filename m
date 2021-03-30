Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7234EFDE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:37:06 +0200 (CEST)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRIIb-0003tw-5b
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRIHk-0003O0-7s; Tue, 30 Mar 2021 13:36:12 -0400
Received: from mail-eopbgr30097.outbound.protection.outlook.com
 ([40.107.3.97]:43703 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRIHh-0002mE-7j; Tue, 30 Mar 2021 13:36:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhQkjaty3maf375v7tTIaizI+KA/zfmbtx1sSNL/jOVI1QyclFp05Dqao9TrBIQfJEKCSmyPx/AuDa7P5uYc8khf35t5ZbM29DwogTZ3LoslIgnqVVmWadulTnXpJvFGQ6mr7Fjdsq+Y3Jt5DX0NwImtlvRmNqkV3VgfB3gjpIsXMCOhxqqagYw9lqzpW6CbCcy+HtcuCl41pN9Uf1q8jcUBswUo6Z9MLbSGjl/e4yvPdmW5Tu2X7wEls2M3TuUo2sa5rlLM8XpKeEZtGVkYgqRQ2aSZMOe0SE8v3Q2LcbahnstAimcVIV2YiwEBoYS74b71/vdC21ebXB7J6QY/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUV4gDfpjeMG807uI6AXGVVhagAWNtaZAoQZ4e3J6FI=;
 b=apEftneBKMU3SZyBDk4IU1Dq1kFcRD/pQnatFP026CI/A5iqMxSVSf58Xsd0XP9+GEHlsolBXLqy5tp4v7j35smDJJdzMawExrcHYZ2+5eVcYYz/Zk9wdoQw3+rSN8CViTgvDck1EoYul7iphw3uVr+YvOsWR5FQdRLb5ygJyCEiQ6bupFXq2aRy1t10obB/Z4Wy9YRCoNhHOQcgEiy3YWwS1LyCXQmFT33g4tJkUwmxXSD5YfN99i3DCh57ZGNlKOB26vaymf0zgltfzDSI3ZYbAAnX4Eb5WMpngBSr1sXBy2orxtStza39PAm/MX7lyDdZ9TJU99ShuSxJK+FBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUV4gDfpjeMG807uI6AXGVVhagAWNtaZAoQZ4e3J6FI=;
 b=nTaXDkC7BiCG7HrI0jBL1/vW0KDC3DfYKznd1N9wFYbF+cZUvVL3bJQFgjnT3xJCEBwpIcTnUMpfc3xdl2tIlb1jM3J4+WqZHs0LVHgzw+BKWdhnBybfYY0N/pSo3g5zhDXGgDkP9//q45ZVWEZUPm0vOq6+2gUrtabRWs0EFCE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 17:36:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 17:36:05 +0000
Subject: Re: [PATCH 2/4] migrate-bitmaps-postcopy-test: Fix pylint warnings
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-3-mreitz@redhat.com>
 <0f1f876b-e93c-4234-4c4c-3de19a3c577c@virtuozzo.com>
 <3fea2027-c8a3-ab65-cd3a-01f7d0c6bb15@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <809f8b52-d0e8-c6b0-fe34-8547eaa4c8f4@virtuozzo.com>
Date: Tue, 30 Mar 2021 20:36:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <3fea2027-c8a3-ab65-cd3a-01f7d0c6bb15@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:208:14::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:208:14::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.30 via Frontend Transport; Tue, 30 Mar 2021 17:36:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c568239f-71b7-4448-c4b6-08d8f3a24b90
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61190260EEFB968B1D923F75C17D9@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IbQ/ReOG4HYcTlOAnPjrJFoIEc4zxTZlba8ARCCvfvj/j2OMIi+1NfTTFQQe3QbWvCq0Emlp/SZJlHQetksumN5jNlqj3XfaAHQ6mOnPbKbbX9rCf781VO6ILy4n9v+MU2NeaWxsyRdhbrY1fULKewC3Bu+JSiUEcIPDT4dYfTJ+DkNZhSOnD8XsDnrTVqenWRRC3Pkm4IlBaYJS8peUwp3hH8pePcksP7So/50BUOJdzMk5sQu/TNbVd4PdswAvbZk1dHDSmV5brh7HwjxLmWuBfMDCYH7LurYKfgRxl/eKJzR2REN4CrS0S6Ts+raVTxYltIeExbaELiU1n/B30XP5tmBYuGx8xiarBm7nYQcvJugSobmICboBu9vCarqx3XdZhyg63csW8oOxUwTBnAZ6FqRCYlDL4hrY5il+mFudVQVWbx5dalH9rCqVY74Kk/XBRmVMMndXVvRcCGSnBbky9KLSB5XdrWRsurxz1L4BpGRJPV9w+Sc30s90rfRhjeLsHnjVips9Kp8IJFi0qYsWJPXkJXKzXkk+Cq+jpH8eDdNH65wcJlk+zZeP2MFWT3eJq5PGj6TI4oJBEj2vtvn9PhKGaWWqit3/cOwardM629gju1R74JfeRkyNbADawa5j2jSAOXqUBRXYpJML6qYZF33J+M/2IRoRyXloPXwCCwgyfPUDY8p308+slyUj9Z3mU7E/HhLq9a45fZI5xzLQHxVjws0QSvnMysq+cI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(376002)(396003)(366004)(4326008)(478600001)(8676002)(956004)(2616005)(2906002)(53546011)(316002)(36756003)(186003)(5660300002)(8936002)(16526019)(86362001)(31696002)(26005)(66476007)(66946007)(31686004)(52116002)(66556008)(6486002)(16576012)(38100700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckNvZE9Oalg5L01BN0IwNlFCUkp0b002T3lKM3NiRk1VRjFyQkdrSEhTTExv?=
 =?utf-8?B?M0JYNk1BUHpMZUdHS2p6TFJpTlJ3RXBKTzV5UUQxSEFwaXZqem8xUGhFWlJ5?=
 =?utf-8?B?TEloN09kdzlvZTZ3bWxzVERSV0FrTTc0U1NPbThTNDIyVERkM3ZlRVNNRm5h?=
 =?utf-8?B?VkF4WkU0bVR5QUZHanpKa2gzQ25aQjgrcFBhK3pCS2N1NWt1bUZIRkR5Mkx1?=
 =?utf-8?B?TThhTlJUREdDK0xPVDFGckswbG9jWEhzV1R3dUZ2ZE51cGhhYmUyT3oyditX?=
 =?utf-8?B?YVF0VVZVTVdoelVQWjdrS29saEpqSUVIcDNOS21vS3RsN2pRYnFocHllL2Jn?=
 =?utf-8?B?MWhDY0tqOUxLZklCSGxhTjVMbzdwY0JVMUprNDFqM2NhWTdVNEdnaEcvaXE0?=
 =?utf-8?B?bW8rcmVvZ2FacWVnUEZBK3o2V0doWDQyVGIxTFZOOUswdUw1Wk1maTZ2ZWVz?=
 =?utf-8?B?L1dsMkZZcjVzRUNCSTA5aXVNMld4RlVGYlp2YUlROGx4L3U2WXJQZkdUTVNP?=
 =?utf-8?B?aEQ5b3ZNWmhicWpBQS9uRCtEZGVQeEQ4aGczUG8yWUM0ZTZPVkc4bjU3MTV1?=
 =?utf-8?B?NmZTaGtxWFJjQTBUV0JvVzJvam9VQnlOQXZDd2RBTURMeXZZaHU3R1l1d0xK?=
 =?utf-8?B?eThXS1VwTFd5a0JHdUpiMTlWTU1hZVNMZGpaemlpWDU4ZzZ4YjFSc2cwc0Nz?=
 =?utf-8?B?Sy9SeWc3Wis0UjYySTJhbmluTFhUbEhvblVSWDlyckQzMTdieUNJY3lOMzdm?=
 =?utf-8?B?NFJZN1BGckJ5ZEozRTRLYk5uaWpFMFozL3dVeVQ3L003d0FNRFg1K092bGVh?=
 =?utf-8?B?dVpQZStMaDVQWE51NC8zTHdpd1pQVm0yODEvY2lSbVlod09FQmNRYUdpME5P?=
 =?utf-8?B?bUw3eTFXVi9velpvQUNsZ0R1RkNLb3JobFQxMzRBRENHLzVNamx6U3l1Nkcr?=
 =?utf-8?B?V0lTWXNVakFyc0hKeExXdGFKeWg2U3dPZlVPTVBwZ3AreVJ2bEx5Z3lDelZL?=
 =?utf-8?B?MHJicVE0MWFZUThBdkRYM01iaWFrUURDaG5aT1hycHp1cnZ5WFNPTlc2ekJx?=
 =?utf-8?B?Mi9oVDUzbjBEdktKMVpsU3BkNTFFUm1UWHk4M0k4SDRBVCtHZUt3dDZoVGNx?=
 =?utf-8?B?RC9wZnVpNkJtcEJmZFJlU21YNFVSVm5neHgxck96bmx6Z0ZFeGNMTkNtRmQ4?=
 =?utf-8?B?eVIvYllLcHE2U2MxaHhYOU9jbDFqQlhhV0UvcGJCZ2pDSmRDb3Zzd2Q2OG5y?=
 =?utf-8?B?OUZMczVNbG9tRUtmclVMMmp1RjRDTmd6c3hQUC9xOEpMRXR3WVVNSW5LTFFu?=
 =?utf-8?B?RUFhYUdGeHJNY0F4b3BoS3ZrdmZWdEtQa1M3U083STcyUW9PbDJXOFY5LzR2?=
 =?utf-8?B?T1Q5L3JSMk4rQ3ROTVloMFpPaEhVcVVodUQweklabXN4TWpudWxFWTZpWWdq?=
 =?utf-8?B?WFVoZmZRWGFpNytWRXJIK1Y1d2ZHS0RNZm5oa0lmbmhOdHBzSDRkQ1RYaEo1?=
 =?utf-8?B?clNYUDk0aGhDcFBZMXV2Njc3VTJ2UnBweWVkaUx1UmJmMWlZRWdPUFgweFpF?=
 =?utf-8?B?bjgwSHJ6MUlPQnM4ZEVuQmRFNm8yeFB3b1BrVk1ZQ05rYmVOb0Z1OU5iYkxM?=
 =?utf-8?B?UGtZa1lDY2hUa1NaOXlFZUlyY0hJSnZpWE55K1JrSnZkbWpmeTIvY3Bjam5E?=
 =?utf-8?B?SVFMcUduMkNsY1VHdjVJeEVPMndvRUp1L2srcFkyU0k1eTl5Q3kzZkhQdVBM?=
 =?utf-8?Q?PxOExftai0iiSwywBicVN+2N7R8B+VB0y+K4RI1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c568239f-71b7-4448-c4b6-08d8f3a24b90
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 17:36:05.1592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jC2D3B58djYoBL0itvqptXCyEg2HD03GbTdQn/7ToZQ5uTD7inbszpULkUb5/pWTQlCr37jKjJ5E7ajpAIw63zMJuqQS6zrb3J0tV+mAdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.3.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

30.03.2021 20:18, Max Reitz wrote:
> On 30.03.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
>> 29.03.2021 16:26, Max Reitz wrote:
>>> pylint complains that discards1_sha256 and all_discards_sha256 are first
>>> set in non-__init__ methods.  Let's make it happy.
>>>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
>>> index 584062b412..013e94fc39 100755
>>> --- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
>>> +++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
>>> @@ -76,6 +76,9 @@ def check_bitmaps(vm, count):
>>>   class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
>>> +    discards1_sha256 = None
>>> +    all_discards_sha256 = None
>>> +
>>>       def tearDown(self):
>>>           if debug:
>>>               self.vm_a_events += self.vm_a.get_qmp_events()
>>>
>>
>> I'd prefer not making them class-variables. I think initializing them in setUp should work (as a lot of other variables are initialized in setUp() and pylint doesn't complain). And better thing is return it together with event_resume from start_postcopy(), as actually it's a kind of result of the function.
> 
> Oh, that sounds good.  Is a list fine, i.e. return (event_resume, discards1_sha256, all_discards_sha256)?
> 

I think list is fine for now. If in future we'll want more logic in this place, we'll refactor it to some object or something.


-- 
Best regards,
Vladimir

