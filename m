Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2F39B207
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 07:32:02 +0200 (CEST)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp2R7-0007LM-Mx
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 01:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2PV-0005tp-Av; Fri, 04 Jun 2021 01:30:23 -0400
Received: from mail-vi1eur05on2131.outbound.protection.outlook.com
 ([40.107.21.131]:45537 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2PQ-0002nR-12; Fri, 04 Jun 2021 01:30:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtoVxhEbVrEUIkHyyUjMUnml3+2ACT8I73r1FIp0xHCKLUzGJz4EsdaiHgIKoRR7bXQfWWfycjtwcRYD7AINbCFXupbJvOulSa9hUNOhxL0WZ2UJLa60ohbB4j5HpYYC18e8O9LbnPccs0yNC6l4EXiVIhdDJFDhy2zPeOjpuUs60QrRYuXVuJ3p/SeBB7OeY4d8XruBj9nXjxS6iK49WKGdL5eaSsAaa5EZQqar2pZl86FXsBPF3thaKPj+pTa38D6e1tSim7YBMwnobf18ypoLea1pBA7EYy+pkOh1G0eyZxUOqcuSF8bCKtB4T/L8HvlRXHuTiBXLOvpf254baA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljt4lCPK/wU11D6OJTDOOXijHwJhErUq8UuOVgUmtOw=;
 b=PQuGI+7PHVX8ICSSwKQkcVPh+bMr/1ydalthuKkeQqirCU252AreTiHvCdK7WReHnN0coyiZXFknTaKW2ZjSB4eEjwdwg0FTdWARpFKMz5QCt1EZIu30MaXxCVYMxZ3W2GdVE7t6QCjLNSMMBfLEOVOr/Iqhk2p9/RHIXptjFpetjb0/Ds61u+cxHQUGTFuleoCQMubQN+cpJ2hhiSXIRepAAPKDLvytTL/Lme9lKf/V5s1XIYNyliLEYNulin5/iXoRip/fZ131KokQaTbUvDF9ZuGCtyIKCqIpXpY+eVziNvOo9R7SBzA29nI+cmpxcqvjpJ8r4WovcoTKKViG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljt4lCPK/wU11D6OJTDOOXijHwJhErUq8UuOVgUmtOw=;
 b=Eo10N4YMkLNggzk9kUyHPYpSSedFmlvyBykxnrlk+p4lDOEL1n1aypzvrAcSPOzZkHo0HU0m3K6RzWgONuUniZ+b92fg7L43EKEjrN1k0yQkTcqVqil0RzieVOtjj+roeaM92UgIBcrILkt91kN8Xe3H8+nuegH9DZLkKk5w5j0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 05:30:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 05:30:13 +0000
Subject: Re: [PATCH v3 27/33] block/nbd: split nbd_co_do_establish_connection
 out of nbd_reconnect_attempt
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-28-vsementsov@virtuozzo.com>
 <20210603200450.permqm7dcbw5oylf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2134d37f-a2e7-4c4d-3391-266467ab9c78@virtuozzo.com>
Date: Fri, 4 Jun 2021 08:30:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603200450.permqm7dcbw5oylf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: AM0PR01CA0176.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::45) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 AM0PR01CA0176.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Fri, 4 Jun 2021 05:30:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23addd4a-7773-4c4c-c574-08d92719d3c4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61344D4118C85B7FD43B3696C13B9@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xYTr9+GKa87/gC+vrfwX0Lm7oMGrUSyilQuS85eauyxijj4uHQNrxWYEiNwTpIokKDGiYLG5/bwfCuLIZ+DM9yJGat1G89pTyoCe6U9gonY7gFdosN9bYYexjI4TG76HvkEvp6o4ndXtgFWzOCN2Ljnew6NsIsFhwct+Ojgkg3GcaUjxNl03TdvCHgSmlKj8mJmXrp+Vkz3eIcf1hSGvc/7tJJ27GE3eTI9pgPuTEuTwi9HbbORc6hVAv4SxRDatqLzogMcZvo6sIvpi7cq46jRRLQBX6BnG/pm1dbPTZp7Oj6+h2oIBF4yKbRg/ZtJk+7Pi7sEBLu8MDgtfUApoSAfPqwgWi/gIrgl6gxXs6JCPXRd834QKetlkv2O4ZZcC5veT6YWbctOvtWkJaUJCuTarEYM5wuQLMxPJPLRGE15XPD7/LJZfflxocJV7i74hR334LweoyXHuAG1GelID18IgEe1NEOuF9QnF4mBW3s/rUWEeBmof5oGi0M9iteKNTjVbzvD1e4/6m6wDIbjTNJi30GCTuByghXJi0gYhsHPLcNTeWGNdYSt2ImSgiGYRPwBcJiTJKAvrQjSuwxOYb5fJKONYqDFaTU5zSOcMLo+agSg42GcDuNW/KFMrEchvzADTGbrIGfKF0XfQO1dGsG6Qvd+gXSvVqHeNjr9gtfi251tdQHJ0qmmEEWlte6b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(376002)(136003)(396003)(366004)(2616005)(956004)(52116002)(5660300002)(8676002)(316002)(16576012)(36756003)(107886003)(478600001)(66556008)(66476007)(2906002)(66946007)(8936002)(4326008)(16526019)(186003)(4744005)(38100700002)(38350700002)(31686004)(86362001)(26005)(31696002)(6916009)(6486002)(83380400001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkpWUUtzTFlDV21xVWVRcFh1VVNjSkZmUGZZMGpGdGVkdk51Zk54YnA1Z2tT?=
 =?utf-8?B?dU9OOVNwTXNRTU92VkJkbUNpeDlGbTlscTFOa240amxlbnBLeW9jU0FrL0Zu?=
 =?utf-8?B?VmtzRzRtNUJxeTlkeHo1OG8vQWtDK0tZY093TmpXRjg5eUFaRm9xMDdMZGNx?=
 =?utf-8?B?TWJkaXlWQzBhZURjemhnN1RHYWRFUktDRzkzSWQ5TC85c2ZNWUdhSENhOWJI?=
 =?utf-8?B?RVBkM3RXVkQ5QWJVejc3SURzVHZseWhSL2R4T3A4NXE5aGZxUFRzZTJjRkc0?=
 =?utf-8?B?eTladERCSmlPTEs2ZjhXQXVHMThTN3JLQ2tkSWxKWW5mY2d6a0F5aUhlbjdy?=
 =?utf-8?B?bGduRUpSRG5ITCtQWUlBQ0dvTWwwVzBnZnR3MGhKeFQyKzBWQmcyckNDaWxs?=
 =?utf-8?B?ejR3T1VSUGJCY2N2S2NnRzFLazZCVUZVQzR0elA4ME53TjA1ZE1Ncm15YkZ4?=
 =?utf-8?B?WGpsRVJDc3lOcGJ4eGtqdExTQ0drR0hyWlFwRUZ2cElRUFViYVBSL2FtV0RI?=
 =?utf-8?B?QnU4OC9ZaWI1WDR0b1hPazZSamg2YjdFY1ZBb3hVZ0F1YnVOcmp4elBsNVN4?=
 =?utf-8?B?SmtkZG5LUGRCcnVSRjR3d2t2SCt6NE5GQ2xzKzJhSC9WRlFvVGZ4elZwQmFu?=
 =?utf-8?B?cC80SmJVOExCcWo3ZjJZTWtsdzNLcUVtYUhQRGNHbWhjSHN5a0xRT3JDbm4r?=
 =?utf-8?B?Ui9mRnYzdkFndnVRODltN1hsaVNMK0ZmalQ4aGJvNDFhOFZUeVU4cndHWXhN?=
 =?utf-8?B?Y3lyb0krcFpiTVhNWnBYa0VmUGdHN2d0NDdWNjhLRVVmL0hPMVpSVnV4bkJH?=
 =?utf-8?B?WkYvWDdydWFSME1qL0svZks1VGdxeUw5bTF5dkN1VVBhUzdGd2JZT2dxNUF2?=
 =?utf-8?B?OEkzdW1rM0MyZHIyNVgrRkRQSW0xa1hYUEtWQmZIUmVkS3E1OUFmMm9NMm1E?=
 =?utf-8?B?cHEzeDRVT1p3TnVQdjZ6S0RJdW9VWXEzbk5yUkdCWUI4WnpYNTVWVlhaKzE4?=
 =?utf-8?B?S3M2eHJEMHM0SHpvUFNOcTZRbHEyUENhMVdwajFsRkN0Tkpzamp4WmsvYy93?=
 =?utf-8?B?RERMUDF3UHFvd1N4NHFyOFJRMW11SE5SeHVMVDNCSmpHWGFZV1JFcmxCYVlk?=
 =?utf-8?B?MitZQUM2eGJDNml4RHhOTi9uclVYcGF1dTIwU0ZFYjMrSjE0aTlobXNHY3or?=
 =?utf-8?B?R3haZTJVZXhKK1YyNDFYMmdpTmpnT3VLbnozNkVhVnR5WDRqNHBqMEpEeDFt?=
 =?utf-8?B?NWVlZzRvR2g0cXNyU1BEL0pUaWx0Mk9janQ0amNzZHhTYjVobFBRSGFhT3lZ?=
 =?utf-8?B?bUlEaHllQS9OTDdsTEZXWjRjeXprNjlreWxnc25TVG80UnZ3MGFTcXpwZ1oz?=
 =?utf-8?B?SkxxU1BUZUk1ZDl0bis1RFUyS3F2NEtIOW9vQVkwd25Nb0VuczlZRVdUVDNV?=
 =?utf-8?B?OHBUeTdVV2R0eDFtYmlsMHBxdFZYM0I2aUxYeS9JVUd0cGgwaUZJb1ZrTTEv?=
 =?utf-8?B?Q1NGMnE0bFI5bHFiVkxvK0VERlBEeGwzM2h0a0dRTk13M3h5OHRGMEY3blpx?=
 =?utf-8?B?M1J5ckNyTEJlajZiQ0c1L2VJbHZoM3lHRjJETkRtY1NweE9mVjlqOWtaS2lt?=
 =?utf-8?B?VVRCbFBMdWtlellhajN5b2ppbUl1QXJma0puVHVGdkJsb3lPSFd1S0ltZC9P?=
 =?utf-8?B?RWUvRVpTanJMOFpyZm1PQkhVM3FEdlpyeUxrdis4WGtnZ1dmU2FYUzVrSTM0?=
 =?utf-8?Q?62PNLsV/RxafqFEH0vVpmqpLJuMrWZvWw5Retkj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23addd4a-7773-4c4c-c574-08d92719d3c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 05:30:13.1006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwOOeA33SOJ+3mavyMbk2bpxl3EI6PqvLTLL7HvPZJE0r/cIzTM7kRd7XjTn1sUj0HmnRreWfKBfQ15MF4GvKAbxpn7INKkmwqk9QCGP084=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.21.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.06.2021 23:04, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:09:05AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Split out part, that we want to reuse for nbd_open().
> 
> Split out the part that we want to reuse for nbd_open().
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 79 +++++++++++++++++++++++++++--------------------------
>>   1 file changed, 41 insertions(+), 38 deletions(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 15b5921725..59971bfba8 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -361,11 +361,49 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
>>       return 0;
>>   }
>>   
>> -static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>> +static int nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp)
> 
> Given the _co_ in the name, don't you need a coroutine_fn marker?

Yes, strange that I've dropped it

> 
> Otherwise looks sane.
> 


-- 
Best regards,
Vladimir

