Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23E6F5B21
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:28:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEP2-0002GF-2F; Wed, 03 May 2023 11:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1puEOx-0002Fi-Eq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:28:20 -0400
Received: from mail-dm3nam02on2084.outbound.protection.outlook.com
 ([40.107.95.84] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1puEOs-000221-Ne
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:28:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6yw6Pg4JUPCEJoVJTt+7kSTYnT8Pe6p1nZnWZqiXRDrcuk8sttiZVe9jxJlqT2EpLniVyDC7ILuBPcjK9xVbXtL8WWjdhv84fW28o3wE+fLwwels+6+d3IsXHzhJedjixFR56YUR3OfQbchge4QwDiWLaDN0CDS+5N5A1hhozCqxhhyz//MjpygKvboCRuQle+a9LDTAptHkiYUWvDHhMq7jtd91vV88aTXMVuXgYjWLsUdB3JTWtivzDkMLv5pg7xLbBNaZCOnwYUJv1szY8ujCB0oLj5PMnoo9NBb8pr49QTZNeDS1U2R5M5DqlgsfjXivhFiasfmT07riq/1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+oFsGop671kewxLrY6c4MoPjlgh6sTzwHpaN6/UqWk=;
 b=QEgDlcWoG+Kzju/sxlq209/x4ocHTIJM1YodgBsGON4Vo82KrqSN7WEDYIiByjZF9jM4MvehGwp/w3lQRDMbBrm8KpLwNXTeQbmmk9zCgFbHKjQbZFgIqJpTYC8zL0BqS+70Xgqs1Pp6Z/lUH68zHt05PBGVgqMxSfd1knPY8kNNJZjDMCpoGajNkMV+0F8n7VFt2LbzkRUmYPw044eXwENtAH/sVmnS1HMRqS53dpVOHMJnZJE3uDoel9kLmObmCEzrpiMQDGjaKCKjoIRaL7JtN5OkooDejTo0/JLn7lXI7KPcum1lbo2ebBR2j1+tzY9vsf3dxMPx9+B/LRhsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+oFsGop671kewxLrY6c4MoPjlgh6sTzwHpaN6/UqWk=;
 b=gMlytvhYvHmdDkaYyD32RsDDslEDMmx77HCIEwvJHHsSPzUbRIx6Bn3W9rpALXSnMzFFpZ2frQ65g2QocKHcegBRpkFGWlQ5hutilFrNkIty0vWXxcpuh8HQ3MHu0Dky16T3Caz4IFJNjIvp4TGGyTTgbFV8bKqmzvwTaybMGxJwww69mfgd/rw49/3x21rmkH5E2iYwF11h1zkwzuMRdT2tOIGG3Ks5fU6eRRPj3M2SOW9xQnhVYQe4cUj7Ret+z2as3Z3ctap0V5DUZdns4ypVqqvsZIVcmGnv4fPERZySIJd//FLQFYie3Gv6Gph5AssviAOSnAWSRlme5ppFRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 15:23:08 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 15:23:08 +0000
Message-ID: <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
Date: Wed, 3 May 2023 18:22:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/8] migration: Add precopy initial data capability and
 VFIO precopy support
