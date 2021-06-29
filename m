Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48543B6EAF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:25:02 +0200 (CEST)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly87B-0006ub-Ge
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ly863-00065H-27; Tue, 29 Jun 2021 03:23:51 -0400
Received: from mail-eopbgr40091.outbound.protection.outlook.com
 ([40.107.4.91]:50247 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ly85z-0004V9-Pk; Tue, 29 Jun 2021 03:23:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwi9p3I4kVD+3Dr/2wZicenFarV//9PeD8oReMVcRQvojtthYpPpl10ZKKj6TJxe+ddxgVze7sQ7Kr76Ir5AVhC5vT/PE7UI/G6Ofz+hVcRz/4/E/1vgL7rYb+r8PNTh33688tEGDg1otboeZK/qxTEjHozuvYk3iVd1e8aKvIf8OGXGD7kbc4ZKC+VjAlrILVtnkr/bcWbgNAnHPELrstpJGhowjzmdh3n8kBa5gKDArSdrJHeRxd5ROxdFz1bsWaUN6utzY4fZv6OUTt1RZ2Lore1v2T+dKUO2LvnfMK373PkuRXlmCIMZp917zwVu7Rc5Ypr+X7aehhWyD4870g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLJvcSk7w8+EnsLfveMDgd3XdNBBfEHIux8ekJGkCYM=;
 b=ly73uWXwTO2VCx7gMdiOlFzj2+YlbXYm+n+xRV1oeaf6N49miBD0IJdpzc5QDNR7777TA+mxT779L5CdCWKByMxqoHFa6D3Deb0HIuMqEtJAI08YF2FFrkQfSAvb4VFx8DvE23r2vjC3OVgtouhsoEemwaTTbtCJlhXGdDPirucj0sEzsn4SpHFtF9WqXiYBSYSWHQr/gHQHibVC3dMJL59x0QxPKJwL3tpOZZU5XDjSN4fW9AmGXF2RtoeTzQu8q+f4xgjNnz4MuZaPqvwQ/LHM1MQHQaD3+LT6DRnK2oCwoky4O8aV8WK8kO4Hnbgy4jD21Gdkkst4SXtaQgF8sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLJvcSk7w8+EnsLfveMDgd3XdNBBfEHIux8ekJGkCYM=;
 b=lOG+tuzQwTL6rZwxuCjp2g0nfSxqHwkQmZQ57d1SBOiD0Z+cn2v4z5fO/KbAjt8gnWDxuM0C2P6CJ5RgHOK0mCWI317YZueTHUSimzTyV74PoGkPi1aqIjBkh0ZuXEs1r9JL22hn/JI2fmDrP4DY+rITZOFFrm4yHDR6Ykefjxk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6470.eurprd08.prod.outlook.com (2603:10a6:20b:33a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 07:23:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 07:23:44 +0000
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
To: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Nir Soffer <nsoffer@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com> <YNID9rbo+RdwklCf@redhat.com>
 <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
 <YNL3kpqnhi15glTC@redhat.com>
 <CAMRbyyuik1Q=WMSpePz6T+0bEnau0CFWbA4VA9GBf6+mrCZS3Q@mail.gmail.com>
 <YNNbg6jU2dD8VNiU@redhat.com> <20210628174216.25ybfzmtbiymgd6s@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a22c25e6-e44a-7be6-f173-ddff8da7551b@virtuozzo.com>
Date: Tue, 29 Jun 2021 10:23:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210628174216.25ybfzmtbiymgd6s@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 07:23:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e904525d-d5a2-4262-1c1f-08d93aced3cc
X-MS-TrafficTypeDiagnostic: AS8PR08MB6470:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6470E1442D83DE50EF03BE0BC1029@AS8PR08MB6470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLepVsy7vRk46snQlLAVLNIpfPb8bggNFhLGJSxYGjtcK4JpeffTbDGQLdn14AltLZWISHU7kyAMyp+AA1dwuDOuio5zDGxzQZ0zywaqaKXQuwOlmwq9dbBeaeL+jsM/42Axln6TsG2eVtV1jA95nngSIjx9TrKhZaSkWHA9XoL35U/eItdNFOQnAwusjNzi7kQSweScjvws/19stUKvIhz9Rir3z1E1dxi5YhL3YXN3I0Kr2Ub/uKAM/2x2pSyqYAL/AgHW3Pz+XGCh05NULG9iPc3Yxn/XtroF32d4TvRBBrhKAWLb4nEjzZMkWBuFe7L+2sh5zhpzCcSmPm6BbIwY2dFq56D03gvLIBmqmnRNynyZhpGTAc6SM/auU2Ct8BB8fvzRjLAb0Jp9AJZpCmNvi1B8AXRubB8eiP774O6yzopj+rJ1D3qDDe/ft73eEYiNgVrDaGcbncNqFOo/YITpCx+uhBNghZ7tGsaAkniR429bxud4bas/agv1blZMvsjxiV8svzBnHnKhr0gW1V8sENA7QiiP9L9qnVbKOwH0x3A2JiPzzb6cfV9NIyfn53qtVfL3d/F6KRnaMInAiuM39smTwaJWtWYyYbT151PlvxXe9lQxieCktjxF5cgtYJ8BD5smo5ptI1CXtpvlkRlvzsRGC4RUa7IQBDJVvz+wnVC37pQkhH8Ha9E+8y67Yz2e3wkUSG8qxpkQ8ZmE3Wg+DkiySYfMPJCJiT8CT+UxnVtAwopRg6Pl+Qi3PeU2bLfhnSOURxDeuU/RXxNJJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(16576012)(6486002)(316002)(54906003)(110136005)(38100700002)(38350700002)(16526019)(186003)(26005)(4326008)(83380400001)(478600001)(31686004)(5660300002)(52116002)(2906002)(956004)(2616005)(8676002)(66946007)(86362001)(8936002)(36756003)(66556008)(66476007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1FVSnBSbi9aZU1ZR1VEV1J4bE5kc2trNWxaOVU3ZHpOdDN1ZkZEQVg1UFUw?=
 =?utf-8?B?bUdVTnVvQnpWTDZMbFM0Q3pmV1J3cnhLQXdzd2RXOUlNTE9UNzZBalV5MDJH?=
 =?utf-8?B?aTgwQkE0U1lsYlc4L2JNTktaclVRTFFXaE1pdEF1Vk1RMEt1QUlBRmhtbUdO?=
 =?utf-8?B?U3VOd2lZd0dCUTdxWFJaUXZ6Mnl2WmRHMVNoYmtTYXkzSnZTVVhUVjA1alhY?=
 =?utf-8?B?MmdDSHNrYTJLWjdCLzBjRGsrWG9EdkZYSG5SNTJITXBmRG04U3gyblVVaXRZ?=
 =?utf-8?B?ZXlEejJRL0hQOUxaNnR0K2RMdmlDbzE4UUZ2SGVnQldZVy9qYk9uSmJQZ0la?=
 =?utf-8?B?OC9sNXRiOUd3Rk96eUpCYTREWWlpaFg5QjNvSXNIcDdnZmwxV1lYeTU2bjcx?=
 =?utf-8?B?VzJDdmZEUmNHQ05ydklXSGNqN1F1WkU3bHcxaFpMTVVYajJuVDNTK1o2Nlpi?=
 =?utf-8?B?Z0hPcHVZZ2kvZ1NZZzRhOTJ0Q2pJWGtTQmRBR1FrWVM2V0pjMlJEZWNzV0o4?=
 =?utf-8?B?b0IxL3hVUWtISkdxK3VZeVJONzYyaWgzQTZDZ1JEZEg1cUxzRDBRMmI4WWFY?=
 =?utf-8?B?MnBXV1hrSGpSbUlzL0dvVUpYb3RFcFhoTXJnemZzRVVDQUdhTUE4ZFF3QzZZ?=
 =?utf-8?B?bGd5djR2V3lDUXFqK3R3QnNnK0tIOWlnOG1uLzh5Rit3RGhYY0MzK2kwd3JP?=
 =?utf-8?B?bG1laklMZmdEYldsSGRPT0dURXcyaG5UdkZZY0UzTGN5WEFMRUZXSDc5QjQv?=
 =?utf-8?B?UDBrcHFzNzZqMU52VjlMM1FvZENtZStuaHV0OEczdngzbTg5QVA3U1Nsczdn?=
 =?utf-8?B?Yi81bVluYUFWNXhRbUQxTmUwSTJheVBmNGpzVmtjcmhuVmJtYnJ3cFllaWdz?=
 =?utf-8?B?MXlZNDlDYVJSajhhUkhNZ2NjUDRYVHkxQjJPWURCd2lyUUZQUnV1ZHFiZCtT?=
 =?utf-8?B?RWJ2MFJkVXduYTBYMjF5UnhLTUY1QittanNuTU9FdW1iaWFoejF5Z1RBWTAv?=
 =?utf-8?B?Tm1JNUNlZjliUExFWm1semY2SkxTU3Z0U3FXWmN5Yy9xTEkyYm9rdTlHWEVu?=
 =?utf-8?B?bUhiUWtEOFoyTHNkN0VqNGNEYXZaN2RjdXEyWFRWeVhGYUtESDhGM2FjYmZ5?=
 =?utf-8?B?VWVFS0RtL2JXS1Yrd1lSNDdrRGZNY1hlUnRXdHdpb2FkYmtBcVF4a1hyTUUx?=
 =?utf-8?B?Nm5PL1FQNGorM1ZVcXlEQjZNSit6VHFrUnVRUk1hT0dzeFd6Z0NXRE1td0R6?=
 =?utf-8?B?VXVEcXNrWFRZbmdSVnV0SGtMZW9vb2EySlp3Nm4zUFFNVGxNMjVVRTgrdGxT?=
 =?utf-8?B?V1JYTW5USjFwMi9EU1NCbFE5dzc2QmZzYXlRN2VscCt6OWRndHV4SGwvbFJk?=
 =?utf-8?B?Q2hLR0xEc0ZMV1RyM1dQYUhCcmFtVWxzNlNtcEkxS09iWCtBVXJPK0Z4aUhi?=
 =?utf-8?B?bmdBaTlJTnFIK0gwWVQ5TTlvRGloZFNEQzkzV2RkdjFPOTdyN2ordWREbGFQ?=
 =?utf-8?B?MkVjTDdKVjdTa01ibU1iRkVObS9xaUdObUk4S016cUR3cUZESjZFd2FmbFcx?=
 =?utf-8?B?L21hYmsyVlpFdGU0cy9PeTMrVzRKUDgvS3paMGQyT0NzN1piRFBaalZIbUdP?=
 =?utf-8?B?Z1FWVlRmV2RaOHgxVWRnSDZpUUJ0Q3ZXZTB5UHNKdDZUeFBTSWcwdXpMcXBE?=
 =?utf-8?B?YWkxSGtsb0xYc1JTOFpjT1ZFRmcrcGVTN0RXdFJDc1dLU25XUmg4RlhJWnh6?=
 =?utf-8?Q?gs6yz6M8DNRwMn/VVpieX4uuJmIu1q4EFrT9F7c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e904525d-d5a2-4262-1c1f-08d93aced3cc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 07:23:44.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36/DahS8OKTc8FZqAeYPmmmLeVvwHNb/zNw528JB8/XmQtVo7mhgRxoLILn0lmI4Gm6hS5QBPKqPa7Vn+kDyPrZIACZFc8+FOzQeJLOHdzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6470
Received-SPF: pass client-ip=40.107.4.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

28.06.2021 20:42, Eric Blake wrote:
> On Wed, Jun 23, 2021 at 06:04:19PM +0200, Kevin Wolf wrote:
>>> This is fine, but it means that this flag will present in all ranges,
>>> instead of only in unallocated ranges (what this patch is doing).
>>
>> An argument for always having the flag would be that it's probably
>> useful for a tool to know whether a given block is actually absent or
>> whether it's just running an old qemu-img.
>>
>> If we didn't care about this, I would still define the actual value, but
>> also document a default.
> 
> So to summarize, it looks like my v3 will have the best chance of
> approval if I go with always outputting the new field (instead of only
> on one of its two boolean values), and put it at the end of the JSON
> output.  It also looks like we have consensus on spelling the new
> field "present":true for data found in the backing chain, and
> "present":false for places where we would defer to another file if a
> backing file is later added.
> 

I didn't follow the discussion carefully, but that sounds good to me.

What's the decision about patch 1?


-- 
Best regards,
Vladimir

