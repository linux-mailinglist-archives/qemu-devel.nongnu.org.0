Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01CC6643EE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:02:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFK5-0000O9-97; Tue, 10 Jan 2023 09:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pFFJz-0000My-QR
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:09:48 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pFFJu-000513-Pc
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:09:45 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30A9QA1K031419; Tue, 10 Jan 2023 06:09:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=V6OlxHKAp4ADiAS8Bj8NtVJZMrrnERuiOyPDvsqqWmI=;
 b=RxTy2oWy+OHXiWvmw44KMyXsLGZjzsJ+RfZK++iyKrSw8wklWWo4RfW3GUyX68eVpBOG
 Zja/DZdbH2iTqghsBmdtsajPcjxRo/cNE5WUQSz4eEATOM7C/pnjlhtux68seGC0BoRa
 7Ip4jIzZ481TBsoyq/adehfYjQxmWVmTrZB2eW1l2SavLloGN91v2sLZw3YvhH7dpFpV
 p2wm+scHLLpehnwqZjIxF32BQeD41KHEhgZzjRkOwZsBOpFB7NYiDbsRJzMjvn5lIuWR
 OaK5AZtEoDQvtxYTSbBxEyXywkDdcweA6O2epTgcXFdR/+I6fuA0zSVC7qWjO5EM4FWC NQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3my5y1869e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 06:09:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWUIyic4i7cVQNN5TUs3uiol9RXXP1rFE465dGRicOVOibH+Grl3gjRa0TTNcTJ3ypEkRR3F71bpwuKSQR7H2XjWBuPdIGrx3kVHGY0iP2fcYoOGO7u0uIwtg13zj+eYMd9wUY0i9/AdWqioWSil0LJAPcoYjOGhVnPUlck1S2WOKdJmp4OHtnb2GWs54BFGRpAMbDdPgO1sAvf3LKZkYWFAnMSclL6BmCmRBRkTimMw5D/RAnPRWDZZvaPpALtpoPJrJ4qL2EsDEFQs0bGXstfL7CphQoX5QfRlxguXR6bdunrsMdDyXGX2wk6r87S5gAAfduL7tSX7yK7zZPswSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6OlxHKAp4ADiAS8Bj8NtVJZMrrnERuiOyPDvsqqWmI=;
 b=TRNozUvuYo6DqmkzfKheOmUoUFQtU/KbhIQO32YryS6JPOm+8luHLGIzSxk7MDtVORf546TJrRiV8WM6CBpkW9GOaAnzR5qk07MoD9Y75OPCiCF2atUdqm5qeA+oAJ7BXAiBRDfJhBF8bF7tbPQHBenI06htXAN+dxqT24kfHd3NzNR8UR4mQj8bd7E9He9bjJq7ChKk+dSDiHD6FyIFu1yKJBsI29c7lL83ZQbHZPSKzkfAjyG+os3cBIjX1Lfdnm/HaHtkdKG5ZJgdMkHuJIqk5bJp4LYlQ1S/f0v8Oe5T5045RkK/bom8U0VQx4g+1lq7GeQPiLpqXOzgWmW3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6OlxHKAp4ADiAS8Bj8NtVJZMrrnERuiOyPDvsqqWmI=;
 b=oEArqt9jyMg2P6TESiXuFbpNPQJZOJSFSmJwOE+BkSOIdFNW2/puuGyjkXP0dUnSMKkhRFSZmjibRmX/rfSgYRqQdnGKB5q+xa5LAPCJA+sAJyG8ocHA2jXo4wGFEnHgp2LRZwW8vdP9c+f6J4QSI5PDKetJmET/hU8uWf18ln2aRhLcBwWC+4ma9QKDhTByBlzNJbGppL9fxsYgbEFFK9bRh7ov1Jhw/K7lxfa4FcgPtYQunWGX8zDFLQFmHs+vX95WGCnpUa248I2DQ/XfpTM7NggchiCiPMyyPmmzoOnVcTivKxCm/mVO55UwPu9kmc080kQlGl+QbRZ2nM+LBQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM6PR02MB6541.namprd02.prod.outlook.com (2603:10b6:5:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 14:09:37 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 14:09:37 +0000
Message-ID: <78cd78b9-1eb2-5ee4-6094-bc699f34e3d6@nutanix.com>
Date: Tue, 10 Jan 2023 19:39:25 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com> <Y7wfoGpM6iwzy8L1@redhat.com>
 <2b1f1234-944f-756c-f952-c8096149191f@nutanix.com>
 <Y70wtsbtIJ7VSgSq@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y70wtsbtIJ7VSgSq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::29) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DM6PR02MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bebb644-163d-426b-1ecf-08daf3144ed1
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A418lktqlx4R3fP0/HmuZaeI8+DqTMeFBblI98Gpa3Hj+2z8RvlfmG0MkPER1DnjEUBfo0iBeSvzE0anOmMaqysdTtZJYficu3GOTHtkIioGYg9wkPOQpqPzmDv5KLagRdD+kQhBJBRPF3iAwRYDpr5qRzu7gMQVFNkIUW6zLhkGwadvX+mhBt+kBt5D9acAKGIRxrnzY4/1VSoqSMx1HV+UJ0+ur89DgDtYcG62cEPFCqRoDwKg2a8mgmT1BECiZKnM6p8ud7ty1hHhssEvQJOkeg5VfZRJEmn9S2mhGcuxjcA29zYfo9j1Qw+sftXlz/YxGlXSwAFGEB7yZyrWR/KE4/f2A8L0glCKC+gkSNsbHDLbTvXYk3eSqnN9kpWDQ3OwoWXR4Vmf0iaEDWPQvss/wYhATKMdYud5EQofWD4R/i2zsGWo7VO7YfUGEx6YiNGnRtxwr+oY4/4e56Ink/Er3XcoQBOOmb3OFu2DxFn0BKZ/x/8QizWnsMA/G9nue1XXMugXJRKhFaCpaHyJQ2EhOuNli/V4hry015+vf0Q51jhmIpfd1xy9uDcQt9vHfncwtuwRYEnqSOFBB+ynAeV1icBubZQ/ASe4uRgzN3oZvbzHk6QFacwXtd/a0GvhOh/OWeE373NhjxTLyfgeQQNo/1kJXwm5wkgx/H9ivCM+l6qC63HUWuoqVZBlFSeAOdX340X+oK1lIz2MDhsR1bCbVa7lLe6XYLGTmJ9TecamGeqp7Uy6B0GoA2YUqPYc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199015)(36756003)(186003)(26005)(107886003)(6666004)(53546011)(8936002)(31686004)(6512007)(6506007)(2616005)(66946007)(5660300002)(6916009)(66476007)(66556008)(52116002)(316002)(4326008)(86362001)(31696002)(38350700002)(38100700002)(478600001)(6486002)(54906003)(41300700001)(8676002)(15650500001)(83380400001)(44832011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXN6R2tLWWlUSmo2VW1GY0FTYjYyM3Jnc0JIdFNGenhpY3pkT0NJNTBWUE8y?=
 =?utf-8?B?bTRWUE9MVTRuOE1CdkYxN2xOdXgvRzdHWmdYeXd3U0d6OUJOd1FkUmUrOWpp?=
 =?utf-8?B?NS9sVURvNHF3Zmt0UWRtK0JXOWlhOHAydXRUQVZHUnB2M3BSU3JmSDhZVTJr?=
 =?utf-8?B?VUVoMUorZktZYm9ibzI5T1B0N0tseHRaT2p4ejQ5M0dXamZyemM0OUxhbERZ?=
 =?utf-8?B?OG90YVNjeWZGeU1TQWZhTGFNckxoUXJzVElDZWthYVZCcm9EL3J5MEl0am5Q?=
 =?utf-8?B?YmhzMXUvci9GcmtzdkdTQjU5M3BiSnl1by84Q3hSd3JxNmIxZGN0Q3AySThN?=
 =?utf-8?B?WEtVWGYxV1NiVDR4R0o0T01MbEJNYlVyQk5QOGpobEhkN1lBNGY2VGl2UWpa?=
 =?utf-8?B?R3VNN2xldWIyYmdteWRVU1N4MDQrVnJIS09vRFdiWnFBRzdNNXJNbFdOYXlk?=
 =?utf-8?B?YmNCUUlOVXgxdzFqQ1RsMWJ4bWVrcE1wY0Ntd25RamQvNEluaTZWbCtGdUVj?=
 =?utf-8?B?NWNyalNpODJxcENFQll2Z3h5UFJwbkdwSFVSWDNRSzZWUm5Hc0ozdlpPcXpw?=
 =?utf-8?B?ZzNZWmRTUVRvcmcvaFJTbHF2MmkwRER0THRCVkdBNkJXNG02ZG96T1Zsa29O?=
 =?utf-8?B?bndLS2hubDJsUjdDdFB4cFpjTEpsUCtMSW9WYXcva3FDMjZ6OXRJT25MS3hY?=
 =?utf-8?B?ZUdmaTQyVzFwd1R4Z2lzVG9NcHlNazZvK01NQll0Rm5wOXNnemQ3dy9wMnoz?=
 =?utf-8?B?dTNrNEhxTWJqMUZVSUFKb1pzYlY1TGhmMktrcmgwV0dOV0NlRG5PMmt0dWdo?=
 =?utf-8?B?QTdVRDBHMG4yd29iL2dwVzNJT2pZOEsvYVA1cUNOcFpxZTNQSWVYYkdvUndp?=
 =?utf-8?B?UExhNU45a0JzUStNL2FocGFuZm82V0ZVK29YQ2hhb2x6aVBZTU1DZzdTRzhn?=
 =?utf-8?B?eDQ0UVNsYlM4U2FJQnVEa04xaFpNa0l0RGJnWFdNVWc3ZTJzTzRMY2libnBF?=
 =?utf-8?B?dFdkSzZRZkVMV3ROWnAvcnIrNVFMemhWRmtydnpCVGtEOU5EWHJkVEFIZEdl?=
 =?utf-8?B?dU5IMnJ3N0tPczEydVFmaG0rK3RpVTZVUlZyd05XMkR2KzF0eGUvWlFzcEhV?=
 =?utf-8?B?eHg0azE0eG0veUJNaTFSRTUwMjd1MDFXSUZiZEI4YUpieC9ETGRZN1FPUGE0?=
 =?utf-8?B?Tjh4QUZleEFQdTRRQmVuTml2cEFZbGpTTTBTOEF6bWpwZnh6OXQ1YmlqdStu?=
 =?utf-8?B?dS9HL2ErWEJLNE1HV0JIakVkTXREVXc0VThSWGRZWWJsZjJqZ0RqU0xIU2Jm?=
 =?utf-8?B?WTlyaVI1QnlWcWFseFJiZVh1QkFhS0hFRXFlOUZISlVPWjVmcEdsai9MM2c4?=
 =?utf-8?B?UU9ZSXhDbTdxRGFrK1JyRHdMdngzbWVsK3JIZU5NNTB4MGpXSDJjbS9HT0hj?=
 =?utf-8?B?WENlTHJROWpycm5jc1BpbGIrVHBvV2xtV0VIQUIyVys1MjE5ZFVPcm43WlBl?=
 =?utf-8?B?OHl3cnhjTm5GVGkrekFZUGtpV2JPMVUwMWZQSTUwMUZHY0dJNjB4Nm9MMEpY?=
 =?utf-8?B?RXRvdUZNZkhZdTFvRzNVMWJQeTJjOGErcnNlTFpNVEwrdXhtdFh5N2lTZzlu?=
 =?utf-8?B?VG03c0tSaVVVdDBUalpTbWRVeUQveXZRRjFlYzg3T1NOM3ZPWWpFVW5HUHV3?=
 =?utf-8?B?V1JZdjczUW1CZmRFaGV2RTIyejJ3ZzJtU1ZiVzBKdVY0SXJ5bUpnVGtqRTdp?=
 =?utf-8?B?cVFDRWxnRW5kTVd2VEQ5TFUwRk5nUTZtdlFnMy8yMHcyTjZuL09BaGhZMG90?=
 =?utf-8?B?dXNaTnpQVjZqRUNYRS9rUHdCS2NGT3k5WlF4ZlVXM2hLLzIzNWcxZVhEUCtM?=
 =?utf-8?B?VVpHa3ZnQ2czUHRhUHdJaWpSS0thSnY1bEFjV3gzSEJkU3hyNVhrN0h1bldU?=
 =?utf-8?B?M2hZUnN6cFQ4cm1mMFMvQTdxbVovZnFLR0hpbktVVEdpcmI4a0FGWjVvaWgw?=
 =?utf-8?B?UndzazlQeC8vclJnWkpwSUs1amFmUFhRdUJLWDFUM0NNelMreFFiUDdleDUv?=
 =?utf-8?B?M1pYNHl0Y29BY0VNNkQ5WU5vTVdtNkVTU3c1YzFFWi9xWWRaZVpWME1vLys1?=
 =?utf-8?Q?dXc7OmfcIjzuhHzruvCaeXkRB?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bebb644-163d-426b-1ecf-08daf3144ed1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 14:09:37.7788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbSELsvg2Vk+P4d3CTAwklrjp55vyjOfEqDIUTRWW48ye05zpaHrswW6OruPxbqAoZoZmze7EORlanHQ4KiSIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6541
X-Proofpoint-ORIG-GUID: LkHZFM1fIu0ibO6fvJZYCB3jKW6ofF0L
X-Proofpoint-GUID: LkHZFM1fIu0ibO6fvJZYCB3jKW6ofF0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_04,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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


On 10/01/23 3:02 pm, Daniel P. Berrangé wrote:
> On Tue, Jan 10, 2023 at 01:09:35PM +0530, Het Gala wrote:
>> On 09/01/23 7:37 pm, Daniel P. Berrangé wrote:
>>
>>> Loooking at the RDMA code it takes the str, and treats it
>>> as an IPv4 address:
>>>
>>>
>>>           addr = g_new(InetSocketAddress, 1);
>>>           if (!inet_parse(addr, host_port, NULL)) {
>>>               rdma->port = atoi(addr->port);
>>>               rdma->host = g_strdup(addr->host);
>>>               rdma->host_port = g_strdup(host_port);
>>>           }
>>>
>>> so we really ought to accept an InetSocketAddress struct
>>> directly
>>>
>>>    { 'struct': 'MigrateRdmaAddr',
>>>       'data' : {'rdma-str': 'InetSocketAddress' } }
>>>
>> Yes, It resembles to InetSocketAddress. Will make the relevant changes in
>> rdma.c file.
>>
>> With this, I had a small question in mind, do qemu need to develop /
>> leverage some functionality to check the correctness for host or port.
>> So that if the user enters an invalid host address, they get an error
>> message to enter correct address, if trying to migrate via qmp command line
>> interface.
> When the RDMA code uses the host address to resolve the RDMA
> endpoint, it will fail and report an error back.
>
>
> With regards,
> Daniel

Okay, understood. Thanks for the explanation Daniel

Regards,
Het Gala

