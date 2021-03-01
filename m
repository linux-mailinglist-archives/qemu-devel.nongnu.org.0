Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D934B327DBD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:59:32 +0100 (CET)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhD1-0004c9-TU
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lGhBd-0003wE-Vs; Mon, 01 Mar 2021 06:58:05 -0500
Received: from mail-eopbgr10091.outbound.protection.outlook.com
 ([40.107.1.91]:41625 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lGhBa-0001kD-Bo; Mon, 01 Mar 2021 06:58:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4FFEVrd9lM5Pw1KkDa9FiVD2/T7zkAaNZWnDNRYJax1oR/XN1mNQSyQakzXpnV7t2z1YBzTaODs/RXVwoYkoh2CryyHsZYKu9i0839O+D+TmDxjLV8BFibKH/+fVa8ShnQ6+UHy0w+FV3NBLhQKqUXvVEy9hbWn+CIZTfJrynCardldzfD4yITobd1+ykpTe8Hn+bakkfh2yw5PGs2OaiRgfwA8EsBADUvc079ORdrN4jQsqbZV0Wd3l/rWd8fyawclfK9KDaUwbge3/mC/E9q98v6yyVfvtGiLGrAFrqAU6Vkvtb3XE8eMkBzF8/yGUcVLL0wkwrvi4uUKdMqB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8Rbpa1YbCGBJcJxAAxWMi9OGfC9GQK4DDeKXndsJoo=;
 b=DbFdNqejGyszUwkDmFfV6NaCw3F4YFmLfHCNh5gmTDiol9bI8077CssMdLuP+wlmZEf0QOELsa+H/sgQV6+K9EIWV0YVksvLCEa124zD5cVhMquza6AoGvq0c9CkbTekRgSS3rwi1oMYP7uMJ31BssgJ5CtW/pGJHhDvYl4gOVg1ydbutQBm4ZUMjj7kDzaYHrJmb9yfea+QWvZAIW62fNbMrTjQIzP8Rd72GnNLfJs2omk71elrj2JBJ67luHSDfwWmX6aUVBMFuvj5KF1wnz9Nga8FV83Zbgj9Mv1EQ520LrzmkgXN+doEACFfMGRGqXyFSPpNQe665p+Rv3vYNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8Rbpa1YbCGBJcJxAAxWMi9OGfC9GQK4DDeKXndsJoo=;
 b=b8eYcoknfV36+dta0BRJt0vRMdsqOAmkiZcXeaZZ+TFtMZm4EJGgtbQCpGahDHMegKfl0Xv0OONMIeZGjOG7XD4t2lGh4aY5sjU0KP/m3NPs5EAln7Fhiz4/7qQocVFiRqj+KSGbdPYduIo6e7G8pDr4HgAg57jHPpU8DbzegOM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 11:57:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 11:57:57 +0000
Subject: Re: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
To: Kevin Wolf <kwolf@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>, pkrempa@redhat.com
References: <cover.1612809837.git.berto@igalia.com>
 <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
 <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
 <20210224123305.GA11025@merkur.fritz.box>
 <05d57ba7-684b-a897-5e7e-1ebb6350ca31@virtuozzo.com>
 <20210301110726.GC7698@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bf8ab05f-13cd-c323-b9b6-e449f744a83c@virtuozzo.com>
Date: Mon, 1 Mar 2021 14:57:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210301110726.GC7698@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::11)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 11:57:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76943153-bd01-490f-1b09-08d8dca940f2
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50779851C547F89172EAA9A2C19A9@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXq6W5kfcCLL+VkcLa1nA88xIBPrs0wkgbEUYEXVCLAHhPpk23ul+7+b7cohQ5wqCI+jeso8yFr3m3hAcIGNMW+EE7vnHTbKq0LRix1mUQIQRAa1s67avJFAqMJDow5IY7GSOwZVDpLgLwv79OLJY5jhxUIeIAYQPFBovzKaHysiLIqJl1GPdgFpCWUo1FNQFRpEa3t8zxSFKkQ8EkgsFz8S9dM3ss6pxR8MGitskV54XwWQP4laqoT/vrgtMEiwQGXMJfuSDLkoXkCffpqbQWkbdcaFoJxrSc2Y9H354kyB61pNOLqZmRZ+B0LcVI4vTh8gDLTMUggXYKGQMcaRjT6Gp23lNDF8sA0VOghD0tIXVxYecTpHtC0AdM1UKvaRVnzFaPCYru13YiTKvooLDC0Hfr0shd5u8+ditKV/Ozg18MJF7stdzRGKK7haWaRo2lukls0WEGwchFE+pXu4AjhC0blbwAdIhRCzWrLUxcJGUBMdpHGxZQu5gTL6kWbYSsyYz47ltTGeNzq/2c7ybG6ZBtFV+nE57XeiyT5hg80wcEkHhLMWRsXKLGvFarCQKflAkTPxr+/cs0TEi3KIIKaCr5sDXHdK8F7rlAoF7Ro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(376002)(136003)(366004)(2906002)(36756003)(31686004)(16576012)(6916009)(83380400001)(6486002)(316002)(54906003)(956004)(186003)(8676002)(31696002)(478600001)(16526019)(26005)(5660300002)(86362001)(2616005)(66556008)(52116002)(8936002)(4326008)(66946007)(6666004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWRTb1c2ZERHUHc0akxvOC9uY1VXbFV0Z1haMTdMb3VYRnQyc1QrMEFrUU50?=
 =?utf-8?B?cnV0bWhRcU5pZ1dHV1JHR3JibHQ5S0VXZkM3TWRQWk5RclpHWkcyMzRLR01n?=
 =?utf-8?B?ZHcwV0hsODc2ODRQZjVUVDNMZVNqY0tZaUxHaFdKQkE2aEZmVlZ5SzhMQ044?=
 =?utf-8?B?K0hHM3BhK2VwT0RiVWpjQ0pVdXFtZG1vVEUvS0cvdlhleXNOblhXanQzUWp1?=
 =?utf-8?B?NC96eWxqeUpwUjVwTzhBenhEMHBEYk5rd01YaTZ1bStCQ3ZnNjNWZmIxK3Zp?=
 =?utf-8?B?aE1KVjFmRVhzMGl0cHR6cEFVMURyZU53WkVWMFVzQm9uWHhHeHExY2QvM1pl?=
 =?utf-8?B?c3BJaXh4NDNGM2llalZka1E5WWF2YkhLcmdUQkpnalNJSm1aWFVYTzhvY0hq?=
 =?utf-8?B?S3hOZ3BNYnVkODRNM0J4clY2ei92OHU5REVtWmJuN1dXaFk5MjU4NERxbXBN?=
 =?utf-8?B?ZkFPZmxyWnVob2ZwTi9CWW8zT1Z1K3NURitDcXdSMm9UUysxSHNiQXNiTFMw?=
 =?utf-8?B?Y0NrK2V4dFNKaHhTWW9seWxMdXUyYjQ5eUZiWnBVTm5DSmsyUjJYZDl0K0JD?=
 =?utf-8?B?bDhWa0gxRGlVQ3ZnZ1RaU2wxbHg2MVI4UzRjc1kvWm9UNG1DampyNkcrSUhh?=
 =?utf-8?B?UkFEdGxrWm9lZ1o2V0xyeDBrS1BpdnVEOU5uZ2NTQmR1RWRMQnl4V0h4MEcw?=
 =?utf-8?B?TTJsUTViS1VqdGxiV3RwWkxhR2J5WjZNdlFpd2xrTnM4VFEvV0pOY0cwOGJs?=
 =?utf-8?B?aWRFOUR4UFNUeTJNSXVheFBjbE1TVEk2MlJobGVjUTd2dlVPNkZOVGQ1MG9T?=
 =?utf-8?B?TmxPYk0zVHMyOXl4aUFhNGh0eEg2aERXdk9MZ3JXZE03bG55M3FrTmJOMWIz?=
 =?utf-8?B?V3Aza2hKSWkxYnNDcmt2NnEvT0lhRGNIQU0vZGhRZi9CU1FPZkE5U1Z2QzNO?=
 =?utf-8?B?ZjNJRnNEdjdHaU0vK2VwWmM1cWZud0I0aWNmOVRzWWZyRHU1R1BTMEsvZzMx?=
 =?utf-8?B?WGNKbXFIYXZMUkJBNTIxaUtIa0htZGI0OU5jZ1pwcnRLUGI0YmhiNkxxb0ta?=
 =?utf-8?B?OUMvK1AxVnlSUEhwL09iRFB5MG1zenBuLzc2MTFXckR4YUxEdXBiTlVzQmFO?=
 =?utf-8?B?Y3MrMVI4WHB6aU91UGJIbzlyUVJhV09ZZUFVT084YjJSRU0xRVV0NXZTRHU0?=
 =?utf-8?B?Sm4vY3p4d1VOUStrbVhJV2lrTlhtSi83eEtqb2NPL1drWkVYQXk1eVZMdkZU?=
 =?utf-8?B?VXdaUnRJaDJDQWRGNFVpbloxYzloNE1wMm9NT3hZNTVZamd2dGxGNkQwdFR4?=
 =?utf-8?B?K3g3amdPZTZIT0RPbU5hc3ovd1FWTnlSY0NSK0NpV3owbkpnK2pUQmtzNnNF?=
 =?utf-8?B?RStpQmUrU0hSVmFlWmV2b3ZRWGpScmY1aDhPcGVZUlI5T2ZMUTFDQ2dySU1w?=
 =?utf-8?B?NnpNQVFURzMwTTloSzhqRTg0NE95WlI2bCtyVFdYYVRVQlh0TW15T1hNK21Z?=
 =?utf-8?B?eEo2b09xSHJLK0RRY050ZUZ5U3RreVZxYWkrWkJJM2d1c1JFa1hOajVMeVRw?=
 =?utf-8?B?ZlBickhLVjVZTTZ4amhVQWFObFVQck5FaS9sVmdibk9VZnh2WHJxWGg2R2hh?=
 =?utf-8?B?ZG1WRWlibUhibGZTZXkrRDZMOC9UVFRlTmtuTjRWNFBKdTNaclBKZGlGd2Nr?=
 =?utf-8?B?eE02djBoK083M1R6YUo3TG91UUF2a0h1dzRWc1RaR2NWRW1YdXBpVmM3RlZK?=
 =?utf-8?Q?LN2kDaWJoeZHqpQULaZFyNoir9GgE6pfwzIbkYB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76943153-bd01-490f-1b09-08d8dca940f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 11:57:57.4169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wh/BAMkb4BYMzBr/CZJD+J7b5Y+iUUhut4hqS3x8ShJyl0zjdHZEtFXmWSCLVENzoee3ze39rIfYPdaNGY7QWMmeSVv8IWl0dx0btwTlPTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.1.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

01.03.2021 14:07, Kevin Wolf wrote:
> Am 25.02.2021 um 18:02 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 24.02.2021 15:33, Kevin Wolf wrote:
>>> Am 09.02.2021 um 09:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 08.02.2021 21:44, Alberto Garcia wrote:
>>>>> Signed-off-by: Alberto Garcia <berto@igalia.com>
>>>>> ---
>>>>>     qapi/block-core.json       |  2 +-
>>>>>     include/block/block.h      |  1 +
>>>>>     block.c                    | 16 +++++--
>>>>>     blockdev.c                 | 85 +++++++++++++++++++++-----------------
>>>>>     tests/qemu-iotests/155     |  9 ++--
>>>>>     tests/qemu-iotests/165     |  4 +-
>>>>>     tests/qemu-iotests/245     | 27 +++++++-----
>>>>>     tests/qemu-iotests/248     |  2 +-
>>>>>     tests/qemu-iotests/248.out |  2 +-
>>>>>     tests/qemu-iotests/298     |  4 +-
>>>>>     10 files changed, 89 insertions(+), 63 deletions(-)
>>>>>
>>>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>>>> index c0e7c23331..b9fcf20a81 100644
>>>>> --- a/qapi/block-core.json
>>>>> +++ b/qapi/block-core.json
>>>>> @@ -4177,7 +4177,7 @@
>>>>>     # Since: 4.0
>>>>>     ##
>>>>>     { 'command': 'x-blockdev-reopen',
>>>>> -  'data': 'BlockdevOptions', 'boxed': true }
>>>>> +  'data': { 'options': ['BlockdevOptions'] } }
>>>>
>>>> Do we also want to drop x- prefix?
>>>
>>> libvirt really wants to have a stable blockdev-reopen interface in 6.0
>>> because enabling the incremental backup code depends on this (they just
>>> toggle the readonly flag if I understand correctly, so most of the work
>>> we're currently doing isn't even relevant at this moment for libvirt).
>>
>> Do you know what is the case exactly? If they do it to remove dirty bitmap
>> from backing image after snapshot operation, probably we'd better improve
>> block-dirty-bitmap-remove command to be able to reopen r-o image?
>>
>> (I just recently faced such a task)
> 
> I think it was to switch nodes between read-only and read-write, but I
> don't remember the exact context.
> 

