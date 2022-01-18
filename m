Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135D492DA8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:46:51 +0100 (CET)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9tVJ-0003Yp-Kw
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:46:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9tKG-0000bX-IQ; Tue, 18 Jan 2022 13:35:24 -0500
Received: from mail-db8eur05on2094.outbound.protection.outlook.com
 ([40.107.20.94]:10688 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9tKD-0001L0-C8; Tue, 18 Jan 2022 13:35:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ppq5j39/gECi2b5tqyq6nfpOOp3JzpIx2DAJCRC6hYhrSBqVQnvzgznUzw5Qr8oENM/NOzcGsI5MmhT/NO6puVhkqbdO8FQ21l8x+wMeXpucxAcNw7Gp0T3QXctL7Iz+d3Ar8iRa1w68dOrVdi3KipeApWhylnOqQld9Qxg1yZtl0bH/T16UpwRKBnznY3A7GsdjesYxeUlD7Dq24jjwu60P4wVH1GdbL7A6zpLr10sRfZ8X9lJ8ODhebgL43ps0r/waA/Pbsztd3oR5Ir4/h9PvWwtvlK/jATsNLWdaPN2dSJcUpiqpHk7oAIZ/SbYP/GVaDXRdgdH4tzPFXhBCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8ztcbMMGgOI1Q8T0Vkaw8+M2q7ETZAmUlosJE0yyHE=;
 b=c+ZRHnMXGKdlCdK3lwGozP/esqfaqpWGFegXeR9xuRer88Mr2mSZWT+h0cSuKTGaaIqFSLo6jk8MJcw9F+StuRjiPrQeTkxOj9UID2gyv3hlKgSnMjH6JvhHf/DOb6ylSkJaSvbEMkuTLFLYS23fuQU5DGvJqaSuWeZnjekiQvt4k3ev6ZlyIdK8ARDF5O0HkA+Tj6p60gFKM4qMulGG+lX6ri6pGQVcqlmk9oVzIVADKIeQtmS3RIo8BTLbnbPjhLNecQQb8X/9L3prAWbuMA2FxXa79MRDIIsyjFNoJ1tQ2WntbFhYLLDuXevuIf0w9mntCswtoyHcQ8+jzfm4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8ztcbMMGgOI1Q8T0Vkaw8+M2q7ETZAmUlosJE0yyHE=;
 b=NHSosl7iZReo++jhNK5EcDRQFZawLJ9cWdABlaDh+EOFPe2HJMXQctbXkeV3PcUl5I5ts/0c41rPWIiZA2F046+AwmSi/yVvOuUZ0lENCK4iOotqAMb4uYEh/+Bm8iV5OYGem8a4WvUSBn3mVxLZ35HzKTnODXqGjxDyMt5KmpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB9PR08MB6460.eurprd08.prod.outlook.com (2603:10a6:10:254::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 18:35:18 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::f043:6356:ee64:6cc6]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::f043:6356:ee64:6cc6%6]) with mapi id 15.20.4888.013; Tue, 18 Jan 2022
 18:35:17 +0000
Message-ID: <0fafb39a-d104-36cc-5056-720e558bb042@virtuozzo.com>
Date: Tue, 18 Jan 2022 21:35:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 09/19] block: introduce FleecingState class
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-10-vsementsov@virtuozzo.com>
 <84ca9222-faee-de23-d8e7-06c39c938e9e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <84ca9222-faee-de23-d8e7-06c39c938e9e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5da7dea-1171-455d-3d4e-08d9dab1465a
