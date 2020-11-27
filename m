Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78BC2C66FF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:39:45 +0100 (CET)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kidyS-00086s-Tp
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidue-0005OZ-S5; Fri, 27 Nov 2020 08:35:50 -0500
Received: from mail-eopbgr80139.outbound.protection.outlook.com
 ([40.107.8.139]:11245 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidua-0002o5-Lr; Fri, 27 Nov 2020 08:35:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tc28Drj2glAORVnxdiY4XNHIA3Ysh5GJijtVeBOtns5R44cbyFXhNEKsxbAyDd/eUY1SGePF+bgZT5c47z5toLaQ/sAGGgSPJvLhPhwkfhlPSb7tkeaKaIib33Zbp/FEUJHNo+L4/iwBrSMjtUcMb8Qj+Lg3klX3w+K6FxZs8iBYNQTRoJT3MDgDSRGq7byRBZGFyEsQesZQj5Nr+NxDEgLp70aTk2HE6iOiIbFM6cZNLdiM4A4MObUCeGdSmvUh1Q0kBYZwBnH0CNQo2UnFM4Ve6riUhteufBQYlsbYaatupMTaIrG0XY2MGYoZlmP9cfkHlZPZX9I3RFZpuhxuUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8St/Frso6p/daAU9bmvmn+JKzRm+PeVNtuQFHyjQWig=;
 b=gJH3XxobJvyGHOBYsfAvrGrRqVA7/4iGKk3x7cpMmARG/EvZvAlsYmbvsfuyaRZeB74b8AuWe+pSuPGfW/NYfxgGp+LtyYSbduK9H5ZColPgCVOPxpvqhHjCceYoPeAMvYH616T/OZkG3KleVGvwA3pigD4LEpBCQ+FH/5lx7kLkoHeCRIWBxa0AQ9P1OUBJxBWj4jzT+BTdUR6xu9G7izwY0X37aU6tSYkfyeP6Xnb2jnUUkUZZVr8MVYUkL5cWU+E5SzcE+45SILaYEvW+/wSEab246OQvQ9p9KhT+kdBUQcPUmyekOS3Mfe81Ppa0xAT/zRqPd6L3b0mQTiXBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8St/Frso6p/daAU9bmvmn+JKzRm+PeVNtuQFHyjQWig=;
 b=LChtJbazYiU9EW0W33x/BxnHG388scVXPKg4nNyeeq773cZj90docWdsqz8cl5dBSNlwB26e7k1h4raavIcPTbAc9cRo5J/GpQIMj8HPCCtreITf3qEpJCEoTaQQmsaGzTeRXOo9NZglhgr/tWDksywm3is2lyxMir2dwr4iAhw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com (2603:10a6:3:89::22)
 by HE1PR0801MB1673.eurprd08.prod.outlook.com (2603:10a6:3:86::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Fri, 27 Nov
 2020 13:35:38 +0000
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4]) by HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4%10]) with mapi id 15.20.3589.030; Fri, 27 Nov
 2020 13:35:38 +0000
