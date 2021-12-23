Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD67B47E0E5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:36:25 +0100 (CET)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0KWO-0000nt-EK
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:36:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0KTv-00072O-IJ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:33:51 -0500
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:32486 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0KTr-00059P-3M
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:33:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOglsJoeSkE/qsudkNyL5uaT7WpL1XxposkuPHVB0b9a55oj16DAMQcx6DL3Zpz3/4LoOcH0LtOOm4KzPKo2FjdGQ+DovBfoafNTiAhHV+w1kKmp1wl3S86P2950rU0j0q/W00ReH0LxGBKfNlXFxuo5q8zM95jcxTZ0Lj979ExtnjEG+zS5CTXuuubMpvmNuJ4fKjgKIRJ2yQ0ktFLhahropSMRL2LoOWUop/zkN8kgvy4payoyQgM2Oy6eIBZIgUvVzTYL2DBh8k+QhfMkxusQkvZvpN9PmHUmg5VaNBvu9xIj7Nor9GaaKC8f6Qw54SIIwVVI3aMaoDmLxL9SdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm+Ld4r4tMNtM/8CxTJId9lsW0Ce1TW09A1vsDuIklw=;
 b=S6y+C9Vwj8Sf8LDGcOjUpoqr9LnkHjeFJHeZ4ti+4gvWIbMZIvVefu6c0ciuxOGy7byd21b5PZcXTl8nmLEUVk1aF1Ts8/vYFlw6sJROriHF2EhfKIC+8wTrg9AF35Ays4jCDls0N1j1sSCbMTgcrwFkbrxI9pTNtuOpXTAjpXZFNs7H3c11k1egii1QNkvboyKeaTnXpVag4SQ4EUI7n8ItvjEbmFu9QI8HUa7J6AtTYTPJ84op5kc7EZAdgjzEvxl+mqzE0iAY/a1y4tm6K/YUwE7mPz3RlXzRPbvrnXjcjJQ96ecPzdq/gNP2VRD+P7Kc0kPTwKL14gGt94blWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm+Ld4r4tMNtM/8CxTJId9lsW0Ce1TW09A1vsDuIklw=;
 b=HBZAOn3N1BNulNISsbZfGbrDe79QVdE2ZyXF++B/YacvXkssk1/7Blhox9Q8cheInfciyHcXlYmKiOd0sbb/eXAjwkMvf18ebdzHEGdvRU9UIXVduxGitaYoiEX7veiPuNYKn7EFKBfaPAsHkYyBgz6DI+f11kJxmkzpnfDPC4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5587.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 09:33:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 09:33:42 +0000
Message-ID: <1623e94d-3991-ccee-baaf-7e3154c637a0@virtuozzo.com>
Date: Thu, 23 Dec 2021 12:33:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] meson: generate trace points for qmp commands
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hajnoczi, Stefan"
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Armbruster, Markus" <armbru@redhat.com>
References: <20211221193502.114296-1-vsementsov@virtuozzo.com>
 <20211221193502.114296-4-vsementsov@virtuozzo.com>
 <CABgObfYqiLwfNf4_p2_HYQPvAHKAQ=4DNr1y2OMecoO6kpovzg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CABgObfYqiLwfNf4_p2_HYQPvAHKAQ=4DNr1y2OMecoO6kpovzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a981546-00c4-4639-9247-08d9c5f74f34
