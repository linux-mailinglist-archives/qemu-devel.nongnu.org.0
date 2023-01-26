Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF267D39C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:55:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL6Rq-0005S4-B5; Thu, 26 Jan 2023 12:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1pL6Rn-0005Jd-1J
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:54:03 -0500
Received: from mail-vi1eur04on071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::71b]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1pL6Rk-0000lR-FK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:54:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8elBIFXS0W+jY8/bJknJzPPVpGnwAHI19vPB1p19G447fQYVx44rnMgBRI3ksvZtMgzmclCpV+ApsCMBCGi0kqvH9nKbnvPDy21yX4+EtjLojwxl/4LvWIBPyTxjtHvI9utZDbLtA5Jn+NEI6jsn6N7gS8b6zj2AXpRS/p1XRo5Ck4iawP8Eauarn/GDWkLYG7+ZyA955sUMht6SaVUItqTBi9BgaSYP1nnk3jmTI6m4tWCjZwzEaV1+DvbVt8fRjQ1eEp2S0p16oIY1uTWwoLE8WdUHr0K41lLnQB28XpSFUdsd1hi/+0TCd7bA17RuYPQ4agxM1v93S/wL+tyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TzMAtmHtSyKnI1I5vmMxi58tlkuIXMWxNnZN6gYTr0=;
 b=VQqecbugjO60dLklY6SRuFsj/wuMq75S6nETLg8rwoGF3h40pRkyzBAGwayxhqtOekq84FosAjXM7RsoUDwSnwNfXUpNRBOXVF3/juEb6AfnKjmPTZvsHLtuPV/IgV3lZAhV7SxEC4PNSQSTkRGcgRqXGwcoHpUxoHtmlh7r+5yH/HvjsvMW1CtAN2Sb6mYlURHTMyhewz3Q8TyU5eSHoN0Ub8DfioCmQM6GC/hoFx9mIP2SorFMgNQWqq09/t4SD4FLClUOq1JX76WhkvC4sNHnmUF5h1u18CgnZV+BoFCND5L5e7MN3910Idv8G3bk+O08qeIjMcjGq/1RToZm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TzMAtmHtSyKnI1I5vmMxi58tlkuIXMWxNnZN6gYTr0=;
 b=zb+Yi2JSxOJxmrB/a2OpuGK4DLTMjtvOd6lwIilp3Z1goXVSThNTB+CXVHQtCsgQwDEwMWTelPJ+JlRgey+swBhjSYlWvm/CGzAL05J3byDVhxmqau58idgvIp2+B3r7xlXmS+kSd+FFmLsCp/VG/jMDq2fSQa+CxTmQGX1EBywXJcSfaLlQZw3w0/olYM7CKFvWb49+ts/wnfBzB/du3/N9O5yAJbAmcGnWAJWxZebMySMCBIpo9r4RgvvjE2oDHrizCXBtWbudpG1HuGLn06Z7W6knBvDhMlG7z5NolTkJtfyz3UEjNnoP3eT46R3kX2Uv/ZpHmA59MsVTDjyRUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com (2603:10a6:205:e::33)
 by AS2PR08MB10226.eurprd08.prod.outlook.com (2603:10a6:20b:62f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 17:48:52 +0000
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::1443:bf57:4f58:989f]) by AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::1443:bf57:4f58:989f%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 17:48:52 +0000
Message-ID: <a3e86393-988c-4c7b-6aa5-b6236b4f22dd@virtuozzo.com>
Date: Thu, 26 Jan 2023 19:50:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/2] qga-win: add logging to Windows event log
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: den@virtuozzo.com, yur@openvz.org, marcandre.lureau@gmail.com,
 mike.maslenkin@gmail.com
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
 <20221129173809.544174-2-andrey.drobyshev@virtuozzo.com>
 <d5b918b7-dae3-3084-d0fa-310d8c26f43d@weilnetz.de>
 <1330af6e-ee4e-2e1f-f7ca-bcf0109de786@virtuozzo.com>
 <607a5f89-b01b-5c72-dccd-c739a9d2bb7d@weilnetz.de>
