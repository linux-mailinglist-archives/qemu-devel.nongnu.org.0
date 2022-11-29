Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F053463BFE3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 13:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozzXq-0006PB-Id; Tue, 29 Nov 2022 07:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1ozzXk-0006Lz-RT
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:16:58 -0500
Received: from mail-he1eur04on070a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70a]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1ozzXe-0005We-Gd
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:16:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNg0qcEpE2ALV1GBe5MyET5ulM9LoiiqlH+ggXNpM+iSz0OqrPUTI/DUYMavbFGIV/Xw8Sbozy+Tj17pFYJwoDAnVHOip+O5EHPm5mF4gSRtbsWaxba0+eXkP+/NAuaAQSCA1r+yKSDl16aNo7692aFCBuvoLi2Uc/xVf3JzIQcAWP7yTnBp8Li48mUmqWiQSZqIHrDObzuIW+wtDN5Wa4rZBOL7w+edC2+WR3V0vuQ/WCTZnWL3VEYrUDU2ZJ4uFnR21xnIH9vDZSyXNoRXGGQ7F1wPwQ4RD9f2GTcaoCF4yYgwcYB7wPXvHiopPCXgC62HK1l3Cp0y2xIVkLkBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsqe4F4MOjUT5nrLBEHU2k20FEEBZhsKx+oYG0tk2HE=;
 b=Htuy7E9s4boBFYpcGS0Ayk43R/sld7QAWJeg+UQ8ONgaggGLNkIBAp4n/JHejRrablVFjVZHzUgQA+mVW0J2yHLr4wJW99kzTKpkh3vPrUqFFzAUWCTDfjoBh5w0/VboqhD44HL1bea0s7XvIsQ4paaAajJ63Vs1ath62deh1h0VNitlJ8qIaHZE8ISBcCES/icERtMRsA1Ig4MGP8d5GY85Z922YrGn+6dovH2IL4KimnRZepZvQoeqMwepPaWIjOBLMfcR7zXg5PEF0RtzAg7DxMhuSenfa3wu8fL6Xr/l2tUd7Z7T0ZjLWiSL/sbGDbMut5Kfl27OgpC302o+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsqe4F4MOjUT5nrLBEHU2k20FEEBZhsKx+oYG0tk2HE=;
 b=L7P2MBjHzdZrWD/sChCtiTQJ948zWbCkymrF9G1/ywLxx8aZzeYqN286ZxBa+Ef7YxyGLwH1TmxotXyUC8gNww6mzzIYjawufEXWDRSaVbhkrkO7gSkr+s7bzNIKDmfYtVVPn/Yfe99xtKxHcFOYJ+I1iBtQBqUrq5Rt64KheBLkZrtR9wpO3/0hGMzp+pgvwMnnqEenAIQEbPIlF2hMJCozT7R4oO52/PUQ9A1WbXtRtTvLKFKmNQJjRzJvAi6L7/CWs7FhQFjFZ33/BoMQEznL1Xs+1Pemm5B7tXp0R7hvnKgUNtw+kTTnsw2zFwNUNwZbqitTQ7CjHlegjmmQaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com (2603:10a6:205:e::33)
 by VE1PR08MB5824.eurprd08.prod.outlook.com (2603:10a6:800:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 12:16:43 +0000
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::e0fc:a968:655d:f14c]) by AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::e0fc:a968:655d:f14c%7]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 12:16:43 +0000
Message-ID: <a99fa906-782c-ace8-d734-10390b7e947c@virtuozzo.com>
Date: Tue, 29 Nov 2022 14:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] qga-win: add logging to Windows event log
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, yur@openvz.org
References: <20221128185403.447817-1-andrey.drobyshev@virtuozzo.com>
 <20221128185403.447817-2-andrey.drobyshev@virtuozzo.com>
 <CAJ+F1C+ZW0MawqcY_AgyMebX0aEDELJhfmekjgjE8zSrr+ONdg@mail.gmail.com>
