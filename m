Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3036FF092
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:34:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4Wl-0007De-OA; Thu, 11 May 2023 07:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1px4Wj-0007DJ-IL
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:32:05 -0400
Received: from mail-bn7nam10on20610.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::610]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1px4Wg-00032s-00
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:32:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVDGn8h+Faezer996c4tLTdwqQ4qJ7vh3EBuPRIZB5FC2JQHkREJmDXGEiUwET8+MjRM42+emdR5q6HJ8EmUCgjGvNAnrHrSwYN4+DwOofr7f6PajBtFnrXMDmf/ulnQDRQNnhPp2UpUG55GUZOCSYo96oh01XfuhepoKAkUDMjWjQNlIgdJNnx2Nc1EGr0K6/Z0xf0WWwOM9uBc77ae38Kzw/Bzf14N2OXIbGRpu29FY+VLwwBlF6JBaAI4t7VYFh+j1yPoK5rQnrsu6zmsdTP/4g50Czzr+rx1vG37OK+c3TC3XnWkqYW63aG3U9QgfbxhLrw7XkRrBsK2DuVOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67CO2dkmmTZRleXKXxKvkmrvFeMJ5ZexL4zcBJPvWdo=;
 b=CNPRrT3tqP3xoTdyPzg0Dan1QpDbWRz7S65IS2UYNSv5LouvAl/CGCJd4Qgz8Hhsa5RJ4fe5eZuXIfkuwLOs9jTXFXtQ4IcDl7vTJYpd1klo41ZVjQNV0LNVRJDdSb4jsydU18OjsotWR9w6j0QpyHQ8co68sAGmrCLZt1dzQDGnZYVSTHsrB/GPW1kRLyYFHIz+bOdEi71Y9Zjv6RsmvOhPnRP01vQ8cJ9pqij33E6ljF9hxo9K3tIWlhFKNPdcDffXvZEXHjWOMUvEr8R2NAlCzFBP3Jw9W0I6gJupVlIFIKsDDKqrkfYMNfAXY9h6L7O1GYDA1pgExlnD7u2YcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67CO2dkmmTZRleXKXxKvkmrvFeMJ5ZexL4zcBJPvWdo=;
 b=HcoXz/Lwm2z2d5gxezTtAjAiCUzDxYgMhFGyf39TMjKw4mFLU589LnUL2ievzSTwO+/FaRD4LZh4A/+slH9UyaWOJkd7LF7bnfGBHuNy4J0cQGDUcBdOaQFgB6yg42p2vq/7bebRzgVyLvJ1vGmh5OBfZsSacxUcUUvzGAJvOHs2RKPx2aqRwob9CCJplS0xU/eftNaJ1fuw9BTxF+4GaBfb5uzKy1GCUlI1uI7Nf5XMsODtOoVF2C1lvcERzfHHiEaDtzWjLDHnIrD1syOZPGRCQpHGkQdOM3S4RNIWHnnGYVfwDgtMunpTxQea64x8qG2ClyFROLfpHA/by5vGMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 11:31:44 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6387.020; Thu, 11 May 2023
 11:31:43 +0000
