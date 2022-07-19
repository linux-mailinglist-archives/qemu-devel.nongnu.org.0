Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B765797D2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:42:20 +0200 (CEST)
Received: from localhost ([::1]:39058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkgF-00055X-Ti
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oDkeq-0003is-8O
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:40:52 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:64360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oDken-0004E7-No
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:40:51 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26J5n3ee001881;
 Tue, 19 Jul 2022 03:40:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=bDISACnF1xMqIHn3Bgx+XXlPHNlJ4jKiiwcu6iWVdX0=;
 b=CYqsMzg/s55Hu42qvHPXQdy6mNKVkhxtu3wBXXDnYtSDADUXoSwyjbyVSLvD+0jy3ZiJ
 RrZn+m/KirMnbfbM9iIzzceZFJXjdVcSkhDdASlnEduQA0ZUQSI/KagiBd0jhSA6icFl
 m0Nb67yKMEMjLj/AVxP7G2IdlAIAUM3VGQx97TgNbjvYyWYhgNv7zIWWdYfKVT6cOTbl
 +umgHLEKVP4OYYSnspqcrP2+Us6Nh/rWSXdP84ZQXtiM/AOqh5KOreAQFDjtBorbIJuh
 WndCreLjFVN5ZUtvSBi7Y3jGl62EPyDA7wzja4tcd7q6MrE9UcoE9J2Puj3evElWXuGr dA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbs87wye7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 03:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuOHPr8xRL8TBhO2RAqDmutMUf4My6KAgbvN2d6/OzTlE/9s8NKnWuHq3cVZIvPJDt3u+eBNTcBco3fLG+ZQYPoPUnNtNil2cGsHEf8rGlGiWkFb9lgyRhmAYjgAds0BmV+09L91aIKf8dMBAdVe+dk23lvax3Me99jGqFzmX5rP84XXLbpf99BGdNp1QGp4yr23XXR3eotUa9eO/V8gOHYLOtFPruUXKZyGjtvpAuHGrLzOsQEbdck5hANVWgoV0GTmW91fNxqWR99dxzpd+v44S4h/3+MTZjmDjs7ddGDydavSXSHEWDFsMNLgomZ5JtuunynGdZ6z47ye5GiPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDISACnF1xMqIHn3Bgx+XXlPHNlJ4jKiiwcu6iWVdX0=;
 b=fKH7rSezhuQ4qHUB8jQJedh1GQt4CYYmKR4DJ1YaM1EXmYE38isfukiSAacEBfBhxmX5MCH9S68B7igy2FB7d/1T8QtgS5BYPyrfKT6XvNWq4qPYJFS6BhqwT7ciYSUbISK1Woq/Ppej9mRRQ8Vdy6gvXtMx4cHX3Mkd/DHSYkHF5QaxIAS3gALiPHcBM+3lvydj9LGXc8gH3m+rZprtBr21/aD9BeVamFxehwFG98u6bVTdxm0RGTxCVOgX4VpYyxHu4auQ506RxzcJCL46JQzC+HcpPXmkDMjJ2LLORaocgvzRWuPKehp1ywbOmlyQFrckvUvC1S9DQm+2EuI0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB3371.namprd02.prod.outlook.com (2603:10b6:4:6a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Tue, 19 Jul
 2022 10:40:44 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 10:40:43 +0000
Message-ID: <03d3ea30-130f-d4ba-27c9-8ecf9a97ac33@nutanix.com>
Date: Tue, 19 Jul 2022 16:10:32 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzRdIE1vZGlmeWluZyDigJhtaWdyYXRl4oCZIHFt?=
 =?UTF-8?Q?p_command_to_add_multi-FD_socket_on_particular_source_and_destina?=
 =?UTF-8?Q?tion_pair?=
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com> <87h73ees2r.fsf@pond.sub.org>
 <06e02954-f94d-0508-90f1-a8610e1a09cf@nutanix.com>
 <877d4a7ang.fsf@pond.sub.org>
 <c3792d65-b24c-be02-f988-fa1c0e27d490@nutanix.com>
 <8735ex1t01.fsf@pond.sub.org>
 <57b8de99-fcf9-e015-eeb5-cdc14544d721@nutanix.com>
 <87r12hxwk9.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87r12hxwk9.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::22) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f18ec5c-f0c3-4f16-9305-08da6973219b
X-MS-TrafficTypeDiagnostic: DM5PR02MB3371:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTY8EFkMOlKCyZTARWLG+GddG92Dvuap+pz3rfuX6FHAsW7Y862Ov7ct6AdbKZWeVp++8jrq5lrMGJFEOoT70+/CMiKviPLSM1lwU94w3sgyo/JuWuqvDCBBjuGEt6CL6EUXI5ZxKOLSkAJcdcFuIztQR8MnqbHMrt6WLUZ6Ktf5h3qTCk4SGvl+irFBWUGL8Ppj3KCq4o5c8TOnV3g1rEfwyZfeE0K8WLwuXuVRXeEnb0on0LeRb/x7leczx98F2slJ6Ykvqdi6zZO+ltpWrvUg7swu7HJYtn2n/O+hizkOx2FPBTGllyFj/JiDShgGeOkgFuOutFZBA/9Hl4rHDhzTDwzIYZVnMZj4ydtfBou8J2aJPTc7xVRjDZRb6GTtZP/MasyiARMa5cUsNUb80DDVuRuqJ7X+PsSGEGBtNJomQD2FpdcVeSwJLaEvxD37752Lz7LCQjuAN9Ya+jy3jKOcf+nTLt+InTvHvWTHf7Fz8rb+hCilPJDyPaESFdrgFijVPnpW41G/ZC7HeGzOpiDDYAVRxjYsqQSDsRbJQ2ujItBARqnhS4D5YYZZtVbdjR8bMZmQFes7pVv+HPh50V4d9jNMPplYJ8FbVMsFvMnQpuIxXQJpyXQafDED9jB0WfG99Fdw6VDRMB+3Lyt4utHQ02Rsdnng5l8Y9lLVMgi1PnJtW8ulx/YncJYBbFD9LIRxgfap04KrLR7eJvhi9jOl1stlMmqZKKMwGpOojbV+zpOOgz5i73fNciyGRrHKZqK/gzxZqdcxP4OWn043zZFn1e3uvxfLC53Me3wRySJNa/sBMsNKmp+H5cE07kMlJAGtRhIKdc73NHKI3uTEoxE5Ghh6qSdnzV9QMv4/27E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(346002)(376002)(366004)(39860400002)(8936002)(31686004)(5660300002)(4326008)(44832011)(6916009)(2906002)(66556008)(36756003)(66946007)(316002)(66476007)(6512007)(478600001)(26005)(53546011)(186003)(41300700001)(6486002)(6506007)(6666004)(107886003)(31696002)(38100700002)(86362001)(2616005)(38350700002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTRQTThJRGlqRVl4ZWNRRkJPVEJMVGNpbFdkdVhHRUpBWXVZUW1CM1RaWTc5?=
 =?utf-8?B?aEFrYTYxL2lsenhGVTlxTXJRQ000cjgvQ09wODZ2Z1JqczdDajhqSVM3WFRF?=
 =?utf-8?B?MnBESU5CRmI4RmU2Vmg0ZXkwUXUzT095YmVkM3RIOXJuZzBwMUVvZnZWS0pP?=
 =?utf-8?B?MEpZZExEdkYxTHp4Z0R4TEpwNTU2Ujl2cU8wVWdwb2tzUkFWYWsxUGhoK0l5?=
 =?utf-8?B?Q1dEeE83M2NvNVp2enVQczNuSWlaaVZHZnVyeFVpd2k1TXJ3ZWVtZE8xbktG?=
 =?utf-8?B?bG51MGJUSmhLVHJKdENFcGd6U3VpSUZrT0g4MC9OaElFNXg3bDNNTVhPL2Vh?=
 =?utf-8?B?TzVQRjIwSm9EL1E3YW1GdUE2QXloeDVYU1BFbHVyQjdoUGpqdXBFcWJFN2pt?=
 =?utf-8?B?WkJzZGtVTVJWUFd3NGQybE00Q0FKZXUrb1FXdXVYOXNEdXFueGFrZ3dvYXhj?=
 =?utf-8?B?SktlNWpYSGdtNTBHUUpyM3o0d1lScXlPek9tRVhrRXd0c2syTFJDSlo2eTBu?=
 =?utf-8?B?UHdsOWVSS1QwTzVMYkJqVWJSaWxmbmsxRlhiWlNUY29RK1Q2U1V2dGpOZk5q?=
 =?utf-8?B?bDkyaTIvaWt4TENlOTIwdWt0SVpKcUREK2VUc3U1Zm14TEgrWDlFTE1LWjhH?=
 =?utf-8?B?WW9sNVM1LzFxQ05NdU5MU3N5REdWS0JmK0tEQVQ3TGVrbTBORWMyZ0hzY2FP?=
 =?utf-8?B?QUUrWUVrMmpUWUVlWFlZNUtGbzVkNG1xQWhwbWNZSjI2KzN4QWJMZlowZGto?=
 =?utf-8?B?c3JiZGRmWE5XSW1jL05pVmVpQzViZVpnNDNaN3AvY0dhTzFlUEx5QjZoRXNE?=
 =?utf-8?B?V2U5eStsWTZsSExnZGs0N3lXRjVUenRhOCsyTTMrU3RUWC9ONmt4QzFDdUJB?=
 =?utf-8?B?c25kOTdSREhXeS9xZDJUdlpETmZ5eE9TdlFCNHJVL3RCbXNSMzRLVi9KZytT?=
 =?utf-8?B?QzlsNXBKMXhVUiswSkJ4cEJ3b1ZRZlJZR0lyQk1ielM0OEdLL005RkVmbTFP?=
 =?utf-8?B?VmJlblVCTEI3Ymg4d1RwM0VWUXVIMWZvU04yWFFaditZajBnakF3S2YwalVx?=
 =?utf-8?B?QzY1c2dLWEw3M0d5S2VKaGdyUGN1L2tFdmtvV1BVbDQ4ZGowTHFsaU1DZDNw?=
 =?utf-8?B?bTFaYTlPVFJuVDltRmJ3MTY2R3NDUGxacTV5d2xzYUJ4RlE2U1JaQkQrYU01?=
 =?utf-8?B?Y1g5emJ0TWc3ZDE0d3YxY2NNUzQwdHVyR1FyVHA0WXNzZHIrOE94NW8rTXEr?=
 =?utf-8?B?K01rK1FlVklaSG9LM3RNTDBZR1I0U09RU3ZRdHRRRm1SbmZXSXJFWFplRTBN?=
 =?utf-8?B?M3JMeVQxUmpxaWlWc2tGdUhINEtKdDhCN1RoZ0dPSUxMUEFJMFlLY0RTSVdR?=
 =?utf-8?B?MHMwMzhtaDJiNkdDdmlRK0dnSEVDWGdMSHFxdElyL0p6UCtlaGhHSkNSTkhz?=
 =?utf-8?B?NkFOOU1CTWUyWkpvaks1MWVzcWtFdjhwTlNYUSsrZUF1UFBiNW83Z1BST0pZ?=
 =?utf-8?B?SzFYSjBXcVJIcTdNWTRSNDhpR0VGVzZucFNUZjJQY1poSHZQZ0VpSW5yNURk?=
 =?utf-8?B?ZDQ4SDBBdkQ3UjJLa3lqSXB3enNjNFJjTmFCQ0RqSHMxZmM5K01MVCsvaSt0?=
 =?utf-8?B?elREUTByTzgzbzBMalc4eVVFOXJFcnNmcXh1R01WVzVTSnl4YU01VzZOV2VR?=
 =?utf-8?B?T1hZT1NBTjZKQll1cEYvNVhIQ2tjVjdENU5CcUgrUzIxejBXVzhsYmhCclk3?=
 =?utf-8?B?SXI5RTR6dnluYklicjYvYXc4a1ZjMnJtdDFmdmdvd0Rmb0pxeU5yWk5IRERL?=
 =?utf-8?B?RmxaWllDanRMeGtpeHNlaUJpWExuYnRTWUpMWnI5VlhQZE5uVTZQeGZNR2Yz?=
 =?utf-8?B?ZVdTK1g3RWh4alFIRUtNdkIxWm9RaFZWMU83ckR3WE9QNmV3SnVKU0xnYzlh?=
 =?utf-8?B?cEt6Mk91VzhZZVZBVkplRlBjaEwrNjNoaHNlY0JDcDFNcEFpOGc3MDVUY01Z?=
 =?utf-8?B?NWFqQ0lRTzdTYmJZK1ZaYS91K3QrVlNjb2xGVGI0YkVxYlp2cElnRXl5bHB6?=
 =?utf-8?B?ZE80dW9ZbDQ1bXFEejcydnRzbzFUd3cvdHhmalp0eVQvQkFaUS85SXZzOWJR?=
 =?utf-8?Q?NQUleMZY8C0TIRj/V8E98epS1?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f18ec5c-f0c3-4f16-9305-08da6973219b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 10:40:43.6408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2zXKZZ8L0CtGjskUjZpolFB5aahc/iPlO0eN36LT85VKolUDfB7LZxSHqRLBHjjBu+zyBjGFyj7xEM+s7NYfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3371
X-Proofpoint-ORIG-GUID: aqgfPbDq0xoOqUFy7-r5WXGEn4Da0apz
X-Proofpoint-GUID: aqgfPbDq0xoOqUFy7-r5WXGEn4Da0apz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_22,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 19/07/22 3:18 pm, Markus Armbruster wrote:
> Het Gala <het.gala@nutanix.com> writes:
>
>> On 19/07/22 12:36 pm, Markus Armbruster wrote:
>>> Het Gala <het.gala@nutanix.com> writes:
>>>
>>>> On 18/07/22 8:03 pm, Markus Armbruster wrote:
>>>>> Het Gala <het.gala@nutanix.com> writes:
>>>>>
>>>>>> On 18/07/22 2:05 pm, Markus Armbruster wrote:
>>>>>>> Het Gala <het.gala@nutanix.com> writes:
>>>>>>>
>>>>>>>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>>>>>>>        each element in the list consists of multi-FD connection parameters: source
>>>>>>>>        and destination uris and of the number of multi-fd channels between each pair.
>>>>>>>>
>>>>>>>> ii) Information of all multi-FD connection parameters’ list, length of the list
>>>>>>>>         and total number of multi-fd channels for all the connections together is
>>>>>>>>         stored in ‘OutgoingArgs’ struct.
>>>>>>>>
>>>>>>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>>>>>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>>>>>>> ---
>>> [...]
>>>
>>>>>>>> diff --git a/migration/socket.c b/migration/socket.c
>>>>>>>> index 4fd5e85f50..7ca6af8cca 100644
>>>>>>>> --- a/migration/socket.c
>>>>>>>> +++ b/migration/socket.c
>>>>>>>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>>>>>>>          SocketAddress *saddr;
>>>>>>>>      } outgoing_args;
>>>>>>>>
>>>>>>>> +struct SocketArgs {
>>>>>>>> +    struct SrcDestAddr data;
>>>>>>>> +    uint8_t multifd_channels;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +struct OutgoingMigrateParams {
>>>>>>>> +    struct SocketArgs *socket_args;
>>>>>>>> +    size_t length;
>>>>>>> Length of what?
>>>>>> length of the socket_args[] array. Thanks for pointing it out. I will
>>>>>> be more specific for this variable in the v2 patchset series.
>>>>>>
>>>>>>>> +    uint64_t total_multifd_channel;
>>>>>>> @total_multifd_channels appears to be the sum of the
>>>>>>> socket_args[*].multifd_channels.  Correct?
>>>>>> Yes Markus, you are correct.
>>>>> Sure you need to keep the sum separately?
>>>> So earlier, the idea behind this was that, we had this intention to depreciate the migrate_multifd_channels() API from the live migration
>>>> process. We made total_multifd_channels() function, where it used to calculate total number of multifd channels every time, for whichever
>>>> function called was computation internsive so we replaced it by returning sum of socket_args[*].multifd_channels i.e.
>>>> total_multifd_channel in the later patches.
>>>>
>>>>    But now in the v2 patchset onwards, Thanks to inputs from Dr. David and Daniel, we are not depricating migrate_multifd_channels() API but
>>>> the value from the API will be cross-referenced with sum of socket_args[*].multifd_channels i.e. total_multifd_channel, and error if
>>>> they are not equal.
>>> I'm afraid I don't understand.  I'm not sure I have to.  Let me loop
>>> back to my question.
>>>
>>> If @total_multifd_channel is always the sum of the
>>> socket_args[*].multifd_channels, then you can always compute it on the
>>> fly.
>>>
>>> I.e. you can replace @total_multifd_channel by a function that returns
>>> the sum.
>>>
>>> Precomputing it instead is more complex, because then you need to
>>> document that the two are the same.  Also, bug oppertunity: letting them
>>> deviate somehow.  I figure that's worthwhile only if computing on the
>>> fly is too expensive.
>>> Okay, I understand your concern. I am okay with your approach too, but these things are not expected to change out of qmp command context.
>> So is keeping @total_multifd_channel variable should be fine? or making a function is better?
> I recommend making it a function unless we need a variable for
> performance.
 > Okay Markus. I will make it a function rather than a variable
>
> [...]
>

