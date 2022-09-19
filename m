Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B675BD120
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 17:35:33 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaIo0-0004JM-2i
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 11:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oaIjz-0002K4-1p
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 11:31:24 -0400
Received: from mail-dbaeur03on20725.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::725]:7152
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oaIjw-0004z4-Q1
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 11:31:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIzIs59L9eccZrj0ggnhP/t+1KoFvz7j3d45MBJnSZpMQ77UpVBPchjvezVVR9w4H688eJssh4jVQEP+xaUnn7vaPMvNA5GF6Zzl2J3i9MocbX2M9RvBUoH2NRXulkCs4hTeCV18NLZFiDgTeb8Msx3/wiUHkNCjQTtife17kIr5lzuV5Bzm/wyx6K+Jrp9S8up52FY5cyOcOEcsfNQW3i/nf7BPmeKI4cH90affJkAPo5Y3Tm4kt0eGTO8MD0+DmUtWtnqdE8Ufy410O/J738FNEYDepXYq916hbVmYCWiihSdDdTGHP0PUTAfutdjnOrNv1843nY3e/TzRdHdC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BnbXf1umnbWEI9o6LO/ZAwn+CTz168efkly9mcXMAk=;
 b=jZp42OKajOfwwLKdNJX1Ic0GAvOQp51Ew/K26iztJ/EVzr4Y/YT9AbRLC1MpdIK3eCBsOV5W9ppWvDuZ2lfi12auRNE0fOCl7cOzRp04lzKK0tPkWP6jYUbIoHqiliu2H/vsclSiueGS7ha6/AS9KuWg8z1r8pEAnPYBdpmt0hdErbcvsDMInt9kDAJyq5MXejsuXb8EzBRY7YLwnUi2pVNEJWBns0Ku7OC4hCeMotb1yAP3JHA0EHrl3vO7UhF6BMw3VrRBkngTQx027mantzNNM59FrFtkkDu737JWzRkoFAZafYT9vBHnSyuZ6SviZrEYVFkQ0qWKM8MRIeJW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BnbXf1umnbWEI9o6LO/ZAwn+CTz168efkly9mcXMAk=;
 b=AEustx9Uv2brfCyT/oCKhTc2rlJcs5Bktfj2Ihfyak+jzCNQd72PkRJKDCdU1cz5YxrAYaFsVy8+AjZDqaBaDvzT2WR1EtYpLfBgj8jwOc6f0Ph/p6Wf+qZeGK5tx53dFlIFycrh6bwCXB2mrGBqoogcUjJlBGkx3RI+85CN+1H8RGaJkl2gWgwAmbySxeT7D96apnBFz7HTFQxJq5z3SRQQgN44l8j2wD2EKXYlBtyTMZ27z6Ew9G6XWS6U/guRhLj4WMabUwmjwarPGCSbbwMKWafgxN8DEy8gstKSIr5WQvKJ312tAK1nZvin/ZORq0ryqPFF3L7k498orrySSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com (2603:10a6:208:5e::31)
 by DBBPR08MB6108.eurprd08.prod.outlook.com (2603:10a6:10:1f4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 15:26:17 +0000
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::ca1:54c1:1977:2578]) by AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::ca1:54c1:1977:2578%5]) with mapi id 15.20.5632.019; Mon, 19 Sep 2022
 15:26:17 +0000
Message-ID: <e4f1f5e9-6212-d832-f54e-485a10be5015@virtuozzo.com>
Date: Mon, 19 Sep 2022 18:26:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/5] tests/x86: Add 'q35' machine type to ivshmem-test
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220915131407.372485-1-michael.labiuk@virtuozzo.com>
 <20220915131407.372485-3-michael.labiuk@virtuozzo.com>
 <69fdd561-4231-cf02-7438-2bf5acef4794@virtuozzo.com>
