Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AC554DECA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:20:46 +0200 (CEST)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mcF-0005Ye-Sj
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o1mWF-0003rZ-V7
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:14:32 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:35592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o1mWD-0007pf-GD
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:14:31 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G2AbhX013439;
 Thu, 16 Jun 2022 03:14:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=EggdfEotsb3Yj1H9glIQJEQ2CYSte0kmPduMkMKf0WY=;
 b=wPy66wD/mX3jNvIQ6j+FXpvmqD4ryb6O1kgThlzIpZbX/NQs+leEqurvY6/mdpgKp9OH
 BitIYqEo5Brty+I1n7oZ9TdiLfXtSxW8QsHrU03ENX4cufZFu92HnxfXKhQ1VJhcsSjA
 kLKCN9BsRW15uH+DkFTuIfqFCAf+h0eC9iE0Y8Xe6FDQHUEy1QGhIvBGanRXB8G2zi3z
 v8E73X8talqI7w1IYxxpZRAqwqq9qHPNOvlrQSzI90piswxNQiMskSnpHkfYbhSsQQC2
 ubolrN3wXi2Zv7hFsMKbgl0HVPLpFvfJtA8c1hsGc+wAmhFBdtIgTFIbO9Ulw7kD3kBd 6w== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3gms5jtweh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jun 2022 03:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwE7GfE+dgx21ZTOIvv4YCBnBZ+QK940GrkpMh4xhyACw1Ox29N7qxMgjRDcvc75+YxCfargX5801u8qK3vd4d97/V6Bfvu8ljvkcAofugpfK9wf0dujYxir3SilcsV2YAJhMexd2g/M1c2N6+GqesGMy/7CCQTsfz00QrwsHWfPVmygledCEAwDghz12WIx+46eefKtaW+1fSF3uuGo+yUt9OyImW9rDP2SG8wt05T2aEe5OpbuKwrOQTTPJIstvN444yKIDJS/NBmmLR/uSGT1543CgiI+POGrqBKLsQFbtQ6FJ1Wt2bIaqL1Df0eawMwXOT7B3Y1ym3NiF5IOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EggdfEotsb3Yj1H9glIQJEQ2CYSte0kmPduMkMKf0WY=;
 b=bAlAzFl63WKjon7N71TbMlF78IpTkBeklw05Qtag+zUK7K+dT9i2M8DthFM+wN/6QI0bVYDROWrSNhqZbRCXVkra/pkX/mc9R8bzW70eVs6s8bdcL9o0BoAnSAmk5Gm7mmQ18FEMRxxEHxiuxECOOrh9s/VTlqqwzt6qHaYzlEQ0r+UqPbG+Mgcp0P2INWNFLWrS0i2o+RsVA42rfQhKXVxidXK6aROmRNP7j5w864MqN8TCXE/YjRlz9cXyhpoPIKyxd4BCilPQ5hpsWwVyeAmYbQnOKUK1xlFlqYXT8T0FWbGCYzCE/lZhOQju1l4ZO8NOpEnmF04E9ScD0ufSoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BN6PR02MB2449.namprd02.prod.outlook.com (2603:10b6:404:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 10:14:22 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6%5]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 10:14:21 +0000
Message-ID: <4f19d641-8064-2eec-8b3f-035d4133fe46@nutanix.com>
Date: Thu, 16 Jun 2022 15:44:09 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <YqIWDoSJ/xQC8Vvt@redhat.com>
 <7209116d-ef87-ee6f-5126-e23b55121f49@nutanix.com>
 <YqoMMCbF3PBnYSn/@redhat.com> <Yqovkrm37mUdggws@work-vm>
 <Yqrm6ARhSWllUDul@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Yqrm6ARhSWllUDul@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::7) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2289ce15-18d3-4985-6bd3-08da4f80fb32
