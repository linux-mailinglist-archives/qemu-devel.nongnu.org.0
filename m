Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA79489A26
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:39:00 +0100 (CET)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6usy-0007MK-65
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:38:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1n6rLm-0001Wb-UL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:52:27 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:49340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1n6rLg-0008PK-UG
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:52:26 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20A7kEhU023729;
 Mon, 10 Jan 2022 01:46:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=yHlsalANQshVxgr0IeTUv1I0vi5eE6I7m8q2sEVsF+E=;
 b=F8BaqCPWiJcYl0G1YfFnbV9axIYGgnvyfDuRaFXOafzDiwhJDX9cwoTTvOmJSrdLm3de
 T6896jmAntOl1Z7eVuld9+PaRwN8UVyp3DVAwocGL+QwxGlhIq18V+/MwtWDnkBEgn69
 MvftEIY8UBPEi4rCoXkDeEYaIc327Rq8d5Hl/DHBKb2/v9KvOefZsh1f9nw9Ne9pA4ns
 rzKpyb/lYxWTizZyZQKKtJKo25FpK3eK8D56PbUNDSG/nYe9XsxtSgGaejrtw/dIyoWC
 sFhy1JjsZHzk4k94l9AIVk0GokpuNrVEH+VE579jyH1967l8G3hgTx4qjHopZQvMxxVl 1g== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3dggq086e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 01:46:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdY58GlVRg35SqfHL1wKhDV02VGkrMR/NbU4fS+ZJ0uwtoqL8MvnRM1NLx9nJEUZTmi4FeABPlPBKtTnIRCGF+f47ZSWp/bcsbukDmSGivtOtkOGTvAENl2bUMDj793DWFTqfpcyJ2/Rj0hkyhnaYVv98BZII6Q/YyxOyJj0s+8WhPH1vgpnkjYwwnNLXJ0jgQYL9fruczvc/jsEL556469GTPc0urXQJFmOeKgoMI8mJUiTDoATq+IfgA0+ZibPzrJYytVJTZ4I8hclt/p5mGEbYbvnpai7+APJ93f1ORbJpXDTHuZntU6DChbJ4zwOMrKD35W+NmoiNkpSt74XLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHlsalANQshVxgr0IeTUv1I0vi5eE6I7m8q2sEVsF+E=;
 b=DT5vxTBrNVlKf4Cb7nqtpYi/XPCKkOrlMqaG+ehoKat/4tJE9SbZ8sXHVtvtNsl+ezP8OFTwXMLzAPmRyQbtbGbE9NYSAqXSifj8QSVhgufK5jgBJkrdkLNyxufYAqK8fjLOM8n9Eu3zSFmlO/FvGOBByiD4GaTirLU1iLrmvA+zkDLK0Ijjku0gvTtBEfHWaitaF8v7bqF4iAbC8WDcZKM3JcxWWidczzIF5OqxqKus+RuerVxMJWNVzszhhM7xVDMYNiug+3GQHGwuUc0nTk49KTA22t3K1DZcbUXDppS7IO/ayWcj+ZhjMH7wMq0WmuD32XM/SqvQo8VWBuXklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com (2603:10b6:a03:3f6::16)
 by BYAPR02MB5989.namprd02.prod.outlook.com (2603:10b6:a03:121::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 09:46:23 +0000
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::5916:1188:53ed:2065]) by SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::5916:1188:53ed:2065%2]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 09:46:22 +0000
Message-ID: <e2616e29-e0cb-bbbe-a032-c2ef330d1863@nutanix.com>
Date: Mon, 10 Jan 2022 15:16:10 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v1] Check and report for incomplete 'global' option format
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104134102.1080890-1-rohit.kumar3@nutanix.com>
 <75dcc1c1-0566-8735-d42b-02d99994156a@amsat.org>
