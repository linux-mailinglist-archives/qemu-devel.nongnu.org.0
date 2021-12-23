Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86C947E1A8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:43:26 +0100 (CET)
Received: from localhost ([::1]:60964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0LZF-0000kc-Fh
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LXa-0008VP-0n
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:41:42 -0500
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:60641 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LXX-00057d-JD
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:41:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXq0lzt9hoj8vW+jHIs0fbNzkIy/rgtUnffz1G0WJ7PEYql1wHmtj23amatfck8d3jrF/5p+PJ+SZ0t5aATPW2T0UF2ZIXUMtmS0Nb3U1fo7MOQOQVqpIXx8y4qNN3362D1Ea8UG95pSC/0LsDMCOjxiEftav5UT6GGvxYkyoQWgsUpUzg8GkSKxkyrgNTrOSBrKsdjdnLNK9nu2Y/uJMxG9iGXz/aVSQjwGq/MDH0/Jyu3DfTPcDyCohQNmjopD5R77z0gEEDaTdiFDavsu/dDSa11pMcdF84I3R/grKUbZ4oXABSEDW28PMD0UGAw4dAfaoGJwn8YcG84Xq7vFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPdFFMpWBp2O2m3rZLedqdLQC4nx+DKumhgh6QicDSI=;
 b=Ub+fY954xak96JEV2STsBL7rW+MbZJwKciSrIvq/bkEAJmMItUAf7Yc40xUvXxOvbXeUrRlcBaWgFTofnjWRi9HGi22cTDN4ZQSl0xP8ZDhGBTFsGMZTsd+bqUkZ9+tpv0apNGcJf1DpkP418PbT7tm2Y2vyA9OOUdNGZK1RQyPxUKJlidRbqmw4rZ77GDcl0vjJGc3UJ/UHBJVTUUA0BWSqDYoTJBdSzzobd4Y6Zxgmnb+kdkOSHomtibxJhV/0Yc073g42QFBlAwrlicswSRkICrNGb1hepqcz6ioUVG1LPwy91lkwMe2dBKVzcOcBJMvukZZ62m5ioj/7yC+leQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPdFFMpWBp2O2m3rZLedqdLQC4nx+DKumhgh6QicDSI=;
 b=kf3UGYRyS2cnUtpkvFK0Z7fa4x67hLjkriincoBr1wgHEY+Ue5G20TTyUgUmMgB8T9zjHJBVoqi7ocDsXDCA/kB2X4omNE3DQgHpNuIstQYF81BT30vE9JdaPGNNkNBSug278axQGpItvxQds1VCPuxXz78CpYHD0msnv9Ns3ww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6627.eurprd08.prod.outlook.com (2603:10a6:20b:368::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 10:41:37 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 10:41:37 +0000
Message-ID: <768f5236-bc62-84d5-d070-e964097b1267@virtuozzo.com>
Date: Thu, 23 Dec 2021 13:41:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] meson: generate trace points for qmp commands
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hajnoczi, Stefan"
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Armbruster, Markus" <armbru@redhat.com>
References: <20211221193502.114296-1-vsementsov@virtuozzo.com>
 <20211221193502.114296-4-vsementsov@virtuozzo.com>
 <CABgObfYqiLwfNf4_p2_HYQPvAHKAQ=4DNr1y2OMecoO6kpovzg@mail.gmail.com>
 <1623e94d-3991-ccee-baaf-7e3154c637a0@virtuozzo.com>
In-Reply-To: <1623e94d-3991-ccee-baaf-7e3154c637a0@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0306.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7252c4a7-8c68-4989-c90a-08d9c600cba9
X-MS-TrafficTypeDiagnostic: AM8PR08MB6627:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB66270DE4D71B64611FE5F08DC17E9@AM8PR08MB6627.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oBbzzxwXzFk2owq7EuMbJ51ciu6BWPbFK0grn+6Bh80Tum0p9aKqSyjvtb6MgPARedPIzLvW5La9yB4WtU2ZF/S5VTt79LI88o4pskipREfClrGjP9VwfBYwHIUH6r0pLIvTbF3Gnrvuc1+rTbQRjrsSQRayL+fBDv1qp0h+fa+9Uq5mJtXvZU6OkGLlZL3ibkMJBT9TVotbIuXM5nZRMSENdV1kaVnvJJjCojO3wTte66qykrMWDPa73My0c+ak/vrpD5/uD/DtKk0Xm1+QxTMJ7CAGmgna24o7P0RicU2PDf0wIK77b0jCf57k2c6Air8ydqxEiAJ4Ag10fMWZ2Uo8ID0usS9QydaHeGziLxZoFhZ4aaTU5Dd0Cowy+rhKBZdyfWWK1alFUFmoapHH5W36TxXGYVN8VupTfoxLD9g1BrUDhR4dUbv9eu2+6+8ePC3v8nS6R4Cz6gSPpnPsbU4jceERDuOAV9tt/Br7JXKIT6gWw2CiCNg4sPIXRimVe4y9vR3oyM/YzTPGSBorhwVhqS7Eur3QeDx2tQ4ML0aT3Cg1Toa5OxF8iZJektW2XO9KrBDV9tXQ2hOBzi297NAp1CSAk34cDB6BrRdecqyzaOMjzQ82D7I7MxWL7F0gzOAnVG2NlcB1ob0JshPO2wyNsmTNxQDMpJ/T05iY5yVwl64f/gUlzjj3sAaaTeRsbihsWIxVzeShyHU7AKm2MR0r8vNHMUsGshvf+s4IjXvJyJa9wgSyv+S8XWpw4fHgzMa4wlWBRv4JtwAA/0+JxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(52116002)(66476007)(6486002)(6512007)(8936002)(2906002)(31696002)(316002)(5660300002)(54906003)(36756003)(66946007)(508600001)(2616005)(38350700002)(8676002)(186003)(38100700002)(4326008)(6916009)(26005)(31686004)(86362001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V05Wd29SUHpYazJRd1UvdXlUZTcrdi9oMTUvN0tVelhabW5hdGl1bCtNekZ6?=
 =?utf-8?B?NkQwRUhDSEd4MENCT2MxbEkybHBDNk43eDIrRW81QUovZUc3Z3gyZGxFeFlm?=
 =?utf-8?B?TDdkaXFGblB2ZkJHbTR6UEdKS3lRMWdSSUIrNHNuZE9kV2xmSGZCVWk0c21j?=
 =?utf-8?B?UHJ1K3YwQUdaMjhpNEpaMktnemc1RW9OdTQ1Q29ZNUJXUlBTWVpYTlNkSDZ5?=
 =?utf-8?B?UkowTnNza0oyVGpydmN4YzhvUjVHZTBrazc1VDM5M1phdndkcHpCaUoxZmtQ?=
 =?utf-8?B?RHd0YzMyRTVGblMrMUZNeGhNdEZvalhBelJmYm1jQWVDdnBmWXlhcHFHZnBP?=
 =?utf-8?B?M1Jtem9ucVNtd1BCT1d1U0hwZ0NKOUVrSWxhTTBYV29ZbWpJWGt5OWdpYUtT?=
 =?utf-8?B?N09rUXQrU29weUNSNmpVUENlLzlUQ3JpL1dIUjZ4VjRGU2cyRzY4TUxINWZ0?=
 =?utf-8?B?d0ovamF5SHRlMS84U1FVa2JUbFhZdmtOK3JGUEJwNVFRZWFXTWhvTjljeEUz?=
 =?utf-8?B?b09BWlMyUTdHbzFEMHpKa0J1KytoWHdDb0hKMHpBL0MzeEJLN1JrL0lwRERN?=
 =?utf-8?B?bS9vU01vWThYcGlXMW5aMFJNVkR1SnZabzc3aW9mY0VOeGlyN3ZScDlRRjZm?=
 =?utf-8?B?cFBHWnN0RUgzenFhTWxLbE00UmlsWmxFaURGKzFrYURzVFVHVjUzd3YxMGVL?=
 =?utf-8?B?dmhFeWhNb0ZiaEtJSDNYb1N1dktEay9maEdGNSt4RzZ6bCs0Q0poajlJd2dX?=
 =?utf-8?B?TFYwQ0FOazZNNlRISHZsVDZudERDYmF3SkRleUp0ckhXdlROMXVIM0RQNlBw?=
 =?utf-8?B?d1MxbDRsc3M0T3dNeUF5RDZiRmRrRGFlemhOblNnUzZZZ0FDTHdHTHhDNWxW?=
 =?utf-8?B?RStGU1IwYUM4TStFeWhSNmNQSWt1d2x5N2x3OExmbFdOMlhtS1FCWStMSkxR?=
 =?utf-8?B?UUhwN3RvekErZWgzMmFic3pJZ1djVEowWE1wNFRnVDVOL2cvTHlZdGY3a3pJ?=
 =?utf-8?B?UGRPSUhPSnlCWTFFdEFueUx4aktFa2E3UzNQYXZuUmNTSG9uVFFmNTJhd1lD?=
 =?utf-8?B?dmpWdDlvZkhKRHlqQlY5YmEzQUlXSm9tVnBORSs2QUo0d1k5UWpLWWpDMUtP?=
 =?utf-8?B?OGdIWktwRGovRS84MEsrdSt5bGQ1emxqbkZVOHlUb05SNGFmRkp2bVJ4TWJv?=
 =?utf-8?B?Rm9VMHJNb0plZWlmM25FODJtMENIZHorYzZZQmdOSTFLdXhxM01UOWErZ0tB?=
 =?utf-8?B?bWtKYXo2dVlYajF0Q2RMYmdSNW9nZURyRTZCYnQ0UlpCTnZkTjVqQ0d6ZnFq?=
 =?utf-8?B?a2Fsc3hUcExsLzR4RDNqZ2pVMGNZRVAxNHF6NnJON0NlR3lpaWdWSVJUeGpW?=
 =?utf-8?B?WjFHVUFkTVpzTWw5WllXYk9GenAwem9MV0pGM2FlWGs0TXl1dTlzRmZDdndw?=
 =?utf-8?B?TEV5L3FSWmZ0aWllT21ZeEZiamlJek53cTlSVmJFdE1NcVpOUXoxRFVFeG5z?=
 =?utf-8?B?SjVWUWlxdTRwaGpXV0VxUDc2QzlnOWZqOC9seEpqVmw4WE1MakZMQXZta3NK?=
 =?utf-8?B?QTBxTWpFQjBKTnBJSHh4TWI0QXZGcDNtTkRDSy8yd3FSN3dPaW0xbUFzbHpD?=
 =?utf-8?B?V1M5eWVUS0tqNlVOZXFOUHpPUE9QWlQwZHhIYzYyTWxQcmFRRm0zejBmVENW?=
 =?utf-8?B?RjdJeFFWZkU5dHZ3Sjd0V3kwaHk4dmlnQUFHSzZqMlpSV2RKRDVJQzdJcHJo?=
 =?utf-8?B?cmx0aXVmWjhaSWZrSFMxMFE0Qy9aeldidUF4bGZwQ2JBckNvcWdXSTZzTXdR?=
 =?utf-8?B?ZTU0U0J4OU5UYWlQbnV6TzZnRm9JNXlMbXJRQUtxU3ZCMTUxTTMzY1Y4VEs4?=
 =?utf-8?B?enBEWkFLUlVnOFllR20yMlErZDNJMkIydnJNN1VPYWxzWHVKbDU3K3IzbHZV?=
 =?utf-8?B?SExhUk9SRzI5eEFyMU1wVW1GdzB5QVVKdi85bXlLR0JkMHJwaHRrQTM4WExW?=
 =?utf-8?B?SUVQTXRwS0VGck8zcWpjVnAxaU82ZE8rMEhMWFJpUk9oRFpKeVVmQjV0YkNI?=
 =?utf-8?B?dlo1My9MdEM5VmJLL1d0d2szS25xcFJ5R2Y2d0E3YTQ0eUNqNVBoZmIvWGJW?=
 =?utf-8?B?V3U3bFVEZWdVdVlldWxZNm56VWdCREowVGoyelJETWhyUmdxVGtwOWlSK2M2?=
 =?utf-8?B?MS9Sblhldm5pSGxrTGhkQmZIK2tjT3NOYmpsUWFkNDBVSnFiUExjS2pqUGhR?=
 =?utf-8?Q?Y9IxqY0BbKCpUHedOnYQjus51D9qOlFRGxDiS6MiiE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7252c4a7-8c68-4989-c90a-08d9c600cba9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 10:41:36.9462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tY41Ig1y9mdEAjNxD9D76aKGrI4e+heNFSD2rAndbpKD+hPg0gcsnZnJOtcWV3jmw5bbgC5ShLDLJiQs/KakwAXG+nQlaSBkL31H7JUXMpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6627
Received-SPF: pass client-ip=40.107.20.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

23.12.2021 12:33, Vladimir Sementsov-Ogievskiy wrote:
> 23.12.2021 01:11, Paolo Bonzini wrote:
>> Il mar 21 dic 2021, 20:35 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> ha scritto:
>>
>>     --- a/trace/meson.build
>>     +++ b/trace/meson.build
>>     @@ -2,10 +2,14 @@
>>       specific_ss.add(files('control-target.c'))
>>
>>       trace_events_files = []
>>     -foreach dir : [ '.' ] + trace_events_subdirs
>>     -  trace_events_file = meson.project_source_root() / dir / 'trace-events'
>>     +foreach path : [ '.' ] + trace_events_subdirs + qapi_trace_events
>>     +  if path.contains('trace-events')
>>     +    trace_events_file = meson.project_build_root() / 'qapi' / path
>>
>>
>>
>> Just using "trace_events_file = 'qapi' / path" might work, since the build is nonrecursive.
> 
> This say:
> 
> ninja: error: '../trace/qapi/qapi-commands-authz.trace-events', needed by 'trace/trace-events-all', missing and no known rule to make it
> make[1]: *** [Makefile:162: run-ninja] Error 1
> make[1]: Leaving directory '/work/src/qemu/up/up-trace-qmp-commands/build'
> make: *** [GNUmakefile:11: all] Error 2
> 
> 
> so, it consider the path relative to current "trace" directory.
> 
>>
>> If it doesn't, use the custom target object, possibly indexing it as ct[index]. You can use a dictionary to store the custom targets and find them from the "path" variable.
>>
> 
> O! Great thanks! Magic. The following hack works:
> 
> diff --git a/meson.build b/meson.build
> index 20d32fd20d..c42a76a14c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -39,6 +39,7 @@ qemu_icondir = get_option('datadir') / 'icons'
>   config_host_data = configuration_data()
>   genh = []
>   qapi_trace_events = []
> +qapi_trace_events_targets = {}
> 
>   target_dirs = config_host['TARGET_DIRS'].split()
>   have_linux_user = false
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 333ca60583..d4de04459d 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -139,6 +139,9 @@ foreach output : qapi_util_outputs
>     if output.endswith('.h')
>       genh += qapi_files[i]
>     endif
> +  if output.endswith('.trace-events')
> +    qapi_trace_events_targets += {output: qapi_files[i]}
> +  endif
>     util_ss.add(qapi_files[i])
>     i = i + 1
>   endforeach
> @@ -147,6 +150,9 @@ foreach output : qapi_specific_outputs + qapi_nonmodule_outputs
>     if output.endswith('.h')
>       genh += qapi_files[i]
>     endif
> +  if output.endswith('.trace-events')
> +    qapi_trace_events_targets += {output: qapi_files[i]}
> +  endif
>     specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])
>     i = i + 1
>   endforeach
> diff --git a/trace/meson.build b/trace/meson.build
> index 77e44fa68d..daa24c3a2d 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -4,7 +4,7 @@ specific_ss.add(files('control-target.c'))
>   trace_events_files = []
>   foreach path : [ '.' ] + trace_events_subdirs + qapi_trace_events
>     if path.contains('trace-events')
> -    trace_events_file = meson.project_build_root() / 'qapi' / path
> +    trace_events_file = qapi_trace_events_targets[path]
>     else
>       trace_events_file = meson.project_source_root() / path / 'trace-events'
>     endif
> 
> 
> 

Or even simpler, I can use a list combined from needed qapi_files[] elements. So, the solution is to use custom target objects or their indexed subobjects instead of raw paths. This way Meson resolves dependencies better.

-- 
Best regards,
Vladimir