From: Michael Labiuk <michael.labiuk@virtuozzo.com>
In-Reply-To: <69fdd561-4231-cf02-7438-2bf5acef4794@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0008.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::22) To AM0PR08MB3298.eurprd08.prod.outlook.com
 (2603:10a6:208:5e::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB3298:EE_|DBBPR08MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 4263a4f8-2ea2-474e-8031-08da9a534bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: axOLVqVDp0/TD7ZyKSrvsILxvv7P9Xk95wAEtCqq6QABYEa30Kk48a3fnCdRS6KYW32q0xk3K5EJ4vT8s6T5ZVr5mHa/mPwm/R42sTIbFuwLLUgtWe3BAo4wkIt9nNc0ApDXk6l2uRe0eWZi6Op6W4YCKlS2X/ohseSnlLNxqH1WFwKvjxbFJTLf80cPpP1Rt80nV6PInAqiWULyzcT2RyeSArW2xexi4WmOWtLZ8Xg2pLQFb9IP7TE9HY1lsx377WF8zYnHtMfw6WJ1NdQ2yqbkGQJnmnfSa4vDKdOXPWoLC9c69nL1C++eeQjpshhenOT2VMU0td6PTzj/0c59c6y4L4BohM/rj/5/AH7yTNyJzHN9Uaao5zWYrJactwVc02kVUnsVZawkrZhdJ2a9I5fAk5AFmNzlVy/JCKQbsKGQ6Uw55Mmpv1YeJxQ4Fwi6ez+JaePEw6DNxQI1+ND/dIYVY46EfMq9k+cBx9mlS1rKrNki5GnBcwoZ91w1kDIKF+S2P3QELY+5BOXQi+dX8JQdwAykFUhzkA5Px5/6nPCTOVdlB6ptHq/PftQIFCz4UeDhqemUBw96B3qjJNuiBayBdHLmU5oLKy1SFyugP8kFM22hdePHpIUlxiRlrN2pim7bizJ5yzW9Ie2PnaFs0Y+sn6GpNZnKXkdSZ9Mec+r8E6sragZKtDNDHVPLkCHFS2EvcSpvtVXSWheEzKMb7plgJTMOG61YWw8MJWWo2iypoZXINoIRLMSHyTW+/P50nr6XQtzULwJSpE3TzpXznDVcu5zZ/zCXyh9wYWQo12Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3298.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(366004)(396003)(136003)(376002)(346002)(451199015)(4326008)(6506007)(2906002)(31696002)(6512007)(86362001)(38100700002)(53546011)(8936002)(26005)(6486002)(36756003)(66476007)(8676002)(66946007)(41300700001)(478600001)(66556008)(31686004)(54906003)(2616005)(83380400001)(186003)(44832011)(316002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXpwa0lUQ0JFaDRia1NTSU5Wa3JMay9kOHZpRW90N1c4NU91K2ZXb3RQOHg0?=
 =?utf-8?B?Wkc1OFBBU3l4eTZtcWkzeHJMbVdhTjF4WmJvQ3ZOU2ZUczl5VDg0elNCM0RB?=
 =?utf-8?B?M3ZHWndFQ2pBVU5ick9PYWZKMERFRWlKWlIrQ2xVSUR4aVhVT3VnZ1hzMFRS?=
 =?utf-8?B?MXdiMVZlODBoSGNiL2dhbnl4VWlkbnd3QUJJTkdZbm9IYmh5S2tWTlozOXpq?=
 =?utf-8?B?OS9FSUVuczk3aVdaenN0Sm1GWFIvVGlxdnVPbUJOaEZPM0hlT0MyNUNNN0dJ?=
 =?utf-8?B?UHQzTGd1S2YzL2FWc2c2aGpFZEZUZlJ3UFQ3dVJkZzhsVlJaa2JhdEZ6S1Rw?=
 =?utf-8?B?ekNEUEsrQ01VQlQwK0cvYXkxZTczV2R3SW1kVlVUQUVqVFJyY3ZHT2lqMEFF?=
 =?utf-8?B?eXNISUhLSDA1VFRnd2VkRnl4TmpJaXdkZlNZWnpYRUZnbWhWT1FzZml1MDg1?=
 =?utf-8?B?RGRhL3kxdTZZN3M5REpQY2pXdXl2S05DSlJTb2tJVXp6ZmFOMjFPbVRyVDVm?=
 =?utf-8?B?QzhwZGJwaXYrQlpyQkg3NG5qQ2VnYVp1c0Z2ZnlaUWF0ZWV2dnFJaWlKTHFK?=
 =?utf-8?B?N0FNeGdwUkZFWGEweGJpbzlOSTBsZlk3TlU4ZURVcUwvemh3L1hFbTNrWnpV?=
 =?utf-8?B?OUwyTWdSQnlOVWRMcnFPODdlWlJ3dERXOXhmeVJHNFREQytTMXh3c0dxT21D?=
 =?utf-8?B?ZFp1dVpYdDJhQmg0amRxcXI2dnRZbnBNaktWVWZjZU8vWTZZT09XcCtYeCtH?=
 =?utf-8?B?akwxMWVjOGxTOXAxNkptUERqZkI5UWlreURJamk0QnZCWjkwRGZKdDAwUlVT?=
 =?utf-8?B?WTFQVVZTdkdILzBSZWVNK0RvaVJEbVBCdDE4M0JwNFdTWXh6ZzR2MkJNNnZT?=
 =?utf-8?B?bWFva1FtYjE2OVR0SzVSNmlYekwxTHNTeDhjaksvS21nclpTNU1qZDhwbnZE?=
 =?utf-8?B?YVlybGNmMFJVK2plKzBhMmJyUy9EVkdvZWowcjVsMmlGYi82TEdRVVFBQjhz?=
 =?utf-8?B?aEVKeWI3YW1IQ1NKK1JaOUt1Ujg4NUFhUlFqUkJtMERTQ1BEN2N0MTkrNmJU?=
 =?utf-8?B?UTFaSUE4a1hHK09sMmNGRW9KajFzcDNIZmcvRzdGSXJ1WTQzMzVKZVduMzJx?=
 =?utf-8?B?UkZpZlQwczdvNGkxRE9YOStaMVdwTFU5TG9uczJUNkdqdXd4S0lRanlQc08y?=
 =?utf-8?B?R3VrK3I0TEhXbWVxZXdDM0g1ams4cnRLQm9ZOHNYWEUxRmkwQzd2Vnp2N1M4?=
 =?utf-8?B?L3V2bHAxeGdDVTBoNW1vbDczaDNhRXlpUmVTaFpFVG9HcHg2YkJ3T3F5MUE3?=
 =?utf-8?B?ZHcxQzd2eHRyRDRHYmIzeG4vODkrUVVrQkVsYVpwSW1HNUswaDNpUit1UEty?=
 =?utf-8?B?cVBBckJ1L2RoTE1XRkhlV0pkMkxteTRPN2E4bm4vMnQwWDhvNlpvaTVBYXhJ?=
 =?utf-8?B?Qzkrd2RxL1BHVUcycTJzaEJWOTg2eDZMdG9sTHhZb0NkL3I0OWozRlVUNUJN?=
 =?utf-8?B?WElhTVJJSS9abC9YRGRNR041aCtQNmtZMk5wUUg3My95SXVidVBwTkYwb0R0?=
 =?utf-8?B?NTFINDlhcEpWbnVBODhqSElFOEZta2hKTWRCR2p3K0QyclVZNUN3cGgzODli?=
 =?utf-8?B?b24zQ1lJVEVERkxmZ0NiQithUXdrRUZYanNncXU5MzYzcWMyRXA1enJWTjJi?=
 =?utf-8?B?Z1A1V0g1UmM0eGlFOG1FRitBSXFDbTdSbXpuTGd6a1p0NXJZT1JnZ25uSHY2?=
 =?utf-8?B?aFlOZU50YTdZWUp4VGN5N1pkckR2K3pMTFJ2VEpQeEQ5b1hVSDA2NVphZkl4?=
 =?utf-8?B?WHJEMkhlejFKMUxUQm5QRU5tTU5YTGFIZGl0cjFrOWtZOS9VSDgyTlZkaVRn?=
 =?utf-8?B?dExnSFo0TEhZNmFudmdrSEF4MlNQRlZyS0ducUhhQ202NFQ3SnZDamkvTm1w?=
 =?utf-8?B?aHdkY05jVkZqR2w5N3JBTFhMRS96dTBseklrWjdpbWtEeTVGc3NBWHd2TkJx?=
 =?utf-8?B?UHFqbWk4ZjAzdHMrT0JBN1R1MGVqZmtjRVJ2aWIwQzlVeVB4djRkM0xKbStG?=
 =?utf-8?B?WlF1Wmg3NzVZUmNraVlIM0hQTkVxWUxOUFcycUxBNzlQUFBOUlRYQXdzSVRz?=
 =?utf-8?B?VDIvaWVWRUF5a3J5bXBoV1pubTNGQ3QrRGZJWUtGL05rNzBScWpOYXBNb3Mw?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4263a4f8-2ea2-474e-8031-08da9a534bf4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3298.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:26:17.5030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuZ0cMhTG/kHBzp+y8UWBfwBILBgS8a6kpeIAEozAcqaFRF44VGilXM3Vhea/MRH0ZFpFeFcyrWLJ7DWLmbLVGdTbC4aMFNEpiR9RWfGCCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6108
Received-SPF: pass client-ip=2a01:111:f400:fe1a::725;
 envelope-from=michael.labiuk@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/19/22 16:13, Denis V. Lunev wrote:
> On 9/15/22 15:14, Michael Labiuk wrote:
>> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
>> index 9611d05eb5..0f9755abc6 100644
>> --- a/tests/qtest/ivshmem-test.c
>> +++ b/tests/qtest/ivshmem-test.c
>> @@ -378,6 +378,32 @@ static void test_ivshmem_server(void)
>>       close(thread.pipe[0]);
>>   }
>> +static void device_del(QTestState *qtest, const char *id)
>> +{
>> +    QDict *resp;
>> +
>> +    resp = qtest_qmp(qtest,
>> +                     "{'execute': 'device_del',"
>> +                     " 'arguments': { 'id': %s } }", id);
>> +
>> +    g_assert(qdict_haskey(resp, "return"));
>> +    qobject_unref(resp);
>> +}
> hmmm, why do we need this helper if it is not used anywhere in next
> and this patches?
> 
> it is also unclear to me why don't we do 'device_del' for other archs.
> May be this is to be clarified in the patch description or worth
> additional patch.

device_del() used instead of qpci_unplug_acpi_device_test() because
unplug_acpi is supported for x86 i440fx only.

Also "DEVICE_DELETED" will not being emitted for 'q35' pci-e device 
without support from guest side.

These are the reasons for custom unplugging function.

