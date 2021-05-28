Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368B39465E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:28:27 +0200 (CEST)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmgHa-0003TZ-Jq
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgGP-0002lw-PU; Fri, 28 May 2021 13:27:13 -0400
Received: from mail-he1eur04on071a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::71a]:22752
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgGN-0003CO-Q0; Fri, 28 May 2021 13:27:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWaObcb3xKEamrGQ7kL8+7f73DnTJnGeslwDnVSU5YEpDY5DhQO/eE5chZRFyrr6VPSx3VIhMpisQVk6HocmQti0gs/1Gaac66j5RA5Bi8V2IvU06oca/pZdY6hGI7MKQFknUyiWf1AwQ+qJOaPAZbEWGxilouzrkkR66aNKBZXQaz7Iov/Pxc6GKbn6/n7X81YyXQg05PncCigUNMCDNsUheBbuU7XOcXr01R5QElVaKVvnGbRorQIe/YR8bf7j1Ij5sHPEuuQZwmoPcPZeNSy5kDe3iykAY72FVA2wB5s8t06C3RBXpaGK586Nx3WuEDK3WuJ4PvV2qD7uSZvHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMj2IUaUE8A1yFIQj2HidOTiUmvLZwYM2fovVASSInQ=;
 b=YwuIMfx9v65zAk40tYtBqkNc1ZjGS1iLPika4SqQTDey70Dt1I5wK2PwNwneRvZpJCAJ24MkWAOQsAtmuUV7YtMiz6ttJCS0Q3iyM+8L7tTxI8LAVtmt7jfJlEV3GNR6kdEl3XmgZPV+I/K/VDS3RruAtHs0TwcKiSzUAymO9L/LWwYFjd8baYwAFgvdnVhNeSQbpyqNLhcWBRf5TJJFkjwdCMNsDLDbQHLepwcaejb+calGzVh/0nRue37gjg9fZ0CtTph/Ed79N73n+KUWf2S89kh62zeBiYUJY+95KuF49LxKR5zjPl7eP5HFyfpob9zb9fsrJbvHcMZB0qYDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMj2IUaUE8A1yFIQj2HidOTiUmvLZwYM2fovVASSInQ=;
 b=nuhWmgLpEZAl46O/29na8+O3C/3TWFD9j4Q6nNVqG9n2HwYe+a+lOZamb0AIfzZdGMBHO4JBZDFTyCljccoJoRUzIj/0t0zKH0ds3uRzT6RBMVzHEFmzyUmOJ/IeJKF42WGmxZqQOes0T8D8Xo7ACcoFwJCxK+ND06sMSc9osws=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3094.eurprd08.prod.outlook.com (2603:10a6:209:48::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 17:27:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:27:08 +0000
Subject: Re: [PATCH v4 10/15] qemu-iotests: extent QMP socket timeout when
 using valgrind
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-11-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <51b4420a-d166-40a4-c72c-481828c38105@virtuozzo.com>
Date: Fri, 28 May 2021 20:27:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-11-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 17:27:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e90821d-29e2-4c48-f90a-08d921fdd1b8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3094:
X-Microsoft-Antispam-PRVS: <AM6PR08MB30947816BD0C90884CB29EC3C1229@AM6PR08MB3094.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8f4ldoOlZ2hOPLTTB1NZfGMINRj8R3MWw4ljYZai4JDUIi4HbXlLgSjY0OgRrmM/uZp+y+ITyYoUgAG+9oFZMX8lF+jD+glw5ShDGcwqAhjL9hVMxS+0Vuq5HXg4tEoH+MGwfcx50bb6QyoR8htsLnNob+hgkZHooJDj/lR7/q5Xhp6h2x1n0M/xw2QO5pgrz5DSxunewckp39hQcGtEBn+oZOc2rKwTXKpDZri6XixaW2D7hDyGyJ3rk2ONEGRIYvl57YKeyW82j5CpNXChP/Rt6zfrhkZ0v7EGH9dcb+hstl88IFQ1Kj0ZIUJfCdbugmg7/vJ78rG7qsjqFSeYWW1/k29hE+/xEyczS22v8BGdVTLXvaFeE6sg3hhuCS+DcWn2p0SX81AQr3CCl5FsUbNGN1A+dHB+HCU9lqn0TdGjBz5ccprxg7BWTJjaVoqbBGhPrcWSjKyKVnnxzOpe55tgXrTaO/MN9jLy2q1kT4vJVsalXqbbWgnqKreyRkefSk99h8eahzKqd7DPh/gCgKBOTZgQbvBPGWUnH9jLSqKLNJ1P86U9ju/jvb3BfDvAwCHOFMemG10WCuT++yta009foA2zc4cdG1ql921DnfJwuAnFFXTh036m/GisEvRkgGR4Va0Tslc1pr0zFbrhNzBZ91jdQEUwDL2tSQF/l3fLuKoE4azmfyW8K0+XSFq9df495nZHHkGVvpCJHtUUje95DTJFXj9ZYPR+kwaCbkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39830400003)(346002)(136003)(26005)(2906002)(83380400001)(16526019)(186003)(38100700002)(38350700002)(8936002)(86362001)(8676002)(4326008)(6486002)(31686004)(31696002)(66556008)(66476007)(52116002)(316002)(66946007)(16576012)(956004)(2616005)(54906003)(36756003)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alh5VVcwYlJlZzJVOHZESEIrYVJNNklaUlo2SnoybWFaNnpEOWNLdmM4OHlW?=
 =?utf-8?B?UTh4ZHFIVVFRUE1lS2NpV3U4MjR5QzRidjh1NUZSdU5XU0dlcFdtSG55TDc0?=
 =?utf-8?B?U0YySmMzU09sd1FLbTVjTVVtSVBnZlR0MGp1ZE9zNk5yK2FqY1hsbVprQ0ww?=
 =?utf-8?B?WkJJcy9mVFU3WVduUWdoVCswdThMamVlbUtrNFpxYWNTNWdCN3pWMXJia1F0?=
 =?utf-8?B?a2JQUWROd0dEOHBFV3ZGKzd6TDN5c0N6TFk1aFd2M2tFUUNCTVV3VW9TL0dJ?=
 =?utf-8?B?WGdnL0lvRjlTMW9vc2l3U3B2cEZWRDhUaldIZHA2Z2FienN5dGdtbDRsbXJi?=
 =?utf-8?B?Mk45aDlUVkh5ZWlIaE1UNnYvUVByalhOSXA5emhTWVVKQ1FjZFlSQ3JXeDhu?=
 =?utf-8?B?VXhOOUJLaWxGTEYxM1Rnb0FIdHcrYlhwUVYvRG9GUmFwd0VjSjJSZHRxYnZF?=
 =?utf-8?B?UnI1aTZLL2M2UlM0TjM4QlJhd1lNU1Jwb2l1VUw3aVIreFJNN3F0YTZ0K29P?=
 =?utf-8?B?SDBsVzlYKzJnRWE0bUsvLytqaG91aURLbmVkc21BazBnTlZ6ejlWZzYvWmh0?=
 =?utf-8?B?VmFJMlUvM1NvWnZvaVdGZC82cDZidFR0anBVSlJtRkU3OW95Z3hERG9VYmxU?=
 =?utf-8?B?T0VMS0thcjUrdTBEQXF4MjZrZEhVU0k0OUxWamNLamRkNTZOeGFYR1dQVWk3?=
 =?utf-8?B?NWROZW9IWVVXMzhqSm04OThMSStrckdHZm5kL3BURWhTYXA3dDRpejBncC92?=
 =?utf-8?B?d2xkTkU0VHNZNnduNm9NMXFDM0pJYTJlaHdjdE9MN1N2Sm1QYnAxSHk0ck5S?=
 =?utf-8?B?VkNBa0wvZG5yRlE1OXltMk1Rb1FWU0F1c2ZYT1piUGFPOHBvaVdNY3ErV3Vm?=
 =?utf-8?B?WGg0YnZxbGJma0hpcDE3aHFNbXpySFdKUXFXOE1hVFFzSXNWNnIwcGM2bjJR?=
 =?utf-8?B?R21ZbXFGY2g4T0NTeDRGbys3bjE0SVFSY3BLSWdVcWpUQzdNRUpwMllkRTl3?=
 =?utf-8?B?TThtVXVyb2tYTUpkdnFCbE1MU0RORXJFZmd4WUJkai81Qll6eWxmMDZUYmxu?=
 =?utf-8?B?UzVzaWZEc2xYbVhvQmc1SjlQQU5xTGVDd2NQMi9HbzNSbXFKUVFZd3hZUm9y?=
 =?utf-8?B?ZFNvRE9NdVlkK1FLUE1QeGoxRkhBb0FOdXBweUtGSzJLdXozV2JtMElYVU1V?=
 =?utf-8?B?eWRWaURCRW1lcEE3anpHTTF2NlZPc0ZOdGVjSnlDNXdGemNEVTFWaERLZUsz?=
 =?utf-8?B?ODQ5WkhDQVZBMldYUGpoY0h5V1FpQWpJQnBERnV2b09kcC9SUDZxeDllY3RB?=
 =?utf-8?B?Yk82RjFVTTlDeEZRSUMvNGVCNi9BYTFCSDFJTkpibGlPMWlZRzN1bHRPaGpz?=
 =?utf-8?B?TjJaRXRRNUltT2VLbVo5THpQTlIydGNWazZTNDJCNFF2bXg1UFhPRWR4cDlX?=
 =?utf-8?B?Y1Q5Z0k1NENEWmE2enN0RDZzcTN6RTlVMEhKbXBrTnlXRHpQangxSURJYUVt?=
 =?utf-8?B?Ymx1NnJaMnphcW9OUTFreW1WdHJ3V3FMdWxSMndIdHBkOFhXVVlrZTRZZDUx?=
 =?utf-8?B?RTc3WlpDWkdxdlZlSEdTelFTR0YxcDhJbVFpUGlIYjJYY3NwS0ZwSkh5U0tn?=
 =?utf-8?B?WDZBaXdyaDhxWENBamhadU1NaFhaMHJQSEprRTBpZko4b1RjVVNwREpmTFBB?=
 =?utf-8?B?YlpnWVY2ZkMvd1B0UnBLTlJ5Rk1LM3RjVlF2eXVmZGp0ckxxV2xIZlBOZW1p?=
 =?utf-8?Q?/UaSoSWUoNisqpmLrXDloqOCNoYA9MRIjVZMCuw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e90821d-29e2-4c48-f90a-08d921fdd1b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:27:07.9913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4whIYi73zkAf8SNAwBEb0lzcM//aHaArDlHMIL3pmCPjwbuhZ0AUXXh729jHKz8mCn/gTQJWAd/clvbRtRZ+jtLri8j7UthCdG8TWrGBdIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3094
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> As with gdbserver, valgrind delays the test execution, so
> the default QMP socket timeout timeout too soon.