X-MS-TrafficTypeDiagnostic: AM8PR08MB5587:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5587CF399D47F269112BD386C17E9@AM8PR08MB5587.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6cWnxqxgX3OlozE7pAYdSR4WgsF8u0X1+abREJ0KFZU4DMLvowKU7gywhIpOASOwcS4TPJIEAwukFEFT8M/1tZRrkjXbnndZmKfEBAcwDo8381DuoOXkhi/61Nk7kPNxrW9/qJRiaFnFLYoF8vkwubWlmfOU8ISM4nPGG+p6h3ZevDMxW1ij0XNrJvCSORAV/duQ6obhwSyja8FJGehyrcxHUpy3CpbfBlETp2nq9z+7sDjtuC0W2qBTfptj57g+Z0VGoJOSVfs16nx/bKSuus6ErgDItBFwjczlFe0jIlqQou0OwA5gIpwcQM8eFP81TLT/VEpfGcce/ShBWWhJHGAmrmTNNfQikR1nmMS3W62JC0T5jNQ6cbequSwSyaFMCb90jCZQuSWK8Qp8LIL3X43EtEaNZUMI845dqztmAG3dTuTdDsVO6NrfKrv7TiUMhI8cm++Kwnmsv5DHkW8KaLN34Jq5SvY3VfpKylDXmjFtETZAnvsoHRRTfXav8J85NJac4m+S9PMwTibfioadDOt3rmcMXzhijS2EZhyQ2y77C4DjZzQkdV75WIfMMXVDCPgi53eU2BBU87jrOuA2F36WDtnjQBejQxcaSHB5AbyykatU6H1aRjr37r6EKgSAlr3UJX4T32fNvD0eO8JLSWlmZy47BEml0CWbpxZVyXJ9JeoW2BtqgB0eTcBtpGsAbUnLX3K+B/7zfryJ+jBElSYyhBRvfBHvptt+4/lhmGVhqtICeMQ9LhsIEHFb6kksuvXVPVtQ9qtXIXubDCplQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(66556008)(66476007)(66946007)(26005)(36756003)(186003)(508600001)(6486002)(38100700002)(38350700002)(6666004)(31696002)(6512007)(5660300002)(4326008)(86362001)(2616005)(2906002)(8676002)(8936002)(316002)(6916009)(54906003)(52116002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3htTUZ4bFk0eG1pc0xDcnZheW04UkZ1YmhueEw0RTJFaXk2RzdNQ0NyaS8x?=
 =?utf-8?B?N01wWm0vYkJwZ3FiRm90TWVDTUVYd2RHbE9RVzdHVFBIakFybVc1NldwZ1RY?=
 =?utf-8?B?MFpkRGU3cFFoaWlUMVV5ZzZXWHhEc1NPTERocTlzLzlJVXpsR0MxUUc0aVFS?=
 =?utf-8?B?MkV6dmVhc1dnLzBTbm44TjVWWC9IQUpGNXI2b0g4djZwRVprRXVINytFQVJx?=
 =?utf-8?B?Q2hRUWIxVS9iYkVpRmVrS3A2S2p2RWNkaDBZRHFGU1VNWFhyWU1ZMUVVL2RF?=
 =?utf-8?B?VDVpYWlOU3ptbktqK28raUlwaUNWRkhHMjFIUGNHQ3VETXd6TW5XOXErL0Uy?=
 =?utf-8?B?L2lyeW5ucTA0WE1SNEN1STN2bU9YbU9wQTFTV1Bqdi9aa2RNTFNOb1c2TW9Y?=
 =?utf-8?B?TjE5VnVSYmxZTkZVSnMvM2xOQ2drMndWc0RiQzlPN29xSloyMGZRMTFwdzkz?=
 =?utf-8?B?VlNGSlQyUEgvakp2bW9lZUxEanVpUDd1cWdlVFRtRUpOT003dEZqZkFRMUMr?=
 =?utf-8?B?N2gyaFZheWNVTUkwUEhwVUlJRlQrKzFRdC8reDduMjVTdkpLNUVZYy9JZlhj?=
 =?utf-8?B?RUlsMnpUSWRkTVRSZU9uRDlvTGd2UVA4dGI3QzRFNVBmd0dGbzA4cEJEcEY3?=
 =?utf-8?B?MzhIWVAxQkR2d0tPU01FMkJaWTBRNW44SXdCN3JhVFpmemJ2emIrNEdtRlBy?=
 =?utf-8?B?eWNDSHF6QlVqYkZpTFZEaFNDaU5KamJvWDlzQ0RYeHpPRG95VWlCSnMwVFZo?=
 =?utf-8?B?bnhHRDYwb2J1UVV4SXUvSWJ5ODNmTWdGallTVGgzRkFqKzVVUFl1QjdBeS9P?=
 =?utf-8?B?VXhoMHNMTUVETERTZTlYaURXRXFFQ2xpbTJNNFpCTG9TMXVIZmE1RFptQnhj?=
 =?utf-8?B?WGxDSVROUGEyYWNYMVhhVFVnRUpiZ2lkQ2J2UnJ6Y0l3VHpPN3MySUsxOFRK?=
 =?utf-8?B?YWJ0VTA2cFZBM1Ezd3BTbXhCMkJPcFVkWVNGb2w4T082VE1CNjF1czAvekNz?=
 =?utf-8?B?bjBWb0h6c1FDbnlHc1RuejFKM0NvZ3d0cENzdSsxZFkycktFODhyOGJOTnB2?=
 =?utf-8?B?M1lnbTExMGM1eDRSTmhpMzRTWUt6SEF5TFFPL1FrMDhwUFU3LzVqenErMTJF?=
 =?utf-8?B?b3lwSk1QMkdhMzZVdWR2cUg0d0tvV1VDMTRST29RWlZUb3hsSmFVNnJva0pO?=
 =?utf-8?B?UjVVdmg5b3VhSWpVbGNLWk1ycFRzVEFoRURzN3c2eEw5bHpudnI3YzBKdTJC?=
 =?utf-8?B?b3NxZVhwWWdKUFo2NU03clowdktrU3ByK3BKMU1USUl2QmpNT2wxamw3L3FV?=
 =?utf-8?B?S3VIWS9PQ0NvMzNmTTM5L0JmTVZFbzRKTjZCa1Erenh3UjZyV2RTMkxPYU1m?=
 =?utf-8?B?ZTdkSk40NDNRNmVoNnViblNWclFaQnJVTUxUZjFGcU5rRFc3bEtZSStVSjJJ?=
 =?utf-8?B?cVRvTSsvZWZ1VERqaFBLbVBsamgwcWpBMngxRmVFQjJ6bTdUangwcWgxTGtP?=
 =?utf-8?B?UkFmVnA0TEllRy9EM01mZ0I1K05zRldKTE5iU1ljdlJSMTVuL3BmSk1hZFYw?=
 =?utf-8?B?S1FJYVA3dW9PcDdyVk1sbW9oMWFJT1BmSnluRCtVeHRwS29xY0RrOUVhRFhE?=
 =?utf-8?B?ODV0Y3h3TXJYeHhERFJFSFE4cVU5ZzdoSEVMQnZKVFlJSExwTDJ5a2xSRGVL?=
 =?utf-8?B?eUJEakdQZjh4Q2ROakV2VGdCMXBZQXR3UC9BQjM4c2c1OWpWcEc5TVRZem1C?=
 =?utf-8?B?bGZVY2JWalZYL1NDaWF2YWlnSmEyRTZnV3ZMd2hKMWR6M1lYVVk0OTF6YzA0?=
 =?utf-8?B?cUtGOTdpczhGbHRGZmk4MVMxbmJKMkE2NmxKaHJLNkNSNGJ2dUlUY3AxR002?=
 =?utf-8?B?Wkx0NzNvQXpUN1ZpR3RYMzdNcjQ1WTVmUGNqT0FlZjFiSWhJb29KUEFVUUR6?=
 =?utf-8?B?d05UQjQvVEs3MHBjTFZpR3BIQkZZWlJpK3Q4T1F4bnh6dUwxQlhvbFNNYUhl?=
 =?utf-8?B?ZW5OWFUxUGlwQkxEVlloRjAzcHMyNFBLVWNLdTlkeVJJTXFzYVMxSVU4T05S?=
 =?utf-8?B?QUNLQ0FWbkUxK3VKZW9HWk16U1VwN2pDak55L1VqRk14bFYvVThWNndhMUpT?=
 =?utf-8?B?cEpxRHd5OThvWWpiUVhCaHhRdUdzU0NXSmlBcjBOeU1nVkRiaXo3Qk14MHVC?=
 =?utf-8?B?T1RORCtnZGdoeHhSeGlQbk4rVjNuNHd4RmhBRzZ2eEs3VkUxaGR3ejBiRHpj?=
 =?utf-8?B?ZTVzcEtYZ0hHN2pXRUZESW9uenVBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a981546-00c4-4639-9247-08d9c5f74f34
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 09:33:42.8418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uT1HBHVdKp7LTJfPD6vscr56EEsRiLzPGjWho0VpcKEwO+/lODcHmjz9AJoQ6krHN0Z5l7a8a3otPqKQ1x5UclhxbITjW/k8r0/Bgiulexw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5587
Received-SPF: pass client-ip=40.107.8.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

23.12.2021 01:11, Paolo Bonzini wrote:
> Il mar 21 dic 2021, 20:35 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> ha scritto:
> 
>     --- a/trace/meson.build
>     +++ b/trace/meson.build
>     @@ -2,10 +2,14 @@
>       specific_ss.add(files('control-target.c'))
> 
>       trace_events_files = []
>     -foreach dir : [ '.' ] + trace_events_subdirs
>     -  trace_events_file = meson.project_source_root() / dir / 'trace-events'
>     +foreach path : [ '.' ] + trace_events_subdirs + qapi_trace_events
>     +  if path.contains('trace-events')
>     +    trace_events_file = meson.project_build_root() / 'qapi' / path
> 
> 
> 
> Just using "trace_events_file = 'qapi' / path" might work, since the build is nonrecursive.

This say:

ninja: error: '../trace/qapi/qapi-commands-authz.trace-events', needed by 'trace/trace-events-all', missing and no known rule to make it
make[1]: *** [Makefile:162: run-ninja] Error 1
make[1]: Leaving directory '/work/src/qemu/up/up-trace-qmp-commands/build'
make: *** [GNUmakefile:11: all] Error 2


so, it consider the path relative to current "trace" directory.

> 
> If it doesn't, use the custom target object, possibly indexing it as ct[index]. You can use a dictionary to store the custom targets and find them from the "path" variable.
> 

O! Great thanks! Magic. The following hack works:

diff --git a/meson.build b/meson.build
index 20d32fd20d..c42a76a14c 100644
--- a/meson.build
+++ b/meson.build
@@ -39,6 +39,7 @@ qemu_icondir = get_option('datadir') / 'icons'
  config_host_data = configuration_data()
  genh = []
  qapi_trace_events = []
+qapi_trace_events_targets = {}
  
  target_dirs = config_host['TARGET_DIRS'].split()
  have_linux_user = false
diff --git a/qapi/meson.build b/qapi/meson.build
index 333ca60583..d4de04459d 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -139,6 +139,9 @@ foreach output : qapi_util_outputs
    if output.endswith('.h')
      genh += qapi_files[i]
    endif
+  if output.endswith('.trace-events')
+    qapi_trace_events_targets += {output: qapi_files[i]}
+  endif
    util_ss.add(qapi_files[i])
    i = i + 1
  endforeach
@@ -147,6 +150,9 @@ foreach output : qapi_specific_outputs + qapi_nonmodule_outputs
    if output.endswith('.h')
      genh += qapi_files[i]
    endif
+  if output.endswith('.trace-events')
+    qapi_trace_events_targets += {output: qapi_files[i]}
+  endif
    specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])
    i = i + 1
  endforeach
diff --git a/trace/meson.build b/trace/meson.build
index 77e44fa68d..daa24c3a2d 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -4,7 +4,7 @@ specific_ss.add(files('control-target.c'))
  trace_events_files = []
  foreach path : [ '.' ] + trace_events_subdirs + qapi_trace_events
    if path.contains('trace-events')
-    trace_events_file = meson.project_build_root() / 'qapi' / path
+    trace_events_file = qapi_trace_events_targets[path]
    else
      trace_events_file = meson.project_source_root() / path / 'trace-events'
    endif



-- 
Best regards,
Vladimir