From: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
In-Reply-To: <CAJ+F1C+ZW0MawqcY_AgyMebX0aEDELJhfmekjgjE8zSrr+ONdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AM4PR08MB2932.eurprd08.prod.outlook.com
 (2603:10a6:205:e::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PR08MB2932:EE_|VE1PR08MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: c64afb48-3949-47ca-b67e-08dad20393bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7mwSjMbXhfJTXYk0w3GdXo2jpZm/NDdfTb4OyhDaekua1G1Z2kNqMP+Fahi9aPU2g0MU1uGpBSeZGeU/oifxchdEs56ShUEpLlTD4dYEybpVpAZ2WiO5Y/U7QqUz3DnGqoxHf2nh7b94EoNn2AU07Q5VnIf7mKhd7XZGIVZVburngKjckQ1fh4U0HKbNUd/aWi5kIGiquTzmYeOgcXQNw6B5G1nM6tcGnV8ashFaQTkNyS4ItAJU+0uuOIHzTLh43o+FrI7Ds91+GCMYtNz2nOfo8lE90DqSTJFIIih/kjsij6wYCPoFVEAeN/HdOuHzUqo2mX/Ofj9KUvvPM+6GKbDTuTF/ejKkOhK/Zda+GmPybFJiISCbIJU3V3MYC0v8hCKwBq1TrpPBS8O8qqLU7AYVod9sVYOyWKEhC1ZxpJinKHewjoomwyj+96SkTlzSm8Unl+FKL+e6TXzL0drap6QVznGkOA4L3UDNPl7fCzwy8BQ7Gewz8mf1y/MSCC0MaIAf+HG/0IQWV+bUkptpk3dAWwmcyPn211GZVacXdUkHFnqDzNcp06qk7iQF+p1JbR1kNnWXz60Jo7Q3PG9omyjVJd+Nz1VwaPTAEc/hAlQSrMoiIopTFbGygFPeskAewwYrqGMB1bHEwJQU0in3cZmwZXFcGRmURrjgH7XiQjPQTqG7Z+D6uO9Nk23PLlLQthnPZCdgPO7x7shZNY08CkFOsPTzVxg+OaWCmLKqghk7nI2w6BKV8Y6dtlc/49vl6p1n3J2jVazMnQfiOMBtnn7a6a77Ty4Kd0V0Nr+OvVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR08MB2932.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(451199015)(8936002)(5660300002)(186003)(8676002)(36756003)(66556008)(41300700001)(4326008)(66476007)(6916009)(316002)(38100700002)(83380400001)(2616005)(966005)(6486002)(107886003)(6666004)(26005)(86362001)(6512007)(478600001)(66946007)(31696002)(53546011)(6506007)(2906002)(31686004)(44832011)(43740500002)(45980500001)(460985005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blV1SytyN09kelhjUXROcGtOakRBZ2RDQzRhLzJlSlVSdmt4aGg1SFBkQWtU?=
 =?utf-8?B?aVZ6cSs1OGpwWmxSN0NNa3czZ3ZZb2Q4M21ib3FXd3ZsUGw5R1BqeG1ObWtU?=
 =?utf-8?B?eWMxeHZvRmtDekJ4SXNQaWZvSDd6M3lYQjhmcG5NY0lqaitvZkZDNTZJUlRU?=
 =?utf-8?B?YnkzejJpbjZ1S2RnckdZUi9IQ0daQXRlOGRUeHFDMGFObzlKU1NVcWpTN2tW?=
 =?utf-8?B?TTZIRWRrVGtjOXhuemFSVjZmS08xWWlTSjZSTWRGY003ZzJaWUdFNGQ5WVhR?=
 =?utf-8?B?S2s5OVYzVDkwSDl3UGpQVE5JNlg1VWl6RklVb0RmeEN0RS94U0Y1eUlzTmhu?=
 =?utf-8?B?OUh0UTk0OGhhZVdGRnZzSndoazZKcmVXUzNERnRuNVVDRGs2anNVaC92RWd5?=
 =?utf-8?B?YUxIcjlpeXBVR2ZVTmF4Nkg3Vm1INFdIamF6b3NQYmRuZmN3aTk2S2puZGlZ?=
 =?utf-8?B?NUhKVGkyVnc2bTRjWDNYQlU4TGhjVWF2c1hmSUwwQURyOVdFTGJnYitkd2pu?=
 =?utf-8?B?cTdWQUJ5N3kwL21SQ1V5Z3pXdnlWczJqVTNvUmFkQnJyUU9GL0lqOWhtYjJ0?=
 =?utf-8?B?djRQd3lMcTU5SVNTVEkvejFSSUk2U0Fudk11dCtROUh6OXFYYWFZSjJqVUFo?=
 =?utf-8?B?TEEzNVZHL28xcUxwUkp2UHFzU3o5eGJrMkNFUHBwS2lXekorQStwaVU1aXpZ?=
 =?utf-8?B?UHZONURNVUFibWoyblRwbkYwdGx2R0VkTjNOanYwR244UjZzVGZaME4xUTVl?=
 =?utf-8?B?aWdab0M5dXJzblpTRUJINVZRcSs1TTQvN2ZKR0NscHRjR3NseVdsYVNXdU0v?=
 =?utf-8?B?dG1iQWRJMnJUbnJCQ1Y4dWlqT2RVaElzNlhsalRNU25pQTNEUEplVUQ0bGRJ?=
 =?utf-8?B?RGZOMzZVbEJsSnE4VU9UcnlmQzUzT251MytCMml1US92dUhPcHdKVDVSMUdz?=
 =?utf-8?B?Zk96V1pLeDdtcG03N1JkYndwbG5ibStMcnBLYU5pbEZ5VmxKR0F3dllBdGsy?=
 =?utf-8?B?emN6dHV4UXB2anRadE1STEdPenY1ZzRJOU5ReGJsd2k3cHVBNDRIM013ZlRq?=
 =?utf-8?B?VUVpUm9mVytGZmRsYzNINDcrTGZFb2trd2w0aUduaGxFK0hBZDk5L3orREg0?=
 =?utf-8?B?TmhDVmtZSlB1Z1hDYnFUdHdBOG9odTdVZm1JcERsMlFxUEpOREszUytJTFJp?=
 =?utf-8?B?SS9ETm82QmlmdmNtSmprSFdqejBLVEtzZ1ZqbUJTSjB0a3pwWWd0YW4ya2ZF?=
 =?utf-8?B?bWVQcnlqdWxLWUhpV2JPNVhBMVB3aXpnWFFvY3dKQnBSQS8zT0tyakVRbmxS?=
 =?utf-8?B?ZENlYUNTQ1MxM3QrYTR0ZUttem5za21MU0lGUVRlMzFxN3lpSFRqSEw5ZUcx?=
 =?utf-8?B?dCtBbGxNaWJ5MWNQZ0RUNTZ5UzlxVTVKcGRpZ2ZhNUZaZnJRYkxYaERIYXNK?=
 =?utf-8?B?Q2lxREM3RSsvS2VoSStFR24yaVQvbzhvVlRNV0diU21xYXcxd3NaemdsVEZF?=
 =?utf-8?B?MlRJZzZQSmRHQWVCQjNhTHRDYitsclVtREQ5R2UvLzhYU0FxYnkyY3lXaFJV?=
 =?utf-8?B?RDFqeEZaKzA1alc3TTFQOHNrbGdUbytoaFRoS3E4RjJSVW1VUTNqNGgxT3Vs?=
 =?utf-8?B?ajV6WlJlMFZqejZHSkJ6ZElXYldWQmFxOXJyZXdDeDRqRkRJU0F1a2syc2hJ?=
 =?utf-8?B?TDVZRmczUlR2V0dhUFJoeXcweTNwU2NwTEhoNDFoajNTVnNsWERWL0hOT3Fp?=
 =?utf-8?B?dGo1WFFVZnJnZHhqN01wakJJTXBNdFhkN3ZPNHp5MjBBbFhtZit3SE4xZlJm?=
 =?utf-8?B?UnhnRzhPWHFhclkxUEhRdjJKMGN2QWt5K3NERVZYQjArMGtsZG95dENDS1lS?=
 =?utf-8?B?MmZ4b1kwQnJTWURSWGdzakIzcDcydXNYakljUm9iME5KUDlySHlaa0ZIZWVr?=
 =?utf-8?B?V1dlSzJmeGtlbHNIREpxMUlsL1Z0S0hydW1vemtnQm9aUVlZVWV2VnpHRkZl?=
 =?utf-8?B?TWZHQlZwQ0cydDdRR2UrN1duSFM4bTNtVm5la2ZRaTYrL0hYQnR0bHE3TkZr?=
 =?utf-8?B?YlZ4K0hEMjA1blF1NFFXZ0c0RnJRVEZWOGIvYW5PVEt0anp6TXJTMzIvN1Ja?=
 =?utf-8?B?c3hhTWdjU0djMGZrcldaVU9pY1oyUTcrc2FzblpENElubnJTcmZxQTZPNDFw?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64afb48-3949-47ca-b67e-08dad20393bb
X-MS-Exchange-CrossTenant-AuthSource: AM4PR08MB2932.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 12:16:43.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cC9KRu7zbTDfutNt+7cPyvbHkHuUKRGjQhReW99a3OyRfH5z479XUt5Ry3PvFbNkKaqbVPj6oE7YAJmJKDsdb35uC65pb/aqJ0UKp5pQnbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5824
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70a;
 envelope-from=andrey.drobyshev@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/29/22 09:37, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Nov 29, 2022 at 12:59 AM Andrey Drobyshev via
> <qemu-devel@nongnu.org> wrote:
>>
>> This commit allows QGA to write to Windows event log using Win32 API's
>> ReportEvent() [1], much like syslog() under *nix guests.
>>
>> In order to generate log message definitions we use a very basic message
>> text file [2], so that every QGA's message gets ID 1.  The tools
>> "windmc" and "windres" respectively are used to generate ".rc" file and
>> COFF object file, and then the COFF file is linked into qemu-ga.exe.
>>
>> [1] https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa
>> [2] https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text-files
>>
> 
> fyi, some years ago, I tried to add support to GLib:
> https://gitlab.gnome.org/GNOME/glib/-/issues/665. Unfortunately it
> didn't land. And in the meantime, GLib got structured logging. There
> is a long-standing FIXME in GLog to support Event Log. Someone
> probably needs to start from scratch.
>
"Several applications and services running on Windows would really

benefit logging in production, without having to resort writting

similar handlers in each projects." -- very true.  Until that bright day
comes -- we're doomed to perform tricks like this...

BTW the message text file (.mc) you suggested looks much more
sophisticated, maybe we can adopt it as well in the future before GLib
gets this feature.
> 
> 
>> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
>> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
>> ---
>>  configure                 |  3 +++
>>  qga/installer/qemu-ga.wxs |  5 +++++
>>  qga/main.c                | 15 ++++++++++++---
>>  qga/meson.build           | 19 ++++++++++++++++++-
>>  qga/messages-win32.mc     |  9 +++++++++
>>  5 files changed, 47 insertions(+), 4 deletions(-)
>>  create mode 100644 qga/messages-win32.mc
>>
>> diff --git a/configure b/configure
>> index 26c7bc5154..789a4f6cc9 100755
>> --- a/configure
>> +++ b/configure
>> @@ -372,6 +372,7 @@ smbd="$SMBD"
>>  strip="${STRIP-${cross_prefix}strip}"
>>  widl="${WIDL-${cross_prefix}widl}"
>>  windres="${WINDRES-${cross_prefix}windres}"
>> +windmc="${WINDMC-${cross_prefix}windmc}"
>>  pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
>>  query_pkg_config() {
>>      "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
>> @@ -2561,6 +2562,7 @@ if test "$skip_meson" = no; then
>>    echo "strip = [$(meson_quote $strip)]" >> $cross
>>    echo "widl = [$(meson_quote $widl)]" >> $cross
>>    echo "windres = [$(meson_quote $windres)]" >> $cross
>> +  echo "windmc = [$(meson_quote $windmc)]" >> $cross
>>    if test "$cross_compile" = "yes"; then
>>      cross_arg="--cross-file config-meson.cross"
>>      echo "[host_machine]" >> $cross
>> @@ -2667,6 +2669,7 @@ preserve_env SMBD
>>  preserve_env STRIP
>>  preserve_env WIDL
>>  preserve_env WINDRES
>> +preserve_env WINDMC
>>
>>  printf "exec" >>config.status
>>  for i in "$0" "$@"; do
>> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
>> index 73ce2c4965..d9567836f3 100644
>> --- a/qga/installer/qemu-ga.wxs
>> +++ b/qga/installer/qemu-ga.wxs
>> @@ -110,6 +110,11 @@
>>                <RegistryValue Type="string" Name="ProductID" Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
>>                <RegistryValue Type="string" Name="Version" Value="$(var.QEMU_GA_VERSION)" />
>>              </RegistryKey>
>> +            <RegistryKey Root="HKLM"
>> +                         Key="System\CurrentControlSet\Services\EventLog\Application\qemu-ga">
>> +              <RegistryValue Type="integer" Name="TypesSupported" Value="7" />
>> +              <RegistryValue Type="string" Name="EventMessageFile" Value="[qemu_ga_directory]qemu-ga.exe" />
>> +            </RegistryKey>
>>            </Component>
>>          </Directory>
>>        </Directory>
>> diff --git a/qga/main.c b/qga/main.c
>> index b3580508fa..10314dfe5d 100644
>> --- a/qga/main.c
>> +++ b/qga/main.c
>> @@ -82,6 +82,7 @@ struct GAState {
>>      bool logging_enabled;
>>  #ifdef _WIN32
>>      GAService service;
>> +    HANDLE event_log;
>>      HANDLE wakeup_event;
>>  #endif
>>      bool delimit_response;
>> @@ -324,13 +325,14 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
>>      }
>>
>>      level &= G_LOG_LEVEL_MASK;
>> -#ifndef _WIN32
>>      if (g_strcmp0(domain, "syslog") == 0) {
>> +#ifndef _WIN32
>>          syslog(LOG_INFO, "%s: %s", level_str, msg);
>> -    } else if (level & s->log_level) {
>>  #else
>> -    if (level & s->log_level) {
>> +        ReportEvent(s->event_log, EVENTLOG_INFORMATION_TYPE,
>> +                    0, 1, NULL, 1, 0, &msg, NULL);
> 
> Interesting. imho we should remove the "syslog" domain, that's not how
> the GLog "domain" is supposed to be used. That's another story..
> 
>>  #endif
>> +    } else if (level & s->log_level) {
>>          g_autoptr(GDateTime) now = g_date_time_new_now_utc();
>>          g_autofree char *nowstr = g_date_time_format(now, "%s.%f");
>>          fprintf(s->log_file, "%s: %s: %s\n", nowstr, level_str, msg);
>> @@ -1286,6 +1288,13 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
>>      g_debug("Guest agent version %s started", QEMU_FULL_VERSION);
>>
>>  #ifdef _WIN32
>> +    s->event_log = RegisterEventSource(NULL, "qemu-ga");
>> +    if (!s->event_log) {
>> +        g_autofree gchar *errmsg = g_win32_error_message(GetLastError());
>> +        g_critical("unable to register event source: %s", errmsg);
>> +        return NULL;
>> +    }
>> +
>>      /* On win32 the state directory is application specific (be it the default
>>       * or a user override). We got past the command line parsing; let's create
>>       * the directory (with any intermediate directories). If we run into an
>> diff --git a/qga/meson.build b/qga/meson.build
>> index 3cfb9166e5..1ff159edc1 100644
>> --- a/qga/meson.build
>> +++ b/qga/meson.build
>> @@ -98,7 +98,24 @@ if targetos == 'windows'
>>    endif
>>  endif
>>
>> -qga = executable('qemu-ga', qga_ss.sources(),
>> +qga_objs = []
>> +if targetos == 'windows'
>> +  windmc = find_program('windmc', required: true)
>> +  windres = find_program('windres', required: true)
>> +
>> +  msgrc = custom_target('messages-win32.rc',
>> +                        input: 'messages-win32.mc',
>> +                        output: ['messages-win32.rc', 'MSG00409.bin', 'messages-win32.h'],
>> +                        command: [windmc, '-h', '@OUTDIR@', '-r', '@OUTDIR@', '@INPUT@'])
>> +  msgobj = custom_target('messages-win32.o',
>> +                         input: msgrc[0],
>> +                         output: 'messages-win32.o',
>> +                         command: [windres, '-I', '@OUTDIR@', '-o', '@OUTPUT@', '@INPUT@'])
>> +
>> +  qga_objs = [msgobj]
>> +endif
>> +
>> +qga = executable('qemu-ga', qga_ss.sources() + qga_objs,
>>                   link_args: qga_libs,
>>                   dependencies: [qemuutil, libudev],
>>                   install: true)
>> diff --git a/qga/messages-win32.mc b/qga/messages-win32.mc
>> new file mode 100644
>> index 0000000000..e21019cebe
>> --- /dev/null
>> +++ b/qga/messages-win32.mc
>> @@ -0,0 +1,9 @@
>> +LanguageNames=(
>> +    English=0x409:MSG00409
>> +)
>> +
>> +MessageId=1
>> +SymbolicName=QEMU_GA_EVENTLOG_GENERAL
>> +Language=English
>> +%1
>> +.
>> --
>> 2.38.1
>>
>>
> 
> lgtm, with the cleanup requested by Mike, I'll add my r-b
>
Great, thanks!


