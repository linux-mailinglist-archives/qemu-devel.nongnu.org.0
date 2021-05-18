Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9B387CAA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:44:40 +0200 (CEST)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1tf-0003OH-L7
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj1qX-0000Zy-BK; Tue, 18 May 2021 11:41:25 -0400
Received: from mail-am6eur05on2102.outbound.protection.outlook.com
 ([40.107.22.102]:63858 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj1qS-0007FO-W5; Tue, 18 May 2021 11:41:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYDreFLqypHT9Vqwcvkly/RfyWhr51a4FvO+MM8c9Nl2wMuG1w+D1dAo5L9iMF9eYj/KvivPaoPeXcZ2jpYXyP9oiQJMPCUVfj+GfD0htmaB8dsneKTQrtsiaCmN88Q0LpFhn6RfFWcPz2zu6QXTwKTjBgwHqPvEh1Y0uolDcfPvtN7CmipJJskpdQBy2wzQOhxs8wfU4J+nMAF/5q8ooeDBdCC56syIdqrEwmLRzFd+k9aXMj9nB8MmHj5+pjITsKLH0FvQ8uUZy9f9spQ+TFpYwoUuKvrg+2edGfG+5W/BAiAoBZ3B7H35HQXfJpH2ggTWuFZmegZIFdEVum9CnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kNv5lDcSFaBSb1JrnCLErO3dW677A12bDOKYHN2CKY=;
 b=KohhEx+vfgC/BgPMkGlFKETY0vL6+7AKzmuByTl3G7zGU2CuhpDohCIN20nJzQYn/J43gBPdohzp5OmdyQx1ucqwkTLb6ND4B4r2OVDJHfD31r4cNS7jOQICiBifQafKyPQPtMNiL5zg6TmZfvsC+MtIlIawpTQuyzVvR0bqmFQ7/sGbhvfC9Ow9/LviAOQTyC73IRIMuj8w1lLz5JGKg0zLDryqnTllcn4PPMeuwsJKxgTSVJW5uaDa83OxVrlYJnJ1MWQHXu4iq34kMBzn5scBp6cvxUxYsA2xOWNKbYsddx61ehEwqRrK5wp1Pcon+vP8jk7sqVjl/nyVG7cv2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kNv5lDcSFaBSb1JrnCLErO3dW677A12bDOKYHN2CKY=;
 b=Rtw83MUVCP1MTUqx0jSoLc0oRn4epD4v4wkaVtor3EE9V+PnoT5Q2PlwYqe9+pvb+3THVPbuwOVmqD8B36wj1JFRdWkq7Q71XPeKpLhAPPejGHV8cQGTlyrTDaaL8YMQnCMlwMWYiqUft6jWtZ8YfDQHBBiCh8YdIb2q9Z8UN2U=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 15:41:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 15:41:11 +0000
Subject: Re: [PATCH 21/21] itotests/222: add test-case for copy-before-write
 filter
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-23-vsementsov@virtuozzo.com>
 <e96e1500-fe77-ed78-eec5-559122d76785@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0e02a2fa-5acb-9e88-04b4-efd86dd121fe@virtuozzo.com>
Date: Tue, 18 May 2021 18:41:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <e96e1500-fe77-ed78-eec5-559122d76785@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: ZR0P278CA0095.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 ZR0P278CA0095.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 15:41:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f73b8b62-a489-45b5-b571-08d91a135cf4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6069761DD93515C49935EBD0C12C9@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4nW2K7WVcXINtKsZmqb5h0TYSApt+wNnYGp20+u3sHJK+3NtPLbH6xoEGY2ntkbq7iLOfNbtooSCaKDgmqPX4gn1sqibjSKQmAZanMQS045oocRThCgZLKe4f3pAgOrMkVyckCbLi56/KsMf7cu12o8I1y4i8avV+AfRj6rUOkxpWJNR3CbMWSsL33tRSO2QJ+KI3XteipR5rJQdBiGDjXPk1aatSH/rGL8hbCLHDYAnWu6fag1QcDufukHitVmlYEKaB7+U3IpekOS2YP27Nf2QqYQS/y2ju5gEsmLDTDpD5Bl320UiLRiSTYHfpMDatdUVYW8INnf9+6FeNQd4kzXq+/UkegMFxNBACY/xuuB3hwTIShF5OAwjPslDmQla+xmgi/4N/QL1nNhI/UEN0J/W9FA0PXoIZALt+pYUAstkOdU0RyQzSQY+MhrchvQMlj9kn8oQDsZ4fBIah/Dmb9raZi0jeNkfpy0T3g5k4SblvCzmdXN1TKrDpw9IyIKFRRU8SsoFiw3pVIvp2D2n8vvERr0G1YNQ4NBAYLZJmBkkf6rtnIhClyrKJStx9n7Wip1esMBOmQTmWyoaG5du2HDkFUVM2NRuA/EWMReZVd4u1hkhEBAUeSLAVmBcwWkqpvHaf9gBqU5eUYr6Qh2XCdXxEthgTcPr1G0krfxNbJcGnbTWzEytIUKl5bnuHI2vphr7yO8AmiDJBxUBK4do2KPsGnwTvzEJD+DpGc7jUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(2616005)(36756003)(478600001)(83380400001)(956004)(8676002)(4326008)(66946007)(31696002)(2906002)(53546011)(107886003)(31686004)(66476007)(8936002)(316002)(26005)(7416002)(5660300002)(38100700002)(38350700002)(16526019)(186003)(52116002)(16576012)(86362001)(6486002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QStkQkRrYUNNSEdNMkp0YU9zL216ajQ0RjRDaHFtZHpBMGFYUkNMTU94QTBK?=
 =?utf-8?B?ZGYyV2tiMjl3MGtuaENRY0hjL3U2VDdwSzJHL0xmWmw4bjRUZUNvM0F1ZE1F?=
 =?utf-8?B?U0tvNnVIYXNlZ0dMRklxWHlWRFJzamtwRjdQU3ZYbEVsbjBGcWNkY1MrVFVk?=
 =?utf-8?B?QVdQenJPTHR1UFNMUGVQV1JhWEIzSG0zSUxtL1lLSGh1cElBY2hNd3l5Vzd0?=
 =?utf-8?B?Zmw0YzFHbm1hbUt2S1FzOXBMbHd0Y1hnb3hYaEtCd2Q5eVYzZ0hJSVdZSXZX?=
 =?utf-8?B?cW52TFFNRmJGYU9VSUVmQWkrbmk2Z3NTOTQ2ZWp4NEdnZEh1V3E5bEh5T21w?=
 =?utf-8?B?b29KN2U1by9MTVJIMnRKV1loeEJ4WWxEQmYwU3RHcVlOOWFoNCtjdDdId0Rk?=
 =?utf-8?B?UEphN0VqTTdBZEpsMWw1QmxwdHRBTitGVlltRWlvSHc3MnJhNjcwL21UeVB4?=
 =?utf-8?B?VzFMSm1PYWdseGc2VWw1TW5DVWVyeDJrWDhicE5jREVWSExLMVFXOENCOGpq?=
 =?utf-8?B?N3ZwL253My8wQzZKNDEvR0doSmFCbGduUjRwTVRBUys3SmthQXphZ2ZlQksv?=
 =?utf-8?B?dUIvS20xZ0JDNFkwd01JR1JYbjVtek9sTHFRT3IrWWlYcVFMZDdsNUl6T1B4?=
 =?utf-8?B?cnEwZFcxZzFUTnNHUXJuL09tZXNYSXRZT28yejFmSHBUSGFZUHVQbFdkU01Q?=
 =?utf-8?B?b2l2eEZpcHU5dGJDSWRtdlZ2TDF4N25CclZkMEVCczFLRCsxSXZjZ0JnZ1JQ?=
 =?utf-8?B?V2dvc0xQTlpJN0JBVThmZ3NHVEk1QUtRNVlqQXVuR2ZFSk1iTE90amUwQm9E?=
 =?utf-8?B?clZRc3I4azVGMmdlS1k4TGt2TkRFNDZmOHdGZlEraUJJMmVhTXB2clpPNXpa?=
 =?utf-8?B?clp6NFpMMktzdDRSUVFqbENMK2svWXRmVkRRdnZJQVhXVFJWTW1FMkEyaEJL?=
 =?utf-8?B?T1lEM0UwZUVrZ29GY1RUUDFRTTEzTHZ5azBKY0JlbTEzdzBXbS8vWlZtSGdh?=
 =?utf-8?B?eXRBQ29LcXliUXpTNVVzS2xBTlBJdG0wRDBsN3pUbjIzd3ZEc0dWQ2d3c0pK?=
 =?utf-8?B?WEc5b0xZQ3hPSVdvcXRGb0daK3hXUzFYVUZ2K1lwZFpHRTMrSGZLTWNsK05G?=
 =?utf-8?B?VnlBaWNHcFJOZGtiemRVYm5kUUZIZU9YNnVnK2d3NDJMTUsxbmUxWGlxM3Bk?=
 =?utf-8?B?V2RGdFRUWWVCZmQ5OWRzUUQvbDBsYmNPV3BzcEJHZDE3RnRUTFYwb2xaeUNS?=
 =?utf-8?B?V0l2TUV6VWxGcnBpQlBBZjlPanlsU21VTzUrc1BQSG4reEFSUDRYODFLVjVX?=
 =?utf-8?B?NWF3bkN4cmZUZFdWWkQ5TTc2UDFXb1Y5eTdNaEw4d1p0cUc2Y3BjS3Z0MTY1?=
 =?utf-8?B?NG55c1BmWUJFMEErVlRzazlCaTZZNXVKNTFJVi8xQXhTSXZMNXFnUUw5Ynp0?=
 =?utf-8?B?VWZLMEF6bkxGeUpqZmt3TlBydjRoRUJsc0VoOW1IaUxLRXlMcktzd2hlb3Fy?=
 =?utf-8?B?YmtRNWxRazd6clhFVUtrTks2UkNnYXVEcHNYNThoSW5FallYWkVUVFIvczV2?=
 =?utf-8?B?V21WUitYNktBQlBzZnhNWERIcDhMWkJtQTRSeUxRT0dZVi9qTklESWxlWnd0?=
 =?utf-8?B?Uk9GR3RpRTMxck1VSzl2eFFWMnBRKzdhdzlHck9DWkFrQnNnVmZMVWcvV3ZB?=
 =?utf-8?B?WGZmL3h2WHFvanJSWitVWEJwY01wbUhSMFpDN1lxRE5MenZjL2czeDlNR0hD?=
 =?utf-8?Q?ufpJMB1M1tuPOlYbsYSJBDV4wofKhtjU3TRJzjn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73b8b62-a489-45b5-b571-08d91a135cf4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:41:11.7430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQ2VN6VQ87rxGWeB9MPHmJXwsIE9I2AyVFjo9Mx73hGxUhGlLzIigDt8Wr2fz0CyYPA3C4qf6ne5pQfqcYB/SthMaEAgbeb9uyLbk8F1dsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.22.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

18.05.2021 18:24, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> New fleecing method becomes available: copy-before-write filter.
>>
>> Actually we don't need backup job to setup image fleecing. Add test
>> fore new recommended way of image fleecing.
> 
> *for
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/222     | 56 ++++++++++++++++++++++-------
>>   tests/qemu-iotests/222.out | 72 ++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 115 insertions(+), 13 deletions(-)
> 
> Looks good, just wondering about some variable usage (why is src_node a BB name?) and whether the virtio-blk qdev path couldn’t be expressed in some nicer way.
> 
>> diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
>> index b48afe623e..8f8e1e4d7f 100755
>> --- a/tests/qemu-iotests/222
>> +++ b/tests/qemu-iotests/222
>> @@ -48,11 +48,13 @@ remainder = [("0xd5", "0x108000",  "32k"), # Right-end of partial-left [1]
>>                ("0xdc", "32M",       "32k"), # Left-end of partial-right [2]
>>                ("0xcd", "0x3ff0000", "64k")] # patterns[3]
>> -with iotests.FilePath('base.img') as base_img_path, \
>> -     iotests.FilePath('fleece.img') as fleece_img_path, \
>> -     iotests.FilePath('nbd.sock', base_dir=iotests.sock_dir) as nbd_sock_path, \
>> -     iotests.VM() as vm:
>> +def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
>> +    if use_cbw:
>> +        log('=== Test filter based fleecing ===')
>> +    else:
>> +        log('=== Test backup(sync=none) based fleecing ===')
>> +    log('')
>>       log('--- Setting up images ---')
>>       log('')
>> @@ -69,7 +71,7 @@ with iotests.FilePath('base.img') as base_img_path, \
>>       log('--- Launching VM ---')
>>       log('')
>> -    vm.add_drive(base_img_path)
>> +    vm.add_drive(base_img_path, "node-name=node0")
>>       vm.launch()
>>       log('Done')
>>
> 
> Afterwards, src_node is set to 'drive0'.  So src_node is actually a BB name...
> 
>> @@ -91,11 +93,22 @@ with iotests.FilePath('base.img') as base_img_path, \
>>           "backing": src_node,
>>       }))
>> -    # Establish COW from source to fleecing node
>> -    log(vm.qmp("blockdev-backup",
>> -               device=src_node,
>> -               target=tgt_node,
>> -               sync="none"))
>> +    # Establish CBW from source to fleecing node
>> +    if use_cbw:
>> +        log(vm.qmp("blockdev-add", **{
>> +            "driver": "copy-before-write",
>> +            "node-name": "fl-cbw",
>> +            "file": src_node,
>> +            "target": tgt_node
> 
> Which makes this look strange, and also TIL (or maybe “today I was reminded”?) that you can use BB names as node references.
> 
> (It’s also already weird in the `"backing": src_node` line right at the beginning of this hunk...)
> 
> So I guess it works, but I’d find it would be nicer to distinguish between the node name and the BB name.

Oh yes, that's all the mess, I'll improve.

> 
>> +        }))
>> +
>> +        log(vm.qmp("qom-set", path="/machine/peripheral-anon/device[0]",
>> +                   property="drive", value="fl-cbw"))
> 
> Is that path portable across targets?  Should we maybe instead manually add a virtio-scsi device that we can give a proper name?
> 
> Or I suppose we could do
> 
> path = next(dev for dev in vm.qmp('query-block')['return']
>              if dev['device'] == 'drive0')['qdev']

