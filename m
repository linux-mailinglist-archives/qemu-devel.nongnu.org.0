Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35856348B39
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 09:13:48 +0100 (CET)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPL7i-0008R3-MX
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 04:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPL4w-0007Tc-BZ; Thu, 25 Mar 2021 04:10:54 -0400
Received: from mail-eopbgr140105.outbound.protection.outlook.com
 ([40.107.14.105]:16133 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPL4S-00070B-3G; Thu, 25 Mar 2021 04:10:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnXCZpHyT0qgKFLDDfGbtXZWyIQIdvY2l51/w5LurhggNuHvn7T6DZwaR0MuRDnYbghbRS2qXKmMbSfJyPSwDKtMYvINmzPI87ZxIrZrrWXMn2QegL32Jyx2XGjjYSZYyiQrJqN6Bm+MlcJTJffysHLMuYWC2deSyffmjYODi4cJ/BFcC+HHAKK3mu3lWkC3jfyAWxm1tFt5G/6QfZarbvT2foqlBl8eoNwY72PGuL5yeYkoFh0GB1tqJEye3akpC+Q/l1DxtRN6SgsbuBRlAdgHgLNZofiBN84k97WhLLP0tQd6o//EO3Sm+e1UKNFZd1g11AYvEjFT3/vjRL/33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRBrW+rAC9KT4v3lDWNxjIinxJ6aAr0NQY7TyGuHf8o=;
 b=igLGOMlvqeW0KVIJJy++yW1Mk4FAl6aeBx5QZZtExI+y96tndCUEV8sja0tLj7kEfVAzYFdRNIjR0ArCYsPtYVLnF12+SN4oZN3zAK/WDIO8MjiQ24Mhpy+g8GSwfxi4cVt9t0hnXnAIwVTZz4ri0UtuOAyDqHPszRUr2QMfY1foK+8ItaRVWBVz/knwqfIj9sBd43ov6094yeeOCCOGhSLHaFqM5rscz5cORdf7jkA5krx35prwswh5BmlDylGsGassX/yxUX2K1kTE9Gv32qB/7h/cwjlozp0OkKDfC5ec5glpckN//s3nzgMm411p7/GuFNbsZW3ggKlrk7WP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRBrW+rAC9KT4v3lDWNxjIinxJ6aAr0NQY7TyGuHf8o=;
 b=H5kuzOqcmDY3Icwckbk3RANcjOD/AqmNvvRUKkZKfyyK68pM4OXAb1bQhD6yi5QXXng/pTt2bz+RGkBVOgbse5/DbuaPrSMMSsgHHhMLy0hW3JI0V8UhtT35AiG9YAMLrBXC05UaI07P0xyXq2SFnrZrJ6Ts6L9N/74lzb5NcX8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 08:10:11 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 08:10:11 +0000
Subject: Re: [PATCH v4 00/11] 64bit block-layer: part II
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com
References: <161662043558.28197.16335181787861259759@72b6d80f974b>
 <0198241c-8a18-7e67-facb-47387b131fa8@virtuozzo.com>
Message-ID: <188ddddc-f6cd-ffe9-74d3-5a5f91d11168@virtuozzo.com>
Date: Thu, 25 Mar 2021 11:10:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0198241c-8a18-7e67-facb-47387b131fa8@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.15 via Frontend Transport; Thu, 25 Mar 2021 08:10:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29345f53-5375-4e70-c4f1-08d8ef656984
X-MS-TrafficTypeDiagnostic: VI1PR08MB4334:
X-Microsoft-Antispam-PRVS: <VI1PR08MB4334B1BE545B3DC9AE692175C1629@VI1PR08MB4334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjtXFkMXoqLZbngVCDdEdUCIHpszdmYwXyliATabFq+cfxS4lXxIIVP3gI7507KVYhs2uTsA1j6DeNBWpOc/h4KFlujdn5aQW3gxbuJ6FUIF1hbghNFSvtSgzB1/OTc9gSggnf7fTdUkol4RjxAaC78FscMn3yf3t3cuA0kuInJGmGLJ06T2oEF9oGcS0z0kq1MX3qD4s4Cle+/72w7SvAX/WApz2Z+TxP/CxGseGnEijNFyUcQ9YyOAhF1q0IQ8OaY0zoc9JRY4DlYt+sZvhXCKtDNqN4g6kQMV+4ZFlE+cXqIJsBYkEfFu0k3wbGfrOHw1rF3StvrNMJ1jj+L4Kbd3YoSayD+W/AxeSPL9Xdr0pdPmUgXdTe61srBOWjBdsoEqS9MKCZHz++Q6V6l5bqRvqRl01DXi81ny0/0JxFxW8tLqRz/mbdDVw/cYat94Z2gFEXLHHK1KlsfwiqyxHTCz980seqGnYJEV679m76mfujSdxy5efhlh4NBgJBW2Em6p+zBrLmF5GJ9CRBy2odGiOksDjPBgI3V2Q2S1Lp66sQWU2/s8UrEJGZVGV98TPexygyZlusMWRKi3TEB1OHo8+8y7PiIkPg81TLJcTNrLR0/LxWcJGR49eEHnYIqAITC3NJbX4sl+4+i5oJXai+opsAFEjB3a6YhNxUe0Baw6bLwnhO02ha01g7/nEHoJvcqxhBJh+zU9ND3tkuJIltncXsBNpAQTCIn5+kUFBRPm71itPDYqen1+CJn0SMa/gVDbQa3PdcFfPZNbI//wwsxBe9TEGrmSnlwkCGyhqUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(366004)(376002)(346002)(136003)(396003)(16526019)(8676002)(86362001)(316002)(26005)(5660300002)(16576012)(8936002)(66556008)(956004)(66476007)(2616005)(186003)(66946007)(4326008)(478600001)(6486002)(6916009)(31696002)(38100700001)(2906002)(52116002)(31686004)(966005)(36756003)(7416002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?elBSRFBXTlVKQ2Nmci9SaktEcGJ5dmRzTW9yWkFjZWF5aVhBNFhZRWpTOG9C?=
 =?utf-8?B?VkMrMjVVTStJNEE1MDBPaW5VajNEUVdMY1hMV0k5aXU4Ti9rcklPZjk3eXo2?=
 =?utf-8?B?UW5QeHNsbDhjVDdHd2JLNC94RXU0NEsxbWgwWDh6dXNGZHA5UHgxcUdZQ0g4?=
 =?utf-8?B?L0ZJT0RuKzRTU2hURE13VGNOTWMxSE5nYXRnWUVQTHc0VWhBQWVvcTgwMkln?=
 =?utf-8?B?ZjRHNjZsVUJGVVVyeE84RzFoQmpPRVlaTUs0d1RyU1p1T2ZQZUlla0JUcXFi?=
 =?utf-8?B?dGYxR1Q5Y055NkYvZ1hBZUFBYUdYaU1ackcrUkNEU3ZZa3RWT2FXRmxFUW9R?=
 =?utf-8?B?d29jQzhXYk8wRVE0SEpaMHMxWlo5ZXVzaENTdFpUcGNGMStHdHlZTWc0REp4?=
 =?utf-8?B?Zk1vcGU1NHhWUEtlVzJyZVozelNkMFhRZ292akRaMVdsZy9nLy9GWHdYdnpk?=
 =?utf-8?B?Z3RHYmJsT2pLWkhabHJoNTd5blNxclA4SVIraWtkTnhOa0hQa092OFBKeW5H?=
 =?utf-8?B?UktHT2YweWRTQjhUNytjaG0rb1pMSlBCdUZRbVVidE9lM1NNRGg1blN6Yjkz?=
 =?utf-8?B?YzJUWUc1SnJ6bjhxZ0VzN2xkQk1na0g4aGpUZ0xnQmJwYXJyM2NMSHdoUy9C?=
 =?utf-8?B?MnliUnlJcVVyZE02VWREWFVkQmdqY1pIK0xYRFRZUStXMGpUaWkzVTl0NGI4?=
 =?utf-8?B?cEU1RnpOeVJhMEdHdTQvOG5ya2p4anZHZFdaL3Zzd2Z5UWw5ZDFDVjg5enly?=
 =?utf-8?B?TGQ2bTNqYWZUd2ZabVFKS1FnelJLMC93RTVYdndnYUoxUkZLTm9leEt4b2hF?=
 =?utf-8?B?N1dVVHhRQ1dUTmFWemV3TWpBWXQ4cHUzS0ZLa1prb3pwcTQxM29PcXpaZE92?=
 =?utf-8?B?c0FtdjkyZ1lmc2dLKzh4YjIzQXBZME1rQ3ZNc3VtYkpRTWVhcXNUeDBVOHgx?=
 =?utf-8?B?dVBkWGp0V056dmhES1k1NUNyOGE4M05jUjJaM3B1RHJ6MEJoMHhZSHM2Njk4?=
 =?utf-8?B?MFFmNkVnVWxVeGRTTHNhUnlNeGNvQ29nejd1Y1AwaDA0dHZpSnc4UmJBZVBy?=
 =?utf-8?B?K0t4UEVSUWFiRWRaK0plRDdva09LYmphNkpPU1J6bElXV1pPWUhNVUFGcWpT?=
 =?utf-8?B?dm5tTkJWRnpsZXNwU25HdHU0QUUrckVENmNnUkZ6UVFBY1g4YmhkbDNqaVEr?=
 =?utf-8?B?Q0IvQjJhbmhVVGEraEJuUHpGaFE1ZmtIUHpVTVNTalIwaUVFSGdrZzdOOXdW?=
 =?utf-8?B?SHlDc3BVNlJ2dGIrNkFRalhnM2dpdEFSSEhLWlJpVUMxbjk3UXFnMUZobS9H?=
 =?utf-8?B?bERycmt1YkhnYmFTUFRiOG9qM1VUNTl4TWVPdVFQaGRiaTlPUWpUeEdZTENW?=
 =?utf-8?B?Ky9DSU5SODV3TkdGZFVIMFdpSHNDU0RhbXFqSitRQWNWRFk3c003dmsvbkxv?=
 =?utf-8?B?ZFlyaGtEcE9aZERKb1RCMnVaZG1MNzU4Rnk1Y25XMk5sUWVKcG9Dc0xHNDZF?=
 =?utf-8?B?S1VXZ0xVaFVCbGZQamVDMVRFa3RDeVJGdFQxK0lpNGFTT291UGlZL3dSV0VW?=
 =?utf-8?B?aTJNbTQ4bFhwYW1CQzFFdXhFQ0h3VGJpNzZpTWtkVlJCU1ZSSFRIQklyYTlE?=
 =?utf-8?B?TDJyOHhMT1pHM2lzT3d3Uit2MVVRWGVReDdlZkhJQmYrdStwa01sZFpZLzhT?=
 =?utf-8?B?THFvS3N5cVZPSTNZT1AranE1dkNPaHN0T3JWa1c2a2VPYjhvR05aRmhQUEc0?=
 =?utf-8?Q?hkPlSM8eQEDKCFk29Ra6UR3TFIbuaAP1bCX50bI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29345f53-5375-4e70-c4f1-08d8ef656984
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 08:10:11.6279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LLfCxt6v+QXfb6xetmYr/kaezhfnk8ZLx8jpuSSmEHe1ZsEumAHnP+u5s6qCmDGlGU3a5VCiy5DGoUT763vDsd0rpRmPXSUIDBC21NFX7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4334
Received-SPF: pass client-ip=40.107.14.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

25.03.2021 10:42, Vladimir Sementsov-Ogievskiy wrote:
> 25.03.2021 00:13, no-reply@patchew.org wrote:
>> Patchew URL: https://patchew.org/QEMU/20210324205132.464899-1-vsementsov@virtuozzo.com/
>>
>>
>>
>> Hi,
>>
>> This series seems to have some coding style problems. See output below for
>> more information:
>>
>> Type: series
>> Message-id: 20210324205132.464899-1-vsementsov@virtuozzo.com
>> Subject: [PATCH v4 00/11] 64bit block-layer: part II
>>
>> === TEST SCRIPT BEGIN ===
>> #!/bin/bash
>> git rev-parse base > /dev/null || exit 0
>> git config --local diff.renamelimit 0
>> git config --local diff.renames True
>> git config --local diff.algorithm histogram
>> ./scripts/checkpatch.pl --mailback base..
>> === TEST SCRIPT END ===
>>
>> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
>>  From https://github.com/patchew-project/qemu
>>   - [tag update]      patchew/20210323221539.3532660-1-crosa@redhat.com -> patchew/20210323221539.3532660-1-crosa@redhat.com
>>   * [new tag]         patchew/20210324205132.464899-1-vsementsov@virtuozzo.com -> patchew/20210324205132.464899-1-vsementsov@virtuozzo.com
>> Switched to a new branch 'test'
>> bed608a block/io: allow 64bit discard requests
>> 9b3b5c7 block: use int64_t instead of int in driver discard handlers
>> 9d5776f block: make BlockLimits::max_pdiscard 64bit
>> 1dc4bab block/io: allow 64bit write-zeroes requests
>> 05ca540 block: use int64_t instead of int in driver write_zeroes handlers
>> 5864b0d block: make BlockLimits::max_pwrite_zeroes 64bit
>> 9698c13 block: use int64_t instead of uint64_t in copy_range driver handlers
>> 4e60566 block: use int64_t instead of uint64_t in driver write handlers
>> 8aa3af1 block: use int64_t instead of uint64_t in driver read handlers
>> fc695f9 qcow2: check request on vmstate save/load path
>> a13a9ef block/io: bring request check to bdrv_co_{read, write}v_vmstate
>>
>> === OUTPUT BEGIN ===
>> 1/11 Checking commit a13a9efd128c (block/io: bring request check to bdrv_co_{read, write}v_vmstate)
>> ERROR: Author email address is mangled by the mailing list
>> #2:
>> Author: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>
> 
> That's a strange false-positive.
> 
> Look at 1/11: it's not mangled in any way. Looking at the source I see clean "From:" header:
> 
>    From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> And there is no any "Author" in the message source at all. "qemu-devel" is noted only in Cc: list.
> 

Hmm, but if look at mail on patchew, https://patchew.org/QEMU/20210324205132.464899-1-vsementsov@virtuozzo.com/20210324205132.464899-2-vsementsov@virtuozzo.com/
yes it is mangled..

I hope everyone who is in CC (as me) gets this email not-mangled.

-- 
Best regards,
Vladimir

