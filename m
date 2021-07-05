Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1FC3BB946
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:28:51 +0200 (CEST)
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JyE-0003am-Mk
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1m0JwI-0001e7-QW; Mon, 05 Jul 2021 04:26:50 -0400
Received: from mail-vi1eur05on2092.outbound.protection.outlook.com
 ([40.107.21.92]:14527 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1m0JwD-000358-RE; Mon, 05 Jul 2021 04:26:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSYWKS+F0pZb/enjkvGQleONOHqU4qpMsrIMeMn0cMeF7srq9xLbAJfUK6Ry7xNdqhbciZrF1r4Amw0JIJ2nhVAb5k4VIZePMf8Mw/xLHWj2waegUPk3Otg3lvegJg7te+SuR+aaWesTeEHKAFVC94NW0gqXjBHd9GHgiRgZHsZdIr7nrnMOCKZ9ebiRNA6uX1RtQ6S3hjZGdjO9RdFyvbArNhgBMODJ16FTpSdpwM7bVJjDzwZCdNgWNAjDaXA2P8SBGn97mi1c4XEg3YVQ6hoNp/xmH6532hxHjLENJSOCdysurrqLRJIyE4Rl9W038OxwPftETA54UtLuRS49BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jmdo6RtWGEwXKUN3zdC2qqzR4gbIt8bDBHZ93XP3vA4=;
 b=Nc3D/F9E9MCZVanWlX2hygeIzsIjxlPd3Zeyj72lJglmXsSLcwlnKBy5n7bhYCTXjfQX6Jq+mTOeKWBAaglMlyBoj888vMYRogDk6Y0Vp+PuMTcunPC6py0Y+dvcLKdqeMAUmX2HjDHHGK4erEQAyWpe3YRzZCOLsX69LA27vnAsaNKyR0t+rvKbchiFkCRYuw1KdPAf8nUOLAmlgyWW6RBfJcKpToIlNniCemg1mlcMfCqgL9HaIAkqYMQWhMglo+kz5nEoD5prmx0B36mJXodTD/c3oXmduqPoN7BPHUhK2QCw4bKih5W6T0G1z1ZdRvPRuXae5oiGxsjJGG5zxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jmdo6RtWGEwXKUN3zdC2qqzR4gbIt8bDBHZ93XP3vA4=;
 b=wUp7k69bjes4syuJq8ntatusBlKAOdEswTGGLGF3LrQqhyeh5X6Nbou04wCCwxAiR4AIbJgfej/OtYK9G5fULWDoTFLoGzrxWQUPlsOqkExWx/h4S2pkipIm3is7zKWOgr8Jjc+hddfoN90OYRS8O+MkBQPMIVvNlvcxq75kT70=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 08:26:40 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::95e7:108a:a7:2ab8]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::95e7:108a:a7:2ab8%2]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:26:40 +0000
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nsoffer@redhat.com>
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
 <CAMRbyysqP+by8PrF7WQD4D2R7GXLwya4L1GMm8V8oHPS3AyJjw@mail.gmail.com>
 <712bc1ec-8048-8d65-6328-7270ad121c66@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <6e977d42-3f7f-0b56-4909-6fcca93496b9@openvz.org>