From: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
In-Reply-To: <607a5f89-b01b-5c72-dccd-c739a9d2bb7d@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To AM4PR08MB2932.eurprd08.prod.outlook.com
 (2603:10a6:205:e::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PR08MB2932:EE_|AS2PR08MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f8296e-0ea3-4d10-9ac2-08daffc59655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1jrtnmYW6zgUDOS5vZQx3kG+yA0NWLX1CP9OXZH565HY2I6vu7eepxLAIz77ZAHDQXlFsflFCKUZBH43sB5fruMKOpEishxGyIk/c8BUAmCcHCxaThOFLnGjygt4MWHnyF7XW0o9Zai9kacvHikPU4fXGQ8rOiBlc4aVRGSjEKZ/0BNI+1Zr51qLxIlctyAheSo1LJH/oSbaCkNNJ/TZiWoUO3DwGT2wte0U0JlTsSWMRJy1zdHQP/c9/0l0sUNVBl8KQJowYq0Pa/sOhaMAnizdn8orh9r8iobkdE08ULS17EhSmg8p2bOVPDebXAnvFFEKbPfbmmA84iVZNyhqheX6idwfX/INGFDed89+VB54frdrihGz2LSolNU9cYkY6hoy9urdHSjviykCAdFi6oTvlwy8PHuhhRApD3H9bBfyW6rZI4AwsS/VU+TUuV8/EDSKCbKPM9XahLiW28MxGz8XCPMtyHKRY0ddc15wx0+iYOEO+bu3vhNiisBHm7mrNqLE6tjJyN2cPKtOWy3C0jR4CEphh3sxqCIoSUUuvGW0IWLsl7Y6eTCAi6l2UZm+AucmGMxPXi3Ilbd4Pt5hvJSEgRK7qZ5DvKbdroLv2syZMl/lnDD+0pfRjO9yiBLvl+Ar414mzW5p6VnJJb/sNapidEqQ+4hY7Nt7IIm2MDwWpXglQxittZeP2tqSXrTFn3NUjkJv7kCByuH9ZrRenA7COCTSUksq3wcAyUb+o7bJtbSegrOw7C+FWQRdsXTyAjyVUXHBJaeN7A1/N+g4C1rLZeaPmspzc2IhztCx52s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR08MB2932.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(451199018)(44832011)(83380400001)(66899018)(5660300002)(38100700002)(8936002)(2906002)(2616005)(53546011)(26005)(966005)(6486002)(31696002)(86362001)(186003)(6512007)(6506007)(478600001)(31686004)(66946007)(316002)(4326008)(8676002)(66556008)(6666004)(41300700001)(66476007)(36756003)(43740500002)(45980500001)(460985005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkVOWWR0R3NJQVZ5VkUxSHVSSzF2L3hwNVFEa0g1L3MyaGo3YVUvZE1PMXFO?=
 =?utf-8?B?WUJZeU1BMTVBUDkvTXU1bWVheTkvL0FSVEVhNGNHNW5jc3o5eTRuSTJMbVVC?=
 =?utf-8?B?UnJBcm1pYzk3SDJDdUlFT3R1WHErTXN0NE0rbGdpcDRYMTFGRDk3MlpvQ3U5?=
 =?utf-8?B?RDY0dWV2UkRiWU1jUDVQQ3dvVW5CWURYT2YzdXZlU09rWUJGTTBpa1M5YWVL?=
 =?utf-8?B?cTBjR1E5bFl4ZEhicWVCbjd4eG9KRk5MT2JPWWhheUp4ZW1QZ1AzSWRaWEg1?=
 =?utf-8?B?TVUwenAxcmpMMUhtNUM1b2tnc2lhLzZSNHEzZDZIQ0tuRGxPVVUzcTRNampN?=
 =?utf-8?B?akFvSCtmUGZpbTMyd1VPdlVUdUJmeGo1Y3hCUW1wT1N1Vkx0VnJ0SEI1Uk5x?=
 =?utf-8?B?RUg4aWRBcEdpb3FYTm9OZkI2WmRzVmxpZ240bnJ1azBCclpRaUp5UGFZNkRz?=
 =?utf-8?B?THVQS0tEeEt6VHM3WVhzQ3BBYWc5L1lSSnhyNDdMdnluZ0g3bld2Tm15bDZN?=
 =?utf-8?B?VU5EMllGRFU0SjhDL3ZpUk1IRTlZY2JQb3gyQ2dLVi9wRUlzMko1SkNLRWdO?=
 =?utf-8?B?dGQxa0lFSWordGNyWGZWdEdjWHhyS3QyM2hPdzBqNVVmOVFrMzFOQ0lIenRl?=
 =?utf-8?B?MUQ2Vmk1THZsOHc3RzVtVUFIdW1heWtlYWJCRlYrOWQzZ0JiR0tURkxRKysx?=
 =?utf-8?B?b2lTbDRueW1WMXQ2MDBEcHNFRGpib3U0dlZaOGtvL0xlNHE4Q0VJeStMZndq?=
 =?utf-8?B?VEhLNEFvR0ZiT2Y2azlIaWNJYTgyb0hwdjRMREFZMmF5K0l6MWNMUWtWdkU3?=
 =?utf-8?B?M1hSbHZpdFRKaE5EUWd2Y0c4ZC9uMlRIMHFPNFNOSEVOYVYyVkQ3QThWMmtm?=
 =?utf-8?B?L0NaUzd4WUpLVHRDK1I2Q2JrWmVsN2xPcFA4TG5LTFkwRTIyMGFNWDA3N294?=
 =?utf-8?B?SkVjL1B4NTJTU2c5anpIdFZkMUdySmNMYkJDejExNDc1SThPVCtlMTd4cE1t?=
 =?utf-8?B?c2Q3RXpPT21wVldBQ0V0Qm01ZHM0K05LNzVxakM4TzhZVituOWNGVlNDbXdR?=
 =?utf-8?B?ZjBJZjV4bmMwZUwyMkVVeFdCWlZuOTJ4Wm5tSktRTXJzdkxvQXprUDNrcDJJ?=
 =?utf-8?B?d2t3TlFBeUxkMHY5S2FqSldKTmRUUmZhOUF3SEt1dzBsUEUrTzRPcXlwV09o?=
 =?utf-8?B?L0NlY1l3T1h2eXFtUkJFK1FaTmZyS1hSL25LMW1veklvZmtXa21LWk90Y2dO?=
 =?utf-8?B?aUc1aXJscGVnZEE3eWU5N3d0alVudmdvcjZHODhwdTY0ckg0OHVMUTVuT1NM?=
 =?utf-8?B?THB2WnUrcUZ4REo3MG9IVHZkeTk5em9QTW95YmQ4VWlsMytXT05MYktaWU9t?=
 =?utf-8?B?NE0xd3I3bzlua2pRNmVMd2tIUGw4RXBvb3dWVkI1akhaYXM4OVhYUFY2YVVu?=
 =?utf-8?B?dmlGbWNCYkpxQ01US3R5dWd2UmJVQWhESUNWN01zYWhZcnlVeHFRV1ZhVCtI?=
 =?utf-8?B?Mm1hN3dRK2VEZXFTejJheEtWY2RtaGRub3BQQ3ZHSHNtRmRuN3VkTmg1U3hh?=
 =?utf-8?B?Wk84c09aQnJkdStjR0VKdlRTb0UvTGZZMnlRWEdRRkNkdzJiRUJ6elJHMGFv?=
 =?utf-8?B?RXVnYThYM0MyTDNicWYvQXNTVEdJcWZXVmlzSWFObjFjSVJFQlN6VlFOQzFZ?=
 =?utf-8?B?OFBCS0djZXRjMk1tN09BTUllbFZBSnpZdFlXNklZL0dLNnlxdkxodTJCUzFo?=
 =?utf-8?B?VmJvUEhJbERhVzJVVmJDYld6YTVCc1Bza1JBNjNNeWxhdjhLYUQzV3hFcFFB?=
 =?utf-8?B?UTlMWHUrU1dRY1FRMXZuc0JLZTJ4anZBSGVKbEJkempSc3NkTEpDd05TTXBo?=
 =?utf-8?B?ZkRBTm9GZXdZQlI1SnRuSGpzNFFmVVArUzFyaUlBOUc3VGN5WmxDMERrc2Y3?=
 =?utf-8?B?U09mVXlMcEIxMTMraG1RcHFKQ1d5aW9Ma2dnSTgvOUpPMW5Vd0t6TzJyZHV2?=
 =?utf-8?B?SURxVFlyK2U3SDNaUzUrTld1NzkrbVhpRjNTUGFiTGNIZ2g0TllSdGllY2N5?=
 =?utf-8?B?TTl6Njlyb0hqak1ZUmErSVM1cWxyMDBQUWVRRjFOd2NhbWVoS2hXRS92VXNP?=
 =?utf-8?B?c2ZHdk1NdmM4U3RySFFNRGRuRHRCbHkxcmE1UUdBaTN3QlVZYUhTbzAvQWYy?=
 =?utf-8?Q?Ji/5UzKRKDk5O6HIh07Ulik=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f8296e-0ea3-4d10-9ac2-08daffc59655
X-MS-Exchange-CrossTenant-AuthSource: AM4PR08MB2932.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 17:48:52.3897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfOxR/wsEK/A7AnrBChLdfrbtumD6bamDm8DT8TpGYGjkrO6Rkl2O0W1NDLGJP11+NnBsZPGJ5wVEBfoVknGRqrBzBYdY4a29fbgADvh5Fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10226
Received-SPF: pass client-ip=2a01:111:f400:fe0e::71b;
 envelope-from=andrey.drobyshev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 1/23/23 22:52, Stefan Weil wrote:
> Am 23.01.23 um 20:38 schrieb Andrey Drobyshev:
> 
>> Hi Stefan,
>>
>> On 1/23/23 19:28, Stefan Weil wrote:
>>> Hi,
>>>
>>> cross builds fail with this code. Please see details below.
>>>
>>> Am 29.11.22 um 18:38 schrieb Andrey Drobyshev via:
>>>> This commit allows QGA to write to Windows event log using Win32 API's
>>>> ReportEvent() [1], much like syslog() under *nix guests.
>>>>
>>>> In order to generate log message definitions we use a very basic
>>>> message
>>>> text file [2], so that every QGA's message gets ID 1.  The tools
>>>> "windmc" and "windres" respectively are used to generate ".rc" file and
>>>> COFF object file, and then the COFF file is linked into qemu-ga.exe.
>>>>
>>>> [1]
>>>> https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa
>>>> [2]
>>>> https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text-files
>>>>
>>>> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
>>>> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
>>>> ---
>>>>    configure                 |  3 +++
>>>>    qga/installer/qemu-ga.wxs |  5 +++++
>>>>    qga/main.c                | 16 +++++++++++++---
>>>>    qga/meson.build           | 19 ++++++++++++++++++-
>>>>    qga/messages-win32.mc     |  9 +++++++++
>>>>    5 files changed, 48 insertions(+), 4 deletions(-)
>>>>    create mode 100644 qga/messages-win32.mc
>>>>
>>>> diff --git a/configure b/configure
>>>> index 26c7bc5154..789a4f6cc9 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -372,6 +372,7 @@ smbd="$SMBD"
>>>>    strip="${STRIP-${cross_prefix}strip}"
>>>>    widl="${WIDL-${cross_prefix}widl}"
>>>>    windres="${WINDRES-${cross_prefix}windres}"
>>>> +windmc="${WINDMC-${cross_prefix}windmc}"
>>> Here the needed cross prefix is added ...
>>>
>>>>    pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
>>>>    query_pkg_config() {
>>>>        "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
>>> [...]
>>>> diff --git a/qga/meson.build b/qga/meson.build
>>>> index 3cfb9166e5..1ff159edc1 100644
>>>> --- a/qga/meson.build
>>>> +++ b/qga/meson.build
>>>> @@ -98,7 +98,24 @@ if targetos == 'windows'
>>>>      endif
>>>>    endif
>>>>    -qga = executable('qemu-ga', qga_ss.sources(),
>>>> +qga_objs = []
>>>> +if targetos == 'windows'
>>>> +  windmc = find_program('windmc', required: true)
>>> ... but here the cross prefix is missing and the cross build aborts
>>> because windmc does not exist.
>> There's no need for the cross prefix here.  After you've run ./configure
>> with --cross-prefix, argument, you'll see the following in
>> build/config-meson.cross file:
>>
>> [binaries]
>> ....
>> widl = ['x86_64-w64-mingw32-widl']
>> windres = ['x86_64-w64-mingw32-windres']
>> windmc = ['x86_64-w64-mingw32-windmc']
>>
>> And these are the actual values meson's find_program() is going to be
>> looking for.  So it doesn't seem like there's anything broken here, it's
>> a matter of build requirements.
> 
> 
> My configure terminates with an error because of the missing windmc
> before it has written config-meson.cross. I have run an incremental build:
> 
> Program windmc found: NO
> 
> ../../../qga/meson.build:103:2: ERROR: Program 'windmc' not found or not
> executable
> 
> A full log can be found at
> /qemu/bin/debug/x86_64-w64-mingw32/meson-logs/meson-log.txt
> ninja: error: rebuilding 'build.ninja': subcommand failed
> FAILED: build.ninja
> /usr/bin/python3 /qemu/meson/meson.py --internal regenerate /qemu
> /home/stefan/src/gitlab/qemu-project/qemu/bin/debug/x86_64-w64-mingw32
> --backend ninja
> make: *** [Makefile:165: run-ninja] Fehler 1
> make: Verzeichnis „/qemu/bin/debug/x86_64-w64-mingw32“ wird verlassen
> 
> A clean fresh build works indeed fine.
> 

I don't think the issue is caused by this particular patch.
Here's what's happening:

Makefile:72
> # force a rerun of configure if config-host.mak is too old or corrupted         
> ifeq ($(MESON),)                                                                
> .PHONY: config-host.mak                                                         
> x := $(shell rm -rf meson-private meson-info meson-logs)                                                                                                       
> endif


Makefile:92
> # 1. ensure config-host.mak is up-to-date                                                                                                                      
> config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/scripts/meson-buildoptions.sh $(SRC_PATH)/VERSION
>     @echo config-host.mak is out-of-date, running configure                     
>     @if test -f meson-private/coredata.dat; then \                              
>       ./config.status --skip-meson; \                                           
>     else \                                                                      
>       ./config.status && touch build.ninja.stamp; \                             
>     fi

configure:2529
> if test "$skip_meson" = no; then
> ...
>   echo "widl = [$(meson_quote $widl)]" >> $cross                                
>   echo "windres = [$(meson_quote $windres)]" >> $cross                          
>   echo "windmc = [$(meson_quote $windmc)]" >> $cross

Now if you checkout a revision which doesn't have this patch, perform a
build, then checkout to a revision which has this patch and try to
perform a build again, ./configure will be called with --skip-meson and
config-meson.cross won't be regenerated.

I'm not sure how we could detect a necessity to regenerate
config-meson.cross in this case.  Your suggestions are welcome, if any.

