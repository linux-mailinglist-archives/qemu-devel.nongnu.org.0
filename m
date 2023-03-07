Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B856ADD71
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:32:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVYJ-0005X4-To; Tue, 07 Mar 2023 06:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pZVYI-0005Wv-KL
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:32:18 -0500
Received: from mail-mw2nam10on2060.outbound.protection.outlook.com
 ([40.107.94.60] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pZVYG-0006Ky-OP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:32:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuDAJfIbWnnh+y9ZPFKUCo1eoZlrWv6AsUUg+SfOdcGtff+FJofXQKfP8KNYyFJnso5ylLH7S99NI4wZ3uZfIWDB9hPGcdcJnPRwbXGArpjXD4z6jJM6hePrJvvAEdISs7zA9ZArx7oOl5DGATJZnpyiyxScrJeQqz455AohFOp/wkicfuTX6n2XhaV2tYRrCU7edukXY6WAUDlso679YATRf86SQ4AdMdK+HBfD/RNqP5vjr5pTUI9gSZPn9aZOdlKmqtHdxoyMqkZxKbCyJ4LSeUTghXUe7DgpCAFMKp+vBeAHcDgmHsQ3FHiGJ1XnnG1yWFtj6k+mvY5Ya0J4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxLaWS7clImjebujP29chfNWfk+Hbe2hnj+f/38nq9s=;
 b=oTD3xIp7Oish+n5TwnmhH0I+IfF3XdJTieEMGxSdwDze+WHWCpR5287vjWGBOpzE3neeiCWszhJPI26honpo8Glvy1EB/g+RV14U0U689zGqadNbp35rQs+vH1/hhNgfRl0wk7y7B5h+AQB0taYFVsgO34VhCaiz9yBttkJVMHe63VJd3/gooFZrZFMatQyMs7jDwrXLO20wDX65uZxe5HqhiJmRIyLE6Ah2gO3zujV+R0X99ppXSyg4s9ZKD6SWDypLvLteYAYaSXKAbVfe7e1DLDLZssBhLJDZP+CEeJ8rmVEikvYhdJPMQlz8JEh4FnpJNVAWy8pdFQ8AyC2c6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxLaWS7clImjebujP29chfNWfk+Hbe2hnj+f/38nq9s=;
 b=mlK2SI2aU0VMbR/VkrEClXozTT1Ja0E7qGULHxsAEdpgisJCo/UShql/X4l3QR7d64GUW89sZV3JAkXsNhJQpFu70KT2nHsCDg0SwHKHqWl+Ou1YlYmwjbmtMNDpc1Fj/yxqS/ZUWMVEM6ovYoVY4DvlyxNUfg3hxy1mQAkLzBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by MN0PR11MB6058.namprd11.prod.outlook.com (2603:10b6:208:376::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 11:27:10 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::7c51:672e:ffe:7b74]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::7c51:672e:ffe:7b74%3]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 11:27:10 +0000
Message-ID: <5af1e768-820a-68d4-5d98-e4b6fbcc7d90@silabs.com>
Date: Tue, 7 Mar 2023 12:27:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] linux-user: fix sockaddr_in6 endianness
To: Laurent Vivier <laurent@vivier.eu>,
 Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-3-Mathis.Marion@silabs.com>
 <008ca1be-e4ca-1588-fe85-6be807b48b0b@vivier.eu>
