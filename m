Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1869AA34
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:20:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSym1-0003lo-6q; Fri, 17 Feb 2023 06:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pSyly-0003lN-Uo
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:19:26 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pSylw-00038v-Dd
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:19:26 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31H7K6Uh005879; Fri, 17 Feb 2023 03:19:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=4tYLIhysVWNFZc8/P9DGqUSN0hs2przoGfeoTafqsQk=;
 b=AmqlYV8+iy151YxP6OySId1Ozm4323x9nLk5ejY+7EhWR9tHdIAMDf9/tlA3lqK5IaKR
 v3EIrA+pddHiSdoaJ6HJsQGtBgQAXl0m5txbw1gONGlJVknA/FNv8kbAW4YhKppkXa5/
 2+RrSuDARG1t7XWiqC7LNwJ/o0zFMFSIZvEXEReDwiEiNBLXKt1Wp7ANEA6dtGbwB2M2
 HB7yPaQ1pmtEPIQc9Rf03Uwl9tAw0uwRc/cO+BLBRPL5m9LL9j96Qqh1aVRrxiHjeqhu
 MB81HY/X/ZFogEhPYfzqRA4sVWXaDyo+m54zzyhDxlsMjqiE2+C4f7jh3gd1dY+O/N6E UA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nssrxt0f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Feb 2023 03:19:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ua/l7m0hDBPlM7tzuZOHkq6HEMMmExfZiPDORuWbcoO2aSMUAJOASD2DKXzRolbgzahncyKK+AKSx0Ld8VWv0ZAVFvpJItklKiCgkbqF+PqbuEnxRw2izr38AuSkbs3yt/1CtcmWWTXKpZk2agMp9eNct8tI6MaTPbgmwkvQQC2FWxYq9nn2LmAaADUyZos6MJJWgTlXANmWGnUnVQp5LItUGl7SV48P5p5tXAUfdKPApWtE83WNZVHEGJTZ3cIYEaBLdOqDQD8j/Qo/tzvZ62KVWcSteDLD8ATdHjNzymRPHdq2VQj82a9xOWVF5D18hSuQ1CJKBMnuNBDdmCcQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tYLIhysVWNFZc8/P9DGqUSN0hs2przoGfeoTafqsQk=;
 b=Ow9OdxMk9uTeq9JI90zmlFFqGVexDUFSYoeYS+1gB/GKgcvjzXPhMx0CE56bbUsHVxjc3mq50l5pJYP87m0EKGOxHzarHimQdk0LKoRKDL8me3BgwPo9NjSbUcXxDAvB/xiW3kJx0VRYJAlM/HrO5jgavXLnYoo/HVaS8IIuAJodfT0tPG5anlr5ftjVyuxEaiWeC+G/2ZOi1N8BG3Y7b3c/UtJhuPGKE27sEyes4i0lpK5zf8rHuOD7nhkQTrHBTr6A/yndNSwXom1T5UcmR3ARCHVqEk1HLA3otkrc0FCe6etgFTGooT5qyVgNuPpMbPxe2WMWvsQDkVtXKJZwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tYLIhysVWNFZc8/P9DGqUSN0hs2przoGfeoTafqsQk=;
 b=tZKQf9mlPZTkkmcJLB4+S55xlRCKv0zyChSwXQ1jW2oQRBSakokl8EGPCIu9wZ5h8ZcmixNsO09AhTI42NA1bXTwAWPJAd+BGzgkdBw7rhbkbSAbg38f2ImREriYrewlcFSPVr0fC5W2LP+1Nwq4MLrCm4bnmXXj8MQ+aYZz5BDeVmRhQvlnPjw4C0BSe6z7o/KcZFnl1R/i3tgZ0FjTfjCF6kira+pNIs3TcWdZRWT5q/P6rIAe5chLhIGOWP2d+kL8FO1mqL08A2dD//eYhSEyuOOwGidhizlvYFdA5WfHyUlHtT9OqHrWRGzoAJuzeUI5xnrRNns4VtsNrweUxA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ0PR02MB7822.namprd02.prod.outlook.com (2603:10b6:a03:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Fri, 17 Feb
 2023 11:19:15 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 11:19:15 +0000
