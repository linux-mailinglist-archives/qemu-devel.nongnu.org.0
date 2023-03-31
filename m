Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8E96D162E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 06:02:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi5wU-0001YH-Q1; Fri, 31 Mar 2023 00:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pi5wS-0001Xi-3i
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 00:00:44 -0400
Received: from mail-psaapc01olkn20803.outbound.protection.outlook.com
 ([2a01:111:f400:feae::803]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pi5wQ-0002Hb-GH
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 00:00:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt1WI20rmonlH8dJ2Xg+sHHK+Jf2phUKv80uihnmqVBq84a8saDvom7AvXVFjiSk7FyT+sCxM34pWMoVEVeum3fSI0AcAJQCcaWWfyHOWBd34+qzbb/7pCwKLfi2e5VttLlLYZwjsuQJIM36WKdFI4jaCh+r4ljRs2GLq5HSmH6aixdqJv8OqJc/2iUSK0s/mvTo5dXVqynyUsXAxUfE5Lfr0rQ+JiT+tpAs6iXVLB1cfo9umKMgxivEhCHaJphWKcksF2IT5sNa8RKm76Lq36RnPzlBD6umhp4CiVVKTgFyDbtlZJ2scMr6/a+4/w2DdsyZeH6l48H3BEbqHhmYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI4YvR2qa1XZ0f2br6zgk0fKFyxUL8qgx/48ZRkDUxw=;
 b=ZNmsawWl+JBhx+Yaq/Zsvdf+t7JtPobuLGFnqZ6UZDvjOxo4xqplhAKURLKLOkz3hyWTR3ZsAUwE7Q8O8u5oycc5/oUJVfrl5GpYgl6UbxmJli3N6zaMnv6W5aFZDFSvKqCwcsi7hDZO3MbOxNSu00XpEepsq9shvbirOYgArVf8HGKA6vAWkA1SXyHn5Vag755eO0jWUUdUavnnLk56Fs/g7LMELIJu6Pq5VTWhzPbh7hT+WlbTiSaHHqtGQS/X8qWN6M7jB2yDXzzsoaMMm7nKHFkDFCh71r+qYimiBJkua4tddM0wCB2kZi7aHDIqyf2FKV2f9csnpYTwIYTj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by SI2PR06MB4138.apcprd06.prod.outlook.com (2603:1096:4:ea::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.22; Fri, 31 Mar 2023 04:00:35 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6222.034; Fri, 31 Mar 2023
 04:00:35 +0000
Message-ID: <TYZPR06MB5418A3EB07F30B8AEC1A28229D8F9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Fri, 31 Mar 2023 13:00:34 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/4] util: Add thread-safe qemu_strerror() function
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>
References: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <TYZPR06MB5418A6BDB94FB0D97ABA31299D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <87edp6oy7g.fsf@pond.sub.org>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <87edp6oy7g.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [yucx7oYn+m74Uc3JVgcSeizojyMRXCxfWIU5LSKwxy7E8ZEaF8Csxnrr5X7nWA4hSqEzax0Xbrk=]
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <4b6613cb-a61a-653e-2588-c267396e8781@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|SI2PR06MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: b8afb34f-9721-497c-336f-08db319c7b25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlfXDTzeGBetmoCWqDF57h4DnRbwo8o8Wkd+iaIL6Ni4G43Q9aNonh0gT47NAuscjk8f6PKAMfGlU3d+KEi8gbW1Cgs3mzKYXk03iJQeE4RSyZhI1iToaDaBelXsfmHSQqTpaInU/4NSnK9bGHu/vbHGbprXjuDGIpWplfSpplU5eOia9HjgA5SHSnLm/0oha4owVQbaza5DlJlErnLB6flNAOqM4iuFm4TDYH+yWVAQ2bbUEs6tkSk1OfRQLcCsIzzc+D3Oqr54K84nDYuy7EMOfUkkVW5z3kRB4crfVfZ4zHIGs42S1SC1s3+sx+h9P0pMrOCDmxQaXPMUZEDn8/a5Jj2Uh3lm8p+vJKVs4bvI8AjLzRUIKNvv2++6eiHCtavn2zuSU7cul2VUVWYq5uWHg+cVB/szE4N6y+FU168LzhpQHZ1X7Sj487PZ1Tf/o/QgLL/KtdqXLCoojpvO5d4m12+obFrrUIkUKeYKSJhkbzUBOb+NxWR9CPav4Znj2fDptdb35PYpI/qIJQQj64e14QPCD111OeKhkMq4mlaQVBFusBq52v55CnhUS7Qpe+q4WTLOmhnY+9klU5u9rJb+e6qqPlI8GqxUfsHIozs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDQ3WEJrZmZ1MG5LbVErTlMwc1VuQjNmeWorTXYrU0xJZEd4amdNVE1hWlBz?=
 =?utf-8?B?NFdDV0hXRTJIa2VKZ3pyZEJKWHZuZktUcGg0U1oxeGxRTmREVHZTdjBJd1Ny?=
 =?utf-8?B?QjU4cUs1QllqWXF0SGJpVGQ1dEpKOUJhTVhkK25EVVE5QWZlQWxpOXg0Skll?=
 =?utf-8?B?MjV1OGhENTkvY3J0TjM4UEtvNzRGcmxodkoxRFo4NUxBNXRyYTNsazBLcFFP?=
 =?utf-8?B?QWxqcDVaSlllMkMzTlVrMThUV29nQVBqaE9WaHZ1a3lUQ3pTWkFOMzJyOHRh?=
 =?utf-8?B?Yzk0K1N4ZDhadW9lUXZYOTc4YWN2dktwYmJMQnNRS05ZZWp6VXMzSEdMVkhY?=
 =?utf-8?B?c2FqTDNvcFJRVWYvZTZXd0tFR084a09mUi8rVHZGLytidVRFaUUxYk8rdVNq?=
 =?utf-8?B?eDAwOFpOSFFWSWoyaXJmdS9HdmorQktNQUE3bW52ZmxDSlZQN3hvYXVLTSs4?=
 =?utf-8?B?TUtPamU5YXQyVlFGNTVEWExOMW5vWnBJSW5GUGFTamlaMmhBMGdFeTRjNThB?=
 =?utf-8?B?M1E2ZzZUbmY1N0Z2VXVaWEpGOCt2c2FEb0hIN0piTVBIT3MxU0ZQQ0JyazZ4?=
 =?utf-8?B?emlrTHdpQ1hEaFpEOGF0NW8wMWl2SEpvaFVzUmx3TGVqNTkzODliZWZOMWpE?=
 =?utf-8?B?VmNvK2NDUm5CL2x3K1JVVTBpN3dqTGVZVnBCNVNSdFBkNXAzbHVZWXpIZmpQ?=
 =?utf-8?B?blZMbWVnVEx1eTRIQnJhQkNacjFrTFdSWWpGUWNiTVhud1RZaXFXU0huVysr?=
 =?utf-8?B?dnc1OWZBRHU3UGI2RDVMVWpEY1hvNHk0U0RTYmhwVGVDak1KWG1Eb3pmZUpX?=
 =?utf-8?B?VjhuMzZDbG41SzZSaDlDMUxvVnY1RldPSEExQlJ1dExuMjMzOXdyeVRJazNC?=
 =?utf-8?B?UXhTRTdTM3hldkhGblhRZ1hRV3JTOXRvbmFOM1d2ZGQxUW1Cc1RSYmVnOE0v?=
 =?utf-8?B?ZjFsYU5BbUJUUDd1dGl4eFd3UENEeGZlZm9OZnlqbGQ4dFdDakZhZHdBR0RY?=
 =?utf-8?B?WlhWU0U5TDFkOFlvdUhjN0R4cnFwWWpoN2U1QzlBdHcybVpuZmZ4Y1A0ZEcx?=
 =?utf-8?B?aEtwMkhrYXpRNzNNRWVYK2JhalBraVpLdC9QM0NWazB3Nm0yZW96bE52NzRp?=
 =?utf-8?B?TWRETVVJVVgwNVk1d1BHVXJjODVZdExpSmhHcTJTeS9sRVlMOEduY2ZXdVBH?=
 =?utf-8?B?RDkwSk1KUWR6NFpuRitTVkZSazRzRnN2R0pKcVFUK2NBcUdSbDcySzlndFhQ?=
 =?utf-8?B?YnM3R0xIQzRGb1lIVVU1M3d1Q3FoaHpvbkZkZDFxT3RPMStpd1p2OTMrNXV5?=
 =?utf-8?B?Z2ZZbzhGbXFGQmErRUZGaE9qVEdrNFhhbnM4ZmxLNWVQT0pvV0RkZ255M3ZT?=
 =?utf-8?B?Q3kyYnRuamRnVlBnN3h3VHd6Z1FQQmxJQnY1YitUcnRVK0R2TURLak5IMkhQ?=
 =?utf-8?B?V2NJcTQ0cXhWUXQwc0FKZklJNUgrTGlWVHZjN3RPT0ViYmllWnROZXY2Mm8z?=
 =?utf-8?B?MnQzUnR5c04xbVp2MHFQRW9vNStvaGhMdkhudy9zTHgrL1hpYVFBdGh6QjhQ?=
 =?utf-8?B?d2syejRwVW9CNzNLSHRhR1drTTNIUGFITzN2VE5HNklPWjZaVXB6MmVpWWZL?=
 =?utf-8?B?S1U1RnVTWDFORmlKK2dUbHFkaDloUGxmUkgvVXg3MThGOGx6ZVdqWlVpenFw?=
 =?utf-8?B?ZG5tVWVsMjdoUDAxMkhVMC95UnhyS2JWcEV3T2JySUx1ZW9DYUZZRVNBPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b8afb34f-9721-497c-336f-08db319c7b25
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 04:00:35.6339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4138
Received-SPF: pass client-ip=2a01:111:f400:feae::803;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


On 2023/03/31 4:06, Markus Armbruster wrote:
> Yohei Kojima <y-koj@outlook.jp> writes:
> 
>> Add qemu_strerror() which follows the POSIX specification for
>> strerror(). While strerror() is not guaranteed to be thread-safe, this
>> function is thread-safe.
> 
> Why not g_strerror()?
> 

Because g_strerror() uses mutex in its implementation and there is a
risk to occur the deadlock. If one thread enters g_strerror() (soon the
mutex is locked), then another thread calls fork(), and the forked
child process try to call g_strerror(), then deadlock occurs.

>> This function is added to solve the following issue:
>> https://gitlab.com/qemu-project/qemu/-/issues/416
> 
> The issue even asks for it...
> 

Originally yes, but Daniel told the deadlock (or a mutex starvation)
risk for g_strerror() in the later discussion of the issue. Probably I
should have mention that in the commit message or the cover letter.

>> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
> 

