Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA962C8D18
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:44:35 +0100 (CET)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjoA6-0005gU-Ek
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjo7X-0004rT-6y
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:41:55 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:64215 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjo7S-0004MO-TQ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:41:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmAl9ifGjpTqaFf62jCUJil0gMXbhplSYbd6tSKM5oWFh0ek4XV+SeLcu+FyVf4NRs26j0zFjldvXUk0LY8D32RVtTshXTH/MUQxet7wqBHWIoNpGRIdQvzV0WLTB0FGt5nUBVHK23m6byQTnAh0gs/dZCy/2Tol1hsuj2kmFOa/x54fKIU6AQzdVyPKakxePnKuDsb3BkKDhgZT4GHe5+dJCIEPricqxrLAIRKyojuUUJWUVWFXe1PBwxtaIoSEV6cCrOW0kana9BCHEEpfCdVrdCPZ9wwKMgaSuqtgIXreDcv3dK6JuIaX2+o0Zi6vHKQML79ucK13/iydBjczZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gs6oWBmkUuqWhOKjftaplb1hXRAN8IbCRwd3jeWPm5Y=;
 b=mY2VstdSKutNIzZ5+eBYHFWTDhzUgFpnASU+0hCENiJxBGD4XGaSKf7xIIC0W5tHX7q/1G+kkNuTbuKpdCkSVDt0iI+emMeM8bIHk+TcO1DTIfV8EAVB222iCiVfesyT95FYp1GS5LhKMBS+HJoduQOZr8/DKPLXvNp3FPesMeIzfrPApnEapMJhwKo0OYHPOjNGZnQy9kQj+Pp+O2+m/RjkMMvW0xhwsAB8p/QAXHwGdclMV5gWkbgnwTvp6Dj2r1F9nrN2ImNQC7mmqXeiyfIno3sEcx5D3j9l/xbpJfflkd28lUmKku+ZzshAooT7WWsdQLjYzkZhSfYyzmpg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gs6oWBmkUuqWhOKjftaplb1hXRAN8IbCRwd3jeWPm5Y=;
 b=WaJn7wd4pNZOfW1Zfnx/r8UU7WYIdTHg27G66prnU4r7/ePwKSa6p1StMZ2t16dNwkPFOZYuIZrU+AfMHPBj1hKx0AhO5LLT9qi4G1Byk7gaOjr69fvDxr1WG9dm1dHiNjQBJRVHOuM/5gsVYN7C0Q1KX6DyNVUQ/vcRVtcPwfw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5582.eurprd08.prod.outlook.com
 (2603:10a6:800:1a5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 18:41:46 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 18:41:46 +0000
Subject: Re: [PATCH v4 2/6] introduce UFFD-WP low-level interface helpers
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-3-andrey.gruzdev@virtuozzo.com>
 <20201127210400.GF6573@xz-x1>
 <bfd5afe2-3c4c-8c5b-a984-5c8bdc502a33@virtuozzo.com>
 <20201130153419.GA3277@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <b2a174b8-b85a-fc62-9734-4325a17c1e37@virtuozzo.com>
Date: Mon, 30 Nov 2020 21:41:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201130153419.GA3277@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR08CA0035.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::48) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:208:d2::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 18:41:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2a328cf-73d9-40eb-9041-08d8955f96f3
X-MS-TrafficTypeDiagnostic: VE1PR08MB5582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5582C7B386CD6168092E39339FF50@VE1PR08MB5582.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVGVaOEoGmln+aLWnK7kLOT/pM+m4LwDrXFE8yAQRKPVq9mTKVTCebHlVCRQEf0rP9mKFYYi67WhOW9OgiklPkze30qzBxFu6gYqe7YPh2Ns4+SAlG0e+EBCqQ9EAL+hjGWri2HQJig4htujuKp8IJkJodnOfKhCwljudWc/ALvo3jPALt00n42hk2OBlxDBhZcDHarKl6LjF3a3MoFI3RlvqRuQP4m/ShMFelM5mQ0jGlY+02TxKg7+hv5JBrrdAgYptEZJ2Wu0iBEb9slcxQPgA3RIASg9lAotdE/ZZ26OylGPQB8zp2BJewj5NhROyxFz1mzuxKsH5DwVgt0P5O1RRoE3mgqCP2pUsQRWQMgTEad5x80hTU5NsI8I7mNx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39830400003)(376002)(366004)(4326008)(31696002)(6486002)(5660300002)(31686004)(26005)(6916009)(2616005)(54906003)(478600001)(52116002)(16526019)(956004)(44832011)(186003)(8676002)(83380400001)(36756003)(2906002)(8936002)(66556008)(16576012)(86362001)(66946007)(66476007)(316002)(53546011)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1VlTGJmMmRKRUtraEVEV1VTV0wvZ1hGcGJOa0F1MWlWeHJFSkQzNXVjUXFh?=
 =?utf-8?B?TEc1LzJzZkdvZmt6aUpYSjFNRU9sNWFhbVNPMThoZjZWYWhXVmhIK2p5cUlq?=
 =?utf-8?B?aGs4NzY5ZmMzSVcyRDloalpxKzNWanhMQUQvUmZZTGNGaFRzSVpHN094OHJU?=
 =?utf-8?B?M3RtRjNCNWVkWXZIQlcyMFJjUjVKS210Y1hLODloVW9iRmxjMlhLNmxOQkVj?=
 =?utf-8?B?bUxqU3ZML1hvcnhPVWhnUjNjMi9tNlZpeW1VamlGa3VoRUhMc3pvbDhvemhP?=
 =?utf-8?B?ZlgrR2EzUEhkTlYzR0hXRTRpaHIwTXByZE15SExLRlZnUkNxRmFCalNONWxs?=
 =?utf-8?B?a0t0ZnE1SmVGejB1UU1PWENPempIUldyMUh4U0crYnJETHA0aDV6czJYSm1S?=
 =?utf-8?B?SXljbmoyYkhINnRlR2lDeWVQdmV2UkZHa3dFZEwxUG0zWVlvRWpOcUczNGpJ?=
 =?utf-8?B?djEzUFpIYUpUQnBuY25SV0ltNHZIRmIyb3JzZEFmQWxRQmFLNlpnM3N3K2U2?=
 =?utf-8?B?WHZCYTBrUVhxKzNNd1N4L05uSTk5dnJMaGpwV3FuUGhCOUJpMU9ORWJQZU0z?=
 =?utf-8?B?bFJTaG05OW9yV2N6bDZGT1lUWitwTThFMlljMkNvSExLQlpmS0puSlFWTFov?=
 =?utf-8?B?THlkbkR5cWpqaFdmSjdSaTErc0VUaG1iWUV5eHVUeEhwMTBVLzZvZ0x4Y01R?=
 =?utf-8?B?THljSEN0TzN3SVFzSHgzdE5iTnpCU2l6bzNlUzluZDFxSUJoeFBiRTU2M1Mr?=
 =?utf-8?B?NEExdEZiUUVldFl2Tm55dzZLdkp4NFBVbElwd2hqZXZJNFZtNEtmL3ZScVBx?=
 =?utf-8?B?Szh3elY5YjBONzRoamNId09MVXpHTjJGcXlMWWdsdW1tdnZiSU42VVRUM2ZK?=
 =?utf-8?B?RlBlclhibk94NzRCVGx5TGpKN2ZvRFdnYXRxeUZ6SFRhcTNNL2ppWEFBbHdq?=
 =?utf-8?B?ZExNY25WRUxuWFF4TTMvTHhJNWM5bi9tclZyMk9sS1JJSTRnenVJa3ZURU1h?=
 =?utf-8?B?c3E5MnNNS256T2g0cWpDcG5KeGdGQVNHdnp1S3FYTFBjZElucEJwQjFZV1RS?=
 =?utf-8?B?ejY4QmllUE8zWjBjQUxEZkdSOTd5K3NWS3dPbXpWZkxGejMwaUp4UHY5cWJG?=
 =?utf-8?B?eHl4VXgzWFFXd2c0NkFKM1Zpbll2c1Q3NG1ISVM5NlJoUG1PLzV1amdqTjV3?=
 =?utf-8?B?M2RJMitNcFVxb3c0NHJnTGZ2U2g2Z2k1WmY0OEswSVM5d1NBOEdmVWw1WTZs?=
 =?utf-8?B?aER3ZGJvQnQrc09yK0l6OFQwekd2MGtjWWhiL2hxQWd1U0xjREtjbSs5eHZj?=
 =?utf-8?Q?mKaz6TWWbcOIs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a328cf-73d9-40eb-9041-08d8955f96f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 18:41:46.2300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgGzDQ0Z3A6IDmniDvxptWATDDnV6uVJZ1KK9ryO+xeoVRtWwx0JgI2Or6u38JFf6HqGh27HWHDvLFGTNo8wc9O/cUn3uvIUI8oaPovq4f8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5582
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