Subject: Re: [PATCH v2 2/2] monitor: increase amount of data for monitor to
 read
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 den@openvz.org
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606146274-246154-3-git-send-email-andrey.shinkevich@virtuozzo.com>
 <edb0cc5c-62e6-7277-59ae-e49e721fa596@virtuozzo.com>
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-ID: <b37285db-e764-d188-017e-181a6c878d79@virtuozzo.com>
Date: Fri, 27 Nov 2020 16:35:35 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
In-Reply-To: <edb0cc5c-62e6-7277-59ae-e49e721fa596@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [109.252.36.39]
X-ClientProxiedBy: AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26)
 To HE1PR0801MB2124.eurprd08.prod.outlook.com
 (2603:10a6:3:89::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Admins-MacBook-Pro.local (109.252.36.39) by
 AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:35:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46e7da22-9d9c-4dc0-454e-08d892d9537a
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1673270BFDF86EA2F76BDC00F4F80@HE1PR0801MB1673.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NivTUPCDRl3dix27VqdKC50hbwnaH7n1o5ouO38DQXbKKIXty1bAIWyOflxncmxsHZXZATZqVOe1KmkZMxzwyD85YjGqF6sqlXSQ5hE2Sf/nsuTnWqxLiOfhyp74gmI/PTHF4376ydbMqKtcYxfvDQeVOn3mCYjQO08AJ2U2Qtt8at2etQSMdZvtm7NgWzLhrpN7mit29WqJ8ac2wrP5zXqH+nE2w3KV1Ab6FCFgPR1zQM8vG5SWNcGDGxhqEuYl3g3ytMRdvKPzzglghoKjx+4h0p8VU/94BjmaPmL/dKeiGGal5ZaoBuNGEFkqO9HljCJMUPaoZbV/HFP7LhmdTbqDjaRESvxl1NTcR3PBufp+fng2ekKA0H64QK4/OhxJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0801MB2124.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(346002)(136003)(376002)(2906002)(8936002)(16526019)(44832011)(956004)(26005)(8676002)(83380400001)(186003)(52116002)(53546011)(2616005)(6506007)(6486002)(316002)(107886003)(66556008)(86362001)(66476007)(66946007)(4326008)(478600001)(31686004)(31696002)(36756003)(5660300002)(6512007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WnM0NDB1d3FQeWIyekMvUzl4TzB2YklkR3RKOXNEK1YrNVk4UHVuaFhrOC9J?=
 =?utf-8?B?WjRHWFNIQTJVdkJzMmd1V1JOczUrQThNSHJjT2dCQSt4UWJZd3htY00rYm9Q?=
 =?utf-8?B?VXYvU3hHZU9hY3F2MEJLdmMxcThmL0ZxQzU5UllSQk16bDBrMWFseXZnYUdJ?=
 =?utf-8?B?RkhSbWRXaHkvd1RzTWFlTzZRaXdNQXVGZHhSUWIwWW1Kdk1SV0JFSGRINFJ5?=
 =?utf-8?B?emhJblhQOXZKK3FqbTkwc1B2WHRSS0xDQllDblI5cUpPWEhaQTlJd21Xd25M?=
 =?utf-8?B?Tm5Nb3JjSWIxNGRUS0Vndld5UklmSTMrTGVkTCt2M01aeGREZVlTVENBZnc1?=
 =?utf-8?B?VWpJeWhVOVQvdDNlSDJTODBWdzhBeURWTmpLaUNkY3ZpZDBwa00wbHo1bW45?=
 =?utf-8?B?Vm5ibmhnR3RNUFVhRzhNdkJzQUltK2tVeWtVYUhreUFXakhIT09PalgvQXo2?=
 =?utf-8?B?bWtxQTk4RUJQRjNSdWZzRjFDNnFOTk00ZDdEZHVhSHJDTGROc05KamY3VXhF?=
 =?utf-8?B?ZFZLUEFFMEVLODJnVWF5TzZvelJvczZweTZ1VVBRQnlHNTNxMS9OSGNoZS9U?=
 =?utf-8?B?QU5qM3QxR05TSzNKMENXU29tVHVMNGVVQi9qN0dUR0VNZldzNWJaOEcrampp?=
 =?utf-8?B?QWlQVVM5amtCWUVuYXZTVFgzYkJwb2FveGQwMHBJczlSWE9uRHRQNnRFVXdx?=
 =?utf-8?B?cnNpNWxQNHhIM3g1SDFEWmhhd3VMVEtrR1haUWxsUG1aR1IvTHVLNjBVVEFJ?=
 =?utf-8?B?cmRPRGs5VmhTdU82SWt5R2FHWVVmTjV1VlA1Yjgrdzdrdms4QVVISUZudHM2?=
 =?utf-8?B?ZlllRi9HWk42Ry9QTUJDZVQ1SXlhS2dUVEV5cHlBRkVhNkMxcW9aRmNKNHRX?=
 =?utf-8?B?SjQ4QldaZEVCUllOYnRUVjU3RUtlVDJJMW5hOFVBOXFlV0RMcTY3U2JiTEtJ?=
 =?utf-8?B?U3FSSlJZYUNHd1JpZXdQWHpZVTlLOUJIK29SeHlBUTB2TVQ1UVlFSGw1NDZx?=
 =?utf-8?B?N0VLWEZWeWR2WURwa04yMk91RzJCK2RGQ0VGejhNb3QwVXZNVUVjdlB3Sk1B?=
 =?utf-8?B?SDlMTngrUkdsaXZmS2h2WW94Snc4dEtnWEN1aG5tcWVHN1hOazQ4TTVqOXRp?=
 =?utf-8?B?Q3FjWTFtRXRpUHBPQnRHcDZCTkE3Sm1jTVNVcU1ML0Q4V1EzTCtYOFN3Rmxy?=
 =?utf-8?B?QUd4bmlsaVVLZ1BOanlDN1V5bzZMZHdyVXRKOUJwK1d0VlR4SW50QUIrOHBE?=
 =?utf-8?B?YWpuczhxOXVLdXdJckhlUGpOTUZOdEZVWVRZcFhWU0FSOWlIL0I4SjF0aG8x?=
 =?utf-8?Q?HXDmTGbfwbsFFc9WAqviCNq4u+U36k57tc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e7da22-9d9c-4dc0-454e-08d892d9537a
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0801MB2124.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:35:38.0944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cea0o2sCykHp1gPk3i5VxhQbBGzCnBm/kwr74mc8hhZzeMJh3DGsAfLQx0nO+ayGyAot4KiM5n97EqaaM/S85Zs00zHpgPu64eQ3wK68I6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1673
Received-SPF: pass client-ip=40.107.8.139;
 envelope-from=andrey.shinkevich@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 24.11.2020 14:03, Vladimir Sementsov-Ogievskiy wrote:
> 23.11.2020 18:44, Andrey Shinkevich wrote:
>> QMP and HMP monitors read one byte at a time from the socket or stdin,
>> which is very inefficient. With 100+ VMs on the host, this results in
>> multiple extra system calls and CPU overuse.
>> This patch increases the amount of read data up to 4096 bytes that fits
>> the buffer size on the channel level.
>> A JSON little parser is introduced to throttle QMP commands read from
>> the buffer so that incoming requests do not overflow the monitor input
>> queue.
>>
>> Suggested-by: Denis V. Lunev<den@openvz.org>
>> Signed-off-by: Andrey Shinkevich<andrey.shinkevich@virtuozzo.com>
> 
> 
> Can't we just increase qmp queue instead? It seems a lot simpler:
> 

With the OOB compatibility disabled, the monitor queues one QMP command 
at most. It was made for the backward compatibility as stated in the 
comment before pushing a command into the queue. To keep that concept 
functional, the monitor should track the end of a single QMP command. It 
allows the dispatcher handling the command and send a response to client 
in time.
With the patch below, the monitor queue will be filled with QMP commands 
as many as they will be found in the input buffer. The first command 
execution {"execute":"qmp_capabilities"} takes more time and queue will 
be filled at full. Then the dispatcher starts execution of other 
commands in the monitor queue. The process becomes synchronious. In this 
case, we need neither thread nor the queue.

Andrey


> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 348bfad3d5..7e721eee3f 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -8,7 +8,7 @@
>   typedef struct MonitorHMP MonitorHMP;
>   typedef struct MonitorOptions MonitorOptions;
> 
> -#define QMP_REQ_QUEUE_LEN_MAX 8
> +#define QMP_REQ_QUEUE_LEN_MAX 4096
> 
>   extern QemuOptsList qemu_mon_opts;
> 
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 84222cd130..1588f00306 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -566,7 +566,7 @@ int monitor_can_read(void *opaque)
>   {
>       Monitor *mon = opaque;
> 
> -    return !qatomic_mb_read(&mon->suspend_cnt);
> +    return !qatomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>   }
> 
> 
> - with this patch tests pass and performance is even better.
> 
> 

