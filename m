Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00B3FEC0F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:21:52 +0200 (CEST)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjqx-0003R1-Jx
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLjo3-0002WF-Ip; Thu, 02 Sep 2021 06:18:51 -0400
Received: from mail-db8eur05on20709.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::709]:23264
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLjnz-0006Op-1t; Thu, 02 Sep 2021 06:18:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhgzhfY/qcFVQyjILZOCSccdpxTfOyzqlMMJS9N1WhPg3jH4DwJoK6GEUndobc8lYIJb/SXflr6B/voYkqrAiXWjJdROrUafZ0DlI1fqGqQxaT6Fsdx02FnkvBy1vfmTBv72WvFxjw4nfvawbBeCujnBnE5uPQE4QB5kbCE45n3GdpY/SM8LprY1HD7p4puhHvWK5fkHQpWp4aSlemssCDjM15SbujoWDLqWvcgkJSZrhJDPYE5AOrEZF7qBj8PB2rMhH7vlvQj/S+rVEZ+W5+3Fxn8/IVuq/V02mx2jA4EN1sdIWrq0/j+W4pFtdTnnTzvQFgAZJHILAIi64jMCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=A4DmjhlTtnzspVrfy0okkpRzN94sFdaitmkXsgFRmkI=;
 b=RJo0EOakRrijUVchTanDxWS1KKU5dUO+L8/X5iZPaGgWccT6JQ3yNXq010NTw0ItO7ovKGidg+KVxY9LgK0BafLnQ+4jfS3UPZN24rgQClfG+7tRLcNq4B3JA3x66/DOJjOBw31Dup6S125ypz5UmgDyPwDu8UjWrdZ/cCr5Obe99JTOockwPY+KqxjATR4QhyFqyaYZPwTsqWn90+FsKuxPrlhMpwsf2XWVCLSWpMMJS49J2M7Layqg9R73L71oPPjBJkkoQngH3YyXVJCRV+xs153wiPxfE9bJVnM8tpHT2S90bcOHhcxYcuZRzOJi+WNQ7nyXmqSgrc8ykRNj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4DmjhlTtnzspVrfy0okkpRzN94sFdaitmkXsgFRmkI=;
 b=KF5k86RMr5TWqC6Kuoh3jlZZotaIK1TisNKVZzh7Fz/uIMhifzSs0Ic8vv27xL/6bk+/r6/dfcTJh3HDPYQweVYz8+P6zFLuGRvismw3QyYDODdi981KHgQPVN2FGBw6ty7+DvHyKGt6RW1zBVqgi8ACuQgncbnJ+aR18n/rCAc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 10:13:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 10:13:26 +0000
Subject: Re: [PATCH 2/2] iotests: Fix use-{list,dict}-literal warnings
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
References: <20210824153540.177128-1-hreitz@redhat.com>
 <20210824153540.177128-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4028889f-b334-908e-ff29-cf64a7006f2e@virtuozzo.com>