On 30.11.2020 18:34, Peter Xu wrote:
> On Sun, Nov 29, 2020 at 11:12:10PM +0300, Andrey Gruzdev wrote:
>>>> +void ram_write_tracking_stop(void)
>>>> +{
>>>> +#ifdef CONFIG_LINUX
>>>> +    RAMState *rs = ram_state;
>>>> +    RAMBlock *bs;
>>>> +    assert(rs->uffdio_fd >= 0);
>>>
>>> Maybe too harsh - we can return if it's invalid.
>>>
>>> Meanwhile, better rcu_read_lock(), as well?
>>>
>>
>> Yep, RCU lock, I'll add. Why too harsh? Just a debug assertion.
> 
> I was afraid some special path could trigger ram_write_tracking_stop() being
> called before ram_write_tracking_start(), then vm could crash.  If we can
> guarantee that not happening, then it's also ok with assert().
> 
> [...]
> 

It can't really happen, but I agree that assert() is a bit excessive here.

>>>> +/**
>>>> + * uffd_poll_events: poll UFFD file descriptor for read
>>>> + *
>>>> + * Returns true if events are available for read, false otherwise
>>>> + *
>>>> + * @uffd: UFFD file descriptor
>>>> + * @tmo: timeout in milliseconds, 0 for non-blocking operation,
>>>> + *       negative value for infinite wait
>>>> + */
>>>> +bool uffd_poll_events(int uffd, int tmo)
>>>
>>> Shall we spell "tmo" out?
>> In the comment? I think it's ok.
> 
> I'd suggest to spell it out everywhere, especially in the codes.  But feel free
> to take your own preference.  Thanks,
> 

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