X-MS-TrafficTypeDiagnostic: DB9PR08MB6460:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB6460F3AE41C0CA704C5CFBF8C1589@DB9PR08MB6460.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ea8GfNkPaJQGRnjBfC/aqEdTQGaNL0TfK2zzQnHTzmuQ2oMXU6X0Vi5oduxlI6zX1orgXmNrZcJSsE09o9wpADrxde7TpxameGp4XvhL/rS4SuyX6jZdarjLyCjHP4OxrAzCBJRBw7Nm/Fn0Cpc80+E3xNF0sac6G8PvS/30PO21BKys9ttumh7I7ikvWNadRdqilRkT6eMrY38ytNXFr2FlqhS+8PXiQv7CJfhvgNvRRYBVtWsVS7Wq713cfjbrXVtuecsY2Yit4cQ3JBWUj72FOlL+yC1LBhQJJz4dIvDjom4eWOUPDxkFD9Iy+xyMdRCrjsZgxC6is7KlUOCtFp+YJG5k/eLgTCumgxL9YavKvacZWnecurRH1ZxdRMG4exQKP0pZTyW8/M/oRE3SuzDvIX9kc+/Bb3ZsTpF7tMsumTXxiMAT/OSSHS2RzjjUm+5MGMB3PM3Ynrl9GiwmEsd+ebROZC5AK/70RCUfMRNe4PaJhNjsPwpWVwC84X89guJZr8htzqal0wkpaRlvctxfqUShKZbdIHQHbhUWM3AIThw+PTW9sXiACXYRhog2hutfU+TZOAVVpz5vSYDblzjC/bZNrlyR/msYo6w3FWTXz0/PUA/UUq6xgirN13qt8dmVYBQD6kjfCQUj0duJv4VZAh8vypSQmWi0471ph04nFQ7HkwVWdbdrrh+NA4PJohd9iugHPq4zfYw7gQHWWzj9ZCC6DdU1psU/eza+7XAJFzgjL2fEIOqd7CcBRxmz0vifzRvTu79iaAWRWphLpNvvU0umKDLTagy8x5v5BlH9r4d1SxfUnxp54y/ElS7BRZE5eQUAx879MEQKC65kOT2qE5R+MCgsA84xyG50xTN8kcWF5b1VThark2SDCMmc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(4326008)(31686004)(6486002)(8936002)(2906002)(6512007)(86362001)(38350700002)(316002)(38100700002)(6666004)(5660300002)(31696002)(36756003)(2616005)(66946007)(53546011)(66556008)(6506007)(8676002)(107886003)(52116002)(66476007)(186003)(26005)(508600001)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SithdUZkVjcvbnJ2ZDBZcyttY21tdnBid0ZVSFBnMnNXamtqL3pla2ZyRmpi?=
 =?utf-8?B?RXdSVllHRDFFa2VQRU9UL2hObkMvZklnbXJtUEtzZFF0UDhvNklCSzdlM3ZG?=
 =?utf-8?B?SFVtd0NaR20rVTZ5aVNoS1pGS1Z4R3FlWXNyL1VndEFZNEZ5Q1ltTVpqdHhZ?=
 =?utf-8?B?bkpqTllqQ2YzdUpuampqZ01jVXJFVExFQ1daZmc2LzBHdzdOaEt6emIwTmVI?=
 =?utf-8?B?bEliSmdTSWN0RVRaVUZOcThOUjE5SnQvVC9XN3l0SlZhV1JQWnFyYlBMek0v?=
 =?utf-8?B?RExBWkw3c25ZSHh4RUtyZ0I2Nlk4ZXJqYnNjY3o0SjdVT3JmcTVrWE9idFVz?=
 =?utf-8?B?MFVPVVplOHlMSTVBblFJdWlBQ0w0dG11SXVoVTd2aVVJN3JHZVBDVW00WUpG?=
 =?utf-8?B?Rml3YlM0bU45VmZoWlg4MWsraDNhN0hMSDc0NUVFWnUwcEFOc1ROd1h5OXNJ?=
 =?utf-8?B?SU43Ykl4aUxPd1FGQWZvVHZmS3RuOG9SM0RibTE0TzcxZGpQZjZRemNhSG95?=
 =?utf-8?B?czMxSklOYVo5MGlrYnFiUXNHMVUxSGRsTjZ4V3RneHdURmU1UkpxQ0pubnp5?=
 =?utf-8?B?VHc0WlIyMVJLQ2djWVQ5dzkxUFpwNEdCTGI3WjdjZFhoWnVXRWF4R1ZsYk5q?=
 =?utf-8?B?SFo4YWdmc0VnZFNLM0dNb01xZXhWdWwrWFBxRmIzSFVDZjRjUTlDZGR5NDlh?=
 =?utf-8?B?djMydnZpRjd1YXpiNUJZbi9jWURmT2xzVTNKdmlVQ0tVN1pvR254THhuYy9x?=
 =?utf-8?B?ajRpMGZEQzFzcGFmU09EUjlUWjZQM0NIUFIvV3F3eEVGL1NGcHQxRTlaMHVL?=
 =?utf-8?B?aktveTdNQ3NMV0g3ZStJc3ZobHZ2ajV1OHFRQnpPMDJlQ2hSL3RKVXE5MHdV?=
 =?utf-8?B?S0tSVWlKSzFLZjVzTDFyeVNYak9YTmJsaC9rOHpZMUlTY1RicHpWVitYbktz?=
 =?utf-8?B?dmkvMVBrZ1NzT0xPYTJ0WXJGMzNEcDU5OCszQUJ2WStxWk1BTlIxcC9IMVBk?=
 =?utf-8?B?RC8wWWZiRGdSeUJ4eUdrK2h4NnNROEE1Wi8vcGpDS01GNmFhRlBzMGI2VWdy?=
 =?utf-8?B?dG0vRGppUFBtSWZ6cFBlVVJha0JOZjFUOVNPMmR6Uzk1bkdVWTRxd1cxZGJu?=
 =?utf-8?B?RkNLc3NQWm1WVTVOQW5UbGVZaTV2ckhld2RNOVFBdXdZVmZlV0RBZ3o2Z3p2?=
 =?utf-8?B?K1hhOUsrcmdMbDBOanBPdmdwc09ickdWRE5VUndQQlM1K090UFVsaFpWVzlC?=
 =?utf-8?B?QVJEOTkvUFhUa0RXNmFyeGF0TnplcysrVERjYmdJV3dldVArKzF6QkwyS0FJ?=
 =?utf-8?B?Y2UyaTdMNW1SSmVHZ01HNVpxb2Jtb0F4K25KZEZLVXQ5d3J5a3hBQTVqQndj?=
 =?utf-8?B?NjVwRlV0emxDRUJESVNvVDRDallKZmk5OEU4dzVnZU1pd3MyRWxxWCszb1g1?=
 =?utf-8?B?OUdlRERxbWxVL28xZWlSbGlvNUZEN2xvQUNkb2RFNVRIMm4yUlVvanA3RS9M?=
 =?utf-8?B?MTdXZXZCV2pieHJpZVc0UUREQkZPbktyTGN0bzZ2ZE11T09DV1RWL1JoMVcv?=
 =?utf-8?B?N294V2hXMisyMk9SWC9ucDE0L040bTVlZjFUbFVoRkV0dmJidkZVQjJLR1JU?=
 =?utf-8?B?bjFKTGNXcTFEbnA3ZGNhNkJNSzhVR2dDNTBiQXJvVnMza041U3g1aGEyTmlD?=
 =?utf-8?B?MHRlYlBnMHFjR1JDUXE2RHdZUUpKQXl0RHYrckM0QTNBN3RoUFBhZHU2NGxD?=
 =?utf-8?B?QlNPajdzdHlDK3pqTm1PbEI1bmtGRzZ4NnR2SytIUHFrcjZ2ZitMSlFiQzF5?=
 =?utf-8?B?MnFBUFMvMVA5U2JTangwZXdPbkltaDI2U2VvWnJuQmRqek9LS2xyTnpMemNW?=
 =?utf-8?B?TjU0RnJEeGFnVVFjaUFnN0xTYkVuMS96Uzc2UEhoT2luc0l0N2RvNkMyTEhk?=
 =?utf-8?B?M1M5L3phTnFYY0tXeXR1eXgzUG9EMExqaDlZRk51RWorSXhwUlN4aTRGd3VO?=
 =?utf-8?B?di9KcGZXNitTVExCdmFWdzNhNUpXcU5KYlJTRUJERXlNeVJnOENjYVJkTTBY?=
 =?utf-8?B?QlAzUHZ3bnU3eWp4NHo3bWZxcEtLejVhQWk0MHBSRThPR0pwMkIzSGZaSkU4?=
 =?utf-8?B?b3hPdDlsZ0FheXdJSjIwUFRocUJGNmpmVUdjUDMrTmdlSStyQi9KZC9SdjQr?=
 =?utf-8?B?d0Z2ZS9QY3Exc3VIdE9xdWZFemM3ZXBrRU5xeWJOY2RteEVPVjA1aW5xN2Ir?=
 =?utf-8?Q?PyvrAOPFE3eNrD5qOsIWviF7QYxbJI+uGTqSlDvNC4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5da7dea-1171-455d-3d4e-08d9dab1465a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 18:35:17.7458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CH8BTSsF83ORc5GxNNoHhHuzNcVej7aqgUbkJMBju90Y4IySymow+TeybG23YYsTnbR2JcXTXjU904dPSpVnD5YpqvkDfr/YgdlrGeX4fNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6460
