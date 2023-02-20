Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1569CF12
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6sD-0002ox-T5; Mon, 20 Feb 2023 09:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU2BH-0003Uv-Lx
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:09:58 -0500
Received: from mail-co1nam11on20626.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::626]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU2BF-0002tZ-7j
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:09:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxDtUEEXmFN4Ea6VrQmOL6N1YPQBeSL9qOwqLt6lYLz7A0h/OLTZ/JPg1aGs+7OJ/7eKPppdI50doewaN2zXIL3j8qF+sm4LaKpTm26CMrFnWOchZ0cntDzhc7Vw7J26I7/zzNoQbyc2kDnWU1uy3szWRuC0qsyn/nt9Lj0GCbPGmD81y1LwOpBDDLOQGmsw4We8ribsITbL62ReDLfW6WbsXGE/MWkWhe8haILpsaYf9gTkQpzbROIXV1YCXzKSAnhnspUApxFxkFVc+hV7e/BPTzA4235t46TvRwZ8OZCGmPMVJ5GSwRsbRbBgFBNEN9YQ89lmOSFBd1SjdMAGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNePF/LAjxrXkVAsFRwYM/IYPbDSymPVWDFW78M945E=;
 b=hz/3YEmiirtCjQSl3iM+WOe9dQx6gDJGRL0rZCslWd5qJkWMfFwdQpQi9CD3Z0ydslyG3CCwcbNISiLJptSbSFg7Z2mBPqcuj6Fxt+2bt8ytweODUftGwpuBYBiz8S9Uv0vWu7r0KolSpMwDDJ1HroxfMR/3sRhOdhOS5XlQopIpaA11uxEb7AIslu2XWwKb+qf8W4BPhviqe7yQCL94bfNjWQB+kE+YqViujj8xP06Y+YYHShkgVOb5ViLQJ0C06X8qo38/4pP+IbHgUEsUXGjPMdergF2AbszfG4iX5ZMDilganxouIXmJcKoeLtha2b4GLtHQ5RBQyL+AS/YCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNePF/LAjxrXkVAsFRwYM/IYPbDSymPVWDFW78M945E=;
 b=U1YbFzsqZ2HRXhvShXW2eMdiljTz/Tb3wkc9HRgVNOSUilEUd04I/Xsup0lc+YG6U/P/9OaQxnAHj34wYDe19DxEu6LasDHqLPkC8RFpPfJFvA12Gx/floh7lqF1Ny6E102W3Jr7HGxD5ftTfqZcIRggIxCK5wb3SmoYavPAz+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 09:09:38 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 09:09:38 +0000
Message-ID: <cb86de96-8f44-d92f-f19b-260da1ec5512@silabs.com>
Date: Mon, 20 Feb 2023 10:09:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/4] linux-user: fix sockaddr_in6 endianness
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mathis Marion <Mathis.Marion@silabs.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-3-Mathis.Marion@silabs.com>
 <fc6b4e3f-378f-f415-79b9-79afbaef93ba@linaro.org>