X-MS-TrafficTypeDiagnostic: BN6PR02MB2449:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB2449D3727437BC7E9C570C5AF6AC9@BN6PR02MB2449.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDqn+mWmrRflFzy0LvNQcKgasqMfHzy2KjVzyMbVRuWGmi+t85xR93OhD46h8tiryCDaXgtfu4IAwVHUBpUMtO7TF0h0C080CBGiKAzsPHRWCFKQ7K5XYhL2TTsrxLaJb7AwTDk7H4brSR7oYKPPJJKAH4CfxuPizXSpm6EmzE7azazZZNQPjFMuL310RUAbAxoWMQMduoFVGphfTc3ly7pMukwt0ZLxzsvlooovfnVpiEQFmHEyI7PPpmJJqZwjep6NkoXNPp0kTHT9NmHvCcNofcNFF3wktqmPt92wWuE/5yYEeV0tg0NOjl1M8qpfinfk04BDnviCMGJAhmKQeJ4SjL+woPaqVvLKBwhg5ayrpQVlzr0stk/WyYgzmY5gh4mulHK5k3fHa7buH/ZsSSjUcEUNAxpHACCg4Lzf0FnZqUxDHNeSgtMk6A9AczeBuWPg0ssgrsDAxHfNonzbqw+lerXEODCnO1VcJgbnG4NzkK9dfsi0y0hnhfqPxv8w79l/iGT613IAMD3lz1akOTj0OqEjKmpknZNp1nDx7dFr1KrzRKouA8K9OpSZVg6J1XYGJJ3FVgPc+pNEFABi0of8py3smU7LL5X0GzNgujBCe8c69feGEkixgusvkK+pV2TImMy/RpR77QFigkzx3bookoJRgG3SkhgLjahZp4IcdjvGRPabptgLsUE9SCIpXdsrqaIRThKTxmHvuXbEuzXqRXD2ry5H6AXq6lL9vBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8936002)(5660300002)(6486002)(186003)(83380400001)(508600001)(86362001)(2906002)(66556008)(53546011)(6512007)(55236004)(26005)(6506007)(4326008)(66946007)(66476007)(31696002)(36756003)(8676002)(110136005)(38100700002)(316002)(6666004)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTEyZnYvODF4Y2NPTjhVOVBmS3F5V3RhY29TdGxGVU93aXVSMmNqQm9JL3BW?=
 =?utf-8?B?NkVKZTJPMGcrNkdobjBmMFJEUlRvSWd1RE92cWpQMmZWbWYzTStJTmJobkV2?=
 =?utf-8?B?SkpoUC9tM09DZGhxMFBveE1HZC9nWmE3SWlSUnZETVAvdnc2cmFIcEgrWm5S?=
 =?utf-8?B?K1FJOU9aekMzWjFtQ1NoalMrVWxZRWJ4MFR3WVU4V01jajBoQ0VJbDlqMjJP?=
 =?utf-8?B?eUhZVCtZT1ppSldlb2RwbVJ4aTZweXZQVUpzZjAxUVdGWU5rZDlPSmdEK3pT?=
 =?utf-8?B?US9rZDNiRnR3R2NSN2J1L0k3bSthNzlKd1M3Z1QxTmZVM0xnaEdTVDByMW1k?=
 =?utf-8?B?MzNtelozbEdyZTFhVTcwa0g4ZS9oVlB2UnNGYVZ2bmJrU1I2aGVMMkZuazRy?=
 =?utf-8?B?K0p3TlZXUU5TRUNML1I3bDJCbWNJUW5xd2ZZZmFhS1pEZUlwZ21pR1A3cUN4?=
 =?utf-8?B?VE5hMXFadHFCeHF3ZHZwNDl4bFdLT01xUmo0c1JQRVcwdnhCNXpGY1JoRVRz?=
 =?utf-8?B?c0JsVFRXMDNsSDFWNzV2UzhOR3prU2g1U0ZXa3k5MU82ekFJOEhtNEpsRXdE?=
 =?utf-8?B?NTd6L00rbWpGak9SZkdsMklKQ1JHME5XQk5ROUI2RStoQVZlTE95RExWYjll?=
 =?utf-8?B?K0g5WFVVOXVMSkdzVHNmOW04Z0RDV1NZeTFnUWRHMWl5MlJ0L25Rc1NLVEFo?=
 =?utf-8?B?T3FVNktvcmNzSm9xdFVaWnpzKytIZEVoNWdQUTg1bnlxTkdqbVFWWkJNUlVs?=
 =?utf-8?B?ZnQ1MXFuTG9iVmZYMzVpWHhoeE81VndzZ0lWUkV5TGlWKzhVT2xIQ1Y4d2FE?=
 =?utf-8?B?YnVkV29XMmh2TzlqZXdoa1FpaDBKdVVsSDhWQmtNUzhDWGMxbUJleW41WVdu?=
 =?utf-8?B?K3Z2TTJtTXZUei92bTc5S2prQjVZQWNENWcxZUphaXNsWGdOYXVJd0FCN1Q1?=
 =?utf-8?B?WERMelhZMng5WTBPMko5dmViZCtvZjQwbzhZTkpZN0IzVGlwR2dscU15dlZC?=
 =?utf-8?B?TXhlWCtiVXkyVWRoMmxOWkhBb3AybEdpdU5XZ1dHQUQ1eFk4b3lSOGFzWVRP?=
 =?utf-8?B?azMvMDRESWtFR05CeW03N3MxNkJveXpIQmNmWHUwb2tFdzl6d0ZheXZWN0xh?=
 =?utf-8?B?SnJjMUFxU2FCeGxXRlMySEVHMUI1d0tscHV1bFBDc01ZcHM2MEZyZXZwTnd3?=
 =?utf-8?B?ZXBadkJFTEFBekJoWWd5Nk1ERW1tQ3pVQ2liZ2lPUXFPR2p2NHZuYThnRlFM?=
 =?utf-8?B?T2phNlVHSGhNZnVHUWMxZzBGQUh1WGNlTE1kSnNmKzdOYWZ6SlhQaGJEVXpy?=
 =?utf-8?B?ZEE2dHdoWlZqbHlZZlVGU08yRVp5Mks1aXEyc2NpcVpFMnp2Zm9xU2RNVGxu?=
 =?utf-8?B?TldTenVXd0gzTmlmOTd2cHhoalJQVUordHdXN0s2TkIwTUZQa2FGaXZMRHFo?=
 =?utf-8?B?Sy85bXhxZjRhK2VPMHV2bzhwazk1ZGtZb1BrTnd6d0h3c0M5Ry9HY2R0RzZx?=
 =?utf-8?B?elVTNnVyQS9DWFZnYnF3UVpjRW1XbzZidmlaSFlXWUJhMU1XNWJneThFUUxP?=
 =?utf-8?B?eFZrT1FubVRuWnBCNmpuRDFHK0NzdHJzTERMQjF5UGhtcHo3UGFQZDZuUmtW?=
 =?utf-8?B?cFhHZFphQVN3WE1yRld4aDMxcC9FZ25DalhUcnVCdWplZmMwT1hKVmo1UjNG?=
 =?utf-8?B?TjAwS251N0ZldkZBTklKV3ZoanNpamhacWlHOS8rV09wZGlKamowc1hvUmZY?=
 =?utf-8?B?N0JzSmVONG8yVXlvUGtZcWQzTkhNNDYzNllaWmh0U0RoUGxKZWxhYVdrK1Nr?=
 =?utf-8?B?T3RpR2F0Nk5IQVlJWlA5c0dLQXpIZFVzcExMcG5wU3RTVUdiQzRiQUNwb1ha?=
 =?utf-8?B?ZHA1Y1BzbnV1Z3FON1JHc1JWL2xvNUcvYm43MFl2R2NjMmZkdEtpZ3EzTHFS?=
 =?utf-8?B?bXV1bkUxUHltamxxdnZzNUNIMzBtUzNqN2NuQWRKTUZaZVl1RVo3b3BueTBX?=
 =?utf-8?B?RjNKeGkzdllLaUkyVGpvSzF1bGcyMUVmZWpJT0ZibW10azAyd0xzWndiQU5z?=
 =?utf-8?B?NEViZXBtVklOVjdNRVVwK0F4M2k1RVYyV2doMWpTbW9PSWlTSisxdXhsYUtX?=
 =?utf-8?B?bzBZaWtLTlkxVXNOYlBkcXRYWGltOFV0T00yZWd3OWRtZUxxbit3NEZFUlV1?=
 =?utf-8?B?L3M1M0d3QURsKzZYZldoUWwvUFAvR28rZE1iWFdzMXZYUzFqa3lLaldNUktY?=
 =?utf-8?B?aEg1d0F3WlFJbkZ1a1JUNjMrTUdBUEhXL0J1dGZFazNCV0thT1FINFZaZ0Zv?=
 =?utf-8?B?TTNXL2JZQmZkU3pWRmhlRlJVYnVxeUw5RkhMblVGa1luNmJMT0tsWS9HeTdv?=
 =?utf-8?Q?1JW3PXNyHXy3joro=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2289ce15-18d3-4985-6bd3-08da4f80fb32
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 10:14:21.8576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGm4QL5IXZP3E+p4DCPIPiE2FvIJoLZH7TYvD2/ou6P8048HVY/SfKq5xiC8gTjU8qbM0zWBcZ/jjlVwjHyDC9RIkjk0wJcUGV464mVyXDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2449
X-Proofpoint-ORIG-GUID: rtNB2s6rqH4XWc-p1frLz91TaenvHgaA
X-Proofpoint-GUID: rtNB2s6rqH4XWc-p1frLz91TaenvHgaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_06,2022-06-15_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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


