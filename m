Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E136F9887
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 15:01:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvdzE-0003uE-Vr; Sun, 07 May 2023 08:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pvdzB-0003tX-Gx
 for qemu-devel@nongnu.org; Sun, 07 May 2023 08:59:33 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pvdz5-00027k-6x
 for qemu-devel@nongnu.org; Sun, 07 May 2023 08:59:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzXvbN0OmQysDMlIrWklkX1coY+7Uj6bTHYWiOV5o1+/xoTZzoP2OwRJk5ixh0zuFTHcGH9XoOZH6503TtZYgMf2TbBn6w+piuqkHbuBUJeg0T0WgZ4O5yc3tUgD4r4ygTnO6/m2Mh0snZ2m+jQlWR7C0vw4luUkIgXHJK1+s5r5J2+aU4gYorzvBoV+oFXOg58xP5Fw5UZLcBE7Aj8+Wh7AgkQQebBef6jOHFcGDcS2tSEtVvSA9/42X7uwjTYpGe0ctme1WePajlAKMNjRFZCkRrxt9/UpG+EqfOAMXGcXEwIAcwE0mYanlnSprjiqkmyMHZPO7iJfZKgL/3Ze4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEJPNvCw2kbyl5liQ+ohEpB+c/h3Dx6ZVC9U+Vqq4Qs=;
 b=EOs4thcB6SMgVYGSxOE/p9cxKXIewGzrlhgx0b67EuB8noFHDt/LYOGUSwKuIuHJACet+/HOBSFR5lhU/95SF5TpXkasTgmYxhYvfFREV3CcgscSYjV1NdjliaKzabVsNtkvTyv/67KyV7YqTIxqAhawD7k4y69gjww25Ypsw0qDqiuQp1EdzhMTpjeaSpU//qqaOJdYwOfGG2CUlzOlA+aya1/RN7OCq53kxTp/LPhDrwStzeqKURAzYoar6p2jp1BWRjlDvTfzr1c43VpWSpLVi88zbFlBjv2rkWnPlEFhySZRfDLbDJ4XURfsDCL0SizUBQRnkZkmbhILWR/2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEJPNvCw2kbyl5liQ+ohEpB+c/h3Dx6ZVC9U+Vqq4Qs=;
 b=JQoanpvXNVNrsqk5PuJMjtVJgYrX173vCM4EnU0VIAGMxmzEp+0MXfCvs7FrptnfRzEsgDoCMom/tasiWFsTzM4+Pem11i0hvFrd4HHXLfXWJQo0FjbQerB0/R0fInXrrf57s1PTsEbORHFqn/LnS99/5znitpIr5qJT20flFXcQxuf9DFrdlrjIOQ1qVEAIfohh92xQrS9ASdKP1Vl54hPP0C0WCuD8wofxq01J1mPQvjgCSoH0627/zPMjicCB64SDcV94yRNmm6MHT0YDDM3hVONrBO2WNIThx+EXe6C9eRhQnps/pRAgLP3CUqJdrgH+oe38qSFud/eFOH9mbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Sun, 7 May
 2023 12:54:18 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6363.031; Sun, 7 May 2023
 12:54:18 +0000
Message-ID: <95db8c9d-c649-09b7-843e-215756820bb1@nvidia.com>
Date: Sun, 7 May 2023 15:54:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Avihai Horon <avihaih@nvidia.com>
Subject: Re: [PATCH 0/8] migration: Add precopy initial data capability and
 VFIO precopy support
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20230501140141.11743-1-avihaih@nvidia.com> <ZFGTerErJWnWHD6/@x1n>
 <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
 <ZFKCg2xnws2Smchb@x1n>
 <cd16086f-7c82-47ab-d893-b33d64f121d9@nvidia.com> <ZFPUOeuICJ1gehNk@x1n>
Content-Language: en-US
In-Reply-To: <ZFPUOeuICJ1gehNk@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0262.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::34)
 To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM4PR12MB5182:EE_
