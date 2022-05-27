Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6DF53622E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 14:15:52 +0200 (CEST)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuYsh-0004Ml-D2
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 08:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nuYqW-0002gJ-A4; Fri, 27 May 2022 08:13:36 -0400
Received: from mail-he1eur02on072e.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::72e]:6183
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nuYqU-0000ux-BA; Fri, 27 May 2022 08:13:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c905bxzczAjjCmjpk4/9l4AiPH4Mi0rbj6EquVBEZcvD5+VuseMes0Yh19U5fPBG03GfYDaikzAHwb3y7+SNBXmpdjmIdr/oOQ0GC8VNlIFJLy9OkiRZFzV9LAp0UiaHGebN8Y5323Q113N9dxy0e8qpdm3exUlscU2ZLuoYpgdj5yBCwP8xuGJfcwhIef3H07PhdSosfeNNkmCSxNKzNj03UaGBYfXkVSQdNePfmTVZpgQWgS9Igm2S73GG1pFR8vKv+RubRRNP5k5GPS2O0oftphfmJ+ZQS4hCMv+DrVngBRkkd2xeaaR6iUJ/poe/cQzZQa7m7RXL7xSJhc4uFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1setRw1dl4qExDqY1L553s6TvKJP7Zlc42+u7Fxfha0=;
 b=HLC0cTgOFpnQO7J0qlMph4rpmfl0fJtu3JOOKbAYnQSD+pO0yUSOklptCAoqnl6Zv469jU4Y0ucW0TAlP9gDf7KxAwdlHfEpsIkMNRPtu7vGlr2Q6YXbia0q3fo8svYAwQliTsTcpvc1hLBTbdxIgFVolXtbErswM6ZA8bvhHCJT5nF97n6R9CHNmmZBc3LlmrfP0pz2GtFKQVhxgx2Dlr0Da2K0TaAqaJoaSzVSUiFtE+8gA8SIAHjqkVPHvGDWcbf6mHn7/sbwUWiV/rniAmZ/PFcAAtrquulRl9A/FXMf5wIRrNm1LdP/zXKgcIjDnqYZ1y/hz0dKhr+IBRo4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1setRw1dl4qExDqY1L553s6TvKJP7Zlc42+u7Fxfha0=;
 b=JDNSaxovT3hWyQ6/JT+/ooGFw77sYdZsbStASxprXNlgEaB0t2F03tMP96gx/q8cs7vSJQMyTTik9y9frtjLDvLMaop88v9DdxUYo3BEez7G8ptUBO+puXwaKwMbmo6RK4Oc5uQll81QCtgtThvY3hVkEjnE007Q62OVDD/YW9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM6PR08MB3781.eurprd08.prod.outlook.com (2603:10a6:20b:8b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 12:13:30 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1%6]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 12:13:30 +0000
