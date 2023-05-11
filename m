Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F96FF58E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:10:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7uH-0003gr-C7; Thu, 11 May 2023 11:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1px7uE-0003gL-7X
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:08:34 -0400
Received: from mail-bn8nam12on20607.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::607]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1px7uB-0001md-PX
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:08:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik/gEwRuB5cTYSVQn8c/3tanDX4iXpfN5Q4uJDwCeDlXQ9fGPBzhTbz9TWynWYlMcPMPEk0HlJuQIisdSW7Or+Iyrncwi55oatVtOfsh7QOR+kvo/8aFKapes/XEBHO4EikhtHgSLDIk8Qetxs6QDYan2EsS/doZD6KOyje7A1qlnwk4g8ZJ9JDOSY2fLFbDNl1O+IP3TZ9v8Q/0t2p4fFiaisUUurwpCh2I5ajG9sTKqTgvT5DNN3aKQmOo8jfN+YmTILULRqhLZqv9tmavDdgYNEse9C1GMxTzWFAtVVCqdR4xtLUj0GCCWk5s7VqijsTRsLwsC2LbVa/eHWZFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RqJijCyrhcH4c27QuPXOeiRbZXubFMtDAOsXK9So+Q=;
 b=IW5lSH4fv4s3T2nmhXG3ZQsu/bocaKVW9kRiekxkz3MrnHnTr6d4/3LSU5RSbLjnyeBgb806KL39QOE88/zh9/4IfyKFs3mUzle6CPdDSpBphCNueO0gaqpq/HAAXKZ3sq+rUO7sNOeZFX+sYfFC30jF1JckBRe//V6+0UxY/p07Wui4eILbVLooJtMV5mYaoPPYkZxCLEiiwE8aP3P453aNaCbqjC6VFzXflbWGF9n8KcxdoV6JZr+HU6zfFLyprpfXHYVJKxwF41poRYV7gyZ5Dat9AFruijryomYNyYoYmYzefwrFLsi/d06Y5ITR63/ASjaGFZFzbAN3skb27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RqJijCyrhcH4c27QuPXOeiRbZXubFMtDAOsXK9So+Q=;
 b=srJVrbAjm6Ok1P+uEQBRd1+CMaIDk2++KinhoMRWnJljdLIMiAH7v7Pdpwz3CM8PwzTMWiFhH7HwjH320ewy/f+AYK9OXZ5y2iS5b1Af8pqXGtypfdeq6zQ5cWqI1pV+AcTVh7bNPU+sKvjuMIXylm/x9nlZzT72++O90QLo4k8+CtMh5OsBHIfGEB5bXW54W9ZwfTz56fktC0xydIfs/eDS+HyjcUSlvr4bvIvnEuuimGCvZbSRfiz1w2bh2PymT8rqXw4SOh6xeSbZQ+8n4tq95c+sfhxGklD7QZLWUaKLE6/MWCGmQRASrvqr6APwHDxBAqjjoluSJBbbXPc6Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MW4PR12MB6779.namprd12.prod.outlook.com (2603:10b6:303:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 15:08:21 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6387.020; Thu, 11 May 2023
 15:08:21 +0000
Message-ID: <ab85ab98-15af-612e-0b3c-f203b7feaa36@nvidia.com>
Date: Thu, 11 May 2023 18:08:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/8] migration: Add precopy initial data capability and
 VFIO precopy support
Content-Language: en-US
To: quintela@redhat.com
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>,
 Daniel Berrange <berrange@redhat.com>