X-MS-Office365-Filtering-Correlation-Id: 562c85e9-2f99-4c26-ab62-08db4efa2b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f75IYoGSa1rK4CQHupk5W6f03eWEiKbLyQ++ecXXlGLAHAK/1hw5GNnQOaHhle1Q4KA/dYUCHB2PAU1AOninw4Pshtbqt15HLSZ3LGtY/RK44MmrDqpZcbJDqKj4t6He/19SwRwOpt4BYQyMw8WLBTcC8Z5PtVsbZj09J0fCDC4FjaGBINIghQc4/vhtMFBtCKSGQybdZk38TSuqWM+g60c0KBL6NsZl/etom8xUyebszo8N18TSABOa8iQPnIgeK8K6R8We8qJTHTF5mjpLjSyEHQj4lMeu+Uml3kvSjj2wF0hUVG2JbFefPINVeVpkchxaxdMFP0Pk+u1XcAsNvHCaugxYdJqpfgKCSAZybKo/dFBpRp0En9zz4JQC0WXNNN0dmArBVMzB3MWB/3/AzVPspPMp1n0BeqjP/RcZePu+dy6lJ+rpAlmdsTkFohgeXtxLrOOY3TUuPKrkA5BGeLmSHCsxIquI4iLDPwy+zJF5w3raw2x5LBZP+lDU+Zb31oZG1N1qWrazCfVGbm1OIQXGfTvgJuFS+/cy0bg+UkiAICq66xuv981Ek/HoxTKJ1v8m0X1fhLpq0V72dmDneKwcoPJlek+jkncQ7CDqYDUmIiYz8HqwfG1AihKHDhhcEDne/71192ZPDB/793SZhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199021)(86362001)(31696002)(36756003)(54906003)(316002)(66946007)(66556008)(66476007)(6916009)(4326008)(6486002)(6666004)(478600001)(41300700001)(8936002)(5660300002)(8676002)(7416002)(30864003)(2906002)(38100700002)(186003)(53546011)(26005)(6506007)(6512007)(83380400001)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U29GNVlSd0kyaDR6RVY5VWl5ZTJnQWF5S0tQc1YxZEZEZk5tQXNjUVp3U3VH?=
 =?utf-8?B?KzhLZkwrUkgrR0dwZ1lkcGcwQks0WmR0OENiYTJYc0RZZll2VjdpcEdieVNy?=
 =?utf-8?B?MmN4cTE0Z2REc0JhSUZNSmxleGM4OVRCNVhmRzdXNnBOZjlBaVh1aWZsbUFU?=
 =?utf-8?B?SUZFQVZ0ZHVacVBPS3JmZWs3OS9VM2ZyZ3l3Mjg0ZXNBcUI3ai93QnRUMkdQ?=
 =?utf-8?B?ZktidHJ4d3cyRVJEd2VHVjNKU3QwV09LL3BNdHQ2YnlUcUdTTkV5NW44U3JI?=
 =?utf-8?B?UTJXVFVjTlZFQ1hSZ0JoWWNXR1R1cWozd3QxT3R4TlpXWVlQT2xrSEs1ampB?=
 =?utf-8?B?TWZhUjZXWGNXTjc1amZKcTNyeWMxWEt0dmRCTUdyY1ZhWHF6M0JkdnF5TjZw?=
 =?utf-8?B?dE5heFJtYzV3TUxlaXFXVGwzLzdoYUo2WTh3K0VBbTFaZWxFOGlzVjh4TS9M?=
 =?utf-8?B?OVRmYWVSWURlZFFJY2UvRHZsV21tL2xKcTJUK0NZVnRkUUpUUkFaYlgyMHpz?=
 =?utf-8?B?RHk5UTk3K1ZickNYT2FBYnZ0RmZDSlJscUtGbGJuczYxZk9iTTlTVis4ZkFW?=
 =?utf-8?B?MzUwSVBOZ3QzWTBVOVZ4K1oyK0g3SkxDcHJ5aXYvcTZOeFBrQU5VUlNLOGlZ?=
 =?utf-8?B?MXpyQXdxR0VhR0k0RllETHdLR1FJT2xqSHZObS8vbVZIUXZ5SUVnQndTS3Rv?=
 =?utf-8?B?TkxGUkxQZC80UWUrWi8wMm5TY0FYbFU0OEh3OXJiTVZpMnpHcWtsTHRLR3Nq?=
 =?utf-8?B?SVl0RDdyT1FoRC9XdXVNdWJ0TnJ1UitCTnRMQjBsYjRXTXBNbmdiTjFKWUp6?=
 =?utf-8?B?RlZPYUZsWW1jQW5kNGVqdVdiaFVVT21mOW9DRFBVSWlhUE4zbFhXVEk4SUFv?=
 =?utf-8?B?SnJNeUkxb21ZM1VKMFZPK3RyNGl2NXR4bHNMdUhTMlRjZVErcXpONTl0Qlhh?=
 =?utf-8?B?YkhuYUEwU2JGL2JFU0NSZSt4alNBcWdNWHNFQy8ydFF3Y1ZsME1ZL2g1Y05w?=
 =?utf-8?B?bm5CSk45Zlk2UzlVL0hIQXdyd1pOOUtOZ01HUXZ0UWpBOC8vblkvLy9TaTRD?=
 =?utf-8?B?Z2xSd1lVbVl2U3FQTm1DYVd1M1ViOU45NjFsWUxVcExHck9UUEg4MHRDNkQr?=
 =?utf-8?B?S3IrbzAwUncwY3hWSEFmd2tYakF0TllpYmphR1VYaklGNnF3eVFDbzhjVlNV?=
 =?utf-8?B?a1Y0Zjk4VFRMaXFTR1ZwUnFoNFBmWHVsQ0pJQ1NkZWhISkZtZ242WnhERmk5?=
 =?utf-8?B?OExjWjNySCt1RDhWdGl1amVaSGZ5ZUtiL3RrT3FITmE0dUtJWFk1Ny9hTGxL?=
 =?utf-8?B?Z1NZZjgrUEYrTFhheU1RS1FNeDhNaTFWODUzeFFOTFp5M1Bpd1VYQnJPemdW?=
 =?utf-8?B?ZndwZFNjc3pXNUExRkc3QUFDVE1UdXV3d0xlLzFKRU41allhQldQUmN6RHc2?=
 =?utf-8?B?T1ZBc3E0NDhzNk1OK2hpdU1OZ21zWHRRcmlhSUhtUXRYLzBFbjZ3QmdqSWJz?=
 =?utf-8?B?N1JySjRhM1hHcklsNFNialJBYy91LzdmNmpXU0l4UHBEVkM3QWJaUTRYaE5Z?=
 =?utf-8?B?NEZhWkxTVlVyY3dZdUlqQityRE5mdktYbUhYYWZhVkx5eElrd0NBUEVVVmI2?=
 =?utf-8?B?cTBXNkIxUUhPZnZ0SkNZQXA2WkpBcFl3enN0U0d5VVVncnRWRTk3SW5KVmtV?=
 =?utf-8?B?RmZ3VmZqU3lhVk9xOHNnemhab1pwT29YYTVSNTlodVZWSWpubnlaSWhWQlJJ?=
 =?utf-8?B?Vi9ySThoMjVRVVZyb1kxeklQZno5ZXYxQ2pNdnhmTlNEdnB4WHVCVVFYTzRs?=
 =?utf-8?B?aWJNZTNKcE5MWjBFcmFzM1hqSzVzVEhvUnJuNGU0UDNQdW9Gd0MyeGZmZmlv?=
 =?utf-8?B?TWJDQzFsUGs3ak1UdjhOMGl1N1RYbGhHVHBNV0hwaXFuK0RHM2xHWDZXNHhm?=
 =?utf-8?B?V1VXZEtITVBCOHEwbEtZQmxpOVFaNmI5SWlmcTYvWkV4V2dNbHd0ZXVVZ0xW?=
 =?utf-8?B?blEraWJzSHdOM2dWaWFzRlVRT0kvZUNYUzdldk9KaGFkOFh3MzJpU2w5R3dj?=
 =?utf-8?B?T3BWRlFIK1l5RnpLOCsvZHRxZjNJek1qRjkrVElFUjUyc2hXaE1QTjhURUx4?=
 =?utf-8?Q?cCzDQ4ZBoOyPFqKjJiTRlG1LG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562c85e9-2f99-4c26-ab62-08db4efa2b08
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2023 12:54:17.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsqh7RWEtXeGCphs/SUErzaT5u//kca4fPhMEy3Nn8k3ul0pLpLfsTjEO00dCA7+ffMWQKvH2UmEE+G9RN+uxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5182
Received-SPF: softfail client-ip=40.107.236.41;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 04/05/2023 18:50, Peter Xu wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, May 04, 2023 at 01:18:04PM +0300, Avihai Horon wrote:
>> On 03/05/2023 18:49, Peter Xu wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Wed, May 03, 2023 at 06:22:59PM +0300, Avihai Horon wrote:
>>>> On 03/05/2023 1:49, Peter Xu wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> On Mon, May 01, 2023 at 05:01:33PM +0300, Avihai Horon wrote:
>>>>>> Hello everyone,
>>>>> Hi, Avihai,
>>>>>
>>>>>> === Flow of operation ===
>>>>>>
>>>>>> To use precopy initial data, the capability must be enabled in the
>>>>>> source.
>>>>>>
>>>>>> As this capability must be supported also in the destination, a
>>>>>> handshake is performed during migration setup. The purpose of the
>>>>>> handshake is to notify the destination that precopy initial data is used
>>>>>> and to check if it's supported.
>>>>>>
>>>>>> The handshake is done in two levels. First, a general handshake is done
>>>>>> with the destination migration code to notify that precopy initial data
>>>>>> is used. Then, for each migration user in the source that supports
>>>>>> precopy initial data, a handshake is done with its counterpart in the
>>>>>> destination:
>>>>>> If both support it, precopy initial data will be used for them.
>>>>>> If source doesn't support it, precopy initial data will not be used for
>>>>>> them.
>>>>>> If source supports it and destination doesn't, migration will be failed.
>>>>>>
>>>>>> Assuming the handshake succeeded, migration starts to send precopy data
>>>>>> and as part of it also the initial precopy data. Initial precopy data is
>>>>>> just like any other precopy data and as such, migration code is not
>>>>>> aware of it. Therefore, it's the responsibility of the migration users
>>>>>> (such as VFIO devices) to notify their counterparts in the destination
>>>>>> that their initial precopy data has been sent (for example, VFIO
>>>>>> migration does it when its initial bytes reach zero).
>>>>>>
>>>>>> In the destination, migration code will query each migration user that
>>>>>> supports precopy initial data and check if its initial data has been
>>>>>> loaded. If initial data has been loaded by all of them, an ACK will be
>>>>>> sent to the source which will now be able to complete migration when
>>>>>> appropriate.
>>>>> I can understand why this is useful, what I'm not 100% sure is whether the
>>>>> complexity is needed.  The idea seems to be that src never switchover
>>>>> unless it receives a READY notification from dst.
>>>>>
>>>>> I'm imaging below simplified and more general workflow, not sure whether it
>>>>> could work for you:
>>>>>
>>>>>      - Introduce a new cap "switchover-ready", it means whether there'll be a
>>>>>        ready event sent from dst -> src for "being ready for switchover"
>>>>>
>>>>>      - When cap set, a new msg MIG_RP_MSG_SWITCHOVER_READY is defined and
>>>>>        handled on src showing that dest is ready for switchover. It'll be sent
>>>>>        only if dest is ready for the switchover
>>>>>
>>>>>      - Introduce a field SaveVMHandlers.explicit_switchover_needed.  For each
>>>>>        special device like vfio that would like to participate in the decision
>>>>>        making, device can set its explicit_switchover_needed=1.  This field is
>>>>>        ignored if the new cap is not set.
>>>>>
>>>>>      - Dst qemu: when new cap set, remember how many special devices are there
>>>>>        requesting explicit switchover (count of SaveVMHandlers that has the
>>>>>        bit set during load setup) as switch_over_pending=N.
>>>>>
>>>>>      - Dst qemu: Once a device thinks its fine to switchover (probably in the
>>>>>        load_state() callback), it calls migration_notify_switchover_ready().
>>>>>        That decreases switch_over_pending and when it hits zero, one msg
>>>>>        MIG_RP_MSG_SWITCHOVER_READY will be sent to src.
>>>>>
>>>>> Only until READY msg received on src could src switchover the precopy to
>>>>> dst.
>>>>>
>>>>> Then it only needs 1 more field in SaveVMHandlers rather than 3, and only 1
>>>>> more msg (dst->src).
>>>>>
>>>>> This is based on the fact that right now we always set caps on both qemus
>>>>> so I suppose it already means either both have or don't have the feature
>>>>> (even if one has, not setting the cap means disabled on both).
>>>>>
>>>>> Would it work for this case and cleaner?
>>>> Hi Peter, thanks for the response!
>>>> Your approach is indeed much simpler, however I have a few concerns
>>>> regarding compatibility.
>>>>
>>>> You are saying that caps are always set both in src and dest.
>>>> But what happens if we set the cap only on one side?
>>>> Should we care about these scenarios?
>>> I think it's not needed for now, but I am aware that this is a problem.
>>> It's just that it is a more generic problem to me rather than very special
>>> in the current feature being proposed.  At least there're a few times
>>> Daniel showed concern on keeping this way and hoped we can have a better
>>> handshake in general with migration framework.
>>>
>>> I'd be perfectly fine if you want to approach this with a handshake
>>> methodology, but I hope if so we should provide a more generic handshake.
>>> So potentially that can make this new feature rely on the handshake work,
>>> and slower to get into shape.  Your call on how to address this, at least
>>> fine by me either way.
>> I'd really like this feature to get in, and I'm afraid making it dependent
>> on first implementing a general migration handshake may take a long time,
>> like you said.
>> What about keeping current approach but changing it such that the capability
>> will have to be set in both src and dest, to make it similar to other
>> capability usages?
>> I.e., we will remove the "general" handshake:
>>
>>      /* Enable precopy initial data generally in the migration */
>>      memset(&buf, 0, sizeof(buf));
>>      buf.general_enable = 1;
>>      qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
>>                               (uint8_t *)&buf);
>>
>> but keep the per-device handshake, which is not a handshake for migration
>> capabilities, but a part of the protocol when the capability is set, like in
>> multifd, postcopy, etc.
>> This way we can advance with this feature while making the general migration
>> handshake an independent effort.
>> Will that work for you?
> Yes it's fine by me.
>
>> BTW, with your suggestion to add a notification mechanism to notify when
>> initial data is loaded in dest, I think we can drop these two SaveVMHandlers
>> handlers:
>>      /*
>>       * Checks if precopy initial data is active. If it's inactive,
>>       * initial_data_loaded check is skipped.
>>       */
>>      bool (*is_initial_data_active)(void *opaque);
>>      /* Checks if precopy initial data has been loaded in dest */
>>      bool (*initial_data_loaded)(void *opaque);
>>
>>> In my imagination a generic handshake should happen at the very start of
>>> migration and negociate feature bits between src/dst qemu, so they can
>>> reach a consensus on what to do next.
>>>
>>>> For example, if we set the cap only in src, then src will wait indefinitely
>>>> for dest to notify that switchover is ready.
>>>> Would you expect migration to fail instead of just keep running
>>>> indefinitely?
>>>> In current approach we only need to enable the cap in the source, so such
>>>> scenario can't happen.
>>>>
>>>> Let's look at some other scenario.
>>>> Src QEMU supports explicit-switchover for device X but *not* for device Y
>>>> (i.e., src QEMU is some older version of QEMU that supports
>>>> explicit-switchover for device X but not for Y).
>>>> Dest QEMU supports explicit-switchover for device X and device Y.
>>>> The capability is set in both src and dest.
>>>> In the destination we will have switchover_pending=2 because both X and Y
>>>> support explicit-switchover.
>>>> We do migration, but switchover_pending will never reach 0 because only X
>>>> supports it in the source, so the migration will run indefinitely.
>>>> The per-device handshake solves this by making device Y not use
>>>> explicit-switchover in this case.
>>> Hmm, right.  When I was replying obviously I thought that decision can be
>>> made sololy by the dest qemu, then I assumed it's fine.  Because IIUC in
>>> that case how many devices that supports switchover_pending on src qemu
>>> doesn't really matter but only dest.
>>>
>>> But I re-read the last patch and I do see that there's a new bit that will
>>> change the device protocol of migration:
>>>
>>>     if (migration->initial_data_active && !migration->precopy_init_size &&
>>>         !migration->initial_data_sent) {
>>>         qemu_put_be64(f, VFIO_MIG_FLAG_DEV_INIT_DATA_SENT);
>>>         migration->initial_data_sent = true;
>>>     } else {
>>>         qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>>>     }
>>>
>>> With this, I think what you said makes sense because then the src qemu
>>> matters on deciding whether to send VFIO_MIG_FLAG_DEV_INIT_DATA_SENT, it
>>> also needs to make sure dst qemu will recognize it.
>>>
>>> Do you think this new VFIO_MIG_FLAG_DEV_INIT_DATA_SENT is a must to have?
>>> Can this decision be made on dest qemu only?
>>>
>>> To ask in another way, I saw that precopy_init_size is the fundation to
>>> decide whether to send this flag.  Then it's a matter of whether dest qemu
>>> is also aware of precopy_init_size, then it can already tell when it's
>>> ready to handle the switchover.
>> The destination is not aware of precopy_init_size, only the source knows it.
>> So the source must send VFIO_MIG_FLAG_DEV_INIT_DATA_SENT to notify dest that
>> the initial data was sent.
> Then, can the src qemu notify instead?
>
> We can have similar notification mechanism on src qemu and if that can work
> we can further same the other MIG_RP_MSG.  The counter counts how many
> special src devices are there and we don't switchover only if all agree.

Do you mean the following:
We will have the pending counter and notification mechanism in source 
instead of destination.
The MIG_RP_MSG_INITIAL_DATA_LOADED_ACK message will be sent by each 
device in the destination that loaded its initial data.
Each such RP_MSG will decrease the pending counter in source.
When the pending counter in source reaches zero, source can complete 
migration.

Or did I misunderstand you?

> I know that even if !precopy_init_size on src, it doesn't mean that dest
> has already digested all the data in the send buffer.  However since we'll
> anyway make sure queued data landed before switch over happens (e.g., when
> we only have 1 migration channel data are sent in sequential manner), it
> means when switchover the dst qemu should have these loaded?
>
> Thanks,
>
> --
> Peter Xu
>