Date: Thu, 2 Sep 2021 13:13:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824153540.177128-3-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM9P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.21 via Frontend Transport; Thu, 2 Sep 2021 10:13:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f791021-67fc-48d4-bafc-08d96dfa4da5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32216BB07ACAF69025FF29D1C1CE9@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWPk2xSDMvroWLbnQIQvBh03EW4HEhdS94W4cM7OxNOJDFPX6pxJeDdLSelCxA/HZASnGaRmPB30LeYgDah3MBWppg5/3vvGNJ5gTrsnG3tKiJK85UBafkT9BjxjoSoKqrRf+517ynmRYuYhB+pP+fBs9Um+Sl8i8zvEnERxoqazzcHoWFXkK0u0GwmqhaS2Sonafkipy1sjra45N28JtGlRCuPCXZpwIlzr+t1HDIV0t2yMq3DYmw6w52GriPsRnWlc2zSD9ZWwZ0Y8CXYXqaJ5sdahY1+NH9NAJun2x2ZAd9W9OAgTe4S5SLG23uPeWGHLIJrucFFcodUqE2X25E+B1Drz2PJCHpDNaSyPbWrn3UqcFql92D1gq1Z+XN1mvUtAeW3iu6IB/TzJPaeAImJBTzKVNdEYn4ZDDDvZQ5PR1/YpLbOU5/2ltTmMfAvEW6vdy9kGA1lonBgVzt8KhOQX6VMFv7EsUqqJAkmnxXhSx2mq64zRVXrMw075/49QmQyD1LEAWU22T/kBS4ET5Q0pBohq+N85sQ2GumXYBi1MyA+h6ENx3tBTWnpM1TN0hVhdZdIqBO2J9ZfWf1SpeFtNp5BYjmZCSpfk6pzbypU4XJ1mn9/3A36Toi2wN7zVDEts9LNqa329/4HxCBMHmFG5dq1nzfVx8fy5ItEnm+iemaNZ0LYAgwnuzLWJFETNhKGiV5Uk8kYqjF6JmfLYIyKsCuZYWRQaQPxtXlyZSOihYm4LkEF7wRz7q2FzXzhTB/KJVDD3ZO0nKmg7Gc7d3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(136003)(366004)(346002)(396003)(5660300002)(16576012)(26005)(31696002)(54906003)(316002)(66946007)(66556008)(66476007)(186003)(36756003)(2906002)(956004)(38350700002)(8676002)(38100700002)(52116002)(478600001)(31686004)(4744005)(8936002)(4326008)(2616005)(6486002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFQxekgxWFM4emV5cThlT0tNaUJuaHUrWTZRWVMxS0h0WW02QzdmcWNOa2hj?=
 =?utf-8?B?S2RhS0VjY09rREVMQUhRSHVHTkNzRHdTdzBETjJLajVFcXpDSHk1U3krdVZl?=
 =?utf-8?B?NFRKdkJhQk4rTkdMdnlxcjRKVlVwZ0NrYTgvdkJ6YkRoM3hzT25NMzNGaVMy?=
 =?utf-8?B?L2U3L09rWmJ4aVJBZEJEcS9heEh5eUhJUHhUeWg3YzVYQWZiK3lTbmFsSWpZ?=
 =?utf-8?B?U0RHcmFyaTFONk1SVDdQbWhiYlRFOWZDUTRVbStTR0RnUnpneERtZkpXMFda?=
 =?utf-8?B?UldELzk4QjFaYUtZR3h1MStDVEpQcW9La0xMR25jZ1ZEQWRLV05UTWdaOVVJ?=
 =?utf-8?B?SG5jN0owRUhnNU1DeVZCZlduVmRoeGI0d2hZRVVKSUlYT1NlaSt3cGFxR2RH?=
 =?utf-8?B?dzduWklPVkFkMU5rZjExY3ZRbnR0aVVPSkdhaUV5dXNMQ2ZZLzJhRkpCa05k?=
 =?utf-8?B?Wk1PdmppUUZaNCtENm9qc3UySVdDK215UGROY1dGdXBiMlFkM05xWlBuVlZD?=
 =?utf-8?B?SkRUc1J2UTRwS3R2dlFVc1Zzb0VxNVJrN3hmSTRPYmFJellUVTk4R1RwYlBl?=
 =?utf-8?B?R0lkVEpBWXhMbDZ6RjNJMjhrcUVpanVQRGQ3am8wL3ZTWnpHZ0tsY0txRzlV?=
 =?utf-8?B?Qy9xVlpYVTRwVVJZbFJiZStzcW1HN3o2aFJOc0JJZ015eU83QmFwaWpxdEpz?=
 =?utf-8?B?RnZZd1ZURDZCRi9meGVGVkpEY09ndmpUVGYvUm01OHRWdjBHczIrc2dkNlFz?=
 =?utf-8?B?djQzSG4xSlI3YnhFc3V2TjhNYUhNZHNieW9hSmpGY1Bsa2c1WVcxM1pCRFdi?=
 =?utf-8?B?RVYvZzhQcEhXQUJNL0V6UE9WUCtPOWNWM1dQd2FQeU1qc2pOWmFpSlBOV2Jy?=
 =?utf-8?B?ZEtTVUNnNVFTNWltbEkxcGduT054cEZPZDFYUm5iMWJwTXhTcjZLM3g2MVRT?=
 =?utf-8?B?dktlMUpkblFvSG5Md0hzdXI1N09VcTBzSnFJTnV0dnNEV20xVVFVRytqTGJy?=
 =?utf-8?B?RDZLRkJZSkpEVHBSamQ4YXNXUWs0RWJhQkgrV0w3T3ZMZXNiYXRHNXY1UDk2?=
 =?utf-8?B?M0J0aTJJQXMyQzFBUUwvYlZaTjBsR2hTNHJERmFBSkpIUkd1T054TWNITUF6?=
 =?utf-8?B?SjF4cUc5TEtIcGtDY1lWL1lIT1JkSTNuL0NrYlNiVDVYdm1HWUJsUDBhUkty?=
 =?utf-8?B?b3BZRVpFa2dFMUY0ZWZvT0VRUUhCOXpwUFJPN2YvYWxYWGI2by84c1BYZDFD?=
 =?utf-8?B?bDdONWdBb0ZLMjdJb2JTTjdWV2hNOG9KS3dMYytPa05oOTVQbzBHYk9WODI4?=
 =?utf-8?B?c1NwbDhodHJudGxkUm1pQnpXLzNVWitUUVljMjBjTWVZamVmRkovQy80M09H?=
 =?utf-8?B?cnpQQzBJczFrQTZFSkFZanAzbExEMkE1bEp1dlR0TDZjMHM1SnMrdE1pTzNR?=
 =?utf-8?B?RXExZ2RmWFBkNUxzUytTSmV2M2hNWXljNW9XUUJKNENkdnJSRWNiRkY4TzQw?=
 =?utf-8?B?eFQvbVg4eWZ5bWplR1QxSTdoZkJOcmNWRnV3Q1pYT0JQTDd1VklDK1lvbTBZ?=
 =?utf-8?B?aXNDb2l0aG9JZ1pkSFAxZGgyZ1FMb1hiSG54WmJkS2RISWtTdVRkUU9PL0Vy?=
 =?utf-8?B?V0lEc1NHVjRtZDdhOG9ta28yaVlDYVAxVUFISVZ2RXVIbzJVY1dTdE96Ukdn?=
 =?utf-8?B?TkExT29vWXpaViswbVltUUJrMjNNM1gwUnJlai94RGFKYTNRZUZiZlcyeVpU?=
 =?utf-8?Q?ut/qMjo71Jb5DwTJDuMU2NBTjdVGXR4h7+/h6/H?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f791021-67fc-48d4-bafc-08d96dfa4da5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:13:26.2938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8HPAi37BEgfMciGUiloJu/pAje+dB8t8emoR9usA0qjzeu3EECurT6mJ0YgjAiAsb6gY9SZpT7t+Aw6mXJckItMwoIWUXhE7cMCVKBN2XU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=2a01:111:f400:7e1a::709;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

24.08.2021 18:35, Hanna Reitz wrote:
> pylint proposes using `[]` instead of `list()` and `{}` instead of
> `dict()`, because it is faster.  That seems simple enough, so heed its
> advice.
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

