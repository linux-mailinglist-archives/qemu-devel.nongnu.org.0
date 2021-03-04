Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E6432D0A4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:27:43 +0100 (CET)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlCo-0000BR-Gm
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lHl5y-0008N4-O9; Thu, 04 Mar 2021 05:20:40 -0500
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:49473 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lHl5w-0003XD-D4; Thu, 04 Mar 2021 05:20:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JP3x4FcKjcnMsRc00x7Jvpbe8dm3Aurw+Aa10kWmJlPXoJgKVTA3oFh/gX9y30DbXtcHnolGSsSqnbZ95DrqHri4TtYqUEp5ClYWS/Yvke1+7C2upNKGeEMjmkiz7p4APGt+STnmBiLz3ijIKdcmOC7giRmDojvNauhcS4roqEHTvOJSSmRi2HnS6VmRYOr2ni/kZEfglB2f7LI4uBzFkC7OV0vOAvJy9H/EWLE8WKnRFp2WoDRdLVOndDTXxgJ344Blb0LNYk4jj+uKB9YPPIajYOGtQA3j/8QUjH2xvDNwvfHE8QZDMSovDoUxAVJgTqQsDWpITCcFVgzyyGB7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AtiX7KziXuNYbso+t7UZiTcxErpc3mcYgVojw8ODRI=;
 b=Pi5WwasOsNuxI0wUOylJXwrHsL/1NosEwNtUM0xbIKByFECSUCu4scJmEYfVJcIYegWpFw8UVhtakfjx9qAGDmjR96i6MpvjvVQ+5Eqtu3rDCINW3JOZwEZHy2SIOMsz2tcOuMt8QuudUdoE3toYBC/CCQrGcZ6pAhgvLlI2JeU4cZH9jpm6C5W0WDiw/6DQ4iHboxuPWjOhThN+bTr0mRyV+tqbWMf5hl4mkDRlnVtzCQL/vMiakG7pW7UP372+hhW3npDsOmgQQ4bW5P5zLD1XX9BnTkI7/8jvs81W7ldcCuxeKu0bMoCyr3gX1PqcPpMsZcK4I9u/HHYWRbOt6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AtiX7KziXuNYbso+t7UZiTcxErpc3mcYgVojw8ODRI=;
 b=I1z8pFyAeq4DdKjAQEEBcrA6pxVAp+AsCTwSdt3UUt+hwI7HKcg11EQQ9Ik2xhw2j6hUjDR6WrSQ5BfwZnjfQi5XBnplorxqPFbOtnf2qOZxhRa3j9hOSQ8uXRs+zi9iaj3XHLzNNyGTkWOd6+4OCqv3ZNC6nM4edbhiTl94dy8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 10:20:32 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Thu, 4 Mar 2021
 10:20:32 +0000
Subject: Re: [PATCH v2 7/6] MAINTAINERS: update parallels block driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210304095151.19358-1-vsementsov@virtuozzo.com>
 <c5463f61-b9ee-bbc3-bd26-312e352f546a@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <b07b6761-f15a-9117-850a-2a429fccbc8c@openvz.org>
