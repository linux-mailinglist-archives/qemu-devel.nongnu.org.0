Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7418A348DAD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 11:08:26 +0100 (CET)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPMuf-0008Us-Hn
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 06:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lPMsy-00082U-Mh
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 06:06:40 -0400
Received: from mail-eopbgr30113.outbound.protection.outlook.com
 ([40.107.3.113]:25302 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lPMsu-0007db-Uo
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 06:06:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ3U6iLJeWJw3CoYOSzyY5jFJrPBr6AigQRs1ry9swciaPWtGs4fiTnUacm1kYif0jR8I4xdKGCXarDyfJ3tfu6MT0ilTzvBZ4Jz8JOU0IX4A+2u2VXG06GLo4WUHUWLpLeFydzzZN+UVH0CDeEONBTU+wqK6mNFhVn11N0gjaaWw+sBcPRtmPJBXjl1OGU2ycT9y/gNaXs2WXG3jikaYA1bRrk1/zt2oJPNg5ns+Q6rkjiGlbsXjzsF2ZarTfRC9wsTYePOzbi7nxPU534FsrJ4dZI/rclZGpxAIFQej6KZJsFOypMYUdG3iFWoEUzximgRKwDmcD7CY/MFJJ5Cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGF/LkUrwp92r07I2QbLWRk0HfEiUctvwKAP3bMZl0w=;
 b=nIUCZfaM/OWe/u+6mulFUAQNaBPjUlm4s39ya8b1NIp8G59mU3CX2fxYIIeh13kxeGeqS4LS+xtNgpbvBqhVGhuss5KPk/92ErchOd8LdXPdbtQhnKMRfe4dNqnQh46EiRjA3Sjcqk/Eu5tLhUfJl6jPqPkp6/BZqoJF5jlZ8xYHw2NnWDQPzdatpuCfrjV5wtVsxwmJG+b8br6NvslcXcBy9P7M6JFsaa2z3wwSFZ4fiDk6IYtgRp8yt7NKvPlJlN24cIe4CshwKGcAlRz0DlsbasF8e+SM7/IXCLMTgNJMgVPQiSz73jZC9kz3xTzwESUDMlX+sV9OWupN3CL4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGF/LkUrwp92r07I2QbLWRk0HfEiUctvwKAP3bMZl0w=;
 b=qR1q5RBeiQqnZC3IP/cuaMiF7rcnCIsEKLhhduh3xPx1xWfhb3Frao0wlwd8FDRnZ9CpyF6BPCkLMh2fu8XgB7yGkwA4CveN7kgsGkP0D6hc7Q/1bNPo+tV+GMhZJ4os9KjnByurIryLBg1vd66+q64NVeMBiSKUWqXbGivcUfA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB3844.eurprd08.prod.outlook.com (2603:10a6:208:101::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 09:51:31 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 09:51:31 +0000
Subject: Re: [PATCH v1 0/3] migration: Fixes to the 'background-snapshot' code
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210323222155.GA219069@xz-x1>
 <65f1ebcd-fac9-0923-33e7-889946066b40@virtuozzo.com>
 <20210324154158.GC219069@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <a4c76b56-a57c-8e4a-0a2c-78a6b9136c1d@virtuozzo.com>
Date: Thu, 25 Mar 2021 12:51:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20210324154158.GC219069@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [91.79.54.152]
X-ClientProxiedBy: AM8P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::13) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (91.79.54.152) by
 AM8P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Thu, 25 Mar 2021 09:51:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7585b52e-877a-461e-a212-08d8ef739167
X-MS-TrafficTypeDiagnostic: AM0PR08MB3844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB384496A2F0F14084C50ACAB59F629@AM0PR08MB3844.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B3uTkFqUViuW85l5KSP2z/cmWm8V1eRfnCy//oNUjLf3pOJRx/pJGaTG1y28sUEYZLstTaSoDKu/MV/2WFwJxNBm3mzjsXBER7CiPyXr0SA4LOYIwcIOiMjPg4nq45wiCA5JCoMk1LXHpnuuUEdwsaX62IRFdhMa6e2iLMuhLQrMSJIWkn/11fNWRI+M/FffFAK0K11d2UiBWuFJqF6NqSKWZztuYqOp72NCD6PnLff82lOXuItl3Gg4UPeksYCUoTPvlC/Uoh1bnL+epvMlU9wrLdH53JHHNmGD886yt/3+xsyBG3T1gyaqeVqD7OsFbeT58ODutoNmzC6afTw9mP1ISeGittWxZoRUzKhH2nmlJQF1cEOEdAFJDvxUkuXKiC2aYyZS/+BFj4yS/iotxWj9dGlLu+hdHa82hFkqc+zYWgl+ftlBz7Q/K9kcLCpDl7nk9PSEnv4J2Pd8OStVisC3mhoEk1zbGrIr5Josp7RJMZjwQu9y/YoI3IzbpRa4OKMySHd3DQlYMby1HqVk4lVmVplc//xm/1I9HjVJyusLGM+q98m/6B7BUUOwCyVf6o3OGNAbjL5jAkxOlBZflzz7SzAGkuKUOiujJppPsdIwqHSSMuZR3eLl365ZC69DQGSW8W2iaGgK08wz4lDZfHkRw2ztXlIqH0x/TSCw+WbAd9mRcHrTKu14yYh4bFXWBLFvgbANvN2oNWFux/kRFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(366004)(396003)(16576012)(83380400001)(26005)(8936002)(53546011)(36756003)(6486002)(86362001)(478600001)(316002)(44832011)(66946007)(31696002)(186003)(16526019)(2906002)(6916009)(54906003)(5660300002)(66556008)(66476007)(52116002)(956004)(38100700001)(4326008)(8676002)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVBuNVB0TmFLbU1JSFFNZEJwWHNrem1NS2hHR1FmSUQyQWJyMlhWZllQOGxS?=
 =?utf-8?B?by96cmJtM2JSSmNySEQ4b2tQb0E4ZE1IQXV0RDhOQzJYakNBNFMwdEg4Z2t4?=
 =?utf-8?B?TjR5Y2U2NUo0UFRlbkl5YmZzc2IrMm9YQ1Y4R0J5L1BXcGt3Ung4bHBjc1Y1?=
 =?utf-8?B?NnlWbmIzL2N0cm4wemhGaFZmc0grZHNTSmVFNXV0QUpyS2xyWmdDbTd4NXFB?=
 =?utf-8?B?aWpvVjVrMzN2L2RCM3ZtaGlFV0lTdE9aRGxtQkZ3ZjlYS0JWdFpTSjdsLzh0?=
 =?utf-8?B?TkFSLzQ0WFgydkd0Z29XMXU0K1JHb21ZVkp2WGQxcjQvbmM4S2gvWmxabjg0?=
 =?utf-8?B?bHJ6WWFzQ1pEZVA5dndocHV5UG5RVmdEeTdpOVN1RWd6a3VNWmRoZGFaaUM3?=
 =?utf-8?B?UlQxOFE3TjlDaTJVcHZ3OXU0c1RzRENGd0VlZms5MEh4clhBeHdWNWJ4aHRL?=
 =?utf-8?B?eDMwT2lPZitiZnhJSW5hRUp0TU11NjM4TVFEbmVMN1ljMlZDOFBHZmNZZ0p4?=
 =?utf-8?B?U2N6anA0bnFUbHN1MC9TRTNRN0d4QzRyZkduelBUYUNsaE8yY3R1dkw0My8r?=
 =?utf-8?B?TDA5SkdJd0FNOEcrSW41dEFVZnpMVDNvWU8ramx1dWlxUlpHWGJoOW1NQjBN?=
 =?utf-8?B?OWhNSUZHWkI1Qk8yTVIyb1dBRG5GZzFMYTErS1owM3ZFVTgvaTRjKzM1SFpR?=
 =?utf-8?B?L3ZNV3B5cmc0aGtMNlgrK0NETkFleVlDVHczNVVhMkNvaHNJODRrZGNuVTNC?=
 =?utf-8?B?NFg0WFFTTW5GNWlzY0kvT2J6NmlWS0NxZStNUXQ5ZVkxVUIrcnpWSTdhUXY4?=
 =?utf-8?B?aWwyUGZIbHdvazUrdGYralRBSzBpVURxSGprSTQrY2Uwbk50dDM1QUYrY3I0?=
 =?utf-8?B?cWRmbGtUVjlwcVhXLzdsc2NaNG5UUUUvN3k4ZTZSaTRndXl3NHJDSzVoUEg1?=
 =?utf-8?B?MUtQVVRTN3FqSm9oN0ZXUHdBWUdQSUVWaW5VOExpQUtMN3UyWTJNc09BSUdR?=
 =?utf-8?B?a2c5WEI0d0N2bUx0eFpwRWk5STlNNWVOalFmWkFnVXlEWUxwNjJDTCtGNTJG?=
 =?utf-8?B?c2JsUkh4a3pMNVpEaDBIOEpDcXl6aXo1eVNpSlk2YW1LazVwVVAwUlgyZGxw?=
 =?utf-8?B?WTRtTXRSRkdQUDJQK0JBUHNKTk1Fejh6cUpmd21rOExCTXliZzc2ajNHZEUy?=
 =?utf-8?B?WDQ5VTRlUENOSXRsanZRRlVXTGlvR1htLy84MXJjcFk3WG1ZZWZyTXB4M1Y5?=
 =?utf-8?B?bDNuRTkwdC8xeE8xNS90TDJtaHdxbnZGbHNLRFExelBCRlJ1eGlMdUp2T09v?=
 =?utf-8?B?WXArMDBvVHR0WXhjOTBEdEZhMDRXR1NhSENlUmRNT0NyK3M4VXRkMkFwL25F?=
 =?utf-8?B?YXV6RGZibVEwZ01EVkRDRlZpQjg4Yk9ySXEyMXFxRDZLL3ppT0plZ1Q2dklr?=
 =?utf-8?B?SVBUL2VNclJsU2JFc2QyU0d6VlRkRS9NbFAxaW5xeUZNM25KTWJLUnhqNjh2?=
 =?utf-8?B?bWNFSHp3TUVlbE5iUlRYR09PK1ZiVmRsZUtidTgxMERaa2VoSWVJdExhcGFO?=
 =?utf-8?B?cnZJd2xrSCtrdlc1RVlVN1AxazJ1QTdtNTZmbkNmWVZzSVBubnZSb0VWYmRG?=
 =?utf-8?B?RzR4ZGhPTXdDeHhFSENXcGpQbExCZzZIRURuRHBYVHZ0WjAyMHRwbC9lNmpj?=
 =?utf-8?B?QTd2TCtiNUE3bEVoWXZrcWNwTkZMaCt2dHZheVlCTkdNbHYyTHRlTW1wdnF4?=
 =?utf-8?Q?L7w8rkQAONwSC6Hxj8Fr7cLRUvdUkF7/N18r/gX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7585b52e-877a-461e-a212-08d8ef739167
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:51:31.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evBDANVFUCU3ajzxzP4kVpolNyYujow7HVjltraeTcWN1GI0CY4fI1J8i+EVIBYisMVQlooNAqYSE2mom3pCwDcKjG6NeJO4ByQI+aZn54E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3844
Received-SPF: pass client-ip=40.107.3.113;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

On 24.03.2021 18:41, Peter Xu wrote:
> On Wed, Mar 24, 2021 at 11:09:27AM +0300, Andrey Gruzdev wrote:
>>> I'm also looking into introducing UFFD_FEATURE_WP_UNALLOCATED so as to
>>> wr-protect page holes too for a uffd-wp region when the feature bit is set.
>>> With that feature we should be able to avoid pre-fault as what we do in the
>>> last patch of this series.  However even if that can work out, we'll still need
>>> this for old kernel anyways.
>> I'm curious this new feature is based on adding wr-protection at the level of VMAs,
>> so we won't miss write faults for missing pages?
> I think we can do it with multiple ways.
>
> The most efficient one would be wr-protect the range during uffd-wp
> registration, so as you said it'll be per-vma attribute.  However that'll
> change the general semantics of uffd-wp as normally we need registration and
> explicit wr-protect.  Then it'll still be pte-based for faulted in pages (the
> ones we wr-protected during registration will still be), however for the rest
> it'll become vma-based.  It's indeed a bit confusing.
>
> The other way is we can fault in zero page during UFFDIO_WRITEPROTECT.  However
> that's less efficient, since it's close to pre-fault on read but it's just
> slightly more cleaner than doing it in userspace.  When I rethink about this it
> may not worth it to do in kernel if userspace can achieve things similar.
>
> So let's stick with current solution; that idea may need more thoughts..
>
> Thanks,
>
Agree, let's stick with current solution. For the future I think having 
a registration
flag like WP_MISSING to induce per-vma wr-protection is not a bad choice.

The reason is that usage of UFFDIO_WRITEPROTECT ioctl is often 
asymmetrical; we usually
write-protect the whole registration range but un-protect by small chunks.

So if we stay with current current symmetric protect/un-protect API but 
add the registration
flag to handle protection for unpopulated pages - that may be worth to do.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


