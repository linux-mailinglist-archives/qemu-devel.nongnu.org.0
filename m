Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC5A584315
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:29:21 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5Rw-0005MJ-3o
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oH5FB-0006KB-Vx
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:16:11 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:11862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oH5F8-0006R1-H1
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:16:09 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SChZxN022527;
 Thu, 28 Jul 2022 08:16:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=U9TWQbNx3Qq7SE+FYdmnNjg4im/+bDsvqrqdsY+epHk=;
 b=K4eL3yWuwaldGR+ymiiaxQbv81sdsuvmMI4yNuwXdq6LkGjLjDQ9Xr/On5wm5qSh9Ok+
 wV3+t8tTaUBTr8Z6x9NZ6oADDMsXTsxdxdj23Nj2usqJhBB0Nh64529g3rmc+xB3JK4o
 y/wZ3mQZcqr5oiWheDWniGMYPOyftdlORLtQX4Fn3IGyph9s0HarHZXv7vTmRhXNzrD6
 9PZ7yOto1U8ppNv4rkIrnKBohc8Em6VTGZGqFxYE/AGsBPQpmqjGa9Obfio5JekNvnvN
 EbU4202kVJtABSajIFkizWSsiqkhO99w7GPvYl6Y/ocE6s36L3hsrDwKhAVX1Z9TggQk YA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hgeh9cpak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jul 2022 08:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5O0lhwG26dJYFiAcx7/Zs70AVEy8oQGcaTn86EwfGP+4sN+VPA4D8mdlnMbQSJ3+JrN/kT+QbbDPPL32OF6ddRc1U556CbZc3Mjj7119iec64DJT4rKr/TL9S16PN+Ng9mnLGdU7WxthRfD11Ev7Tyx4baJg9pWPLyHF+pud690Vbvx5LuebWk6rMAj8rzxleVgpMc43IESYLSfExt6y7h7HaFZQtgMghW8x/eq4ocSWrljT17p1cdSRNZtx5hQ2cNKEHepBGLGC+Aw0HWC5xi7F2Qxm0ZF8SLy36gU/mUCOI9MGBOlg1isu+WSwL4youIFiFHsCgk1ReX4fnIPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9TWQbNx3Qq7SE+FYdmnNjg4im/+bDsvqrqdsY+epHk=;
 b=VKXY4TwXFp9Ck5n2sR1is7+c8EnaGHaPwG6s77YoxvGocKY5KKlRwTtX5BBlvN1Hn1HTxWvwVeSVOyVh9HOqovBtKDggY0xs9UcXTk1w9J6xq0dZqufg5VD6NiY9e9DWlKTaoJvjg62bwuc06feBUY0ueEaO8PjAyD6qx0kdV3KPfksq3QgiDYNvwonzE6xYR0Ew58CyV1wnTGGhQfCTWeSpvIpL6bYOJdrPvNFI2MLjQPAa8LKHSA73XjPiCXuBmtgPCYujn8AnRG0VHnIUIuWi62EE6V5tP6X7bXaw59L0t/CuAJTn1V/dWeMpbof1c+rfGicWyBr8LZys2Wmilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL0PR02MB4849.namprd02.prod.outlook.com (2603:10b6:208:28::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 28 Jul
 2022 15:15:59 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 15:15:59 +0000
Message-ID: <22a9ef0c-690b-9057-525f-864ccae2ce45@nutanix.com>
Date: Thu, 28 Jul 2022 20:45:49 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/7] multifd: establishing connection between any
 non-default src and dest pair
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Manish Mishra <manish.mishra@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-6-het.gala@nutanix.com> <Yt/Fcj7ylaOzFpQx@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Yt/Fcj7ylaOzFpQx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::34) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5d6ef0-33be-4eea-2d78-08da70ac13ab
X-MS-TrafficTypeDiagnostic: BL0PR02MB4849:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+KhibutAYE5Tf9VuTwHyge9BWrSdc2eqbouN3qWQVWDA8DZeI6Ei0ugpf3vIS/YUn1MTBNg4s8QFae3R14q+0t/o1PWpzYo+X5LUUHs5hveDA5s96B4GLqnW8s1pOJjlO/haLvWY06F+YHPzL3lhGagHRJ6wd6O97KfsRi4U5xFoMXWdDiJQLuqi/5tGnSkAbwEHtAAugBrlNbNEEr/Y5SvzJoavYe8oIuFNJIatwvykEs6GINcEHkLid/dQkftTIpxTQxFleWdQ1uRTDvjY/QEqU6V+Cc/2VCFmQvabtAiuoJ/g69zf5DAuB/D33LB/wf1KmQvsp7ePWfab4WbwIv+9oabgXYATXYXUmTCbIR+NnTOG9/Bp227G+H7qHbHgBOQH1/7hKEob7dH4XfahPdKd+S7YdxmW7Pv1MOe/YQ12Y4fIHE2j7V/hU3KHGTl7MX6EsUHNW0rBxxQNojWAVKa2cHKsCPdajT6ASddAjfjvpAlnMm6ZVKkCpODQ9RnaWV0nbi+wmg6pKgTNKlHkTcrcxjiNIaTgp1Zpr7jd/Z64RKqwxTiXOHfJlBMWuWV/wC4G1Qzy71oFa6bU7DDrzlm5EOuKzC1SurLeDD6Q2BszwnWSoJsxueIZCKEtssiCGiSea8dqqHHL8Lc9TUeNZTa+vSkko/6geplrFToIjk1fGbeIyzxgCVkDLxwDyLlaUJGQiuFwdM8wFypVjuxaBvHKACXgXaK+hWyeQoykgNxVoevAv1ZpS2uG4zSo6Gds7KQu6RxQtPg2Q8++kyA5hrMBuQJE9fQ5NWaZpGVdfNMxtrrKetwhx2vSBk4WqIc/lMPSR1oYrngwvvystUvz4RhciveC7THwAN4TToKfMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(136003)(39860400002)(396003)(346002)(6666004)(6486002)(52116002)(86362001)(26005)(6512007)(478600001)(30864003)(6506007)(83380400001)(2906002)(8936002)(44832011)(66476007)(41300700001)(5660300002)(2616005)(66574015)(8676002)(31686004)(4326008)(107886003)(66556008)(53546011)(38350700002)(38100700002)(6916009)(31696002)(316002)(36756003)(186003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzhPZlB5WWVEOFhoOHFzWGFQUEttUzJzR2txc1RKb0ZKdktHWkhPSU1NdEk2?=
 =?utf-8?B?U2hZLy9KZGZlWU8wWGR3aERhbTBKRDVhdXN6U1B2MXBFR3BOM29YRUxjR1JL?=
 =?utf-8?B?NjArUGNRc1NDdjdCZlMvTGx1b1FyUGF4eEFSN3BHVHFieVpCQXVML25yT0xP?=
 =?utf-8?B?d3FLN1JPWjNYWVZZK0hqb2MxTTJJNHZiT1VCTzluY3ZxaXZ1dWJ4MWYvcHk5?=
 =?utf-8?B?MXp5TzBUYzRqTU5sUHBCVUpMZzA2NFVQNE5Ta1dES0ZvZjZvVEczeEZ4ekI5?=
 =?utf-8?B?K0t3Rmk0b1REL2dpcU12WmV0S1NDRklBQWF5T3Z4OW5ZcHhVclJDL0MyQitt?=
 =?utf-8?B?THYxVktSV0kzVnVZbmwyMW9rWmcvR1ZJV3hpdmVrbEJlTkZuTy9hMlhIaFZT?=
 =?utf-8?B?bFpCK0RXb0s3MUR1VGtkNS9sY0wyTFg5MHloZnE2T055VXhLeEtCdWhrYUFt?=
 =?utf-8?B?aGpHekZZZ0lHZTF0d0FqMTdsd3o0NTk4QlFzcEJSRXZtMTA0U0VqdlE5S1FI?=
 =?utf-8?B?L1pxM083SkZnQ1FGMjk4Wko0TnVkUjliTkkvMGx6U0ZXQ1FhU0hIOVp4TFBG?=
 =?utf-8?B?RWU4QUpndk95dW5LYkttZ001Z3VCZ3FuN3IyMjlnT09YUjZnQUlWSS9jNFdI?=
 =?utf-8?B?bU1PdThlWmM1d3FVY0lWMStKTm5FNm0rT1V6dlRrUGJjWSt2S0hZRUVmN21a?=
 =?utf-8?B?V2tqSXdFT3dMRnN1bFMza0ZERDViKzNLSXhqMGh0WWhtTGIwUVFzVEdCVU5U?=
 =?utf-8?B?RDhMdzBHd3FYOWFHejhVbTlRMXVXVTA3ZDJPVzRzSzVDM0F3d2RrcFN0cDJE?=
 =?utf-8?B?VDN3NlA5UjJkSm1qZ0FodU1ESUhULzRZREhiakd4LzZFUFhWRFdJNStCWU12?=
 =?utf-8?B?RW4xN2twd25zNWk1UXJaSklWUmczWWVsaEZacllBbHlvYVFPNVBZVGF4NFMw?=
 =?utf-8?B?SWJTZFV0UzRkdEt6UDk3bkhkQy9QU1kvakRLbDQ0UiswaUJQT0VBTHQ1QnNX?=
 =?utf-8?B?Uk1hTERzYW9RNUtLaW02VWVtU2N3cHU2bkp1WVhsa3pjc2prTGsyT2NwbXBO?=
 =?utf-8?B?a1RXMkRkbGRxY3A0UzFlOCt0eE5FL2xHcERwOTYyZmlYZHdVK0NPemRkaG1j?=
 =?utf-8?B?Qnppd3oxcmlJN0ZVaWtBK09UVFVTMUNSNnNBSTNiV1lIVVZ3WjhWUGpVTXlu?=
 =?utf-8?B?UnE4QVoySU5mR2M1aTdIY2Y2UUlHU1JJdWRReUk4RklTUmZFbnJPdWlibUEv?=
 =?utf-8?B?Rk9uNEtpa2toS0NNZkJ3MzZXSEJ6ZXdFLzZtN1NqaXVUQ0R3cTZJMFFnNFNB?=
 =?utf-8?B?MFR2NTFJRXFJSHJUbTlPRzRZSDFCSXVhd3NVVW5IeG91dzhmVnpSVnlVSytu?=
 =?utf-8?B?Wk5QZEIrcmhEdS91dm53TGl1S3ZqSXZXUG5sMzhtNTM2V3BiVzJHSm05TDhI?=
 =?utf-8?B?bVZlQTlPaEJPV1VVL3dsbEpKejhhQUFwb1hFaW1VNFVNcURVMkNhTmdMUVM5?=
 =?utf-8?B?RlQvQjFUQklMaHVqMXVYQlgxUUJ0VHN0Wk9KazdJcmNCVzRsVlZpMEtUd3ZV?=
 =?utf-8?B?K3ZsVk40NVhEajd5bjRzNFMrQXJoMUZRTmVUb1FRUDEyVVo2WERodzJ3Ymtq?=
 =?utf-8?B?d1BTUnN3b05yanJGYk9OYU0zNkJ1RlhiRzFjRWgrcjd3VTYxNmNDbWFJRW9T?=
 =?utf-8?B?dVpnZXg5bHozN25NYjgwUGxEb1E5cFRtNnFNSXV6bHcycEdRcWxUQlUxc21u?=
 =?utf-8?B?SW5ESTFQNU5YbnU1TGlGVkR6azNTTVA2ZFlha3BrN2dTMS90ZUxiUmtWTysw?=
 =?utf-8?B?RzN2MTh6SGlpMFhiZE9mMkM5TGN1Y1FraFo0NFZqRStTd3Y1d2crQVJEaWZn?=
 =?utf-8?B?aHQ1ZEVkV1BVOFNad1lwUll5SGRFejhyOWU2Z09FUk13Q1RoU05rbVZBS2RP?=
 =?utf-8?B?R3lPUjVXby9Pdk82cWVxbElzNDllQ2R5OUxwMGpWRHJaM0NaZTlWQnBYbThY?=
 =?utf-8?B?cXh6TjIwTlRvMEpOaU5ING5tVVBsTHQrWlNIK0VZN3NRMVdVZUhHZXlZMmJr?=
 =?utf-8?B?dXk4V0I4a1M0MW9xbTdiZ2h0b0xxaGtsQ1JFSlNMaGpmOVcxWm1jQnpxUEUx?=
 =?utf-8?Q?Eyy5nud5pkZMVSHduo0qTHVuI?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5d6ef0-33be-4eea-2d78-08da70ac13ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 15:15:59.5986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmwJe+OBZb1dV0WoP3a5XteGhZ0pbC03NsU4E6vfMkmYISD8o6T5VX5ZBcG7silvJ3RjnBnKPOMJ7fRLFejXFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4849
X-Proofpoint-ORIG-GUID: euenSV_rKsRFB0DEIB87tDf2kYqgu7Y-
X-Proofpoint-GUID: euenSV_rKsRFB0DEIB87tDf2kYqgu7Y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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


On 26/07/22 4:14 pm, Daniel P. Berrangé wrote:
> In $SUBJECT      s/multifd:/io:/ as this is not migration related.
>
> On Thu, Jul 21, 2022 at 07:56:18PM +0000, Het Gala wrote:
>> i) Binding of the socket to source ip address and port on the non-default
>>     interface has been implemented for multi-FD connection, which was not
>>     necessary earlier because the binding was on the default interface itself.
>>
>> ii) Created an end to end connection between all multi-FD source and
>>      destination pairs.
>>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   include/io/channel-socket.h    | 44 ++++++++++++++++
>>   include/qemu/sockets.h         |  6 ++-
>>   io/channel-socket.c            | 93 ++++++++++++++++++++++++++--------
>>   migration/socket.c             |  4 +-
>>   tests/unit/test-util-sockets.c | 16 +++---
>>   util/qemu-sockets.c            | 90 +++++++++++++++++++++++---------
>>   6 files changed, 196 insertions(+), 57 deletions(-)
>>
>> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
>> index 513c428fe4..8168866b06 100644
>> --- a/include/io/channel-socket.h
>> +++ b/include/io/channel-socket.h
>> @@ -211,6 +211,50 @@ void qio_channel_socket_dgram_async(QIOChannelSocket *ioc,
>>                                       GMainContext *context);
>>   
>>   
>> +/**
>> + * qio_channel_socket_connect_all_sync:
> This needs to be called qio_channel_socket_connect_full_sync to
> match the naming conventions in use in IO code.
 > Sorry Daniel, will definitely update this in the coming patchset for 
sure.
>> + * @ioc: the socket channel object
>> + * @dst_addr: the destination address to connect to
>> + * @src_addr: the source address to be connected
> 'the optional source address to bind to'
 > Sure, acknowledged.
>> + * @errp: pointer to a NULL-initialized error object
>> + *
>> + * Attempt to connect to the address @dst_addr with @src_addr.
>    * Attempt to connect to the address @dst_addr. If @src_addr
>    * is non-NULL, it will be bound to in order to control outbound
>    * interface routing.
>
>
>> + * This method will run in the foreground so the caller will not
>> + * regain execution control until the connection is established or
>> + * an error occurs.
>> + */
>> +int qio_channel_socket_connect_all_sync(QIOChannelSocket *ioc,
>> +                                    SocketAddress *dst_addr,
>> +                                    SocketAddress *src_addr,
>> +                                    Error **errp);
> Vertical mis-alignment of parameters
 > Acknowledged.