References: <20230501140141.11743-1-avihaih@nvidia.com> <ZFGTerErJWnWHD6/@x1n>
 <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
 <87v8h08s9o.fsf@secure.mitica>
 <3bb652f6-4948-d6c2-fac5-e0a6c3edb62a@nvidia.com>
 <87jzxg6svr.fsf@secure.mitica>
 <acc6ec07-cd9d-bb0f-bdb9-56a2ced50e25@nvidia.com>
 <87jzxf3th4.fsf@secure.mitica>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87jzxf3th4.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::20) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MW4PR12MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de904ee-8b91-45fb-6acf-08db52318f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lrjd7PtqRo/zrEuBHiLrAa8Kg7Ytd8+ynSOwU0jxKJ3dm7k79hi25bbGBGt0EXnAFe0ymb1TmDkQPfSQ0rQOul3H4GZ8F13/ZNitQUF7xx/O04hgRGBVBTkGrRbPrnowJO7+q+jqMCDCOxjE2+CxqsxZhQ7pABasFVst6PPqTsYkdA0bUznx7QpU2Eys2bsZaprpjHpfWPxsBKR4VnjhUersZ16Rj+DjhUuyqzFWJ+8XrGg/g/qIsI9h7XBT2hLhjF8DcntVMa4PNyHuN4CEIWKYaMdI98S7I+WH05MqqRgwc7/CSfbwkCr6P1MI70lCl2nPEbUdSLSquM04liw+fXWO+z4kdnpUYtP8OTJLiHEEOJ0Cd4C6y9HFRyRE0UuWBxY01Ewlr55glrl2FhzYNdSris6TLeD2o3xUwHtnEe8LDnlp9WfOPNkStuZJM5aexVfPzCfUcTFSNs24bFrJQJDDmeTLIamkZrFL6ilRb5BbRb3aV1Zmxk04FlgSGSdzDnLukuF6ASq16p4opVLQJeToVs+L4cOFlfvXFqhUSf5q/hv6a1iJF/4v0XSzDmZYdt4mKL+lKHmpvhq8DeKSMDjbD/CZsDxOM/qbKcEZsqABrleImCpjoLsVaevUFI6fjUzATWKAV6zAYWz06EZC6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(186003)(6486002)(478600001)(6666004)(53546011)(26005)(6506007)(31696002)(2906002)(54906003)(86362001)(7416002)(6512007)(38100700002)(4326008)(31686004)(83380400001)(5660300002)(41300700001)(6916009)(8676002)(2616005)(8936002)(316002)(36756003)(66946007)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWExMVdld2pDb1hweGg1Y2swWHFQVzBPNEY2cSsyYytmdkZydFBiRnovUzRJ?=
 =?utf-8?B?eUxtcHcxT1J4RHZKSkxLZWk0aWdtY1VCUTlPSW9LNExtczBPN0kzNDN3bWZ1?=
 =?utf-8?B?SWxNOERDM0hmK2lPZXZUMHNwN2dlQkV5T0RsNG1lZ1ViRU4ybEFGOFZteUxr?=
 =?utf-8?B?RG9CclQrSkxIb1NoNWdzbjNYUjN0Zzc0RHkzU1U3a2xvQ3hJdGNNQmFhamVC?=
 =?utf-8?B?SkdTYWpac1AwSHcwSzFyRGdXNk1ZRkhPZWsxRXBUcDhuTm41UjB5Q3pIRS9Q?=
 =?utf-8?B?dzZIR29YMEx3ZUx5RUJVMzFqaExUQzIrYXNPQkNXaitQVk1SWDVGUkhuZDVl?=
 =?utf-8?B?OEdWeEg0enJtOGEzOFRabDZLTlEwM2F3QVVZTDJkWDVKT29CNHBTYXRUMnZs?=
 =?utf-8?B?MGVxYXhXOU9UNDBmZjNxejUzcCtydU1rZ2JZOE5BaDYwNTdscDhJR2FwWiti?=
 =?utf-8?B?bTdrTERZT3psaXoxZkxzOXc4N0wwUkpwTHZETThibCtBSEoxOWxKTVkvTHF6?=
 =?utf-8?B?N0lqSnR5bURvQ3ZvSjNQMWJUZGl2SnJEdm9EUG8rSTJqamh2UnA0Z0VtSUhF?=
 =?utf-8?B?NFRrclViZHYreTR2QjBGRXpJWGJVVEdsT2R5VDdRMjgxdVJEMmprbU9RWWt1?=
 =?utf-8?B?QnAvODF3eFg2eHkwQm9Yc1QzNXNiWEk2ZnVhcDJKM3ZVMlBGNjBlaEFwQ0JE?=
 =?utf-8?B?VHU3Nlk3aFRtbXNkRERpSkkydXJudVltblg2ZnlJbGU0a0w1WlRvcVdqTEZ6?=
 =?utf-8?B?S1dzMzdnVG5lajhReENBTmdZS2UwWndUSkhIRUxqWDl4UGRNUkxaVDB1RzFL?=
 =?utf-8?B?RGxTUFlCQnZPenRxVzJlNzE2Y2Q4OVVyNHFleEVwaGhtcy9MYXBqTllLcmhM?=
 =?utf-8?B?QS9KeTNlWmM3NFJiNDVWS1E5NGVxRFR6czB2RGlSSHEySUFlMENCMmgxUnRz?=
 =?utf-8?B?YkJJMVlUNWZZajNzZzFUVmhpWWNXN0ZIbld4K25hZ2xsbml0TmppVUUxYW5D?=
 =?utf-8?B?TEpXdTVZN05Gc2J1dHpvb0lGRXpGZUsydlYwUThIZnczSy9aYXhBVGdRSitU?=
 =?utf-8?B?UkQyWDhxNUwza0RWdG5sLytFQW03RGJLYVNLSHRMRnBQT28zQTVlbVAyazVK?=
 =?utf-8?B?QjJ4L0NvSldONjhkNkhvNnhjQW1HZUt2dlpoZHVFUnN4VGwxc2h2STB5bXFJ?=
 =?utf-8?B?bk83WUJ5NjQzNlFkbjV6WU1ORzRMaXJSREpaM2sydzRPb3M0ZE5GaEJ1TEcw?=
 =?utf-8?B?QlR5MHNMWFVvZ0w2OU9jVGpIdnl5WnhyZDJoUUpGYkQrTSs0aktoVXJMRU1h?=
 =?utf-8?B?bVBsY0VLV2ZRNUo2QjFhbmVpam1iSDR0Ykdzb1VvbFo2NzMzL21ObkNVQWZD?=
 =?utf-8?B?RysvWWRmTEltU1pEaUYzeHhwZUJZVXZTVWVXRUx0dUR6ZDhKbmQ5ZHpDSWdZ?=
 =?utf-8?B?YlQyQk1XZ2VsSldSRkxNd2Zmejc1RHZtcVVQR0hwdE9PV0FKZG8ydzhMdGVE?=
 =?utf-8?B?ZXlFT1N5cDVKdFNDZ3dUK3VjR2J6YmNiVFM3WXZXL2VwSmMwb2RGb3praUdR?=
 =?utf-8?B?VmRYT21NVUJidmVTVzFuVXhIOGh6anFoZFBiWmRRUDdYMzFENlRISWxndDBK?=
 =?utf-8?B?MTY2WVdQNGdqdHd5OGFOWG9lcnpFa1g3VDNDeG5sQnZTZDBPME5ad25abkFz?=
 =?utf-8?B?MTdVWGVqWVNUU1prWDlCeFB5cXJQdXo2dG1ScVd5RzhnWi9URlVWT3dQUy9z?=
 =?utf-8?B?Z2pwcXdoTG5iR3doeGwzMUNZZElWUGhCUHBZK0JyUGhTMkt1Zk9Kd20xQ0hT?=
 =?utf-8?B?MG4wUENpZzhsL1RxazhoZWlUbGRRNmdPUXRkSFN1ZmhTTXBvNEo5QlZNSElW?=
 =?utf-8?B?ZW41UEJPcTBlYmNUWEFjZzUwOGp6VWNRQThKU0R6ZkhMb0JOTFJSWUFsUXRV?=
 =?utf-8?B?SWFyNUNGdzg0RklYaHJFUXZockEyd3Q2RVdJcWxWR0ExVnRZQVhhN1kxb1hS?=
 =?utf-8?B?SXhMTTR4SXhBMDNYKzRkbzllVlNHWTVLYk4yZWFKNXhKUFk4UTRsc0N5SWFG?=
 =?utf-8?B?THlHaUNpU0NWLzd0TlZqUm8zT3Z2SkVkMTdMV016d2hjbGt4Z1RKOElxWjh3?=
 =?utf-8?Q?k01GeD1usBUMurr42hjjtmCHS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de904ee-8b91-45fb-6acf-08db52318f08
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 15:08:21.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3rcJpp0l44qcDRSzvsraeROoacqmAgDd7lV/Bx8YAYqammI1Ag3Z8pfTAsxFGxrnPBVq2TlWcI5vj45Hij0rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6779
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::607;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 11/05/2023 16:09, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
>> On 10/05/2023 19:41, Juan Quintela wrote:
>>> Does this makes sense?
>> Yes, thanks a lot for the full and detailed explanation!
> Thank you.
>
>> This indeed solves the problem in the scenario I mentioned above.
>>
>> However, this relies on the fact that a device support for this
>> feature depends only on the QEMU version.
>> This is not the case for VFIO devices.
> What a surprise :-)
>
> Yes, I couldn't resist.
>
>> To support explicit-switchover, a VFIO device also needs host kernel
>> support for VFIO precopy, i.e., it needs to have the
>> VFIO_MIGRATION_PRE_COPY flag set.
>> So, theoretically we could have the following:
>> - Source and destination QEMU are the same version.
>> - We migrate two different VFIO devices (i.e., they don't share the
>>    same kernel driver), device X and device Y.
>> - Host kernel in source supports VIFO precopy for device X but not for
>>    device Y.
>> - Host kernel in destination supports VFIO precopy for both device X
>>    and device Y.
>> Without explicit-switchover, migration should work.
>> But if we enable explicit-switchover and do migration, we would end up
>> in the same situation where switchover_pending=2 in destination and it
>> never reaches zero so migration is stuck.
> I think this is too much for qemu.  You need to work at the
> libvirt/management level.
>
>> This could be solved by moving the switchover_pending counter to the
>> source and sending multiple MIG_RP explicit-switchover ACK messages.
>> However, I also raised a concern about this in my last mail to Peter
>> [1], where this is not guaranteed to work, depending on the device
>> implementation for explicit-switchover feature.
> I will not try to be extra clever here.  We have removed qemu support of
> the question, as it is the same qemu in both sides.
>
> So what we have is this configuration:
>
> Host A
> ------
> device X explicit_switchoever=on
> device Y explicit_switchoever=off
>
> Host B
> ------
> device X explicit_switchoever=on
> device Y explicit_switchoever=on
>
> The configuration is different.  That is something that qemu protocol
> don't know how to handle, and it is up to stack.
>
> You need to configure explicitely in qemu command line on host B:
> device=Y,explicit_switchover=off
>
> Or whatever is that configured off.

