Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D76378BB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 13:21:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyBCo-0001NF-66; Thu, 24 Nov 2022 07:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oyBCl-0001LZ-CC; Thu, 24 Nov 2022 07:19:47 -0500
Received: from mail-dm6nam12on20618.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::618]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oyBCi-0005pn-EX; Thu, 24 Nov 2022 07:19:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwLiwPXE5s/YE1kNJKl7cuNQsq0qlmDVzf7Zqsj3LPsI+8tf1Obh0Vv1grkrZlEKG2tWRpxtzCfj69jYRX0eZG8a3PMt3jC7hz6HRzAdjA8/WM5Yt4Zsdr/YTbSAJOOlgQkOe9drulcV8uHtDLgiLXClpEaLQd2cCPKKZKbgFSiXsYjDt3+9X15wdEjeDNllGqg7tlP3NRx5SDHpCDy4e2OwUIQRU+eg0K7FI6eQNCtPfnKSVambJTQAKE81MYmqfaG2IxfFPQ9BLn4k2Ff+xexpN8xrm7N8gc4YTCOIteAi8zvU33zrWiEAilNcwjxC6by4pAwtwMCdg5cTvE2fww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y73xW3ksCwAfHAvdI/zz8xYEyEbaCJkZpPGT4EfT4BI=;
 b=ECRFvYi1y3k8dUkS9PcEWmzMN5kRaW/7lcPLK/QFacMwVorE/kQpzYgbJBalp6H3ltuGkEnWhElLqP00MEkTiGZ2CVB0OJE8qD4QniAd9F77hQPaNIxj4VTpCQo7xRlt+tMXBeesTZQMhxZMYXVRJeS6kiiLJYagI71dh9nf8cqDOy95IY7hBREO1wx2WYAgXeRVw83ztpAPBpfbginBs7RkuCzDucuiaVr6XGb8EXSZhAJZJAGIA35rxC9JYzDIcYlgh/hlw+pRjUBb0qBFViGW8FvJjt5EuH5WeLlmZbEoLqEGwcIMFuqfTwnGYx/n91bmi+dWit1UksYawnwBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y73xW3ksCwAfHAvdI/zz8xYEyEbaCJkZpPGT4EfT4BI=;
 b=R/jdb6W/UcthuPIhjzaxUa5U7gF+nTuFjztpUwYfKJyvvqAoQeYv6K6eYpEXgOLt0YcrqvWWrJF6czRQWQ1DJFtPadz3iov04/tVGMj4fmR6DQ+k6Dx0h8YnQPCkW4Z9vyaSLrkb9C96KS0lbYsNy+d5KUyfPlhvYPP8gY/R3PUnoXY8pE7usLHQmOR/3dqL6QatYSRWOLSyUUNLuuseaTdFOJ9nrMNk6DkTpchRkkgdBJ1+r1fgUZD4f++jZABM3PMdNlcZArGqNoMLstcVH0oK2bPeXonujHF63jGFU5CHFhWT+eSoAbEWZY6l738Zl9zgs44HY2m8GhGJ1We22g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BL1PR12MB5094.namprd12.prod.outlook.com (2603:10b6:208:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 12:19:37 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%9]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 12:19:37 +0000
