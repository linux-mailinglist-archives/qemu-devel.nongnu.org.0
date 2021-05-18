Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D343878AB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:27:09 +0200 (CEST)
Received: from localhost ([::1]:34780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyoW-0002bC-0e
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liyeS-0003A4-BR; Tue, 18 May 2021 08:16:44 -0400
Received: from mail-am6eur05on2132.outbound.protection.outlook.com
 ([40.107.22.132]:9473 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liyeO-0007ZI-Dj; Tue, 18 May 2021 08:16:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6qDgjbczY9GNcZftBiXTudTUS0imt4sPFH3S0iUYIXxm+hnu1W/8oozj0KDizn7QO+dOXdAdRTZMJkn8fPXFEGQ5csU6Fq/I2whzYzzLC3MKQ5vNvOM+QcvzgTAb/1jE4bvIm7pJfS2mMlCpTEiQb4ZC05VL72uCacEUMVZeNJMzAHlSSOuiMSjfyd20oxQt6NjGAQNSRUHnH1maBhQn617kx3XwaXXeM1W2cZ6FCRIsPkiVEg7GjQ8/8jbPTeUSi+o76ApmkJZeGjcCfUNESRhW8Bf6hapTwCC+rOeJgVUfvxwMZJ3w8NWnYMuEynTaAWtJkMc1o+QtDcaphSkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0K4QUNDg9MnUUQdFPRvIdAovSGYdM3FL5jgzfik1xWA=;
 b=a/kawdYgICynf7MNFsYg2NQcAXTSEmo+U+ieNVEAU+7Pq+6cZL686pAN70HCUzzKaf7Yve8vtuyyTgt8mD/FDLYtwxTYVYQdhRdgBn0YRKnagkPqX2eGDdwbF7ErwpmMVZTYaMlIev8GkgbckXJ29BGyhuhsOb8srmeY/2jZlzQG4nAsN1r7Nz7kRdmuxplaP4L2Sf1BsLQiUeWuC8jReTAQCet3Pd4jLC8J1zqmHtXvbBihF9Qav86k7WSA/wLq6bsNyDAF36xr00AnCV+iipjQRGMHRinSc4ClPVS562qqcBY66xQg0SGPsdMTZsBWlc2G3GG1TJ3HzVTjVStCsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0K4QUNDg9MnUUQdFPRvIdAovSGYdM3FL5jgzfik1xWA=;
 b=oUw60bhymZEZD3BSMoQGnz9g+2mhybJksroDVpgKfi/VvFtCa7pC6BqTC/87yoUv52hGkyYsp0IJ5ec1aoCtvwekdS332Wq/fJSpqMrTEU1EWpPNFz8xaJ1+ZTEnuWR/TDYaqx//V3F4hXv6Q3FTvbpM8NS8d7Iocrr4IbuemaQ=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6165.eurprd08.prod.outlook.com (2603:10a6:20b:29a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 12:16:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 12:16:36 +0000
Subject: Re: [PATCH 10/21] block/copy-before-write: relax permission
 requirements when no parents
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-12-vsementsov@virtuozzo.com>
 <34036b2a-4325-3630-229c-c415d6bd87ba@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <316af355-ff12-40fa-7b7d-df8a0b8d8e9f@virtuozzo.com>
Date: Tue, 18 May 2021 15:16:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <34036b2a-4325-3630-229c-c415d6bd87ba@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: ZR0P278CA0094.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 ZR0P278CA0094.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 12:16:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f17c79b-1ad1-411a-8c5b-08d919f6c885
X-MS-TrafficTypeDiagnostic: AS8PR08MB6165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB616579FFDCC1638C3F2FE5CFC12C9@AS8PR08MB6165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXFelqGD13vxVioVmtjrc26KLNh+4KeRpu3Vs1mCYje1b70JPY6FpKsWuA7PLAIiuQJA1mZjbQl/0pJLLrY24jDtjNrsQclqQ2E3LIndizlJfsHXT6xS7bpiNU00Q6+cZx5RX+LaE1PnzBAqPN3Dy18SQZvftb2UABP1S/CyHCioEtdDhHy+vBqAHSXIXny0HRRi/OpExIL0+Qmu9kubVgwCFPTwkQGNTpm8l8ONvYfNlf3efo4cc+2Mz4+IGTX8QhltBd7MgeXNBx3hECTBTS9cicfROT0fBnUPBtieL+GraigywrUA7PWd4a9gdVpYui3gHixC7cgX1I90tnYgWYTXjkkP5Vz7rRRki94jyA8T2bU8sOql2crJLAMKyrRyzgjpcQa93lRXtUEnCid6MqUNTl/2PqAetHGT4WwY/LRcETb0JbtfgRMn0oFrknbJeddkRJJ1aiT0xCojjjtO3i2DoDOxw+EM2cupR6hDwI5eRhvMSY997s26h/9wEYNVaw7hJjoe48rqzbHS9rg2J+IEGGs5kkOv52Sves1mH4eateLBFmMhatj0+FHm/FBZMlIrxSJMkNs1gw3eVjbVWiVhRT5RH5O3z04FfWl11vJD8zLT+dhcQ7lS9lALlEl4glVji/zOqbDGk5rgGCt8f9uygQbsQx5clO0ZgfPJdpStReJmnhKv4RBBh8ZSGkY7TTEZXi3Dn6gFfyxektZQ/1pR2tdQj3wzoQXjfwjGK20=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(376002)(136003)(366004)(83380400001)(86362001)(478600001)(2906002)(316002)(956004)(38100700002)(31696002)(66556008)(16576012)(8936002)(53546011)(52116002)(38350700002)(107886003)(4326008)(66946007)(2616005)(186003)(66476007)(6486002)(16526019)(26005)(8676002)(31686004)(7416002)(36756003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0M0ZVBPMWR3b2hnbXVvZnpXb09wQ2xHVTFpWVovVC9nelhKUmtzWEFEYXFq?=
 =?utf-8?B?QVk2LzZGM2lrcVlCclk1YmsvYlcrUlhJU1NPMDJWOFpSQlhacmtyaEdXTkw0?=
 =?utf-8?B?bXpIdzUyNWtpN0Q3QVlrQVlZN3A5U3RxVnpiM0gzOU9seWx6Mm1hNGIrTmI3?=
 =?utf-8?B?a1BDcW14d2EwN1BWS3JWbGFRQ3hHMkFPRGlkWHRhQ0JZbWZIK1RUWjQ3RjEr?=
 =?utf-8?B?S1JpSHVpVjU5Z3VMajBsVkh1b3gzYkc0ZncxSlhia1lmaGtyb1d2SXJ1anI4?=
 =?utf-8?B?VmpYeWk3WS9Pcjl2em13b3VBdjNoSjRJRVJNaVNHdzE0RTd6VGFvQXVXRVE4?=
 =?utf-8?B?MXRNU1NsNm9Qb3pLTXRtRGJCNmN4VU01RCtNQmpRaTZPTTREZHhXNnY1NkpS?=
 =?utf-8?B?T0Jrd0dJcnltdkJlUThqVE9RRlhlQXUxYW56OUdwVTNNa04wQWlDS3M1TkJn?=
 =?utf-8?B?Z1o4ZnkxUTZuNE8xSG1OS1Z3a2EwamR3N0NQaEdOdDdvdDJYSmFpV2d0ZlZu?=
 =?utf-8?B?RE5WY1pnRlAyLzFHZmxqZmY1SC9nZ1RSdHlpOWpkTVYrY3BlbHF4aDRUcXZa?=
 =?utf-8?B?OGVQeTdXWmZoWmhLT1Y3anhmKzBmVU5kSC8zR1lERDJRVks2SUVWb0pmZFVP?=
 =?utf-8?B?YUZsNjRQTnArSlphMzhoM2pJdzBpdFJHeFhMalRENWJNcUNFejdiTit2amNY?=
 =?utf-8?B?Wit6U2oyQmd6Y1lac2taeEpqQUMwMU4rVlZvemx1NVNaSTRCRGJwWXROZHJI?=
 =?utf-8?B?bHMxS1RIQWlFT09tV1pUNEdZS25lUlFXMnlpNnY4QXJOM3FxekVVOG81MDZy?=
 =?utf-8?B?V2c2Ni90bmZ1VG5wa2FOaytzL0xaSlcyaVhTY2UwTkdzOTdDQ0R2MVEwWXFF?=
 =?utf-8?B?ZnV1WUoyOVF6UnVKMmdaYUMrOHRrLzZrcTdaQkxWNTFTMDBIZmRVeForaFZy?=
 =?utf-8?B?WXRRNFVlV2tkRVpoR0kvL2g5a1pCc1ZtcEdQNjZ3b0cxWWNtVkNWR2hEekov?=
 =?utf-8?B?YjNwKzh0YkRMK0c3THNzVlVhWHlRemxMUGNDd3laaG1uM3JiZG53L0V0VzRW?=
 =?utf-8?B?WktJN0p1OUZaNlBDQ1hEKzRMUTRRTThvM1pmKytVT1pVaTNrRUJyOFA5TDl2?=
 =?utf-8?B?cFVzam5HU05Wa1QvZXo0b1p3NmNTZU4zODRYamxGUS92TTJxYStqZW9iVEpz?=
 =?utf-8?B?YzYvTkhWQW9vNnBNMSs4R3RkZlA4bC9JL1NtNHRiVDRPc2hpTXBUZkRHNjBR?=
 =?utf-8?B?aXNyRWg4RVIvWS9pZXV1R3hYaEd3RGlsTnhkWW4zckNSYnNjUEtQQnljQlBD?=
 =?utf-8?B?U0g2OTlBQXRWa3hVSEtyU0VDQWRuR0w0Tm15UEFaU3R2Y3FUQmJTbVpqUzVS?=
 =?utf-8?B?M2EyZVR4cWJWN2xPOFRjL012aDhFbkhSWGdBL0xtUWYrZlBTUThHVGo5dVV1?=
 =?utf-8?B?RWpBTDgreGl2dE1CeWkvT09DS2NoUmJqOXlONjF4eE5tWGhIWDNUZ0p5Ykgr?=
 =?utf-8?B?TnNZS1lTU0lkRXA2WlVIYytVc1RnNlBudUFkOWtPU0lTK3FHVnBKUXoxT1ZQ?=
 =?utf-8?B?L2lrblljQytCTFFxQ1FDVFBRV251VXpmTFNNQVpQMDdYSzZJL0llc2NlbjBY?=
 =?utf-8?B?Wm5kVlJvdUdtQitxS0tLTEZYWUFtOEpheEk3MzYwL21UN1ZMUTY0bVF6NVc4?=
 =?utf-8?B?OWdJbHNRc0E3UnllNjdyZ2NsOVhMaWVNWnBmVHQzTm5jeGdjbHRHdXI0VUNM?=
 =?utf-8?Q?qTefH01SgbUBr/xAWtBCrNGlEbnwGfXNH4mIZmg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f17c79b-1ad1-411a-8c5b-08d919f6c885
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 12:16:36.8202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txcjQiSV2W6RveA7rOkwhMHlyD/RwAMrfHu5smxF9VLh7EB6isKNlrl2LeZxZOrZuuhrZt5WKRvaonFB9EQCgO8IWQQsZiHJYqbu0jTqKss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
Received-SPF: pass client-ip=40.107.22.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

18.05.2021 14:10, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to publish copy-before-write filter. So, user should be
>> able to create it with blockdev-add first, specifying both filtered and
>> target children. And then do blockdev-reopen, to actually insert the
>> filter where needed.
>>
>> Currently, filter unshares write permission unconditionally on source
>> node. It's good, but it will not allow to do blockdev-add. So, let's
>> relax restrictions when filter doesn't have any parent.
>>
>> Test output is modified, as now permission conflict happens only when
>> job creates a blk parent for filter node.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/copy-before-write.c  | 8 +++++---
>>   tests/qemu-iotests/283.out | 2 +-
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>> index 4776172f77..af2bb97a30 100644
>> --- a/block/copy-before-write.c
>> +++ b/block/copy-before-write.c
>> @@ -142,10 +142,12 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>>           bdrv_default_perms(bs, c, role, reopen_queue,
>>                              perm, shared, nperm, nshared);
>> -        if (perm & BLK_PERM_WRITE) {
>> -            *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
>> +        if (!QLIST_EMPTY(&bs->parents)) {
> 
> I understand this works because with the transactional system, at the time the permissions are checked, the graph has already been changed, yes?

Right

> 
> I was wondering still whether there was any way to express this through permissions alone.  I guess we could check
> “perm & BLK_PERM_CONSISTENT_READ”, but that would actually be just a crutch to see whether there are any parents.  I suppose this really is about whether there are parents or not.  So:

It's a workaround for blockdev-add to work. It's a workaround, because it would be better for the filter to never share WRITE. But this way we'll have to make an interface to transactionally create and insert filter. Probably we will at some point, than this workaround could be dropped. So, if we have to special-case a situation when there no parents, let's check exactly this, to be more strict.

> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 
>> +            if (perm & BLK_PERM_WRITE) {
>> +                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
>> +            }
>> +            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
>>           }
>> -        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
>>       }
>>   }
>> diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
>> index e08f807dab..d5350ce7a7 100644
>> --- a/tests/qemu-iotests/283.out
>> +++ b/tests/qemu-iotests/283.out
>> @@ -5,7 +5,7 @@
>>   {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
>>   {"return": {}}
>>   {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
>> -{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
>> +{"error": {"class": "GenericError", "desc": "Conflicts with use by source as 'image', which does not allow 'write' on base"}}
>>   === copy-before-write filter should be gone after job-finalize ===
>>
> 


-- 
Best regards,
Vladimir