Received-SPF: pass client-ip=40.107.20.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

18.01.2022 19:37, Hanna Reitz wrote:
> On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
>> FleecingState represents state shared between copy-before-write filter
>> and upcoming fleecing block driver.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/fleecing.h  | 135 ++++++++++++++++++++++++++++++++++
>>   block/fleecing.c  | 182 ++++++++++++++++++++++++++++++++++++++++++++++
>>   MAINTAINERS       |   2 +
>>   block/meson.build |   1 +
>>   4 files changed, 320 insertions(+)
>>   create mode 100644 block/fleecing.h
>>   create mode 100644 block/fleecing.c
>>
>> diff --git a/block/fleecing.h b/block/fleecing.h
>> new file mode 100644
>> index 0000000000..fb7b2f86c4
>> --- /dev/null
>> +++ b/block/fleecing.h
>> @@ -0,0 +1,135 @@
>> +/*
>> + * FleecingState
>> + *
>> + * The common state of image fleecing, shared between copy-before-write filter
>> + * and fleecing block driver.
> 
>  From this documentation, it’s unclear to me who owns the FleecingState object.  I would have assumed it’s the fleecing node, and if it is, I wonder why we even have this external interface instead of considering FleecingState a helper object for the fleecing block driver (or rather the block driver’s opaque state, which it basically is, as far as I can see from peeking into the next patch), and putting both into a single file with no external interface except for fleecing_mark_done_and_wait_readers().

FleecingState object is owned by copy-before-write node. copy-before-write has the whole information, and it owns BlockCopyState object, which is used to create FleecingState. copy-before-write node can easily detect that its target is fleecing filter, and initialize FleecingState in this case.

On the other hand, if we want to create FleecingState from fleecing filter (or even merge the state into its driver state), we'll have to search through parents to find copy-before-write, which may be not trivial. Moreover, at time of open() we may have no parents yet.


Hmm, but may be just pass bcs to fleecing-node by activate(), like we are going to do with fleecing state?  I'll give it a try.

> 
>> + *
>> + * Copyright (c) 2021 Virtuozzo International GmbH.
>> + *
>> + * Author:
>> + *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
>> + *
>> + *
>> + * Fleecing scheme looks as follows:
>> + *
>> + * [guest blk]                   [nbd export]
>> + *    |                              |
>> + *    |root                          |
>> + *    v                              v
>> + * [copy-before-write]--target-->[fleecing drv]
>> + *    |                          /   |
>> + *    |file                     /    |file
>> + *    v                        /     v
>> + * [active disk]<--source-----/  [temp disk]
>> + *
>> + * Note that "active disk" is also called just "source" and "temp disk" is also
>> + * called "target".
>> + *
>> + * What happens here:
>> + *
>> + * copy-before-write filter performs copy-before-write operations: on guest
>> + * write we should copy old data to target child before rewriting. Note that we
>> + * write this data through fleecing driver: it saves a possibility to implement
>> + * a kind of cache in fleecing driver in future.
> 
> I don’t understand why this explanation is the first one given (and the only one given explicitly as a reason) for why we want a fleecing block driver.

Actually, benefits are given in the next commit message.

> 
> (1) If we implement caching later, I have a feeling that we’ll want new options for this.  So a management layer that wants caching will need to be updated at that point anyway (to specify these new options), so I don’t understand how adding a fleecing block driver now would make it easier later on to introduce caching.
> 
> (1b) It’s actually entirely possible that we will not want to use the fleecing driver for caching, because we decide that caching is much more useful as its own dedicated block driver.
> 
> (2) There are much better arguments below.  This FleecingState you introduce here makes it clear why we need a fleecing block driver; it helps with synchronization, and it provides the “I’m done with this bit, I don’t care about it anymore” discard interface.
> 
>> + *
>> + * Fleecing user is nbd export: it can read from fleecing node, which guarantees
>> + * a snapshot-view for fleecing user. Fleecing user may also do discard
>> + * operations.
>> + *
>> + * FleecingState is responsible for most of the fleecing logic:
>> + *
>> + * 1. Fleecing read. Handle reads of fleecing user: we should decide where from
>> + * to read, from source node or from copy-before-write target node. In former
>> + * case we need to synchronize with guest writes. See fleecing_read_lock() and
>> + * fleecing_read_unlock() functionality.
>> + *
>> + * 2. Guest write synchronization (part of [1] actually). See
>> + * fleecing_mark_done_and_wait_readers()
>> + *
>> + * 3. Fleecing discard. Used by fleecing user when corresponding area is already
>> + * copied. Fleecing user may discard the area which is not needed anymore, that
>> + * should result in:
>> + *   - discarding data to free disk space
>> + *   - clear bits in copy-bitmap of block-copy, to avoid extra copy-before-write
>> + *     operations
>> + *   - clear bits in access-bitmap of FleecingState, to avoid further wrong
>> + *     access
>> + *
>> + * Still, FleecingState doesn't own any block children, so all real io
>> + * operations (reads, writes and discards) are done by copy-before-write filter
>> + * and fleecing block driver.
> 
> I find this a bit confusing, because for me, it raised the question of “why would it own block childen?”, which led to me wanting to know even more where the place of FleecingState is.  This sentence makes it really sound as if FleecingState is its own independent object floating around somewhere, not owned by anything, and that feels very wrong.

It's owned by copy-before-write node. Hmm, and seems doesn't operate directly on any block children, so this sentence may be removed.



-- 
Best regards,
Vladimir

