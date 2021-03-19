Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5CC341B33
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:13:10 +0100 (CET)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lND41-0004Me-SV
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lND0X-0001Ud-Ge
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:09:33 -0400
Received: from mail-vi1eur05on2123.outbound.protection.outlook.com
 ([40.107.21.123]:61694 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lND0U-0008Cp-KS
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:09:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3kNO+Soh2dJVhOZrSQkdpYOxvF5Bglor+/53qG845YhfoQiayXPK/bgL+UOtKD/I8DqwftoWAEP/FdqBAIajmq1FviYeHfjAEaapIJgEoMSSDc8V1rXVYNb48hncgeiaGgMUd4wb+uBMj9lg34ic3LiiTPf/woXjSIkaFSsAUl4KVxKVfZdB3jD/2ZkMbu8j1fO2QHWaQ+UgC+KryEX7IJ1nKTdvas9TKZsg0I83H3u7UUPqPhAcD2NZxaqbxQ3Yp8Wx3kzDgPzfYRzKeev+SSFGWi+5gQxpcRfOjXPn96lM/E1fXULkdgOgwoLQDeFVQ6a2TBPo/x68jlt/QnLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWNxKWDIJ2DBe5RvsHkAa8OvUNoHqil5Geo0ICxurAQ=;
 b=h6tVfIvb+rCok0xECEZk0ozTk1iHaOcPrlDkkIGoYMRT78h3EFjpPlRbcvW8OzPzZ8eHwgYDkjYKv25FIFdLj8Zd4qMn3TmQ8rZiQyTlxq42z7c6/9yrEWkKFNuyAoQGmp0rdwKTVHndjaaR+QI/uQ33Rv0I+D9bgZg0wKnjzfn862GA88p0APdLmX8Hxt9OwJgr1ESXLcWkPKF/28tfTisA1BMv8Q2pS/Ghp0a0Bs9+PuwGqsL5eOpcP3kshx5So1zrdfI6EvR0czr8fozuVb6XUiiZ6zRolLZn3+jl9lTI22lnZcezs3KN0LKZl8zwM46Uuq9rERWZLP16OpMZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWNxKWDIJ2DBe5RvsHkAa8OvUNoHqil5Geo0ICxurAQ=;
 b=c6qk2L8NsYZQ8cpqZQoUO6HcGEyUwlDSq8jNPFS/cVezCMSQiI8+Xyf7B6Y1eQ0UKkQwOs8Eq6dw6VLcy4bvNOPpmEIROwpWaya78+jGhxnMApHNhjvbbH6bHfJLwRVqlsjZJ55iLW0QI07PQTZX+LXTmPjAhJTTDzkw9fdufdo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM8PR08MB5715.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 11:09:26 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 11:09:21 +0000
Subject: Re: [PATCH 3/3] migration: Pre-fault memory before starting
 background snasphot
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-4-andrey.gruzdev@virtuozzo.com>
 <a5c70d97-0560-0f7e-309e-a07f60a2e1a3@redhat.com>
 <a8534b81-ecb8-ef58-6fe7-6531c19e95d7@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <68b79fcd-cb78-4d2f-df2f-9478e799a29d@virtuozzo.com>
Date: Fri, 19 Mar 2021 14:09:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a8534b81-ecb8-ef58-6fe7-6531c19e95d7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR07CA0013.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::26) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR07CA0013.eurprd07.prod.outlook.com (2603:10a6:208:ac::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Fri, 19 Mar 2021 11:09:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07f7e20a-e4ea-4ae3-7576-08d8eac77236
X-MS-TrafficTypeDiagnostic: AM8PR08MB5715:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB571545AA2DF5F0EFB819212F9F689@AM8PR08MB5715.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nstVmln/C0zWxexde054C1csnx4mgUeLVETW9ocmqePVKcTJgfukh7Devu8U3z7Y1D7Jfvp53Q73sy8rdOUycqGK2TBOIKnWS7Pvc2mcQbM1OVuxKaXkWxb46vtiycZwDJdE34RehrE+RiFwAE+nA26IWtKnK4J2MD9nH6k+VgMeRWYfnCajiduzTtG5OwCP7t1Y0CyF309SlnFwQSJJKQJu2z25216vIw//f05qvGqpFxUXV+98sfvNdewceMZOTnZ+2PB81XCLbd9Cgy2SoUVobr6Ge1UTLd9geck9qJMgCJibEBvTcA2UIX6LQoOJOJ8V69t+Aq3goGWckLvbI6qK+z7CjX3BUpGd5x21zN+2v1u8Vp1pNU0Brx3uSXK9tCsVkUoNnGUX04zx5sBDyVL4/njackEK4XBUTHvVK8Z3Uw2CLYinKHRYFizkVoyoj5a4kdaqlGit1ulbmsswpv8+0tjXXUpJ2VdjijR3VcL93iTbAjraWXeX+sY6VslSNdSkWh+wiIphjMvDNOtP85f/990on+7FP3iEGWtBMOGrmAW05jglFtfQ9C8Z1c/dG7mJoTn8ws0fBRDItajkLeAkflCn56fm26tVkm90kozXOWCM+GznPco/dVmtQGu9wJf/2r4wX2uvB00krJ1D6ooZn9OeEkDoXae6fTWe/ruuXx/JRAxGrqkzuFvCVZiN7n15B7ZeQY8193XM7EnPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(396003)(346002)(186003)(16526019)(83380400001)(31696002)(86362001)(4326008)(8936002)(44832011)(6486002)(26005)(54906003)(2616005)(956004)(316002)(53546011)(52116002)(36756003)(16576012)(66946007)(5660300002)(31686004)(478600001)(8676002)(2906002)(66476007)(66556008)(38100700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OG8zUEtpWk5ZckwyTFNKWGN1Uk4rRU5pV1FPUkRwWDcvS3RmT0wxcmpGQU1z?=
 =?utf-8?B?VnJQZi9CL1phU2lKU2dHY1d4TzAwM2tpTGNac0VLdjF5aWZXQVJpUk9ac1Zl?=
 =?utf-8?B?cWtMMHhpZ1BURkJGRUttdHVWejJDSGRJME9QdFZHT1p4MHlyajlzQWZxSE9J?=
 =?utf-8?B?MzI4STF1Vmd6Vms2Qjcrc0dobnVmQkIyeFl4MUt0VVpWWmdnSkhOT3o1R2hr?=
 =?utf-8?B?RmoyUERWYnZBRHh1emFNcU5waGxDcVhuOFBVTytFbHllWk93Wk0vYlpuOHh0?=
 =?utf-8?B?VkR2ekE4ZzZvTVM0c0JyVTYzVW1OTVozQWdnUmlmL2J6bFRFUDFRQWNKVmhs?=
 =?utf-8?B?OVAvR1BTTjRGVk8zNGZKWENCQlNIQWdyY0R3K0k2N1pmU2FxMjBkdlc4eSs1?=
 =?utf-8?B?QmlKdmtSK3JlZjZ4WUlhVXNXWkNVNFE1OUdZODBzYnE4S1ZFQ25tc2p4cWhW?=
 =?utf-8?B?U0Z4aVQ3S0szQllxZ1c4cGtQZ1o0OFVBL0tnaGpra0xDakoxcVhqemgrbWNX?=
 =?utf-8?B?a1dKVFFKOGpZRkFuNjlqaGw4Vm9GeFVLVnJya0YwNWVvVFlYVlUyRzFLWHlw?=
 =?utf-8?B?SSt4bjRIMEkxVGd2anVLblpLcGQrR05HYXhsK0lsVjI2VlhRMGtGc1lqTyt1?=
 =?utf-8?B?TXFlQktSUUZGdU1GNmlWTFcyYnRWTDJlWkNFNnFvOG9KWXhkdTJ1aEJPZlFx?=
 =?utf-8?B?VUtoZVY0OHlIUkdwTGRYVDJLQmdKWitFaWVFekx6N1JMcTJMcU9ZRW84SDQ5?=
 =?utf-8?B?ZVc0T3NsZU4ydTNWQXRMQnhFU3JCMFh2TkZhNEhZaFl3Y0FmTmEvS1NPaCtJ?=
 =?utf-8?B?d05OMDAvRE5FQUR1SlY0UWF1dURXNzZKRUw1WGtBL3ZsMU9qK3loMkp3ZWhW?=
 =?utf-8?B?ak1XdUlrVU1hRUd0OVBqM0J2cmlYSVBEOGNleW1mcVZZUGJHSHNuMXFnTTV5?=
 =?utf-8?B?Wm0rL21MNCtGWnJNZStUenJORzk0Z3FPRTFxQUtIVGNkRGU0NGowT2JkWEJk?=
 =?utf-8?B?QWF4dnluV1F1d1NCdEpNU3JsUitiM0pJRG4yVTdWT2UzWEZDNk12MHIxd0Vq?=
 =?utf-8?B?Unk0TVgyK0hYTjJDd0FLeVdzUXAzaWlHOGpiZDcwcFpRcEYrRDN6aUtTU3BZ?=
 =?utf-8?B?VHlmYUJWWk16NmtkMThkS2pVS3BFZGdkN3VMR0hyUFNXYWs0b3UrOVFBbm9W?=
 =?utf-8?B?RFBtR1NkYlIzOXE2N3lJRXAvNmtrc1FkaUNBL213QnJKeWpPcVc1VnFFYjRs?=
 =?utf-8?B?R1VKZWVCbWNCOXRrVEVNaVo0aEVxRGVubldlK0s4Yzd2UXhlZU5KbXJmekNy?=
 =?utf-8?B?ZndkRFhEQ2Mxd20zM1QyUGxBM3drNjVLZCtMSStkTGo2bTR3MEdLdm01ei9x?=
 =?utf-8?B?R0Y5K1p5TkZ4OGcwMnBFL2txL2wrY3dhNi9mQlJlN1NMelhPeDVFSjhvbXE0?=
 =?utf-8?B?NEx1eGFYeFlHL2ZLVVRjdVFSTVMwYUhucEkvT0ZDMkRIc1dEWExMalVURkkr?=
 =?utf-8?B?aUQrR1daWHphdkFjaExOaEN5cTNoV2lWdDVDOWFXekdsRzJGNHpDRlBQNWtB?=
 =?utf-8?B?b1pzd1hWSkRlV0hqaFppWXV2anp4clhCMnhEYlVSWENyQ2ZjZlBpSFhKb1o2?=
 =?utf-8?B?RjhpRTI4MHhnU3VmM0NIWHZFMU9idi9TaDhoaXZURTE1Q01hUk1NRkFreVN0?=
 =?utf-8?B?TUhYY2pwV2lmTFpidFdhaWNDWnFNTndiMFRDWE1BKzhJU3dwZkZjTFRqZ2lV?=
 =?utf-8?Q?7PDQX3MC/yR7975N6azuO7oFxEZSNHfhPDUKLq6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f7e20a-e4ea-4ae3-7576-08d8eac77236
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 11:09:20.9447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5g56ad3fIjOmV105mInJNlg6laE3KIsMxwdm/sQUk1whGtTFZqlGRoBvLJRfI3d/e613HNQxzdWIoniZKrH+8v3ApTj15WoOcR0T8z7i7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5715
Received-SPF: pass client-ip=40.107.21.123;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19.03.2021 12:32, David Hildenbrand wrote:
> On 19.03.21 10:28, David Hildenbrand wrote:
>>> +/*
>>> + * ram_block_populate_pages: populate memory in the RAM block by 
>>> reading
>>> + *   an integer from the beginning of each page.
>>> + *
>>> + * Since it's solely used for userfault_fd WP feature, here we just
>>> + *   hardcode page size to TARGET_PAGE_SIZE.
>>> + *
>>> + * @bs: RAM block to populate
>>> + */
>>> +volatile int ram_block_populate_pages__tmp;
>>> +static void ram_block_populate_pages(RAMBlock *bs)
>>> +{
>>> +    ram_addr_t offset = 0;
>>> +    int tmp = 0;
>>> +
>>> +    for (char *ptr = (char *) bs->host; offset < bs->used_length;
>>> +            ptr += TARGET_PAGE_SIZE, offset += TARGET_PAGE_SIZE) {
>>
>> You'll want qemu_real_host_page_size instead of TARGET_PAGE_SIZE
>>
>>> +        /* Try to do it without memory writes */
>>> +        tmp += *(volatile int *) ptr;
>>> +    }
>>
>>
>> The following is slightly simpler and doesn't rely on volatile 
>> semantics [1].
>> Should work on any arch I guess.
>>
>> static void ram_block_populate_pages(RAMBlock *bs)
>> {
>>       char *ptr = (char *) bs->host;
>>       ram_addr_t offset;
>>
>>       for (offset = 0; offset < bs->used_length;
>>            offset += qemu_real_host_page_size) {
>>     char tmp = *(volatile char *)(ptr + offset)
>
> I wanted to do a "= *(ptr + offset)" here.
>
Yep
>>
>>     /* Don't optimize the read out. */
>>     asm volatile ("" : "+r" (tmp));
>
> So this is the only volatile thing that the compiler must guarantee to 
> not optimize away.
>
>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