Message-ID: <b607f4e0-0ed2-566f-8793-db93288d34f3@nvidia.com>
Date: Thu, 24 Nov 2022 14:19:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 01/17] migration: Remove res_compatible parameter
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-2-avihaih@nvidia.com>
 <fbf06ccb-c339-d323-c01e-455109bed372@yandex-team.ru>
 <a469eb6a-8630-0e2e-e000-4a24bbb9b26d@nvidia.com> <Y35lN2Pk1FAef4cR@work-vm>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <Y35lN2Pk1FAef4cR@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0171.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::14) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|BL1PR12MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 50afeca0-ff1c-4009-2248-08dace16268d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JHS3Qh9h5MOjlD472BPNCNwARR28Tdd9AKmHbag+uGX1CRemJntJt7VeW+F73pSnhSyejWVqG+X7VnU63R5MSmx+4c8nK1lW3QJ0Z3BqOxIXBomtZW/NyvlY7HOedXLRXXRQ+0zk/n9aBQ1TDrqzQCvVnZP8GZGDZCjF8cE0Farh1Tjx+gk7ld+XjBRvN3gDiRxyDSUeeSF9ThbIIrlxQ0MTBdM9G7txNP+CRs3c2Yc/mSyA0r7fkqyGCJ+07aF/LMn50XK1IjrQ86rtpOLhehtJOxTdFoiwpUZinNdJo9SNhMOoJkBHzPXoFcT7SA95aXeu5IOllH5sDQnuh8AIi+puTTMRZkfHcFObEsOSKDelWgBYuuKZ7BlUL7TCr7tZukfPj5rQEBEG3/aMTp8Tqy7G+gNKjTLWlfeEEBROFpZdTiyvjXbHOmEOrmqoVBljmU9JyYraCu44aYpnfs2on2CNcRGX0B1/pqCJVgu75lS+p21sNp3mZRPjbHIiGEh8bVemKCmCKLamhx34Z8UNlAgtUEektxXSzcLxay80OtzisS64MIXrEzKL4iK4gWlAz/7404QA59ojwdxnza3M+e3q6iwL9Z9+28yOc7yS1iagcF6H7UE1sx+/EexNrbgDxObrYtQ9/vqn5W832rjg/Lx4ESkvSwXSAm/TPjyDNS3nGc1X3LBsH+98N3fMNlAbF6JrYM3drnQWQcFrk4ZFSvt9i3Mq0mwBZIKwPzKbso4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(8676002)(4326008)(66946007)(2616005)(41300700001)(66556008)(66476007)(7416002)(5660300002)(186003)(8936002)(53546011)(6506007)(6512007)(316002)(26005)(36756003)(6916009)(54906003)(2906002)(86362001)(83380400001)(31696002)(38100700002)(6666004)(478600001)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmlrVEJ2TGh5dHBadC9rZGNYTGtVUmNTaklyYlRxMDRNNmNqU09VanE3Z25s?=
 =?utf-8?B?R1YrOUFtUmsyclNxbGtKdkVUaVloUklMV3NXczlJeTRsZS9PaWpBOEpFanZH?=
 =?utf-8?B?OE1lYVYxVkFENUJWNUs5Z3NFU1N0UnIza1E1WDNKNDJrM0ErYVZZODVWOGxR?=
 =?utf-8?B?QVFMa3BheUM1WDFwaDQvNEV1d3pjVnRncDBoS3VOWVgwZktwWFFhM1o1aWla?=
 =?utf-8?B?SEdacnVoeTJLa21uWHdyOEdhNFRab245ZU5Vd3orVllsMlBNWStEY1VnejMy?=
 =?utf-8?B?a2UxdWpRcVBad3A3WlJwZ2hiREVORmQvUkYyL21rNE1ycDlEWFI1MDNkVFBT?=
 =?utf-8?B?K1hkdWdDbThIQUtRQ3NENzZ6NlRFblMwZEZGdGJ1Q21ldmEzZFlnU05HcHpJ?=
 =?utf-8?B?MUsrbEQrTU55WmVjZHgvZ1ZjSzRFUjlCNVY0dlNMblI1Rm9WQWc0U2xJY2l5?=
 =?utf-8?B?MzRta0dMQUlmUU81RlVSdGVRQ2d2b2xEa3lUNnZqNTFzN0tGOXAxc29TbUs3?=
 =?utf-8?B?RnZDdldsc1hkeXZmempvRitDZ1BGWkFndnN2dm9mQ2dsWGJ6cDVHMWRYazdM?=
 =?utf-8?B?REs5ekxKaS9rdG9sVjBkT1h3S1RQTytYSDlZcXhmdFE1YmJSdGdBM3lrQklj?=
 =?utf-8?B?S1YyY2pUWTVOWHJadWIyQXpBb2xpWWVOU2tiUWFTTlhZMHlZUmJFTUxHeVRu?=
 =?utf-8?B?c0thVzlqNklUZGJ2RUJWU3pjLzhsaGVTZ1laeW1CQVM5bnh6N1ZjMXorTDBY?=
 =?utf-8?B?d2dGMWJpV25ucWZvN3ZRRWRTU25IQVpMNmd4bm9VQUdPSE1sRWV4dDhWM3o3?=
 =?utf-8?B?UENydjdnSVN3Si9jR3VCaVNNZ0RTcndLNENZLy9DaXg5TVlGUEZPSmVSeURu?=
 =?utf-8?B?VnAvYVZYZTZIUnptbzljaktJcng3VHRnRGJ3YmNsZFoyTFRLUFhJWmVjSUtZ?=
 =?utf-8?B?U1Vpdnl0MmtlZGRTNzZQTkRkVTZnZk1McWRqTVlLVlNKRitlVnhlaXplQU0x?=
 =?utf-8?B?QlM3NFh6V0txMldkK0JaejJ3OExsZkR2dmFySy91a1QxWHZqS1JET0JubGVF?=
 =?utf-8?B?MkpsQmpkajU4R1FScCtkbGp0aDlQQXVEYzFHYm5ua3YxZ2RwTDk4OTRYelU1?=
 =?utf-8?B?OXFCZVNWblh1WkFsSUxLVmdZSTVQUDFjZjZCNnlsc1NXd1JUTnE3WWlYVi85?=
 =?utf-8?B?SUVaS2JFTEVFNTBJalh3YnArZCt6UjV0U09Lak1SZVFNUTBBS01SdzVBeEpC?=
 =?utf-8?B?K0p3enp6c2U0TUhhdUNjS1kyQ3luNFN5MEI4ZmhwOE94YkV3N2M5ZzVyMWYy?=
 =?utf-8?B?b2g2RklCdkQvNHlLbXZyOVpnelZQTUg4UG1aaWhEWnJ2S1dyUkJ2ZUg5Snhq?=
 =?utf-8?B?VDExV2lPWU85cHAvRnpBVERteUNtYW5ZTU5NbVhxUWJpdFhtZmltYXEyLy9t?=
 =?utf-8?B?djRMUThWc1puOU1xM1BNUDd6aUorSjFXNEtDTG1uV3UzR1RTNmh6WVdQU3o2?=
 =?utf-8?B?V2l3cDZLRmNwTkVQbUtkeklEcWUxY3lBZHRTcVJDMWh1TFZlOUxBaFR3L1ZM?=
 =?utf-8?B?N3NsZUt1Y1hCUjBFY0NhNjBWQVZKVXZpRjVWeHJITjBqaWQ0bkFIRWd4bXFh?=
 =?utf-8?B?L2l6TmZPaUxadW95aG90MVdjZFNSa3U3UVpXcE5QTU8yY2I2SE1oY2JMNjE3?=
 =?utf-8?B?MzViaHdWRmpsdnJYSVVERVJvdGZ4K1NDaHZRa0N1WkkzbmFXN1JhMEpDT0dT?=
 =?utf-8?B?cXpjeGZ3ZnZ5a0p3Y2x4ZjRheC9BVUQ2MkpobUQ1UHBINkR6RHpwcVBOYTQv?=
 =?utf-8?B?Vm92QTU2T21zV1IxLzB0WFgzYTBMa0tjTWd2cXpYRVg3bHJlWnRxRHMvZWRl?=
 =?utf-8?B?RDJxeGhkWjBMWkdKT2lHMkRTdnBoblF2SFQ0UFBpYjh5U2pWT1FWUmxHRUxl?=
 =?utf-8?B?N0RvN1Y1Z1dqNnU5c05TRTR1WHJpNWdJRkhwY21iOFBrOFZxMVA0eTlENDZB?=
 =?utf-8?B?UEp4blJFT0NoSWRIZG54MzNMaFY2WVd3RXlGNTBncHF4a0c3b1U5Vk5CN1pH?=
 =?utf-8?B?OVBVNXJZTDNIUERRMVNYTE40aU1yMkRYOWJKSDVIdnl0ekNrZ3ZKU0Y0MGdO?=
 =?utf-8?Q?DUBwIEU8ND4ple8z2ImCddWEd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50afeca0-ff1c-4009-2248-08dace16268d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 12:19:37.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5ktdYdwqKenj58Eqs9/R2qhvnvI4XMhaci1YNkDyAb2R2MMfoXUN2bNtAOVELoTe35mAn5APKHKb9Dvx9oghw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5094
