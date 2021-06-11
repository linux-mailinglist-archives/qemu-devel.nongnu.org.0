Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7B3A3DE1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 10:15:37 +0200 (CEST)
Received: from localhost ([::1]:48718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrcKG-00051j-0E
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 04:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrcJJ-0004Di-4i; Fri, 11 Jun 2021 04:14:37 -0400
Received: from mail-eopbgr50107.outbound.protection.outlook.com
 ([40.107.5.107]:49988 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrcJC-0006k9-7P; Fri, 11 Jun 2021 04:14:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWIveSsqrpD4vLmwcv756xJJjXnSyNEQzlDcoH01my9tCIsfrqD8hBYEg5PdMH3SgIagooELViI/DOFTYzMqrZd9/LGfNTmHfeY+YfV5GXD67HbhCMW+2Fgevu0SZhgA6q0Sl0AgkMQWYeDagt2WQcRHS5cgHIg5xVDc/IZmzRbto89ghX7XcUNF9/Zo3xsGd/agpJJlMuQSt1gpdwrx4GKM+ExlSNXPIzYPy+8u11rxEtGhHmhMW6dVYzhgXdtcRmHRvLy49XwqL2321mqyrOEjXibP+eEZguJku/6aLT09VqaI0BtT4/EmV12lZHwG0Yk4DdiQa+zt9PkAcLuaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0BVEVseCty52pzU/8fjh9wBwMIiIfTjbW31R8lHHC0=;
 b=J5A/xWC+Vwy3phdyx+3LZo5Ki5kVgVe71cuVKBxtYWjF3oJ9SuFz8HGxfxcocTxH493Gel2YIMFj8CkAPWe2E9FOiAJzXFAuhX+jp+1AYvbSE6MPaVCdmjXeRTXWwE8gZVQmclL/DVTHUjBRPQ8E5FoNHHqP1YSytTDF3q3XmVSuLw3BtFq6BxOKh4pWfERtQ5IdyozNSZp8qkbZPKnH0MXOZINf0NOmFTGo2cSud2jwyFcSFlQLWBBf8oC87rsvFfFBEJ2HrQsDrjBnb9nfIJLTM3vbnMGymhxjJdQ3jtKANitr0TIwEzQrT73AbqX4ExyfZBL4HBdsWWzWMwNhKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0BVEVseCty52pzU/8fjh9wBwMIiIfTjbW31R8lHHC0=;
 b=nJEgbVl+yUL+Hl9KKsJWrraxNzi9wqtUn6Tp4LSOehdf6xRcuTlIaxcDdKm6GMMU7QLoqObZ+Fidm7GikdG7Ko9lxX79THqzd918O4wihJsoucA/Ge9pzd+cAVA8w6DzOJKGU84z7HQcaGW1o/da+hkQGcO4zfYz6NoPZUGol5s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6501.eurprd08.prod.outlook.com (2603:10a6:20b:338::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 08:14:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 08:14:25 +0000
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
To: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Nir Soffer <nsoffer@redhat.com>, Nir Soffer <nirsof@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
 <20210610204617.fuj4ivqrixpz4qfj@redhat.com> <YMMaJcKYe8nHDdjU@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <49ed9c03-eb24-4e8a-1b5f-8a291466a7b9@virtuozzo.com>
Date: Fri, 11 Jun 2021 11:14:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMMaJcKYe8nHDdjU@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 08:14:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dafd5eb0-1c0b-4e80-e880-08d92cb0ed0a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6501:
X-Microsoft-Antispam-PRVS: <AS8PR08MB650105BE1E542678B8AD851FC1349@AS8PR08MB6501.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BIn25m13W38oSGrsNHweq6HYJC0mm57pQjr4gO8wBOuk3Jn8tYVkFq+Qju8XLiK9jUBSjHTw2mToCzOuR0UD5RwRgnVxo4BuffrWhZAmVgsecVvZjT6NtFQKa0zMDH8V45eeqv0WndFuarySVDQP65x7hU9XXFb/9JVQJ1L6Xxcz8Z19qh2kRqjK25BW53XbkaOuhYybu/2buOYAEKRta3K5F5wOB6x/X19xXFYtuuW5Pbet+GKWSIquHMZgLW2tTJXi/Gob+nxjxRtApS4rcUfMKZae4PwLMMK7NzCkSdy6aYaqQKppmnrNWhbJSh0cqaNzP+R/2dlesKBfjpnATpsauqoopKESYX8Ri/1QvuvbsuPDh9nL42za3pb9ut9y5+B4pgVpCI/06vqux0676auxgKyGx8sJ5lwf5Lhw1dZOFXvhgkZuido3wtxxmjJw1lsJPmMxAX/mvkyETAPSQBV3PyM68oEQVsG1AOj3Rkoe+EQN+li8/wdtVPARSTwi4wcU5K2FbeDEZJCYAGJ9Nee0ZWZC5LlXZMbpKLaRfEUGqrmiWGvtL4MFyG3BaG7jMiP6R1AsWuGhcvd3FL7TvN7YO2FkcvDD9WESlvSW728GKXfUOC5jsO56CBz4O3UdUXP+8Djruktu2n6mFcY0iO0EKFIbrV6vvATEUUw/siNO0C+FS5UTbmKydfMzYnI8QafYGI2OGpKHETNMQst+cBMqS3TqRvZ06lWHMJ26BLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39830400003)(38350700002)(956004)(5660300002)(66476007)(2616005)(38100700002)(66556008)(31686004)(16526019)(36756003)(316002)(16576012)(186003)(2906002)(8936002)(54906003)(31696002)(83380400001)(26005)(110136005)(8676002)(86362001)(52116002)(6486002)(4326008)(478600001)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXEvbmJSS0YrbEROelpOcDdYV1pZVzh3SVdGbzVtcGcybk9HbnZtMW5URVVl?=
 =?utf-8?B?UDRHWU1oM0xyTldBZlJjUFhQa0ZrcmNBQk1mN3F6cnBKb3N6ZGF1aVVZTHBr?=
 =?utf-8?B?aUlOanVhQkhkczh3REEvMENwVzd6TmRTK05uMkFKaHB3dHM4TEgrUXo5NG9X?=
 =?utf-8?B?d1k2VXRwZFI1QWFVVTg4RVdTWmI3U0h2NmdGYXpreTgvZXpKa1BoNjRVV01j?=
 =?utf-8?B?dEI0eE93R1grbFdVTWdtQWpPN0pkMXJ5eVd5dENxZUE2RGFNL0Q0U1h1dnY5?=
 =?utf-8?B?dDdDTzk0U09FdENIQUMzOFVxcG5VblhKREdFcmx5ZHN2TkRsVUhQUG81aU1E?=
 =?utf-8?B?aDZEbkVzT0hxY2IrMzZ6cjZvK3hsZWN4V0FMRGxBK0VDd0xreXRmOVo1UE5O?=
 =?utf-8?B?Vzl6Ry9Ga0d1aHhrZnR4QURVSm80UXE5Ui9IKzgzbWlWZ1dHUnJOOG91U0l1?=
 =?utf-8?B?YXFVM1ZOL2pvYnRiOVVaV0VQVkM5V2R0TTRjZmwxQ1VySWcvZ1A2V1BMYjIw?=
 =?utf-8?B?VEU5LzV3OVpuYlJCd0t5eVlDbGhFc3lCUjZsRnFnMVo4SEZvbEVLRWM0TWJ4?=
 =?utf-8?B?bERabnhoaFQ0OXVUZExGTG5uWjhBM2dUSTZ3bjBoQVlKbXBsVjhIdFpKK2ZB?=
 =?utf-8?B?Q3lPMnBERUJZcDRTVFZlVlc5bGVkZVc1ejZWa2RrQWNESGk0TG55YkVOdlo0?=
 =?utf-8?B?a05YZVhkOVRPdzhqbzdBOWRtckxMb2REdmpqcXV2bCtsVzNySkEwejNtZnlR?=
 =?utf-8?B?N2hsWmhBM0RtaXhXSTVHU0p0cHQvSWg2T2ZrOG9OU283SHVvcDdBdjdnMkZN?=
 =?utf-8?B?dnV2dHhmdVhxZmlueFNFSkJWbGhQOTVuUk4vU21lTUd5cVJBVW8rVUtwQkdj?=
 =?utf-8?B?bFpmMWVGQWFqWGxJNXdnRlJIOFZBZlpKQ2FaZUNQclNSTGlldmpSdDRlU3pZ?=
 =?utf-8?B?a0xKQzdLcXJyMHpyVDA3RDdkcnQ3dTdWY3gycHdoRGFuaTI4dmxLVUt5aTdu?=
 =?utf-8?B?MjU0OTRWc1IxYU82TEpxWjNtZmJxMUZlT1RnMUxTL0NJUHZMMFBXRlE3dVJM?=
 =?utf-8?B?YzJhZEpOWnZIbGYwOVN5TTgzUDl0a0NSZnhkcEJQb2tSQmE2ZkN0L2dZMGh1?=
 =?utf-8?B?WTl5ZzZPZlFxUmRXakVseVVvdTVsb0VjNllSYUI2TTBiU3lxRDRUSVh0Q0Jt?=
 =?utf-8?B?QlJBb0c2SEN3UW9ISlhRUzRpSHNTWHVydmNtOWNrbkp2YW5Pbk9KYzhydXNv?=
 =?utf-8?B?Uk5jSWFyeDB0OUZQbXljSTBpaDBzQ2p3eE1KQVNTaEpodjdRdWkyTmpybDNu?=
 =?utf-8?B?d1ZQVjd6K0x4VWhlYk9MRlJENWFVM1NOd083d2Vxb1FIN2NFV2ZicndET0o5?=
 =?utf-8?B?Z2hHU1hZWlFqamYrMk9GVHpmdFBvN0JybUhETmVsdHFHZnVOZTdpbFFNNnpQ?=
 =?utf-8?B?RS9EbC9XWlpJZWl5Q0NYNy9TSHJDbGhNMU1xTEMxUnI0L3VINnZxU1hHUCtm?=
 =?utf-8?B?M29pdTA2QXkzazBiSUFmbE5kTWtLSVlmdVBDR1VWYnZFbERCaENzcndMT3g4?=
 =?utf-8?B?bmlrNm81OWlsdS9DVGIxeVUzdTJvcmNzTU1DL2tPdjNJODRqNEZoR1pqLzg0?=
 =?utf-8?B?ZnRUQWNmRE9NOExlL0FvOWRNc2FoVHVvajl0T2l4Y2F5RStTZWhSMDZLUUhC?=
 =?utf-8?B?SjNsSXAzd0g2c2pKNnMvTUYybEZhNTdFUndxcjB2VW9mdGFGYlJBaHNBeE1I?=
 =?utf-8?Q?KE0T15sPYnWVJNvpKYwCuQuMBzOYH936EKLFeqU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafd5eb0-1c0b-4e80-e880-08d92cb0ed0a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 08:14:25.3104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOLR0gtCJZoo2eH+3cUsR013RRDnCCQsVkZtEE5CJeEJwufVrqzJf93qyC67qwlfiik5UoOERujONG4Q+2INyzcqXyUHRFqEsqPFBLD2RcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6501
Received-SPF: pass client-ip=40.107.5.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

11.06.2021 11:09, Kevin Wolf wrote:
> Am 10.06.2021 um 22:46 hat Eric Blake geschrieben:
>> On Thu, Jun 10, 2021 at 11:09:05PM +0300, Nir Soffer wrote:
>>>> But:
>>>>
>>>> $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2","backing":null, \
>>>>    "file":{"driver":"file","filename":"top.qcow2"}}'
>>>> [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
>>>> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>>> { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]
>>>>
>>>> also reports the entire file at "depth":0, which is misleading, since
>>>> we have just been arguing from the qemu:allocation-depth perspective
>>>> (and also from bdrv_block_status) that the qcow2 image is NOT 100%
>>>> allocated (in the sense where allocation == data comes locally).
>>>> Perhaps it might be better if we tweaked the above qemu-img map to
>>>> produce:
>>>>
>>>> [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
>>>> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>>> { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
>>>> { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]
>>>
>>> It will be more consistent with "offset" to drop "depth" from output
>>> if we don't have it:
>>>
>>>      [{ "start": 0, "length": 65536, "zero": true, "data": false},
>>>       { "start": 65536, "length": 65536, "depth": 0, "zero": false,
>>> "data": true, "offset": 327680},
>>>       { "start": 131072, "length": 65536, "depth": 0, "zero": true,
>>> "data": false},
>>>       { "start": 196608, "length": 65536, "zero": true, "data": false}]
>>
>> Yes, that might work as well.  But we didn't previously document
>> depth to be optional.  Removing something from output risks breaking
>> more downstream tools that expect it to be non-optional, compared to
>> providing a new value.
> 
> A negative value isn't any less unexpected than a missing key. I don't
> think any existing tool would be able to handle it. Encoding different
> meanings in a single value isn't very QAPI-like either. Usually strings
> that are parsed are the problem, but negative integers really isn't that
> much different. I don't really like this solution.
> 
> Leaving out the depth feels like a better suggestion to me.
> 
> But anyway, this seems to only happen at the end of the backing chain.
> So if the backing chain consistents of n images, why not report 'depth':
> n + 1? So, in the above example, you would get 1. I think this has the
> best chances of tools actually working correctly with the new output,
> even though it's still not unlikely to break something.
> 

Did you consider just add a new field?

So, "depth" keeps its meaning "which level provides data".

And we add additional optional field like

absolutely-completely-absent: bool

Which is true if data is nowhere in the backing chain.


-- 
Best regards,
Vladimir