Message-ID: <df7de396-6310-6405-c182-798aac9b32fc@virtuozzo.com>
Date: Fri, 27 May 2022 14:13:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] nbd: trace long NBD operations
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220527084348.68911-1-den@openvz.org>
 <f667a93e-6269-ed89-096f-0d0934df4c3c@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <f667a93e-6269-ed89-096f-0d0934df4c3c@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::47) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 206416e4-78ff-47f8-6bff-08da3fda500e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3781:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB37816E20F75907A6DCADD57FB6D89@AM6PR08MB3781.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Ru9HQMvndjVUZn00N18b8OTNv2BZ8sikQXMCF1bLxrrYYVA11NW1FLE1w6fnLj4Uc2HFAU9WAFt8LBWEcSwer8UUlgBmrv7BcsMiwvm3zutX7nmFKygf1rpw30YGGNW/xbM4X0cF33q8RuITLcjjrI4txuSvXcPOlTsY0L+X372GAcS/FJWJ0DLnTJGxEwWncoaGlhH6ypPi7hnyBij/oieBXQWTp6JGp/rHoCfIIdMBmn+OtaYP++nxkVo6bTxeMqFMY71bGf1R4ESW/TkKsJCN3bZsB0MbSN1UfIfd4q5GVcKHRHc8yhLY/Ghwu+t4zT5y4O7ml+cqlOPC0LRLtwyvcGrvK6wuJtMCYvL6I/sDvpfJ9Y4DHexX01Mq3ZmJmCfl++lz2Lih04eXN6XPbFQ940qC+MY8PA7gEIoo9J0AWwx0ELrzFQh3GnNBZHn48AXxMTMBUw2ZdlADoJLQfAgiOQhWOyuZHLL16wT6OuWAisiDnK4StkUQUVUPtlvuFN+PREW3da/2UndEgN4aaLEfBqYRMJwWRWA1BFxm7vWHDWif0QePRjsSsxNvEsaZASpXIqNmXWY3WwxRiw9uOy6brWSWzUbcR8KQ9HgN/pE9unh+N8Nvq1sUENwAUX5kiqoHNPNKSpZNQTPi6nbznsuE1KGaMb+wuVSO16bk8SiJDOZEZIKKYh2LLL6bDZYDkJjSxEd0NDbzfVg7/cITQJxtTyjBFQDA9moxkOOYXnaICgo/+M5EOAUtO646Hl9Ysnpdhpmjv2LwGuFCHTFWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(86362001)(5660300002)(186003)(6506007)(52116002)(26005)(2906002)(6486002)(2616005)(53546011)(8936002)(508600001)(83380400001)(38350700002)(38100700002)(36756003)(316002)(54906003)(8676002)(66556008)(66476007)(4326008)(66946007)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmo1K252NDBlbTZjemtDaHQ1ZGJGM054a21XNHN1MGhMOW9pZWVXSk1MS1RG?=
 =?utf-8?B?Y0ppY09mcWI0T3pKUXE3SVE2amZqMVkralMrbVc1eUhsUm4wSSszR3N3Nmhw?=
 =?utf-8?B?VG9XWnE5N2JTb08xSlhFS2xpWnJXazkrQVlyVHRpY2FsNExyQkZCU1BqU2Ja?=
 =?utf-8?B?UHJlS3dnZ2Q0cW5SR29STFRkbVd3dTR2OVNvV1o0dVFYVkR2U0lBV0JnUHNq?=
 =?utf-8?B?MDhiQjUvSUpnOGQ1bENwZEFNRlBqZUc0Z3JVRGNaWGY0TSswKzd6azhNZ3dU?=
 =?utf-8?B?Yk5QREw1ZFMxOGdmOHJ5ZnpYYXl1Nm9TdzF1b1owaC9BSkg4YUhjU3BrWktn?=
 =?utf-8?B?S3VCeWxsWHV4TnNtQ04reWhKVU03Q1hKa2U1UFRCeXN6cC9oUEc4V1Jhb1V6?=
 =?utf-8?B?SXowLzhxYUlFT2VQUW9KUHM5TjB1NjBOYWl1cXo0Y2dNSnpwNFNBWHdXSFJT?=
 =?utf-8?B?OUpRSFl1SWY0aXlkcjk2VlJWZmJIV2wxRHJtdTYrNko2clJjZFRrbDMrL1Vr?=
 =?utf-8?B?TDFOeHdhMVpqVEV2bnNhMmRYN2sxMVgxVXpqb1JVbFhBVEVsMDFtbGhFVzBO?=
 =?utf-8?B?c1pITDkzd0tKK0RtNUZLTXVsUlNQVVQzUTdnTGF4RVVqVnUxbDIxMCt2TzdD?=
 =?utf-8?B?bFlGVVlYSGZIMmRablY4NS9hZHY5ZDlhY2YzT0xreUxlWlFPVDJsS3NOa29Q?=
 =?utf-8?B?UEpHU0k2TTRjTmVPZjduZ3VZdmlvWTNOTTlNUXZGc0s2Uko0dkFFRlplaGk0?=
 =?utf-8?B?Vlhkd2YrSnBhc0JOU1lOWTVMQXZEeG5Jb0RTSkowZlFlZHVtTmZUODB1WEpF?=
 =?utf-8?B?cHc1SEtsMGdCd2VYeWF0eDFTYWVNYXFNQUx4VHBFSFlYdHp1SHc3cXloNkVq?=
 =?utf-8?B?dVpxMnJqaDNTNFpBQUZ0QW1mUVpyM3RWNUNNOE40aXpHMUJ2bllwNThpS2cy?=
 =?utf-8?B?dmJPRkluckJkcG55by9DNkpabDU5Q2NBc1d5bFF2NFpRS1ZZZTZqSnphRmdx?=
 =?utf-8?B?U2tPZkNtb2xRenZ2Q0ltZXpTTTlQN1NSUkRkU3VUUE1RcFdrakdkNHVuaDAw?=
 =?utf-8?B?bUZNWmdzMDkvK3IzZTNSM3ZsNDgwQXlraDI4N2ZkbVlPRnh1QU4xVEtDTElU?=
 =?utf-8?B?TTcyTkpJRWhEVkN3T3FmQ1d6M2swQU5IUnI2TDIwMVNMNldZenR3UHZDYUlC?=
 =?utf-8?B?bHAyaFNxKzZEKzk3NnF3dk83UDBNZXJ2RTBLU1FlanVVQmtFVStSNVlveGU0?=
 =?utf-8?B?MG53Tk1XSzJYeUJaVkc4ZHRTQ09DeG5KK1hkYXBDNkdwS0RRSW9RVEJ2Rk5L?=
 =?utf-8?B?b3VCMGlWeGNxbE9QSElScEZ1c3QyeEltV1V3N2tvWU5xMWFYWXAvOHF5aDhU?=
 =?utf-8?B?VSt5R0dBajNSVWxQaVYrVk53Zm9RT2g4eUdwV2NDUW1vRlRFalQ3RHQ2VDc1?=
 =?utf-8?B?RzBOL1RWTlpDNmJxNlVLdldIcTBQMGdDY2wrMlQvSnRhcE5hSzFNWWFCUzdZ?=
 =?utf-8?B?b3hVd25NTEZncVMwejR0Tk9kZDM2UkVKL2ZXdElNM1RvMXhaZUwzdlVSa0d6?=
 =?utf-8?B?WVpJU0VXYThVUmY4K1ZscDVEQnFSMkV3RjhRbit4RWlYWTlJbm5FV21JM3FP?=
 =?utf-8?B?Qm9TUEI4TUZEM0h0aStFMHNVSlp1SjB2ZVNUN1lxREhha1U4Yk5CYTFERlN1?=
 =?utf-8?B?VVUrbFIwcHFvOW9JR081dU9EVmx5SE1rakQ1SVl5Q1hvMGhTcTBkcVNseDdq?=
 =?utf-8?B?enowSkM2M1RZWE9tcFhCc3B3M0dXWitwcXdCWHN0b3NJa1NCRU1Jc0h2SFNP?=
 =?utf-8?B?VXAybUZRRTFWTGllUVdlcnhzUzE2Sm80TWNaeHk2UzJ1R04vSzgyV3RiMnZi?=
 =?utf-8?B?RVpLc1lvMXJIeEtkcVlPdG5tVDhMSHpxemg4N2NFb1ljUmRzTmxNNFRCb2s1?=
 =?utf-8?B?dXNzOXFyMk95ZldjTHJONUU3QjIrWExuNWVkZHhrSVh1UXdLRkExOC8zUUZ1?=
 =?utf-8?B?eEdYRmkvSFkxb1ZPV293Zy9WcjBxRVFKdGJEMDZFVTdxMUo4Nk5RaXBuV0VT?=
 =?utf-8?B?N0wxNEEzSHNKaVNEY2k5THRDZG1ZMHpHM0J3R0NkZmlDWXZYd1ViQ3hndDNT?=
 =?utf-8?B?aEhzRnh4RlQ3dEhFVkp6TXBBbk91L2IxckpyRWlmOGw1ZUV1UGtPRzhpU0Vi?=
 =?utf-8?B?cUVURzJ4ZWdzQWZqY2d1SUljSnZQTm9hWFoyck9wSXc4TS9zMUp0cjVFMkZZ?=
 =?utf-8?B?NVBtbzdKUHZVVHl1WUZqVzRZTkJXOHZwOGt6Rk9FQ3gveGorRC9sS2hQcHRN?=
 =?utf-8?B?TlhENXU1L2JaWlZoalkvZHB3clhvQVhMTUIzS0h0Z3NyOG8rZ1NuUT09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206416e4-78ff-47f8-6bff-08da3fda500e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 12:13:30.5982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYNPduHwaRgSPNi0Jq2bXaBvPD7JeFOC2Qq8whELsXfj6qyE0NASFzaVfI+r59vhVjy/K2srjiYueoDQ3ihE4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3781
