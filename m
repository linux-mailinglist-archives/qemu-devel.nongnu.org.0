Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F110567869B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 20:42:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK2h8-0004r7-Si; Mon, 23 Jan 2023 14:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1pK2h6-0004pA-BD
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:41:28 -0500
Received: from mail-db5eur02on2071a.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::71a]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1pK2h2-0002Jq-Ai
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:41:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khX1ze5gxeBCFZmwkCaEcsPTQsTMOVdgWz0B/mvdy1/gRqHlM+SpnIYvbtbWBdngi0EhqitNGO4bGGhEHTa2u9ZoSQUkpp7VHBlaJkJtEpIm1fc8Aq71PPU67lR3hAf4Ladmj0lv3AB1/CgmOZ12qhKWixey/YYY9eJsEuu4/UOE5zKPU4uyNphiwEcBuqiF1mIE/rWK1eEbrMgWJXpTgFHmiD6qjB1LURjP7z9Bd+EMXQK3efxJQN7+8O8g/0RRoA3hy8rjjhApxryTJEfslF3wJJuFM8NcivfvhHGH6F7nNHc+ksedHYii7VskXGVzs8Adq+nsD2WFCEqopWtNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuCyG400WWSK7gGY15fLFQG7J9e/nwrPP1S3mhbfe5E=;
 b=OvQb0F6SM8qu8kbMIoBWe/+XhXD2sxuSuEl9ZH6vsxiWNmupOXKeEs+vVdi5GQ78rQ3dFWjZppkeg5tSkLI8i0ZGlwUSjLlxTBDBaB2Yml7dxCy7lJK/+T/ordp8gkERzTBhteBXPQJPVAAv1CRrFiqgeElVG3eOs6vjCosYFAbit7TH6XX4xCMfi5/HqIxsfAc9HPnuoI/R5DLOfjgA6ZlmXDPfGUHS2jzOfv3lXglSTmxTL6V4DK6pl8C9K6I9t6ViRNUnlUCgHXC1D643JNgoSI2nxz/seQjBgyX70y2NFkf2FExHMBfGbe8jotbKcmsP7tr3N738ggOzIBcK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuCyG400WWSK7gGY15fLFQG7J9e/nwrPP1S3mhbfe5E=;
 b=mb9X+6M0cOEhCELVXPuY/JnH2EE2f7RedcgBOgAxgKiIibLrM5sEn16tKWModi8rPddfAdeGsm3/OwimDVETq/xeBTeEEzSnnSvPebmAKMhFJ2491eTXkOqHQJunuDEwRXwWHk/RpUCJLFktFahoapT8LAhxr3gowimUJXAi4JK+UYeMh5WxzIO5PADdraDQV9x3812Kw/+SBqCPBA5k032YfrXw1mojwc+Z+zzBpHlZwrgS6SgfA6u5r+E3vXEGgIAVVceupIPSeXUjnEmTrWAnEHk5VXdwEzHZioRTbapbDrX9bWk+5BXt/OoglfV0LgUs/MOgvHH22tUxUrmaeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com (2603:10a6:205:e::33)
 by AS8PR08MB8109.eurprd08.prod.outlook.com (2603:10a6:20b:54b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 19:36:17 +0000
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::d342:b36a:8ff5:8156]) by AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::d342:b36a:8ff5:8156%3]) with mapi id 15.20.6002.024; Mon, 23 Jan 2023
 19:36:17 +0000