Date: Mon, 5 Jul 2021 11:26:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <712bc1ec-8048-8d65-6328-7270ad121c66@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: PR2P264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::25)
 To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.44] (31.148.204.195) by
 PR2P264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 08:26:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eb12f0c-5c2e-4c81-38ec-08d93f8e9cd7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4280CB2DCCC531066E593E43B61C9@AM6PR08MB4280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzjhqahsfO/H4ilH6T3/abaCq+Y2iCDiZJ5JMFnCt1oRe1b9DqzktjAZ+d/PthgreKmhX0z5DhtBxN+fRgBRzdiaToLkzQmnCV+tjmR7/uVe15qySiCC4kmrkkb5/C7LP1Rf1xHF+Qq9EKPKY8edBk4uGE/73iQ6BR0KZKjVg085bsk8t1uaC9K8CJVrMYq3OCOE6eKVtcFQ7kc++3FOWgYAMlATI7/3NZVXHHGuVe06cr/v9VDQtVOBSKuEOExJbVSJK8r5KDV6vTuIeqzerF7uFUo20q+ecBnCvNJEqSBRKRs9EshpYXL+sgtJRhFASILB3CgKWX/MA+fWxPlRqSKPfuSA4W1483mZZFabhhurJW7tPpqA1UG3lhryQXUWMD8XcDtljRYuLe81EefA50xsLV5RrtCxXSQ1u2/4vHthV+ejew14HQ1og2Wf2B/IWRGdcHCXG6VBVNI1tC1aKW9TxA0GNBc4aioqBCQHfWEZDVaacQR/z04BCNdoZ5hJjwLt2Y2mcE325lm4PkjSicijxGhZVCMTnpI70OHyOkhUZEfT7g6n22NnR/tFDPuVayht3ef47jnnYhOimSMXcwCsCJmtUURAV42MXP4hV/xwa4Ifk65gSDS7PaNbQDEOpL5oC6peB4VLM21p6ffAzW8Yu7/5+n9qzg2ELgkM4mvCPQVQb/qDDP9qF1LbyL0/T34OPB4s4+yrCEqrN2hZPPYk4S0XA/HjXngqTRi3M7nBs/Lcd43wFUFFu3Sy+INmYfJiIl2jk1oz7UbcivEIHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39830400003)(366004)(396003)(26005)(38100700002)(38350700002)(8676002)(66946007)(316002)(66556008)(186003)(5660300002)(66476007)(36756003)(31686004)(16576012)(52116002)(6486002)(16526019)(53546011)(8936002)(956004)(2906002)(31696002)(110136005)(4326008)(54906003)(83380400001)(2616005)(478600001)(83170400001)(42882007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REVUaWphOTh5dnBvNTFOUlV5dXMyVUV3R2ViOS9OTkdpbnNvVnZEdjg5ZVZ5?=
 =?utf-8?B?NHlmVHM3T0ZuMzZuOTlLQlFxYlJyS3FZR1FnY0ZoNnBlTUxpemtRZHlMRmls?=
 =?utf-8?B?NzNkdFp4TjJpd05JUURVRk5tTU1LT09rTzZuRndQZ1lPREZhdm94U1NlWGgy?=
 =?utf-8?B?SW8zMjduNnNnVVJMOVc3bFc0NGtSUGllaUlSa3I3NnVkWGwwZzdLRG1JZUwr?=
 =?utf-8?B?N1NkYnNlbFpiMU1VK1NraDZsRVNwUnA5ZXFnQytORDJ0K1J2U0VrMHNtN0o0?=
 =?utf-8?B?R2tySzRIQzNaaFRYUjhJaDR2bVJCZ1UxcFpKSTVtYlZzdkN1VG9MRW5wUkRx?=
 =?utf-8?B?TFN1dXU0bnMyS3EzcmpiR3JHMVM4Q1VBSTE3c3hSMU9uQlMrUVJNR0xyVHFW?=
 =?utf-8?B?TzZ1Q3hiRGRTd1pZd2JWNDQwdStTZjVsTlFnNGhkZC9tWisrSDFMdlg2UEF4?=
 =?utf-8?B?MExRSklFcWEzb2dwcHM2TVcrbDZoT3NQL25GY0dhK1JZdDNZb3JiVjNUT0Qw?=
 =?utf-8?B?dDRaSEJ3Qm9ER3d1U2x3akJHazdkWmM3NjFxVGc0MU1VV0tndzRneUxPNTRJ?=
 =?utf-8?B?WXhxSUdGNGhNTHd2ZlhlU3VqK3lGK3IwL1NxQVNtOTAyNW94cnE3Z1MzWFJp?=
 =?utf-8?B?YTRvSmViRlNBdWp6Z0VmL0NIc05DdnE0ZjZnMFJhREtmcWltdEtOcTRRUHlB?=
 =?utf-8?B?ZlV6eHBQUmRuQmVzNWQ4YmRRT0ZJVDFqdE9NQ1doNkY0NmxtYVRoanpBYk1B?=
 =?utf-8?B?YTFYT3EydENYMlRSaXBuRlIxK09aTkZyNFVCNlZ6Y2tlZ2NNVDA3c3hUNVJG?=
 =?utf-8?B?R0NYZmxhbG9Sb0lhNjRINzhUYnQrRnFNemZUblZWQXVERUFHUW5ZMHNqdVdw?=
 =?utf-8?B?M3h5RjBGbDIwRzdvNXhjZzYyY0xrUTJXa2l5SU9USU9IUFEyV0RKL01hUTJa?=
 =?utf-8?B?dmdNVFpJenFFMTMwS0czUFBFdTRRalRqNmxFNDZacTBhbkdTRTd3S3ZLVFNm?=
 =?utf-8?B?VUNjd0lzUHFiRW9CQU1aaStHV3M0bWc4dFZJRUtyNGw5K2pPcUhBVUxaODAw?=
 =?utf-8?B?MUdtTlJITjhIWGZUaWhkY2sxRi9WemZnK1RmaWlzRTk1a0Q5M1M2QmxoL0I5?=
 =?utf-8?B?VXk2QUdSUVRrUTZjUDJKbE9jUHo4bTJTeno3SkR2REc1RFhpRWlFcll5Z0lq?=
 =?utf-8?B?TllzWTR1TDZLMnJCQlBSZFduK1FzKzE1cFdhbEVuTlEyeWloMHZYMmlwMDlU?=
 =?utf-8?B?ajFDVkpnaUdRSDhpNmlCeTdWNjFWaVdrM1RRYzF1NzRHN0lBRk1xTDgyYkhO?=
 =?utf-8?B?ZTdGVVdnNnVxeTZmOExDTi9MWU5Dc1lUSnE2ZmsxeUFVMTM2QnY0MTZpS1Ey?=
 =?utf-8?B?cDl3WlZZOEJUc1NlSFNqbVNCZ1FRSURVd0JVR0xsLzQ4ZmYyVFpJMDJUWXpx?=
 =?utf-8?B?RzU3clN6RDZnSjdPU3EzRDhRdjVCSGJhWk5YcTJ4NTlzaTNrMHRjM3lobXAr?=
 =?utf-8?B?cld2RlIzb1B4cmNoYWFldjJWZEVESE51TUp5Nis5V1RFZFhwTGJLanF3R0ZQ?=
 =?utf-8?B?MWVEQnp5clJCTWtQRm9GajZlZzBkbDFLbC9BQkYrVTVUK2xhbVpDYlBGeGtD?=
 =?utf-8?B?Y1ZwSWxnYlBOVG9kVkNVK3FTUDREbXRTUFZoZWRkY3B4Y2xSMmFwWWlCT3RT?=
 =?utf-8?B?YS9GbWhnZHpFWG5xRmhFOFBRdEdnR2ltbUZDK09JZFpwWlNqWUYySjNZb1cr?=
 =?utf-8?Q?mIYGcoRV/K8MTVGSmfdejIV7QhL3Klvc7/ZkniI?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb12f0c-5c2e-4c81-38ec-08d93f8e9cd7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:26:39.9621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kc2yeAxyjewqY4IMFLqnuzVqSA5HSRnhHKXPoxLCj/5ooAPpQjah7OM8+V6IubWBSDuarZIZQ31FQ4o1uzO5Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4280
Received-SPF: pass client-ip=40.107.21.92; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 10:55 AM, Vladimir Sementsov-Ogievskiy wrote:
> 03.07.2021 17:50, Nir Soffer wrote:
>> On Sat, Jul 3, 2021 at 4:51 PM Vladimir Sementsov-Ogievskiy
>> <vsementsov@virtuozzo.com> wrote:
>>>
>>> Let's document how we use file locks in file-posix driver, to allow
>>> external programs to "communicate" in this way with Qemu.
>>
>> This makes the locking implementation public, so qemu can never change
>> it without breaking external programs. I'm not sure this is an issue
>> since
>> even now qemu cannot change without breaking compatibility with older
>> qemu versions.
>
> Yes, that's my thought too. I think, that's enough to say that we
> actually have "public" protocol, just undocumented.
>
> Note, that breaking that compatibility may break shared migration, and
> migration without one host (which may be used for live upgrade of qemu).
>
>>
>> Maybe a better way to integrate with external programs is to provide
>> a library/tool to perform locking?
>>
>> For example we can have tool like:
>>
>>     qemu-img lock [how] image command
>>
>> This example will take the lock specified by "how" on image while
>> "command"
>> is running.
>
> Having a parallel process, that takes locks "for us" is a pain. At
> least we should handle unexpected death of that process. Some
> filesystems may not allow opening file in two processes in some
> circumstances. And it just breaks normal operation with file locks:
> lock should be taken by the process that use it.
>
> Library has GPL limitation of use.

and there are also some important consequences. 3rd party implements
QCOW2 support in a 3rd party way. Thus it opens the image and creates
3rd party data structures for it.

It handles metadata processing etc. Thus once the "locking" library will
be ready to operate, some bits indicating that the image is in use would
be on the filesystem, f.e. "busy" state and thus we would need to perform
the "locking" in QEMU code through a very specific QEMU data structure
creation. The library could do locking first, but in that case 3rd party
code would have same problems.

In general, this is not only QCOW2 problem, such locking is a problem
for all supported formats and thus we come to the dilemma:
- to document
- or to provide an utility
In that case we should provide locking for all "alien" formats, which
is looking overcomplicated at my opinion.

In general, the format itself is opened with providing the information
for all 3rd parties to integrate with. The locking is an important part
of interoperability and thus should be published too.

Den

