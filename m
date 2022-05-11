Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D73522E49
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 10:24:43 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noheE-00020a-69
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 04:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nohcK-0001BS-BF
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:22:45 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:54386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nohbp-0007fp-Tt
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:22:43 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B5KD7D013934;
 Wed, 11 May 2022 01:22:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=le2PJ1G76SyAGckVJUwTjLmj3b4kRYzB8tSVL6HHTF4=;
 b=H/HxtM3ZXny8eFlpvZIGM18qGX1QYHEPpKVMjUeOrUS2IixmXuH3eW326alsma4YjuSf
 YX+9Nyw89mGu6RP4GOAW+wHWFZ+mdoa1d+O8H8WL4FG3hmsO1fTkYgkrO1ByvU/bsQXA
 xDarFJxLZM8UbOPIqvZa56A+GhXahU7d6jjWcCNVzTTNjWzgGhia9PZFWZ2Qg8QnF5bh
 UGKmqb4U+mN/zwfiWJ7C/vVqoZ/Z7BaC9okaSNDbxOOj/Lx+JbNGKWPQhTf/b9OkgCH1
 HQaLwBTaP/u8RKLcnVaPSz+L/1chX1mk1YCy+snrNWijgjuqp4muhlboim97J3HE4B4V 3g== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3fwrdp7tbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 01:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9I/tHW6Df8D/wxnotkMxDQd6Zq8u8RRQV+x+b/owePei5de9Hhb/0AR4IcfKf8HQND8Yu2VB+1p/g03snvHcM3HVzlB/1rNk6q8sBgL0vyBA21rU5Yp/0MkSvqiq90fErfwP4JgKzBryHsePMBV0kmJQ4EACsM33Ssv2x7Tvh3O8CMdsEULdix9uot/knxFCDYJAXBmh89LiKt89+xz30/0x13nqv2Z76ZHOiSwz6JcPQKvAvDELyhvokVz6EqOXOXw37FaouyTSdiN9VqcMUv847C60itfMVWjJO+2PZxxjGJB0uNwQKc5e7kOLDKXokEnOyYWuXuAM+GyJgv/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=le2PJ1G76SyAGckVJUwTjLmj3b4kRYzB8tSVL6HHTF4=;
 b=XwDtJQLSzAzAQ1ztdBLgwg1h9q01gec8ARTbESj3CHkLi17t76tuwC5ch4hQZ2nwckxb+szTiPayhcgl7a7a/x2JWNxYNoFmhegvo9cJ/1H43DvTgLR5odum2lONXMN5rvurgc/sFHf50hjjyeD3F0F4mfOejWSs9KDBx8KLFZ80w9hkrpPS6QF91nZLQNc+qrAUGU5oVwWns70iDDagEtPKDWU8xVwRobJYwy7Co8ZrtG55bYGLesrUlo6gO2SXmQ33e04tiqLlowmxw/aNqmFNTupeYN6P1QjDWED2emraBMlDERxP9YSMdtUW4lwgXth+T7RkJICMxTMyicP11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM6PR02MB4235.namprd02.prod.outlook.com (2603:10b6:5:a0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 08:22:08 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::852a:4c2d:6243:8c37]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::852a:4c2d:6243:8c37%4]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 08:22:08 +0000
Message-ID: <758a0df2-c8a5-a114-d1cd-0fc932c9ee97@nutanix.com>
Date: Wed, 11 May 2022 13:51:55 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v1] Make png parameter to ui/meson.build independent of vnc
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, dgilbert@redhat.com,
 armbru@redhat.com, kraxel@redhat.com, thuth@redhat.com,
 prerna.saxena@nutanix.com, soham.ghosh@nutanix.com,
 prachatos.mitra@nutanix.com, berrange@redhat.com,
 philippe.mathieu.daude@gmail.com, peter.maydell@linaro.org