Received-SPF: pass client-ip=2a01:111:f400:fe05::72e;
 envelope-from=den@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 27.05.2022 11:36, Vladimir Sementsov-Ogievskiy wrote:
> On 5/27/22 11:43, Denis V. Lunev wrote:
>> +++ b/nbd/client-connection.c
>> @@ -23,6 +23,7 @@
>>    */
>>     #include "qemu/osdep.h"
>> +#include "trace.h"
>>     #include "block/nbd.h"
>>   @@ -210,6 +211,7 @@ static void *connect_thread_func(void *opaque)
>>               object_unref(OBJECT(conn->sioc));
>>               conn->sioc = NULL;
>>               if (conn->do_retry && !conn->detached) {
>> +                trace_nbd_connect_iteration(timeout);
>>                   qemu_mutex_unlock(&conn->mutex);
>>                     sleep(timeout);
>> diff --git a/nbd/trace-events b/nbd/trace-events
>> index c4919a2dd5..bdadfdc82d 100644
>> --- a/nbd/trace-events
>> +++ b/nbd/trace-events
>> @@ -73,3 +73,6 @@ nbd_co_receive_request_decode_type(uint64_t handle, 
>> uint16_t type, const char *n
>>   nbd_co_receive_request_payload_received(uint64_t handle, uint32_t 
>> len) "Payload received: handle = %" PRIu64 ", len = %" PRIu32
>>   nbd_co_receive_align_compliance(const char *op, uint64_t from, 
>> uint32_t len, uint32_t align) "client sent non-compliant unaligned %s 
>> request: from=0x%" PRIx64 ", len=0x%" PRIx32 ", align=0x%" PRIx32
>>   nbd_trip(void) "Reading request"
>> +
>> +# client-connection.c
>> +nbd_connect_iteration(int in_flight) "timeout %d"
>
> timeout is uint64_t, so, it should be "uint64_t timeout" here and %" 
> PRIu64
>
Thanks! will change

