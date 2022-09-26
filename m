Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4A5EA487
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:47:25 +0200 (CEST)
Received: from localhost ([::1]:36984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocma3-0003mX-Ss
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1ocmNx-00034W-FW; Mon, 26 Sep 2022 07:34:55 -0400
Received: from mail-eopbgr50138.outbound.protection.outlook.com
 ([40.107.5.138]:35860 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1ocmNu-0002TI-95; Mon, 26 Sep 2022 07:34:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWklO5QCmVyoCLwcWtbEpLaFPFZj69Z8wsKLJ+4rZmBAVfuTyYyQNnD7Igk82S3khNLqelT0N7ZPPMZYrPzlaso6sUYJd6Bmm/Gq5dbbrARLJve8jxU1EBBtnV2v0P5pJjo+LMCybdI2c26C4u9eiYIsmvCNnHX8R7wj6qp1rwxwLcRLsR7LCPfPs4fBiFsx+jkdPjqd9XiFG2KzTpkVo3Jwo/gR3+Arotvh1FV8Bmf4J5wcvEa/8Y1E5G1GFnp5YTXi9Z7F7hMFup8/tpxHAQe/vRN13uZnXPww4AY3ik1OfomL0E4QvaBFa5/sjYsZTSWypbvhMKx+7ji1CBmv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yU4tT9vyv5xp+qqVlJk7KCB1LU7Fcf96VOOsu++f4vk=;
 b=cVsZZg6xgxs6iAoxpqsSAfSxTEwfuU+L5+Mxh2UnDV3bFVF7IkPb6W8OB6KUKVdPLTtio+K4u+loYxAnV8171qvBW1YcrYnyuFGXdf0WEn1jmDOAtx3U94jl8hl1hDX5GWPR0Sb3rQl8qAN2FpZki/hM0VFywy6slvos07fbUhUZHrp6jEF6Zew+eXWIeSfcoOmbfPiezeB8OMF9SaKOh3jPFA9CRUXMgOoJIFsBCUXjRNWZtcF6opKzkscIstELvJ0tEFOIzbl8QXWi1IQAJGmNkyCLvfqNP5drq2V8L5KdU3MTWHZbl+C3yMnqrju6jjuyOrtPTv1fSI0e4j6j7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU4tT9vyv5xp+qqVlJk7KCB1LU7Fcf96VOOsu++f4vk=;
 b=SIrDHzxVJcRi37SAqW0FqnIqg8F7pJpH/m5EW5FSPEvLtQqBff4gS4sGMSICtKiuUUQW/ZJ2EGEWAIHaUVs1NqUrr2iLyA4+Za6FoxG60aF3KJ/omn+/iD5jM4+Z8V+T7NTUSLUhbkSFuMUyFj1AfuI8W7ZUQ++CLrelvz8tevi3dBoSFAqbAOFRuHVSFPv6tYElxViQFTWcK//s3CHu0PtJn5/EnlCOTLGNH90TL0HguRP2AjJ3R1BEupooQXncS1u6GzzQLxStaXVp01xUL81mD9lhzDmu/IEI+9wf8GKYpT9AQEqRFhfvd6BiaDXFz5rpIoTE13mXe90l1rVptA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by GV2PR08MB8703.eurprd08.prod.outlook.com (2603:10a6:150:b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 11:34:44 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::c82b:333d:9400:dbc9]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::c82b:333d:9400:dbc9%4]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 11:34:44 +0000
Message-ID: <02a2279b-fcb2-c90d-7598-af029ea8261a@virtuozzo.com>
Date: Mon, 26 Sep 2022 13:34:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] qemu-nbd: set timeout to qemu-nbd socket
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 luzhipeng <luzhipeng@cestc.cn>, qemu-devel <qemu-devel@nongnu.org>
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20220925135308.481-1-luzhipeng@cestc.cn>
 <2718426c-dd89-5b50-29c4-63f0d6c9b25f@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <2718426c-dd89-5b50-29c4-63f0d6c9b25f@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0007.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::19) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|GV2PR08MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2c500d-ec9b-47c4-c0ab-08da9fb31b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XxS2pUaXWeQ+kfAgNyCm4soE6Pwujsu8XrhkGodfcl4dMPifFPZT6j92+spNVAG7CSQUReK0sfv5O4F4ZJbO2XGQTM+NabHU3F3WnuvuhxFmLDh3r35gd0TWMPRbbR9VMiDVSg7K9gHf5hmLwD34gLjRUItoiYmr2+F3VY3E26GWapjNcDxJamm2Fw98NDdhHm0qMaLqjZFtwLdSUJf+ezdxK9TOab31pjS1u3Zxe9hymU9EiQJFPZu3yVVw23wqgDwRo4g2LODCI7ZfyZqRs1zxeFS1mIGRzXFr6PC1YJg7+pTW3+oPVtrxuK2aBPuca91l+WA6tMnLhPNtpFZphQ/H/vhFBtkBPdH3Lrz3aUE0aUcbXs2eeKV42C4dvwRpee6q0ZDc8CXDwxcu+p4s1iyHngP1CQqEPDqwBaM1hvg9r+v1zoiewxOywoxYX0Ed5eYa1CKnNHNSS7KHyJr1GGiABQZXLZ+0TyQIDMPSrkLEarD1RRIoovCRJbuw8QJJkr2xdh+/6RuwE7JVze750dOLfKNP9UkPN6sTRRWX7NvPrzMvl2pze0sHwvBMj4QZi2+KFhbRJWa28Xqj5eVXRvI0BBdf2i+3BKacFDhgPpRRA+9A1WDMyR9dE3NZBh08rw8KOD+arqoc0Rllbw5ZCo6XaCK1joFs1vZ6EaIUSgVeTfeQazmC3g1Mb0O8jyL9gM3dcu4Twjfz9R8l02da52IGMt5CRo9PcySpi1+CdEcCKuwwkV86M7ruYA8jE7AdP71UyS6u7cE3LZ+sIsYqidvEz4dDTAhO9ou6/7OMYKYAhpmQJX0k6Dchc6nkgTp0NoCw2SXhJvEy5XyALkS5Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199015)(2906002)(53546011)(52116002)(6506007)(41300700001)(66946007)(6512007)(478600001)(5660300002)(38350700002)(38100700002)(36756003)(8936002)(6486002)(26005)(66556008)(186003)(110136005)(31686004)(86362001)(316002)(4326008)(8676002)(66476007)(2616005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlhCaVRPYUEzdi96Wis1UDJZS2JXWTNaK2U5YlpaZnp4NncrcS9xeFJPcDR0?=
 =?utf-8?B?ZEpDdTZaSUpBWDRGZndNMEo0NlRYVWQvK0VDbVV4UmxNYnoyZTYzb3U1d0da?=
 =?utf-8?B?VE8yZWRDMjFzdnNrQkNSOFlGbmdaRDJtRWlPTitiWUMvSUhxZmtwekhBN0d2?=
 =?utf-8?B?aXdnL3ArSXpTTk9TNFVvckMwUVZLMW1tQ1M3WEVacDVxMHh3eTdiL3JhRzk3?=
 =?utf-8?B?QWY5eFp0VXpkei9TcFNlV2kxdjEwRm80V3VtRFVpbEIrVWpqSzZEZXJ1WVRk?=
 =?utf-8?B?NlNOZmpoMktVMzBZNUFRUlBvMUNDRXRLRzJnTXZDVytlaVlZRkpHd29DY1h4?=
 =?utf-8?B?QU5FdlE3QU8rYVZOTmRWTEgzYUNhZ0E5dDdQc1JPaVlFeDM2VTduZUdPLzBo?=
 =?utf-8?B?eWRqQVdJQStyWU9kY2tvOFJIeGo4OUI3TjkzcFIyQ0h5cFpvTVR1N1RPYXFq?=
 =?utf-8?B?aHhkeVpQU1kzRTI4UE5IR0pGeE9WZzJHWE1SMlZ0UXZxUVV4dExGMzVEcE95?=
 =?utf-8?B?ZjAydVlEcmVsQmMwK0EwYmdMV0lGK1lpc3FwaHpzc3dDZTVXblRrMW1DM2J6?=
 =?utf-8?B?cnc2ZGZ0YWloZ0Juc0NOV3VJTjQyUitlZkEzNTJEVk1ISzl5WjJHMUkvc2s3?=
 =?utf-8?B?Umlsc2NDY093dzlnK3hXSllFa3VBcjc0alFGTUw2RzJDNDFxVW5ZM3hqSkJY?=
 =?utf-8?B?UFRiNklUQndNYllqbnhDcXlMSjRWYlRmbDZTRUZ2cG5KQ0M1OFhVTTk1TzYw?=
 =?utf-8?B?WmFaWjdsK2RDOEJqY29hZHViN2gyTy9raGpKQnppM1MwMDRWTU5vVjJmcktR?=
 =?utf-8?B?YURSeWdiMlpvN0ZuRitqK28vd09IRU1vblQ2emlZRDhSZXRzcUoxQURSMVBU?=
 =?utf-8?B?SGZGZHFaVDJuSHorR0NYVnNnb2tzRmlZUzlrbDVGZ2Zzb2JsazQ4QjYwTG1x?=
 =?utf-8?B?VDV1WWIyNXFmM3NKWGpJNWp1ZWdFV2U2ZlM0R2ZjcmN2NHo4REF4S2I5dXdS?=
 =?utf-8?B?ZEFrY2tnV004YkVSUFlJYW80YTJiOUNiOXB6UVNlWmdldEFQc3liZEducW4z?=
 =?utf-8?B?MTFvbExERVo0WU05TTdzTGdXRndZdEcwU2xtaEpVaFdlNnFjRHpXcjBuVHV1?=
 =?utf-8?B?VHk3d0RwWnhKSEtQbllkeW5vUTIzVUFtaFpnR21IcjRSbUsvdHZ3NWVTMzE2?=
 =?utf-8?B?aFVGczdJN3h6TjI1T0ZTdXVHdGtYT2VzZXN5eXNTNTBvWmhKcll6dGhiYUIx?=
 =?utf-8?B?dzdCeTFzUXBuN2c4d1VVZ01YMHo1Q1BLR0hENE5lQzduVzFsSW9ibkFnVnRP?=
 =?utf-8?B?YVJLMmtlRTJJLzN2aVVUUkwrMFEzY1IxVjcrTkFWWVhnRHg4NGhsNFcwbi85?=
 =?utf-8?B?K1ZIS1EzQ3V4My9wNitNb1NqbHoyRUMxdFNTdVJWQWs1UVNUL0Y5Q1VHY3dq?=
 =?utf-8?B?QWRSL2xoY0E5dTd2U3JFWkV0c2NJUjdTN2VWYTN3Wmk3RXFhRkIwR2Vjemxk?=
 =?utf-8?B?RFdhQ29xSldEQkRLREdjUUFJbzZJYWdOSVBLRTM1MkRxUm0vUTlrTjVuUTU1?=
 =?utf-8?B?bjhjTEprTXZlaFhEZDU0dXhQSVhiUEd3MTdRcFcwTVdyTTVwU09SbXh1cEZL?=
 =?utf-8?B?enlUNzVoRVNkcjFPQVRVa1YwdWFHbTcreHpXMmxhQmJleHgrWlJJNjhQTklT?=
 =?utf-8?B?V2lyQ21YVnhPOWNFVDdJbmRlcUJvbnVOR0JQTGFVdFRSUlNzUlJzUUU1L3hK?=
 =?utf-8?B?R1dNeFdIcUQ0bjAvcFlMMm5LM2U0UGxOcXBvV3BJbVpScHgreGZScjdCM0JZ?=
 =?utf-8?B?ZzJiZFdlYmxWOUFRbjExdWZ3K2tGTG1uaEVHakI4SlV1dW5ITTlYZlVlV3lO?=
 =?utf-8?B?cHljanZOUjl0V0NOMTNMamdXRzI0RWptaG0yNGlRYXV3VkRCZzJCd255QTNX?=
 =?utf-8?B?djFjNGI4WjVOa2RYdXM5eEx2N0pYUUhjb3hqUkJFQmJEVUdwSk1CMjhmTXdC?=
 =?utf-8?B?ZnpSYTlETzhBTDRxR3RINTZmSElrL0VHYjFFbjJJUjZLTzdIbXJ1QVo1dnlN?=
 =?utf-8?B?RFFkOWdZbk4vOVlzeHJ4dWxMY2FCT2Y1TDI5djNUNFpUTE5NcUVYTVBCSmtL?=
 =?utf-8?Q?9t5/jxUxAxAG3sgFekTMbyT97?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2c500d-ec9b-47c4-c0ab-08da9fb31b8c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:34:44.4942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu3c4xM/rOETdzmCMaeNLvahx9GjGsz0mvrEH0L4RfoAH6ywFpx9Y9Pd958mL7txNQbjy5TQJ37J1kOJcS2ruw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8703
Received-SPF: pass client-ip=40.107.5.138; envelope-from=den@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 9/26/22 12:05, Vladimir Sementsov-Ogievskiy wrote:
> [+ Den]
>
> On 9/25/22 16:53, luzhipeng wrote:
>> From: lu zhipeng <luzhipeng@cestc.cn>
>>
>> Prevent the NBD socket stuck all the time, So
>> set timeout.
>>
>> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
>> ---
>>   nbd/client.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/nbd/client.c b/nbd/client.c
>> index 30d5383cb1..89dde53a0f 100644
>> --- a/nbd/client.c
>> +++ b/nbd/client.c
>> @@ -24,6 +24,8 @@
>>   #include "nbd-internal.h"
>>   #include "qemu/cutils.h"
>>   +#define NBD_DEFAULT_TIMEOUT 30
>> +
>>   /* Definitions for opaque data types */
>>     static QTAILQ_HEAD(, NBDExport) exports = 
>> QTAILQ_HEAD_INITIALIZER(exports);
>> @@ -1301,6 +1303,12 @@ int nbd_init(int fd, QIOChannelSocket *sioc, 
>> NBDExportInfo *info,
>>           }
>>       }
>>   +    if (ioctl(fd, NBD_SET_TIMEOUT, NBD_DEFAULT_TIMEOUT) < 0) {
>> +        int serrno = errno;
>> +        error_setg(errp, "Failed setting timeout");
>> +        return -serrno;
>> +    }
>> +
>>       trace_nbd_init_finish();
>>         return 0;
>
>
> Personally, I don't see a problem in enabling timeout by default.. But 
> probably we need a new option instead?
>
>
I believe that this should be the same story as we have had with
KEEPALIVE. This should be set as an option and downstream
will change its default when necessary.

Den

