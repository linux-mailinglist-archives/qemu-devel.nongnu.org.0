Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9746788A7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:50:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK3l0-0007wH-Bn; Mon, 23 Jan 2023 15:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1pK3ko-0007pj-MO
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:49:22 -0500
Received: from mail-he1eur04on0703.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::703]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1pK3ki-0004CN-Ek
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:49:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ien5f3kk89yXZiXjam8vA92J//x9fG5r8KwSii7dHp0KJGE2Yh+4HkLyoiZAvwmhDUlpIKVP1a4glmh0OQW2pfvvfXFZlDGCp/AhbYwkdoOalOsV4CHAOzcqSxpT/afzxdvekV7S56nvfeC3TXVVtx+rofJQ05gdQOguQcFYpTFcYwsUPw6UtqCgN1+t/mzHtggvSNXl2KmluRCtSGr5CugjYu7UxfsHOh3Z4KSyadhHb9SgbMnFCyAMZB66yci0iUNskDJ+EgbyVkIs3hHFdg9vpapEgwtx7AxE7SAipcEUNMbN+KuqytCku3hXSEBzH3j2o34IPJGQoOkLOIw+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9paK63I4vNhhm//E9FgVGj4UUw6NATfKJZxew4aGMk=;
 b=h1ZBwnoXUqhXysmE7Z5DPc2sqYQPXW//cJVjgdSXo4NoE9aRpvSfXnssKCkjdqGZZNtptSCeyt3K7z1D6eQ+Pmgh1UhEHuFkohyJQucnaX/7icQn07E92BPfbJ9nUBXzFzo8lFTV+r+fP8DIH0PQLdAnSIPO0STBDDgiYg7XGb9csO9eJvZqfrtU8upLu4cLzDPuVG+2VwfuZgmMt4lmr6+Vx1bDpC4gMMWD99R9wxg/EzHiM8zQ13iEGQ/fBnEnPyTxheyHqdLSzJaqsxbv4J4wwsw4F6TEYY4KQ1RpmhVMwNFXAsi+uIaUXE0HRgLxZk20dBuB++B1xP0cJt1H7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9paK63I4vNhhm//E9FgVGj4UUw6NATfKJZxew4aGMk=;
 b=EYaW6L2WXkL9hq7C/R+uEk46evkxtFGJWMdOpdXOBKI56FO7ENSAYv3C0rkg+BipEtfFc6l5V0fp8bC6UDaYZQH5k18MkN13dksOLY/+gSYVnN2kn5xYvzNEQ2VjytRkAv4J9g2qv7WQQyq2mBzTsBW+0SIKCha7zlDv8+AA3hHsm4EVeiuTKw12XUwtE1EJxlAYEOCLN8p9GSimmWf4blcVW2zOA1al1BPPpfsUPx54HuZ3HzOKm2NQXy83hWQ3TeVeN675DtHpvFRfJEnfoyeUZmV37ZhVf8xzCzL8YuenKlxAvKxvyAe1UYuGjiTv3gsbu16mISkNgw/cVLofhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS2PR08MB9894.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 20:44:09 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%5]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 20:44:09 +0000
Message-ID: <e8cf7c5c-776c-dee9-372e-bb8b1e9ff5a3@virtuozzo.com>
Date: Mon, 23 Jan 2023 21:44:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] qga-win: add logging to Windows event log
Content-Language: en-US
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: yur@openvz.org, marcandre.lureau@gmail.com, mike.maslenkin@gmail.com
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
 <20221129173809.544174-2-andrey.drobyshev@virtuozzo.com>
 <d5b918b7-dae3-3084-d0fa-310d8c26f43d@weilnetz.de>
 <1330af6e-ee4e-2e1f-f7ca-bcf0109de786@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <1330af6e-ee4e-2e1f-f7ca-bcf0109de786@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0802CA0047.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::33) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS2PR08MB9894:EE_
