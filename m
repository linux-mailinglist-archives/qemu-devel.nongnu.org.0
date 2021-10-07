Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23327425827
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:40:29 +0200 (CEST)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWRY-0001TE-4v
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYWGi-00016q-7T; Thu, 07 Oct 2021 12:29:16 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:5792 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYWGb-0007Ov-Cv; Thu, 07 Oct 2021 12:29:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIAb21GUziJ3SQDWooDa+q7pBsWCo+suvkWJ7NlHnbFhlm97BOrJ1wGZ5O33Fo+35EGvPgDznRApKuRvc1TyHRnGYAqwkKrlfBJxhEVaE3pZ1Avauj9GvS4Hz5jmEezy1LJkyWfcsqf9+z5nQdUiXDC7Xm4+jrZWZBjfqFuy63BuQO+6XuaYvMmeaZHNUDJuZnaosBhvXnXbbHKXje2QcIxQpfqkYqgF8zfofOvmo+muFU0v6GfTL1+kDVWDXxNZSGTLgIu5RzeDtXa4HwbQ/pgJU/MP8qD6dMTLMIfGPaw3CTR6DnWM+FrNk2Pn82UGqw/n5L8qAoRfUH1j30vVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTylAMo8M7WIvcP00FoFkyruA90cfaHaiGINkQPvKmE=;
 b=nw5keZYudmB9hfarqDrrE7rQA8S7x/sVYcQxTRZmHNcxyVkgM6hhnBeswnQSWYBhGCKBTA+CP6tuYipuAwJpDKlSMUiRlfNS48f8w1eFraW9Mr/ECw51ff4+LkWAIvFMgpXrtYXNEQSZDRSl1W0nhA7uZDKQP5Akn2HrbTPJIz71+P832sgEcBL6cqMQ5oVKhu3CrMv6mb0Z80EjBTRqJa8O3iKHrrvVEV3eTV5rZEDnHhp6xxVlszYiOFA1cxMoGCVnG9zFuWQgxg5koEDy4yaU0Nq3w3zeZu7uaX+D+J+HouyXxt756LE4y7X5QltQxfMGIeJHGaEAfWgy74oPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTylAMo8M7WIvcP00FoFkyruA90cfaHaiGINkQPvKmE=;
 b=HLGXJvA0R3o8o2fi4YJCVxqloB31CNzqBdzyzymib3y2vJRj7wPCWk3S0wDFmKqsVQ7TWhDn9JdwdTnuVlj81En4rplrMH9LY0H0CokwPb3VrfXxfYvYMhyRJxM8X/B1QpclOfG494OB+mr9MnTqhldvKHEjf97ZCe/09gDh9sQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3031.eurprd08.prod.outlook.com (2603:10a6:209:45::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 16:29:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 16:29:05 +0000
Message-ID: <4d839852-8939-0536-55d3-12c2e6503f33@virtuozzo.com>
Date: Thu, 7 Oct 2021 19:29:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 00/17] iotests: support zstd
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, jsnow@redhat.com
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
 <b0fb7a33-c273-33e2-fc80-d5488fbce877@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <b0fb7a33-c273-33e2-fc80-d5488fbce877@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.207) by
 FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Thu, 7 Oct 2021 16:29:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7e55438-c861-437d-4ae5-08d989af943d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3031:
