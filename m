Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3933B429D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:36:16 +0200 (CEST)
Received: from localhost ([::1]:43140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwk87-0001rC-4q
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwk76-000125-1q; Fri, 25 Jun 2021 07:35:12 -0400
Received: from mail-eopbgr10096.outbound.protection.outlook.com
 ([40.107.1.96]:17799 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwk73-0004cn-3k; Fri, 25 Jun 2021 07:35:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsJxrKQs9GhO+PzDAXOkqMNOxZGhapbla9/7si6kymHvz4wle7YQOyGdjQuPuP9jBeUhL6KBl4RIXkhR1qjIzMrbc6rIHdCcq+JqgD6qxMgr0ezTN3Pn1cRDt3rwGewaLAbz8Wt39ylnF3Urh3BvmbbJuN0cExjUc/UEAgr8CczKGU3MqFbu/ZqrSzrqT7kb5ybu8l7NwlRNN6iG0x5c8IZWEVJcNb7S5aWof3DMxkKQ/JW2zXua3rnD0kguHqlVWkQ6MVsSawwWTsIBSRm+Q4as3FwxS0o/aXl87x7u3DIdV5zjqEPc7FcDRBKU99JF20OBzEObm51dHV574JNPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+f9dtj46O1gBytRGoB9c3r9ugz7VAgfuFrb5Fv5yOk=;
 b=gg3QlOH1Xeu03xjVkckoMgHVIK8kfkk1M6HcrVR9GgDUw4BOG2MqqlqDS2KKA/06u3LlRbrFa1qZ/sR68vOo7wuInKm4Vl+ELcz9Osmw9njOUzMV8C6FIcVFaccoE6ArXbVq4zLwQYlBourw8u/i9joxD6iSQXNxOrHJLSAGo6BPEMI9yRP7PzdrcIAEtiX6nJtij5jhm+CawzIiZzyK2RD46QEg3an8mZ4G3feb6tv5HHemSttNjH5ZPmaxw/EetkuKYk4vp1LAzm3YaTVuRkmfiqJ3Te5b3Eyuqn6FFBcm+/JWf78W3qwNiz9++OU1B0DWTmgDwEVu5PrRJqo+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+f9dtj46O1gBytRGoB9c3r9ugz7VAgfuFrb5Fv5yOk=;
 b=dEgTTgHkilVYqNw3yO9IfrB0BOFLTFaJh6+gO/XBrFwlkKF2HyEF36vVWsdWGEr0/recytP7hufxKBIji4Xicj3ew5k6y3QfwBPiULo1cngwQIpsnCqLsVF2LUZ3UEIjkC4nCX1SLyogaaeJoIAw7olD71UK5GQ58tRkyFB40f4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6726.eurprd08.prod.outlook.com (2603:10a6:20b:39a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 11:35:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 11:35:04 +0000
Subject: Re: [PATCH v5 0/5] block-copy: protect block-copy internal structures
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210624072043.180494-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5f30aca5-e8b7-58b6-f0bc-e8bd651c0aac@virtuozzo.com>
Date: Fri, 25 Jun 2021 14:34:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624072043.180494-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR06CA0159.eurprd06.prod.outlook.com
 (2603:10a6:7:16::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR06CA0159.eurprd06.prod.outlook.com (2603:10a6:7:16::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 11:35:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc55a83e-572a-417b-160a-08d937cd4687
X-MS-TrafficTypeDiagnostic: AS8PR08MB6726:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6726A9AC4898D584EB953278C1069@AS8PR08MB6726.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhtcmLD+TqkEwfnHlysYRpJcRuLgDHvlnVms2moMb8yB3UZ7h80dz4Fz4z2AYM6jCdVBKbdCgLJPUmvn6GtHoDg68NM98qAOzfgFsGCmvSJLJ0L2w+Rwcksxxk7dsdhxmjEG8bgqrxo+nj3LaSA61z1nYKmSKxI5PTMPl5rqXulEQTP6rESlM6xnt6WIA56Rbe151CiXqFMiJ91Mygxk4b2Ifd6BCNkDpaDefcVT2uPUDnk+aDMLWNfFe5MsdzrjEwjGRG4B0Aq1M5dK+2X2zmeMRf/+AhIRUL3XSlcssu5FM0veMRpVutlrk9TOayEkTJoQKVb4JyPk6no/KXHZGeEAPSTaL1BOSNP98oG6sXE7+IBAP3iGUY1nSTwrx2AhvowUK7dYIidsvEcjTFBRg8SFFjlSQWuOAhUT0jnl8Ilhsdr7142FbqmWrhCBVI3nP2QJDqms3sr/YlP6m0T2ZGbdpFru6ieCVtx3Zt/DZL5ec8nzF96wmi7fqM/aMIOfMKsYYiVjTZrU5Z9Y1TEqX6wbA4d7rPjm3+flLMr0CeQK9WsbH2uHLSmqufApKoDY3k8A8nJ4g6MUzZRTCvg/XTDTM5C0TRYgztWEs8coHRcTAMB5givwhjE6XmLfQen4LdDbgveXUH4pA6avIzFxyogyjyNMiHiNd+b6OphdZB6qBoP3McItK5N0jFetbGimm8f64QSqBv8cUDVmr2v2NHKiFwaeCjML4b3rgq6ZJudb/0XR8Qm6rl7+9r62uPn7Ot32jMEbvbukQpBk6wietg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39840400004)(136003)(376002)(396003)(52116002)(186003)(16526019)(26005)(6666004)(478600001)(5660300002)(8936002)(2616005)(956004)(8676002)(31686004)(16576012)(316002)(2906002)(38350700002)(38100700002)(54906003)(4326008)(36756003)(83380400001)(86362001)(31696002)(6486002)(66946007)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NytVN0Y4NkJtcDVpUmd4RUJTZFpTSEJVTk8rRVNyRytScytsaHhMOWRDdWdy?=
 =?utf-8?B?MFFuYm1PaHNiUmhEcjQxSUJpNExXMkIwN2twM1pQWnNzd3FMMmMrZlVJdmVB?=
 =?utf-8?B?ZmUrU0xZQnBZNTRsMVgxTlNGYmlMbGk5MFFYYllLQng3RGZkczhiRi8zbGt6?=
 =?utf-8?B?ekdLanhidUQzQi92aXNqL1N2WVNJamIzOHBCN3N5K292T3JhcndUZW51UUxC?=
 =?utf-8?B?Y0pxbWdvTXVyeUJ3K2xYSGJURUhReWQwelpYZTRiUm9zdTBkK1lDdkRsL2FS?=
 =?utf-8?B?cS95anVpZ29FdkttRkduTy9jbm1YWnNtaFVnRWZ4dDhUcVdoTmxjZDBWem9p?=
 =?utf-8?B?UitwSFVYUDR5NTIyeHdZYUw0elJuamhHdTBYcXJNdERDdVVjQ1FMbW4wR2Q4?=
 =?utf-8?B?MFB4R0Y5dXlack10MWUxMEFWb1RLTjhpcmQ4clBVN0NiY2lRWitzY2xIU0Iz?=
 =?utf-8?B?enE0bXNieXUvWUs3WTRFQVRQa28xK3Q5bFFuRFhzcktrUGQvejhIOFJJU0Rl?=
 =?utf-8?B?WlN4cHJxU2x5YlZWREQzK0FCaGxSc0lqVmt5Wnk0OEhXWU13OHA1OFgwRVdU?=
 =?utf-8?B?ZFdOZWh3T0EveWdxamJPb0c1eXJqNWNraVpiUHFmeUNGVUFPT1k2Nks2dE9P?=
 =?utf-8?B?aGEzazZQUUN5UHMzcEpsekxnTmRGQ1ozQ0VFNlhmVW1USWd2Z05XekhZaUU3?=
 =?utf-8?B?ZjZ3bTQwdUx2QnpGcXlZNVMrQWF0SlN6YlB6a0JMRGxDck00ZVRBV3JWM0xO?=
 =?utf-8?B?dTc1WG54bXRKbjUwdUlGTVZTMUdoUk56cW1HZmdJcjU3ZDJDTnBrV1FhM2pX?=
 =?utf-8?B?VjliN1ZBKytpdEJVUTBCaDVWcXpGVC8rWmdhdFVrUTNHbzVOeWxaVGt3VmZM?=
 =?utf-8?B?aDhDQXR3SVlhRVZVWG0rcnMyS1FjRm4wakFnVGlSWjk5L2xXdCs5bGdKRFBh?=
 =?utf-8?B?UFBDblNYdTVyOVcyNm5mUXFFRkhBeGprY2JhdEZoK3FrUjNCT2NOMjZoZFBs?=
 =?utf-8?B?ZytRODJkcHdTTk1GVzdoWEJLZndHU2d4akFGeDdtS0M1bmgwM3VLbmd2MVdI?=
 =?utf-8?B?ZUZMTlF3R1A5M3hYZmY4dytpOEp2a2lEa0ZmejdFclRSN052cXZ2YmNTbkFr?=
 =?utf-8?B?WFVjRGdWQVM1TXVQZ0lPN09saEVlR2pWeG0zM0VUbFJ5K2ZKY1BUODhpREtz?=
 =?utf-8?B?TndTb2JvdVdjb0ljNkRqVC9acTZrZmpwenVDVDVxSmJobzRvYy9lVWFuaUwv?=
 =?utf-8?B?YUpWZ3hoTG5MSGFLMEpDUm4zUWRWK2MyQ3ZEa29oemJtY3hMTm81Vll6Tyty?=
 =?utf-8?B?Z21QcXhrelRDb2dkVFpxV3I2b1ZBMEZpWjNCdXRHaDNzS21xaTN1bWxLeU4z?=
 =?utf-8?B?UHc0T3VoN3NxZkZ4MERMSUFBb1JiTUZ4d0hTRTlHOTZ1WE8vVUo3TzQ4WDFB?=
 =?utf-8?B?S0EvQnBrM1lIYTMyZWNvMzllcVlRT1JGUmhnR0FGd0VRVlRVZEkwdFAxcFJ4?=
 =?utf-8?B?Y3FyeVl5bEVQZmFYNzlZZkRxcTl3TnR4M3NRN0kzVWVTY081QkNzL1oyTjJB?=
 =?utf-8?B?OTRmTFE2eDFSTEpsRlFHVmVLZzdBTG5INkNXRFhNVm5lWTQrSy9kMDFHVmVj?=
 =?utf-8?B?cHpXd2duOWo0eU40bk4wakI5Nm5MOW1SUThVZ293M2hmc1hyOE96ZXNxQkxK?=
 =?utf-8?B?V1dKZnpJVXRmQzBYUVRqMWVpaDJldnUvSVpjVjdHYkVJV05SRnNMeHF2TWY1?=
 =?utf-8?Q?tqYr5NTajOitHjc331DJ4Iw6qvUjjAbe2i5HIbR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc55a83e-572a-417b-160a-08d937cd4687
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 11:35:04.1683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mum4xAPlYAh7XZ/f1TRhZfvPobORZHt2jhDM6sqooT5sc3R4bEr5q9gh0tRq8eHpXSYjFt28GINzYoyDvIS1WB8sZrgnIhsgNSa5emV5B5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6726
Received-SPF: pass client-ip=40.107.1.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

24.06.2021 10:20, Emanuele Giuseppe Esposito wrote:
> This serie of patches aims to reduce the usage of the
> AioContexlock in block-copy, by introducing smaller granularity
> locks thus on making the block layer thread safe.
> 
> This serie depends on my previous serie that brings thread safety
> to the smaller API used by block-copy, like ratelimit, progressmeter
> abd co-shared-resource.
> 
> What's missing for block-copy to be fully thread-safe is fixing
> the CoSleep API to allow cross-thread sleep and wakeup.
> Paolo is working on it.
> 
> Patch 1 provides a small refactoring, patch 2 introduces the
> .method field in BlockCopyState, to be used instead of .use_copy_range,
> .copy_size and .zeros.
> Patch 3 provide a refactoring in preparation to
> the lock added in patch 4 on BlockCopyTask, BlockCopyCallState and
> BlockCopyState. Patch 5 uses load_acquire/store_release to make sure
> BlockCopyCallState OUT fields are updated before finished is set to
> true.
> 

Thanks, applied to the jobs branch

-- 
Best regards,
Vladimir

