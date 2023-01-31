Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17637683432
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 18:46:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuhO-0003AA-U4; Tue, 31 Jan 2023 12:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pMuhM-000385-3Y
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 12:45:36 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pMuhJ-000697-S6
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 12:45:35 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VGxKXl002672; Tue, 31 Jan 2023 09:45:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=ux033J+okPC+VvxYPaejoHCn4ZyDxfUMwd/upKQZleY=;
 b=OzQ0d/zXdmYWSm/E8GZXTypzkL4Fi5yuoyQ6mzB1c9QZw75kN74FqqicBYgWCrWwIC6A
 MVC+Ug1Iu+K0ZRBbFOQUuVbJ1Xjya1zko/ploiLriY2daZNsPiKr+uCwqxL2Xc6aS+Y2
 9Xp06scDsLL5akXw35AUNlap0PvK3TOd6Cb0r5XpR34ZR7G4Uh9VpDFp5HXM7vaTpiKr
 ZOTGG6K8MWG4ici+vDPZYlmBCFhQmaYqw6zpECZq1OHkKIQ3rlfUpimSoXjaPYP9g0sf
 rx6iwh8KiYlcVmpcmjdY2XOlapDeElQQ3nydIm+Olja2OkAzc/fnz3GRm70wh/b+Xl2v BQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nd0ge193p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 09:45:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv3orxUNnbf6Pf1VKSrU7qEKCZqMozSrdvdqtszU4pNseKTZzkyzSeiBM+EtQ6rxu2nu3lUeVlYMAtiGoc7Typ2sTeOHeat+e+VXj316uABMjuIkV2vA1Ep4odqLF69L1ji+XDtInra9FjoHVl7vDCdbgM0MpLTxxF1D6QwjuC4cw0LyZbT4O8MFtVBRcGbfb1ag4DBYNG5Ega1qUD81Fw6ChYe6PhkFZ7HnmTWihY+bY410/McfsqYY3tfnulk/2ar6m/UWYAQABihT8RGxOUOI5QBf2nXiAFLeb7eWpiik5d/EiQMZqlzYPDjFTmb9akxpuDqi677Vztr5KuR0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux033J+okPC+VvxYPaejoHCn4ZyDxfUMwd/upKQZleY=;
 b=cTQB+7x+3C5FJb+abo8nGcQG459yTCmiMmRHQM2MCExvugjaUCg83/0K2Fguwmsa6m0kCKCs0OaJOouOMXKqzYE8dE34RKnlnQK5R64QeA/5nSbMbfnj0SiMNz5n/fFDXP3/erSYGzlz+uR4mlR6NNo+5d/f7LSWBZDhn8M2vDpyhYijbkLnsJADeYxb9UQeq8Zbd8AYhHUoAB9IEqExz4mOcZAtQCOx1IfdtTXNu5cnyqKHMFoKTDzqFxEgAuWrisMvFDJtIFS2rlsBzeHAEh0g7HcnMFWCXKD9Ye8MgS0RxMhXNrM9yg1enCaCRIKS/mG/dslPfWhWZEL0RUhrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux033J+okPC+VvxYPaejoHCn4ZyDxfUMwd/upKQZleY=;
 b=f+Y4+mc2RXePHQ5GeAiMPniwSYIvBCUT5oMJhSfNU2P/Il5ZiIt6/fd4xjKOyG9S++XGpK78UTGJnH22zrT3WMlLIy6Fgr4iFa+wh3mFMyM3TtJ6d+MCAAFl3QxQzfXDOfl8Doy+SZnyYHO6RidhpXWceMFyvpJrQpKxdkTu/bfAJDWTWhDhXIuw+Lm6OOfvyFYM8VLB5pifY8voDuLOim2Fwk9xeBqGnnXCXEGX9jrAuEgeMDi1DkRQmgVDkEOpkHS//Xo73/X8547VpdQTJlA0qk4WjWZdyaqkNfTRnuebhGD75zqEggICh/7W2oS7SvmOKzZgI8S5z345+gBTiQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DS0PR02MB8951.namprd02.prod.outlook.com (2603:10b6:8:c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 17:45:28 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 17:45:28 +0000