I already don't think that making implicit reopen-to-rw is a good idea. It's OK for blockdev-commit, but may be unexpected for bitmaps manipulation.

> 
>>> Given that the soft freeze is coming closer (March 16), I wonder if we
>>> should just make this API change and declare the interface stable. We
>>> can then make Vladimir's fixes and the file reopening on top of it - if
>>> it's in time for 6.0, that would be good, but if not we could move it to
>>> 6.1 without impacting libvirt.
>>>
>>> I think we're reasonable confident that the QAPI interfaces are right,
>>> even if maybe not that all aspects of the implementation are right yet.
>>>
>>> What do you think?
>>
>> I think it's OK.. We have it since 4.0. What will we win keeping -x
>> for years? Even latest change from updating one device to several
>> could be easily done with help of 'alternate' if the command was
>> already stable.
> 
> I think your series is kind of important to really call the
> implementation stable. We can always feature flags to indicate the fixes
> if necessary, but it would still feel better to declare something stable
> that doesn't have known bugs. :-)
> 
> Do you think your series will still take a while? Maybe my first
> comments sounded a bit negative because it was really hard to review at
> first without knowing the final state, but after all I think the
> approach is sane and apart from some implementation details, we're not
> that far away from getting it into a mergable state.
> 

Thanks :)

I'm now busy with our bugs for Virtuozzo release.. Still, I hope, I'll have a chance to reroll permission-update series this week.

-- 
Best regards,
Vladimir