Message-ID: <acc6ec07-cd9d-bb0f-bdb9-56a2ced50e25@nvidia.com>
Date: Thu, 11 May 2023 14:31:31 +0300
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
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87jzxg6svr.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7ce173-3fff-4b11-7990-08db52134be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l1+vbJaNBYJ0qdNfTO2mDOJB5fUN1RdBhv/Lsw8ZpPRPbnkghoE/bAo5v9cmvHaqxc/wvNIkGqI9q94ntGN9/41rk52idpGXnxZlZcrPTdKRp4uN5/bHFlx/yQy//GFsmrBfXI2AbCjlX7yx08U+JH/lglb7nvmefhaZa3kZyO6Buf0Gsc4mQ/Ur12KPNxWBKEH3M6JjVYp99iv4T7//Z+Ho5XO9lWyxiSyk4B0NhqSKpFxrRn+8aPMVIyEEqJaWBYI22JKIA1J/fbPzI/6BzPY4Fi4UckzJZFahjicjnkvYeqagtaXWTNxdWRFvphnbV3PAzXjO0NyfjNfC420gNUs4k96EKIEpSH2MbBp5szsiqK1DB6SXWdYhv1K1SgqWa5WKFDUhS/AfDgdAUPUZ2tWUrbSq33HPm6aDrKe+xn9Lx49MCUlNDThc/FsPh8BvsHiOxZlFCy/gWAsG1WCelVeBIsRJ8xZjb3qAS3nx7oiLvW9Nr2eWX9HoZN15oe/Y01V0foZ22TySroHX2t7XlvavQ/13TLyTaUrovcJEDdMAk2zoqfFFFl3d8MPR6rdjHg7FXzxUMQ8zspGJRWEDks77RSFGQzFqRCQKxx723KbgIs3xIjgiYVOFadwzg4+3SoqUIoXLFixCsRTROlA60Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(186003)(7416002)(6512007)(6666004)(2906002)(6486002)(31696002)(478600001)(86362001)(54906003)(966005)(36756003)(26005)(6506007)(53546011)(38100700002)(316002)(8936002)(8676002)(83380400001)(66476007)(2616005)(6916009)(31686004)(41300700001)(4326008)(66556008)(66946007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNsZ3FldFl4UXVESzZtTmFDZUVvY3ByZDNxRFNaNWthRnB5c2VXTlVhaEJV?=
 =?utf-8?B?UmVLeEpBTGx2NTJ4SmRlWUNya3NSZFhGbjFvdTBZckQ1dnpGc0tlUkFoZ3Er?=
 =?utf-8?B?ZjY3RjIvdG9GUUtieGxHZUFmbTJPa2ZiMUJLOHE2UHl0SDlFRmJ2TFhodDlz?=
 =?utf-8?B?M0Z0K1RiZGUvQkEwL0hSYk4ycFk1c2JQQlV5Z3JVdmN4U01JYzEvOHM3b0NP?=
 =?utf-8?B?R0Y1WnpuV0YyZ1JZNWwrNW5nMERpMHZqREtjR3hybTUva2lUOXNwNjMvL1d5?=
 =?utf-8?B?aE53dGd5NTNRdEpiNkRvanhKeVpXaDdrM0c5QnhlaFBRenR4WGRiRm9CbXRZ?=
 =?utf-8?B?clQ3WTZpR2pUaWhXaURqS1pLUlpNc0Z1TGhFRHlmSS80WFl3ek5vZXBPb2Mv?=
 =?utf-8?B?bmI5aGRKSGRMc3VHVmlxQkIwdTV5c1NYMWJzYk1ER1RrWmhqcERzSDJmaXM1?=
 =?utf-8?B?ZDRGMGdzT2o0QlpsdUFwZXlpM3RqMm00dE5SeVhIT2xEdXBkMG9DaDJDalJH?=
 =?utf-8?B?Ukd4dXU0N0JLaHZOQkpoYUtOTllIaHk1WGEwUTNpejUzUW02dU9ldVdVaERB?=
 =?utf-8?B?bHA4clIzZWZlc0ZtSVl1dUsrMGtad05TaWhYdnkvTlhaQWRMY3FZbVZ2NE0r?=
 =?utf-8?B?bTBFeDgrNXNlTDEySmpxQkVFazFNcFhtalNSblVVSnhET0o1ZWl4VEswRmJJ?=
 =?utf-8?B?UFM0bWR3WUNMYU5JNjlkSmhtb1RGcmdBRUI4Z0NtTE0yOUFqRXVWa1N4elhZ?=
 =?utf-8?B?dC80bEVNNVM3SlU4R3poVldVRjFEL29yWWw0ODJEQUZkaWtDR1BTMU5rck94?=
 =?utf-8?B?SUt5OUYza0xDMENMclBySlNhZGIwb0Mva0xpTkRFY202dlA5Rzg3RVRnVVBv?=
 =?utf-8?B?MWt4bCtTZjNJbmRSYUIxdjFjQ2lHWUY2UmQyY28rOE5VY0VaVnFDdzNYZ1Ju?=
 =?utf-8?B?NFlVUlZWVDFVWkxUSkFZSmVQUnFoa2dzeWlhT2JGOVNqOEt3TGhqUnhlSXBQ?=
 =?utf-8?B?OURTRW4xVi9ZTFg2N1V4bFIxN2t6TkJlN1loVzQ5YmdPL1QrTklnTXN6WG9H?=
 =?utf-8?B?M0NVTFB2dEVFclVjR2tiNi9XcHNmV0llZ3g0UGkyTkgrdERmRVNOalJXTjNO?=
 =?utf-8?B?ZTdwSlVjOGIvZnZUWjhKa3ZDb2Jsc2FqNk91R2xrckpQKzRJZXVTQkJuWTRs?=
 =?utf-8?B?Y0o5ajNyUFIySG5FS3ZmUkJLZXBiWFczSVJ1SEFYN1gveHd6eGxnekJPYkhF?=
 =?utf-8?B?NFRVWnFvN1BDSVpOTUZsbHRzVnVDUmx5OUZGanJJWXNWMmtaNXk5UEdiZTV3?=
 =?utf-8?B?enFDbXRSSzdUbWtVSnppbG1nMVo1L2FHZmtUYTQwRk5LSyszQkVJVCs4cmJI?=
 =?utf-8?B?a0NabDk4dVZWclpnODI1MmJJcVRqWUtEVUhCVWdPM3U3V25WVGV2WUN2VHV2?=
 =?utf-8?B?YUdlcDJlUUN3T3Arek1lSzFJUUluYkFyQmhTTVVYSDNHYWM3eC9kUWFRMU0r?=
 =?utf-8?B?ZWFXbUREbE5pNmprQUloMFJSczRwRHB3UXRpdWpNQjlRdTlydW5zNEowN3Vz?=
 =?utf-8?B?Qkl4NkZlRGxHdDcxdm5kNFRqcHBSNnNQeGtLc2tiY1BaeXVCTkFqeUZ2NlZj?=
 =?utf-8?B?d0phaCtXblRkclBIQzZHRFBPMkQwOFBiK2ZNSFhwdVBaOVhVZiszUzEvUUtR?=
 =?utf-8?B?MnhFbklYL0k3N3pUUkNiZWVQOFFnOUNacVc3ZmYyNDNMK3l2YmVzM1hWK3ZH?=
 =?utf-8?B?dXVRclFSZGRhKzVMbVZPU21kOXdiV3NOekZXQjF0eStXeFduNS9rUG1HUFZn?=
 =?utf-8?B?VHd1WVVaRjlsL3l4YTNDWWJuVTh4OUlKQ2lPSUduZjZ1eGpLVzVCalQ1aXBm?=
 =?utf-8?B?WlRwU2RMMTN5Uk44aHBPS1RMb3RJM254U0YrRDNjZThMTFRPVzB3VTYvL0sy?=
 =?utf-8?B?U0Q5TlVvMDN3OEY5ZW5mMHpSQ1ZvdXhzeXo5OW5wRW0vd21IQ0F2OUh5YlM2?=
 =?utf-8?B?NEZPWStPUFdvaDFPQTFTRGFLS0NiQTUwZ05SZ3J0T3pPaDVqODVFUm9XVDQw?=
 =?utf-8?B?ai9GdFpJalBDbGZJTnVoRC8wTFNLREVKczJoR1VQSTNIVHRJcEJuN0czMFRK?=
 =?utf-8?Q?vyt1t2xjDTZSnpz32C8s6Az2I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7ce173-3fff-4b11-7990-08db52134be7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 11:31:43.6792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xi7ITtk7i+EFQOZiwE8Vt6m2JAg4wxLzBadlieNk2gulDTtAdawJIlif/iHLw0IyF6xGrIE0Fa/0s6zaKVm7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::610;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