OK

> 
>> +    else:
>> +        log(vm.qmp("blockdev-backup",
>> +                   device=src_node,
>> +                   target=tgt_node,
>> +                   sync="none"))
>>       log('')
>>       log('--- Setting up NBD Export ---')
>> @@ -139,9 +152,15 @@ with iotests.FilePath('base.img') as base_img_path, \
>>       log('--- Cleanup ---')
>>       log('')
>> -    log(vm.qmp('block-job-cancel', device=src_node))
>> -    log(vm.event_wait('BLOCK_JOB_CANCELLED'),
>> -        filters=[iotests.filter_qmp_event])
>> +    if use_cbw:
>> +        log(vm.qmp("qom-set", path="/machine/peripheral-anon/device[0]",
>> +                   property="drive", value="node0"))
> 
> If src_node were 'node0', we wouldn’t need to use the 'node0' literal here and could use src_node instead.  (Because it kind of seems like this test wants to use those variables instead of literals.  I mean, we could also just call the node 'src-node', but, well.)
> 
> Max
> 
>> +        log(vm.qmp("blockdev-del", node_name="fl-cbw"))
>> +    else:
>> +        log(vm.qmp('block-job-cancel', device=src_node))
>> +        log(vm.event_wait('BLOCK_JOB_CANCELLED'),
>> +            filters=[iotests.filter_qmp_event])
>> +
>>       log(vm.qmp('nbd-server-stop'))
>>       log(vm.qmp('blockdev-del', node_name=tgt_node))
>>       vm.shutdown()
> 

Great thanks for reviewing!

-- 
Best regards,
Vladimir