From: Mathis MARION <mamarion1@silabs.com>
In-Reply-To: <fc6b4e3f-378f-f415-79b9-79afbaef93ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::29)
 To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|CY8PR11MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 735ee42d-00e1-40d0-a319-08db1322315a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mp4axcD7+1Qe0OwPBl7xMit9NKm7PI+zofdEbzcrKnL1c/3o9yJUcSBQqMZBrrC2AKfjcIrSfy5JV4RgSDEBkWohEQlpuXEoDCvjw8pfnlEEcy/X3eCqCs02CGt/NmIyAKWvmeXJGnpYIpcQlcrbWLFUe+IqNpw2t0e8gvSVyhJy5qJYvqhvsZCIBzqcRSSZT0setdWysUY369fitUywvWHMydya/hQIuuUKBcRKZ2gwjg+E3qqMAuU/LiVZKSKUW7eedrkGwWXbi8D1sALQHGf8mLFHmJ1RngcTrDKHHNgEl3iDCZV+jB5cP1bW3/PhKhBpe0uSVc0hb8Mimr+L4Lup66mlwC/x4Mp4ObmOoH5csepOxdX50BYMfkBWFfHCWTSgLrLGZHqNldfoTHzE0wd12AVSduLvwMfvTphXJsTuAOADoegMAQ+8DRa4cXuqnbjKMKf9lZZaxuugoI9PxfF6ZxM/Q9Cb4QZcP/Qv7RpmqpT64CmHKBzYhRdNMpr3BbYcitR+19p8pt8Kr2NSosYYpjQa4jG/zzEfITjO1HsWyo2+9x+D06H0rKBmtyNuzSimbMJxnK5KBk4Zwaf6MNFtp5siz4DirX0HZPmC8zVi+vrQjBxyMMSkVJGA1402AFxHmi56SusOsbeIniEt5mdweM4j7r5G+/oGOslVTFRlVpyjCIAS3O9F8OvgvKu1nJhG1+p1UP7uRI6ZjTAr1ngQZqiW65TiDIs7UL2mVqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39850400004)(346002)(376002)(136003)(396003)(366004)(451199018)(31686004)(6512007)(26005)(186003)(6486002)(53546011)(966005)(66476007)(4326008)(66556008)(8676002)(5660300002)(36756003)(8936002)(83380400001)(66946007)(2616005)(6506007)(107886003)(6666004)(478600001)(110136005)(316002)(41300700001)(38100700002)(31696002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1xbThScmh3Ry8zdmh1em9pL0RwV0lmZDlGZzJCOTZldDRMcVozdGg2aVow?=
 =?utf-8?B?N1lqWW12WDdKVU9sM2RFSXk5UTN5R3hZbUQ0S3ZXL3J4aXNWd0dzNjJibUl1?=
 =?utf-8?B?QXIwWWtJRDlkQUNTOW03R0VJb01VZzlONnBrUnlyOFVycWgyZlNWeDdiWVJT?=
 =?utf-8?B?M3ZoNG1ZRDVhNXJEdUZBZHlZNXU5ZzNsUmY3Ym12MTNvQjZvQStQbmU3bFVR?=
 =?utf-8?B?SjdTVTY5R1djU29pUGcxYmcwbFlOTmZZYjhURmpqeGp0ZWNTWkZNVG5mWWZF?=
 =?utf-8?B?YzFCaGxOSmVUeVM5L0lpWUN1eW1CUGRGYk1CT2pNY3l5SEFJMTRpN0NrcCtV?=
 =?utf-8?B?R003WDVCTXJ1YXB0dGtIUW9WRWp5ZHlLZnd6N1Bia0VNVnYxbEZ2eTk1MjRQ?=
 =?utf-8?B?K01WYTc3b0h4TTB6clpGenNMSHZFY1FTMEhQU2R1RGxsMlRrZ3N4SEc4UW9J?=
 =?utf-8?B?dzdoSDlQNVc1UE8vOCtpYlJtNWlUWnFyNmc4R0l4UTVjeVNPQjBmcEduRXEz?=
 =?utf-8?B?VTVRSnRJcUdYaFI2WTYzRFZMbnFNaWdTL1ZSM0plQ1Y3QWllRlhqYzRBeTBl?=
 =?utf-8?B?NVFmdGJnOStSUjQzZE9wdk43RU9BaU5DRVpoNmtwaU1CbjdRdW0wSzFsY1BO?=
 =?utf-8?B?MlozcnJTODZuV3lnTk0vZDdWM2IrN3JoSENTcWgrWHRYQTVTa0tHck5FUUMv?=
 =?utf-8?B?K0VnVHpOYTdjRGltTnJhMXN4OFI1cExGSTNGdmt0NWJFb28yVzFsMjNRdHNT?=
 =?utf-8?B?YzI4R0pBb00ydFN1Mzd6MmJPb0hKQVNiNDlyTXYrbXBlMUNMb1BVZkhlV1VY?=
 =?utf-8?B?VWhHQ0UxKzdFT0J4RWVIeVdFeGw2bjNiT2NIcHFNQi92eFhmQWIrUmRjd0l1?=
 =?utf-8?B?cnZSY2xpc3BkNVZYSjh1Wnp3bmVMNUFrVEl4NHlIVUFUYmV4MDlrUmlNWG1M?=
 =?utf-8?B?V0VzQ09hVEpWckd5UTN0dEt0cE5hQ1pJZjl4SnFTczVVa0hvVXFFSWhLdURN?=
 =?utf-8?B?TUphVDNSa3lTcWZWaW1SbkZsTGxWRS9xSkdPZWh5NXNkcDNFK0oraDh0eFRk?=
 =?utf-8?B?d2VzNWtHdm1LL1BKeE5SekY1eGVQNTNjSldUVS9nMkl5aHdsVW0vNGxjZitB?=
 =?utf-8?B?aHNPRC8zamh2TVZvSEtMZWpVU1AxZXd4NFZ3Q3hBbThsUlppeTBTM3AvbTRC?=
 =?utf-8?B?bnR3a0ZPTmdxcW9DUzNvOW5NSkxoSE50d25tVFV1STRnUGh2TllndUluK3Vl?=
 =?utf-8?B?eU1ZWGg5am9Tb1JrdE15T1I2NTJEclFiSmFDL2dDeDJsNTBLajQ5bjBsMVVI?=
 =?utf-8?B?Q2hDNktka01DeXRTRTlmVkdvck9FY3RVeXJaTW5Ic0Z4Q0JiczFUYWhKY1NO?=
 =?utf-8?B?OFk4cXpKaWh4eFVjQURwNDRQY1JOTHdRZy82U2FEMGR5czEvd3grVEkramZD?=
 =?utf-8?B?c1p1QVh3Zk5Gc3pFN29BNS9oZnlSTS92WTlxT28zSDIrRWJvU3RPSkVkbjN3?=
 =?utf-8?B?dFhtL0w1SDhiR0RFUS9SVDljbHBPWGsrclRjN3RWbC9Mck9mU3NhZlN1Ujc4?=
 =?utf-8?B?Ty8zS1BXWmdsck1LNUo5SlZrdU1zTjBvS1dtUlRLOWFrT0FuR0tBTTArdXJC?=
 =?utf-8?B?em1kU3NoYjJ6MGhma09LWEE2cjBKUzVYYVo2dWU0a2RaUHlxTVIrTlNncXFn?=
 =?utf-8?B?LzZKK2RuUTlsNDNHWTJTUG1taW5POXdGUENvaWJncFFCTm5MZUhWRDJoNTRo?=
 =?utf-8?B?RUVvNU5velNadmN4MURiQU9acW9DMW5YR2VKVk1nNi9MbHNRTm10MFdmQUp5?=
 =?utf-8?B?bUVpNFVtMndtTVFJTll2UXFCTzNBdjFwejRKRVBXRFdkMlk0Y3FOZDlhQ210?=
 =?utf-8?B?SXlpa0tHL3htMHdobDVlMXBoZHpZYWp5Y2FWNXVUZTgxR2lnQUoxdXNPSFJS?=
 =?utf-8?B?Q09MZ1p4WDVWN2M0WHFZbWwzS1JaWTJwTkU5R3lGbm1QYVFQdHRYMlJPSC9T?=
 =?utf-8?B?MUdncDgyaElkWTZ3NlNHM2UvNGlqdTBNUm9LTjkyc1BDdEFST1hKVnF6ZWtT?=
 =?utf-8?B?VldyWkYzZTAwN3B2R1MvemhmdE8rY2FlY1VabnFWUkRBQ2NlZ3pwZ05MWURw?=
 =?utf-8?Q?K5niCglMgKRv4u4yrBS5jz26t?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735ee42d-00e1-40d0-a319-08db1322315a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 09:09:38.1833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CceCHuwHLo7mFJntADGv32k+q15QT7IBnEAH5EGUy0C+Z58mBBnTOAbNVrUL25ZCz0wZe/dEs/6N0v7HTJBi3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
Received-SPF: permerror client-ip=2a01:111:f400:7eab::626;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=0.756, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Feb 2023 09:10:28 -0500
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



On 20/02/2023 10:06, Philippe Mathieu-Daudé wrote:
> CAUTION: This email originated from outside of the organization. Do not 
> click links or open attachments unless you recognize the sender and know 
> the content is safe.
> 
> 
> On 20/2/23 09:58, Mathis Marion wrote:
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
>> +        in6addr->sin6_scope_id = tswap32(in6addr->sin6_scope_id);
>>       }
>>       unlock_user(target_saddr, target_addr, 0);
>>
> 
> Same content as v1, right?
> 
> If you don't change patch content, please include the reviewer tags
> so we don't have to review your patches again.
> 
> So similarly to
> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/6be6bf58-cf92-7068-008e-83f5543a1f01@linaro.org/__;!!N30Cs7Jr!X8OE0Z6gfU2FYtWrk0_Dhk_gUPlhqRPtJ60B7HxeicEaFDDFCLRsmoqhnC3MXGOw7ZfEkgLQhDwsyQv76w$
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Yes, I am still new to this. Thank you for you consideration, I will
remember it for next time.