I understand.

>
> It is exactly the same problem than:
>
> Host A
> ------
>
> Intel CPU genX
>
> Host B
> ------
>
> intel CPU genX-1
>
> i.e. there are features that Host A has but host B don't have.  The only
> way to make this work is that you need to configure qemu when launched
> in Host A with a cpu type that host B is able to run (i.e. one that
> don't have any features that Host B is missing).
>
> What is the difference between this and yours?

Hmm, yes, I see your point.

>
>
>> Not sure though if I'm digging too deep in some improbable future
>> corner cases.
> Oh, you are just starting.  The compat layers that CPU have had to do
> over the years.  At some point even migration between AMD and Intel
> CPU's worked.
>
>> Let's go back to the basic question, which is whether we need to send
>> an "advise" message for each device that supports explicit-switchover.
>> I think it gives us more flexibility and although not needed at the
>> moment, might be useful in the future.
> I think that is not a good idea, see my previous comment.  We have two
> cases:
> - both devices have the same features in both places
> - they have different features in any of the places
>
> First case, we don't care.  It always work.
> Second case, we need to configure it correctly, and that means disable
> features that are not on the other side.

Yep, I understand.

>
>> If you want I can send a v2 that addresses the comments and simplifies
>> the code in other areas and we'll continue discussing the necessity of
>> the "advise" message then.
> Yeap.  I think is the best course of action.

OK, so let me digest all the new info of this discussion and get back 
with v2 / conclusions / questions.

Thanks for all the help!