From: Mathis MARION <mamarion1@silabs.com>
In-Reply-To: <008ca1be-e4ca-1588-fe85-6be807b48b0b@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0232.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:238::8) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|MN0PR11MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff14257-5763-468e-9a66-08db1efee452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8d6aYZpolrJIWMDl8odxQgM+RbdL8lBdLdDudRdnWantG2bk13H5EcF8nKcbrxtvwi1oONmk3S78rVwf3NyIMjy850v4oWC2guqiclAAbRXTqIT9a6SqnSmaM0yIpehNdlGRiq5HP5Xh9B8nC4KumPfRxww+/xjLThdf/NgGrt97r3X0csrurW+9kq0CK8V/sj4PNx7yBr1TfIsVVXrc9TqFKi3zuLUQ7TfbfQdSUoInHYJJt6YlD8RFmTH19GKpndL29goYJPVeXAmWfpythnEXKz+jxpVRT+VUFzQAr/BPgv/Zx2VAE+rxl4cIKdqEX4piRDAuT3fuwGRQeU4VSI6NiTy4vMEsZ0QSQ8ywM4gQe76danHnBYhAiSwyr/7Tsgf4SOtnqfwdiLYnbIgpXppc0Wgy+T5E5oZr2NicDc9jmN/xmk3gwrgIve0TWvgLhXvmzqoTUg4v0TA2eMqpYHLjhCm1LpfrvjWn4aPfEl/0OvfpP16RLhC5QfU8xAXLxiRF5rcuAd/tnjiU60YsmKuCMeoHqtqm5gX/fpIzIwXiY5pQXa+emI3SVeSjIYInut0gp82zcDQ5ej16M02rlkkVTxdbFkRK8MN0L6EujvHbaAIyyzfUWy6ZFY42eOpUJg0fxtLLa8VgNKSLymigm+YuFS3Qa+aPzJUzNKIaCsRPmK7vrozWpJ5D7kWhl9ki95ke6XEhswJzi6cMsYU9sdb5Fww988r9eDgD58YXFns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199018)(26005)(186003)(66476007)(66556008)(8676002)(5660300002)(66946007)(4326008)(6486002)(478600001)(31696002)(316002)(110136005)(6512007)(6506007)(53546011)(8936002)(36756003)(41300700001)(38100700002)(6666004)(107886003)(2906002)(2616005)(31686004)(83380400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE9ESHZIMWdmOHdFTXNiZmVlbGZKa0JnQStHWjlpSzdoYVBoVWk4RG1YclFP?=
 =?utf-8?B?OFQ4VDZqdEtScm5jM2w5YVhuRU9sekJReE9DKyt0ZllCTHZIblk0MGRHcGx5?=
 =?utf-8?B?c0x6VlBWdUxSc1I4eGJUYjArb2ZYOXVFSEhCTWhVRXI1NHNxcWt3UkVuUTRo?=
 =?utf-8?B?SjVBQytPaGowOXdqYUJ6WjBwUGlQODZ0WElKemxXcDRoRk5uQnJsbUxHOWtT?=
 =?utf-8?B?UXBqWlBoSTlKUHc1c01jRG5wQ1FDWElWMmVUVEhEOFZ2SWptWVdsWGk0QXoz?=
 =?utf-8?B?Rm5xY0pBYXMyUVVLZ3lMbDI5aSt0Znp4MTNvTE5XUmhvRUVsSGFRVm4xTHc4?=
 =?utf-8?B?MDluVGd4YlJOcENmREgxanJPTzU3SmkvRzhEbVF0U1krbS9xek43cmV6Nk9K?=
 =?utf-8?B?RjlvRnZuRGZULytDRjRJS21CcS9uczB4QllrZHFseFduK0xiMTVKbEl2Vlc4?=
 =?utf-8?B?UjVweEd3dWNPdm81enZndnRPK1ZncEtTS01meUxhMEk2U2R2Rk9JZFZISFhx?=
 =?utf-8?B?UlBYaUZ0UytPaDkxVWRBajVYN0VEVHd2b2JabHJPeHpqVUhnbmxhdjNsUGRZ?=
 =?utf-8?B?K09GMG4xTml4SmIwSzk2a04wK3BOZEVxR1Y1YWhMS1YwdFJ1ZENlcW5IT01i?=
 =?utf-8?B?bmgvbElSU294aWw0MFlCMHdXcTA3NVBRNlNIZWQ2Z25xaEhHOEVPdkpnbXcw?=
 =?utf-8?B?RGJpQ2dlQUo1MG80aU1BVEFCRnRZdGxLR1QxejhCMVJqSjBHM0ZvbUYrbFhE?=
 =?utf-8?B?aFN0bUhwaGI5eEhPVE5lWCtFeUhrYXNnaHBwa0pKK3dmQVRaNmQ0N0pLaGw0?=
 =?utf-8?B?VHNOV2tlQ3RRNE5QdzJRMGU4bjN0TlJLTXFUdUxRRFB1bmNNSWU1M2VWVG9V?=
 =?utf-8?B?eWVsd0hiWnBWRDNIUStmQXI1Y1ZhUENVTENTdjRTbndxdTlhREJkWWdVWm5m?=
 =?utf-8?B?QnlEbzB5UFR1cmxIVjdBdmo2NHE2Zzk5cG9JOThmY3Q3dHBqV2l5QSt5Qk5L?=
 =?utf-8?B?N0YwTEhjblR6aUl3dFF1L0k5dWRUYk5ycDhGSEx1ci9iTlN0WGgvS1dPV0R4?=
 =?utf-8?B?RllxVUFoelE0alFTVEliQVpZWGdJbFlPeWdCSUVpQ0tjS1p3Nnl2eFM1djQ1?=
 =?utf-8?B?NWlEeWRTR2lhKzcrZEk1em8vUGV6VHhEb3VvRUMxVEorL1UrRC94QmxaK0Fh?=
 =?utf-8?B?VnBIVEdDdlQvbStyV0RWd2VsNUlUYzlidVZpNm9BRHQxYjh4alMyd3Q2T1Jp?=
 =?utf-8?B?LzI5NHZvd09FaEFKREh5bXk5eUlITGxnd0EyTmNzNHlPeGYrMnZPK2hLOWx4?=
 =?utf-8?B?Rzlmd09HUGpzODdCck5uQ3NJcFdkS1I1MG1lVXpLeFhDbjE3cGphZHBIV0FZ?=
 =?utf-8?B?V2t1SVZPbzNCN1dHNVlxL1Z2dFJSUmgyaitPOVl0Z091YVMrR3dNYmd4NW92?=
 =?utf-8?B?TWdod2hzWGE4dzBPbmloNVZ5RjUzdUdjNUZIdUx2dFY0UmZzelgxWFBGY3o0?=
 =?utf-8?B?RStCUWtTaVN3R21CeUxubXpMbzdOS3Jiakl4NDVFTTZnVjlteHMxU20ra1hD?=
 =?utf-8?B?VkI2YkI4ZTFLaVBLSFR2Wk5GMWRnYWZldndYZTNDbkFqb0dseTdGbnc5cjVz?=
 =?utf-8?B?ZHRSeFhUUUNvMTdOaC9vd3VPUm03aTlSVTFqOEg0UnRPL0EwK2F4YXZ6YXJR?=
 =?utf-8?B?WFc5VGp6SERoU01xRHV5TVNjdisxY0F1MjhYWEZKTlVId0c3Q1BvZ3V6aVdX?=
 =?utf-8?B?OUw1WVZsd09lcDI5S3hUclY0a2hySGdMQ21sSk5vN3NOVnV0Y2hiMFltL0Mv?=
 =?utf-8?B?VFJ3T0pYQVd6aUJrQk9mNVovSWhHL2lUQnNNU0RrSmxsSWhsbmdCdXF1TG94?=
 =?utf-8?B?RE9KSWo2emR0ZTF5eTlLSnRoVy9wQ0RUMjZlaERUNmUwNHZZV2ExKzZEYVgw?=
 =?utf-8?B?akMvbDBURGZwOTYzN1FnZlhVa3R0b3BuaFE3dEQxR2JGRWMvVXBCYmplNGRw?=
 =?utf-8?B?Y1FxYWRlbGhZeXdDZHpJRlJuVWdwTVVSSnJmempUSUpXS2tjTG96Y0JnQkdm?=
 =?utf-8?B?cWVyTEtTWmZEVXBWQUpHOWFHa0FhY0IxRFNMUXVpa2NwUUZteDAxSEhCc29F?=
 =?utf-8?B?dzhEd09HSFBQRGZXU3I1OFMyOXdSUzFyc0NzRGkrSHZSZmZDSGhJeWFmNWxF?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff14257-5763-468e-9a66-08db1efee452
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 11:27:10.6545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0XJTzw7tbR9RKjbzLueGtLQ6HUbrnK5oggEcwH2ER6s8TcNccJI4T32NADra0vGqeEjiTdmDjbHfx9vFpBZXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6058
Received-SPF: pass client-ip=40.107.94.60;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 06/03/2023 22:52, Laurent Vivier wrote:
> CAUTION: This email originated from outside of the organization. Do not 
> click links or open attachments unless you recognize the sender and know 
> the content is safe.
> 
> 
> Le 20/02/2023 à 09:58, Mathis Marion a écrit :
>> From: Mathis Marion <mathis.marion@silabs.com>
>>
>> Fields sin6_flowinfo and sin6_scope_id use the host byte order, so there
>> is a conversion to be made when host and target endianness differ.
>>
>> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
>> ---
>>   linux-user/syscall.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 58549de125..1a6856abec 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -1713,6 +1713,12 @@ static inline abi_long 
>> target_to_host_sockaddr(int fd, struct sockaddr *addr,
>>       lladdr = (struct target_sockaddr_ll *)addr;
>>       lladdr->sll_ifindex = tswap32(lladdr->sll_ifindex);
>>       lladdr->sll_hatype = tswap16(lladdr->sll_hatype);
>> +    } else if (sa_family == AF_INET6) {
>> +        struct sockaddr_in6 *in6addr;
>> +
>> +        in6addr = (struct sockaddr_in6 *)addr;
>> +        in6addr->sin6_flowinfo = tswap32(in6addr->sin6_flowinfo);
> 
> In /usr/include/linux/in6.h, it's defined as a __be32, so I don't think 
> we need to change its
> endianness.
> 

Right.
Thank you for integrating the other patches! Before I send a v3, do you
have any comments on patch 4?

>> +        in6addr->sin6_scope_id = tswap32(in6addr->sin6_scope_id);
>>       }
>>       unlock_user(target_saddr, target_addr, 0);
>>
> 