Received-SPF: softfail client-ip=2a01:111:f400:fe59::618;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 23/11/2022 20:23, Dr. David Alan Gilbert wrote:
> External email: Use caution opening links or attachments
>
>
> * Avihai Horon (avihaih@nvidia.com) wrote:
>> On 08/11/2022 19:52, Vladimir Sementsov-Ogievskiy wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 11/3/22 19:16, Avihai Horon wrote:
>>>> From: Juan Quintela <quintela@redhat.com>
>>>>
>>>> It was only used for RAM, and in that case, it means that this amount
>>>> of data was sent for memory.
>>> Not clear for me, what means "this amount of data was sent for
>>> memory"... That amount of data was not yet sent, actually.
>>>
>> Yes, this should be changed to something like:
>>
>> "It was only used for RAM, and in that case, it means that this amount
>> of data still needs to be sent for memory, and can be sent in any phase
>> of migration. The same functionality can be achieved without res_compatible,
>> so just delete the field in all callers and change the definition of
>> res_postcopy accordingly.".
> Sorry, I recently sent a similar comment in reply to Juan's original
> post.
> If I understand correctly though, the dirty bitmap code relies on
> 'postcopy' here to be data only sent during postcopy.

Looks like this patch requires some further discussion.
Since it's not mandatory for this series and I don't want it to block 
this series, I can drop it and some variant of it can be added later on.

Thanks all for the effort!

