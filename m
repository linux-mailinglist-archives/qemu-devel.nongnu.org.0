Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59BD6FE206
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:02:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmFr-0001GA-Sk; Wed, 10 May 2023 12:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pwmFn-0001Ap-Gz
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:01:25 -0400
Received: from mail-mw2nam10on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::61a]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pwmFi-0006Gj-9V
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:01:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBAR4u7fJtpwog3+4HUr7mQqyOlkMf771UcDC+FcfK9xlxNjQuMJmJUP0UiMoNDPcBc/FD5AVhZOyjZrkbgFomdJQKbxkMLIqqiXIGAMUjmlE3jMKF/WMlBa38znwmm3RTGbhlYAkQNuFkNVzClzahRMPdyGpx2q1zsxKm9VgPkbIquxpFkCrUm5JqihmWy/5vAvHjeCeE/3h0ImlBwO5lMVB9KDsUvW7Sp+Bb+V9MsSarBOIrf6i6dAX3ilMf2PE9/lKIOoSYX5ugY3Fto9XLl7PPyctA82NI+WmWnoVaM3GxWDuXy+OAvjZqd3Pr1wPUO8tDqgB1e6vFMfrKI7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seleRtO2+q34tZhv6J4XIUxD1q19Wk4Fa/I+w1audek=;
 b=TaDYX3wPxpVEWpVzx0Hd1NIh5Rc0pXwPLFxwSD3KRblIu+h3G7g+fmr4gmpCgTgV9PlzDYSnS+peHCfY2JLwJvLv3ETnQ5RkgQbWd3qjOlmH6+QUKQroNEdOhZIAo1AEFEb5fV5Q5FfgIYR1wXhRRYs4N1GFUgJnAuzrOspb8Q7uNNQ1tCStbQzfOeXzuLHjHbRnMCgn0KJttuvufknniFl54h9GUDP9+MNAgDisvBMUcmm01DRmd+5vPdzfyJvz5IpWKWqXkjE/dVq/yMxQN0ISFe0FBuxwBHQvtfOYl42c+DNUspSD/uodHHdiDyltKdilNoiIXvPO03C8quzbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seleRtO2+q34tZhv6J4XIUxD1q19Wk4Fa/I+w1audek=;
 b=cle1IPUqvlqq0/mNUSwTDPJeHcNaFcFpg2pqY0OdEkxKZJKkoRGS6Tbe1uXUsdiORxG/dgN95N+E3Z66HKQlrtFg66qJKfXavNqqJ0qODQtTp0aVRVEJoChtuMeRouoijt38UfbetnCMUYRvfmRBq9uEFOvqgsWTnHoGAGOVh5MLAMf/yig47uChQ0nt3wIl/f3HUBdRHwd5hT68tJuvpsPfdVxzv9amhbNxI0zqGaHiDBiYmevxjfInVXXCKrDid5krDnxTeeKx5+b+/Uncw9CinvPycX/urWK/br2SnUKbBeJUG7XU8af2h22So07zgHjvym7dib5MMuvYqBoPIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 10 May
 2023 16:01:12 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6387.020; Wed, 10 May 2023
 16:01:12 +0000
