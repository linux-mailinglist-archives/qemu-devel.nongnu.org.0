Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48EA38CA7E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:57:48 +0200 (CEST)
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7X1-0003qg-QB
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk7VV-0002Ko-BL; Fri, 21 May 2021 11:56:13 -0400
Received: from mail-eopbgr80093.outbound.protection.outlook.com
 ([40.107.8.93]:13827 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk7VT-00042J-KV; Fri, 21 May 2021 11:56:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtjIe3nChXa2D9RqDq4SGoRW71p54FTLEpU49FXih88JbDuSA6bBzR4+VThb/yC/RstNqyOGwEr+63pQaLOsIWL5tgvPhNyw8S6blJ0eLztzM5/TLyEiKHf2aTWU/eR9ZvCRR8C/EP4wZjPpHDe3ZsKwQ1UamsFtOnz9WZglcHeqA+z+U2bFRDXWy5kp0xmNXZHP9wSdz4y1KU0O/KxkQ+2FfxwXcnS3k82K2jr9SIWRS3sdtT8fP3pwf5dFhNIf5gTKWxJU4cRYV954/u564PP1pe62ZEKlH5byeY4+Fq/cGD4nMHWS1f+0hRnpt7liHGjn3NPezyTippXNi1BKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LecQ1U6cW09BUNz/tXbisThL5BxyNEU5ogekOSgul4A=;
 b=cG459S4MJk0RkOK+r8b9Ya4zgfp9qCssdjbSn/ozFCHbL+j8VLOiH3S886o6uF9HWbqEPKZHhgFTBxR8Li54pclfGvMYz2LHhud9MPWX+34FlAqYCIxA/zGhhBAYRK/GCJjFv6ZIXvffEjWiGlP1RS1JFMZfESfjpYTPlobO+DNWDvwIDPuqvUxzWhrTVVjmaSQOwJuBX0HVpN3XkYdbtValb6xJFo9AsoXZWa0lAavwKhI0DHpyTA3PpiTRkQX8FaJ39YVC1T20IHKs1LRNYf20AsGE5fSXWFMA6kq486EPCgCJqN5W38OT0uIFs1yPN2uI6ROYwVottJ3FPJ81Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LecQ1U6cW09BUNz/tXbisThL5BxyNEU5ogekOSgul4A=;
 b=Znw6OFR+YX7UpJLdURAECAfbKR8iFyZPD1USCVtwLIzuPkghufIaDbCmkp4Aoq664H/vfVXGVeK+zjLubgL71HKeEH7URZXnCWk0cWbal5LDEK+kFOAWwoFMm6LogNqsoWyMgnAYeW32QbYAI/5DCg3SBncHcyzDxSLE6wNPlco=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 15:56:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 15:56:07 +0000
Subject: Re: [PATCH v2 6/7] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-7-eesposit@redhat.com>
 <068832dd-c577-0234-4a1d-dfdae6a5b4dd@virtuozzo.com>
 <05e94bee-8ee8-e23f-19c1-a7fcb540e080@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9dd72513-87f6-bb54-2364-35e767e903e4@virtuozzo.com>
Date: Fri, 21 May 2021 18:56:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <05e94bee-8ee8-e23f-19c1-a7fcb540e080@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: AM4PR0302CA0007.eurprd03.prod.outlook.com
 (2603:10a6:205:2::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 AM4PR0302CA0007.eurprd03.prod.outlook.com (2603:10a6:205:2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Fri, 21 May 2021 15:56:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 868708b9-7a62-4d83-d2cc-08d91c70f213
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3623F85A0A2ED445B4559D14C1299@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iC391odCQ8CgYX/skMq4byf+mrAOE4OjvEUms++sgpNUumeR79Qn7A//DVQkmK7ItMSbsNkpn1qGfrQaWqMWDjIJnfdZGEtEVbiXx1YY6fU2A3a8+xq0yKp+8yVR3U5wPapTjSSjZ6ES4SDVp+66OJCF3CyqUBuXEWyIWRneV+EKvuMAXhYFzvk3b316ozn3MRFQh33bsSSA6HgSBHvIaBHJUMbKCAsgAtW30I/7TRLctccza4ImqxqSV3h4H/oTpuaShxiIlUUbzWnB8zrspqO56g6AkUP18KWYQAXW7TgmSFOLMw2xkN1lq5PDNCgWAk+fVPJNlVmquyqAVjUH3iJ44mqtwlo912KKtOre1VKaCongluvoZ73x3VD/B7KTBHUVr6RjGD34DuhyuxJokOMGbWfo/G6nO/uYplW4Yq9/4VX14Z0q1ip02XkML5+CKf/OnvtKQfnQVHbMTabHekHmdAXAobswREjdVP8TxsRUvO/ptk0ybMf7Xvlj+jLlqKHNAjL9SiiKuBLw34DW0luMu3rTakSdQoUQ5AMmbeNGrC9nPZBqMEt2YrTUalN+8nhsNlnlFUXTWg1RmY5yJuUYVza2ujLqR+ysnc/dS83Qa9NifbCxLPlBDqcP7dJGYB6wI6jbvkE5/ykJ4jr83jlro747LPX8ggCUJ3fsgPboZY0SB4yItXbiJglF7OiDVeAyMCsTvxHQfMaX1iZPK7lzrfnNqlc6fT7vGy4Y3T1mb66YhJ94OYY9eXoAk9Yv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39830400003)(8936002)(53546011)(6486002)(2906002)(52116002)(316002)(83380400001)(54906003)(16576012)(110136005)(86362001)(8676002)(2616005)(478600001)(5660300002)(186003)(956004)(26005)(38100700002)(36756003)(31696002)(4744005)(66476007)(66556008)(16526019)(66946007)(4326008)(38350700002)(31686004)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmRqRkdHTTlOTDRld1NyRS9aV1ozeFpRZ2hsWEFQSjQydHJYQkFaWCtKODNO?=
 =?utf-8?B?aGVOVUo2SmlSVCsxZGEyUDdjbUJrWHIyaEN0bzU2OUpSd1pOOXUxcmpncm9J?=
 =?utf-8?B?Q1l2bzIvN21PWXQzZFBjbUUwQm9DN0grM2NDdE5wQnFOblJlZmRlQ3laRCts?=
 =?utf-8?B?RGhTbTBDekJnbk5DMTRJcG9lQkl5Q2orVmJxUVRGS1pFdjA3RjByV1kwam5H?=
 =?utf-8?B?SXNqUHR5TnVNVUlGbDlKRGwweDI0SkluT3ozcm50L3hTVkxWSFlBbUhEbnhm?=
 =?utf-8?B?anhoK1JTT0cxejdhUTlKRXNpS3NoU3RUeHFoUFdzdzZUU2hBSGZBdnpCS2I4?=
 =?utf-8?B?ck9TRzhmd2xuWk56ckd2dXNDWW9jazNzUzU1eXpJWW1hb2x2VndiZW1xa2ti?=
 =?utf-8?B?a2FXTUNKajh4cnU1R3cvZFdSakNOaUpTZVdrVDNIbkUyVWppejhObzd4WGF0?=
 =?utf-8?B?Yk9FaWdpV3BSY1FLNGFhMUNmbjBoeTdkRFlzdGxJQVhGc1lCcUt3WmkzeWZ5?=
 =?utf-8?B?ZG1ONW5XczBJVXdONGdTbVRUazRaclFRMmhzaHU2ZjhLR0VDNXpGdTVsQm5a?=
 =?utf-8?B?RHBsYlVCemlUaXdyajBzcXl5R1FPVjYxN1l6aUE2QXUvNHdQRTg0d0FpdHhq?=
 =?utf-8?B?dm16Qy9ySFNhaEZpbVZIMGlDbEFYMVlUYSt3TUpIMzhSQjU2RVUrTHFFdENw?=
 =?utf-8?B?ZFIzaFVoVXR5a1N5azRyREljanhTUWJlUVJQTGFPZjNxYjZKcFlHNjNCVi9W?=
 =?utf-8?B?R00vTU1lVEFZS1lOVll5RnREejJhMnZDTFNUdWVRcWNvZEFHRXdXVnJzZnk1?=
 =?utf-8?B?dmZ0QU9RUnlQUUNJem5xKzk5OGcrdjdkQU12eCt2bzJxanNIdGpYQkxMYTJT?=
 =?utf-8?B?QnZnaG5xNXVNaUl3RkN3RGwxVU44blZ5L0xLT1NNbmV6OVhSeFRZVnRpQXhO?=
 =?utf-8?B?OGd2YmFPWGg4eW9zWjQ4Y09SMXR4ZWZKVlVLSTJ6ckU5b1d4b3BUVmdvOS9i?=
 =?utf-8?B?ZmNJdEhvQ3I3dzFlSXA2UXhwOFE2THFSczhPcVNRUkJjc0RLNDdNeVBOSzlX?=
 =?utf-8?B?b3lRVEI4dWJnbWd1d3BkOHJmSjhlMEpBbllDZzduOTlrK3BVNTVWV0NsQWs5?=
 =?utf-8?B?ekh2bjZBRUZraW9yNHFtYWFzKy9GNFRNMlRTL2ZyUVhjQ3Z4MmRWRWlsVk9Y?=
 =?utf-8?B?UHY5TzZVcGQrdXQ4WnNOMnJ0Y3hZTU9rUE1Ob0pRbmlSZzNUblQ4TldXY0F4?=
 =?utf-8?B?OXNQZXhiVCtCVG9YRy93ZmFWb3REbTRJcU5zTlRwK2t4WkNpdWU4YUdaa250?=
 =?utf-8?B?aEtnTHFTMFk0czZ3TVBYQURTNkJtYnNQeGh4YXpOYlBXQUE4SWVoeFRmaVhI?=
 =?utf-8?B?RlVweTJlRUJtKys4dDlyTWFnbnU0dTBqZkZDREd6dG1Hdm80dUQ1YUdndW5n?=
 =?utf-8?B?UHlvS3V6d2loQXowakNIV2RBYnhJNGkrNG1YRUpmU3NVQmY1aHpOM0w5OGs3?=
 =?utf-8?B?YXJ5SWtoRHlnZUs2MFJSQ1NSUzFDWENiNXpGSWlKR3pVaW1ybXUzTnppa1dZ?=
 =?utf-8?B?UHBpRmtSZkNaRGpxdDNkTVkyR1FXNC91Q0dLR3NpTkFiSjVUL2hSanNpbG0w?=
 =?utf-8?B?d3c1RjBHMk1IeTE2ZzRSSnY0WHY4em9DcGtCSnlQcWtTNnFNcUFndVpoYkRq?=
 =?utf-8?B?bW5RY2FZdjl6aUNZVHhpeGtRY0liMmNmbTV5ekdHNnUzdEI2SjJZeXo3ODlV?=
 =?utf-8?Q?CwWM2PQHqa8p2Zx1E4h/xjMn5fS0Tq5iiCum9Qs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868708b9-7a62-4d83-d2cc-08d91c70f213
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 15:56:07.3672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d84WqG99Clwf0gjlkO6Ogxu5udDNTCdaQ9YyztlgRIrGL3A9dVmAqwLU25KDvSFyvPdHhl6w7UmHzxNSNsnkWmy1fgPXOpLE1zrEFg6fuCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.8.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

21.05.2021 18:02, Paolo Bonzini wrote:
> On 20/05/21 17:34, Vladimir Sementsov-Ogievskiy wrote:
>>
>>> By adding acquire/release pairs, we ensure that .ret and .error_is_read
>>> fields are written by block_copy_dirty_clusters before .finished is true.
>>
>> As I already said, please, can we live with one mutex for now? finished, ret, error_is_read, all these variables are changing rarely. I doubt that performance is improved by these atomic operations. But complexity of the architecture increases exponentially.
> 
> The problem is that these are used outside coroutines. load-acquire/store-release is the simplest way to handle a "finished" flag really.
> 

Related, maybe we can support CoMutex outside of coroutine context?

Create a coroutine, which will lock the mutex and unlock it for us... Or something like this.. It will help the task of making everything thread-safe a lot


-- 
Best regards,
Vladimir

