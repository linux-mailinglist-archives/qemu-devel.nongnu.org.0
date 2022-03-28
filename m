Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79AA4E9223
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:58:51 +0200 (CEST)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYm9D-0003I4-2C
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:58:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYm7X-0001yy-2A
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:57:07 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:34666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYm7S-0005DY-D5
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:57:04 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22RL1T7D032765;
 Mon, 28 Mar 2022 02:56:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=EDYIRz20DZt/6yOagcywrYDCgf41N00hT4FN99KHxeE=;
 b=UTc3JCexuHl2hJSin0peBCwDr1P2MWooSUBU4aEaAlBv7scZ8TIAyXpMj5HRZxuqvBBh
 xQ2hSdmeyy4dwgCjbjTH0TaN3i6x+YaSQ5yLcN+OVSgbkh6aUS+tRg0H+FpaiSY/AiMu
 0VW+qpHqcjEf4pBAITbvKMA76wwPQvSFR3cqOj28Sl7hJMOhgIJ1yJjiCGFBUUbiFTct
 62eHpXJSzO7M+00hdheBBsE0QwUNv7jaaz1K+luzJCa6N+H9G3N0ONRt5zB0BpA42OWJ
 0hvbIMHs00jChqxKPG+0ixybA/3ckShx28ZKLhu9NAyXFtXpb7K9CQw5bDB5iWq3hyLj mQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f1y5uk5pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 02:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fa+18yftXNcY2Ixryqts0s3gryayACwRdDrP6jAzlGCfXg8vEt09k04nUgzQ43vymY2q4WCDONF1RQJid50/t6y3eSs9BwkspQ6YEtOMo35lUpPwwKqlIwTWx2dnqUc9/sLfRTfXri6YGxlWsVi+VHgaeQpdrnl+Gxu5+z6Fwgud+E601mMklB4Hy2zHWDqtshtxnGOJM0XfbiNJLMD5qmVGHogww/nsy4OncdsXRuUGVmc2pXMROnkoatwFbboviPV7T95PVn1c3ARwgn03abKSZNVM6D3p2Jp1ArF0+8z+2r4MgqPP5frlnQbWxgObfP0oa2VbmZSWfbIIc1Fdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDYIRz20DZt/6yOagcywrYDCgf41N00hT4FN99KHxeE=;
 b=ZgM63aQPgOYo+p3/Dlqqc23Rq75MDIU2L2Jm6LC4dqpJA/ASSfFGT0elG7/w95JFwZ/A7IuOh8fXD/+SLIFzf1VJuSyvyEKwuUmtSM5rQgsnCSskb0AZjC1o3QW7jlNb1a9Ql/RTkXVEKYAa+KUjBVsScUaUZO0Y+23hJByiQ0oGRA6o4jL9UKNIai4Ft9+CWWzXXh9Oe7XQeN87UIQ9xGHyVDLWag9aGvjjopGShFxTVcWSql5JGFtIp7iK2DaFjyhpRAhZNqksI3Ml7eWqCJnT0q2uRAJfphna70GLkYW+0csBt+qObVGqVJvkaOGSyf/1VLZzqHy6QuBGNSMv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by MN2PR02MB6896.namprd02.prod.outlook.com (2603:10b6:208:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Mon, 28 Mar
 2022 09:56:51 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 09:56:51 +0000
Message-ID: <07ba312b-2031-7ccb-c5ec-16cd92dca066@nutanix.com>
Date: Mon, 28 Mar 2022 15:26:39 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as PNG
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220322104953.27731-1-kshitij.suri@nutanix.com>
 <20220322104953.27731-2-kshitij.suri@nutanix.com>
 <YkGFWVo0jk/v68xo@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YkGFWVo0jk/v68xo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::29) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6965fb7-eea4-4a44-6c32-08da10a14833