Message-ID: <3bb652f6-4948-d6c2-fac5-e0a6c3edb62a@nvidia.com>
Date: Wed, 10 May 2023 19:01:03 +0300
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
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87v8h08s9o.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0175.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::19) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0e2a68-6ce1-4b7c-53b6-08db516fc677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4hLDLaVi3DwzeTfxiKLPZctyqpc9MCI8G/jWrhVF/u7GoPFc/zzGYQNL85qHRcbXqDSGoAYeGLSFjxOhu4FPJrrhLIfs4fJxtJgT5lzhWsAmZeVm/7qPEtV1ySCqOjRlqjUY9TZlS+xcLrgEcrm3iUEEWkLiz2lLfHQ44510vcpF/XnanBD/tdl2ksUGcdYB4x+7rgHJH9IlvpBlhOVTZQ3fiGEvxBH4JYQkaZpQgA3ixLekrzPUN9v2pp1GV4UbhmM32oKEXtUThFqynGbos9/FRgFJYK9oeWHx3C1ECwqMCH9E/Nda9BBcTAjTxk8VbK19gzYCJrmMZCeJGpEVFHWw31UXetlRU9HZaAVYD1+eL0uhrKqYUJ0rbfCic4aEcRCj6NdeeJOdI/1j1pZc/kud0nE1PI3a+AKDA/A4NKp+02Zur9au06/U1BTyfCEQjYXsWX3gkqfVVfgvryoFdVNdv2iQ9Wggqe8X8/OMwEfdOWGIXaCxPUFN8jZQVPdoxv1/jy/TL8WnZOBN6dMR9rRU9QwgZcKF6zxk2+e+a9JputGEtZ+HvGL/XBNuvF3LXVlstEro2apxz7D/JtoQe65zmqUCioR2xffl6gacMBbd5kY5SNCbwgAFVAF+5kvA7NcMHCwecZzspIKT2ipAmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199021)(66899021)(31686004)(6512007)(2616005)(2906002)(5660300002)(26005)(54906003)(31696002)(36756003)(7416002)(66476007)(6666004)(41300700001)(66556008)(66946007)(478600001)(6916009)(6486002)(8676002)(316002)(4326008)(38100700002)(83380400001)(53546011)(6506007)(8936002)(186003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnlaVTNtMnI1MENFam9uZW5IK2psTmpYWkNxaEV5czZZdEVodDQvL3MvZEVt?=
 =?utf-8?B?QzVBZHRVYXhrelpOMXRRdWl1UzVZWlRSTVYxdmhXTnppWDBzeEtTYVExRElZ?=
 =?utf-8?B?aTdJTGxmVTljUXJBMWYxbkhibUtRSjRjRkhuSm1na242YnJKYld4Y3BZM2Zo?=
 =?utf-8?B?NCtycWdQTnMyVnA4NGFRSTd6MTVOZFZONnRmSXJiKytJbTIxUGRCZndHbmFj?=
 =?utf-8?B?d0lvT1hvbU56TjF2ZnczT0xNNGNRWmhDcWpGSUFHMG5nQ005WGM3WVlCZWh6?=
 =?utf-8?B?WER6RENQWStxakF6R3V6ZllSQjc3TTRZVUxzL1dZZkphbE5nVFpLWEJlYlF4?=
 =?utf-8?B?OVNZOFVseUk4aW1UTXFtMlQ2RFd5cWJTdTROdGJleFAxa2dDZXJHdjltaTZn?=
 =?utf-8?B?WTFZbmg2c0txTU1MSVY0RDN3akphZWk3L1JFNFRiOUNEZlZTQW1zdWR2L3lD?=
 =?utf-8?B?ZGkwUXhaTit2OFVwL292UWFBL2N1ajMvb1VCRWgwRnBJRG1yNm5PbHNYbFlQ?=
 =?utf-8?B?TjQxRnd1d2pXTFBSSGRnZm9LK0xoVEpvM2xpTnV0bzFxTWRJdS9Bb241V0Ry?=
 =?utf-8?B?M3dwejc0NUV1bytiUGdXd0RiTHAzOEJjL0JQUE9mdGM2cnNhdUFSRUlyNjhB?=
 =?utf-8?B?bUlQaTVnbGozL3dMeTZtbkxseHMyQUZlU0gyVHQwZVVpNEMrVTk4cnVZQVJU?=
 =?utf-8?B?OFJpUnJYVElCT3Nqa3dCRzltWS93SUN2bk9mcDBmWm9ZTnd6bTdqWnl5SEo3?=
 =?utf-8?B?WVZsWlR0aFp5d0NVVjRGbEo5L1FGTFFTdWtzalRDZDg3eGxiN1VzekRjNGZt?=
 =?utf-8?B?UjJvRDBhSlE1ZFBJK1hzVTRpdjVEMUNZQ2xnK3RIN0htcjhLQS90TXdaWE1V?=
 =?utf-8?B?dEo2OW5MRVhOOW52bi9mMWtzNjRLUlFUNlZVc2ZneUxXRENnSFdmQnpQdUo0?=
 =?utf-8?B?ZmZTSjlRckJBZ3dQUXVBOUZUenhYRlJXVGkwd0FhTkxTV1RocGxjL3NyQUZ1?=
 =?utf-8?B?MC9zcUNUMlZ2ZFZGVlZ6enExUFZVL3ptT3FnT1FuYlhsR0FJdHZBWUtoNURX?=
 =?utf-8?B?R2NIdi9WTnBjaUd1Uit2OXlwWmwyL29UQ0Z4VTNvaWk0WUJ3ODhrOVpXQlBq?=
 =?utf-8?B?RkVzT0MyS1d3WjFTZzlVNlFXYUhOWTV2Qkl5US90WXB5clJHQlptempheG1M?=
 =?utf-8?B?WWlNUnh2bXNWb1RXOGxrVk9ZNGtRa01icWc1UGplUU9UYThCL2prZTBYSUR4?=
 =?utf-8?B?V2J4emxLblc3L1ViQVAzUmR0TzE5WjI0RUxOekpVWEZsY0p4U1NLSVNzK3ln?=
 =?utf-8?B?cWhHYWNMQ25xRzNZQUFtRWtkQUtpTHlpVjFvR2V4VjVGL2xQMUMyakUxaTUr?=
 =?utf-8?B?YWVGVkdYeHNzMVV2TGhwYzBaM1NNMDRhbEJLd3QzWUE1alFQWTJYWVliVDdZ?=
 =?utf-8?B?Vm82c3hqMXJMSDBXSE9idkIycU5IRWdxd3ZPNForN0ZVeTViTUlCSkljaFNO?=
 =?utf-8?B?OTNCQlB3NTR3WU0zSWNVSXJOOXJuTHBHbllVU0RwNUltbGpraXlmK3VLU0RU?=
 =?utf-8?B?K3hZSUNwVXgxODQ3d3RXUWRRc2NOcjNuWjU3WjQ0UTR0M3QwUnpuVURndDVn?=
 =?utf-8?B?WmE1cmtqRUlxYzZFdGtNTWxmQnZrUUdONEJqS1NZRnlzalJWcHU2SHZJR09E?=
 =?utf-8?B?cS93d0gxRyswZjd6YVBWaDVla3Z4WVh4dGl4cTNkdFVvSDJBQTU0cU1jTnBO?=
 =?utf-8?B?MFNHVkYwMzFVR1JYM1NWN3dWRCtoaGNEQkdUSEpYd0pmSkJwTTU4a2E2Y04v?=
 =?utf-8?B?emh4Y01KVVo5aDdXbkZWN042Y0I1MlljT3lQMFNOdk9ZQnplcmN1OU52cEdD?=
 =?utf-8?B?U0NWa1N3N3AxUmxoUHlFQXFXK0t6RnBiWmFqclhETm1LS3BYV1o5LzF5UU1l?=
 =?utf-8?B?bkF4T1JsSmp1UHlPeHBBdDdScDhxYzNPWHhwU3Q1UjJTamV0a3YrdGMrMkxG?=
 =?utf-8?B?MXI0NE5MQmRjOXpKbXZYaURsU2hYanNSVXhnZ3VYS2dRWVMybUtteE9Kdkwv?=
 =?utf-8?B?T1Rod3YyeEowSWZ4bG5vZkhyT2FNRTVia2FVVW04T2tsQ0twRWpsZVJVUldC?=
 =?utf-8?Q?3VHf5a/zqfufUklydoqCyHqIU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0e2a68-6ce1-4b7c-53b6-08db516fc677
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 16:01:11.8523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cg9XHLPVnLFkVFYbPvZpLeMmuUH2EC6Hd35gVWxx3FWUqQhwCgcfko0B+7ztrha8f/hXJu/OMqlCwaETgrnIrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
Received-SPF: softfail client-ip=2a01:111:f400:7e89::61a;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1, NICE_REPLY_A=-3.251, SPF_HELO_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


On 10/05/2023 12:12, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
>> On 03/05/2023 1:49, Peter Xu wrote:
>>> External email: Use caution opening links or attachments
>>> Only until READY msg received on src could src switchover the precopy to
>>> dst.
>>>
>>> Then it only needs 1 more field in SaveVMHandlers rather than 3, and only 1
>>> more msg (dst->src).
>>>
>>> This is based on the fact that right now we always set caps on both qemus
>>> so I suppose it already means either both have or don't have the feature
>>> (even if one has, not setting the cap means disabled on both).
>>>
>>> Would it work for this case and cleaner?
>> Hi Peter, thanks for the response!
>> Your approach is indeed much simpler, however I have a few concerns
>> regarding compatibility.
>>
>> You are saying that caps are always set both in src and dest.
>> But what happens if we set the cap only on one side?
>> Should we care about these scenarios?
> Not really.
> We are supposed that something like libvirt has set things up and such
> things are ok.  We don't try to detect that kind of things in the
> migration stream (I am not telling we should'nt, but that we don't).
>
> If you configure qemu with an disk on source that is on source but not
> on destination, migration will work fine until the device copy stage,
> when that disk is missing.  I think this is something like that.  A
> missconfiguration.

Ah, I understand.

>
>> For example, if we set the cap only in src, then src will wait
>> indefinitely for dest to notify that switchover is ready.
>> Would you expect migration to fail instead of just keep running
>> indefinitely?
>> In current approach we only need to enable the cap in the source, so
>> such scenario can't happen.
> I see.  I have to think if this is a better approach.  But will like to
> know what libvirt thinks about this.
>
> Daniel?
>
>
>> Let's look at some other scenario.
>> Src QEMU supports explicit-switchover for device X but *not* for
>> device Y (i.e., src QEMU is some older version of QEMU that supports
>> explicit-switchover for device X but not for Y).
>> Dest QEMU supports explicit-switchover for device X and device Y.
>> The capability is set in both src and dest.
>> In the destination we will have switchover_pending=2 because both X
>> and Y support explicit-switchover.
>> We do migration, but switchover_pending will never reach 0 because
>> only X supports it in the source, so the migration will run
>> indefinitely.
>> The per-device handshake solves this by making device Y not use
>> explicit-switchover in this case.
> You have a point here.
> But I will approach this case in a different way:
>
> Destination QEMU needs to be older, because it don't have the feature.
> So we need to NOT being able to do the switchover for older machine
> types.
> And have something like this is qemu/hw/machine.c
>
> GlobalProperty hw_compat_7_2[] = {
>      { "our_device", "explicit-switchover", "off" },
> };
>
> Or whatever we want to call the device and the property, and not use it
> for older machine types to allow migration for that.

Let me see if I get this straight (I'm not that familiar with 
hw_compat_x_y):

You mean that device Y which adds support for explicit-switchover in 
QEMU version Z should add a property
like you wrote above, and use it to disable explicit-switchover usage 
for Y devices when Y device
from QEMU older than Z is migrated?

Thanks.

>
> Once told that, this is the "ideal" world.  In general we don't force
> this because we are not good at detecting this kind of failures.
>
> Later, Juan.
>

