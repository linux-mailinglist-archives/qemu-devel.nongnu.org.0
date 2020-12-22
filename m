Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39892E0E18
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 19:03:06 +0100 (CET)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krm01-0002eo-BV
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 13:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krlxZ-0001Bl-NK; Tue, 22 Dec 2020 13:00:34 -0500
Received: from mail-eopbgr00102.outbound.protection.outlook.com
 ([40.107.0.102]:48632 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krlxN-00058p-IZ; Tue, 22 Dec 2020 13:00:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDzoKi6xRyvsg5khQY9doruQ7atxjTp3OG8a8xhORxm8xD+9zlts1mKV1C0ilicYAf0q3VWsnxP5b8yJXRI15OCC/OXAH7AgS5hNE5ElBbbr01SzsVqk/ETVlieK6/BoQU4ryM/hZjG7mHyuld9S3J552hlG+1RJ0DDTha7Ub0v/apw9UyIM6G/TNRLeiKOk0qDeuAYYu8AV/u4JCpIOC2+hZ0k8ET3Cd5Hox2fuVEy9JnvaVFv5O+BBi6djlFL2JPfDZoJkNSbdtw0M6Y2E/4Tm6Gy17SE2gfyi5DVaVwkX9OQrWjN147Ik357YzPFi81GSJK12NgL3mZgD0oEVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xztW4bhyGBAc9doriNjPlYmc9W4LZBMp8i4BapByH4E=;
 b=my1tEB8DpI5mB2YjhXUi88OwiVWUZxy+k1NvmUmeY8R4qud59Q0kyEdJGxJQQmBFjEU8zAhxNccUDJ8n4iXBPvi8AvgxE7s533w60ih91R3/W9kcbVu4eFLFdAzqvIR1IZU09v3n2rjabvyFa+8GAlFtxt+2/zHgkiqhg8WZN2WSmJjJoLasa5TEIOLHIIKvR081bSmOcrMeCAJPjpkOjLVgxLixI0/fJB1lvwcAdDU5XVexZ+YFia3DfjX2Nrido1AKf8UQCVcBB+MdGZrC34LgDGfoQ8nmdIF5aC9R3IJXhk+qszOUCsIpj8AwpBFJUsb9Mw7yNJrVpHLGvk1lXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xztW4bhyGBAc9doriNjPlYmc9W4LZBMp8i4BapByH4E=;
 b=FS6gt9pz+aUCHhLU/+scSogD8oC/FdGOk3UTPQTzJeoa4zGncL8rKIQxpPyhKnWCsuCPxH+4gyqkqsL+554+1f2y2HLwF/ToRyuGo/wyw0B4opU9mfkJtYe8eVogqiULByTrIC8+lXnTmnfe9nWNgwQRS5wrrQc5FqMP0Ue2CNQ=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3957.eurprd08.prod.outlook.com (2603:10a6:20b:a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 18:00:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 18:00:13 +0000
Subject: Re: [PATCH v15 10/13] qapi: block-stream: add "bottom" argument
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-11-vsementsov@virtuozzo.com>
 <d7d127a1-e70b-4e1f-acc8-eaf9230dd70a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4039f38e-e519-fe51-45c8-ce761587961b@virtuozzo.com>
Date: Tue, 22 Dec 2020 21:00:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <d7d127a1-e70b-4e1f-acc8-eaf9230dd70a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM3PR05CA0126.eurprd05.prod.outlook.com
 (2603:10a6:207:2::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM3PR05CA0126.eurprd05.prod.outlook.com (2603:10a6:207:2::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.18 via Frontend Transport; Tue, 22 Dec 2020 18:00:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e1610cd-8103-4ccb-cfae-08d8a6a36ea7
X-MS-TrafficTypeDiagnostic: AM6PR08MB3957:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB395780CECC6A96B7C1735DF6C1DF0@AM6PR08MB3957.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A4JTVTpb1m5+wHjEpLC/9lMxniC+gP0pWFcPosZnwCD6i5DktuAeMqElPlxJ/Ug/vY8r9Eo/0tMhEY+D2A3JK/JmB25Br2YDkgOjQ7DCUTIu7hTvySG9rcVdA8jbcjYexAyPU6NIGW42qZjExYlDBvvqiOlbtkSel8Wn4Cn69NA9sdtUzVGC9YX4D7IwY/gPXY5Xqy5W6SOcueWSPiQ8P8E+t1FrDEvVPXc4PFI+03Xkk/KNJTdziQT1cyszuEUqyt2N0HLEYghU+u2zNFrCsXPsCgoyNnIC9jpGFfBGtsljwvG26TSxUBsdhaC5xyjy3paCmOfKCYF5K7cK+Zpncj6ejbyylMMuSTynDBBUZJ9tICI/GhhGlKiEHybDIc2HTKnGE9IoIq38s7AerpVXm/VMAn+VmsLU+aFeVKkKrePpU/MDDZBcrA8fbBww+oOMfNaW2yFfIhmLL8t+PyxhSFBnPLtOvvQ3m+PxpF6Q/8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(66556008)(83380400001)(86362001)(6486002)(66946007)(16526019)(16576012)(5660300002)(31696002)(956004)(31686004)(498600001)(2616005)(107886003)(8936002)(186003)(52116002)(66476007)(53546011)(26005)(8676002)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0l6YzZvenI0OU1TZkFTN3NKWExXUVZNelFnVzlWenZLMWprK3FQUVRkNGYx?=
 =?utf-8?B?cVBVSVNPSzlDYTBmOFZyMkt0Qkh0VjlLWUQ1MzdlOEU0eS93dFJ3b0FUb1J3?=
 =?utf-8?B?VTk2aGROdzlRR09kcEpvTEYzbGl2NCtOSENndm4vSnlRWnlTdjN6ajdlSWFF?=
 =?utf-8?B?RXVyNDFZQ08rUE9WRXA0U01YQkVPdXgzSmdUUFNtSlJRKzV6cE9CTFFqdEpG?=
 =?utf-8?B?R09HNlVobFRBd1pHVzI4TWJHWG1nSXB5ZTkzdEF0YjV2L2MwMEYrMmZjSTlK?=
 =?utf-8?B?eEs2YWJRYjFla3d4NnF2Ymg5dVJjQk9rdzdEUEpIS2psSXNjRW9IRkd0R2gv?=
 =?utf-8?B?VklERzVOa2lsUExBeWZRMVhvL0lrSHliaDZXeTRPY1ZoOHNhcEdZbEc3VGN3?=
 =?utf-8?B?Vld3eFRVeEM2R2dKZGFrcm83L0FsdGNrdzBpejdFWTVxVGk4bGN4NU43Wm01?=
 =?utf-8?B?b2ZLVGtwWnR4Vy9Db0hhOXFrc01qZzlTbG9zVHVlelpTTEFyc2lqNzNncVNQ?=
 =?utf-8?B?aUtNdEI1ZnZ2dFEySGtUTVk1TGc0bXZjVFdmNy9DN3c5VU9hNllJUXFyUkZz?=
 =?utf-8?B?aVhOcnlZQVk3aHhhVTlwMVBWeGhKb0RwaWIrejQwaU44czZBdHJZZnZKWlJt?=
 =?utf-8?B?UWhCdnRCSU5EVzVLRTcxbGgrcVFUSjhkTy9Wb08vZld2Yi8zNklVMjA0K2Jz?=
 =?utf-8?B?U1hFeUt1VVpydXNONDN0WTEyNENyc3I0OVR1M1VlLzRTMG5NUU9kZUJtUi9j?=
 =?utf-8?B?ZkZhb1M2bHVRUEVwUDRUWENEdjh1VEt1YVcxeUNqdkZrVjBPaEtzeFViYzlv?=
 =?utf-8?B?dG5lanVpa2NwbVFmbTFnRDQ2RDl6TDM0bkYra3RpK05BWWF5NGZCVGlkVndo?=
 =?utf-8?B?VXpQbldpVXdzUGdPVmNIdEllbFFCUE5rSU5qNENSdlY1cTB6TGxsNG5hS3hu?=
 =?utf-8?B?Kzc1QkZrczhDNEJDaDRRR0VCM1lWaFRIcXQ1SzNEVDNvQi9nMTd2U09keEFp?=
 =?utf-8?B?YjVsMUwvallIdk1rSy8zMHVTZjUrWDR2NmliQ2pZREhPbU02K3R6WnZLdmpp?=
 =?utf-8?B?S1ZUS1ViaGhLbGZWbEYrbUlrRXZSc2tuMGlHTmZTRzV2amRxem82NW05RFE3?=
 =?utf-8?B?aU5FK0p5TXRucWtJamxsVUNYQVBmRHd3a1YyNHBTNW5iZStkRzlPTGg1NUEx?=
 =?utf-8?B?MFBPNVFkR2dLbFd3K3FaTnI0WmZNbG1EVlJpRWRLS1FId2dKa3JzMERzZm5K?=
 =?utf-8?B?WXpQYTFUa3pDemxKSjhnMWdydW5PUWdhZHh5Y1pKUGVVSDFZUFVPajJGaDNR?=
 =?utf-8?Q?qChY3xNDrGKT0J3Mxc0awoqnXA7VflxUfq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 18:00:13.8818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1610cd-8103-4ccb-cfae-08d8a6a36ea7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YM+xCpl1KPH9JlVOwLER0YxeW/4NvqTUuJ6LyKtsfxc78p+UP9Azjnv2YwhZcKtena0Eb3bqQuHeKup3MA6jawDPKeYJPhuFIQLcvakYMiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3957
Received-SPF: pass client-ip=40.107.0.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.12.2020 19:07, Max Reitz wrote:
> On 16.12.20 07:17, Vladimir Sementsov-Ogievskiy wrote:
>> The code already don't freeze base node and we try to make it prepared
>> for the situation when base node is changed during the operation. In
>> other words, block-stream doesn't own base node.
>>
>> Let's introduce a new interface which should replace the current one,
>> which will in better relations with the code. Specifying bottom node
>> instead of base, and requiring it to be non-filter gives us the
>> following benefits:
>>
>>   - drop difference between above_base and base_overlay, which will be
>>     renamed to just bottom, when old interface dropped
>>
>>   - clean way to work with parallel streams/commits on the same backing
>>     chain, which otherwise become a problem when we introduce a filter
>>     for stream job
>>
>>   - cleaner interface. Nobody will surprised the fact that base node may
>>     disappear during block-stream, when there is no word about "base" in
>>     the interface.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json           | 12 ++++---
>>   include/block/block_int.h      |  1 +
>>   block/monitor/block-hmp-cmds.c |  3 +-
>>   block/stream.c                 | 50 +++++++++++++++++++---------
>>   blockdev.c                     | 59 ++++++++++++++++++++++++++++------
>>   5 files changed, 94 insertions(+), 31 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index b8094a5ec7..cb0066fd5c 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -2517,10 +2517,14 @@
>>   # @device: the device or node name of the top image
>>   #
>>   # @base: the common backing file name.
>> -#        It cannot be set if @base-node is also set.
>> +#        It cannot be set if @base-node or @bottom is also set.
>>   #
>>   # @base-node: the node name of the backing file.
>> -#             It cannot be set if @base is also set. (Since 2.8)
>> +#             It cannot be set if @base or @bottom is also set. (Since 2.8)
>> +#
>> +# @bottom: the last node in the chain that should be streamed into
>> +#          top. It cannot be set if @base or @base-node is also set.
>> +#          It cannot be filter node. (Since 6.0)
> 
> As far as I can make out, one of the results of our discussion on v14 was that when using backing-file + bottom, we want to require the user to specify backing-fmt as well.  Now, backing-fmt isn’t present yet. Doesn’t that mean we have to make bottom + backing-file an error until we have backing-fmt (like it was in v14)?

See my answer on 09. I just have some doubts around backing-fmt and decided to keep it as is.

I don't think that we really need backing-fmt. We shouldn't have use-cases when backing-fmt is set to something another than final base node. Therefore, using format_name of final base node is a correct thing to do. So, I don't see the reason now for introducing new option.

> 
> Or do you consider the change to patch 9 sufficient to make at least the case work for which backing-file was purportedly introduced, i.e. FD passing?  (Patch 9’s new version will just take the format of the base post-streaming, which would be most likely a correct guess when using FD passing.)

Yes, I decided just to keep logic around backing-fmt as is. Hmm, definitely I should have described my decision in cover letter, for you not being surprised.

> 
> (I.e., now with patch 9 being more liberal in guessing, perhaps you decided to no longer make backing-fmt mandatory after all.)
> 
> Max
> 


-- 
Best regards,
Vladimir