References: <20220511074626.165398-1-pbonzini@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <20220511074626.165398-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 190ccd77-36fc-47d3-08ea-08da33275696
X-MS-TrafficTypeDiagnostic: DM6PR02MB4235:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4235DB010F8183E88EBF907499C89@DM6PR02MB4235.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9BwJTAiJc+ysyreUktcvGSjzdMUVCIqQBY440yaTi2FmgLNrTG2zdcxQjwuFd/UIoFWvBYGyhEl+Zbx4/yZ5DFyEi3paW8ZwIC6Zm30Irk2LDbauirQa3nwNz3Y/NZVq7+vpWOKGrcB3fDEGNEy5j3x4KSH16cUltsaAXKKAyQ+AHBwb7MNdXVKRy0xhN8CzoiyPDARZNT7S5DMDK3m3LAHAO6udCuK8nwwXrj5yCDg/9adlt7zFEhd/LuxcOq6vfRdj331G6zoJrc6vvaY7INCcIXLPqt3x8LyuoiHp2M7FzFaXhMK5TzTRH6slrMR3FpHIN+bsJa+60nxo2CrRuykb+c7fDs2cdbOkl++i5yE7JH/oXBoR2r0s6vKQIZvx2CtGJNDfvAYiWF+TkTViluMz7LW5loTjpCqnT0UO7tM9rTTmr1x1g5VRcwS7pPjrC8sFGWwkHKM4+Ugeru0h1IV40Kt9SDjUR+ETnyKyfO8NBUBsiNSIm+N0m/ebYXehA5sALtOJ++LqmGR2v0wvcTP+BpVatwcb+yOyMEsTrlQc7yOsXUQYgDGGG8wk7QkGFyAgG+CO7lG0coQUoJnvahvEkTr+d3M1OxQlT2B+S8gkyIjkg7PyeIyVzq8LaLe75ou9o3X0lAJlU1qq6ENRDibxgWcdwl+SAB9jYorZaeFA2enn9oXgDgF+mzPS58YzO7iKt2hW/CSCRNWcniPwGkxIbSZe6m604Rh9D/76EpkFsGjLB6CmRBO3JD4NF8TKsJxfbpAK8ATPHeJRNH+uDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(6666004)(6916009)(2906002)(44832011)(316002)(31686004)(8676002)(36756003)(66556008)(66476007)(4326008)(66946007)(38100700002)(8936002)(7416002)(508600001)(5660300002)(6486002)(6512007)(558084003)(53546011)(26005)(6506007)(52116002)(31696002)(2616005)(86362001)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkQ0STNrcXplcFg5RXc3T0VIWWdVU0FGWitmQ3BSUVNwVFZvSnNtb1RCR095?=
 =?utf-8?B?NytubTJsd01hNlppVENKZmhXTE9JKytMeWE4eXJBcXpHMFNySG9UdHZrYzF3?=
 =?utf-8?B?VmttRWxLZlRiNlBqTmtaNWU1QWVjNWg0b2MvOG9JbGF6TE0vU2t1amh3bk5S?=
 =?utf-8?B?T3FRQyt3VTcrZktIWmplSnZiaVN4ZkNwN2VLVmI3NEZjNHNFVUkyY1ZPdjlL?=
 =?utf-8?B?dG1mbDV3UzJNa29zMUdTMW4wR2w4RERhZEtaRElHaXB3aHVIZHdXTkFkdlpm?=
 =?utf-8?B?aUpwSGxVM2RYUUlSRFFCdXl4MHRLMDJ6OEdJTUNROXFpTjUvbXBseWxtcHgv?=
 =?utf-8?B?ZWNkTEtsL3oxdnVIbVlobXRLaTFzcS8veTZVU3ZFMTQ2Y25UZ0JDRm5YUUtJ?=
 =?utf-8?B?c3l0MjVFRlMxaDQ3ejA2bExyRHJWUld5UzZ0c1p0dXdxSDUwUDNkQ2RyRXE5?=
 =?utf-8?B?QVpHV1lZSDRRN0VPS3pLSEpPZndPeGJsZXk3cE1CMnpWcnU1Smh6VXBSK1Ux?=
 =?utf-8?B?Y0NkaTdEVTRPQzVYVTdrZFdsTUdIY1pTNzdnM2R5bXZwRlI1QW1FQm1LNDhl?=
 =?utf-8?B?bFJVVEVLOFVGWlpaUjgxZjVTeENHMUtNY0pzd0dHWDFpU0N6YW8vQjY4dkN6?=
 =?utf-8?B?SlBmei9HZTdnMU9SWVlQSXNoNnhqaTZ3bGZBTzZEQzVQN0RLQ21EdEx0NWY2?=
 =?utf-8?B?TnNpVlRJUTJJY2ZYRWs0d3BXWDJka2s2Nit2b1IvdlRlMWt5YUZsbnJSMFJr?=
 =?utf-8?B?Y2NzVVB5QUowMnlWbWRXK1ZKWkpKWWpKbkpDdHp4clJxZ3JoSi8ySkVRNkw1?=
 =?utf-8?B?ZjcyRWN5VE5XOWFXc2RyL3E1emFBZmZtYXVLSi9QY200S3psOHEzRit6NlRr?=
 =?utf-8?B?clBhbVlHbUNFR2lLdkRXa09lRFVuS2hxbnRCZzJiUDJEUWF4ZG5FSk1RUDRH?=
 =?utf-8?B?dmFMUEplTjBOYnZuVGpiaEJWNjlNYlBUZ2VOVjhDanovTllxbmkvUjh5NXl5?=
 =?utf-8?B?OHdkTGV5Z3pJdXlwTEd1bTZkSnhZaEdVWFY4d2xxWDA2a2huRStTOEc4UWVM?=
 =?utf-8?B?alRXWDhHSDRIQWh5WGNWc3hoU05vb2Q3cnUwWmdXNUJiR1pHUUl2NUljSXBz?=
 =?utf-8?B?dlNLYTlXcXNaTEhIYjUxcG1aQnVIeDhwUVdnMHUrNUF5YUFzVGJ2MDlaa21n?=
 =?utf-8?B?RStUQS9rMm5IS01mWTExN0haU3l5RVYvNE1tbUV2bThNVlJWL3did2Zsejd6?=
 =?utf-8?B?L0NXbzlmRFR4d25tM1hFOTJ5WkRkVFVXVHYzc0FzT2k4Q3UwTjIrTWU0ZXJD?=
 =?utf-8?B?cnIzeEtzZXAxZWRyMWQ2SURIMHlNQlp3OHhpR1N3RVJSajFvV0g0enZVbStG?=
 =?utf-8?B?TitVK3BadkxwY293alhQOG5Wa2wyd1lhUThiWmo0N1dNeEpReWQ4UVNGT081?=
 =?utf-8?B?dWpWWkhmbnJmNm1rSUNPbWhBWHc4bW1GS3YvV1czU1JkUUtzdmtrVzB6amU2?=
 =?utf-8?B?UTVWcGxKbXJ3VkVBUWoyS3ZHTVNTZHE1MTBDems2amEzV2lBU1haUDNZYUov?=
 =?utf-8?B?SGxtOVVyWWhoZUdZOHVWZEUwQTUrUjJFMWlncEFIMExCN2RqMWZqa2M1THBL?=
 =?utf-8?B?eFpHTGxpWk5SVHdGMnRVU21hWE95SURwT09ia1V5V2hhdjg3VUNwRHdhRGdF?=
 =?utf-8?B?cW1WdXNXYlQvK25NbmRXeEFLQ0VyUGU4d2ZPSFUzRnZwS1JuM2xhMFZhb0Rj?=
 =?utf-8?B?YnVGWFJPZzB1TzFZQnZoTkNmQXQ3SG5DTWRJSmQ2UHpuNzlqWi9wOW1tUjNT?=
 =?utf-8?B?ZktKOXd0c2JValBLRXZvcDN2UnZZaStwc1FKUWNEZEhXZVR1VkpGTzdyMFNi?=
 =?utf-8?B?ZHBBV0pxOTB2THg5NmVjTk1lVHNZdTBrZUlMb2VHREhkRklnNnhvODUyaHBt?=
 =?utf-8?B?ZVhDem1rV0RtWndRYm1GeDJrcDhpa0JmeHIxTVl5enVtMkhubWdHRzZaZmZO?=
 =?utf-8?B?ekZBNmdPS2RhUnNvNk5pVWNyODIybWVIdXZFTFY2WHptZS8vMXd3SUh3Rktt?=
 =?utf-8?B?dUkrN3Zteis0RUVhNlJTUDZ2QjV4UGJ2NG1qejdzK0xVNW8vckJrbldEbG5P?=
 =?utf-8?B?ODk1MWRSVnhFR2NSTmpGQTltazdSbVhWbUcyU0RuclNnN2toQ0ZhdVRTUndk?=
 =?utf-8?B?Z2dmcm1VSXJJbEVxdWR6ZVEzUmd5OW5Mc0theGFBNklaWk5rSDBPR0hVTmdE?=
 =?utf-8?B?MHd3Myt2TTB5a08xelAwWWVib0RhZW5JTmRFNjhIaTNwL0lmYzFva3BBVDFi?=
 =?utf-8?B?TXB3UHV0Wjk0STZjdmNVYTVzUzhuNjR5NU5FeVVZazdqcnlsMkI5WkVjWUg1?=
 =?utf-8?Q?fA4YzRAc92bYhjMc=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190ccd77-36fc-47d3-08ea-08da33275696
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 08:22:08.0604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TczNCMoEdTjDnO++EMk73Z70AgtEYuBvGGpFocNSv1VXDqHJVoqkeDAVGlMWWHfL6FWMqNJhEkUSLNqgCpcS6whVmWPvg0bGaymr+fDIQQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4235
X-Proofpoint-GUID: jTJdrKfB0bv0BwqBMEOSyugiTQHylpAX
X-Proofpoint-ORIG-GUID: jTJdrKfB0bv0BwqBMEOSyugiTQHylpAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_02,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Thank you! Grateful for it.

Regards,

Kshitij Suri

On 11/05/22 1:16 pm, Paolo Bonzini wrote:
>> +if png.found()
>> +  softmmu_ss.add(png)
>> +endif
> Queued, thanks.  However, this can be just "softmmu_ss.add(png) without
> the if, so I adjusted that.
>
> Paolo
>

