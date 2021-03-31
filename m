Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3891135067E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 20:37:19 +0200 (CEST)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRfiP-0007uR-PE
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 14:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRfh2-0007Fh-AJ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 14:35:52 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:16609 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRfgv-0005bd-HS
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 14:35:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nl7rKboJ1QBYbCd8iG9kGOjqYwOp5+yvtHYP98FnsoWBf+fUnPcMFS2lKt5UJg4dOX9uPk5NnXsejdxyzaL9QUTwEtNltmTogCqSWIn4iEvW9sFonWJfIFLEDXlD2Ur9cnuR0jhVK3OcYjIchEQE+BuBMkOiw247N+30chNiHsjIw9yXAACoWSZnfBi7my8vCbj+UrTAw1eTmwOaTqJCNtDf+vH1cEJLoPx0JD8fqmvJeveSqC/64P7m5Ucc0de4g4Yu6JTSYqVfdf/CaM/61zEICLWfoGrbC/bLeLLZ/Es13JZlH62c7hc6xR8xqiQszxpM4AIuHZ+qapVxJnivVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sg1b3Jq7obpa7r1ckk2Yrgk/LWqt9VMrXTGLPz+e20A=;
 b=nJ/mXXO8Y5SNXEjhpwdt/MmSQqsebz39RPi0J8YWQal4dpD95QaKHYZrmGWit7Q8n170Bv3iad9VqEf/32dqiXc3PzM5gYRuLNYA3hSPzjF5zBsmSR9kRXlKExmoKFDETvtmYKpI4MYEFUgHps4qkDYyyWI8CcokxSEMVXUIMxUQMmJ9LSicUVKGROR2ZfURsreBb5GQZISvdI1I2G0YeJYsoXJFnr4JoXjVb9DikPGCSfLLIaPes/eZSkmWGYe2/fGxQQ2WKBWR/Xk4xc5vYWbI04lTmPm+L+vyrcg83WH9SyUNwUme+A/PZP84RLmKLbG7vhy+hkNFkZcATZ+shg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sg1b3Jq7obpa7r1ckk2Yrgk/LWqt9VMrXTGLPz+e20A=;
 b=Inu0WZwZq2mC6xZiJB+NxqiDxwwGvYR6IKS5/kPaiXNLOL/qEEs79UtwYt9B/r7eif+0oiu1XUCnhnUnp0I98LdlGXyK2HKLKMTZTDQv1cJVsA34eRvXX6xsNRszfsk+T4pTqOteiTR5scYcLa+yFGGvd2+K33zDFBmzX4mOzng=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM4PR0802MB2275.eurprd08.prod.outlook.com (2603:10a6:200:63::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Wed, 31 Mar
 2021 18:35:41 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 18:35:41 +0000
Subject: Re: [PATCH for-6.0 3/3] migration: Pre-fault memory before starting
 background snasphot
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210331172803.87756-1-andrey.gruzdev@virtuozzo.com>
 <20210331172803.87756-4-andrey.gruzdev@virtuozzo.com>
 <cf44ad26-c7f0-ed62-e348-9e99d7d6ede8@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <cb38a354-6e27-3049-0bb1-39d5adf1cad7@virtuozzo.com>
Date: Wed, 31 Mar 2021 21:35:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <cf44ad26-c7f0-ed62-e348-9e99d7d6ede8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [158.255.154.235]
X-ClientProxiedBy: AM3PR03CA0061.eurprd03.prod.outlook.com
 (2603:10a6:207:5::19) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (158.255.154.235) by
 AM3PR03CA0061.eurprd03.prod.outlook.com (2603:10a6:207:5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Wed, 31 Mar 2021 18:35:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e8f1af5-c4f7-46dc-a330-08d8f473c993
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2275:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2275A23D52477A56BDEAC9439F7C9@AM4PR0802MB2275.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOP68nqbBwcORoyrELonh6jxhoRr2PSENu90x+LkM8IEMYiYLhBXV9390X3ig7KyIEWDNcjCXJrHb2GKLTPiMk8QQPcFrdZ041rSGigWGWfF8JKOno+2LkPgd2BNFokkcpnDrYtw7o3rBEOwtuhPVTe3Woaeb6GGXelsIEKF4OJTvS7RJRs5i1Lv9RqkixyFOexudKhuyj5yeoCPalrax25WQMEZZ/j3azjBx4SCEncpNdUx5+3yKXG3Nyo9gnsWJJBGzid1wfbI4aqNxI8V2QKmw3+LTRi9JLW5WgiYi+u25K5qHzr+Jw+lZw/ot6Kgs1NhIbYAiYzvGRLJXmvAcY7HMh3WPfWh4sHFpwLAKmmLDPaoHK/phxw1vI2sCiMDoFsycN0weCLakJGH3Sn74wqpFn5x3BVBlWqk5m0KdEAypxAsKWaiahLloxIn5/IOgRUSUry/CXIUu1eIyZYT/kbAXJlj8jQxLKbd8yP5CQxaYVoWl4qk37s5Wnjv+PG+IU/JD3yzQ1vzR4EJnc7Oc2/FAZMXHP61SS+opOUpC7WNsl70T1JMlpz+fLRdO7wV0g6qGVVtmf2B+vI4C/NSxs/NU7Pwnf5h3lWnbL4gCjHApkm7AmK+jF8KqYlR2irprKn6WRgWtCjdX08B1VNX7Zfzoqld8nHtXHEoJA/0LTfYmX1ePSQqm3l2WaV941Z1Ewhoa+9ls3QdYf3zn5LX5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39830400003)(31696002)(31686004)(83380400001)(316002)(8676002)(478600001)(5660300002)(52116002)(956004)(44832011)(16576012)(54906003)(66556008)(66476007)(66946007)(4326008)(38100700001)(26005)(6486002)(53546011)(2906002)(36756003)(186003)(16526019)(8936002)(2616005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZDRiK2NzZGswUGFZcGRPamRNYW9VRFp6R0VaamhieHUxUldjQ0JlWEp2SWtD?=
 =?utf-8?B?WTNxb2M0SlZ5aWI3Ymwralc5Z0V5Rk1Cd3lWTFRVTjNPcHpBTmVmd3Z5Wnor?=
 =?utf-8?B?YmtMQTFEcTloZlE5ZFdlczNIektYWlY2N1ZSclZNVkhNcGpFQmpZQUpuMWJ5?=
 =?utf-8?B?Y3U2MThoUHF2OXhXbnJyRVBnWHRaem84c3lMOVV5Y0dRclo3eGhxSTdqRnc2?=
 =?utf-8?B?eGNtOVlRZVhkOWpqUFZCVy9ZZmMrcm1YUmVyczQ5VHdDSmlQUjIyQWU3YzdK?=
 =?utf-8?B?QzA1cWU0RHl0bzBkVXJQRlhMMkxGSkMwZWNrd2phSGkrYUlDdk5na2pnMUcv?=
 =?utf-8?B?M1g2ZjhHU29YMDdLTzlrZ2EreWZxZlpIeThyRnQyeFF1WFFTc0lJTmdQRFQ2?=
 =?utf-8?B?UHFLWVlnVmlFRmZhQXBMVmZIMDhIOG9lQzE1UlNqcjJabDhwSHBGWWt2dDBi?=
 =?utf-8?B?OHRwSUxHTVA4Uk82M2VZYk5CSHZlaXNjOURtV2NjRHNXUzZmclppTWQwc05Y?=
 =?utf-8?B?NGwvSDI3V2FPM0prZlI1d2p0VFpuNGFPM1o5VUpwNVI4MURsVjZKRVNrK3hm?=
 =?utf-8?B?SklVY2Y5elROazlYWjQ2QmtVUUhuOUtVMGVwVGxhWWdJd2p2dXloM1pYV2My?=
 =?utf-8?B?WFBES1QyRGhSZ3kwUWxjQndDOVUxeXErVE5RMEpOZFpHSTZOY0QrWDFpYmln?=
 =?utf-8?B?REdJOVI3aVdLdU91MWliNFViSzFNZ2phTDY0MStMcU5oMmozNU5vV09RWDBQ?=
 =?utf-8?B?M3htTkhqckZvS1l4RkJOUElsR1M3aktXZld0RXE5RTg0SUJ0N3VoZXp0SDY5?=
 =?utf-8?B?RDVhdmRNcE9yT1AvZm9Gbm1qNmZ3MHhqMVpSL0wzcFByU3BIcUU1Y0gwYmJk?=
 =?utf-8?B?VWxneXQyc0k1UGxhQUVoWk43UDVWS0xjQllKVTkwaG1nTHJyYm5LcFZQR0pX?=
 =?utf-8?B?eU9MWFNuYmpzTWZFdlhDZkZpYVh5TGxaYnIyOWJDVlhJeDgxVFZxSlV3dHRU?=
 =?utf-8?B?WDBFUWl3VC9IL0VnWllWL2UrbjNWK05wUEx1Tzc2dXlOSHFoZ0dtRnZlandY?=
 =?utf-8?B?RUc1S1pTSXdjUlRCQjFScUdJbW91MEdLZEk4cXRmNDFWeDdjbUp0c3poalBj?=
 =?utf-8?B?MUdGMzgxM2hUZ0JVK2RqbVdKcWFTUzE3a0tzcXJlZnBtelVUWmd6K05Dd3gw?=
 =?utf-8?B?WXBROWtHR2tXTUgrK0xLTXhXeEkxS0hHcUR4alJsUnNCbnl1ZU10cjd4aDBM?=
 =?utf-8?B?Z09ybEI4ZTFieHowVkIwWWRFTnJiaGZ5dW9DMmpWcklFN0NLaGVQQzVaamd4?=
 =?utf-8?B?YjVDSm9VWWVKZDJ2SDdHTVJDVmxCZnhOdzIyOVNNUm4xRUE2VWFHcE8yWlM2?=
 =?utf-8?B?YVY5eHVuejNSZml3VXJPVkFLNHg0dDdPNVVXQXlQRVU2emRaNnlrWUJkaUJv?=
 =?utf-8?B?QU1FOGxUNHJuNDUwaHUwT0poa2pLZ1R6QUNtQlIvTHBEbnQxZ09HaTU1NUtn?=
 =?utf-8?B?dWtwU3pORklkOHdJZ3BkcWVSUGtNdVNiRDNxKzBFQ1BvYTZia3pNMEJUWEpn?=
 =?utf-8?B?bFJtTS9SN3VhdFZ0VkE0UTZXTEpNTkVDbzU1STVZS3dsUjFzRWJmOUg2bVEz?=
 =?utf-8?B?RUVnVjUyZmJic2tGbzROOGsySzlvdmEwcWgybDBqZ1ZmOHVad2hoalRrUDFL?=
 =?utf-8?B?NkZUeDE4YWJmcng0cmo5Qm90c2hsbDJDS0xOV1lIdFdOMGdGRDBJY0djTGdE?=
 =?utf-8?Q?+DORsyYJR+X5ue5jE3dCHHr4AhKasfy8Sz0kyZs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8f1af5-c4f7-46dc-a330-08d8f473c993
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 18:35:41.4296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTAfP/+fJ8P0l9rEPpF4wCWfCeUaTqFIX0k5QkJ97a1a22yrTPyw32HijxMFs3Rd1tEs9WIt89DUzMLOV8RhoeatkqIvRkCnRbGgkph2uPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2275
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 31.03.2021 20:33, David Hildenbrand wrote:
> On 31.03.21 19:28, Andrey Gruzdev wrote:
>> This commit solves the issue with userfault_fd WP feature that
>> background snapshot is based on. For any never poluated or discarded
>> memory page, the UFFDIO_WRITEPROTECT ioctl() would skip updating
>> PTE for that page, thereby loosing WP setting for it.
>>
>> So we need to pre-fault pages for each RAM block to be protected
>> before making a userfault_fd wr-protect ioctl().
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   migration/migration.c |  6 ++++++
>>   migration/ram.c       | 48 +++++++++++++++++++++++++++++++++++++++++++
>>   migration/ram.h       |  1 +
>>   3 files changed, 55 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index be4729e7c8..71bce15a1b 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3827,6 +3827,12 @@ static void *bg_migration_thread(void *opaque)
>>         update_iteration_initial_status(s);
>>   +    /*
>> +     * Prepare for tracking memory writes with UFFD-WP - populate
>> +     * RAM pages before protecting.
>> +     */
>> +    ram_write_tracking_prepare();
>> +
>>       qemu_savevm_state_header(s->to_dst_file);
>>       qemu_savevm_state_setup(s->to_dst_file);
>>   diff --git a/migration/ram.c b/migration/ram.c
>> index 40e78952ad..24c8627214 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1560,6 +1560,54 @@ out:
>>       return ret;
>>   }
>>   +/*
>> + * ram_block_populate_pages: populate memory in the RAM block by 
>> reading
>> + *   an integer from the beginning of each page.
>> + *
>> + * Since it's solely used for userfault_fd WP feature, here we just
>> + *   hardcode page size to qemu_real_host_page_size.
>> + *
>> + * @bs: RAM block to populate
>> + */
>> +static void ram_block_populate_pages(RAMBlock *bs)
>
> Usually we use "rb" or "block"; however migration/ram.c seems to do 
> things differently.
>
Yes, I'll rename.
>> +{
>> +    char *ptr = (char *) bs->host;
>> +
>> +    for (ram_addr_t offset = 0; offset < bs->used_length;
>> +            offset += qemu_real_host_page_size) {
>> +        char tmp = *(ptr + offset);
>
> ^ missing empty line.
>
Aha.
>> +        /* Don't optimize the read out */
>> +        asm volatile("" : "+r" (tmp));
>> +    }
>
>
> Reviewed-by: David Hildenbrand <david@redhat.com>
>
>
> and might want to add
>
> Reported-by: David Hildenbrand <david@redhat.com>
>
> (also to patch #2)
>
I'll add, thanks.


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