On 10/05/2023 19:41, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>>> You have a point here.
>>> But I will approach this case in a different way:
>>>
>>> Destination QEMU needs to be older, because it don't have the feature.
>>> So we need to NOT being able to do the switchover for older machine
>>> types.
>>> And have something like this is qemu/hw/machine.c
>>>
>>> GlobalProperty hw_compat_7_2[] = {
>>>       { "our_device", "explicit-switchover", "off" },
>>> };
>>>
>>> Or whatever we want to call the device and the property, and not use it
>>> for older machine types to allow migration for that.
>> Let me see if I get this straight (I'm not that familiar with
>> hw_compat_x_y):
>>
>> You mean that device Y which adds support for explicit-switchover in
>> QEMU version Z should add a property
>> like you wrote above, and use it to disable explicit-switchover usage
>> for Y devices when Y device
>> from QEMU older than Z is migrated?
> More that "from" "to"
>
> Let me elaborate.  We have two QEMUs:
>
> QEMU version X, has device dev. Let's call it qemu-X.
> QEMU version Y (X+1) add feature foo to device dev.  Let's call it qemu-Y.
>
> We have two machine types (for this exercise we don't care about
> architectures)
>
> PC-X.0
> PC-Y.0
>
> So, the possible combinations are:
>
> First the easy cases, same qemu on both sides.  Different machine types.
>
> $ qemu-X -M PC-X.0   -> to -> qemu-X -M PC-X.0
>
>    good. neither guest use feature foo.
>
> $ qemu-X -M PC-Y.0   -> to -> qemu-X -M PC-Y.0
>
>    impossible. qemu-X don't have machine PC-Y.0.  So nothing to see here.
>
> $ qemu-Y -M PC-X.0   -> to -> qemu-Y -M PC-X.0
>
>    good.  We have feature foo in both sides. Notice that I recomend here
>    to not use feature foo.  We will see on the difficult cases.
>
> $ qemu-Y -M PC-Y.0   -> to -> qemu-Y -M PC-Y.0
>
>    good.  Both sides use feature foo.
>
> Difficult cases, when we mix qemu versions.
>
> $ qemu-X -M PC-X.0  -> to -> qemu-Y -M PC-X.0
>
>    source don't have feature foo.  Destination have feature foo.
>    But if we disable it for machine PC-X.0, it will work.
>
> $ qemu-Y -M PC-X.0  -> to -> qemu-X -M PC-X.0
>
>    same than previous example.  But here we have feature foo on source
>    and not on destination.  Disabling it for machine PC-X.0 fixes the
>    problem.
>
> We can't migrate a PC-Y.0 when one of the qemu's is qemu-X, so that case
> is impossible.
>
> Does this makes more sense?
>
> And now, how hw_compat_X_Y works.
>
> It is an array of registers with the format:
>
> - name of device  (we give some rope here, for instance migration is a
>    device in this context)
>
> - name of property: self explanatory.  The important bit is that
>    we can get the value of the property in the device driver.
>
> - value of the property: self explanatory.
>
> With this mechanism what we do when we add a feature to a device that
> matters for migration is:
> - for the machine type of the version that we are "developing" feature
>    is enabled by default.  For whatever that enable means.
>
> - for old machine types we disable the feature, so it can be migrate
>    freely with old qemu. But using the old machine type.
>
> - there is way to enable the feature on the command line even for old
>    machine types on new qemu, but only developers use that for testing.
>    Normal users/admins never do that.
>
> what does hw_compat_7_2 means?
>
> Ok, we need to know the versions.  New version is 8.0.
>
> hw_compat_7_2 has all the properties represensing "features", defaults,
> whatever that has changed since 7.2.  In other words, what features we
> need to disable to get to the features that existed when 7.2 was
> released.
>
> To go to a real example.
>
> In the development tree.  We have:
>
> GlobalProperty hw_compat_8_0[] = {
>      { "migration", "multifd-flush-after-each-section", "on"},
> };
> const size_t hw_compat_8_0_len = G_N_ELEMENTS(hw_compat_8_0);
>
> Feature is implemented in the following commits:
>
> 77c259a4cb1c9799754b48f570301ebf1de5ded8
> b05292c237030343516d073b1a1e5f49ffc017a8
> 294e5a4034e81b3d8db03b4e0f691386f20d6ed3
>
> When we are doing migration with multifd and we pass the end of memory
> (i.e. we end one iteration through all the RAM) we need to make sure
> that we don't send the same page through two channels, i.e. contents of
> the page at iteration 1 through channel 1 and contents of the page at
> iteration 2 through channel 2.  The problem is that they could arrive
> out of order and the of page of iteration 1 arrive later than iteration
> 2 and overwrite new data with old data.  Which is undesirable.
> We could use complex algorithms to fix that, but one easy way of doing
> it is:
>
> - When we finish a run through all memory (i.e.) one iteration, we flush
>    all channels and make sure that everything arrives to destination
>    before starting sending data o the next iteration.  I call that
>    synchronize all channels.
>
> And that is what we *should* have done.  But when I implemented the
> feature, I did this synchronization everytime that we finish a cycle
> (around 100miliseconds).  i.e. 10 times per second. This is called a
> section for historical reasons. And when you are migrating
> multiterabytes RAM machines with very fast networking, we end waiting
> too much on the synchronizations.
>
> Once detected the problem and found the cause, we change that.  The
> problem is that if we are running an old qemu against a new qemu (or
> viceversa) we would not be able to migrate, because one send/expects
> synchronizations at different points.
>
> So we have to maintain the old algorithm and the new algoritm.  That is
> what we did here.  For machines older than <current in development>,
> i.e. 8.0 we use the old algorithm (multifd-flush-after-earch section is
> "on").
>
> But the default for new machine types is the new algorithm, much faster.
>
> I know that the explanation has been quite long, but inventing an
> example was going to be even more complex.
>
> Does this makes sense?