Message-ID: <7eba90f1-b28e-650b-e3ae-9c8e64c29d77@nutanix.com>
Date: Fri, 17 Feb 2023 16:48:59 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: QAPI unions as branches / unifying struct and union types
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 manish.mishra@nutanix.com, aravind.retnakaran@nutanix.com
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com> <Y+TLJ9Ui790bIR3b@redhat.com>
 <87o7q2vv7v.fsf_-_@pond.sub.org>
 <2157ed5c-7e1e-bd8f-1644-b7231fffe7ef@nutanix.com>
 <87v8k4lfgj.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87v8k4lfgj.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ0PR02MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 52642d08-30f0-42a1-51e0-08db10d8cd4c
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1FxmJkhTewRap5MKLGuhT2jAGVlFMp9UMFrSCWcEogOpU3+SdtURneKBZCxn5ShwFwiv9nzZzLk4ZNy/YTUsUjZvVQxri7BnUh8muQYKnadaDcX/SDIrag0rXctCanX+eNq9AYS0mhGZ+mH0/Z03w6dt3P4+++/6/Txh/nU2hnHPob5XWwq/BA4ANwceIzxcrNo1r0Yu4pA4dJt+ZonJ8o0ibu+UdGa9WL4/Xc35AgNTpTAsq2MbFvwlzKVO70wKG9g4hkRjKFdff1stZvxy3oj9dNoI3gyls8Ebdk6V1drL+vuG+CwZVIKZdYWB7qLRykCx3q1CM6IHOWCWwpdRthWPue3+doGO7crYpMnBn/FIoBZEHm7farfZjKU7gRijUZ+TZoJqJAWXCYTAQQSHIvu+cjA3+FQJeIFMRgzbyO+hfENCbvd0Oc34xtZEwNH+FpStYKtgm6dHXQ/RqvpyAoWU5lDBQO7x8i6OyN8X++IfQKDTddleHqJJUxytFzZznTdXEZ9RuMlyccbF1w9yRfSE1nuxrEVY6PnDFi/3U+83Et7peqRjV8R2iRtzA0VBFxIeFiLF+lUTlK02GVNw+HiPFJ/qjwzVFvBItz76TEwDHdio2ZL0wA7uzDSKX01WxrIJA3vyNzDcOp3CEfzOzTbilQYIH6IRdve625z/eD102OUoOsrz3KzeGXADnbJ0HAaN1PwjP4mvoxa5yo3moc8bIJDoupifu7AJ559tI+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199018)(31686004)(8936002)(6512007)(26005)(186003)(6506007)(316002)(66899018)(478600001)(66556008)(6486002)(66476007)(8676002)(66946007)(2616005)(6916009)(6666004)(107886003)(4326008)(53546011)(5660300002)(83380400001)(41300700001)(2906002)(86362001)(44832011)(38100700002)(36756003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlNxWFdTTm41cXczQmE3cHV6TG00N1c3WkZqa2UzZVNKWm1scXpCUDY4aDZt?=
 =?utf-8?B?Ulp5WFZUWTZub2t4T3pvaEFoRkhPTFpNL2VjbzdxVWhvWDFsZWVxc1Z1cmVQ?=
 =?utf-8?B?eTVhMlhwTStxQTd5dnMvQlBYZG5OdmQxRnVrcG1hQk40OHVtdGY4ODVjV0k5?=
 =?utf-8?B?eVE0djgxSStxMU8zYlFNRE1ka05rMGxwWlJPOTIraFRMMG5FSXI3bUc0aTRO?=
 =?utf-8?B?ajZuR05HUyt2ZUdxOGNYWno0WDgxaWZNQ0o5MzhnTTRDRCtTVnVHTEpjWWhS?=
 =?utf-8?B?d3FCNFdDcGQvWHNzY2E5Z2tsZXd1QUh2akdMVml6RDdtUmhDbmE5a3FjRnl1?=
 =?utf-8?B?MSs3THJ3MVdQWjZZWStEekJFNGJ1MXpoS0hPY0h1YytJaDNlbEt3VGhTeVZH?=
 =?utf-8?B?VHRPbk5nTjBpNXJEWjZ4Q1dpU294SjBpMjc0L2NQdTg1L2hLYkFDZEVINSs0?=
 =?utf-8?B?UFkwN0JMcFFaL1BlR0pFcEhFd2d4NFhjYVNFTE4xZHdIaUJBWXpvZVEvTTh3?=
 =?utf-8?B?NExRM2w4d01meEZLdkJuN0JNR3N3V2xGeG94WXE5RnRjQVRDT1pKVU91eFdr?=
 =?utf-8?B?RWFPWVl5U0VOUTJqQ0dHejRONHBPaEQ2K2oxRUlHNnVZbjcxQ0wwTTRLMjJv?=
 =?utf-8?B?SVNlVEJITnNMMzJUWGxPdW5QT1laZEd5aXRmZVRCR1FGc0wyVm1KeGRhRlhO?=
 =?utf-8?B?K1pPVjBVR2ZidFkwdCtyOWNrTWU4T25rd3pVNjNrY0YzeCtWR05sMEhQT2cy?=
 =?utf-8?B?MitWM2l6YzA3YnhmV1lYakdYN29KNUtXaFJFT0pkWTViQWxiZFdIcHQyNEpV?=
 =?utf-8?B?OWNWaHlzK3BIK1RCYVNlM1FIUjRsUWptWDF4YTF3OUxkOFZqSjVLeGk1Sm1q?=
 =?utf-8?B?dzRUd2E0UUozQ05PTzdqb3NQdmp4WkJ0SmZCTDRJUEdFSE85N2hVMG1xSU9H?=
 =?utf-8?B?NUNSajBENUNUUVI1M0tRb0QwcytibkNSUjQweU9CWnFQNHZDakwvMnp5WC9h?=
 =?utf-8?B?dTZrTDlpdnMwTDNhTWU4bGxJVWZEYzNBN0xqd3hmc1FxLyt6RDFtdXhxNG5J?=
 =?utf-8?B?dzVhaVh1VEh1MDFyOTdxUCtWblNKT2ROMHVwbi9lb0JGY1p0Qm9TRFRtd0tm?=
 =?utf-8?B?RlJNNDRJSzc4ZDJmTW5rNnZ1MDBubko0RWc2OGh3WGxFSVhVVmpQL2U4aXVl?=
 =?utf-8?B?eXNVY2QrU2VHcFpxSWhoRDRIRXk1TFVmbnI2czU4Ui9GTHEyNU1yL0VCQlNx?=
 =?utf-8?B?MlF0WnRYVHcvY05PMFExRjdkdjVIT0lKMGl6RGRBcGZMSGhEWFNUUXZVdjhi?=
 =?utf-8?B?UWVRamRsVUpHNURka1ZNZk9PTVJpSzBIRkJjdHNVQXVFS0RJUkI5MW5oeGNV?=
 =?utf-8?B?Z2lvV3VuWjQ0c2NxaTg1eWZFZmVTQ2R5UVF0YXVxbndYNm1jTHV2SmZ6Yk1Q?=
 =?utf-8?B?czYwRjZjcVhNSmk1dVhheTBjOFdMQmRLOWswbGVNMHcvaVZWZWFpK3U2SjJK?=
 =?utf-8?B?d1c4MndydFViRWt3ZjUwUHhzbEhlMkIvZ3BTd3AvcWpSSUxPSnMyZnIxU3Yy?=
 =?utf-8?B?S0t1R2tqSGVlb1Vvb0VZT05FRlFERUJKV3ZxdTBtazl0OUtJRExxdWlDdGxt?=
 =?utf-8?B?YUpTQUVGUU9nKzdnL2twZ2V2MitjQTBWRkdCM0VlUlRoVFZVSEF2bS90WFhG?=
 =?utf-8?B?TWpldisvT0h3OUQ3ZnBnSERvMUVMbmk4amJyUFZHK1M5SWZUTXpERE93d01q?=
 =?utf-8?B?eG41d05xRk8zelFoTFdNUi9OL1VMa2haLzB2L3dmVnAyd056bEFkSHFDaE85?=
 =?utf-8?B?a3N2aWdWV3NMZTVOa0ZOclVLemhySkI1UzBxQ2Z4ZmhPcmtHVGw5VjlBSG1h?=
 =?utf-8?B?MWxINzdjNHB3OE1GY082MWZHZ3hoT21JYTFTdTBRZEVGU0hhRnlTclVVM1Nh?=
 =?utf-8?B?aCtrajJIUWRNNzJVeDg1K2JqcDMyOEk1Q1dEZkt6czNmQWY2M1RSUmRNYXR5?=
 =?utf-8?B?QnVvc0d2UGdEUzhYREVxZVpkK20rcjhMdEtDdkxoU3JHR2tWM0pkUjVBeEFl?=
 =?utf-8?B?TVhBYzlkUEwxZ1ZZMytFZVV4d0ZzVHZtRkN2UXI0dFpaeXp0U0g1c0V3UmY1?=
 =?utf-8?B?M0xlWTFaMUV1bU4yVHdheTFnRE5FNlNFRnBNa0UxRjhZRnhPTE5CdHY5emlH?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52642d08-30f0-42a1-51e0-08db10d8cd4c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 11:19:15.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L82j3wlnbmq2MxugdS+I4Bo7sZXzEOsN21dlMh4WGsuJGjXLipUMlsk1+EmjZuSzXfJiRIeZw56hJ2YmxP2OjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7822
X-Proofpoint-GUID: ZZ1LVn8H-xQFzbN_8yrSzMHhFy8OD__Z
X-Proofpoint-ORIG-GUID: ZZ1LVn8H-xQFzbN_8yrSzMHhFy8OD__Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_06,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, SPF_HELO_NONE=0.001,
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


On 14/02/23 3:46 pm, Markus Armbruster wrote:
> Het Gala <het.gala@nutanix.com> writes:
>
>> On 10/02/23 12:54 pm, Markus Armbruster wrote:
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>
>>> [...]
>>>
>>>>> +##
>>>>> +# @MigrateAddress:
>>>>> +#
>>>>> +# The options available for communication transport mechanisms for migration
>>>>> +#
>>>>> +# Since 8.0
>>>>> +##
>>>>> +{ 'union' : 'MigrateAddress',
>>>>> +  'base' : { 'transport' : 'MigrateTransport'},
>>>>> +  'discriminator' : 'transport',
>>>>> +  'data' : {
>>>>> +    'socket' : 'MigrateSocketAddr',
>>>>> +    'exec' : 'MigrateExecAddr',
>>>>> +    'rdma': 'MigrateRdmaAddr' } }
>>>> Ideally this would be
>>>>
>>>>      'data' : {
>>>>        'socket' : 'SocketAddress',
>>>>        'exec' : 'MigrateCommand',
>>>>        'rdma': 'InetSocketAddress' } }
>>>>
>>>> though the first SocketAddress isn't possible unless it is easy to
>>>> lift the QAPI limitation.
>>> Context: SocketAddress is a QAPI union, and "the QAPI limitation" is
>>>
>>>       scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:79:
>>>       ../qapi/migration.json: In union 'MigrateAddress':
>>>       ../qapi/migration.json:1505: branch 'socket' cannot use union type 'SocketAddress'
>>>
>>> Emitted by schema.py like this:
>>>
>>>                   if (not isinstance(v.type, QAPISchemaObjectType)
>>>                           or v.type.variants):
>>>                       raise QAPISemError(
>>>                           self.info,
>>>                           "%s cannot use %s"
>>>                           % (v.describe(self.info), v.type.describe()))
>>>
>>> This enforces docs/devel/qapi-code-gen.rst's clause
>>>
>>>       The BRANCH's value defines the branch's properties, in particular its
>>>       type.  The type must a struct type.  [...]
>>>
>>> Next paragraph:
>>>
>>>       In the Client JSON Protocol, a union is represented by an object with
>>>       the common members (from the base type) and the selected branch's
>>>       members.  The two sets of member names must be disjoint.
>>>
>>> So, we're splicing in the members of the branch's JSON object.  For that
>>> to even make sense, the branch type needs to map to a JSON object.  This
>>> is fundamental.  It's the first part of the condition in the code
>>> snippet above.
>>>
>>> We have two kinds of QAPI types that map to a JSON object: struct and
>>> union.  The second part of the condition restricts to struct.  Unless
>>> I'm missing something (imperfect memory...), this is *not* fundamental,
>>> just a matter of implementing it.  But I'd have to try to be sure.
>>>
>>>
>>> Instead of simply allowing unions in addition to structs here, I'd like
>>> to go one step further, and fuse the two into "objects".  Let me
>>> explain.
>>>
>>> If we abstract from syntax, structs have become almost a special kind of
>>> union.  Unions have a set of common members and sets of variant members,
>>> and a special common member (the tag) selects the set of variant
>>> members.  Structs are unions with zero variants and no tag.
>>>
>>> The generator code actually represents both structs and unions as a
>>> common QAPISchemaObjectType already.  QAPI/QMP introspection does the
>>> same: it uses a single meta type 'object' for both.
>>>
>>>
>>> There is another spot where only structs are allowed: a struct or
>>> union's base type.  That restriction will be awkward to lift, as I made
>>> the mistake of baking the assumption "object type has at most one tag
>>> member" into QAPI/QMP introspection .
>> Hi Markus, thankyou for explaning in such detail. I tried to understand of what you explained.
>>
>> So IIUC, you mentioned the QAPI generator treats both structs and unions same, but basically in the schema.py checks is where it tries to distinguish between the two ? and because of the fact that docs/devel/qapi-code-gen.rst states that for a union, it's branches must be 'struct', and that's the reason it gives an error ?
> Permit me a brief digression into history.
>
> The initial QAPI design language provided product types (structs) and
> sum types (unions containing exactly one of several types, and a tag
> member that tells which one).  The two are orthogonal.
>
> These unions turned out rather awkward.
>
> The unions we have today are more general.  They have common members,
> and one of them is the tag member, of enumeration type.  For each tag
> value, they have variant members.  Both the common members and each tag
> value's variant members are given as struct types.
>
> What if the tag's enumeration type is empty, i.e. has no values?  We get
> a union with no variant members, only common ones.  Isn't that a struct?
>
> Not quite.  To get a struct, we also have to drop the tag member.  It
> has no possible values anyway.
>
> You see, struct types are almost a special case of today's union types.
> To overcome "almost", we can introduce the notion of "object type":
>
> * An object type has common members, one of them can be a tag member, of
>    enumeration type, not empty.  For each tag value, it additionally has
>    variant members.
>
> * A union type is an object type with a tag member and variant members.
>
> * A struct type is an object type without tag member and variant
>    members.
>
> The QAPI generator code already made the jump to this object type
> notion.  It transform the special cases into the general case at first
> opportunity, in QAPISchema._def_struct_type() and ._def_union_type().
>
> *Except* we haven't implemented support for variant members in a few
> places where they cannot occur now, e.g. as a tag value's variant.  This
> is the restriction you ran into.
>
> I'd like to make the jump to object type in the QAPI schema language,
> too.  But that's not a prerequisite to lifting the restriction.
>
>> If that's the case, can we improve on our checks and allow union as a part of branch of a union ? or something else ?
> I believe we can implement the missing parts and relax the checks.  But
> to be sure, we need to try.
>
>> or I may have completely misunderstood most of the part 😅. Please let me know
> More questions?

Completely understood everything. Thankyou for the wonderful 
explanation. Looking forward to implement the missing parts in QAPI 
schema language.

Regards,
Het Gala