X-MS-TrafficTypeDiagnostic: MN2PR02MB6896:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB6896328F12C0A421F8AA622D991D9@MN2PR02MB6896.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: biI0gXFu58m2mch4roUEMV/fLMC+5vSkoJRTU4N6fQhgti0rgH0ol2zdbRaoeItAEjieZpkEPYw3QxsqMwD5j693HBYfs7WHhK3VdMcXtqLhkSwET3AoH7hlSeokvsG/jQuPGl7WG86/UGXBFQf0uHFKmoZUPlds5nunUTyRLhKP46wXzzW1G05j7P2iNd11ddXY5Rq7jPN5GlTq7fdvRcPpNfnVe8okdL/zcDahGQc3R8VFId8ajFPCapr4BVmnuaSTlSc6Jy5OXs07y+Bmof7/liu+cOUY9LilpZltz75d+An52e7JfxRh1OVGKmXcYG6R+r8xWiGC9ClGVaUOSu/VnJoPUdfXtNb4jGFPwmcGER7lo1AINwFFAvPdJK/T4bbu1kNiie5MZJZ8ldM78X7PXfHYquHnZl6fb/gFywUXjUFftEV5nA8zB0qh2phRA63jxaHtrCZfk9Bn25op/y0bwkS1DWxN27hvlsvQK+IRHeEaRGuo4HtNMKP+h87lYVQut7V4KWeNt9UwipwHi79Md88WT/L2Bc2XoQfKs9uaWvyEj8XbIgiPpFpoIzJOn5qO6reH3QWYntoHb2w9QR+ZXXvZCXt+vDrBV+ZNpHGwFJ7ohFajfPdNtZWj33lO/o7Gptt8zO1vlvGThEZ0Gkvgr4SVo3G/b3V8pfkNYYgp1oinqlMQFjye3BecdE2gxKJm3b+RTFBKzPnezgZAAynKe0PmbbsVp/E/HEt2u+5p3qoEskM8hOc5bcVNU3YsEjUktHXUrpOOKflh5ltRrgPc+c3s0aDO5uFXRs0MRoIR1ru7/BpfmgPkgW4JsvBMpjsSRfK3mNCgYuf1rv0+7i2Ce4ql9EEdhQlZT87Q8EE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(6486002)(8676002)(5660300002)(2616005)(966005)(66946007)(66476007)(508600001)(316002)(66556008)(26005)(4326008)(186003)(86362001)(8936002)(31686004)(2906002)(38350700002)(6512007)(52116002)(6506007)(44832011)(6916009)(31696002)(53546011)(83380400001)(38100700002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEZMSzI3SjFKeEN1QmNucFI0MU5QYmdCUGxSZi95T201Z2NyeVBSYUxWelJX?=
 =?utf-8?B?TTZMQlA2cysxN3hucjExMTJIYUI5QXEwaEgyRTN6dEZIam1XZnRlbVlaK2M1?=
 =?utf-8?B?d2JtQnN5YlQ3K1FpQTI2bm1jaHhiWUh0VllDMGx4b0tWbWM1QW1BYXRDUGVE?=
 =?utf-8?B?b0FPb3JPY1pIQ0Y2UVJ5UFFEVFNhSHA1S0VpeGFqTUYxZVFvNTRTVEtPdTFZ?=
 =?utf-8?B?ZUdEOWMxcitrakVEb1k0amFJeUUyOU9vbTlDRE5KdTFlTTlJUUJSZW12UHVH?=
 =?utf-8?B?VCtqN2pQdzlEOFF1QVlqb3RCbFg4dmdIQ3FpeGw5MHBpa1VkU01ZSE1Xa1Rh?=
 =?utf-8?B?bWJMMGF0WkNWSFYyZ1VodCt1SHJDaGNqa05Od0FrTEdsaGlzcnVJdXhPOTBa?=
 =?utf-8?B?bUY3dVpUQ0N5U2ZRY2sxNlk0Ny93NW81d1c0eGQyODNldTJ5dko0RmhManh6?=
 =?utf-8?B?Y001eFljY1ExbUdOZXVPa2Y2NTlPUGg1RU9ZNTVZdUVYdEhnZjhYUGpnRWxz?=
 =?utf-8?B?UFR0amVaZVJ5dGwyYlFzcDZUOG54d2RRZi9UbVREUnhaK21iQ3BGM2VXOThP?=
 =?utf-8?B?TFNPMjVQNldXWGMrMXcwbi9TSG5pbGlEK1pydzZUYnpOaWtBaHEvVXVGRVlm?=
 =?utf-8?B?LzBzMitFSjh1MWpCVTJSbTR6TXZqVmJCM2hWZHhTdTN0OFhoMzh0YUZlcjE2?=
 =?utf-8?B?NkdpY2FJNGFZb3FaMXZVcllTeDgzc2cyQTFHV1AyZUVSUW5Na2lncnlBaWhY?=
 =?utf-8?B?YUVFanJUTXdLZjR1VnV5d3FsdDZrUGxZNXNsTDZvbzZNalpGOGVic1Y2RExE?=
 =?utf-8?B?a0dpZEt1bnV1b3VUVCtqekxmNjZMYWZSMTlCODA3Ukg5ekVmV0dKQ1d6eFd3?=
 =?utf-8?B?NXVKOXJxa1NZNlJlaFJpdnU3ZlVFRmJBWFl5L1VnbXVLaDZSck55azFGcUlJ?=
 =?utf-8?B?SW55WW01TjdxYzVsV2NONUp3MXFIQkFHWEp1MFdzUFJWTlVYaTkrVXNjUWJh?=
 =?utf-8?B?Vkx2OGR3OFV0UlBWTXVwMU1SSVU2MmlDNDRnNjVmczNuNkJZbjlwZ2xWNDZJ?=
 =?utf-8?B?MmZKaXFqZkkvSXV3WkpkaWhWUEZsZHFGSGFvRW9TenlUNEJEMUJvT1U4aWds?=
 =?utf-8?B?TnB5NWZhNjhTOGxBTStOS1l3NDJpb09qdVFTUXhkWHpmbTZCc0UrQW1yamJW?=
 =?utf-8?B?ZFVlVmUxTnZpTDNtOHhhWnVaTUVUV2dYU3lNaENobC9FZzJpbnRvbnhXQkpI?=
 =?utf-8?B?TXJWeThjd0NCbVJZb2ZJWXpiWnMvaHp3ZTlnZ1NFR2JSUXBlcCt4aU5XZVJ2?=
 =?utf-8?B?SGE2enFXcms5UERBdE1NaHVWKzQvc2c3MXhNbjZFb0ZWeUNudHJUYkkwM3B1?=
 =?utf-8?B?bDZhUXZXSWtSOHVFSTB5YUwyQnljTWRjQ3VxWXAwWkhZMHNWYUI0T3VLMFVv?=
 =?utf-8?B?aGdSOEF0OEpJaUhiUzRyRkFHaVBQSjlFSVdSeUptWENuWDMvRDBZeU41bjZn?=
 =?utf-8?B?MDVPM3JybklFalRyS25Bck94T2hlRXZYOFA5NWliTXI1OEQxckdtN2RhbnRO?=
 =?utf-8?B?RVdYelQwTVBxcFNKY045Q0oxK2JjbHVub2RvRWVTVTJxZXV4WW1LSVZKaXNM?=
 =?utf-8?B?UGJ0T0VVbG5rVklzekFpbVFHcnlXZ0pyaFN1MDVxOVhwRFh3b1RHNzJnOEdh?=
 =?utf-8?B?UUM3ZER2elJNSk9mdzE1QWJKWnhvU2grUkN5Zk9BQnYzK09qNjNDLzRNSEg5?=
 =?utf-8?B?dWJ3YTduMWFUVC9WM3VIdjJGa1krbGNmK3N6bzBCRGJhOWExdi9ON01DOWht?=
 =?utf-8?B?ZFIzM1d4Q2d2SnBrOVY5N01NUTE1UHgreEJqaFFwSzNuN29hWmF0WlNSYU9n?=
 =?utf-8?B?Nnp3Mmd2OVh0VHNISUhXVkRRcTFSL0sxU2c5VDdORUxxeExCZFdoYU5CZ0cw?=
 =?utf-8?B?QTFhN2FtUnRwUTk1NlZNbXBrcjJ6c2VxOEdHQlE1NnZsd2NXMjlVR3FJVi8w?=
 =?utf-8?B?ckpLVHZMZWJ4SDkzNHJOc2pPUnJ5L25ieVNkeHB0MUp3U3lrbjNVOWd0Z2Vo?=
 =?utf-8?B?MjlBZ2I3RXB5MTRUVm1LbW96NTJPanVacE5PUnZtREVJSnRyaVZaTXU1UTdR?=
 =?utf-8?B?aklBRk4wS0NYRXdFM1JOZTRRTzdsLzRySWVsakNyakovWXhPL05WaGhmR3ha?=
 =?utf-8?B?VVVMeklBdGpPN29KenNkS1J6aWU0U3RMRndXajROdCs3WUppQW9vREtjd0Qy?=
 =?utf-8?B?TjFWQWVzYUFxQUZEMTZsNldJYno3UHdLdDlhN21yaTRFb1ZqZUdmaDh0eDdq?=
 =?utf-8?B?YzlxYWthL0FFdEZ1S3JLaTlLdHJmakVyL25SaUwzdzFJNjlyb0NmdGdUdHB2?=
 =?utf-8?Q?ni30knhqoN/NvKpg=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6965fb7-eea4-4a44-6c32-08da10a14833
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 09:56:51.6579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtkunGfVb666q9kc10G3xBGBBCFsvdSLgXndzcCNsDqPPId6E4HBbEbHYvn6I4Ga23jMTwNTt3P4d+zBvN/Oz/YGjKpXMmFG1Zgv03YzXTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6896
X-Proofpoint-GUID: 64yE1pueyvoav5pdVx-PS2bv5j4uDMc6
X-Proofpoint-ORIG-GUID: 64yE1pueyvoav5pdVx-PS2bv5j4uDMc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_03,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 28/03/22 3:22 pm, Daniel P. Berrangé wrote:
> On Tue, Mar 22, 2022 at 10:49:53AM +0000, Kshitij Suri wrote:
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> "format":"png" } }
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIDaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=SfkDKyBHSRlW9cvs1qhKamw8p2-qgFH_XQcMVSwM5IPIjGQm0Emsj496xu-fpwaw&s=4EZwj8JQje-qxGhg2-Vv81iA-atUQTCNNBnlk1AW7do&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>> diff to v1:
>>    - Removed repeated alpha conversion operation.
>>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>    - Added a new CONFIG_PNG parameter for libpng support.
>>    - Changed input format to enum instead of string.
>>    - Improved error handling.
>>   hmp-commands.hx    |  11 ++---
>>   monitor/hmp-cmds.c |  12 +++++-
>>   qapi/ui.json       |  24 +++++++++--
>>   ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>>   4 files changed, 136 insertions(+), 12 deletions(-)
>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 664da9e462..e8060d6b3c 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -157,12 +157,27 @@
>>   ##
>>   { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
>>   
>> +##
>> +# @ImageFormat:
>> +#
>> +# Supported image format types.
>> +#
>> +# @png: PNG format
>> +#
>> +# @ppm: PPM format
>> +#
>> +# Since: 7.0
> This will probably end up being 7.1 at this point.
Oh okay. Will update the version
>> +#
>> +##
>> +{ 'enum': 'ImageFormat',
>> +  'data': ['ppm', 'png'] }
>> +
>>   ##
>>   # @screendump:
>>   #
>> -# Write a PPM of the VGA screen to a file.
>> +# Capture the contents of a screen and write it to a file.
>>   #
>> -# @filename: the path of a new PPM file to store the image
>> +# @filename: the path of a new file to store the image
>>   #
>>   # @device: ID of the display device that should be dumped. If this parameter
>>   #          is missing, the primary display will be used. (Since 2.12)
>> @@ -171,6 +186,8 @@
>>   #        parameter is missing, head #0 will be used. Also note that the head
>>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>>   #
>> +# @format: image format for screendump is specified. (default: ppm) (Since 7.0)
> Likewise probably 7.1
>
>
> None the less,
>
>    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>
>
>
> With regards,
> Daniel


Thank you for your review! Will update the version and send it in the 
following patch

Regards,

Kshitij Suri


