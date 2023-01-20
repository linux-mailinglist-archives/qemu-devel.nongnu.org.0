Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CE36752A7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:38:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIom8-0001Mu-9u; Fri, 20 Jan 2023 05:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pIom6-0001Me-SK; Fri, 20 Jan 2023 05:37:34 -0500
Received: from mail-dbaeur03on2127.outbound.protection.outlook.com
 ([40.107.104.127] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pIom4-0003GB-0j; Fri, 20 Jan 2023 05:37:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4DD/Ve90Jcz/uBOpDNw47MW+QE/YWfys9l/z0wY1yWoSdqhWKOhLEyEgeJnANL8wZUl56WTI9Jf2YYXYr3SoOsabq/T28PYxtgOIKaKs3JENmlN9LeOaunLjEBeye5WGlrvsyx8g0+YKT/HmU9J/O/dHFevS0FWNCYci66uLHl/EX3qNuVRzcGt9aUHB5zlXGVqEUpHUXjE1aHdM4kegIiK9vHjsnU0cF034jg8VZ39M0TcmTif2WTrS283+ZoJ3qRPR0TmYDfOl42ByfTKZTe1jye5ch5hruYSVMRo26wa0zQZWEflRMVsQuXdGjM8ZXGhroxsYG7MzSnYvTSt9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X655TqI7IDQT0Ompfckyd7svhSHKHX7RTrLZKoDw6J0=;
 b=iBFRHGbuTUe7SgCQjaf6bSvc8jA07mQFuIm/b73agexq2MRU7H6V+8Lwn9gFNdEY+9N4qCtjJ7br7fIa8E3h9C+5ixQT2u+r/DYLoWfLIrEnSgtzhhB+mycO0tiSOHchSegXbQos7peZ/e/azc9R54gxCEllSC7QdegJYB/yErLYlf/upqJe7p87TMWT5+xliM2+XYAH7/c1eqAfLE+fTZp1mGA3s0DL/fmwdgV9FTNxyvek+G3lX6pR9TAn/fGFW4XH1UwSmZ85sKvLFF/Sk++nE6P6H8yKs19ngl7cP9nGIq9PFshk4uLH58va6M2NUao00way+jSsX4ujkgjfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X655TqI7IDQT0Ompfckyd7svhSHKHX7RTrLZKoDw6J0=;
 b=xP/Ura6Za/AtgOONlij2I/yq1o3V5F0WCgDdGaDXwB4/mCSvFu9IvwTF+VlkuPvLp7RNnF73LGYjy+kGk5cK8iP/2fTBubP4cTQP4g9BZJHc9vK9bpxmTkOoHnl1zsTgsYcqJPrH7Xm8NuSJBgV4Ik43enmyB1nSpxvRNKgcreL0O1poySBv6HfaAQyQpVKwdgb2M6GwgAFl4zRYiJXjpPbaubj6yfXyCGjdyUEJQEarQa8boUM3KS7vv7fLgAy43T4KrnMcmeYCXar/7zHNTbru3p5efcww7lwoSSvSSU5uktoc+7kGZSFp3huksPYmWyC4N8ehFllgvUS94L9k0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS2PR08MB10228.eurprd08.prod.outlook.com (2603:10a6:20b:648::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 10:37:25 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%6]) with mapi id 15.20.6002.025; Fri, 20 Jan 2023
 10:37:25 +0000
Message-ID: <8fd7437e-b38f-3005-cb72-1d4c024582ae@virtuozzo.com>
Date: Fri, 20 Jan 2023 11:37:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 11/11] parallels: Incorrect condition in out-of-image
 check