> Dave
>
>>>> Just delete the field in all callers.
>>>>
>>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>>> ---
>>>>    hw/s390x/s390-stattrib.c       |  6 ++----
>>>>    hw/vfio/migration.c            | 10 ++++------
>>>>    hw/vfio/trace-events           |  2 +-
>>>>    include/migration/register.h   | 20 ++++++++++----------
>>>>    migration/block-dirty-bitmap.c |  7 +++----
>>>>    migration/block.c              |  7 +++----
>>>>    migration/migration.c          |  9 ++++-----
>>>>    migration/ram.c                |  8 +++-----
>>>>    migration/savevm.c             | 14 +++++---------
>>>>    migration/savevm.h             |  4 +---
>>>>    migration/trace-events         |  2 +-
>>>>    11 files changed, 37 insertions(+), 52 deletions(-)
>>>>
>>> [..]
>>>
>>>> diff --git a/include/migration/register.h b/include/migration/register.h
>>>> index c1dcff0f90..1950fee6a8 100644
>>>> --- a/include/migration/register.h
>>>> +++ b/include/migration/register.h
>>>> @@ -48,18 +48,18 @@ typedef struct SaveVMHandlers {
>>>>        int (*save_setup)(QEMUFile *f, void *opaque);
>>>>        void (*save_live_pending)(QEMUFile *f, void *opaque,
>>>>                                  uint64_t threshold_size,
>>>> -                              uint64_t *res_precopy_only,
>>>> -                              uint64_t *res_compatible,
>>>> -                              uint64_t *res_postcopy_only);
>>>> +                              uint64_t *rest_precopy,
>>>> +                              uint64_t *rest_postcopy);
>>>>        /* Note for save_live_pending:
>>>> -     * - res_precopy_only is for data which must be migrated in
>>>> precopy phase
>>>> -     *     or in stopped state, in other words - before target vm start
>>>> -     * - res_compatible is for data which may be migrated in any phase
>>>> -     * - res_postcopy_only is for data which must be migrated in
>>>> postcopy phase
>>>> -     *     or in stopped state, in other words - after source vm stop
>>>> +     * - res_precopy is for data which must be migrated in precopy
>>>> +     *     phase or in stopped state, in other words - before target
>>>> +     *     vm start
>>>> +     * - res_postcopy is for data which must be migrated in postcopy
>>>> +     *     phase or in stopped state, in other words - after source vm
>>>> +     *     stop
>>>>         *
>>>> -     * Sum of res_postcopy_only, res_compatible and
>>>> res_postcopy_only is the
>>>> -     * whole amount of pending data.
>>>> +     * Sum of res_precopy and res_postcopy is the whole amount of
>>>> +     * pending data.
>>>>         */
>>>>
>>>>
>>> [..]
>>>
>>>> diff --git a/migration/ram.c b/migration/ram.c
>>>> index dc1de9ddbc..20167e1102 100644
>>>> --- a/migration/ram.c
>>>> +++ b/migration/ram.c
>>>> @@ -3435,9 +3435,7 @@ static int ram_save_complete(QEMUFile *f, void
>>>> *opaque)
>>>>    }
>>>>
>>>>    static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t
>>>> max_size,
>>>> -                             uint64_t *res_precopy_only,
>>>> -                             uint64_t *res_compatible,
>>>> -                             uint64_t *res_postcopy_only)
>>>> +                             uint64_t *res_precopy, uint64_t
>>>> *res_postcopy)
>>>>    {
>>>>        RAMState **temp = opaque;
>>>>        RAMState *rs = *temp;
>>>> @@ -3457,9 +3455,9 @@ static void ram_save_pending(QEMUFile *f, void
>>>> *opaque, uint64_t max_size,
>>>>
>>>>        if (migrate_postcopy_ram()) {
>>>>            /* We can do postcopy, and all the data is postcopiable */
>>>> -        *res_compatible += remaining_size;
>>>> +        *res_postcopy += remaining_size;
>>> That's seems to be not quite correct.
>>>
>>> res_postcopy is defined as "data which must be migrated in postcopy",
>>> but that's not true here, as RAM can be migrated both in precopy and
>>> postcopy.
>>>
>>> Still we really can include "compat" into "postcopy" just because in the
>>> logic of migration_iteration_run() we don't actually distinguish
>>> "compat" and "post". The logic only depends on "total" and "pre".
>>>
>>> So, if we want to combine "compat" into "post", we should redefine
>>> "post" in the comment in include/migration/register.h, something like
>>> this:
>>>
>>> - res_precopy is for data which MUST be migrated in precopy
>>>    phase or in stopped state, in other words - before target
>>>    vm start
>>>
>>> - res_postcopy is for all data except for declared in res_precopy.
>>>    res_postcopy data CAN be migrated in postcopy, i.e. after target
>>>    vm start.
>>>
>>>
>> You are right, the definition of res_postcopy should be changed.
>>
>> Yet, I am not sure if this patch really makes things more clear/simple.
>> Juan, what do you think?
>>
>> Thanks!
>>>>        } else {
>>>> -        *res_precopy_only += remaining_size;
>>>> +        *res_precopy += remaining_size;
>>>>        }
>>>>    }
>>>>
>>>
>>> --
>>> Best regards,
>>> Vladimir
>>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