On 16/06/22 1:46 pm, Daniel P. Berrangé wrote:
> On Wed, Jun 15, 2022 at 08:14:26PM +0100, Dr. David Alan Gilbert wrote:
>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>> On Fri, Jun 10, 2022 at 05:58:31PM +0530, manish.mishra wrote:
>>>> On 09/06/22 9:17 pm, Daniel P. Berrangé wrote:
>>>>> On Thu, Jun 09, 2022 at 07:33:01AM +0000, Het Gala wrote:
>>>>>> As of now, the multi-FD feature supports connection over the default network
>>>>>> only. This Patchset series is a Qemu side implementation of providing multiple
>>>>>> interfaces support for multi-FD. This enables us to fully utilize dedicated or
>>>>>> multiple NICs in case bonding of NICs is not possible.
>>>>>>
>>>>>>
>>>>>> Introduction
>>>>>> -------------
>>>>>> Multi-FD Qemu implementation currently supports connection only on the default
>>>>>> network. This forbids us from advantages like:
>>>>>> - Separating VM live migration traffic from the default network.
>>>> Hi Daniel,
>>>>
>>>> I totally understand your concern around this approach increasing compexity inside qemu,
>>>>
>>>> when similar things can be done with NIC teaming. But we thought this approach provides
>>>>
>>>> much more flexibility to user in few cases like.
>>>>
>>>> 1. We checked our customer data, almost all of the host had multiple NIC, but LACP support
>>>>
>>>>      in their setups was very rare. So for those cases this approach can help in utilise multiple
>>>>
>>>>      NICs as teaming is not possible there.
>>> AFAIK,  LACP is not required in order to do link aggregation with Linux.
>>> Traditional Linux bonding has no special NIC hardware or switch requirements,
>>> so LACP is merely a "nice to have" in order to simplify some aspects.
>>>
>>> IOW, migration with traffic spread across multiple NICs is already
>>> possible AFAICT.
>> Are we sure that works with multifd?  I've seen a lot of bonding NIC
>> setups which spread based on a hash of source/destination IP and port
>> numbers; given that we use the same dest port and IP at the moment what
>> happens in reality?  That hashing can be quite delicate for high
>> bandwidth single streams.
> The simplest Linux bonding mode does per-packet round-robin across
> NICs, so traffic from the collection of multifd connections should
> fill up all the NICs in the bond. There are of course other modes
> which may be sub-optimal for the reasons you describe. Which mode
> to pick depends on the type of service traffic patterns you're
> aiming to balance.