Content-Language: en-US
To: Hanna Czenczek <hreitz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
 <20230115155821.1534598-12-alexander.ivanov@virtuozzo.com>
 <130ba67b-e954-0785-72c7-594ef12d2862@redhat.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <130ba67b-e954-0785-72c7-594ef12d2862@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::20) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS2PR08MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f74b5e-fcb0-4ce2-712b-08dafad25234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oa9cCU0obcu154RasuRp/Z8Mf8GHXdc+IJSkwzXP3Nq9n0yGMTVeIP971xGKzhlwxdLP6bHaMYT1PM3qucGh9Gk0C7If3Ytmu0eodikm9PowdyOBunc0BzU+6X7Es+/uXhvhDc2DbqIH/kXGrOVFTmDGruWrYGpM78XT1NdasiwoO1TZnw7UVYmbNPL2oV28wWjk8fON7PEEt3+a94lt/vffgEG8QOAQxxCTg07LKNCZ6Ic+o1eKQiXQ7TaYvImHbndlz9rNvPo2UHPlCEnipVJHy46Mk7Z6OZQiMPVkOQbeLmuJSiv4F/56NGnsnfrM2jFrDQyo8Sn+BR/ynUFAA/RB0jWneaJvazp23J5Iu9h7+E3ik0rX6c/CXeOrX/waF27qGg470MgmDjpzNovWkkLAA/GFj1HpvH6gCfKxYwywm6ESwkBWvmQA0g5PC8dq6x/QyRdg0Nv25oOC1rgTL6zc2QfDw0tKVlthysrWYOubJqLxqrf+PPVuHqz93T1UHOwXCMW3fd2ZzjCj9Ixo4+QWwn4FHrq5B4795rrh07X9qSRHbpdg6YPuS13QiF8+oTEHDKzWGClPihYBnU89kYezDnGedA6oQaAZD1BaJ0qw1ScQuh+Vtrj5cIu+LtnLbUnNgi0Ttk3JP1PSqGCPjvUlJRjq55ovlYOhdU8fmBMa16zEEzTLnM2nnv/b4kInFe2K9lDncWdHnS3smzCZcTdOSIYNwISih5ssb+C6G9zyP6prmF9Fp+6y4Q890/MMmlFAfWWIGOneA3JUl6QidA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(451199015)(38350700002)(38100700002)(83380400001)(31696002)(44832011)(86362001)(66556008)(5660300002)(2906002)(41300700001)(8936002)(66476007)(6512007)(26005)(66946007)(186003)(6506007)(2616005)(53546011)(316002)(8676002)(4326008)(52116002)(478600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3pvMU1vNmo3MGdzTFk3emc2QmEyV2d2TWlKbjNLVUlNb0ZsdnBjQytLK3hJ?=
 =?utf-8?B?MUo5SENmTjRWZ3pCNkczL2dmOHR2NmNoVmx6dEhkdEEwUTlsaHBhMk52V2ti?=
 =?utf-8?B?ODlGRG91NHE2SmlwWXUvR29sZFJvWTE4VUpnWnJmVGtSQWlsUXdkSitoc3h4?=
 =?utf-8?B?bXhlRG5pSVdJQnpYOUtkVjNDSmdzNVhtQlhTR3ViRHRTQnBiLy9rUXU3cC95?=
 =?utf-8?B?bDFpNk5UOVRyOEtSWUZJdHVDRFRMOUZLWWtTQy9DTGZvN0U5NFdVdVVLQ2Vp?=
 =?utf-8?B?TGlsYXFkRFZwY09TR3hleUw3b0JFSjVuVW1pVFYyTS9YRGhETFpiSFRmYmUr?=
 =?utf-8?B?ZnN6WXRQejJYNVh4NkRob1VOam5jWVZ3Sll5bWxyTW1saHczdVJRUjRSLzBQ?=
 =?utf-8?B?bGxZUi8vbmlDdGVpWFUzaWp6Z0g0YVFoaFVtbm90VGE2T0ljSERHUmIzdDFV?=
 =?utf-8?B?TEp0OHZ4NXE3eWt2UWFIdkgrNlJxamRSTC9VbXpQWEFKcjN5cFFEWnp2Wmky?=
 =?utf-8?B?OWdaS2x0US9LOC9iTTVCV29vSDlJcC9uMVJ3NEEwZmp3c1I3dmh5cDFRY0tC?=
 =?utf-8?B?cDI5UE9Kc1l3MXRxRXRPcks3SXBBQmxCRys2RmJSaU5JSzdxQVhjYlk3elhV?=
 =?utf-8?B?cFFTeDdFK2FacE1MdkY4eTRPMmJCWEp1Q1FnN1RleFp1UmIzS3V5RUovWjJw?=
 =?utf-8?B?S04yR1orTWZVTTNaTXhxOENFQTBCdlkzVVFBaGdOT0E0UmRDeFppM0x2YUFr?=
 =?utf-8?B?RWJRUGRFY1Q2c09XVS9nQSs1d1Q5M2NPUFVieVR2aG1jRWt0ZnoxWVpnUzJB?=
 =?utf-8?B?eU1LNC9MOWc3a2lmWlV2L1VzYjk2cHoyTjFnbVd1a3dSclVMTUd3ckpIUDFG?=
 =?utf-8?B?YjY4bFNxeGZMNzl2WHkrQUFhamFQcWZ1QmppRW51OWhudG4zVUIxd1F0cXBs?=
 =?utf-8?B?RGFXS05NQWQ0ci9mcmUrVldDYno1TXN4MU4xRjRHTlQvamdmWXBFakFlZEwr?=
 =?utf-8?B?dXRNanZIM1dCLytOZlJzUlFTU3ZiVHdhZWNBVWd3UURHZEVDT050cWMvSzNG?=
 =?utf-8?B?UUFHYkJXYTU3LzBYMlI4K1R4dzJxRlc5eEFkVmdCdkZVNmVnT053ZkVybXZH?=
 =?utf-8?B?eHVvbmQ4OURzUFZBd2E0bk55NzV6alZQUkdvMUg4NTRBUFkwcnlOTU5EdlpP?=
 =?utf-8?B?Qk1JVE4wdXp5czBBK0xGSjRDUU1FbFdkRFFOT3RTRUdxTVhRWjFPUHM2YmV0?=
 =?utf-8?B?Q0x4elE5RU15VXZYNnJMREZmUDRac2hMdmNzdW80UHVmSEg3bGU0WDVsN3Y1?=
 =?utf-8?B?WGtSUkh5d1MyR1J3M1FZMVJPUmxZUHRFVU0zcTh1WXB1TEw2ZkZ1QWhWS2Za?=
 =?utf-8?B?M3Y4WnhPbmo2S2ZhYWZ2Sm03MStHMmJlRGNSQWtFWGdtTzFiSk9ySStFczR1?=
 =?utf-8?B?bXVzVGZwYytkVEdVVENpL2N0VDRlRzVjSVgrYTRPd3o4ZDhqQTlIclZnWURW?=
 =?utf-8?B?VGhJdHhHamlST3paUDZTVXl5THo4Q3g2SE80eHByKzEyeXRxQ2Noc1hZRm5U?=
 =?utf-8?B?TGlPaHZoVnpQeWZ2NkROOVhxUVBxL2FxcnNKbTlNVm9OWXozWlc2dTgrK1Js?=
 =?utf-8?B?SFRLdy9JSjlwelE3dlRKZXUraUhJL0lmU0E0cklqaTF2YURjSUJZaEc0Wjdp?=
 =?utf-8?B?a0tqVHk5T0VyOE1EL2h2Q0YxWE9vclRBLzhtN1FWbWM3dzVJRGUrL2dIL28x?=
 =?utf-8?B?cE5IRU05Mit3SUZOaDl4UnZKdG9pT01WQ3FPb3lmSkdCN2pmcWdUUEZ0cXVG?=
 =?utf-8?B?aTdoL2g2emhXWmhZRGZnSWtBREF2cjRCK0RZRDduL04yd0FqV1Vmc3hnOStL?=
 =?utf-8?B?ZXUxNVVvOTl2ZFpmZitnZzNNYnM3NFY4MmtUUnNDVDBhT2NCVlBzb29rYTRl?=
 =?utf-8?B?YlVvblp3dlNPdGJHZmxpOW51Z0pZaHVEcFF6QTNpU2dNcVp3VktKc0JNMjU5?=
 =?utf-8?B?Zk9kZWVzWUxWN0s3bk5FaTNWNEdXYmZOWEorUVpKTXpEODU2N1ROTjA4ekZv?=
 =?utf-8?B?RFRwVGhSbWE3MGhtcisvdkdzTEpkKzBkdHg2QVlNK21OT0NMOWozUnE0MGJw?=
 =?utf-8?B?aE96amtYZkxoRUkyR0hDRHNjK1gwb0szWTZ4aEU2ZWRYN2M1NUg3Z21GenZS?=
 =?utf-8?Q?FveanYXUml7Al95cAVkA35E=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f74b5e-fcb0-4ce2-712b-08dafad25234
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 10:37:25.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FHVIGaWWs30bopF4Arsh5W5f9Rb9EPusNxknrnKfrUfvNnxsAbQma/SVWt/6tFbC2YmV4gNLlnR3xwfCuRf86crdbAAuREDmW4IXRp4pfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10228
Received-SPF: pass client-ip=40.107.104.127;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 18.01.2023 15:46, Hanna Czenczek wrote:
> On 15.01.23 16:58, Alexander Ivanov wrote:
>> All the offsets in the BAT must be lower than the file size.
>> Fix the check condition for correct check.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> Reviewed-by: Denis V. Lunev <den@openvz.org>
>> ---
>>   block/parallels.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 621dbf623a..eda3fb558d 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -455,7 +455,7 @@ static int 
>> parallels_check_outside_image(BlockDriverState *bs,
>>       high_off = 0;
>>       for (i = 0; i < s->bat_size; i++) {
>>           off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>> -        if (off > size) {
>> +        if (off >= size) {
>
> Should this not be the even stricter `off + s->cluster_size > size` 
> instead, or is it possible to have partial clusters at the image end?
>
> Hanna
'off' is aligned* on the cluster size, so these conditions are 
equivalent, but I agree, your condition is more idiomatic.

* It works for the new image format. In the old one there could be 
entries in the BAT, pointing to unaligned clusters. There will be a 
separate check for unaligned clusters.
>
>>               fprintf(stderr, "%s cluster %u is outside image\n",
>>                       fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>>               res->corruptions++;
>


