Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877FF36B889
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 20:03:42 +0200 (CEST)
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5a9-0006aG-II
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 14:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb5XP-0005Cf-IA; Mon, 26 Apr 2021 14:00:51 -0400
Received: from mail-vi1eur05on2130.outbound.protection.outlook.com
 ([40.107.21.130]:32716 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb5XL-0005c7-O5; Mon, 26 Apr 2021 14:00:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id8BmFUPSBlK/daEwMCJ63mg3x7MBXI9Sy3wluOFaX9pPGYRQ1aUNfbutv2U+oCsvbQZJVrbsNtN9j+Hfrvo7zSWDGJh6uJE5aKCLIeK4oFYeyGoD8HO9SeqsqA4gjJq5aj/RyFzCtsEoTlmemusW+/5yzNziQo2Ldhf0bnd/Ttgr5dTpfapa6lCGg9XPMwt78AIFIbRlMdX+mkb7k7lfd27JoRG52KRXa/7XTtsYxfgfVXsSn1V1YuFE4pFANpQ8/RJtCaVPYn+zEGYlBbEcRFmX89oRiglhONveVCktsk9Ui0sGQBVVTg3Y4gymu/n9rmeCPCWOUWHTzALNC6TRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwNlWd+Tt3AvdYMw37FANEwQQ2yZOdaZ3s7ubxqfuX4=;
 b=VANheJFqnNvKmkWTJu39o1juPSgx8qtE6qZtcKECYB3D3QNwOoJ9aSsqCKN0Dy5J3Ui0xlxVUQKc4gidW58eklQnPu5zTWVslMvjLnHDfNhJZlUwwQNHdRgM8Bvc+Y80G3v5kfCudpk0SzhCxYeN8YvBp7UAZeUBzKa82JYmYUx5KHZtLBW+kiswbop6yJAcm0IA9SRr3/blpnRfr/98dYLDmWvySe2RPs5RHzo3wczKqnzZXAIQYlQKy1EgAwCuBY9LpO4bvdEM2eYrUaGkYtLy0O7ehoisgMp6AENWZAo7UijztMOkwA9mYObfP8pGtgisnsEMAYSm67DAD1e1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwNlWd+Tt3AvdYMw37FANEwQQ2yZOdaZ3s7ubxqfuX4=;
 b=InpjZoaT+onEhP4xFTiQAHYzxMeCVI3DUaTDtqqYT/RyM+4ZPqxy1IaGXSNc8TvezLBCuMAXbmUqUCQzFqQmPQkCDB0qtcP124/K+XIKoEyI8qR0vL0RRuJtqNHwDdg9HiCIac/09iG/RfDQ+hdt9g448MNiiDwWdA05qCiuULE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4213.eurprd08.prod.outlook.com (2603:10a6:20b:8e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Mon, 26 Apr
 2021 18:00:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 18:00:43 +0000
Subject: Re: [PATCH] qapi: deprecate drive-backup
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, kchamart@redhat.com
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pkrempa@redhat.com,
 nshirokovskiy@virtuozzo.com, den@openvz.org, libvir-list@redhat.com
References: <20210423125900.3640-1-vsementsov@virtuozzo.com>
 <9a0e7805-c6ae-b55f-431c-4c61a1ab746e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cc17a05f-c563-03cc-4e32-91b41fa87b46@virtuozzo.com>
Date: Mon, 26 Apr 2021 21:00:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <9a0e7805-c6ae-b55f-431c-4c61a1ab746e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR0P264CA0147.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR0P264CA0147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Mon, 26 Apr 2021 18:00:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd526f31-dd99-45d5-d2af-08d908dd35ba
X-MS-TrafficTypeDiagnostic: AM6PR08MB4213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42133C0C2A6B2E48F8665450C1429@AM6PR08MB4213.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cN+b7+SXMSHfXBVFynQCRH9gSYLMmqHDqaAKUweIMyda02cPnThd/kiHnc6g683RVHIjZa2Jcb7GxPNk38szXTMuyD2yidmEun2yU8jeGme0c6WmYZzFbq0YqskqXzmyng/aBx6VrpRcJJNxv+VYZTcAs/zIU4Jqp8sJNhu5rqk3GfxH9aR9ktILDnGopYR3csm2GTmcp886LV9OM5AoEcnRLdC6W7XRd0hnTMr0g9uzsYx2FcYNct64W8QLaguP6cod6BnircxvmGGXtUHsrIidSd6sdODJT1MqrIoVu/K7h0sgu6p8rlmcc/AWfql8MkN5KyQ4mP3tBFAng6O/9lczOpg2MdLRZp8WAWDCmPrgmejdjOcZVQHJf9e2qjgHlJP7Xyxu4FbN9Oz1fQgLdcfTRX1jwJEKJDi+YtRcCirwfhiQVk/DgxHRR9j9jcDcJP4OW+lDVyPdWuLUlI59+0NPEMEyLJnfF6lv5UMyBxeRDzFVAeTuHYrE6VsiEziEVJGoLsiq4nAppEZtNO7norBNlZ+9eKSlca5LkfpwAn54fo7pMhSydRmlS9V9FXxFkK3axrfUL0HCOab1kJ9R6uO4BDSMUy+g1Usj/sAAjzSsEn1LcwrgsH1qPusGvbwoEOE6v7EDr3H4ICGf5tYXionT9aMpU0+9mQfHjNZTM7MGFffwmWvo6b+6wZ2Y6k6BtXqwAP3FAdAlUwc2K6nvzEvhWteqSic51qYQu2P1emHUM4S2bHscq4MQK092nBOf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(31696002)(66476007)(5660300002)(83380400001)(66946007)(6486002)(4326008)(26005)(36756003)(38100700002)(8936002)(53546011)(38350700002)(8676002)(2906002)(7416002)(966005)(16576012)(16526019)(186003)(6666004)(2616005)(956004)(498600001)(31686004)(52116002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFFpeU4wbGFUV1RNNDhHTnBsY2ZxLzZoMElERjJ0NUZQdkU5Z1FtN2JLM1g3?=
 =?utf-8?B?Y3IyRUFFNHI1cUlOVkdIdXpxRHI5cFhVVTI0bzJCbU1ZRlU1RTlDaHB5ZHZL?=
 =?utf-8?B?MmlSME9MSnFyWWNsZENqSTJBMGZpaTljTUxKWkJBY3FHQi9HN1ViOU5BUm4r?=
 =?utf-8?B?TXhTV2tQZDRjVDZ0b1RRMzY4SWZkYXN4ZVhDN2tMdzY1ZnZhL2c1anZFMkdr?=
 =?utf-8?B?elE0ZVFvZnBiTURqL2s2UDQvSlJMcGNobGd2dVdmRXZrVjFhTkoyaC84YW80?=
 =?utf-8?B?VE9tVmtlZy9PV3hhWDJubE5CNGpRczZ1anVLelpJT0Q5ZnByZThidE1LWWJs?=
 =?utf-8?B?dDlFOS9acGEyUzdvQ2pnWEhLeHBidFY5UnU3UG01Rmo2cjVkS2pwcVh6MkZh?=
 =?utf-8?B?WElRYUNmY3E0amhrSDQyOWp0UFF2VWNJYml3NDZkSkVMUndldk1ja3AvaFJJ?=
 =?utf-8?B?b011ZkcwYWw5ZkVDMFVqRksrSmI2RzE2OXRUc3BiZ2pkVFd0S2ozT1dGMU5N?=
 =?utf-8?B?eDkwbXBQN1JwUmgvbTVsRUFUaFNHMnIwV1VaeHlzR0VUVkRFZFFRZmdYeFBj?=
 =?utf-8?B?dXVMVDJpMjhvWHArZXgzZ2E0c2JqcVBpRFpWSENhWkh3SFdoNXlDWkUyMndF?=
 =?utf-8?B?UVJxWkpHYWNySHJIYXBkOUpoeitWaytGbVJ1MVduckgwU2VpamlVaUtmQ2FD?=
 =?utf-8?B?a3d0RzR5d3JJMStNT0ZsUkVmTTlpNXg3VW1tSndLMFBnZ0lXOTkvdWpER2lo?=
 =?utf-8?B?bUJkK0pVZUNnSStPYXBMdmtEZElRZnlXOUFUVkQ2YWFTTVltQmZMVFV0ZVdT?=
 =?utf-8?B?MHpBeW1VV2V2dUJYTVh0dHJxYTdxOFd5R2k4RGVHL0I2UnVDTVlvbjkyV1h0?=
 =?utf-8?B?OG4rbjVrcXc5a2VjMXM0dUc2S3NxTmUzRG9oMU5Id0dLa0ozVkhVQzQzSXlB?=
 =?utf-8?B?VnVoN3QzalVPN3VualhRZEdHczhlYS9JME1VeUJtOHF6QXhsa2Y2UnB4UVlZ?=
 =?utf-8?B?OFdQWDFQSkJQaFJpNVpZaXo3TVdSMUhXNEM2MDBTL3pRYmV5d0VQRmlwa3Br?=
 =?utf-8?B?WlFrRVcwZXlTWnA4ZW5XZnVMRkNERWtaelFwbTI4dlBueHVRMnZMQXRoU2pp?=
 =?utf-8?B?RXNPWDZrMU9VSWp1SHV6VzJMUGlEZW9xWVhIWHl3QUpEbWY4Q1RrNjk2S1Vp?=
 =?utf-8?B?VWlDdFZSdHFabzByU2dIbk1vRDUvTmIxV3RNc1RTRXhVRUFLSmpjMVMxNGlv?=
 =?utf-8?B?NW8yZTZmRVkyWlkxM0pOdVJZeHVCeG9XUjJ2bTBYZngzVVdyWUlabTFndjJY?=
 =?utf-8?B?dTlFVmlUbzVuQzVCSHJkRFEzWWt1V2xvTEYvaUhMMFM3S05XQ2lvbHFEanMr?=
 =?utf-8?B?WU01M2dacjRmY3BERmt5Y25veU1HQzJvMy9LZFNJNU5ROVBQamRSUlhZOG1t?=
 =?utf-8?B?a1JsL0VFRWhLYmx6dEtXcWJhZ3hNdldGVEZMUlZ1cFJKenY5MjFXNW16Vmsw?=
 =?utf-8?B?bi9OMVFwbGRoVEQyR1lOVXU1b0Q5aUhBRFY5RzNxamJXaGpBdkt3Wis2Tm9R?=
 =?utf-8?B?MUVjNkg0bENaNTIrUGVkV0VQZHBRZ0p5NU04MGdtcnBObzVCUHZPdGswemVj?=
 =?utf-8?B?djBpM09tODRQR1hBQ1FlbG5VTU5OeEF1WTVNc29abFRZbi9xVkJobkNLbnFW?=
 =?utf-8?B?VWFmM1F1NHVmZGVsSStadE0xTFVLK2EvL1hpcHQ1cHJxMDZMejk0WElKV2l6?=
 =?utf-8?Q?dd828ssZy1tUhafXGb/y33V1ERrNMAUQ69qlD89?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd526f31-dd99-45d5-d2af-08d908dd35ba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 18:00:43.3350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiK917VbCSIti6IlX2VSoGb0Oe3hjUuMM6Pmpn7clt2JAPSQEMtZYrYNKuRq0DL7TmaFcPNhM22vM1buRoFPkmBCpsP8TX5rFaITSOXXFBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4213
Received-SPF: pass client-ip=40.107.21.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

26.04.2021 20:34, John Snow wrote:
> On 4/23/21 8:59 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Modern way is using blockdev-add + blockdev-backup, which provides a
>> lot more control on how target is opened.
>>
>> As example of drive-backup problems consider the following:
>>
>> User of drive-backup expects that target will be opened in the same
>> cache and aio mode as source. Corresponding logic is in
>> drive_backup_prepare(), where we take bs->open_flags of source.
>>
>> It works rather bad if source was added by blockdev-add. Assume source
>> is qcow2 image. On blockdev-add we should specify aio and cache options
>> for file child of qcow2 node. What happens next:
>>
>> drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
>> But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
>> places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
>> as file-posix parse options and simply set s->use_linux_aio.
>>
> 
> No complaints from me, especially if Virtuozzo is on board. I would like to see some documentation changes alongside this deprecation, though.
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi all! I remember, I suggested to deprecate drive-backup some time ago,
>> and nobody complain.. But that old patch was inside the series with
>> other more questionable deprecations and it did not landed.
>>
>> Let's finally deprecate what should be deprecated long ago.
>>
>> We now faced a problem in our downstream, described in commit message.
>> In downstream I've fixed it by simply enabling O_DIRECT and linux_aio
>> unconditionally for drive_backup target. But actually this just shows
>> that using drive-backup in blockdev era is a bad idea. So let's motivate
>> everyone (including Virtuozzo of course) to move to new interfaces and
>> avoid problems with all that outdated option inheritance.
>>
>>   docs/system/deprecated.rst | 5 +++++
>>   qapi/block-core.json       | 5 ++++-
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> index 80cae86252..b6f5766e17 100644
>> --- a/docs/system/deprecated.rst
>> +++ b/docs/system/deprecated.rst
>> @@ -186,6 +186,11 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
>>   instead.  As part of this deprecation, where ``nbd-server-add`` used a
>>   single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
>> +``drive-backup`` (since 6.0)
>> +''''''''''''''''''''''''''''
>> +
>> +Use ``blockdev-backup`` in pair with ``blockdev-add`` instead.
>> +
> 
> 1) Let's add a sphinx reference to https://qemu-project.gitlab.io/qemu/interop/live-block-operations.html#live-disk-backup-drive-backup-and-blockdev-backup
> 
> 
> 2) Just a thought, not a request: We also may wish to update https://qemu-project.gitlab.io/qemu/interop/bitmaps.html to use the new, preferred method. However, this doc is a bit old and is in need of an overhaul anyway (Especially to add the NBD pull workflow.) Since the doc is in need of an overhaul anyway, can we ask Kashyap to help us here, if he has time?
> 
> 
> 3) Let's add a small explanation here that outlines the differences in using these two commands. Here's a suggestion:
> 
> This change primarily separates the creation/opening process of the backup target with explicit, separate steps. BlockdevBackup uses mostly the same arguments as DriveBackup, except the "format" and "mode" options are removed in favor of using explicit "blockdev-create" and "blockdev-add" calls.
> 
> The "target" argument changes semantics. It no longer accepts filenames, and will now additionally accept arbitrary node names in addition to device names.
> 
> 
> 4) Also not a request: If we want to go above and beyond, it might be nice to spell out the exact steps required to transition from the old interface to the new one. Here's a (hasty) suggestion for how that might look:
> 
> - The MODE argument is deprecated.
>   - "existing" is replaced by using "blockdev-add" commands.
>   - "absolute-paths" is replaced by using "blockdev-add" and
>     "blockdev-create" commands.
> 
> - The FORMAT argument is deprecated.
>   - Format information is given to "blockdev-add"/"blockdev-create".
> 
> - The TARGET argument has new semantics:
>   - Filenames are no longer supported, use blockdev-add/blockdev-create
>     as necessary instead.
>   - Device targets remain supported.
> 
> 
> Example:
> 
> drive-backup $ARGS format=$FORMAT mode=$MODE target=$FILENAME becomes:
> 
> (taking some liberties with syntax to just illustrate the idea ...)
> 
> blockdev-create options={
>     "driver": "file",
>     "filename": $FILENAME,
>     "size": 0,
> }
> 
> blockdev-add arguments={
>     "driver": "file",
>     "filename": $FILENAME,
>     "node-name": "Example_Filenode0"
> }
> 
> blockdev-create options={
>     "driver": $FORMAT,
>     "file": "Example_Filenode0",
>     "size": $SIZE,
> }
> 
> blockdev-add arguments={
>     "driver": $FORMAT,
>     "file": "Example_Filenode0",
>     "node-name": "Example_Formatnode0",
> }
> 
> blockdev-backup arguments={
>     $ARGS ...,
>     "target": "Example_Formatnode0",
> }
> 

Good ideas. Hmm. Do you think that the whole explanation with examples should be here, in docs/system/deprecated.rst ? Seems too big in comparison with other deprecations


-- 
Best regards,
Vladimir