From: Rohit Kumar <rohit.kumar3@nutanix.com>
In-Reply-To: <75dcc1c1-0566-8735-d42b-02d99994156a@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To SJ0PR02MB8564.namprd02.prod.outlook.com
 (2603:10b6:a03:3f6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1e7877b-e06f-4cb7-8a05-08d9d41e0fad
X-MS-TrafficTypeDiagnostic: BYAPR02MB5989:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB59892F894060BF0899488EE0D1509@BYAPR02MB5989.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:50;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tt9VNa5tD4IW2VjBGVnA4jRbu33mIXN1k2SunTTXJLzZ0aHSVYV8railek4BU4SOYL47uw4W2gRmqfY2vcAWj5J0ErOf3iFdVMnFMs7Zs7UB0+lQ2484U9LhZln0WoML0z+2N33A4Z9XkWhnGJYRwvjrwmw33Cg8k5zHuw2rvuwQ1Llx/gTAXSYb0dr5cMCHGNqEqpGTHR8b5PVxJMM8j6h0vJ5ygZ1+bOo44yflClKE4pwcljoP8Luqu8xJVWGbC4k+nsa7kgBGq6Cx49xlIiYhIqt5Sl3sUmgM5oR34isZDZlPlH9qjqxjxFflHVg2kgtH4llzxNmyzvumcGUABOLLPKUe97XWF7ocYiT9bQGyY5vh111Lj7WZ0QsN3opB6Nqm6abwpVJfQXDL6Yv1CxNlvoiXe7C+jrbwOXQqs6u1zb6kHCL+a8Av4v3ecUBtyX8DHCfPWSDCVkiarR/cUSN9qEpydio4ZIs1zttkpNgKmULNgt+UvPxaq+O2eF28ItRdpMGM9xFavgPeRyDV6wWiy/hmRqJq+wf+wIk1KGsw1tbiRICWoFkKT+Mj38jNRpjDppePTeRUeu/7B/uRJ/D80juaVYOSY7/742ttDnSmi3ipojsLkVkylrxw3YZp+c4x8qRxQOqllomlQJMa6u+c0NIHGLBu8NHCywluAccVEzDb9QBojLn6QWBTsdb2yssyo8LT8uDE9RWI+wdccMtRF8RiUIN0WSKk+LnMNc+sbT3EuGKsMuCJkv2/nZllxjTc7lzQqwahbybs+COC/yxeKu1R93vYE/r3aWA+INFn+8sw8Q5A2YaPfob8122bevUFs5/o3kgc3wvX3T8N7sRwpY4ulMxFKL0Txr7KDkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8564.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(36756003)(6506007)(4326008)(186003)(53546011)(6666004)(6486002)(54906003)(38100700002)(966005)(31686004)(6512007)(8936002)(316002)(31696002)(52116002)(66476007)(86362001)(66946007)(66556008)(2616005)(5660300002)(8676002)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZyLytnOTFrZlY5ZVpqTXE1cXpMNjRoK0tSdkJZQk9WYnUwbnRtdWkyMTJG?=
 =?utf-8?B?UW45OG45aldCRDkwR0Y4azc4VGViZkdFYXJPOFp5RXpsYkRjU2xZakRuWkc3?=
 =?utf-8?B?YitwM0JYOU9jSHNvL3l5VFAzeTEwVDBKam9hSW1xUXdxcFk1MGV0YjNhVDRk?=
 =?utf-8?B?V3RZejRaMXBnODN6NE1qL2hLMFNzcDIrZkdqWXN3TzBEejBXUjF3MTltRk1Z?=
 =?utf-8?B?TFU3QU9kTXNZbSt5UWl0RmRqcEQ5Z0Q2NjNxMDNkQlFRYW5kbGZGSTJxUEw5?=
 =?utf-8?B?WTUxN05BbGttMUdpZUxKOFhlMU5TaFZFNkpCamJmODBCcDBBUjZhT0ZPakc3?=
 =?utf-8?B?VERhWXQzOXBNVUp1V0ZoZmxqZVFsMlY2TEVNL0JpbGNsbFBJYzVlL2dBSmpP?=
 =?utf-8?B?YUVVZFVBY2NiM0luRlFFV2JTK0VOU2hTWXoyU1ZjWGhkR2k5UnhhTE9Ea01j?=
 =?utf-8?B?am01SDhZSC9qY0YvRTZQYVpxSERQNjdwckkrdXZYdkFhVERtUlo2SW5jVVg1?=
 =?utf-8?B?TnhiTCt2RzhDVXNXZktwL3V1bFR2d0ZTRXZmbStaQ2tmRGZJMW9rSXJYakpT?=
 =?utf-8?B?dlVZL0cxMGw4bEZoYStUNEdVTFVhQ3FLU0pkL2VHTEo4YTlSanQ5VzRKMXRX?=
 =?utf-8?B?QWxOelloZkliUzZSeVFLK3JxS2hvYzFsMUxUZ3NOVFlSVnA4RHdwM3h1cW9C?=
 =?utf-8?B?WlZCSzF5NzNBNkZWbzc2UFZsNW8vbDJTMVl0MEJDdmdrNGxFQUN4dUN6SlZT?=
 =?utf-8?B?VjFGQXZpQTk1M2F6cmFsME5MRkZzV2ptMzZBOHo4YXo0ZzN4Qjhqck9PRUFs?=
 =?utf-8?B?V2Q4R292ZFF6NDF3NTgxTmF5TXZTTkUvRXJrM0hIUFp4ald6Z3dxRGVNb0xO?=
 =?utf-8?B?ZHFYTXJHZ3B5VWJaeGM1VzVySWNVRkJEZEJyODREYWJyb2NWaUo2cmJOK2dp?=
 =?utf-8?B?RlJ4elhDc0ZNS2JmdmgwR3NBNkY1TFBDQ2Q5R296dnZteStlQ0hKaUlOaytJ?=
 =?utf-8?B?TlkydFkvajh4a1BVekFNUjdoZUgxTDFsRy9GZW9hOFkwSmYwWjYrcVpnSGFC?=
 =?utf-8?B?bFJOc09UZzE4ckRWc0xjS2VZdy81Nit2V28zZ3k3eFZMS1NLM3dWQTJxaWVp?=
 =?utf-8?B?TlFOOWc2emE0dUJUTE8yMjV6blR0R1g3aVRwMHdaOGxsbUxOQjRwMEhQSXd3?=
 =?utf-8?B?dHBYTUNiZG9HZUpkMFhkTGhWbXN3RGdDaEZmQVM1NXN1cnM1UG9PMlBYUzRi?=
 =?utf-8?B?eStLeDRWY04zcjFlSU5UNFcvV0lUSmpJWjJwcE9WeSsvcEJibUhxSk5ic3FP?=
 =?utf-8?B?NkNrUE02NHRKMkRFN2FqSUhaZ0lEUUN1MlBPRlRkajcxMDh2bWxmWGhkS1Z3?=
 =?utf-8?B?cFpRRG1GWXhFbTJ5aG9xcm5OVStsbUlLckw1WkljMDEyUjBSYzNqRnlXWHpM?=
 =?utf-8?B?MUJhc3VzNzFydVE5SkJMTFMraWlRYkFMUkdhaVJNTWJhWmhseXhOd2ljaDFF?=
 =?utf-8?B?cXU1U0UzZWUxZ3VZa1dsMVgvT0hjV3pLZHFkdFlPSS9IYkQyRTJGT2dqQ1kv?=
 =?utf-8?B?V0YxK3ppRDJJeWxvQTYyVThyTCs1dHZ1MkJXU2tOUGx0QjhDT1FWeFJEY0hn?=
 =?utf-8?B?ZEVHbnArS21rZWlUUW94S2RJZ3pFTFhDOTFIYmhkdC8xVWJNZTZ0YTFVSmQ5?=
 =?utf-8?B?TnNQQ1FuRHk5OWkvMXRPazlvalI0YithMWJZNm4wNGRaS0IxVjlpLzZoeW5m?=
 =?utf-8?B?dlFmYk1UMjkzNW5DN0IrWWQyMVI2RzlQSkZzZDk3UzBnUUE0bkcvTXN6MTZC?=
 =?utf-8?B?YnFMNUdUbHB6S0o4bUg5d1IrYXBoVmJBb2tTaWZON2tVZko4VzFKSmtUU09M?=
 =?utf-8?B?cHRFM1VlNlhYbElhUjNqVHRHTHd0TmJYMTRnZ0VodVAxb0FmK1Vnd3J2QVhv?=
 =?utf-8?B?UGZTeXFNOGtraGVVbUtZdTNSTVdvMU5EWnRWNlRRdXlkQ2w3M1RFY1NRYWxS?=
 =?utf-8?B?a21GQlVta0VpWnNmRm95Z0xNYXVwaDI5S2xmeXN2QUNKakJlczFoWTdVT2dE?=
 =?utf-8?B?UGVXQzdvUmFEZjUvQkVXb1AyR3RZUW1zRDBvOGdwbjdJSVRsai9pdHJteEFr?=
 =?utf-8?B?VFZ0OVEwNmFuWHlKOTJEQlhDdzNtU05HQi9vdG9kTkN1Nld4VEhXd0x5cTJP?=
 =?utf-8?B?a0Vick1mNnYzYWZSRXJrN3hJSHUyTHdmV1l6dDNvU3dGaENrQ2Y4WEpmZ1NK?=
 =?utf-8?B?QjZjMjBmQWRwS0diSnBaVWc4UkR6L2lPM3RqMkg5ZHp1RnoySkdnOHpmQSts?=
 =?utf-8?B?S29qN0FuaktRQ0tTVmFzY2RaRVdlTUdaUWtYOERSUkw3d01vWm5ZeHFvcHZV?=
 =?utf-8?Q?74knkjyKskDYVodM=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e7877b-e06f-4cb7-8a05-08d9d41e0fad
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8564.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 09:46:22.7868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39igrGjH52rFh+M5M0YvJYdDsGd4yV7aXwRGKQ0ObwtzKXImEwQaAFposzT5IhuuNVEE+zpHY97/KyUIoCctdHmrHV+WN2TatggEp8uL49s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5989
X-Proofpoint-GUID: O65CYAhW8mlVKH9Zt-Zud80A4ES-TO9P
X-Proofpoint-ORIG-GUID: O65CYAhW8mlVKH9Zt-Zud80A4ES-TO9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_04,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=rohit.kumar3@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Jan 2022 08:35:06 -0500
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
Cc: prachatos.mitra@nutanix.com, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, prerna.saxena@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping. Please take a look at this patch.
Link: https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg00296.html

On 04/01/22 7:22 pm, Philippe Mathieu-Daudé wrote:
> Cc'ing Markus / Thomas
>
> On 4/1/22 14:41, Rohit Kumar wrote:
>> Qemu might crash when provided incomplete '-global' option.
>> For example:
>>     qemu-system-x86_64 -global driver=isa-fdc
>>     qemu-system-x86_64: 
>> ../../devel/qemu/qapi/string-input-visitor.c:394:
>>        string_input_visitor_new: Assertion `str' failed.
>>       Aborted (core dumped)
>>
>> Resolves: 
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_604&d=DwICaQ&c=s883GpUCOChKOHiocYtGcg&r=ABSkr7gy7ZTfApFfI-Xxt1gZNtsDDiXoXOXc0OrkyFs&m=D981HXzQDqFNmq9tQqGqTedyzdOsi9F2fju4ltYq8HjOwS9Le2sJAgk09AWgxQg-&s=AGQxOHDyd9OPvXiP4hHLIb4FptkdlQFHDf2Xtadueo0&e= 
>> Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
>> ---
>>   softmmu/qdev-monitor.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 01f3834db5..7aee7b9882 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -1020,6 +1020,7 @@ int qemu_global_option(const char *str)
>>       char driver[64], property[64];
>>       QemuOpts *opts;
>>       int rc, offset;
>> +    Error *err = NULL;
>>         rc = sscanf(str, "%63[^.=].%63[^=]%n", driver, property, 
>> &offset);
>>       if (rc == 2 && str[offset] == '=') {
>> @@ -1031,7 +1032,13 @@ int qemu_global_option(const char *str)
>>       }
>>         opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
>> -    if (!opts) {
>> +    if (!opts || !qemu_opt_get(opts, "driver") || 
>> !qemu_opt_get(opts, "property") ||
>> +        !qemu_opt_get(opts, "value")) {
>> +        error_setg(&err, "Invalid 'global' option format\n"
>> +                   "Expected: -global <driver>.<property>=<value> or "
>> +                   "-global 
>> driver=driver,property=property,value=value\n"
>> +                   "Received: -global %s", str);
>> +        error_report_err(err);
>>           return -1;
>>       }
>

