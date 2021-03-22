Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D90343F85
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:21:44 +0100 (CET)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIcw-0004Hh-Q9
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOIaJ-0003O3-TZ; Mon, 22 Mar 2021 07:18:59 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:55136 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOIaB-0001yb-KR; Mon, 22 Mar 2021 07:18:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAcOab3A7WnaxIsotYaPZXV2fXj/nyqQrnV0CyED2brx7qOd2wGku9FxRk2A+04KRyMTYVI1Z+XFmY8wnvnPzcBX9tlK29CYgtg2B+GGh/fW5wzSlkEKOMZzIiIHa4ttNrYb1kAFb2ZpgdEPUmC0+BSupjk9E7ywTp63Bvxkex7UVfLoQeBd3RYRepLhm0g+XrPZJWKWhEi5DDn07KJK2U5FOIZHraMkgnMt4LN8nBaf7kXJ8jwclL9ZDLewjF3AEozkcU97WRrs+guh2lbpvU/cyWWaqxvPSnOvrSXWv11fKMRNc/BWkGo4hrB54CbcMBeJFRPELxYv0/7cY2KpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSONTdXzZYGQXLPPNVUX//c+BS+YixWQ5qTI6pwhi7k=;
 b=f1LcQW7zyp0uCm9aSgM9ArauZIHKhVA3P5alDB7fxhzmrDdwkMJtW745tvxN4WKoZK3oj8fvvqHa6bCHKHb+avXYbs/Y1m/0vkElBGLs9+8/z1ZdVEA87l0yi86bamzlDC52Ap3wyHu9741hPnJd1mkLtO/n2WYn5h0qJT+7fypSMNg3x9z8qJTSH35uozEpX8uusALBm7EX8uSrsMjYYGzByBAHFBMiEg3GaYvJ7qXGLziZ+7nvy6HNtlhKXUsNSXjPYt7Y9mWnwWd0U2WFb1kx/FHkfrIY4VmFi9u50l1uCcSr4K+DDsRmMJmWHqTKvg6as+fUJElZwGqIoahm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSONTdXzZYGQXLPPNVUX//c+BS+YixWQ5qTI6pwhi7k=;
 b=q4RZlb49qxCWbn8sRvNJYkRfUA43Npt/wf0foCjzkl0DzZQIMqCfSAUxDSZRxXfFCReyy8vhTFjgDeBGavKBQ+peZbWlOoEVPVGYBdcqmBaAivUvgqFXWvqCXmG5NB3aFaQFOV/X/wOG3FSB1AEVazXCvaXVrqCgAHLCbRk0fgs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3886.eurprd08.prod.outlook.com (2603:10a6:803:b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:18:46 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 11:18:46 +0000
Subject: Re: [PATCH 1/2] block/raw: added support of persistent dirty bitmaps
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>,
 qemu-devel@nongnu.org, qemu block <qemu-block@nongnu.org>
Cc: lmatejka@kiv.zcu.cz, Eric Blake <eblake@redhat.com>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <20210320093235.461485-2-pj@patrikjanousek.cz>
 <ee8fc7cd-1da8-45f3-6cfc-05ea5f1e9430@virtuozzo.com>
 <4848c5a4-b301-a8d7-b21b-b59ebbeb12c7@patrikjanousek.cz>
 <c65eddbd-d29f-207a-2295-7176a9e65fae@virtuozzo.com>
Message-ID: <f44119a0-e1fe-862c-4dfc-78cbf50ae83d@virtuozzo.com>
Date: Mon, 22 Mar 2021 14:18:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <c65eddbd-d29f-207a-2295-7176a9e65fae@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM4PR0501CA0044.eurprd05.prod.outlook.com
 (2603:10a6:200:68::12) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM4PR0501CA0044.eurprd05.prod.outlook.com (2603:10a6:200:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 11:18:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84815094-cd5d-4525-a04d-08d8ed24422c
X-MS-TrafficTypeDiagnostic: VI1PR08MB3886:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3886326E6F70AE224F78A9C7C1659@VI1PR08MB3886.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bgatKmXqCLbVAmmXlBrTmKnE0psn8HDM83wug1XgKDqhdCk/Xl/MswP5/ma6wZWjVIb2ZeBz/13XnGZL/bcN6/WDzl8tUr7s1VpoDRg3sQQCyfGhcoDFXu/oMrT0p+fZkDEAfFBm27U4LmrihGVKatoPpvZ26XrQwQWNpumlO7UUqkKRFC2TjcRcK1Imz+/vl4U7UsYKL7oInWHq39w/izqyRJyBwJmvBOds8gMICgtNA5cgX7ANRxS3ZUmENAJWv2bc9oqNqzI22uFLU/0fHwSHWy71SZSUUdI2Ry6V36TPErg/EzTfHM6M5FC1CGim8uisg9O3pVEikmUGzaDXlCP/7JjmqmcIg7xKOIlXg/kyUwlx/vs2iUSSYkoWzBokIup5UF95qGzajZh17KSAI9NYzpJYYcpno8r7n3pfOj509H9ILUMmp6W2qjzYLlk//HzL7gS3FPON3S1zvivhn4LBAIKRQJDbG25kJ0Py73k74uRnFJbetVKKGaT/Hl40JqE4020zRZaKM2rj0IeNvZzY0+a6JlNNc31fXewhYEb9ks6h9KOZevGqNw2fRXgIsBVegdSBRaWmVipBcbH/tw+dfHEXsQXztPflBiY4cyJ4Sqk393eTRpGkZ5UBB3BO80/rsrD6oVspa+qYIVkMozOC0jdMn54ahIVF8T8g6TqpLdKWS+qwPZ4T7ZprL+pm5u53vnaetuFGr87RAZ87mnU+83E8NDTCPzMyQJer7JI2GdWRuFwctbwooBbMQEYHH+wyquFsoFPIRkfaxWPIQDCl8OSPd7r1TdFP7sRye207Fa3izVytbL3VNaAiWkOZ4vBA8PWh+zNgJoa2b1iQpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(966005)(66556008)(86362001)(8936002)(478600001)(83380400001)(31686004)(66946007)(66574015)(66476007)(36756003)(31696002)(8676002)(110136005)(316002)(16526019)(52116002)(38100700001)(2906002)(16576012)(2616005)(956004)(26005)(5660300002)(186003)(6486002)(4326008)(53546011)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V0t3NHlmSjd0bXRsSmhtc3dVdTVMYnhYS3JGQ3pHT3poZlg5SVlPeSs2SlRt?=
 =?utf-8?B?cTBqMnp6UVBWZ2JIeHJHQXk3cXRxZXJSVEExZ3lPM3hyUWJ3THU5Sk4yZldU?=
 =?utf-8?B?Rzd6cHpvd2RuTWpRQ1JVV1FZQ1E1Y29mcVpza003Sm55bmc4Vm0zQ0JEZlRw?=
 =?utf-8?B?aGR2ODdNVVVNUzRyRkR4cC80bG1WcUtPNGdFMldoVnFUZDJ4TDk4ZUxualBy?=
 =?utf-8?B?TnlaWVI3bXpEWElicGRkQWJHb1NUODhaUXdKRXRPZ2RUenRnVmsrd3dpbU1S?=
 =?utf-8?B?T3hjWlNHcEJQSzArUTdSZkpkRTBPOVFzV2F5ZmliSDNwNmhsbmFLazVDMjNO?=
 =?utf-8?B?MExSdUlJWHhQQUtjL2VlVlhIV2FkdVFRdWpiMjJEM0RCcy90UzJpbmg5eFQ2?=
 =?utf-8?B?aC9MVGRoakVRaUZINFhjaHJhbUdYclNiaGhzSDBkMVl4aGFKYzF2emdxRjJx?=
 =?utf-8?B?dlNQN09nL1J4N2taNjJBTWpYT3hjWDB6aW1RTU1Vd2lFcDlZZEJtem03ZFhZ?=
 =?utf-8?B?c21aWms5R3dONVh5R0YwZE4yZHhiYmVWUmpZdEtiZlZGTlBDMXBoRUxCblpP?=
 =?utf-8?B?RDI2QUVKNmd1WUkyb2ZWSjVwUDBNM2xiMGhIaTlsZHFrZFdodVEvVmRXSDBi?=
 =?utf-8?B?QVlYVzkydndXaE5aV1plREI2SHlOc1J0VDRDTitYWUFuSmtaR2JObHR1aDFC?=
 =?utf-8?B?Z0FTaGNMR01TT3pKNHI4L3BHM2szSTlDMWhmTDhMeHFQMGRTVUV2RlhXMkta?=
 =?utf-8?B?RFJ1eDFpM1pZNXo5clI5YU9qL0w0cDNQREprQnVQY2xZbWpNUVBpVFpzRnlv?=
 =?utf-8?B?Ty9QSVNEWUhvT1luMmFlSkRXTmdUbW15SHJmQUpMU2tPejhFMU9SNmdZZXNK?=
 =?utf-8?B?Y0FQRkp1cW1xOTk2YUdNNDZkNzdtL3FyVFk3MkxZdDVxS0pKWjJPd0p4dmhl?=
 =?utf-8?B?WGxJMXVBS0xxZkpOM1Mva3hJMFpXMmluN3ViaFpwaEg3MVlJOFdpcFpBRDVE?=
 =?utf-8?B?QTFEcXNCbjZidFRFS05ZT1ZlRFhaekR3UTl5UWE0aGFKckRqNm9lRG41cVMv?=
 =?utf-8?B?QjJoOGxlY29NeEZxUG8rMDEwdTVydVpOd2RtTjVQYmtHajhid2Eyc3ExaTFW?=
 =?utf-8?B?VDRObG8zN2lMd3c0S0V0NFpSdmdacTh4cnRDZGNVUS90Yk5hVmhQR0Q4Kzhp?=
 =?utf-8?B?eHdUNkRZTVNJc1RqT2hhZGxwMGZDQmhhL25rMEIvYW8vbElLUktlNTRYQ01P?=
 =?utf-8?B?cSs1Z0pNOVRUcHVwcG1nVXJzY0NUcjNlUlplOG80Z3hiMDJPZGFjMXowY3JQ?=
 =?utf-8?B?OGVaYUZURUFaRndDWElKWFNsV2VTK0YwRm9EUnl4L0Jha1o3bjhOdWtjYnNX?=
 =?utf-8?B?QlZIRWh3em5tN25xb2FZeWszLzNXc255QU92OWFIa0lWb3U3UmQ4OGFpREVF?=
 =?utf-8?B?Z2VHY2NrY2JJblg5a3pwa2N4MDlUVVk1UWViZjVBcGNzZnVZUHovZmEvaHhk?=
 =?utf-8?B?L0V2R3JqUHZpaGlFakdtekdqUUNXY3RCdzNkcmtQZmEycU4wSXJDNWhzU0Jl?=
 =?utf-8?B?TUc0b1FQR3JxaXY1Tmd4ekV4MnA2ME8zYTRaS3JSM3ZHQ0xJYVpXdVRYV2RO?=
 =?utf-8?B?dkZUTlFMdUlvcjgxL3lEVG5mQzFqQ3VvM0FkWlRIZjc2dGtFalR6TUpkekli?=
 =?utf-8?B?aG1SMGpRTERYV2pJbTJRbEpkQytKOEkyUVphcHYra1ZSNXp4NzZvQ3Avcy9x?=
 =?utf-8?Q?6RRM16Z9sihqcn5CqSPbM504T8hq4FI6+4Vk5aX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84815094-cd5d-4525-a04d-08d8ed24422c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:18:46.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cPN7Pb8C0wecqGGrJ3xXT3C/+S2cxRIUoUsoicC7OKK6rLUVEIZ/YaHPkGLRPeTFmqUiJ6GXks8qX6elyFgZNfyMskYeu7/dTvZToJgpys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3886
Received-SPF: pass client-ip=40.107.21.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

22.03.2021 13:46, Vladimir Sementsov-Ogievskiy wrote:
> 22.03.2021 13:18, Patrik Janoušek wrote:
>> On 3/22/21 9:41 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> 20.03.2021 12:32, Patrik Janoušek wrote:
>>>> Current implementation of dirty bitmaps for raw format is very
>>>> limited, because those bitmaps cannot be persistent. Basically it
>>>> makes sense, because the raw format doesn't have space where could
>>>> be dirty bitmap stored when QEMU is offline. This patch solves it
>>>> by storing content of every dirty bitmap in separate file on the
>>>> host filesystem.
>>>>
>>>> However, this only solves one part of the problem. We also have to
>>>> store information about the existence of the dirty bitmap. This is
>>>> solved by adding custom options, that stores all required metadata
>>>> about dirty bitmap (filename where is the bitmap stored on the
>>>> host filesystem, granularity, persistence, etc.).
>>>>
>>>> Signed-off-by: Patrik Janoušek<pj@patrikjanousek.cz>
>>>
>>>
>>> Hmm. Did you considered other ways? Honestly, I don't see a reason for
>>> yet another storing format for bitmaps.
>>>
>>> The task could be simply solved with existing features:
>>>
>>> 1. We have extenal-data-file feature in qcow2 (read
>>> docs/interop/qcow2.txt). With this thing enabled, qcow2 file contains
>>> only metadata (persistent bitmaps for example) and data is stored in
>>> separate sequential raw file. I think you should start from it.
>>
>> I didn't know about that feature. I'll look at it.
>>
>> In case I use NBD to access the bitmap context and qcow2 as a solution
>> for persistent layer. Would the patch be acceptable? This is significant
>> change to my solution and I don't have enought time for it at the moment
>> (mainly due to other parts of my bachelor's thesis). I just want to know
>> if this kind of feature is interesting to you and its implementation is
>> worth my time.
> 
> Honestly, at this point I think it doesn't. If existing features satisfy your use-case, no reason to increase complexity of file-posix driver and QAPI.
> 

It's unpleasant to say this, keeping in mind that that's your first submission :(

I can still recommend in a connection with your bachelor's thesis to look at the videos at kvm-forum youtube channel, searching for backup:

   https://www.youtube.com/channel/UCRCSQmAOh7yzgheq-emy1xA/search?query=backup

You'll get a lot of information about current developments of external backup API.

Also note, that there is (or there will be ?) libvirt Backup API, which includes an API for external backup. I don't know the current status of it, but if your project is based on libvirt, it's better to use libvirt backup API instead of using qemu directly. About Libvirt Backup API it's better to ask Eric Blake (adding him to CC).


-- 
Best regards,
Vladimir