My understanding on networking is not good enough so apologies in advance if something

does not make sense. As per my understanding it is easy to do load balancing on sender

side because we have full control where to send packet but complicated on receive side

if we do not have LACP like support. I see there are some teaming technique which does

load balancing of incoming traffic by possibly sending different slaves mac address on arp

requests but that does not work for our use case and may require a complicated setup

for proper usage. Our use case can be something like this e.g. both source and destination

has 2-2 NICs of 10Gbps each and we want to get a throughput of 20Gbps for live migration.

thanks

Manish Mishra

>
>>>>>> Multi-interface with Multi-FD
>>>>>> -----------------------------
>>>>>> Multiple-interface support over basic multi-FD has been implemented in the
>>>>>> patches. Advantages of this implementation are:
>>>>>> - Able to separate live migration traffic from default network interface by
>>>>>>     creating multiFD channels on ip addresses of multiple non-default interfaces.
>>>>>> - Can optimize the number of multi-FD channels on a particular interface
>>>>>>     depending upon the network bandwidth limit on a particular interface.
>>>>> Manually assigning individual channels to different NICs is a pretty
>>>>> inefficient way to optimizing traffic. Feels like you could easily get
>>>>> into a situation where one NIC ends up idle while the other is busy,
>>>>> especially if the traffic patterns are different. For example with
>>>>> post-copy there's an extra channel for OOB async page requests, and
>>>>> its far from clear that manually picking NICs per chanel upfront is
>>>>> going work for that.  The kernel can continually dynamically balance
>>>>> load on the fly and so do much better than any static mapping QEMU
>>>>> tries to apply, especially if there are multiple distinct QEMU's
>>>>> competing for bandwidth.
>>>>>
>>>> Yes, Daniel current solution is only for pre-copy. As with postcopy
>>>> multiFD is not yet supported but in future we can extend it for postcopy
>> I had been thinking about explicit selection of network device for NUMA
>> use though; ideally I'd like to be able to associate a set of multifd
>> threads to each NUMA node, and then associate a NIC with that set of
>> threads; so that the migration happens down the NIC that's on the node
>> the RAM is on.  On a really good day you'd have one NIC per top level
>> NUMA node.
> Now that's an interesting idea, and not one that can be dealt with
> by bonding, since the network layer won't be aware of the NUMA
> affinity constraints.
>
>
> With regards,
> Daniel

