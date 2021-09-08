Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B074035C0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:56:48 +0200 (CEST)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNsRq-0001VR-Qp
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNsQf-0000gQ-C8; Wed, 08 Sep 2021 03:55:33 -0400
Received: from mail-eopbgr00121.outbound.protection.outlook.com
 ([40.107.0.121]:30313 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNsQc-0003ig-V3; Wed, 08 Sep 2021 03:55:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7quYTpgiwRgzApat3QWbWUCyFQUge2yt9EkZ8diYuJppAqoj62enrIsrHgabGL/ObWVmUHilNOdG7GXFI39WQHV9jYVFFqaPMZHLk4VSllG9gBFjsgg/rUXlTblp4xownWi8xEE/nh2ltTpoY00OIn7/8TdzfnhuiqQZ4BzCZC29PSqeQut26BjHEtsrlEpUQS9SFKUWde+AiG7rsxJmqFJE4C7LKTpqGhOSOsrrpKKh1YDESjT+od9smwfdVqUx5NFm40SBYJywIHBGbDRGeatC32LTZkKTDb6wAW2G0oN8aBc26gM+eXKjlSuGm4BySmL37nzkzl+8KnCu2ngRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=/1DhVTnu/PQsxO89gqloawdoX+5jqtjoLTat0RoCLW4=;
 b=Zz79FnMvYsxn/xn/qeMl5eQEKkoq2KKSnNnjm0mHo6Uq1WDwj3p08ZSGebdhIKDkk2a3I9LksdrcHuSAPT3xxDDCMhlByfek92JkgO+/1ErYYm43Uzm88b5VvjqPM9F7xhFr67liM+5OJBCYD4NEJt0mp2KTOUM/go33ywALeGLEfXp4Nskz6tCtSxGSCgMwoSXfQ/Azh+i79S+SftY5A35JxntdLmAIY5OR4Df6xDa5Vtyc6JKOiQHGkmdy1QbitRPS+iHOxVHlmBCLEIUbGAhG9jZIS3j9EqbmHNVKvS9Aayxrzg8rs9qZXHKsT5ybGVsyKPEK6x+/ZV/+g7wPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1DhVTnu/PQsxO89gqloawdoX+5jqtjoLTat0RoCLW4=;
 b=Xv75M7z8Zp1lQA6ZrHGaBdK4m94pyiFLm3OpghC9O+HvC36xxJ/FO+QjXdmlB9bIdYSpYVywpTqj9E0bjfbZ7blO4hAODP5bwSNkHE8IVclV74zl+k8ia5gMMVr13hK5TJNO91h8H+358Q/KLfTxVA1Z1p8c54z7wTmB9fErLTk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6294.eurprd08.prod.outlook.com (2603:10a6:20b:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 07:55:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 07:55:25 +0000
Subject: Re: [PATCH v3 9/9] iotests: add nbd-reconnect-on-open test
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-10-vsementsov@virtuozzo.com>
 <20210907205102.abygnjuqy63g7i2p@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <978cfa8a-e974-c0f7-2c5b-a4f0e3c43664@virtuozzo.com>
Date: Wed, 8 Sep 2021 10:55:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210907205102.abygnjuqy63g7i2p@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0036.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR3P193CA0036.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.21 via Frontend Transport; Wed, 8 Sep 2021 07:55:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 620c04b5-f327-4dbd-df99-08d9729e0475
X-MS-TrafficTypeDiagnostic: AS8PR08MB6294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62940B6519C4F083E9AB5ACDC1D49@AS8PR08MB6294.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eoeUaWeqEp+BHDE/j/gsku7Aflj0ZvUS6q7PK3pgQ08Hwnf5pP+lxJx3WC78/ICN93OzHXwnpFzFJ4gV+baapf/DAPgPYnlrYLtlMALDSlQ4I4f22Mk1iyKq6Ecu8nmQl5UrgWmiQ1J4Ch7LqIjoTNJEc98Sgg4kYEJB7Qx9kM/it/B535TBCsn0dAQkBfWdQReZ4hyjNhUg6MITf4TBhE6AfVmK+jR+qWOBGdS/fICzC5Btw8Y2eZG6IqDM70/mGoBCzzWro1Wn9xohcUFfmXGm8/TYR5b24R4q5x1ACkN+86zVnn2RyqXI8twUchQQ87OigVADaYBKRlMaaMsq2tlIW6gXgM0AImQS2o47qcNBnHC5oYrzC/PlztzFDQw6DE1TojGkxV2br8s7z2EBhw6rZ6Q+xD+9q32lcG8oY3J0VHxVhd9I/xwVjjUwGRXwxwOPKdb5TwWMDHEKjIvlbzJc0//+JpXX/g2a41elwGHq/c5HXXN1W6a1dTSntnNLVugUtSkQOj57aatp3HT2poiqDYeDMUM4FcyvnT7RjzLhUY7boQyrPGjBR5IYdgE32WC4Lt1IqcmuZuEfsqVvR2itdSbqWkQxmcbHMknU3PDG0I2O8RhDAwiHoicu7FEsC8TWzo3wge/W0lniWYIJ+7KLXnIck6mX0taRCSZi/ECn1QplhYk5ZnQffIyENG0wWKjMYKccNbBhs6SYiSt5XHQotVyrXnEdiYA92HIRJSQMUQ4IoslOQTBjtsWUI8aAtCr64uEZw7cyMxgw+5gnOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(8676002)(2616005)(8936002)(956004)(66946007)(86362001)(52116002)(38350700002)(38100700002)(26005)(316002)(16576012)(2906002)(31696002)(6916009)(4744005)(4326008)(36756003)(186003)(66476007)(66556008)(6486002)(31686004)(107886003)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm9Sa2IxV1lxS0dnMy9FUWcxMGtKZWwyL2hXK2x6UVAwTzI5cGQwTTF5THd5?=
 =?utf-8?B?ckNuK1lpczlYOStBeENBeDgrNk85eTNwSUVxR0c0aU5BYytESC90TkdaZ3N4?=
 =?utf-8?B?UHF6cE1DeTNFcHhzWXQzeDM4MzJBeTlMOHd3RkR0Q3BNVTAzSmNJVitxV2Uv?=
 =?utf-8?B?cStnZjJaVXNOYW0xZEU3MjRRV095dEJudURpN0VueW5oVFFOMXVJTDVsWC85?=
 =?utf-8?B?dWRqcjExOFg1cExCZXdjQnhXTVBJMTl0OWljU2ZTRHgwUHFzSnM1NEdCSVU4?=
 =?utf-8?B?V2VMUzhpc2JIbGdXblFNOTZHWWNidldZWXhQYk90VG12Vlh1U004bDdVK2li?=
 =?utf-8?B?UHN1WmZMaXR6eXVjWDQ2eTVmc0MxN0lMUU95K29iZjdhd2hsSjM1c3NHczFB?=
 =?utf-8?B?Rlk2L2c5aE1wbGpUSjYrUk5vcGdVMVBIN1NLbCtVWWFINytZSVc2bUdYWVdJ?=
 =?utf-8?B?akFCT1hyVGhUWk5yWmtGUXJXbEwrZWxZaXBBWXJIWjlYMkl0SFUrQkluY3p5?=
 =?utf-8?B?akdmRGVjdUNBOUl0WUN5SmlmZjRQYmhtTnpjelduQ2lLUHN6Z2V4ekpYVFgr?=
 =?utf-8?B?allWYWxqNlJ4aHFJMG1CMHRZQi9SYW9tTFlJemZLbkRpWndjTk5IejVBN21q?=
 =?utf-8?B?L3NaM3N4QVZIQTZhSHlHTm8wWUQ5K0Z1cyt2VjRDenBMMjBEU0NDYWVTV3Bx?=
 =?utf-8?B?RTJPenQwRjVQMDNBM3pPNDlNaktjOUYzMnJPdGxma2dzK1FhK1Rxd05QUVd0?=
 =?utf-8?B?UHd5S2JoQUc2eVRJVzRCZ0xQc3NmU1hzOER6L0VoL0diQ2xIYVFsRTVrc0Zm?=
 =?utf-8?B?RGQrcDVYdFFucVk1NUQ0VTZjb1hDWGlKcllFaVA2bjNlZTF6VGtFKzdqZjI1?=
 =?utf-8?B?VkVsNGwwT3JTMjQrQjFMdndHNFU4cXNhMkRicGJmcjlCVzJJaG1qaG12UDRR?=
 =?utf-8?B?cTh6VU9iTk5VT0VudGQ0bmI0VXhxRlB5M0l5VW93dDNEejRVYVZ0Q3gzVU00?=
 =?utf-8?B?NVdYYm9uc3dhZURUWGRLMFE3ZjhyTHg0djJKU3JTZGRJdDlDZ0UwTTd6NU9i?=
 =?utf-8?B?Y3lTaVRXcXFWUzdkeHQ0WDkrNTEwME9wM0tFalp1V3VLeEE3RzQzRXFjNDdk?=
 =?utf-8?B?TDc0NitZT1l6R1l3ZTRNVHRjVWJmekxvbmx1S1p2MElvYVR2YlV4aHdqb0VG?=
 =?utf-8?B?bXpzUXJjRExlV1NwcEVzekNweHBaTWJEVXc1dDhvSncyQXBhSXFEMEJCUnl5?=
 =?utf-8?B?Zk0rQ2dKOTM1WjV2Si9HUTJmbGc4eWMxTHJQNkNrdS9RM3lmZ1N3SE9nSzln?=
 =?utf-8?B?RSs0UHlZK3lHS1B6M1R0SE9UNDluUHRKdTlOQ0I1N0pLVG4wSk9zSlg3NUVE?=
 =?utf-8?B?bS9mZ3prMXRPZFNaWlQxZXpWajNiNHNJMUxudFdvSFV2RnNWQWN6R2J3VG85?=
 =?utf-8?B?VHJpZncvMThrdDVIbEZtYjVneFdaeER2Y2owWTVzVjhDRXFPTVJucVlJaC83?=
 =?utf-8?B?b1VMdlM0SmJlYXc5OTIxb3NzSlJ3VXQ5UVhkOGgvNlhjemFCTmNleUNLaWZx?=
 =?utf-8?B?aG03T1hqaWhRd1VPMW9heFJ5ek9reTFNVkxrdndKQk1FN29tNGdwcFZMS2Y3?=
 =?utf-8?B?QU9JZ1Y0WlZ2SlJ0WkhVeFVaR0pFNGJqejhxRm9MYkFuRGlPa1FpSVF4TnhW?=
 =?utf-8?B?WDRWa1A5TFR2VWlYSTZTWTFzZm9wMm8yVGNGdGpuRDhDR2U2dW11RktsREQ2?=
 =?utf-8?Q?IEg2X2aRI35Qh6Gz6w/kaZ0Lm+qepm5Sao+FbLH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620c04b5-f327-4dbd-df99-08d9729e0475
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 07:55:25.6601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJmsc1aLVoRBbi7Ke7rjhoX7+Q1OjgZ/8TQrqIR8cGR2rQsmCAH8NfAl+B9AChNZemSAsdc/UgAS/JCLcPX4CUottyiRoR7NaYb535JZsWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6294
Received-SPF: pass client-ip=40.107.0.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_NONE=-0.0001,
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

07.09.2021 23:51, Eric Blake wrote:
>> +def check_fail_to_connect(open_timeout):
>> +    log(f'Check fail to connect with {open_timeout} seconds of timeout')
>> +
>> +    start_t = time.time()
>> +    qemu_io_log(*create_args(open_timeout))
>> +    delta_t = time.time() - start_t
>> +
>> +    max_delta = open_timeout + 0.2
> Is this fractional delay going to bite us on heavily-loaded CI machines?
> 

You mean that it's too small and may be racy? Hmm. But increasing it now means wasting extra time.. I'd adjust it when CI fail if it happens.

-- 
Best regards,
Vladimir