Yes, thanks a lot for the full and detailed explanation!
This indeed solves the problem in the scenario I mentioned above.

However, this relies on the fact that a device support for this feature 
depends only on the QEMU version.
This is not the case for VFIO devices.
To support explicit-switchover, a VFIO device also needs host kernel 
support for VFIO precopy, i.e., it needs to have the 
VFIO_MIGRATION_PRE_COPY flag set.
So, theoretically we could have the following:
- Source and destination QEMU are the same version.
- We migrate two different VFIO devices (i.e., they don't share the same 
kernel driver), device X and device Y.
- Host kernel in source supports VIFO precopy for device X but not for 
device Y.
- Host kernel in destination supports VFIO precopy for both device X and 
device Y.
Without explicit-switchover, migration should work.
But if we enable explicit-switchover and do migration, we would end up 
in the same situation where switchover_pending=2 in destination and it 
never reaches zero so migration is stuck.

This could be solved by moving the switchover_pending counter to the 
source and sending multiple MIG_RP explicit-switchover ACK messages.
However, I also raised a concern about this in my last mail to Peter 
[1], where this is not guaranteed to work, depending on the device 
implementation for explicit-switchover feature.

Not sure though if I'm digging too deep in some improbable future corner 
cases.

Let's go back to the basic question, which is whether we need to send an 
"advise" message for each device that supports explicit-switchover.
I think it gives us more flexibility and although not needed at the 
moment, might be useful in the future.

If you want I can send a v2 that addresses the comments and simplifies 
the code in other areas and we'll continue discussing the necessity of 
the "advise" message then.

Thanks!

[1] 
https://lore.kernel.org/qemu-devel/688acb4e-a4e6-428d-9124-7596e3666133@nvidia.com/