Message-ID: <1330af6e-ee4e-2e1f-f7ca-bcf0109de786@virtuozzo.com>
Date: Mon, 23 Jan 2023 21:38:00 +0200
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
From: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
In-Reply-To: <d5b918b7-dae3-3084-d0fa-310d8c26f43d@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To AM4PR08MB2932.eurprd08.prod.outlook.com
 (2603:10a6:205:e::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PR08MB2932:EE_|AS8PR08MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c4f785-7686-47e0-c4f6-08dafd7918ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nOWjotN+MyrKHdteZ2V9vdxnuTXurnUVlPhcBnDkNUhW1VS4gkUEpnUNpanbdon4GOdY7W3qixJ+CFQa+PqGjtmieHqZdW1k6/i6BPPrvQS9/l/5nrmzIRR2cjB7wN58TF0Tbag6P0pCwJU085LZqYThBEkgxSHV2HkwKE5H3yXBKgEtQVkjWqdJKnqLgNN43tsCL70QG6zOmD7q9NfKTMDdn+IawFpNsF17hYrf7idaZTD04OxbS3k89hKRPNp1tUXUsF9eQV02wG/YINM+ekr8wqlvIEVSwsNLLV8AdTA31pspKjEW+laHV7jOR77bCWPFCyAFUERQ2uJok8fY7NdU/BGhST+Ftt3MLmckughCpzl97abrhJrt3tP1ZZOD4mQdtQgO7K9p0udPOIQvR4z+Rk5Hlu2oaVp017t0v9xyV1C33Hr8PNizZ8Wrv2IsCN0gRqyXKxGRhaj2/0YjXAxpZkI34rRXMucdpdsgBH19BQITDoAX/mD5fC62ezCb6BZENQn5jwiSaOw0M6Hjykwvf0+EiH9X6FRmK2JnNeRIB6LnKpdrGDQ7bZNzMkY+3PfI9eJyITQWZS6feXIysqNqcchA2Yhvj+LKDFYYOjLN95K6bAtTlmZgvlJZWhzoRW+BF+2G3+qZnyVo5CY67TZVl882hBuOuTAmD2692+1TC8LWxtoDy330sanfB2yB+0obTVivm//InGwNJ+cCbLwoPdS7VxhiODIm/h8vJwGEfgaIFT+xC+Q2BoTN+olJ86eThqsaXUdHSlFd3c7sf42ByRIabLkm9qdCy4lSUys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR08MB2932.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199015)(36756003)(86362001)(31696002)(316002)(6506007)(478600001)(6666004)(6486002)(66556008)(966005)(44832011)(66946007)(5660300002)(2906002)(66476007)(4326008)(8676002)(41300700001)(8936002)(2616005)(186003)(26005)(6512007)(53546011)(38100700002)(83380400001)(31686004)(45980500001)(43740500002)(460985005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak16NHBIaUZHQzltZkNmSkNOMW10L0NjNTk5bXRsUzZzQ3ZoZkIyVUIzY3pW?=
 =?utf-8?B?ZXZJdWdSeStFcjRTckU3M2F3bVI4RWZDWkV3eVJ6anRLU1JMWVA3c3JrZ3Ur?=
 =?utf-8?B?MFhyc05pU09sWVFMSUcvL2lRZlQraGIxWXVLOHY1S3c5ZEplT2x0MWwySy9u?=
 =?utf-8?B?Qys5YTBIckV4R1h4RmNnTmlkalpQc2VOUjhoNkRNME4wQVRDQStnU3lTY3FQ?=
 =?utf-8?B?bUVtV1lqRVVDZ3NnUVAzUVhPdThpSnl1SEVFL3NWRHFPTFdUNjJFYzFyOEdi?=
 =?utf-8?B?emxOZWNJMTRTU0c0N2dlNStzY1lnZ1pQTzBSQUNTWURKNmxCeEdNczBPa0dW?=
 =?utf-8?B?Kzh6dDNabUNMckVGY1JHamVhUVduSEhZYXVEM2lnWlV2TWpzbWtMVzhSMFpB?=
 =?utf-8?B?ejEwZHAzSnVnM2JFSFo2NlNEV3l5VFcvNEZwY2hhVHI4NkF5NlplK09KOEVL?=
 =?utf-8?B?SVgyTi9NdmtOYjdFTmNTNElCalFFSXpRb2pONjNKS2hKZlJvSzJMeFN0OTd4?=
 =?utf-8?B?Z3Vvb3Ftd09vL3F5dUoyM1VkMDAvYjRQaDB6dkdsWmJQWFNWcE1yUHh2WVRx?=
 =?utf-8?B?V1hPdkpCWWNZZ2NTMWRyNkJGRUdSRkQ0bnJLYVBBazZlNnBwYWJBVGJUQllh?=
 =?utf-8?B?Q0Vxd1F1di9PdVBFc1l3NTZqYVkwQ3hTSkxOaUNGRDU2cmwxZ3BwWUtyMlBs?=
 =?utf-8?B?Z0xVNmpYeUh2UWxBQzYrVncwcmszL3hjbHAyTVlwZGlDcm5kMzJ5N3liS3Fs?=
 =?utf-8?B?K2tuY3hBalJhakJTeHkrV1h1NExmQ1FjR3VydHNaSmdIb1ZQQjd3WGJONGkw?=
 =?utf-8?B?RkhscmtDVEZpbEpEcW1CTExMQVZDMjBFaTg4Q0VZTGF3S3BIeFJUUG4rb1Ba?=
 =?utf-8?B?S01MTG5Qdjg4OXZOSVRoMnFJRTdRb3lSdXFrZ0NkYkFXbitOeE1waWFpVWFn?=
 =?utf-8?B?cDlBeDlDYzdIbjBhaGhJVEtsa3pIKzNxMHFkdTFlYzlyaHBJUHB6RGVZM2t3?=
 =?utf-8?B?a0Y0VThUcDMzQWYwWlJibzVzN1FpWXRsMUtwSFR2eVFqaHRlcTFmZk9HSWlM?=
 =?utf-8?B?Y0RRY245NjhqZTNRSUwvYnpHSmtBSnMwWVNYZUlMTU5oQXl5R2hqZUpJNVBL?=
 =?utf-8?B?UjhVaU1KaFRSeE9YQzJuK2Z5b3lJQVovN3gzcU42enczS0dRSTJHWTA4b1do?=
 =?utf-8?B?MHhKTmdKbk9JQ3h0NWdrQ2NXZE5FcjdhamhJMU52TlZpTmtJS2pyS0NpSWQx?=
 =?utf-8?B?WXJvcEJvWFVlSGloeWZLMEJyN203WFpCTnJrcEVlcS9IVHBPR1hQZkRTYVBn?=
 =?utf-8?B?Tm9sR1NMMFdkU2NRMFpkZ2g1ZmpGMy9vYnQ5bTBYTGI1RE1HRjRlcEhUNnZl?=
 =?utf-8?B?ak1PdTRLT3FGMW1WRTI4NG1nbWRBZnVnNmlyVUxwM2JZNUcyRTdoYmxOUzZt?=
 =?utf-8?B?Q1pPdUVIRGZhb3RUTjhzNWtkS3NtSldiaTB2ZEgzeFpSaVA0MlY3YjkvV0hY?=
 =?utf-8?B?VDN6MXE0bG53bkxRYWpuRlc3SHNHVXBiM3hsYWFlZ2xWTzdsekRHcUdrUjBW?=
 =?utf-8?B?MTJYWEtFa21YMVRISlVMNWdqMnZSTEJJY1R4bHU5TndHSWcxVVVDL21zK1Z4?=
 =?utf-8?B?OVVPZEtjbTAvbWVwOWZ0NGZWbzhVS0xYRjJ3ZC9NNlJKdVV4T3l6UEEvQ0N0?=
 =?utf-8?B?Tk51SGhlVTVwZ3FNaVJ0QUl4MzFNRXZrTTlBSEdQSU9rbGFFVlU5NGxKaWRp?=
 =?utf-8?B?WmFPOFFiVzJqRlBXbHozVUVyWGt1TkhHRjh6UFFjS0VoNFBtSDhrN040eTZp?=
 =?utf-8?B?Ri9rUC9jZlpxM0NTMGVqSG53WUZDRDg1d00va1dMVjhpNVIrU0dNM2tyenpo?=
 =?utf-8?B?OFB4Z0VXVVdFdXFKcHVyNE9YU1pNWnBVdGNYRXFhaHFSaG04VHlRYmJKdFR5?=
 =?utf-8?B?dWtiZ2VxRzloUUIyY2dqbURQaDdoQ2dlWTZxSTZGbzBMRkI4ZHl6Qnl0RGNn?=
 =?utf-8?B?Mkd6ZTR5VXNDN25TT1lCYzVHN0IraHh1TlJ6dGRjUlJhRTJXQncrUTcrem1n?=
 =?utf-8?B?QmF4RDJmbXBnS1d0aEg1UmpFVGhRWWZiV0EwOFA3RFNhZm1HdkxDczF3RTFn?=
 =?utf-8?B?cFR6UzIwQmwzM2E0MDl4OVFFdytxc2ExMUR6aDFFOXVOUFVnYkFCZUdtVlNK?=
 =?utf-8?Q?gIBSa49Wl7dCVFAHHOO9F3E=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c4f785-7686-47e0-c4f6-08dafd7918ac
X-MS-Exchange-CrossTenant-AuthSource: AM4PR08MB2932.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 19:36:17.4754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 368NIxHEtrL/nv58FTD10C13XtNfpHYvrkCY6uIHH5WaskQLyh9fkfiCXSddFfwR48NWGGFJUlS4FMfIM8afGmvic+Hdmt/cZ6eFEh7tjcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8109
Received-SPF: pass client-ip=2a01:111:f400:fe12::71a;
 envelope-from=andrey.drobyshev@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
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

Hi Stefan,

On 1/23/23 19:28, Stefan Weil wrote:
> Hi,
> 
> cross builds fail with this code. Please see details below.
> 
> Am 29.11.22 um 18:38 schrieb Andrey Drobyshev via:
>> This commit allows QGA to write to Windows event log using Win32 API's
>> ReportEvent() [1], much like syslog() under *nix guests.
>>
>> In order to generate log message definitions we use a very basic message
>> text file [2], so that every QGA's message gets ID 1.  The tools
>> "windmc" and "windres" respectively are used to generate ".rc" file and
>> COFF object file, and then the COFF file is linked into qemu-ga.exe.
>>
>> [1]
>> https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa
>> [2]
>> https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text-files
>>
>> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
>> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
>> ---
>>   configure                 |  3 +++
>>   qga/installer/qemu-ga.wxs |  5 +++++
>>   qga/main.c                | 16 +++++++++++++---
>>   qga/meson.build           | 19 ++++++++++++++++++-
>>   qga/messages-win32.mc     |  9 +++++++++
>>   5 files changed, 48 insertions(+), 4 deletions(-)
>>   create mode 100644 qga/messages-win32.mc
>>
>> diff --git a/configure b/configure
>> index 26c7bc5154..789a4f6cc9 100755
>> --- a/configure
>> +++ b/configure
>> @@ -372,6 +372,7 @@ smbd="$SMBD"
>>   strip="${STRIP-${cross_prefix}strip}"
>>   widl="${WIDL-${cross_prefix}widl}"
>>   windres="${WINDRES-${cross_prefix}windres}"
>> +windmc="${WINDMC-${cross_prefix}windmc}"
> 
> Here the needed cross prefix is added ...
> 
>>   pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
>>   query_pkg_config() {
>>       "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
> [...]
>> diff --git a/qga/meson.build b/qga/meson.build
>> index 3cfb9166e5..1ff159edc1 100644
>> --- a/qga/meson.build
>> +++ b/qga/meson.build
>> @@ -98,7 +98,24 @@ if targetos == 'windows'
>>     endif
>>   endif
>>   -qga = executable('qemu-ga', qga_ss.sources(),
>> +qga_objs = []
>> +if targetos == 'windows'
>> +  windmc = find_program('windmc', required: true)
> 
> ... but here the cross prefix is missing and the cross build aborts
> because windmc does not exist.

There's no need for the cross prefix here.  After you've run ./configure
with --cross-prefix, argument, you'll see the following in
build/config-meson.cross file:

[binaries]
....
widl = ['x86_64-w64-mingw32-widl']
windres = ['x86_64-w64-mingw32-windres']
windmc = ['x86_64-w64-mingw32-windmc']

And these are the actual values meson's find_program() is going to be
looking for.  So it doesn't seem like there's anything broken here, it's
a matter of build requirements.

> 
> Regards
> Stefan