>> +
>> +/**
>> + * qio_channel_socket_connect_all_async:
> Needs to be qio_channel_socket_connect_full_async
 > Acknowledged. Sorry for such nit errors. Will update them in next 
patchset
>> + * @ioc: the socket channel object
>> + * @dst_addr: the destination address to connect to
> @src_addr needs to be placed here...
 > Acknowledged.
>> + * @callback: the function to invoke on completion
>> + * @opaque: user data to pass to @callback
>> + * @destroy: the function to free @opaque
>> + * @context: the context to run the async task. If %NULL, the default
>> + *           context will be used.
>> + * @src_addr: the source address to be connected
> ...not here
>
> and same note about the docs comment
 > Acknowledged
>> + *
>> + * Attempt to connect to the address @dst_addr with the @src_addr.
> Same note about the docs comment
 > Acknowledged.
>
>> + * This method will run in the background so the caller will regain
>> + * execution control immediately. The function @callback
>> + * will be invoked on completion or failure. The @dst_addr
>> + * parameter will be copied, so may be freed as soon
>> + * as this function returns without waiting for completion.
>> + */
>> +void qio_channel_socket_connect_all_async(QIOChannelSocket *ioc,
>> +                                          SocketAddress *dst_addr,
>> +                                          QIOTaskFunc callback,
>> +                                          gpointer opaque,
>> +                                          GDestroyNotify destroy,
>> +                                          GMainContext *context,
>> +                                          SocketAddress *src_addr);
>> +
>> +
>>   /**
>>    * qio_channel_socket_get_local_address:
>>    * @ioc: the socket channel object
>>
>>
>>
>>
>>
>> diff --git a/migration/socket.c b/migration/socket.c
>> index dab872a0fe..69fda774ba 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -57,8 +57,8 @@ int outgoing_param_total_multifds(void)
>>   void socket_send_channel_create(QIOTaskFunc f, void *data)
>>   {
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>> -    qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
>> -                                     f, data, NULL, NULL);
>> +    qio_channel_socket_connect_all_async(sioc, outgoing_args.saddr,
>> +                                     f, data, NULL, NULL, NULL);
>>   }
> Don't change this call at all until the next patch which actually
> needs to pass a non-NULL parameter for src.
 > Sure, acknowledged.
>>   QIOChannel *socket_send_channel_create_sync(Error **errp)
>> diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
>> index 63909ccb2b..aa26630045 100644
>> --- a/tests/unit/test-util-sockets.c
>> +++ b/tests/unit/test-util-sockets.c
>> @@ -89,7 +89,7 @@ static void test_socket_fd_pass_name_good(void)
>>       addr.type = SOCKET_ADDRESS_TYPE_FD;
>>       addr.u.fd.str = g_strdup(mon_fdname);
>>   
>> -    fd = socket_connect(&addr, &error_abort);
>> +    fd = socket_connect(&addr, NULL, &error_abort);
>>       g_assert_cmpint(fd, !=, -1);
>>       g_assert_cmpint(fd, !=, mon_fd);
>>       close(fd);
>> @@ -121,7 +121,7 @@ static void test_socket_fd_pass_name_bad(void)
>>       addr.type = SOCKET_ADDRESS_TYPE_FD;
>>       addr.u.fd.str = g_strdup(mon_fdname);
>>   
>> -    fd = socket_connect(&addr, &err);
>> +    fd = socket_connect(&addr, NULL, &err);
>>       g_assert_cmpint(fd, ==, -1);
>>       error_free_or_abort(&err);
>>   
>> @@ -148,7 +148,7 @@ static void test_socket_fd_pass_name_nomon(void)
>>       addr.type = SOCKET_ADDRESS_TYPE_FD;
>>       addr.u.fd.str = g_strdup("myfd");
>>   
>> -    fd = socket_connect(&addr, &err);
>> +    fd = socket_connect(&addr, NULL, &err);
>>       g_assert_cmpint(fd, ==, -1);
>>       error_free_or_abort(&err);
>>   
>> @@ -172,7 +172,7 @@ static void test_socket_fd_pass_num_good(void)
>>       addr.type = SOCKET_ADDRESS_TYPE_FD;
>>       addr.u.fd.str = g_strdup_printf("%d", sfd);
>>   
>> -    fd = socket_connect(&addr, &error_abort);
>> +    fd = socket_connect(&addr, NULL, &error_abort);
>>       g_assert_cmpint(fd, ==, sfd);
>>   
>>       fd = socket_listen(&addr, 1, &error_abort);
>> @@ -194,7 +194,7 @@ static void test_socket_fd_pass_num_bad(void)
>>       addr.type = SOCKET_ADDRESS_TYPE_FD;
>>       addr.u.fd.str = g_strdup_printf("%d", sfd);
>>   
>> -    fd = socket_connect(&addr, &err);
>> +    fd = socket_connect(&addr, NULL, &err);
>>       g_assert_cmpint(fd, ==, -1);
>>       error_free_or_abort(&err);
>>   
>> @@ -217,7 +217,7 @@ static void test_socket_fd_pass_num_nocli(void)
>>       addr.type = SOCKET_ADDRESS_TYPE_FD;
>>       addr.u.fd.str = g_strdup_printf("%d", STDOUT_FILENO);
>>   
>> -    fd = socket_connect(&addr, &err);
>> +    fd = socket_connect(&addr, NULL, &err);
>>       g_assert_cmpint(fd, ==, -1);
>>       error_free_or_abort(&err);
>>   
>> @@ -246,10 +246,10 @@ static gpointer unix_client_thread_func(gpointer user_data)
>>   
>>       for (i = 0; i < ABSTRACT_SOCKET_VARIANTS; i++) {
>>           if (row->expect_connect[i]) {
>> -            fd = socket_connect(row->client[i], &error_abort);
>> +            fd = socket_connect(row->client[i], NULL, &error_abort);
>>               g_assert_cmpint(fd, >=, 0);
>>           } else {
>> -            fd = socket_connect(row->client[i], &err);
>> +            fd = socket_connect(row->client[i], NULL, &err);
>>               g_assert_cmpint(fd, ==, -1);
>>               error_free_or_abort(&err);
>>           }
> I'd expect something added to the test suite to exercise the new
> codepath. Obviously we'd be limted to dealing with 127.0.0.1,
> but it can at least run the code paths.
 > Sure Daniel. Will add some test cases from the coming v3 patchset 
series.
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index 13b5b197f9..491e2f2bc9 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -358,8 +358,10 @@ listen_ok:
>>       ((rc) == -EINPROGRESS)
>>   #endif
>>   
>> -static int inet_connect_addr(const InetSocketAddress *saddr,
>> -                             struct addrinfo *addr, Error **errp)
>> +static int inet_connect_addr(const InetSocketAddress *dst_addr,
>> +                             const InetSocketAddress *src_addr,
>> +                             struct addrinfo *addr, struct addrinfo *saddr,
>> +                             Error **errp)
>>   {
>>       int sock, rc;
>>   
>> @@ -371,8 +373,28 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
>>       }
>>       socket_set_fast_reuse(sock);
>>   
>> +    /* to bind the socket if src_addr is available */
>> +
>> +    if (src_addr) {
>> +        struct sockaddr_in servaddr;
>> +
>> +        /* bind to a specific interface in the internet domain */
>> +        /* to make sure the sin_zero filed is cleared */
>> +        memset(&servaddr, 0, sizeof(servaddr));
>> +
>> +        servaddr.sin_family = AF_INET;
>> +        servaddr.sin_addr.s_addr = inet_addr(src_addr->host);
> My feedback from the previous posting has been ignored. This code is
> broken for IPv6. Never call the IPv4-only APIs, getaddrinfo is the
>   only way to get a 'struct sockaddr *' in a protocol portable manner.
 > Sorry Daniel, my appologies. I certainly misunderstood your point in 
the previous patchset. I thought this post was in sync with the 
ai_family check inet_connect_saddr function, and we wanted the src_addr 
to be called for getaddrinfo function in that context. But, I get your 
point now. I will surely update this in the v3 patchset series.
>> +        servaddr.sin_port = 0;
>> +
>> +        if (bind(sock, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
>> +            error_setg_errno(errp, errno, "Failed to bind socket");
>> +            return -1;
>> +        }
>> +    }
>> +
>>       /* connect to peer */
>>       do {
>> +
> Arbitrary whitespace change should be removed
>
>>           rc = 0;
>>           if (connect(sock, addr->ai_addr, addr->ai_addrlen) < 0) {
>>               rc = -errno;
>> @@ -380,8 +402,14 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
>> @@ -446,41 +474,55 @@ static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
>>    *
>>    * Returns: -1 on error, file descriptor on success.
>>    */
>> -int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
>> +int inet_connect_saddr(InetSocketAddress *dst_addr,
>> +                       InetSocketAddress *src_addr, Error **errp)
>>   {
>>       Error *local_err = NULL;
>> -    struct addrinfo *res, *e;
>> +    struct addrinfo *res_d, *res_s, *e, *x;
>>       int sock = -1;
>>   
>> -    res = inet_parse_connect_saddr(saddr, errp);
>> -    if (!res) {
>> +    res_d = inet_parse_connect_saddr(dst_addr, errp);
>> +    if (!res_d) {
>>           return -1;
>>       }
>>   
>> -    for (e = res; e != NULL; e = e->ai_next) {
>> +    if (src_addr) {
>> +        res_s = inet_parse_connect_saddr(src_addr, errp);
>> +        if (!res_s) {
>> +            return -1;
>> +        }
>> +    }
>> +
>> +    for (e = res_d; e != NULL; e = e->ai_next) {
>>           error_free(local_err);
>>           local_err = NULL;
>>   
>>   #ifdef HAVE_IPPROTO_MPTCP
>> -        if (saddr->has_mptcp && saddr->mptcp) {
>> +        if (dst_addr->has_mptcp && dst_addr->mptcp) {
>>               e->ai_protocol = IPPROTO_MPTCP;
>>           }
>>   #endif
>> +        for (x = res_s; x != NULL; x = x->ai_next) {
>> +            if (!src_addr || e->ai_family == x->ai_family) {
>>   
>> -        sock = inet_connect_addr(saddr, e, &local_err);
>> -        if (sock >= 0) {
>> -            break;
>> +                sock = inet_connect_addr(dst_addr, src_addr,
>> +                                         e, x, &local_err);
>> +                if (sock >= 0) {
>> +                    break;
>> +                }
>> +            }
>>           }
>>       }
> If the ai_family for the src is different from ai_family for
> the dst, this loop will never call inet_connect_addr at all,
> and leave local_err unset, and so the error_propagate call
> below will have no error message to propagate.
 > Yes, you are right, so we need to check and have a error placed here, 
in-case if it never calls inet_connect_addr func, then we should print 
an error statement there right. Thankyou Daniel for pointing this out.
>>   
>> -    freeaddrinfo(res);
>> +    freeaddrinfo(res_d);
>> +    freeaddrinfo(res_s);
>>   
>>       if (sock < 0) {
>>           error_propagate(errp, local_err);
>>           return sock;
>>       }
>>   
>> -    if (saddr->keep_alive) {
>> +    if (dst_addr->keep_alive) {
>>           int val = 1;
>>           int ret = setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
>>                                &val, sizeof(val));
>> @@ -506,7 +548,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>>       Error *err = NULL;
>>   
>>       /* lookup peer addr */
>> -    memset(&ai,0, sizeof(ai));
>> +    memset(&ai,0,sizeof(ai));
> Unrelated whitespace change.
 > Acknowledged.
>>       ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
>>       ai.ai_family = inet_ai_family_from_address(sraddr, &err);
>>       ai.ai_socktype = SOCK_DGRAM;
>> @@ -727,7 +769,7 @@ int inet_connect(const char *str, Error **errp)
>>       InetSocketAddress *addr = g_new(InetSocketAddress, 1);
>>   
>>       if (!inet_parse(addr, str, errp)) {
>> -        sock = inet_connect_saddr(addr, errp);
>> +        sock = inet_connect_saddr(addr, NULL, errp);
>>       }
>>       qapi_free_InetSocketAddress(addr);
>>       return sock;
> With regards,
> Daniel
With regards,
Het Gala

