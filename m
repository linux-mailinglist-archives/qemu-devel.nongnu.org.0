Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16B36B981
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 20:57:18 +0200 (CEST)
Received: from localhost ([::1]:51836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb6Q1-00076O-Jb
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 14:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb6Ox-0006Mo-RT; Mon, 26 Apr 2021 14:56:11 -0400
Received: from mail-eopbgr30119.outbound.protection.outlook.com
 ([40.107.3.119]:60485 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb6Ot-0001Ic-Th; Mon, 26 Apr 2021 14:56:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa/P+4Ye0ZxQOF0xnnR5t5mrbINBIIRgFizT9VKdEQDByIOno2xTBHWyH9CrsSXNg2r+mPoKPHFRKVdWTD9SVkwAtgagDt7jXbw4wBGmpPIIavzkS5gSIhZnmaUTrgb+S5i6UdzZ06TT3Cs0RGBk8SXQOzXxhrVPHDa5Q3r2rZvLOxz4xu6M+jagSjGD4fiJj123L6S7IXjlnox2baE9SUx57+b6ReKldQSoDBWRwoNetkRj1uRMLgxlkfZ6Vqz7FZrQQ+lCHQmVBiXEZYn7XeCDtPCCrA03/pWX6OtkCo8EVX72+Is1hoe1M0sN8BCfV6aJ86H2JIEouk1PgbMDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KirKOTaD4pQ4yAzz0GZh9g2Z+waSKptSxb4t7rV5vKA=;
 b=lmUjYLtwuiRx2glCVl84pIZcsOrS+9KN/CrOpisIHPWrWJ2mbiI2mFbIrRv/otEimh4TI3zLT6LnWCbeugYSzgWowd1U0OHfQDegrcBB/Yv2ZkiveKuAc4Yi1fWz+foPWjBMuhQVwEA6tNZ33+SLIoG/sZACvypuRjE/No2ghFwvJv+fndGIu0yOrwsDIdkMXRAeddNLIEQ1lXHXExrDE3dl7Qlz9lchhzxi2YNy+Vlr8jYcJu9bGdNuks6iqRMG+/yVsLkqECR0ZMxgWcMuNfvmwQ/vQKpsp/Z13tiw4HznAHmc1FRrLW26bEi18m7SsWDh1osWzY0LH0vHasqwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KirKOTaD4pQ4yAzz0GZh9g2Z+waSKptSxb4t7rV5vKA=;
 b=D1DO0IK/K57Xl2UluTJlS4MhTvXD1hYDLisvnBn4x3PaR/lEogH+t11iyicxYx8qqnAdxIt5waykbuNtmmSARS4+SivxMc6Ar4z5fjEd2UWDk1Qwt6Sht5qhuOSCDieIPrwz3uc0tdinrIphvheflUtggChQZ9th4tmxRwY+uuA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4786.eurprd08.prod.outlook.com (2603:10a6:20b:cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 18:41:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 18:41:02 +0000
Subject: Re: [PATCH] qapi: deprecate drive-backup
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-block@nongnu.org, kchamart@redhat.com, kwolf@redhat.com,
 pkrempa@redhat.com, libvir-list@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, nshirokovskiy@virtuozzo.com, den@openvz.org
References: <20210423125900.3640-1-vsementsov@virtuozzo.com>
 <9a0e7805-c6ae-b55f-431c-4c61a1ab746e@redhat.com>
 <cc17a05f-c563-03cc-4e32-91b41fa87b46@virtuozzo.com>
 <YIcA9WSSk+mATNbC@redhat.com>
 <03c2bb38-561d-df2f-80cb-61838fa10d4f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a724c7c8-96e4-abea-6d83-379e84768df7@virtuozzo.com>
Date: Mon, 26 Apr 2021 21:41:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <03c2bb38-561d-df2f-80cb-61838fa10d4f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: AM0PR02CA0125.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 AM0PR02CA0125.eurprd02.prod.outlook.com (2603:10a6:20b:28c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Mon, 26 Apr 2021 18:41:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37f57d43-ffe7-46c7-60c0-08d908e2d762
X-MS-TrafficTypeDiagnostic: AM6PR08MB4786:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47860B62D324A12332ED8E08C1429@AM6PR08MB4786.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IKxTghKPXgMqpsKbQu+6ah7+j5m58pLAxTrAMuFuGMQS94A6lliC4CcOJ3EU+hqBZI22Rs7LMachtG/aQfhk6qxbkJPgewAuaiY31IvvGypcz+hvkqrE2y5XqJtFCFE/LFN2Qq3RP0kvllFe4ITIur+l3HTvMUa7mrYL4TrqueegrdytjCq9/zfjrZfbxhcrTkOlVsdQYTyulZKZyjxuciIUaBn2hPZ4DNPckmFkwTUP0MzRPy5TWYd7Q35xA3/3t/O9ah+oq10CrKNn/2lFfHPpNzNsGVmUvHUVxy/ooJ5uB4bEUiJcevaYLc0wB5bbwo9cxP6oxLsU2EkG6dPTWUtawlGY+NQufNhgawExPsFQJzBNCxc0Aup+UtM3t6gEiIRWRoGkYiCj/arge/ewNlMaRxe4p9FlQfaBARmTvoMR+eWNGf8gAVYE0pCUMR4oXjeaXcertdTSyT8BWgfzqVMiK4qQwkZDqx9ithTS0s2W+tNSERmw8oyUNUlZntNRaotWavSgKFh6w4/UsluBGhx9CmVdT1loTHB80twlOs35MrMafsj4DpMYY5pGTF/D/YUOhVpFrZ60NDaU3h6rFNsD4SLnI5xKo4Jd2MBNbzQ5EZ9K9/5hLDvnc2C7YKoJVLA/jl0BuPbKBU+tSAKi9DO9j0tceXRnF51Mea0usEFWhOGuB2C5HDQ9S+mLFVqyYL7Zb0bOXT2IYCBcbRjJw55kEJy0cHGYV3JnCF7IkoDH9LWW5SxKxWJ7FUp52lNO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39840400004)(8936002)(16526019)(53546011)(186003)(110136005)(31696002)(16576012)(86362001)(52116002)(66946007)(66556008)(26005)(66476007)(5660300002)(316002)(2616005)(8676002)(31686004)(83380400001)(966005)(4326008)(38350700002)(36756003)(478600001)(38100700002)(6486002)(956004)(2906002)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dldjSHpjcWh5MGd2TEg1SlJpZnpSWU5UVzNjS0dCMjhHeDdBRnRRejBQVmpV?=
 =?utf-8?B?eDBiT0RCTUZ2YjRSb3lNOE9XRjB2Uk50ell3blE4LzEwVUlnVzc4bEFCN0dv?=
 =?utf-8?B?NVJUVlpNSm5tb0JKWm95R1ZseVVFT1RpY2JBZXZCUkRCb0RjdXN6NDZnMHpY?=
 =?utf-8?B?TW5Eb2dPM25FRnBBMkZReFhURStnM1lyMzVaQUhsQWZaVXBCRmFjYytCbEF0?=
 =?utf-8?B?c3AvaEFZUmQ1MHdjdE91V2RpYnNGUG0reGdJaDIrNGl1MXMwQ3RiMmNYazhM?=
 =?utf-8?B?SzFKeUtJclNObklXcmM2NjVsUTBvdlc0Y2czUFNoQkl0dU5zYk9ZSDdDMmN1?=
 =?utf-8?B?QTR1Zlg4YVV4Q1VtWWhhSmNwU05ROExMMG1YOW5YY2ZzNE1UYmlrbDRHRWpH?=
 =?utf-8?B?eE82bjRUOGQrVDc1Tyt3WEJQc2F1MW1nS3pVbzhBM1dsTmpvUlVSQW1CQjQ2?=
 =?utf-8?B?SDR6RndSTXZLcGo0VDlWR2UyRTJjNnJaUlRvdFFpZzJJcXoyQm4xaE1zakNt?=
 =?utf-8?B?R1pnUGJtNE9TclMyVUtvTUIyRmMybXFqSGdiMDJHVjZNNlV0UWpwZ3hwdHRL?=
 =?utf-8?B?UmNvdzAwOU1RenpYKzFoREdndmdpT1dWUThIM3B1eEJrclpCVEYzSW1wYU9Y?=
 =?utf-8?B?OExPZ0ZDZStEc3M2MjNLK2Q1OVM2Z1B4K3RpVVJjdXhYQXIyam9YY3hjM2Rr?=
 =?utf-8?B?cWhZTGYyVXFWQWhZTDBhTmVJajVEWTlyMGR4TGhlSktiUEttVmVNdldsZktU?=
 =?utf-8?B?clhzYjBjTmN4MGdHcnZiTVVlWmZQN3h3eEx5ZGpvY1I1eXh3MlY5RGVSeStj?=
 =?utf-8?B?dlFTTkVCeVVoZnJqOWcyV2k4M0crVTFpYllYMEZUTzZxS3FiY0hHYkFSVG00?=
 =?utf-8?B?aGp5dkZPdHZOaGE4cktBNXFPYUhUSHR6ZjBFdXV5ZGF3eDJ3TUEvMFYvZUl1?=
 =?utf-8?B?eWhvaHhBSzRFT3AvMUsxWVRndVRoSUJ5ckhoY3FpVGtsbzJJZHF0NmxTQ3Fm?=
 =?utf-8?B?SHVtdWJCU25uSzVzN3REdWRxRDZhSTRtYitKNFFsOFNvQnVXOE15Yi9YS2Za?=
 =?utf-8?B?L20rMVhDTjVlWS91dnRiakdKNzVzOXVzV0cxaEJjVEl5NTN6ZGdPUDhoU3h2?=
 =?utf-8?B?VGsyeWYzc0xiUlVlNWFBU1pMa2xwa1NCTmltY2lIaklKSXYxcG9DdEo3MVBh?=
 =?utf-8?B?dU5YakF0K0hFUmwyMlVuaEhQL1REcUlQNDJEREw1d0FscXFCMWsxR09OQk9t?=
 =?utf-8?B?eWdEV1ZieWhyRGI1SldrUXV6Y2ZtUU9XNUxMNmo1UmxYdHdLK1BYNUw4MUxx?=
 =?utf-8?B?NlZyMHZ4QUNubzFrUVA5UkNucjJURGR0OTBMMEhjeXRudmxDZHd1V2NOQlBK?=
 =?utf-8?B?T0VjT2hKZGVqcDZDbVF3KzduSzUzbjJFTUVOTWdxaHo2M1JDaTNBaVlBNUpo?=
 =?utf-8?B?QXRwSDc2UkxMeHRablNMcWlMNGZmeStEQkgxNVdvSlJFWERUbVcyZVR5TGw1?=
 =?utf-8?B?T0d2K1dzelBwNER5bnN3OWgzNGxYcFFicVFOS0hvNDIyNHhWQXlPZHNicS9Q?=
 =?utf-8?B?VzFpdndhNElBcWR4a0YzZ0xwVHh5cmI1RVFiN1NwMXdLRjZHUUdLUVdpcTR6?=
 =?utf-8?B?dDhBcFFZR09HakdLVjR0VFRtQlpKU3pyN0QwdUpuYVNwQ1ZrenNESThDVVRr?=
 =?utf-8?B?bXh4WVViMnpIV0pjNmZkdXNaK21XaUtHenE0b2RsK1ZhV0VBNFpUWERoNEpx?=
 =?utf-8?Q?8mQ2Zp1duCX2TdgN+dasZJXv8XHuc+pw8EfEiEz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f57d43-ffe7-46c7-60c0-08d908e2d762
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 18:41:01.9905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMIsDj0qsFAEBNUuUvewa5yhbp72cQTKx/L6wfotvtX6PkZVWDYw039BWlblu6RMSs1gVporIC+Rk62H1ZIZnod4IXO+Wiy6oSD0DfJrkcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4786
Received-SPF: pass client-ip=40.107.3.119;
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

26.04.2021 21:30, John Snow wrote:
> On 4/26/21 2:05 PM, Daniel P. Berrangé wrote:
>> On Mon, Apr 26, 2021 at 09:00:36PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> 26.04.2021 20:34, John Snow wrote:
>>>> On 4/23/21 8:59 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Modern way is using blockdev-add + blockdev-backup, which provides a
>>>>> lot more control on how target is opened.
>>>>>
>>>>> As example of drive-backup problems consider the following:
>>>>>
>>>>> User of drive-backup expects that target will be opened in the same
>>>>> cache and aio mode as source. Corresponding logic is in
>>>>> drive_backup_prepare(), where we take bs->open_flags of source.
>>>>>
>>>>> It works rather bad if source was added by blockdev-add. Assume source
>>>>> is qcow2 image. On blockdev-add we should specify aio and cache options
>>>>> for file child of qcow2 node. What happens next:
>>>>>
>>>>> drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
>>>>> But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
>>>>> places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
>>>>> as file-posix parse options and simply set s->use_linux_aio.
>>>>>
>>>>
>>>> No complaints from me, especially if Virtuozzo is on board. I would like to see some documentation changes alongside this deprecation, though.
>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>> ---
>>>>>
>>>>> Hi all! I remember, I suggested to deprecate drive-backup some time ago,
>>>>> and nobody complain.. But that old patch was inside the series with
>>>>> other more questionable deprecations and it did not landed.
>>>>>
>>>>> Let's finally deprecate what should be deprecated long ago.
>>>>>
>>>>> We now faced a problem in our downstream, described in commit message.
>>>>> In downstream I've fixed it by simply enabling O_DIRECT and linux_aio
>>>>> unconditionally for drive_backup target. But actually this just shows
>>>>> that using drive-backup in blockdev era is a bad idea. So let's motivate
>>>>> everyone (including Virtuozzo of course) to move to new interfaces and
>>>>> avoid problems with all that outdated option inheritance.
>>>>>
>>>>>    docs/system/deprecated.rst | 5 +++++
>>>>>    qapi/block-core.json       | 5 ++++-
>>>>>    2 files changed, 9 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>>>>> index 80cae86252..b6f5766e17 100644
>>>>> --- a/docs/system/deprecated.rst
>>>>> +++ b/docs/system/deprecated.rst
>>>>> @@ -186,6 +186,11 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
>>>>>    instead.  As part of this deprecation, where ``nbd-server-add`` used a
>>>>>    single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
>>>>> +``drive-backup`` (since 6.0)
>>>>> +''''''''''''''''''''''''''''
>>>>> +
>>>>> +Use ``blockdev-backup`` in pair with ``blockdev-add`` instead.
>>>>> +
>>>>
>>>> 1) Let's add a sphinx reference to https://qemu-project.gitlab.io/qemu/interop/live-block-operations.html#live-disk-backup-drive-backup-and-blockdev-backup
>>>>
>>>>
>>>> 2) Just a thought, not a request: We also may wish to update https://qemu-project.gitlab.io/qemu/interop/bitmaps.html to use the new, preferred method. However, this doc is a bit old and is in need of an overhaul anyway (Especially to add the NBD pull workflow.) Since the doc is in need of an overhaul anyway, can we ask Kashyap to help us here, if he has time?
>>>>
>>>>
>>>> 3) Let's add a small explanation here that outlines the differences in using these two commands. Here's a suggestion:
>>>>
>>>> This change primarily separates the creation/opening process of the backup target with explicit, separate steps. BlockdevBackup uses mostly the same arguments as DriveBackup, except the "format" and "mode" options are removed in favor of using explicit "blockdev-create" and "blockdev-add" calls.
>>>>
>>>> The "target" argument changes semantics. It no longer accepts filenames, and will now additionally accept arbitrary node names in addition to device names.
>>>>
>>>>
>>>> 4) Also not a request: If we want to go above and beyond, it might be nice to spell out the exact steps required to transition from the old interface to the new one. Here's a (hasty) suggestion for how that might look:
>>>>
>>>> - The MODE argument is deprecated.
>>>>    - "existing" is replaced by using "blockdev-add" commands.
>>>>    - "absolute-paths" is replaced by using "blockdev-add" and
>>>>      "blockdev-create" commands.
>>>>
>>>> - The FORMAT argument is deprecated.
>>>>    - Format information is given to "blockdev-add"/"blockdev-create".
>>>>
>>>> - The TARGET argument has new semantics:
>>>>    - Filenames are no longer supported, use blockdev-add/blockdev-create
>>>>      as necessary instead.
>>>>    - Device targets remain supported.
>>>>
>>>>
>>>> Example:
>>>>
>>>> drive-backup $ARGS format=$FORMAT mode=$MODE target=$FILENAME becomes:
>>>>
>>>> (taking some liberties with syntax to just illustrate the idea ...)
>>>>
>>>> blockdev-create options={
>>>>      "driver": "file",
>>>>      "filename": $FILENAME,
>>>>      "size": 0,
>>>> }
>>>>
>>>> blockdev-add arguments={
>>>>      "driver": "file",
>>>>      "filename": $FILENAME,
>>>>      "node-name": "Example_Filenode0"
>>>> }
>>>>
>>>> blockdev-create options={
>>>>      "driver": $FORMAT,
>>>>      "file": "Example_Filenode0",
>>>>      "size": $SIZE,
>>>> }
>>>>
>>>> blockdev-add arguments={
>>>>      "driver": $FORMAT,
>>>>      "file": "Example_Filenode0",
>>>>      "node-name": "Example_Formatnode0",
>>>> }
>>>>
>>>> blockdev-backup arguments={
>>>>      $ARGS ...,
>>>>      "target": "Example_Formatnode0",
>>>> }
>>>>
>>>
>>> Good ideas. Hmm. Do you think that the whole explanation with examples should be here, in docs/system/deprecated.rst ? Seems too big in comparison with other deprecations
>>
>> No, the deprecations entry should be short.
>>
>> If the replacement is so complex that it requires us to provide examples,
>> that's a sign that the replacement is insufficiently documented in its
>> own right. IOW, add all this docs info to a suitable place in the main
>> QEMU documentation, and just link to that from the deprecations page.
>>
> 
> Agree with Dan, keep the deprec section short.
> 
> Perhaps we can add an example to the live block ops doc that shows an example of how to transition and link to that example from here.
> 

OK, will do


-- 
Best regards,
Vladimir