Message-ID: <11657641-caa5-47c3-2776-83c4aba701fa@nutanix.com>
Date: Tue, 31 Jan 2023 23:15:17 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 0/2] check magic value for deciding the mapping of
 channels
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 lsoaresp@redhat.com, "Daniel P . Berrange" <berrange@redhat.com>
References: <20221220183616.228621-1-manish.mishra@nutanix.com>
 <f50993b5-716f-ffef-1d0d-2ce1bdd086fd@nutanix.com> <Y9kw85QnNfeRsdLX@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y9kw85QnNfeRsdLX@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DS0PR02MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d72d4e9-22f2-4f0d-e590-08db03b2f0bb
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izVsemHb6nJdeP9NE5sUEfGoy4EQS1FgwLPXc6p7pPgqSvIxklncyQXugPUjy+rGN80ly/TCsLNFpy59ZqWmqAhe+VLD2aqJNlITYoSQlnR8tBfM5GV3k/00QDxMTXegr2eGvgdnf6CqVUfViUVGb8VlGgFz2Kk2iBoThBxaIdtTPYfaWAkYSje8v6ZkicZyaaq9TN8VDwz081KCxbLO1uO2i3nufDGdhaR/sMCS8x87ziX1RetVnluUdoyHf4jsLesbIiXktnlxftl6qtH6aP4DV0Ndb8KI93poN4/edHKCwEZQ34TcvPIHTZu35b0juuxX0gFX3j+bYMKffXHvdpHTr6zzqf8JzQVMH82y3kAUz6Oy8paYoQDP1R5eVM3tS3AYH/WQOg9UwXOlY34LnXWP9aAL6eEXvkcXcQ4527jSbzHdKpM9xnWxFQK1i372huSSoFJeXBITo4r4fddvVgImiraAYDm6iRUaPaIX1jfHGwfKJLqZ+UFYuuLiQ5kwyL1GfHCfZ3FPi6pOGWhVf+d0/Q3nkF7zkJB3fIFSYrFBbqr5EA2dfyMZ4GM2fyBFJ8/xMBI6KydaSgjlJ4gCFZd32Q2bvfQnjQb+oFMNzwuXYOu6mBP1L4kJ2HlqmSXRXflifHghv2UVVKD4RiSrRQeIs3y8Mn4E/sSKhigHdmh1/7ICMUbs04RRdASj6Heqnd/79viXV02IVpui1I9SztXNjrH5ff7v902ZRG6xsSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199018)(31686004)(6506007)(36756003)(83380400001)(2906002)(4744005)(38100700002)(66556008)(66476007)(6512007)(53546011)(31696002)(2616005)(6486002)(66946007)(26005)(86362001)(186003)(478600001)(6666004)(5660300002)(4326008)(316002)(8936002)(6916009)(41300700001)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9wckpFNW5HT0RDVTVsNDZqNDZmVDRlYWNzdkk3ZE5lN0ptSzE1dHBwWnQw?=
 =?utf-8?B?V0IxaTFmOHBQNmgwN090WFlYdmR1Z05SVDJXckIxS1VsV2REcklBZEV4ZmdP?=
 =?utf-8?B?NkM4R3RtN1B2cUVuaDlxNmNuRzNqVHlNN3B6WWlUQWNJUGtsTXJxQXliVng1?=
 =?utf-8?B?eHdnM2dqMStrWmhzVUJmSTZMUnpVTkQ2bXBSSFRuTG9vUDhOZXV5Y0w4THRt?=
 =?utf-8?B?NHZRWWoxZ3h4VmE4dHkxaGJ0RldKNVdFR2JJdytLV0NGRFhQYmRkYllQNDhH?=
 =?utf-8?B?VzFaRlN6dElMUnJ6RzZ0RVdpNFRMb1UvRFdRMTMvVWlkblNLaUVoM3o4c2hx?=
 =?utf-8?B?UEMzY0lKSGVMUVo0OS9tUkV4YlVqcGZhS1FVUlM1SHd6SFB3YmUvcmV6b2dx?=
 =?utf-8?B?VVJhb1VKVUtRblQ5dDZWUWFOeGJDTGJvQkpmMUNiKzlRdXA1Nm5hOUxuMGpG?=
 =?utf-8?B?anExMnVrTUpETWZIZ0FwNTdBRXNEVytpaWxMZDk5WmRSOWtGM0tWN3FpOGhG?=
 =?utf-8?B?VHlTYlBDb0d3WnVLR3hweHA5UWRHSE5GaExRS3U0WlJZMzlkSEkzbEYvMld1?=
 =?utf-8?B?M1l2MTlFcVdRelUxRGJBSlpacjYwVHlDZFJraFkvV3JHWVozVnllaUZHM3Z0?=
 =?utf-8?B?cXprZ0lpbWJFN256QXRWUWQvSUFxcUZOYnBmN0dBYm5qYU5iSWtONTRQazYy?=
 =?utf-8?B?OWZmaEtjS2pUY2o5VGV3MUtpZll0N3dDZkFmVWJBSzB6QnBBYlZtNEtTSXFC?=
 =?utf-8?B?dVM0UFcraUQ3N0NUWHhadVpzbWMzSCsyQ05Ya2c2Y0U4LzBLaU9LK2JJMllD?=
 =?utf-8?B?QmhldWNkbU8rNk15YXNZVlpJZmxJVFBHNmVza0NJenNLdGpDM0ZmUE5iRCtH?=
 =?utf-8?B?TXUzVWhiZkU1Uk4yNlZkWm5oV3QrMXIzMFNSWHNCWkpEeUdmYWo4emZHdXYz?=
 =?utf-8?B?NjRjcHdSRTJvdjlhSzltTytTZEFhcTdYaW03ZTdQVlVicTg3dTJFVHJxNkto?=
 =?utf-8?B?QWlVdWw1TURWeGRJT29qQVUrd1hKa1FGaUZwRmlUWjlOMEQ2WlNSdTR0NHJ1?=
 =?utf-8?B?WjFoZ2ZwUTNxektOdVRVK3R4WlhvdU9KdnhURmtFUzlqZ2NscU5qM0JjaHNY?=
 =?utf-8?B?aE1UeWxBVGNvNjVxQWsrYzBjd3NyYzgvQ0dUdTk1QnkwaWpvQ2xJYXdDdzZB?=
 =?utf-8?B?eEZ4dWR3V2pneStONUZhWjBMOTNHK1ZKSmUxZmxaQUVKVDg1dUVPeWx0bks2?=
 =?utf-8?B?eVlPcEpyMFFtUmgzYTRIR2FWYVQzamF5NUh6eThkVXVrcFFoM0Y1TWNGSkdH?=
 =?utf-8?B?ZHNJZSsyVHoyUkZmaTNaTkNMOU1QRHg0NDJnQ2tKSGcvUUZGTEM3RGFCM0FY?=
 =?utf-8?B?NFdQay9ueEJ0b1Fmck5lam5ZZ2ZzQ0ZPaCtMWjF4VW1jR2xjRDhHeVk5ckF0?=
 =?utf-8?B?TDUvNzhqWGVaSFloQmRyVDZ5emNJWHlLaTlNS3dkbDlkeC9abFBLVUpabnNF?=
 =?utf-8?B?aWloMkxHQ0huNHRuQ2xXaUpBM0FmdjlKaGNzK0dEVHRjbHVTL0RWWkNrWFVs?=
 =?utf-8?B?ekxxdWY0a3paMnBhVC9IMnBQNW1zZGhza0tGZE9jY3FnVVo5SEl6M1RxRWNP?=
 =?utf-8?B?V1d2QkpUOTFaNzBidUNMUlVQQld4ajlsZmZlUGFpRGVLbGJZWmR1MVNselRN?=
 =?utf-8?B?SGRiWE5TQWw1ak10VVNETWxIc3JrTkI4dndPVUVlZDIzVGRSWVdFWm1weXdl?=
 =?utf-8?B?blBIdWJUTVBvT1NNMjBlSThqUml0ZDBJYVczUllPdmRlbXIwSi9CY1hIN2JO?=
 =?utf-8?B?d2tGdnN6S0xLVURNbUt6WVlxTm5CR0ZmTU5LUFpLR1prQVIwaHg3SE1NZ3M2?=
 =?utf-8?B?NjZVYXBuQzBRSkg0QmR5SDRiRE1NbVlwNGt5WGgvQUtuSXRVQVo4Q3ZoVmNI?=
 =?utf-8?B?aU1EUVFESnBBVjJRamRpS0QwSDhVYnQ5WDVnS3lmczJPTDNaV0NEbmx6cFhN?=
 =?utf-8?B?Y2NlWisyNE10N2FtSHdrVGNpL3dVaWJIVHVaMWg1bTdBWlFwcHlEaTNQUnh3?=
 =?utf-8?B?T0NrRlcwa3R3ZzFQSkEvYit5Yjd5aUlpbVNUTkpzeXFrd0dQQm1QWE9GZzRm?=
 =?utf-8?B?K3VPdjMvem1OYlF5WnRCMDczemNkL1BXRWRCYTY2U1Mxb1g4K1lXcUNOR1Bs?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d72d4e9-22f2-4f0d-e590-08db03b2f0bb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:45:28.4847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKVMNLdRFPFpZId0rhHNTCV5JzvpfJLM2RX6YpHk5+OpWRYNHxU8aWp4F6oEV+ahk+GeRgmMYwKsr32wAanCZVQntGd3vnQjI1HSxMZivEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB8951
X-Proofpoint-GUID: aMLq0pownYOj9QCoGHPDyEhEp6SUg-a_
X-Proofpoint-ORIG-GUID: aMLq0pownYOj9QCoGHPDyEhEp6SUg-a_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001,
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


On 31/01/23 8:47 pm, Peter Xu wrote:
> On Tue, Jan 31, 2023 at 08:29:08PM +0530, manish.mishra wrote:
>> Hi Peter, Daniel,
>>
>> Just a gentle reminder on this patch if it can be merged, and really
>> sorry i see now earlier reminders i sent were on v6[0/2] and somehow you
>> were not CCed on that earlier. You were CCed just on v6[1/2] and v6[2,2]
>> so that's why probably missed it.
> Yes I think so.  For some reason I guess Juan missed this set when sending
> the most recent PR. We should pick them up soon.
>

Thanks Peter :)