Content-Language: en-US
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
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <ZFGTerErJWnWHD6/@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0254.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::15) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DS0PR12MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5fae8d-218a-4886-a1c4-08db4bea4c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1Ue1FXuT0SahfJ3cLgR8BWAWXKzlgxhudNIxz37oTz44Twa9dL/0pwqmwitAWp7k1Z0dca8KIFB+6u1Xf7/2wCO43cgG2F2qSr9wxQt6ft9tFPdlWGV5s8m8tZhIWpUpjRJFAJwrYrlDJcnUcolbLc6wTxPNGjAEJahAWMl9eSQoloyTLEkKnTiXCXIKayZ7u5enVT9nCuIjfyU0wfSJuSjC+/vqgvAkMmyb+FTZr0oM9KMfVD9NsJFBE+i7a+nE5MV3bi/4gKIKbxM2oVpiTOWG9NxYYXT2g7mB9m79d/QWw6csYzseGrpdSRnrE8xEtorcQ2C2gk4eod67GA/42yRu8bDTGXc1dvxv09XoIBC0uctdwJXphVqWf/fB25oiIZ2ac+/iJBfVYvj4hz3AEXiIgVQfHDk7ifNjoe0UEhHxAXCKNAaWEmY2SaWOE9yxkBpcFf7YbO+36ccdLJ/g8OaJUoS9JaaZGy4isOQwmT1tRhAd3aQ6KRgPN3p5ujU1pUybGz3tKFLhOVfBfGyqbcpHR4sSEekgzmBuTdiTaCT/vgILClaiCpefb4svGUQ3h2Bmud882ebkc5Kr0xvv8UzkZoQuWjVBJIf/4s+zhc+r8IUMp0ix/uJEjsuASo64A2uUyZ+bUtK+w/aHHaBHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(31686004)(6486002)(66476007)(6916009)(4326008)(66946007)(66556008)(6666004)(478600001)(316002)(54906003)(36756003)(86362001)(31696002)(83380400001)(53546011)(6506007)(26005)(6512007)(8676002)(8936002)(5660300002)(7416002)(41300700001)(2906002)(38100700002)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anAvOXdPL2E1QXdXeVpPNlRSZUd1SFMzUXRjbEtsb2tuWDBicFZwVGs3Y3Jl?=
 =?utf-8?B?TXZnazkyZE4zdWhxME9IT0hnTm9NQWVxeE1kOCs0c0srdjhGS3Z5cDUzdWVu?=
 =?utf-8?B?K1dKM1M2WDBNUVNGcVMwcjdNQVdNMVVuTmRHa3puZkx5M1I3K1htRjNhaEFJ?=
 =?utf-8?B?Ujd1T1ZnSS9EVy9jZC8yVjd4dTcxVkxyMUV5SHNrZUwzVk0xQmtkZ001NHNG?=
 =?utf-8?B?R2gvMmhtbjZtYTVvZC9kWko1V21RL0g1Qy9SanlBWmhadWNhdVdUNHlvM2hy?=
 =?utf-8?B?Skh2c2dLc05vaFNyRUNYWFlMb2VjRlZVYnFNaWFYOUNGWjdDSEgxQjZ1c2hn?=
 =?utf-8?B?RkgwcHRxNVA4MGh6K3UvbncyVkFKK1dZZFB3S3p1MjYrb3pnNDVqVlFmL3gx?=
 =?utf-8?B?MEFyYk43V1lEaVY2Z1JZaWVhT3NGTFhuNFltS3ZsSkk4NFg2SjBMNW5OY0JL?=
 =?utf-8?B?SFhsWnN1ZzY5RElicTVXcnptVjZVNy9ZODdVeWd1TDVCcDNTRDNHV1BKaStC?=
 =?utf-8?B?c0UwQUNxQklHVlRXSjJNV05TSnE0MmN2NTJEQ3VRaW5xNGZXM1lvcjd4SlB1?=
 =?utf-8?B?R0NCRkhPTEZEclpiQ0QzUTdOczk4MmlkQUJUb2txSUw2V0EvT3R6aFFOSTZn?=
 =?utf-8?B?VmtsQUt1STdaU3orRytBWjhMemx0eEdyOUFMNFAvYy9NN2RGOHdDcjFGNndv?=
 =?utf-8?B?a1VNdjEwSEJyN1ZqTEZKNjZiYmorUWsybmdIcTVhMEdodXdybGFHN3FJRnVM?=
 =?utf-8?B?TVA4YkRTNHZ6cjdmT0xyWkdnQ3FiRTI4bjA1Q0pyYlZkL3liSU5UbFJZRVNX?=
 =?utf-8?B?d0x5bXg5aDAvRVN3SjFFSmFqaEJrNCtuQ29JMmlXR250NTBzN0RYUnJCc2dK?=
 =?utf-8?B?MHhLb1FOb04xOEIzeHdDUllvak1VV1FwUUtxdFBxSjY5RnB1dmZxWlJBRlRu?=
 =?utf-8?B?MGk3R2hHK2JuS25NSWpCbGkwVWEyTVlaUXZYeTRlZExKcExwZFhkWFFZU3Ra?=
 =?utf-8?B?cWhqMVRublByaTFTanMrVEU5UkROMmhiQ0F5bmFhLzJpeU1uTVFzSDhYNUlr?=
 =?utf-8?B?MlU1Qk1RNyt1VGF5MTg2ZEJJaWw4NW1haERuNCthejJuMTdzak1rZVZsVC92?=
 =?utf-8?B?b3BSc0FSZGUvYkNjb2M0bzJwVFFhbzZSSnFxVEpYdGZ6TnlvcU9hazRsWGZZ?=
 =?utf-8?B?U2RqZUJ2OWRFckFoaWxqU2Qyc0ZrZUN4b0dudG8yUS96S05vdG4xc2hSTHlS?=
 =?utf-8?B?a0tYY21ZWGY5bEp3TEp6TzA4MmJRSUJsN2lVUDBYa2FsbjBvRitYOGE3R1Nt?=
 =?utf-8?B?RGxyWHAvWU96a2ljdTQrOXhMaS9iN1Ftb1RPdlV6QmE3UEJvSW5VMUN3UXVw?=
 =?utf-8?B?UVNib2xCNDdPRndxZENRbHJIemdUd1hCUFBGVVErWGtoZ1hodkdyUGUyeEp0?=
 =?utf-8?B?QnFPcFJyRmJoT3ZZcDE2UWFVL2NvY3pJQnRLemNEZkQ0eFFpdU1DdDNpbC9s?=
 =?utf-8?B?aG5CYzZRWWhHTEFvUEg5eXkyMWw3Z2lXK2RNNzBuQ2IzS2xVMnlZY2hINGti?=
 =?utf-8?B?Ly9IcVEzVW1VWHF6YUEwQWpZOUFjZFRFYVJHSWd2TWJ4cHVncHpyOEJ2d3VF?=
 =?utf-8?B?UjVWZHNFcFo0NjhNMFpZSlppM3V3VlpBVUh0MGRPSW9sQU8zL05iNHRZaUpW?=
 =?utf-8?B?aUJBQjY3K3JmVkE5dDNaRmluQkVBMGJSYlVYR1lwUnk4S0hqVFV1UTFKTzRL?=
 =?utf-8?B?TTVaVFllSWNic2kvU2w4dXltY1gvUmpUakt1MnlxQnJKWEJPVVlQejNwV01i?=
 =?utf-8?B?QjYyZGk0SEFDd0dlaHBpbG9ncW4xdDRSZmptU0FHK0UwUGkyWUZxejBXN0pF?=
 =?utf-8?B?VCtNais5S2NNK3R4eTJBSVBtckh5SmdPaUtraFIxLzN2NjZGVzBlcVBaQTUr?=
 =?utf-8?B?N0w3NzExWWwwUnJPQ1dqK1VocDZFMXRjc0V2QjYwaXNVa2VteG54cWxpOUZU?=
 =?utf-8?B?Wlc0RmtBTnZOUnZydDc0dkRnMGJEM0dZaDFDUzZKNHdOK3p3ejJUV2xRa2Yv?=
 =?utf-8?B?NVl1RzJFNWNvWXBKT1poMnZ0ODNnRFdRdU9DL3NGOE16eC9GcGgzS0g5amdH?=
 =?utf-8?Q?TB30km11lNERTaJyf39zjKeB8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5fae8d-218a-4886-a1c4-08db4bea4c8d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:23:08.4269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mchbWUwGWPyxGi9hPvTwvvYCWkyxyKst5gf3Czl+snYJjVKe8sCRKMIjo+DDe1oL/qchP7+p0YHKmazDvHNFvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533