First, "Timeout" class is a generic class for timeouts, not relying to sockets. So,  commit message lacks information about that we modify generic context-provider class and why we do it.

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 41462a80fc..5d75094ba6 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -489,12 +489,12 @@ def __init__(self, seconds, errmsg="Timeout"):
>           self.seconds = seconds
>           self.errmsg = errmsg
>       def __enter__(self):
> -        if not qemu_gdb:
> +        if not (qemu_gdb or qemu_valgrind):
>               signal.signal(signal.SIGALRM, self.timeout)
>               signal.setitimer(signal.ITIMER_REAL, self.seconds)
>           return self
>       def __exit__(self, exc_type, value, traceback):
> -        if not qemu_gdb:
> +        if not (qemu_gdb or qemu_valgrind):

If you follow my suggestion on 05, you'll have to modify only one line instead of two.

>               signal.setitimer(signal.ITIMER_REAL, 0)
>           return False
>       def timeout(self, signum, frame):
> @@ -589,7 +589,7 @@ class VM(qtest.QEMUQtestMachine):
>   
>       def __init__(self, path_suffix=''):
>           name = "qemu%s-%d" % (path_suffix, os.getpid())
> -        timer = 15.0 if not qemu_gdb else None
> +        timer = 15.0 if not (qemu_gdb or qemu_valgrind) else None
>           super().__init__(qemu_prog, qemu_opts, wrapper=qemu_gdb,
>                            name=name,
>                            test_dir=test_dir,
> 

still it should work as intended:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

