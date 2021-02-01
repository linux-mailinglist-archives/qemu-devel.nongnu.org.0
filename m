Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2030A362
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:36:17 +0100 (CET)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Ugy-0004K9-Vn
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6Ufe-00038d-O8; Mon, 01 Feb 2021 03:34:55 -0500
Received: from mail-am6eur05on2090.outbound.protection.outlook.com
 ([40.107.22.90]:60257 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6UfZ-0005Ei-T6; Mon, 01 Feb 2021 03:34:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGhFIUj1EJchfEvn8rmJ7hWA2oOm7oa+b3uAGtVLtRBQp1Escq9q4z6gOcPX5dmtSLl55kZkzQCWrstWk4PqeuDFjZcG8n4BSJWR3Wt7aLXJm+rFocblGWGAe+3ksvo1bvMtTRb60A0ea/rZIXbqCXhZcScnSkzz3Rc876FlAsWy2nu2OLEE2t3nHjDVkEyl08oztNzvfMLmC+71Vjnm8LAd+pkwLdxecGx9snh5SOoRGJJI3a5ngbFXHKz5JAk595uSa4FMUYmH0cnAYR3JvzKo3qeoZcCRNEzrZ2UdD/Z8eMxVbb09ocBjAEjhboVm0MtFYWKeq4zYEKCkNAnJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvnqJr5jzGR4XCAS7Er6BkcV/gcrjiFnSCgmhR2OTxc=;
 b=ffPttkqrg++zqP8j/oLD5JlltHaG8k0e+jd/U8GV26RKWyrsWJjfXC217fw/W0RYVcM5diupuZdivivrcmbXZPxMe5lXpv2orLsdRw7P3E2p+kFDXucwQY6j/mHBd6V15MFGL1Uj9Y87Snm3jT8Zj8U4NCGIcPnn8599WsyMNflligsHAF7Ce7zqe8kYxmzoGi+ZjpmAMGJq3wMdiEh8aiSY0r6435tvUtYW4Go4mGKWfn4wmuX2oSA5rgFrWQCPKiAR/l+Z1W5uyg+3T7at8UemNSGjo1KRW6U6AfucQ1Zcp/h9lmK9kj6OaYFn+EfrQIt2gJ9YEP2AxqDKT7U7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvnqJr5jzGR4XCAS7Er6BkcV/gcrjiFnSCgmhR2OTxc=;
 b=Cz95AfJdBivtqSmBROg5qjptVjPF7hjzCAMuFdN8dtYe2Pc4vZ0OcEaZXrzAnSVANRiAfnPmXzGua7iaUxY1W/otKCp6at0tEYcflCsPUH0GnZyuqUa+OqjeZLR2MFUVcICfzt9necZTuIU0Nvpkmv8EhvGPF9qa0pB6vaUtck4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1778.eurprd08.prod.outlook.com (2603:10a6:203:3b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Mon, 1 Feb
 2021 08:34:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 08:34:46 +0000
Subject: Re: [PATCH 1/7] qemu/queue: add some useful QLIST_ and QTAILQ_ macros
To: Markus Armbruster <armbru@redhat.com>
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210129165030.640169-2-vsementsov@virtuozzo.com>
 <87v9bcfaxd.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5e16e3da-d3d9-6868-ffa4-92b83f328400@virtuozzo.com>
Date: Mon, 1 Feb 2021 11:34:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <87v9bcfaxd.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM3PR05CA0113.eurprd05.prod.outlook.com
 (2603:10a6:207:2::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM3PR05CA0113.eurprd05.prod.outlook.com (2603:10a6:207:2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 08:34:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8c03080-e600-4bc2-ca49-08d8c68c3b14
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1778:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB177841702BE53A3BFEFAC3BBC1B69@AM5PR0801MB1778.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nFB4h/ss9OZN9Y1J5p2YVJYIHjR3TDK8uY3vpTkGB/jH5WyIC4dKdfjvXBmKg/TanCTpB9Wng6bYV5FAZPoau7GElbqP2VOV8nDBV9kUjYMAO9eAZknVzIYRnuKI4rD04YHWv5gh3AyxlYijHwwOo8XzLQ5ZpkSqbi51AGvdFfgNxtsD1SVjkxS0UuZ8U/XsZs2eccLM6PTlTbZ5D05lPDzygktgMwv6BvvZNpvvJcPJT4kRUyaK8/7GVczbwClTbOdjgKl0MhStexDUCB+eAzUcMkgo4RskZq7pRiEQN7RndiQXYS09qVSueB1IfNdadPqM2X4ZhEKgus/x6DaPqpKr3TDQYnH846DmePJG6Fdz9Cu3YdXOIiMRZLsHqkRX/Blt04GygGXxYZQ00ZESnnH7ScMgM7oFKZEqfGGawSFs0M/4z4xwI0672TLtJT71YLwrRulKCbhqh9wAZ6L2smNKVMeBvXIkwDBoExa/UTc05ijqWt+nrxEi52etxuVCQhLAQfhbWoQxbW3t24gRb7lKlmr7VnTKrv6reWSARMPn92BEUDBkh470YOjJRVrqk0jnR7GrpaARVT8v3gGRhoBIlfOcHzlbG91ozxctndU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(26005)(16526019)(2906002)(6916009)(5660300002)(4326008)(66946007)(8676002)(31696002)(107886003)(956004)(498600001)(2616005)(66476007)(66556008)(186003)(36756003)(83380400001)(16576012)(31686004)(52116002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVgzVlY2bThSaFRlV3hKeEVUZmlEc1B0NjlrMEU5bU9YaUJwY2NKMG1xaHBF?=
 =?utf-8?B?S3ZxV3dVUWhJbXhrczkxZlJRa0VZS01RelkrVHJ4L0JVWUYzSFdhUGJLcEhn?=
 =?utf-8?B?YlFEK0MxRWVkWmJZbXBMbG51dWRjcnRSekUvKzc0aEU0aVdhRi9leklSeHQ0?=
 =?utf-8?B?bndpbEJJMGZ2TGQvTWZJUng3NWZGcEZVemI4UTk4a0prUWc2eC95QTVIUVV6?=
 =?utf-8?B?RHBCVnh0NnZiUWtadlMyWXppbmJPRi9UYTFJU0VUK0YzcHdneHVoUFprTTdm?=
 =?utf-8?B?TWVncEMyczZETVlTWWJodW5zQ25sSExkWmdsNDZoV0RuWDJqd2lEY25id0Fu?=
 =?utf-8?B?L3ArYkpocFdYOXVxcmdzYUtxMDdyc2VETno5NmxhWTZ0blR1eXhGVjFvVlhH?=
 =?utf-8?B?M0t4aXdBNDNpK21CcFUvZG9GSlVrQ1BERThxOFN3S3ZkSnBBbmREMldiRUF3?=
 =?utf-8?B?OTRXY2NQZTByUFp2QXhYTTdKVmpJZ09wWWxUSm1QeWMzVkhCY0JFOTRxMWZO?=
 =?utf-8?B?SmVlMm5YQ3NtdkU3WVd2WTdYV25OTjg0STB6c2g3Qnl5N2JxZU8vdCtaRmZ0?=
 =?utf-8?B?djBMZ1RGUUZoYXY5ZTRxcXJDRytGWEpJSVp2bEo3a1FSd1NNQm8zZWsxYVJR?=
 =?utf-8?B?dkQ3MTV2WUhPclFJWVRna2d6Q2J3bDZGTkV0MTVnQk1jUDM0UFkzU0xJa0ZU?=
 =?utf-8?B?V1FFTTZYMmxMYWpKakdMbkswR0Exb2tDMDJxN3Z3MXJ1TW80aUZGclVQd3Yy?=
 =?utf-8?B?TXlDN3p2a1RyUVk2U293M2o2T25HSHZObmlVLzltN0pBT3k5TG9Pc2g3ekww?=
 =?utf-8?B?Qm5oY1ZpaXk4VWdrNk05VnZINGpoRm1RRy9mMkJWMmhTVm9CdTVGb0xFZ1By?=
 =?utf-8?B?U3gvZEJIVzRDazMyd1N3V1E5VU1qVzBBQW44aGx4NHZpR3NGWTRKZE1TTmh2?=
 =?utf-8?B?NjdkTm9rRW5yU0ZiSWlEeE5KamNEZmwxVUo2bDlyY0RtLzNNbitDRmxaenNK?=
 =?utf-8?B?bGU2V0hrajA3ZHpFQTJJZFJVd2ppV0d5VGhaYW5EWXpBcHFmbmZibUhxbXd5?=
 =?utf-8?B?YTd6K2Ura091cDdjWGRUdE9qZ1BTU0hjb1NlajEyaUYwWTExSlNybEZRNHVp?=
 =?utf-8?B?blUyZk1nZHJVcXRCclNqazNRd20zMjBHRi9mRUNENFRvRlh4TkFHNTF6NVVS?=
 =?utf-8?B?YmJWRkVaUlFIMythNFZadkZhUFR1ZUl4NUFhTFRPT1Zyazl3eHJ5TE5kSmgy?=
 =?utf-8?B?NmpLNjRkZ2JxanVTN0NxRHkyRUxzR0FxQ2EzcGNWNi9YbFVSWFRYMmlKS1hI?=
 =?utf-8?B?bVhRR3lXbitRSEIwdklZNkVLMVVlRmhXcnJhK3FpMGNsdmpRODFRY3BmbTVr?=
 =?utf-8?B?L3F0RXRtV25NRHExdEQ5eklNMlFoTWZrOXIvVUpYRDFjYzh3TzJhYmVid2hU?=
 =?utf-8?Q?xwjhj5YP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c03080-e600-4bc2-ca49-08d8c68c3b14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 08:34:46.3437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNpxPg1O3FbfWHnAq9/Q/Kmt/EwGjwv98SFvxml2+m12GagBb7Je4ZivNpfufNuxLK2Mmpq+ikqAFLBinxQW/3TfAtzUq3VWaASLnLG6YSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1778
Received-SPF: pass client-ip=40.107.22.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.02.2021 11:29, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Add QLIST_FOREACH_FUNC_SAFE(), QTAILQ_FOREACH_FUNC_SAFE() and
>> QTAILQ_POP_HEAD(), to be used in following commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/qemu/queue.h | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/include/qemu/queue.h b/include/qemu/queue.h
>> index e029e7bf66..03e1fce85f 100644
>> --- a/include/qemu/queue.h
>> +++ b/include/qemu/queue.h
>> @@ -173,6 +173,13 @@ struct {                                                                \
>>                   (var) && ((next_var) = ((var)->field.le_next), 1);      \
>>                   (var) = (next_var))
>>   
>> +#define QLIST_FOREACH_FUNC_SAFE(head, field, func) do {                 \
>> +    typeof(*QLIST_FIRST(head)) *qffs_var, *qffs_next_var;               \
>> +    QLIST_FOREACH_SAFE(qffs_var, (head), field, qffs_next_var) {        \
>> +        (func)(qffs_var);                                               \
>> +    }                                                                   \
>> +} while (/*CONSTCOND*/0)
>> +
>>   /*
>>    * List access methods.
>>    */
>> @@ -490,6 +497,13 @@ union {                                                                 \
>>                (var) && ((prev_var) = QTAILQ_PREV(var, field), 1);        \
>>                (var) = (prev_var))
>>   
>> +#define QTAILQ_FOREACH_FUNC_SAFE(head, field, func) do {                \
>> +    typeof(*QTAILQ_FIRST(head)) *qffs_var, *qffs_next_var;              \
>> +    QTAILQ_FOREACH_SAFE(qffs_var, (head), field, qffs_next_var) {       \
>> +        (func)(qffs_var);                                               \
>> +    }                                                                   \
>> +} while (/*CONSTCOND*/0)
>> +
>>   /*
>>    * Tail queue access methods.
>>    */
> 
> I wonder whether these are worth having.  Can you show the difference
> they make in the next patch?
> 

Not big difference, so I can easily drop them. But I think it's a good idea and can be reused.. Why don't you like it?

-- 
Best regards,
Vladimir