Date: Thu, 4 Mar 2021 13:20:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <c5463f61-b9ee-bbc3-bd26-312e352f546a@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM0PR06CA0136.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::41) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.81] (31.148.204.195) by
 AM0PR06CA0136.eurprd06.prod.outlook.com (2603:10a6:208:ab::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:20:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cae0622e-837c-4ea7-81df-08d8def72480
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944612E7AB36DDC51521705B6979@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oB0YfIvMgQLcPobO2wNC17twB0xvbNJVJEpzJBGrZdakVKEM8ts8hjpJMVdkSjLzdzwVQF9JDV9B+7AnSSuc39diCN5i0SUTQFjnT5el4gPV5+qmqQLxL19LwNU7+X75bf7FDK13R1NkX0yP0InRSGV4dvX0Gs0iFLb/cFPkYQqla5j4jreDS3qfDFecc1+D3oxv/445SOa3lc0F7UKA7fHakdfb4bg5pDLDJZ21O670oS6suUrNK/knNfsy3oHfFBSf2o/T9JbHpWQ1Lul71dudTkOpqqGG4pXN7jSFTnbdi4iH5l/B82oLpp1R3DzXo/3Xkq+OilXZ31Hz0l/+2CBMzqqgYIXWSUeunPBGSOLv83kAuKLeswJ8Rf8oaNpKr8S6TgRLBXptt6IshT/oPnUePZq+cjVuwkWC0sZUYsbl9DmkJQ5jkq432D1uWInwmde9PUZZzqQQHw53jLcbaixQ1knlofBtoIhHrZ6dUkWXbwlwPgYLCjKXOwA09BkEfcbV0HWSXcqCH/9QqpurcQKytxJEWAVdX//wtpMxpU9jEeeJJO4MGgbNcPhkQm1tBm/NPbQGq4a4zwgJLwCWmTFb6NB4j5MTvM6Mb1jG6IKxhd3wbkRU8BV0SyC9zopb+tQ3fsh+TEk2zaCMp0oiDh3impXICIXwI+edsYF+V7CyowbtNE2ovAF13lLznUB4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39840400004)(396003)(66476007)(5660300002)(66556008)(8676002)(4326008)(42882007)(83380400001)(31686004)(83170400001)(66946007)(966005)(26005)(16576012)(316002)(6486002)(53546011)(52116002)(2616005)(2906002)(31696002)(16526019)(186003)(956004)(8936002)(478600001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXoyQVJ4Q2NObVhyU2dvQXlKNTRPbGgzM1dXN1NnTThVVnA0QnN6ZlRHVWtS?=
 =?utf-8?B?TDRzZk9DMSsrNS9KZ0hITTIrbFVXNWF0QVNCenIxNWdUVnJsMnhyRUZZUDRu?=
 =?utf-8?B?amlPaDdBMWN1TEhRV0gyUXl6cGkrZ2grTCtYSkdKdVAvZE5yaFhpenArVEE1?=
 =?utf-8?B?Q0NVMUtoU1p1bWVMbHpiTEQwMGhlNHhVbTRFM20wemFWM3I4OEdhb1ByTUZQ?=
 =?utf-8?B?QmRxTmk2OWtxQWtSa2ZBazZ5alhMRFVmRjJXTmc5SWxiTDZrdWoxNm1ncjhu?=
 =?utf-8?B?aVZmcko1SEFPR2pqb2VsTEJhTDZhTVZhZWl3d0ZoVldjeXlVL2VqZUViMGVq?=
 =?utf-8?B?M1ZUVTFlbzJyNmZXbURaVnRMOHNsMnpOMmlxQ2VUOTF1QlFPRVFieEJrQ3BC?=
 =?utf-8?B?Y25oSUJON2RUTTN4RHp6THZKeFlNTnc5TG1wVG44MDJPaHFpOHdZVXVKSGJP?=
 =?utf-8?B?ZG1uZFBBbU0yRVo5UytESDUwbmZKemhmeHl0V1lmcFhxTE5uYXozRlM0RmVx?=
 =?utf-8?B?MnA0cWVHaGJ5NnVtaFZ6a082Ym9wS0xBZ0d2MkFKcDlxMjNLRG50MkVFWGZk?=
 =?utf-8?B?NWw2M2xXU0tRNUZQbGtRaCtYWm5FQW5NYUNJK3pDMjIzQ0pkczhCWnB3Uklz?=
 =?utf-8?B?b3VPTGtGWVg5VVV6K1ZkdEIvN1E3RkVmQzBHYlNxZGZBOXhMU0tBQmhoazBC?=
 =?utf-8?B?OWVwTzJVb1Z3VDJ5UzdJdGVzSG9ydVFac2lxKzN2RWs0bEhiRlQvQW00d2Zj?=
 =?utf-8?B?MklRc1dlaXhHNktWSDV1SkhvSWlCOUpjSHpRY2ltaUZmS3JmSTMwbDdZRnVZ?=
 =?utf-8?B?Y1ZYektydU1KeVkxaFRoYzF3RmE2THhRbzJNRE94eGEvSXVCSElOUlFqMUwx?=
 =?utf-8?B?T0I5RHJaeXM4bTlPUmpSelZNb0M1MTR3OEJ5QzBzSHlQMWhNanFGRVNodW9R?=
 =?utf-8?B?N0dzcS9RdXNXVkx0bzVnM1dEQk9qKy9kNVB2b05NLzBnODJjQ3hCcTNTK3pF?=
 =?utf-8?B?MDMydnFrL25qaXVUZHFsRHhiZDMzK1pCUmhkUTYyWGNmbEpQNkFoS1JFT3VN?=
 =?utf-8?B?QTk2RHFBc3RZVkFZREkwQlBKbXJlakkrbzdrZlJtU2tZSmNFOVRPcE1BUmtN?=
 =?utf-8?B?dmk4aGhaNk02eWowVUs1N3VUZjhtd0hTTVRmZE8zY1BuUzgrWWZxVzhmajRp?=
 =?utf-8?B?bXZIRnA4VEkyQ04wSVh2b0FpNFp5SndPM0doclhWSTlLQVhtTjJSZmlmSC9z?=
 =?utf-8?B?V0l6V1d2SGFSbjl1R1hqUVhGRWVzUDR3aHI5bWIxRVg1ZCsvZHd3bWd1bGtK?=
 =?utf-8?B?RjQ4ZXd5YWxIR3BjeFdxUlEzeHl1QUdxQytXUGZyeHVBR21XTzVucjg1Smhl?=
 =?utf-8?B?dWwrVmZDdXJobCtyeTdDZ3NaaDZucWV3RVV2VkhZWENUeXFxN1pGM1pmcThR?=
 =?utf-8?B?V05GYnpEdDNWdCtWc2o0eWUxNHE0OHozUzBuWmVQRVlXblVjeWxENWQydE5r?=
 =?utf-8?B?WW11a3ByQ1F4SWlFcUhDdVdEbTB6VnppdkkvL25WdFk1YWNKbjlRRWVHeWd4?=
 =?utf-8?B?NlQ0bE1KNzVPdkFPcmt4QTJKY3VkRVBmNC9leTZnSVNJVzJVQ1hwelpMM2dQ?=
 =?utf-8?B?ZURVeHI2dkZjdmdBNFozZlkyN09QalRLanltYXdXN2FTS0RIT21DeFJlZkxt?=
 =?utf-8?B?cG5jWVgvdmJiMDhzclhPQmVDa3JqL1gydkRRaVJxV2VHcU1VZ0tremJscHh2?=
 =?utf-8?Q?/x+uh0ixXawS3wSp4FJvsX5LyTtThx83T4aXMxy?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: cae0622e-837c-4ea7-81df-08d8def72480
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:20:32.6823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+0/9c/Z7MRWA+JjXnvD/6o2OJEKPupAnXXxPiJvC/Bs2pKBCi/CmMImS1F7n76fPEj5amZWyn9gidxLCvgaNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.20.117; envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 12:58 PM, Vladimir Sementsov-Ogievskiy wrote:
> 04.03.2021 12:51, Vladimir Sementsov-Ogievskiy wrote:
>> Add new parallels-ext.c and myself as co-maintainer.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9b2aa18e1f..92ba1fce5e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3117,9 +3117,11 @@ F: block/dmg.c
>>   parallels
>>   M: Stefan Hajnoczi <stefanha@redhat.com>
>>   M: Denis V. Lunev <den@openvz.org>
>> +M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>   L: qemu-block@nongnu.org
>>   S: Supported
>>   F: block/parallels.c
>> +F: block/parallels-ext.c
>>   F: docs/interop/parallels.txt
>>     qed
>>
>
>
> squash-in:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92ba1fce5e..6d6480e1b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3123,6 +3123,7 @@ S: Supported
>  F: block/parallels.c
>  F: block/parallels-ext.c
>  F: docs/interop/parallels.txt
> +T: git https://src.openvz.org/scm/~vsementsov/qemu.git parallels
>  
>  qed
>  M: Stefan Hajnoczi <stefanha@redhat.com>
>
>
>
Reviewed-by: Denis V. Lunev <den@openvz.org>

