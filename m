Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A33A42AE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 15:05:43 +0200 (CEST)
Received: from localhost ([::1]:60480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrgr0-000653-A9
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 09:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrgpy-0005HF-8F; Fri, 11 Jun 2021 09:04:38 -0400
Received: from mail-eopbgr70133.outbound.protection.outlook.com
 ([40.107.7.133]:6054 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrgpt-0001Xo-Cs; Fri, 11 Jun 2021 09:04:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l31YMXIXga3jk2TE1XbEEs6iHhOnCp0bb64kblNp8QWeLKqyqupGqoErZpswZfA5tFvPDqjYl4BkdMTwduGK5Db7RiuGAc2gvFJJalgj7t4wVj+GlimbqONucK+YtD1uew9NScjvXJJXTmnWEa/FQXpj9xg99hRRvc9YRZNngo8os16gDFNSdQPxDMTwMoCM1Ug/xYW/Si4Un1d+M4TpgOidaLpckl898y+1xWEIlpNld3fTs7O9Ggkbv2E1BSsoVXoYM/v+FG0pV/3OEKEnc09uunD9lP+b63UsEtNZsapJOrP6GAhmZj/MoC2iOpfEUBz+WABAlW8xd2WdTm72WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7z+Mv0TfGO9/1zfCSN/IClx6pSrknfsW2fTmwi9Hr8=;
 b=MG+3KiWvG5JwaQYAzxchjgGxbWk1nFPs5GKPzLEM22TDv+9cNMRaOmifQ+Essh+/KlOF8CN90lUESX7tl+LokqJBeiGt92bY9p8rBwLtsESdyJhHDPr3vzGjSyrEtDjx/KyNPWZLpT7vt5w5uW/k2vunXqWRBEbrwd2eeS54OmdEzh02i/lowNIPu01RJ6n5YMdFtKwkWb6TTepcmUG4D2mu+DRmQXO6Mv/2GyspejTgKyzsrlq9uTFxkHPz3LLfWyhrZb+R8Zhc4cfr7l40pT1uoR3xE6nhiVDXNx7pr78y63d6HUAL9nOtTkOJ1dmewqqfN9fSUJZ6H8Z2p7GCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7z+Mv0TfGO9/1zfCSN/IClx6pSrknfsW2fTmwi9Hr8=;
 b=M6YbzpsYZH3dS2NIBoH/h2bR2RSGYoTC7ZHX9kb4o2hY/2bV/oeQNo510n3jg95VarH5NokslRbIj71mCetwxFEz/7BwatEVRUb0BAZ6V9r5xkCWHUqPuJwoWuPoEq6NpbPkDIpVt//vEhlDWuUqW+MM+9Vwx0WFZUCveHLFNPU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 13:04:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 13:04:27 +0000
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
To: Kevin Wolf <kwolf@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 Nir Soffer <nirsof@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
 <20210610204617.fuj4ivqrixpz4qfj@redhat.com> <YMMaJcKYe8nHDdjU@redhat.com>
 <49ed9c03-eb24-4e8a-1b5f-8a291466a7b9@virtuozzo.com>
 <YMNHSZ+Dc8v7/80Q@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b802235f-ab6c-7efd-8bb9-f1fcc0f2a2e0@virtuozzo.com>
Date: Fri, 11 Jun 2021 16:04:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMNHSZ+Dc8v7/80Q@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR1P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR1P264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 13:04:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a70e1bf-3a19-4142-77a9-08d92cd971ac
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-Microsoft-Antispam-PRVS: <AM6PR08MB372083A1EF88FF4CDF72C424C1349@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLoeYWSVrz10zqR8r95yprPDLH8MpYXw5Nu0lxuLWluZgdPZUmoder2/gKGXIfBMdCnfPgPSuk4Yz4iek3anGVp7Biq5IFYqnrTuNauctH1NVB3edjHuDW/tncL79XhH06rtTd2nd9eyxII17sJ14topnzkOxGZkhrMMOZr3JdOjvvTE0gqJYeGES/DGkhZBtqCtIBAq4BpnTcMo4FpiK758pWTJEC273pwrdhLs3pk20Q9FQ3uA9k/M/eunEZj/QDo3JGMhYJugGqIhkrElPI427/AMqiZuSMQv1ZYG/fMbfx8BImGsmUAgtE1vsMttses0+HAaXWiEYP2M6lKKwgpbcUNs/n52yE3P/PAtH5CgiOWVsAsX9/HQrIKA3tYPSDzzQbSepJa0dAYie7Dnl4s1SFD4cPwiROjFrw4B93jKKWH68yn9M+KPWqxIvMIFICBCMNnsyQWKGy+192Y/3y1UGuIZNFaGv9FhLFsE4ppaypMQyUeC7cyBHwY4CUyFqg410dl1+a7uhCDxFwLl8gzS99p20cebe+JhC2n8qym8jZRmZJDkCgnajGuyzSCM2p5XnDS+tcYA2cQoS7c0dwI0r8d77wKEUSUnVrcMZaesL3Dh9Nek/05/1eLTvmOIByuElTUKKni0d6gWuYR6CX+H30DWe6YEma/7h1kB3zFkoFoTLA9yG9iN+U1M9BAs/Lx0CrLwK57Rxf3ta3eXLS6Jg3+i0s212tJ1bXDZSPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(366004)(396003)(346002)(26005)(16526019)(16576012)(186003)(36756003)(86362001)(956004)(5660300002)(66476007)(38100700002)(31696002)(52116002)(4326008)(66946007)(2906002)(54906003)(6486002)(316002)(31686004)(83380400001)(8676002)(66556008)(478600001)(6916009)(8936002)(38350700002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEIwaHQ5ODhJWTFoTW11OGZyRFlYV093VmpwQitnOWVDN2F3OTdqcURpbEg3?=
 =?utf-8?B?ZVBGamJuT1l6WmpYV3B2Y0R5RERJVkVqOHo2M0U3THRjMTdtZ05jQ1lmSXZJ?=
 =?utf-8?B?Y0owM1oxVmtYQU1hcUdyK1Yyc2ROWGlEQWRKT0NYcXlLNHNQQ0ROUXNCZ0VG?=
 =?utf-8?B?ODdaQ3R2MEp5K0NjeXM4RkZ4bTRYcEhvL2ZqY0NYSEdJTmZsNVkyLzBINkRo?=
 =?utf-8?B?UFo5ZlB5YzE0cGxKdXVEYTFvVDR2Kzk3YnhheTdjUFJrbjdlanhsTnVzNXV1?=
 =?utf-8?B?b3ozSUh4R2swR09XYVRXbldIcGY2elFXVitYOUdwNkxiYWRQNGFEbWZBQnFE?=
 =?utf-8?B?WEZoak4vL2R0QTVXdmRSTUZmdDdoVFFGeW5zSTVBN093QUVabkpJbDZOYzI0?=
 =?utf-8?B?RmdZZXZad2xrZ0pqZU53Q2JscjN3cThWRE9EVnI4YnZDNE4zQ3lYQWtuQm1C?=
 =?utf-8?B?NkZlQUFJTVBHWGp1alBCaWdNam5PbHlhV3BDMEJ6SG4vMXJRSFJGb3Z1SEJs?=
 =?utf-8?B?eTBlbU1YWUFYVENuZlU4K2s1MG9ucisxaGZHSnFpOFp5am04TEVrWlVoQUFp?=
 =?utf-8?B?UDYvckpEUnM2Qm43eHdaS2hkYW12dWUvRmZiakhZaGllRHBCcUR5NCtvSGk4?=
 =?utf-8?B?Zmx5WXppbW1DL2VRRFlsTXNwUWg1a3pvcUVOR0RhVmIrNnUyZEorWUxmd0NH?=
 =?utf-8?B?dlpsQ21PQ1VRdEVrbnRrb29WZ3ZtbS9kYTU1dUNrajBtd1NiSW5qRkZMUjgy?=
 =?utf-8?B?amljckpoL1RuZ1NvZWluU1AxcGxhUXBRSzRxMEVDN1ppSWlXMGZ4T0J6LytI?=
 =?utf-8?B?Q0txZmsyckxVMUdWQzU1YTJOVm8xZnJpbEl0WWFFOVFacU1TNmZCRldzV01u?=
 =?utf-8?B?cHZ1RlFwRDNaNEhDNzJWU2E0d3UvRlIxRVYvNW1ZM1dvMm0rZmNtVHdhNDZI?=
 =?utf-8?B?aE5EaW8zZ1B6Mnl3MXBuMS9NR1pIZFl1bzRkZWZrN2ZCczNPMnljSG1kbm1i?=
 =?utf-8?B?b0JkdWttdWZGQnhEM2piUWZhMnpYSVJKMGx6NW1jeUlGVEYwZGlGeVRzWWdw?=
 =?utf-8?B?dEU2WnNXRllvaDM5VHJnbTV2QnEyL1k2ZXErSjR4bkRsaTFidklwTXpXbzI0?=
 =?utf-8?B?VFYwYjFibDU1cWZ1Sk5jc3JKV0gzWUlVM0ltaW5maWwvRE1EWFRFNFlmOUVU?=
 =?utf-8?B?dlJOMVR4a2JUQ3lzV3F6TkNtaVp1bFZXYm0wbGdiRlBud0tycTJmSW5WRnhx?=
 =?utf-8?B?UjQ2aGNVazAxZWhNL0NDSG91MVY0ZU81di9HODduQ0tlNldXUmkraHBud2ZW?=
 =?utf-8?B?ZFlYcCtPQisxUnlBcUdjclFFLzIvMnFQTzR5cXBiY1dEMi9xSGdjZ090RjRl?=
 =?utf-8?B?SmJSK1hqUmhFNzZmWW9aRThXV3BtVlJiVVlaVGJnWnU5TnJSbW1JZmt6cFdL?=
 =?utf-8?B?aS9DNTJXQjhPY0VHc0s2eFk3bk56L0RwODdXMWhvK2hCNzY5MFc4Q2MvcUV0?=
 =?utf-8?B?cG4xNFlTZk9LTk4zdG9ROStSYWJZTDNHUnBJZU9jcUswbEhvOXd1U0ZYTko2?=
 =?utf-8?B?dmRUSWJrQSttVHh2RlYyQ2czenVKamF6S2tyQmVrK28xSjNuUnJOeUdXYnhN?=
 =?utf-8?B?Mk9pTTRHTUprUWNHc1ZBSUwxQnBDQWxSOWswdkVzU3JDb1phd2NuUnNpcTdz?=
 =?utf-8?B?aE5sTFZaN2dFY0lMUVA3eDJPSTRiYi9DR2E2bW9DUzRtZUNFUXhBdkZ2VUVY?=
 =?utf-8?Q?DsOB1yTo9AitlXp2G9pzKF+ldFKQzY4nNy3Paxh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a70e1bf-3a19-4142-77a9-08d92cd971ac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 13:04:27.8021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSyzahF6Lw/OKRQ1IPJcQS7NDDNJ9qNILzJc+bd9nACKMsf/kvJcdRbx/LMxaBprnxZG6EiNi9crpn4Vk2D3+ZKIwm9Oq3YZLUkq/hA1H2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.7.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

11.06.2021 14:21, Kevin Wolf wrote:
> Am 11.06.2021 um 10:14 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 11.06.2021 11:09, Kevin Wolf wrote:
>>> Am 10.06.2021 um 22:46 hat Eric Blake geschrieben:
>>>> On Thu, Jun 10, 2021 at 11:09:05PM +0300, Nir Soffer wrote:
>>>>>> But:
>>>>>>
>>>>>> $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2","backing":null, \
>>>>>>     "file":{"driver":"file","filename":"top.qcow2"}}'
>>>>>> [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
>>>>>> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>>>>> { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]
>>>>>>
>>>>>> also reports the entire file at "depth":0, which is misleading, since
>>>>>> we have just been arguing from the qemu:allocation-depth perspective
>>>>>> (and also from bdrv_block_status) that the qcow2 image is NOT 100%
>>>>>> allocated (in the sense where allocation == data comes locally).
>>>>>> Perhaps it might be better if we tweaked the above qemu-img map to
>>>>>> produce:
>>>>>>
>>>>>> [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
>>>>>> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>>>>> { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
>>>>>> { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]
>>>>>
>>>>> It will be more consistent with "offset" to drop "depth" from output
>>>>> if we don't have it:
>>>>>
>>>>>       [{ "start": 0, "length": 65536, "zero": true, "data": false},
>>>>>        { "start": 65536, "length": 65536, "depth": 0, "zero": false,
>>>>> "data": true, "offset": 327680},
>>>>>        { "start": 131072, "length": 65536, "depth": 0, "zero": true,
>>>>> "data": false},
>>>>>        { "start": 196608, "length": 65536, "zero": true, "data": false}]
>>>>
>>>> Yes, that might work as well.  But we didn't previously document
>>>> depth to be optional.  Removing something from output risks breaking
>>>> more downstream tools that expect it to be non-optional, compared to
>>>> providing a new value.
>>>
>>> A negative value isn't any less unexpected than a missing key. I don't
>>> think any existing tool would be able to handle it. Encoding different
>>> meanings in a single value isn't very QAPI-like either. Usually strings
>>> that are parsed are the problem, but negative integers really isn't that
>>> much different. I don't really like this solution.
>>>
>>> Leaving out the depth feels like a better suggestion to me.
>>>
>>> But anyway, this seems to only happen at the end of the backing chain.
>>> So if the backing chain consistents of n images, why not report 'depth':
>>> n + 1? So, in the above example, you would get 1. I think this has the
>>> best chances of tools actually working correctly with the new output,
>>> even though it's still not unlikely to break something.
>>>
>>
>> Did you consider just add a new field?
>>
>> So, "depth" keeps its meaning "which level provides data".
>>
>> And we add additional optional field like
>>
>> absolutely-completely-absent: bool
>>
>> Which is true if data is nowhere in the backing chain.
> 
> Or how about exposing BDRV_BLOCK_ALLOCATED as 'allocated': 'bool'? Which
> I think is what the conclusion was already for NBD, so doing the same in
> 'qemu-img map' would be consistent.

"allocated" is historically ambiguous: we never know exactly does it mean "occupy space on disk" or "data (or zeroes) taken from this qcow2 image, not from backing".

Eric recently sent related patch to libnbd:

  [libnbd PATCH] info: Avoid ambiguous 'allocated' terminology in mapping

> 
> This is, of course, almost the same as 'absolutely-completely-absent',
> just without the negating the flag.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

