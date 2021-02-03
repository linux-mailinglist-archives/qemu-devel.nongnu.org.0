Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5C230DC72
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:17:49 +0100 (CET)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Iya-0005wU-OL
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7IvN-0004W9-7Y; Wed, 03 Feb 2021 09:14:29 -0500
Received: from mail-vi1eur05on2120.outbound.protection.outlook.com
 ([40.107.21.120]:34482 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7IvI-0003V9-Ti; Wed, 03 Feb 2021 09:14:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkhIeQDIct9YB5cFParSHCEgD4edVBUUXGhCXZE7KPHb2tet1Gm0VXz/ixiWBi221xnbrxJYAGoWrtKEbSMSbL6xMBjGgCr3ufb3BQhTx7/Vkx2Jl0BHfaFcArjIHYvmHm4BAMJsvXAVM+qD8QB0mACQngj1GYK7ANtUiy8RwiISSdy5Rn5uCycRBL3T+8bXO2gdWnzm1uc4GA10J5fOt6V5+gKmKbRYoIW7INW1DfKBcJLfbxEVaU18N8ZEV1AdIGtLO2EnZO4TYyMrdcGTE62hBmMtDSaLjNrrggXH1qeV9BToTbACqf80m2EHZILeFRnDhMMWTbwL9PxaFbcXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QnRY11iVa8VYCnaZ7wkx+vBF+WSSMouAwS96Z7dGp0=;
 b=iTWhh8QWNT7WVE1ABAmZeODJrGOsz4BSjKl1Nkqw158d91KuX9jjz6ge1fKRhpbEmzzKXdXk8v4oDC734ZG498CSHgjZu4d1NX3ffC2extiLh9UKDhSUg1JSL1ZOIVReT3VAQM9vJ1/SslP3H7QOhUhHdlzpTMggD8mcq94woNSvCXq5zF13QzZQHQvNuxZSuB5/MLTFnLSJaAdVenoOhCfLbwr3dOV3UbMn8nEbBjlJEHmy5HbPsTeZQ/fN3AYGTbQ62QDmYgIdMzqKNWJ7OksbntLjNDLftMGjjCQPq01mvdYSBQSfa+Gyhr+zxzjKFkR6f5NcHNt/wozYElWgQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QnRY11iVa8VYCnaZ7wkx+vBF+WSSMouAwS96Z7dGp0=;
 b=gvFo19wvxqc/xcbQAZhFPRO2WTwv3APJfrZ28seOk7NBFA3TAq/wz18/UP993O7Drq/Cg6+PoYdcujrM+dXFChzd4Cs2qRysAP0gbDojMhZEPoW1BMgzCHIk0umCAW1mD806m1/H2Tvgo9eiG4qF6bKR89sELDKTpYnmZDfC83E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2610.eurprd08.prod.outlook.com (2603:10a6:203:97::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 3 Feb
 2021 14:14:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Wed, 3 Feb 2021
 14:14:20 +0000
Subject: Re: [PATCH 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistence on destination
To: Peter Krempa <pkrempa@redhat.com>
References: <cover.1612356810.git.pkrempa@redhat.com>
 <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
 <a519d6af-7f24-e9bc-894b-070738008e01@virtuozzo.com>
 <20210203132744.GE54538@angien.pipo.sk>
 <20210203133932.GF54538@angien.pipo.sk>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a096a6ed-dcd6-77e3-b3ab-c5dce31bec1d@virtuozzo.com>
Date: Wed, 3 Feb 2021 17:14:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203133932.GF54538@angien.pipo.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:208:122::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM0PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:208:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Wed, 3 Feb 2021 14:14:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3753ace1-fa34-493d-0369-08d8c84e0007
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2610:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2610B63C508C187DDCF3B775C1B49@AM5PR0802MB2610.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMdLCj3g9LWG3KKHaP7jIX02HzCJG+6xcSbxX4FUgjR45lpweGSM5epSRmTv/ebhWeMvOroQO5m6ub1ZHjqB4215xvzz0/foiiBLSyklYSjqcJBuKKEkdfQzzFOgOcORFsiONLwZbv6IZ+X/aI7Uc5Bjp4csH08a8Wuox2ImmLG9qDtceOVpHKe1JVGkAaKW709AL2kIgUBmIhDsc6VrEJfi66ScI5mvxpgZgnZvCHyMJrEWay9mC4206LHgtK370u7v68hI/olzrufiURnsduQKyQqE+6DRFAWNzdW7HryFCTg6SmhMjlRTD5Xday5V/+wZtkZOrd+4KIvuIYNC+/q1sQKC9Uwhki/bJRNJJ4SP0IEm3kc5W1a+HJNuIMo82dVVO1zZsgnsey4yG3RprjcrwuKwZAwDwQxKurXhgnRtVgtgkg69jrlcbbitxax0VoWRR6QMyHf+BkUdorW1cYW/mPO+i8AZQzKQDR+Kj/dMxldD6jWjJD+m9dM1GbWPclTPl7FdhHs6MupeS7oKmzxA6uD+0olkitg3wjlOXzOaYPA5GfaLpUWzXW8pdoznK1n+LD42NheFuS/kPkEfVswGOe6PB2HNqm/VOlNhN8HRq5Ab7sLC3Aqwpoklfx0l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(478600001)(83380400001)(186003)(8676002)(53546011)(26005)(16526019)(2616005)(31696002)(66556008)(6916009)(5660300002)(4326008)(316002)(54906003)(8936002)(36756003)(66476007)(86362001)(16576012)(66946007)(31686004)(2906002)(52116002)(6486002)(956004)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0w4cjY2Ums4STM2ZnpqUDhhRkN1a0dzSTA3TmF0eE1GMDg2eG93NTRnMFRo?=
 =?utf-8?B?WE5nTXNzV0FIeVpqSzhlSi9sZlRWTWJmOC9DOXhUSzdFeDZFV1dkWmt0MmVr?=
 =?utf-8?B?K2JXaXhBTXkza251Uk83WDl2SDlaL0plWmV6TEdtNXlrTklNZTB2OHJHRW80?=
 =?utf-8?B?N3hXbW52eGtnR0pKdloydWZ5ZTZ5U3JKemZpcHRGSTl4QkY4ZzBMcUVwTWwx?=
 =?utf-8?B?K3hGUThLSk5IZWllcmVXR2N2K3Zycmx1QVdIa3puODFDTEN6YjVDMFR2K1R4?=
 =?utf-8?B?UTMvZFNMQ0YxWG51VjA0Y2xtSXQvSDZ1UWtxVW9UUnBSTnkvcUowSDVQcEJQ?=
 =?utf-8?B?ZmUwaFZ3YjJtU0lFTGZQTXJ2WXNOY0hXazdxd2JrZm13ME9CdnNrM0dQTkVx?=
 =?utf-8?B?bElQczVYcDJCeWJQcjVVSnM2aUdncTRURmdLVGdaWUZ0TUNTdlc1VU4vbFlL?=
 =?utf-8?B?K1BzVUgydVd1dFhrTGQzNE5hVDg5WGxGcnBPSExSd0txVU54aVUzM1RQR2s3?=
 =?utf-8?B?NmVVa0Zvd1h0bjBlZEJFVjF3TDRHLzJ0RTl2VVhSWWNUUVJJM3FxbEpZeWRW?=
 =?utf-8?B?eEdOVDZUZXlpb1BPczBCZUtlc0J0MDltdjlodXJzZXhrLzkra09NSFhnMXBa?=
 =?utf-8?B?aXFldEZFNytiK0N5SGliUk8vRmdTdXFrV2RIRGpsVVFPYXFGQlRxcFczQUdQ?=
 =?utf-8?B?Mm45aWxIU2RkK1FOeURSVGVQZEFUQUdLWWc0b3A0NWd4QlpXck1jRkkrRW5W?=
 =?utf-8?B?WFZJWEJiWWp0Z3JxaHJPWnRUSnB2VGZvVnFSZVFlbEdWM29OMUNlLzZlMnlv?=
 =?utf-8?B?dXBwL254bjZDL0xmVGc0QUFrUGhFaVVGNzJzS0kvSHlSalBzWEZQK1JyYUpW?=
 =?utf-8?B?Z1BzM1J4dFA5dUEyZ3JvVHFKeFczS29zUHhKZjdBdkI5QjQrWmZnMml6L1lX?=
 =?utf-8?B?YS9WSi8wdXozSTFBd1R4VGdFNXlVMzhhbGRkcWppeW05c3c1V21qOTN2Y09k?=
 =?utf-8?B?WEhNRWQxTkFLanhRYWJQWFIwMWREdkJPa0VYK2V5MXBxTzJuUlgrcEZyd2k5?=
 =?utf-8?B?UndKWmRyKy9TR2wxM2JoR2xrUkxLY0VLeEthOVgyeGgvbEtHcTF6c2x6Z3Ry?=
 =?utf-8?B?eDNFVGcvQ1ZwY0RnekFkVWd5VXQrMXFvL3kraEdjWnNEVkQ4Q2U0THdvSjNV?=
 =?utf-8?B?a1owVWwvclRuTkJrTytXS0kydUo3YTFYak1zcm00anNLU0pJNnhyZXJyQjJa?=
 =?utf-8?B?RTJyZ0NDK0FsbEVlakNaYTZMendhbmgrd1FYWW5SbjhZY0Z4ZGFOYXNsSzJE?=
 =?utf-8?B?cDVDMEpTVlFJY2RFV1VnZFNyZHhVQ1hlNUNMWnYrRW5UbjFDN2w3NFdwczVU?=
 =?utf-8?B?WUZEYlhOY0x2Z2N3V3dFOTRVemd3d1AvNUUyVjJ3VEowd291R3ZaY21oMm1z?=
 =?utf-8?B?UkdQUTU2bWZUT2wySjhvSTZxZWJFT05md1hxSTRBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3753ace1-fa34-493d-0369-08d8c84e0007
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 14:14:20.7763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bboVScRFDpCgduKaUM/+1t35YPGzaVRHKeuuZDcy96dXHJcNJJjadxZsU12pe/a/bUgiOeu+WkEMJtXcvtRa1YcS/I+YkD+qGnuhgRdwD34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2610
Received-SPF: pass client-ip=40.107.21.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

03.02.2021 16:39, Peter Krempa wrote:
> On Wed, Feb 03, 2021 at 14:27:49 +0100, Peter Krempa wrote:
>> On Wed, Feb 03, 2021 at 16:23:21 +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> 03.02.2021 16:00, Peter Krempa wrote:
>>>> Bitmap's source persistence is transported over the migration stream and
>>>> the destination mirrors it. In some cases the destination might want to
>>>> persist bitmaps which are not persistent on the source (e.g. the result
>>>> of merge of bitmaps from a number of layers on the source when migrating
>>>> into a squashed image)
>>>
>>> Why not make merge target on source be persistent itself? Then it will be persistent on migration destination.
>>
>> Because they are temporary on the source. I don't want to make it
>> persistent in case of a failure so that it doesn't get written to the
>> disk e.g. in case of VM shutdown.
> 
> To be a bit more specific, I don't want the bitmaps to stay in the
> image, that means that I'd have to also delete them on the source after
> a successfull migration before qemu is terminated, which might not even
> be possible since source deactivates storage after migration.
> 
> So making them persistent on source is impossible.

Actually on success path, persistent bitmaps are not stored on source.

Normally persistent bitmaps are stored on image inactivation. But bitmaps
involved into migration are an exclusion, they are not stored (otherwise,
stoing will influence downtime of migration). And of-course, we can't
store bitmaps after disks inactivation.

So, on success path, the only way to store bitmaps on source is to do
qmp 'cont' command on source after migration..

I'm not so sure about error path. Of course, if something breaks between
merge target creation and migration start, bitmaps will be stored.

So, I agree that in general it's bad idea to make temporary bitmap 'persistent'.

> 
>>
>>>
>>>> but currently it would need to create another set
>>>> of persistent bitmaps and merge them.
>>>>
>>>> This adds 'dest-persistent' optional property to
>>>> 'BitmapMigrationBitmapAlias' which when present overrides the bitmap
>>>> presence state from the source.
>>>
>>> It's seems simpler to make a separate qmp command block-dirty-bitmap-make-persistent.. Didn't you consider this way?
>>
>> I'm not sure how the internals work entirely. In my case it's way
>> simpler to do this setup when generating the mapping which I need to do
>> anyways rather than calling separate commands.
> 
> Similarly here, after a successful migration I'd have to go and make all
> the bitmaps persistent, which is an extra step, and also a vector for
> possible failures after migration which also doesn't seem appealing.
> 

OK, that's reasonable, thanks for explanation


-- 
Best regards,
Vladimir