Received-SPF: softfail client-ip=40.107.95.84; envelope-from=avihaih@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 03/05/2023 1:49, Peter Xu wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, May 01, 2023 at 05:01:33PM +0300, Avihai Horon wrote:
>> Hello everyone,
> Hi, Avihai,
>
>> === Flow of operation ===
>>
>> To use precopy initial data, the capability must be enabled in the
>> source.
>>
>> As this capability must be supported also in the destination, a
>> handshake is performed during migration setup. The purpose of the
>> handshake is to notify the destination that precopy initial data is used
>> and to check if it's supported.
>>
>> The handshake is done in two levels. First, a general handshake is done
>> with the destination migration code to notify that precopy initial data
>> is used. Then, for each migration user in the source that supports
>> precopy initial data, a handshake is done with its counterpart in the
>> destination:
>> If both support it, precopy initial data will be used for them.
>> If source doesn't support it, precopy initial data will not be used for
>> them.
>> If source supports it and destination doesn't, migration will be failed.
>>
>> Assuming the handshake succeeded, migration starts to send precopy data
>> and as part of it also the initial precopy data. Initial precopy data is
>> just like any other precopy data and as such, migration code is not
>> aware of it. Therefore, it's the responsibility of the migration users
>> (such as VFIO devices) to notify their counterparts in the destination
>> that their initial precopy data has been sent (for example, VFIO
>> migration does it when its initial bytes reach zero).
>>
>> In the destination, migration code will query each migration user that
>> supports precopy initial data and check if its initial data has been
>> loaded. If initial data has been loaded by all of them, an ACK will be
>> sent to the source which will now be able to complete migration when
>> appropriate.
> I can understand why this is useful, what I'm not 100% sure is whether the
> complexity is needed.  The idea seems to be that src never switchover
> unless it receives a READY notification from dst.
>
> I'm imaging below simplified and more general workflow, not sure whether it
> could work for you:
>
>    - Introduce a new cap "switchover-ready", it means whether there'll be a
>      ready event sent from dst -> src for "being ready for switchover"
>
>    - When cap set, a new msg MIG_RP_MSG_SWITCHOVER_READY is defined and
>      handled on src showing that dest is ready for switchover. It'll be sent
>      only if dest is ready for the switchover
>
>    - Introduce a field SaveVMHandlers.explicit_switchover_needed.  For each
>      special device like vfio that would like to participate in the decision
>      making, device can set its explicit_switchover_needed=1.  This field is
>      ignored if the new cap is not set.
>
>    - Dst qemu: when new cap set, remember how many special devices are there
>      requesting explicit switchover (count of SaveVMHandlers that has the
>      bit set during load setup) as switch_over_pending=N.
>
>    - Dst qemu: Once a device thinks its fine to switchover (probably in the
>      load_state() callback), it calls migration_notify_switchover_ready().
>      That decreases switch_over_pending and when it hits zero, one msg
>      MIG_RP_MSG_SWITCHOVER_READY will be sent to src.
>
> Only until READY msg received on src could src switchover the precopy to
> dst.
>
> Then it only needs 1 more field in SaveVMHandlers rather than 3, and only 1
> more msg (dst->src).
>
> This is based on the fact that right now we always set caps on both qemus
> so I suppose it already means either both have or don't have the feature
> (even if one has, not setting the cap means disabled on both).
>
> Would it work for this case and cleaner?

Hi Peter, thanks for the response!
Your approach is indeed much simpler, however I have a few concerns 
regarding compatibility.

You are saying that caps are always set both in src and dest.
But what happens if we set the cap only on one side?
Should we care about these scenarios?
For example, if we set the cap only in src, then src will wait 
indefinitely for dest to notify that switchover is ready.
Would you expect migration to fail instead of just keep running 
indefinitely?
In current approach we only need to enable the cap in the source, so 
such scenario can't happen.

Let's look at some other scenario.
Src QEMU supports explicit-switchover for device X but *not* for device 
Y (i.e., src QEMU is some older version of QEMU that supports 
explicit-switchover for device X but not for Y).
Dest QEMU supports explicit-switchover for device X and device Y.
The capability is set in both src and dest.
In the destination we will have switchover_pending=2 because both X and 
Y support explicit-switchover.
We do migration, but switchover_pending will never reach 0 because only 
X supports it in the source, so the migration will run indefinitely.
The per-device handshake solves this by making device Y not use 
explicit-switchover in this case.

Thanks.