X-MS-Office365-Filtering-Correlation-Id: 6efe0f18-c106-4212-2eb0-08dafd8293df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +D32ni3Rn7rArQY2b8pT4UZ6p8x/cgsTFjaDQtBRDuPqdSkS5xgxIQgCSs+a3MWK/RoVGKgy0feSdGqGitmJwVy324B2YVpnd/RAuoVcMFCYeCTjDFttie049F6nRzbIY7/fcAALiDwZ7pDDfwxYncIsrsrpCWf/8QkHJXYtLolYpnWIBnFqwuA8tG2mY3jSul96JIyd37gSYsSRCPRzyA4B79nwfCF/Hx/Zg4KvMW1QcSvHCclGirFXt3hgr3E+5/AgOLibwvTmYTW8RxiPIEwLMOCX/6mGv7/iUI1Ulhp+f2lTBfSeUAMLED6YWe+mBYkD2w4loKX+QU9zJoeDyvNqrJP+Q9cTHxMbzJk5P5xNiJz6TrBcbfX6o5/Gn/Ec4zeEFmqA8Dq7ioh0iKTN5X1kWil69uaF1QOK1Y/aBdJeFgOYPkJrf+K8ee6f/4tcGfXudg04+CSnQtn44QvVhEbDtNUNRFp7DOxOmQ1C5D3XEHkXDJk7Z/hdD3nfRJaOJzAtBT9BAf2Y074hvcT6jI/Z+k5TSKFaA4lJxacqFEdxKMNojDNN6et3KIPNRkzyD/G4Ft8M/sGOgncQ0TTvmdP4fl/VMp8TMPy+H55WzR+EtnNiuVph6X+xqbevAu6feKUzrvN+22KU/kSP6CZGbeF9oQCgawyxgHLgT0K73eYoFNjUuwXWUmAaIyH/DTVOd1bFotEZedyIVQHPhDnCL6uB0l/3v+hxM5JmEZetSzS0MNS+l1ZjugCtORH+OuEugi9mqr1N54f6ne88F6TPBFBwWCE1FW6nJIlRO5yhr9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(451199015)(31686004)(66946007)(66556008)(4326008)(66476007)(966005)(8676002)(6486002)(2616005)(41300700001)(186003)(83380400001)(26005)(6512007)(5660300002)(8936002)(2906002)(6506007)(53546011)(38100700002)(31696002)(316002)(478600001)(110136005)(86362001)(36756003)(45980500001)(43740500002)(460985005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXFDcnNDdVBCNWpad2FrdWFaa1dKaXFaWlZaaWNPMDFtZmFOZVBiVEkvYm1y?=
 =?utf-8?B?YTN2UXd5KytONjNNd0FnbWFyR1NwRGMvRHc4VzhCWjZickkyVWVPVHM3YXdv?=
 =?utf-8?B?dzRHTEkyVkpDS3lqeWxkcU1keG94SmM4MmhzOWJiaUVLOVRmSUt6ek9yZjg2?=
 =?utf-8?B?V3FOc0xGU3JQc1dtNHpIcFdWWWkwTTRqVnZrSE1YMnhwUnVyN2ZTUHl6TEJL?=
 =?utf-8?B?S29PM2xuOEhCY1piV2dWRC9mMGNzbXN4OTljRXZhb0tlZ3dmeFZHYUtzNnUv?=
 =?utf-8?B?OFU2VDk0Z2NXRDlFemV3VTQ2b2k3YnpJL2N1NnYxdElQZWo5Y0gvZUNWZkZR?=
 =?utf-8?B?S1ZiQVV4clZlOStVc2ZEcUlibHlOdzZFaHpuUm1KYlRHbjRtZE96emdaekRZ?=
 =?utf-8?B?NFZMNDZPeXY3WTREcGo5Wi8zdjJqcUdvRm1zMW5DdXJJdnBmelNTNHVjaW8v?=
 =?utf-8?B?UURodDRaUFp5c1NmR1dlSkFweU4zckxsb3hVby80cjlNYjZrSXRYR3lEamox?=
 =?utf-8?B?c0NxY2tQOWIwMHpwMUxjbG01Z3IweWZzeC9GSEthQ0ozejV6UjRLOVh1Q3dO?=
 =?utf-8?B?LytmS09mUEppdmV5M2MycVJNb2IwSHEyQXZxaXlqV29OendTNGtNczJuQWg5?=
 =?utf-8?B?NkVnYWV5OWRWV1V2b1c0VkhuZ2o1NDhIWXdBRFlxT2ZsYWU1SjdMK0tFamJU?=
 =?utf-8?B?RVc0Zk43dUxIWEkyQjNHTEkzVGtpRTZpbjdGV3hzYU1pdDQwK0RvMHJSbWpN?=
 =?utf-8?B?MkhvczljMkVIb2VIclAxcXRVSkV0cjZBT3BNVHY1WlpoMThWVklwTExOTGtO?=
 =?utf-8?B?cjlzUThIMytUdFdOWUtFa3U0eDZHbkZTQVN2Vm55cHNaSDZYQVR4STh5N3o0?=
 =?utf-8?B?L3pkYW1FR3hnQVFVd3YvT0Y0N0lRQ1E0L203aVVTSjJmM0RXQU8vQjhnYksw?=
 =?utf-8?B?bEtXdVVRTzgyY3cza1h0VzZQR1kzeEEwUEh0WFlrY1UwdEF3UzBBbHZYMmVJ?=
 =?utf-8?B?SFEwNDd2YmphQlpwK3JuZERuM1pGVGV3eW5tNWYrQ2d6bVA5MGhGYzRISmpN?=
 =?utf-8?B?em1NSE5nTWdwRDVKbWJOYUJSdzlUY0FrUFdtUWV6N0w4VVd4MDA4TVNXYTRU?=
 =?utf-8?B?ZGNnRHpndzlqcHI2RFVrbE8wbklqaGZWSjdTTHhZZmZ1TlJGZWpwUGNUNTZC?=
 =?utf-8?B?dC9PYWtKeUxFVDNWejl3b2c5WUVjaHBVRFVIMkFrdDJXQXZmRWlITThPcytY?=
 =?utf-8?B?SHFDc0c4a0h6OWY2WDQ4N3kranplVWhLWlJLWkhjeHFoKzRGYzVYb1R3ZWxC?=
 =?utf-8?B?eXdIN1hNU2V4dWNNa0phSDNzek5rRUlBQ0RobDFpb25aejZxQkdXUDRhaUJ0?=
 =?utf-8?B?Q3I1UEJhMHZyNUZpQ1N6b21KRTZtQStFOW5MT3BQT3h2WGZBYVJEZU5aNU92?=
 =?utf-8?B?SkEzVFFtRC9MQ3IvaTQwOG5vcTUyRm1tSThTVzF0U293ZTRMOHZxWGNOKzhF?=
 =?utf-8?B?bFlGSTBETytlS2RxMy9SejBKZUxvcVd1YXFsU2czakltMWpnUG5hMUd0a3FF?=
 =?utf-8?B?LzlIWnNrTlVwWDJiNGR0SmNKcEI1cFN2NW9NblhaTXQzTU5FdUZKdkp5K2gz?=
 =?utf-8?B?NWFCQWMvd3lEMFdlUy9VUTRqcWFsVzBRazVTSWpma3NZNEpibGJlNmFtZ0o4?=
 =?utf-8?B?MzlseTFDZGtjdTFkZXJsM1BRZXp6Y1ZNZVZobnpmQUhpMGFXeDdjRlc2andU?=
 =?utf-8?B?eVBzWTJFeDYxR3EwdE0vQW9hNW9RSUg0M2lhZGI2M0xZNmxhVUhQYWhLTUxV?=
 =?utf-8?B?U3d0cVNtN2VYdm84L1dDSWNHdW4wSjZNTzVmM3JtWHNTVUxwM2c3YTZMUVlY?=
 =?utf-8?B?eWlwT3RpcXNGeGNia0o4TjB2ekU3VnByMXBpdEJ5NVNhSHZoK3pQbFh6SWRR?=
 =?utf-8?B?bDh6TzRPOTU4dnF3SkdOcC80dGpzYzREMWVRbnRkdEx5V3IySEJ5Z1FlTWZD?=
 =?utf-8?B?YjB4QmRqYzhmNlJQNkdmT3FiaEIvYkhad1lHV3B6L2hyaU5YcThZUmR2NFdR?=
 =?utf-8?B?T2hOWFBSYi9iY3VDSUh5SVVPdFVTRUpGQmNhSEVFQ1Yra3FMVWdMT2ZPQ2hF?=
 =?utf-8?Q?RDMeeDXDSnVTsDTRqYaOzxg1n?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efe0f18-c106-4212-2eb0-08dafd8293df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 20:44:09.6205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYIgFoysKeABlCJQryB1xMGnFMQLZF2cO4nkcU5K5QnfQ6OZRO7sfrvztnanXMx9epieaSy+g7M1zl1dKiQ25g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9894
Received-SPF: pass client-ip=2a01:111:f400:fe0d::703;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Stefan!

On 1/23/23 20:38, Andrey Drobyshev wrote:
> Hi Stefan,
>
> On 1/23/23 19:28, Stefan Weil wrote:
>> Hi,
>>
>> cross builds fail with this code. Please see details below.
>>
>> Am 29.11.22 um 18:38 schrieb Andrey Drobyshev via:
>>> This commit allows QGA to write to Windows event log using Win32 API's
>>> ReportEvent() [1], much like syslog() under *nix guests.
>>>
>>> In order to generate log message definitions we use a very basic message
>>> text file [2], so that every QGA's message gets ID 1.  The tools
>>> "windmc" and "windres" respectively are used to generate ".rc" file and
>>> COFF object file, and then the COFF file is linked into qemu-ga.exe.
>>>
>>> [1]
>>> https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa
>>> [2]
>>> https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text-files
>>>
>>> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
>>> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
>>> ---
>>>    configure                 |  3 +++
>>>    qga/installer/qemu-ga.wxs |  5 +++++
>>>    qga/main.c                | 16 +++++++++++++---
>>>    qga/meson.build           | 19 ++++++++++++++++++-
>>>    qga/messages-win32.mc     |  9 +++++++++
>>>    5 files changed, 48 insertions(+), 4 deletions(-)
>>>    create mode 100644 qga/messages-win32.mc
>>>
>>> diff --git a/configure b/configure
>>> index 26c7bc5154..789a4f6cc9 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -372,6 +372,7 @@ smbd="$SMBD"
>>>    strip="${STRIP-${cross_prefix}strip}"
>>>    widl="${WIDL-${cross_prefix}widl}"
>>>    windres="${WINDRES-${cross_prefix}windres}"
>>> +windmc="${WINDMC-${cross_prefix}windmc}"
>> Here the needed cross prefix is added ...
>>
>>>    pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
>>>    query_pkg_config() {
>>>        "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
>> [...]
>>> diff --git a/qga/meson.build b/qga/meson.build
>>> index 3cfb9166e5..1ff159edc1 100644
>>> --- a/qga/meson.build
>>> +++ b/qga/meson.build
>>> @@ -98,7 +98,24 @@ if targetos == 'windows'
>>>      endif
>>>    endif
>>>    -qga = executable('qemu-ga', qga_ss.sources(),
>>> +qga_objs = []
>>> +if targetos == 'windows'
>>> +  windmc = find_program('windmc', required: true)
>> ... but here the cross prefix is missing and the cross build aborts
>> because windmc does not exist.
> There's no need for the cross prefix here.  After you've run ./configure
> with --cross-prefix, argument, you'll see the following in
> build/config-meson.cross file:
>
> [binaries]
> ....
> widl = ['x86_64-w64-mingw32-widl']
> windres = ['x86_64-w64-mingw32-windres']
> windmc = ['x86_64-w64-mingw32-windmc']
>
> And these are the actual values meson's find_program() is going to be
> looking for.  So it doesn't seem like there's anything broken here, it's
> a matter of build requirements.


may be if you will provide Andrey with a configure command line
we will be able to make a fix. It seems that something is
definitely untold :)

Regards,
     Den

