Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D74000BA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:46:42 +0200 (CEST)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9Wj-00009v-AZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM9G5-0007bx-9G; Fri, 03 Sep 2021 09:29:29 -0400
Received: from mail-eopbgr10102.outbound.protection.outlook.com
 ([40.107.1.102]:30094 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM9G2-0003HY-6b; Fri, 03 Sep 2021 09:29:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8BTJXFWJPPUwtprWRHNSumvb2hbK1aSZL6K1iVJf0rtP2kLQ/1wDes7pTxXmTHyQnEj9KAVojIYYTF/i7jHrNJZwpD/8S/cXiJ+tebENJi8mCY+P1HNKPUri4OkOdzgyVuLSUQZEnfV/To8zNebznKcNL93ppnkLcKsw1oLA+AcNMrVXTFmwREzH1D0Rjzb+kp5J8XElc3WmvpClTQ6PGWl7EDbvdp/n72y6SneWJ6XW8YFl2xC7Q/qXKi4ewaOZhtztdglKAH0b81G8M2XhiDD+/b4X9E0WPkf9OGuQd7ZsN1jjZycDnhwdkrFqiM5xZvdLmQHR2lrEwr2wgbJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BPiJS6TJ8OUhsx9vB0z9VtTi/d7lgS7KyXs1+QV6DmA=;
 b=W5+WIwrNmStloK/ZA1alWO2ibXaRLDy4gYsf7VXdI+hsQ1q4tcDgl3zpvLvIPRXWqSmtAmLyDaD39FxPRIk64Q4NmPn9O7y21MRt/9J9jWio5OaJW1Bm0751GMKGYswoBQ2x8wrpBeHHuNP+RnJYO4UpPX6DiowxkIdctUSDNfuzugNIDUFO8+74goLtNYuspUfOluRThAyZB7+/GR4wK9FMMWRQDyWF+nJkWCoW6fxDoc4niBRNzHR2oa5CyoeDpNJ4BFZiKRky2IMLJi75bvsW9Sg3PsHynTA/fVWBkv1xInlwYNfMShn//ln5DDl/ZiSgB4d7fvgNXRkyL+wMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPiJS6TJ8OUhsx9vB0z9VtTi/d7lgS7KyXs1+QV6DmA=;
 b=P+fRESvHElT4XkSkmxZVSwwhNYeNIrzQK4ubuJ4+73qzCgP2fmT/OLh/L5R5jKqwsr5upQdT8IQJQxnqOUDTyvsp0OlC4P+k9ODkbPt3hj0MLyCC1ShJpBuCg8P0fYnDabiKm7Wo43VqQUXkZDiEDuVx7f3LekgWONqWSARyWQY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 13:29:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 13:29:22 +0000
Subject: Re: [PATCH v2 10/19] block: introduce fleecing block driver
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
 <20210827181808.311670-11-vsementsov@virtuozzo.com>
 <877dg0bjut.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ab2847a6-b330-9d23-f264-30119124425e@virtuozzo.com>
Date: Fri, 3 Sep 2021 16:29:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <877dg0bjut.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 13:29:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee6f45d4-bcbe-42ea-bf1b-08d96eded725
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6533DA27A32C319253AF81CCC1CF9@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9DsImOcG/Py4I39b6/fFQynpnw2qQI1dfCymLohR9zDeHzkUcp7ot7t5JinRiJX3axtRyM1tQwbd7fYzEuZXhM19QmYk2rK/3cd3C1qJVhzGcElXa4AHmjLtwb9/41fGKaDH1Ol+Nq6CAg6+bW8Ei2ll5VWoEmw8fJtmELCfGefclHC1575MDxmS03wgXMIXJppXwO8tR/C1R7PnevLTFm0dLI7nMG3mAEwFH7jo5mUhriAYLdmvpLewEC1DmJy3ExE+5TpaT8Za9bxkibZaaGfX47c7pRSn8KTztNOpvjX9R4J10FH+56ksYvq9fCV3asmlu/qYCbflOc4S7qKGbDqelZoXoaHYcPHLRrlBb3F8wz5f4EyoYTnRn6xmJDJumX2zHq2qbyZnCgYkC0/8gvFMNuXjWRFIOlpl3DereAMMC7V9IMUiOB+YZH1X8YmNqOn0N2QNrleb61zY89KpLW/xT72QdmL1FfBPEOvwO2+w5SLfoR5X9zOp4vTLyQTKijKey1McDl3Jj4P+CFIye2YyV/MBB4zI3DuYppcV5M9QB/3FMtkgqQwhnLuTjLk1VXsRRl0sHvrEviTtU4bIn0+ltRR/xmokvkwqAdiZUl0Jz9UQBpxLxDkINOOOAK/TgjAO2L4VGsR0G/SRr9QHJUa3fVv/cdoM9yO1BAhBb5Q1Ih75u3MXRIBa1nUoZYGjmnAOZ8OWz0dYXsWgHvu3DHPo2Yxim9WTOkRkSRy/cqG6+tcrf97C/2jMi+nDbvVPa7fiEoa9kEVGNozHFiqQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(376002)(136003)(366004)(26005)(66556008)(186003)(52116002)(6486002)(66946007)(83380400001)(66476007)(38350700002)(38100700002)(956004)(8936002)(2616005)(6916009)(36756003)(8676002)(2906002)(31696002)(5660300002)(478600001)(316002)(16576012)(4326008)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEJNbDg1ZjJKd1RIUUJ4SU9SYm9LYjV2djNCQ2ZIWlVrM3JhRnFmME1EaC9K?=
 =?utf-8?B?Rlc2RDVxT09HOFFXYk5sdjlGdFlMbW03RnFCcWtzSCtxQUtrY1NoeCsrY2R3?=
 =?utf-8?B?c1FhRUFLMDlETXBxVWNrM09SMG9LbzhJeWdGdm5ZYytjTUhMUnJNU1FmelZ5?=
 =?utf-8?B?WmVFdXJiUi9HcDFSZGxyMFc4aTlJUkFnZTRSYTZwNUtqRWtmQWozMFJ1TjdV?=
 =?utf-8?B?MWVmWFdMdVdWS1dwaXY3c0xFWEk1bGNHTGVBQjZlZThjYWtvbnBZM2dCTTJV?=
 =?utf-8?B?ZlpTU2NMWjZ0TjlyMlUwR1lSUVdCUDkrazJxRFZhcGtoSHRxV3BmblZkczlH?=
 =?utf-8?B?b2ttdW44eDRvNDhnaHRFc05WS2J4OCtXVjBEZ1JnK1BzSjVTU2ZtM0pCVUNC?=
 =?utf-8?B?TDd3aThmYk1yRkd1UzR5MURLL25Yc3ZWdUhZOVVrOVo0UHNuUWhCYU5rS3V1?=
 =?utf-8?B?Vm12Ny8wdmJlTzh4ajhJemdTdkptQnhWdUtNV2lsT1U0cmpOdjdDR2VaMkMy?=
 =?utf-8?B?dEYyTzZqVnNVcUdTRkZNVnFqWCtXY0tqbFYxSFNQeGVtT05HTVE1RkxmcXBo?=
 =?utf-8?B?RGpvc21BeWtCS2xkR0t4WDEvby8vbnFncWVpbEZRNUtGTzlOeUE1VkduSGY3?=
 =?utf-8?B?MjRuMFA5WktVeFREZXZScDVlRHRkei9zZmtnRGpnTlh4VWpDb01JQ3doRUtT?=
 =?utf-8?B?RnpiLzV2MS8rM2dyVTBPbmxQZ2U3d0lZaUk2OUgrd3BWM1dINzVKU1kzYWw1?=
 =?utf-8?B?THlHL2UvL3BteFFBdVZBTXk5QU5KcnMzOWdHSlNTU3lPS1YzVG9pcW1ma29N?=
 =?utf-8?B?SGtubHF2K00vaUZYanBmaW45d2tnUGFsaWRNNGQ4MDYraHFrazNqVzgrYW5S?=
 =?utf-8?B?TmVrcmQ3a0k1T09vRFlqTUwyL0ZjOXdYMWFmdWdITUhYUVBCLzdNbWVmRC9h?=
 =?utf-8?B?bVR2bUtjZzRUVU5NOEM2aWhtOXF0Y1pMVTBjbGl0YWVsQUx1R0lGclIwL09j?=
 =?utf-8?B?MXBoTFQvSGd1SENmTUFvYVNZaHlVbENHOFkxdnNuM2tOUjZEUzV3anRqaXVM?=
 =?utf-8?B?SzZoUXpGb0Z5S2ZVQWtJOGx5MDQ4TGlSakZYR1JNYlN4NkVHell5K0t2cStk?=
 =?utf-8?B?WEpDZjg5cGU1U2cvUC9tZVVGWG9pc0JtVFBPRGlYdHI5MTl1OVJDS1FydW9l?=
 =?utf-8?B?Zk9VelBUdEpGV29CWnpnQmR5RmpObkNWVkZxTW9PajJ0eHBPeWMxeDRjUFda?=
 =?utf-8?B?TjhPRTVhRnBoWnRDc09Kd0hSRXl3WWVBN29qSURjU0Y1dFRHWmNsNG5JY3o3?=
 =?utf-8?B?Y1RGL2cybS9zRHdsSkxTS0xlclh6SjZPRXY1NnppNDB5SHFHK1BNVFZvN3RK?=
 =?utf-8?B?c05FcStGUGE0ckw2aEY0YU1OZ1g2Mm5xVFlVL0RtWmN6WlFRYWNSODdsRXl4?=
 =?utf-8?B?eHQ1WW1sZUh2b1B5bjNZaXZkUEliTDZBeVRyeHhtRTVHdEkzcTZheWw0UGNM?=
 =?utf-8?B?cHhjam9aeGlvNXhjY29OQk1NcUIvNFVTWGJyL0J5TjZuRGF1WlpnaG1qVE91?=
 =?utf-8?B?Y2NQdWZoNGo1djVzcHF1SkhOK3JZZEd6S1Z4blh1MnpodVhBb2dtQ2ZxMzN2?=
 =?utf-8?B?emFmdVovS1FJZFNML3JoR3NvSzc2VG9oVGpDdzMzaGlJQ3VGZ2hzc3RnelRF?=
 =?utf-8?B?RldUbWFpT2ZVaG1Tb1FnMmMwVEErbU9hK0RZbWkwS3RKaWpYTVpZaC9oRi9B?=
 =?utf-8?Q?VaiW41zAlvjiA7vKK4UdVfBOfSUMBETLKjSv6BY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6f45d4-bcbe-42ea-bf1b-08d96eded725
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 13:29:22.3674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7Sjl1+OkjoUQNJvx0vc97pjmLoucbWLQlHTUdGStoG+SzAz99jmcOyBRyMwsa3KXl3hlMH10afoZ2WLJJewPZf20l7oBoNMC9MAwGgJmI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.1.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_NONE=-0.0001,
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

01.09.2021 14:44, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Introduce a new driver, that works in pair with copy-before-write to
>> improve fleecing.
>>
>> Without fleecing driver, old fleecing scheme looks as follows:
>>
>> [guest]
>>    |
>>    |root
>>    v
>> [copy-before-write] -----> [temp.qcow2] <--- [nbd export]
>>    |                 target  |
>>    |file                     |backing
>>    v                         |
>> [active disk] <-------------+
>>
>> With fleecing driver, new scheme is:
>>
>> [guest]
>>    |
>>    |root
>>    v
>> [copy-before-write] -----> [fleecing] <--- [nbd export]
>>    |                 target  |    |
>>    |file                     |    |file
>>    v                         |    v
>> [active disk]<--source------+  [temp.img]
>>
>> Benefits of new scheme:
>>
>> 1. Access control: if remote client try to read data that not covered
>>     by original dirty bitmap used on copy-before-write open, client gets
>>     -EACCES.
>>
>> 2. Discard support: if remote client do DISCARD, this additionally to
>>     discarding data in temp.img informs block-copy process to not copy
>>     these clusters. Next read from discarded area will return -EACCES.
>>     This is significant thing: when fleecing user reads data that was
>>     not yet copied to temp.img, we can avoid copying it on further guest
>>     write.
>>
>> 3. Synchronisation between client reads and block-copy write is more
>>     efficient: it doesn't block intersecting block-copy write during
>>     client read.
>>
>> 4. We don't rely on backing feature: active disk should not be backing
>>     of temp image, so we avoid some permission-related difficulties and
>>     temp image now is not required to support backing, it may be simple
>>     raw image.
>>
>> Note that now nobody calls fleecing_drv_activate(), so new driver is
>> actually unusable. It's a work for the following patch: support
>> fleecing block driver in copy-before-write filter driver.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json |  17 ++-
>>   block/fleecing.h     |  16 +++
>>   block/fleecing-drv.c | 260 +++++++++++++++++++++++++++++++++++++++++++
>>   MAINTAINERS          |   1 +
>>   block/meson.build    |   1 +
>>   5 files changed, 294 insertions(+), 1 deletion(-)
>>   create mode 100644 block/fleecing-drv.c
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index c42d23752d..8a333136f5 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -2826,13 +2826,14 @@
>>   # @blkreplay: Since 4.2
>>   # @compress: Since 5.0
>>   # @copy-before-write: Since 6.2
>> +# @fleecing: Since 6.2
>>   #
>>   # Since: 2.9
>>   ##
>>   { 'enum': 'BlockdevDriver',
>>     'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
>>               'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
>> -            'file', 'ftp', 'ftps', 'gluster',
>> +            'file', 'fleecing', 'ftp', 'ftps', 'gluster',
>>               {'name': 'host_cdrom', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
>>               {'name': 'host_device', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
>>               'http', 'https', 'iscsi',
>> @@ -4077,6 +4078,19 @@
>>     'base': 'BlockdevOptionsGenericFormat',
>>     'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>>   
>> +##
>> +# @BlockdevOptionsFleecing:
>> +#
>> +# Driver that works in pair with copy-before-write to make fleecing scheme.
> 
> This is really terse.  Do we explain the driver's intended use anywhere?

Hmm. I can duplicate here the ASII art from commit message together with some
explanations.

> 
> I'd suggest s/to make fleecing scheme/to make a fleecing scheme/, except
> it doesn't make much sense to me either way :)
> 
>> +#
>> +# @source: source node of fleecing
> 
> We usually say "node name of ...".

OK

> 
>> +#
>> +# Since: 6.2
>> +##
>> +{ 'struct': 'BlockdevOptionsFleecing',
>> +  'base': 'BlockdevOptionsGenericFormat',
>> +  'data': { 'source': 'str' } }
>> +
>>   ##
>>   # @BlockdevOptions:
>>   #
>> @@ -4133,6 +4147,7 @@
>>         'copy-on-read':'BlockdevOptionsCor',
>>         'dmg':        'BlockdevOptionsGenericFormat',
>>         'file':       'BlockdevOptionsFile',
>> +      'fleecing':   'BlockdevOptionsFleecing',
>>         'ftp':        'BlockdevOptionsCurlFtp',
>>         'ftps':       'BlockdevOptionsCurlFtps',
>>         'gluster':    'BlockdevOptionsGluster',
> 
> [...]
> 


-- 
Best regards,
Vladimir