X-Microsoft-Antispam-PRVS: <AM6PR08MB30315BC2EEFDDC148071FF00C1B19@AM6PR08MB3031.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: se48rl3yfHoGksPoK5OiVtmFgVSWIxKd7ba93tqfyuSaC3CfikUYvAJuSmQIfS9qcruhR91+Pgnjm85KvnrPmzlnGmrb/M0HJa828sZpo0JbgaXNxP7G6m1sureQmNeYZ2Xd3n9yXmaVnUEjPUqHwNTl9p4q1ZZ7mdJz9TNuxszrm2wyDuXgvCj/cFPkY9QcsOKp0fymYWOaPMiinPCUxR0J5FS7mV+VbieOm6cGvSU/8cqxhXlfRPOl8Yw42dREwwB9ZYWgIwfG1ptJaRsoJfQkISJIBeDl0dNJ4phmFq/aAIrL5YZOYyxX0lCST7FddyyyefghP5pIBD2nnlc2MJGxW3ONJv4WEN0zo5ZhzGDJkM2je3txM6zXFsICyAlsNHreWBg5kWu6vEQ1M61GI3NMvEB3sxR4luwb2sdCzoiGPyW5mhfbrCrgt3wHH97tBJXxkQ6c9rTibwHafugopoyxektMSw1PLXI+0hvgXeA8rbbiod/iqHvhZ1179piabOp370+p0USltxcS+YnbhV0gjQhk7xn94aN3Tal7L1OrRigHTRxEW0/HYfRBW2v+uZHWxi3SoV6rM9WW2awMvdgBs6hcRIRITPFmxdO9S6pn9wipceOfNUPuG/nWFLREYLRzCsrHTKcMTfIKOsxMYCh3nJu3TLTAzKAUUwdCvGDPBQ4Z1gXQfrvEo3xZURnYaLazrI8mlO6fmGyQhXq8RsBfS6MvK5N+moZbV1YmMovZfHJVnD8EjPVWuyXmGQ0bPxJAaZ+mYjcVa6H23I9p3rZIRMi6NIQBfTp9lUTE/dUPxSbYiJpiJu1kcLGQb/zzy+qn7gIQWQJ1FW7KbEc9bodG/Kk2aiZ7i189Tp5ZOF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66946007)(966005)(52116002)(66476007)(4326008)(2906002)(66556008)(508600001)(6486002)(5660300002)(38100700002)(38350700002)(86362001)(53546011)(16576012)(316002)(8936002)(83380400001)(956004)(8676002)(31696002)(31686004)(26005)(2616005)(186003)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHk4aWZTNlQ0RmlJNVVwV0hwZlRweXVBRkx2WFRURWUxdlh4cCsyQmlFSTEz?=
 =?utf-8?B?MUV3RHhJVDc5MWpMcXJVc1lTUFdPb05ZYkZ0M2pBZU94bjIzWkZUeTNLYkJJ?=
 =?utf-8?B?TVJCN3VCcmsvNllqUUFOQ3lTZEtPV1kyc25WZ1VrVnU2RlBIeTdhUFdMeDRO?=
 =?utf-8?B?SURBMm8wU0VZb3M0OFBnakYrODZvS05INWZJS2szMEQ5T3MrR2JISzRWN1o3?=
 =?utf-8?B?MDBMT0Fxc21INjg5TFJ3SEpYVGtGYnpqcjFiaEpJUk93N2cxMTEyOEY5OU5u?=
 =?utf-8?B?clVqcGRFUXVUcklxTEIxLytLOFlLV2wzTmFaUEhYcFhCUmF2MFRKeDlVSXM0?=
 =?utf-8?B?UEpBMVlsK2M0bklnclBlcERLN1h1M2lGZEhQZFQrZGx4WW1WL1E3RzV3b1pF?=
 =?utf-8?B?Y1gxdjhhWERpb2ZvWCtSK1dPOEtSbmRsdmpLMHNTY2ZJVlBrWWtMTnE3bzRm?=
 =?utf-8?B?UUx3cFNNeGFEaGsyaE9tL29QU2hJMUNjRzR3bkFNRXdyQ090WEkvM25DZDZ1?=
 =?utf-8?B?N2lqZXIvSzM2cEpoaXlWMmhIeU4xWnR5Y0t1ODBIZzNpN3B1ck03V21NOHpP?=
 =?utf-8?B?Ly9aVVpKUzhkZXduRkdaSVpVbHl4cXNZODB1c2RsZ2NaR29HSEtZYkZyT3Zo?=
 =?utf-8?B?b2VRYzFIOHFHbVprMnVaVGlLMjlnQkIrbDNaVmJIL3Evd2pYV09OVFFUT25L?=
 =?utf-8?B?Q09iYlRFYm9mUWJVdXBzcy9xNk1mdWJTVWp0YUVUMFFwSVhEU3N6VEJaMVB5?=
 =?utf-8?B?N24yTkV1bHk5dWtENTVLNmh0RWo0QjJsYzFON3BQUWw2V2JQRXhDWmROd3l3?=
 =?utf-8?B?NURiRHM1WE5tcnlrQlFZOWhkMWpLOXR3UnJKYXRjVXRBcXVWeVF0aHhBY3B5?=
 =?utf-8?B?ODVLS3IvU1g4RTJ4NzNCdGJ2SlFHL0lXU1lpTkE4SjlXSDdpWW9heTVTS0FZ?=
 =?utf-8?B?QUF6bnZoa3V6aUZGQWZqK29hOHRDbzdxK0VBVWg5czdxaGZCSklGUFpETUVR?=
 =?utf-8?B?eEpKV0FSWkRXektTelh4enNqeThKbGpJeUVlQnZSdWEyVWxiQ3hJL2E4Z1NY?=
 =?utf-8?B?WE1JMmhxbEhleEo3ekR4UFZGalNWNDhSVmgyT1ZROFVoVmlXWWRTeDJBeGZz?=
 =?utf-8?B?cFlUdEpxZVRmNEltMVUxUGFjaUNURmVpNjZ5Z3hVazNGN0ZMQmVHTFpKaUl5?=
 =?utf-8?B?aW5Lb0FFYXBFUFZLc1QwS1ZRU1ZxZFhVU0kzVFFzS0NVSU5oNlJzQnRwQlpD?=
 =?utf-8?B?YWgyY0R2aVh5YTdVMnFvWDczM1FEVUp6ZmJSZ01ycUxtaWh3YWh3Z1d4NDRS?=
 =?utf-8?B?ajNlWlIvODRJd2Y0S05GaHpocUw0OTRDd2ZoMzVjUkh2eHlmd0F3VzBpVGhM?=
 =?utf-8?B?ZU5vdm1qbjVJTWd0WXdyQ2s1THZPVnZ2N2E3U0RHanErd1YzQUkrZGNHK3Jo?=
 =?utf-8?B?dHdVa1M1RWZuSlNCN1J5RDdIVEtqVk4zVmVhQlhqWDVHbW52a0tHZTNncEpJ?=
 =?utf-8?B?b3NpZlJGT2g1dUtFVktZSWRCVmlsK3JwVmZ2UkdKKysyS0R1UlArZkV2a09a?=
 =?utf-8?B?akZJcWtvNmFoUkpzN0NYbUJsK3dNeCtkVDExL2kvTlJnanlWa0VMeTFpYVZs?=
 =?utf-8?B?UXZXYmpxYlpmWmxyWVp1aHVFeFlWbmVJeGgzTmpSSE54cS9kQ3JlUk5Mbk0v?=
 =?utf-8?B?c1IvTEFxVDVLV1VpMUhBWU02V2FaekU0aFNlUnpoUmlHZ1VucDgxK3BTeEFM?=
 =?utf-8?Q?9YSCm/ANkePnNSB5LkNTlqxID5mSjGeO/ZTo+SM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e55438-c861-437d-4ae5-08d989af943d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 16:29:05.3034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcXbDg0yHnLzhylSQp5BJyUkG1SMCB/7tb1YDZQ5drrGl6gpFDCHiQa87BlJkDyLvHGmCUIgUIoyNco6ZmSYUqtGN+hYQLdtH5Dvb4E+YDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3031
Received-SPF: pass client-ip=40.107.14.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_NONE=-0.0001,
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

9/14/21 20:08, Hanna Reitz wrote:
> On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
>> These series makes tests pass with
>>
>>     IMGOPTS='compression_type=zstd'
>>
>> Also, python iotests start to support IMGOPTS (they didn't before).
>>
>> v3:
>> 02-04,06,08,14,17: add Hanna's r-b
>> 07  iotests.py: filter out successful output of qemu-img create
>>        fix subject
>>        handle 149, 237 and 296 iotests
>>           (note, 149 is handled intuitively, as it fails :(
> 
> It was also reviewed intuitively. :)
> 
> Thanks, applied to my block branch:
> 
> https://github.com/XanClic/qemu/commits/block
> 

Hmm, patches are not here neither in master. Aren't they missed somehow?



-- 
Best regards,
Vladimir

