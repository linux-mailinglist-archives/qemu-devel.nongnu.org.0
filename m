Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17F94FEF03
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 08:00:55 +0200 (CEST)
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neW3i-0002M5-Dg
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 02:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <divya.garg@nutanix.com>)
 id 1neW1X-0001Pr-2R
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 01:58:39 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:59008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <divya.garg@nutanix.com>)
 id 1neW1S-0002MJ-1m
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 01:58:37 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23D4ZYr5007100;
 Tue, 12 Apr 2022 22:58:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=ZlLHEOsUj844yZkXDlJjjCcL+u3MY+zQ2Ot42wmRoR4=;
 b=aWEEBP31UEdQpJjEKCM+masAwh1Xk9GOkH4yitfrbC/ADlTXcRjLtkb6Qf7aBJQK7R6K
 MD0QRPJ9N9t96JCB4SdVQjEQrp/2lUZZ6JLufaM6xFlAAN7CDeCGIUnikmU3UYIzyRmN
 13S59Bq7y30FS5OMyH6TIS8lz6X6OWbYFe0zzFSr/TSsLtUjuappmwVYxy1qj7T0JZet
 /XTvcfNC+uFhlHznMJe4Rn95RCBBedQbNXAxAoEgzhKNTLNHWoqBiczfurKU1KZem1Rw
 9h+mpcNaBgXQyMGvFCn42bxAsRRQml1ZxIe+6yb19h4OJxmpeN3cDMoA6jo3VnpM0D8n Dg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3fb88f86c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 22:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1rjyyoH4gobtCzMs+mPJGApjEkoSQtsrXF0Gp4NjB7Qact0PBaHKCw1G/mM9p0HlbaA5X623KmoAjTMAh/q7t0T01zJEWMgzOqTfq7Ngj3eyfvjNr6WGSaWlduIy6g5Ajr2YL3ZymdqRV8Dz4Fngr+klhx50AUziI3nYf/wrZdQlVU+WLzw8nYpzHCJYqHHLqcpG4YK6pN65mLawpTHUSWWJaxBfu3R83gnydDLs4yUcfCunXOTGs5wOmWCiZL3ncOAbONu9npXagxF6Y4gDiHGt/sShNuTfwJPnR8kYL9JLTTE854b3XtUTbuR+xA/L6q+HkeNQeME3eWTbylbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlLHEOsUj844yZkXDlJjjCcL+u3MY+zQ2Ot42wmRoR4=;
 b=CzGww3RSbJSVG+KmlJzmZfPoreIivuvk06OYpbXjbKlQaV4iKR+nxJU82RwxJpkt7fiNSQ1RwukQP7MfYeUFPXDfxq+XQDbtlRLm2EX6H3O4pqcbHWRuVNz8ZQavbX00xRH05av2d6t20hzrVva9F8QgIyLxt7E2q/WddFFCPan306CajBe1Aq/ZQsqom5gdnRIWMnirOa5W5rteL+gZHtTIGIU4q1vBzcY7Y6iFE1ArV6ki3FwyfDMQIr6xkzeLVpamX43crYNVabP2x3IaGfMWNIDcvpNBxhKZwVWfjv3svZ9gjazl3lj/2iVHRSAFgw2lHjsXCY6S0kTBhurXbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SJ0PR02MB7775.namprd02.prod.outlook.com (2603:10b6:a03:326::12)
 by BYAPR02MB4120.namprd02.prod.outlook.com (2603:10b6:a02:f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 05:58:25 +0000
Received: from SJ0PR02MB7775.namprd02.prod.outlook.com
 ([fe80::3dbb:6b0e:599:f05c]) by SJ0PR02MB7775.namprd02.prod.outlook.com
 ([fe80::3dbb:6b0e:599:f05c%7]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 05:58:25 +0000
Message-ID: <c2ff58e7-d8e7-454d-ab6e-1e87999ced64@nutanix.com>
Date: Wed, 13 Apr 2022 11:28:19 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [Qemu-devel] [PATCH 6/8] i386/kvm: hv-stimer requires hv-time and
 hv-synic
To: Vitaly Kuznetsov <vkuznets@redhat.com>
References: <2dde6caa-8d02-7022-d2c2-aa56c408f5f2@nutanix.com>
 <87tuay5uy3.fsf@redhat.com>
 <c9822d09-9c64-fddf-671b-389e21022e8d@nutanix.com>
 <87r1625o3a.fsf@redhat.com>
From: Divya Garg <divya.garg@nutanix.com>
In-Reply-To: <87r1625o3a.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To SJ0PR02MB7775.namprd02.prod.outlook.com
 (2603:10b6:a03:326::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2325f77-3050-4610-76f8-08da1d129f84
X-MS-TrafficTypeDiagnostic: BYAPR02MB4120:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB4120B617ED8CCE69C150CD3F9AEC9@BYAPR02MB4120.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HehgX+vAwN06STDaEMHzmxpHvXIYSmbdAxnjVEeuMq2GQL9UcHGbk2QqCq28YrrMkcZUBUmbN0b3+9KrW9W+txdjMs8P2XmWxTeLeEoDdtQPDoVwPVvDwUq8GOPX4X5iOgdMv1AIc8egbdfrSAT7D1WBrQPWKMeDEkrmxHfSWApNjF+dRhF6337gMY2rwWcEcHHsLvKRLNpQe2b6x4njqkHghmUiRoypJv12XcP1x1msIyTSuRKqkhbLeXT5NdGV9G1dddNitNI89tZzqQOZh1vNCXkFYEkWX3Q2L2FSSO5s/ZOc+LX20dOXL7zlcBheF9rS4YCfBvptyZDTSxFbBVhDFLHQm5iG7aUew543eR3v9sFBxwbURbM9Ki7/4o7LEiaRMd4nx1vVPRE0hU3eLYOmme69aIN5DwGTvT/jkqOx6xZq/l0FCL0DQuHrAdM925tRiUcwKhyedzYO5Yq5KHNFcoauYK+jv/BS4m3j0Fe8EmnEp35jOlqd9S5IBGSW48g2vhHFLt5N3QGa2EcMDvjtX/q7B94RvQS+cHUOnf9MKhqMOy7fB6Q+hwyGy7u/2fiZAkmhHvXogXN6W/fdf/AXvNhAM6E6aDwMbgGAXtK0xg33V8rwEb+vjA5hulCBZ2xP6FhyJSnhMqQ3P6tRUVb/dskCfDQfA+rdP6N/ySHLAArvRk/P3zHMxt26fBV7HqdmybPJbnOBwyBg3QZqTfqUh9tMFnQ9V2bql0SFHr05KzgWjxdF2vZnqlgRwfz4Ofl+vIX5zOBipRuvGYuwnlGI6n1p86Rbi+W/bHKcBwCVnSRUQMuho6ClRu2X++62KzIxrSDCc5hd/95YHUrc7dBhQlsgDUzBxB5VmnL/VKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7775.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(31696002)(8936002)(2616005)(6916009)(4326008)(8676002)(5660300002)(26005)(186003)(2906002)(36756003)(31686004)(83380400001)(508600001)(66946007)(86362001)(44832011)(316002)(66556008)(66476007)(6506007)(53546011)(6512007)(6666004)(52116002)(38350700002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXY4SUoxN3dtUy9LOXB5WEFrb3IxZnVMbWZoZ25mTzlDSDFQclBQU0x5dWl1?=
 =?utf-8?B?VGU4SmNDbUg1MkNPd1hDdEJ5cUNHWDYzQjR0RTlKZzRCa3dKK2R2bkdRMlJI?=
 =?utf-8?B?bnF5V0RoaGJvcUJCbis3a2Q5Zys4WjF4RFFrSHdiM0dBYUxpelh1L0c0dksz?=
 =?utf-8?B?YXpsRjdCcDFhK2Z4WUZTSWJHaVlueEQyTW5uUEswNVo2dUdhbnVaNjZSYkFw?=
 =?utf-8?B?ZU40RytQTHgxS0tqZUx4MCtubnZwNS9KSjZPVFZxQVBLdVp3anFyNjVyVkFl?=
 =?utf-8?B?aStRc1BVK2p4TVdNT3VlTWZoZmdOWXVvVEcyQURaMU9TcTN5cnRad1VRcnZU?=
 =?utf-8?B?UmtTaU41NGN0NTFWWXJOTEJ5dkliQ2VFMVgxeXRJNmEzUmp6a0ZMWEFsV2g3?=
 =?utf-8?B?dWQ5RXhLV3NpZlVsMmxMYVVCN3BmTUR4YnZMQVlPZGVvUWx3NGlZVlVjY1lU?=
 =?utf-8?B?ZUU5ZDIzSllsVGlSY0lHaDZyVDRxYXY5c3RTYVU1Wi85NGRFZ0VQTzVua3Zj?=
 =?utf-8?B?TEQ3M2thUVloM2ZTYWVzV0FwZjN0SElValVKdmxzZGh1eU9IR2twUm5XSVl5?=
 =?utf-8?B?WnNKVG13UUZ1NGdIV2hjSDZVd2VYOUxHT2IyUTNMYU9TQUUxemI5TkZZV3gv?=
 =?utf-8?B?WnFBeDd1cU13SkFCcVJXV1N4RUJEUHdmdmx2Z3c4MmFSUThDL2pFNFFDc0Zr?=
 =?utf-8?B?bG05WCtqR3pvaHBOa0U3S2JwZXVVdE9sN3oxajExL3hwNWpZY0JvZjFkZnZW?=
 =?utf-8?B?bjREK1VQN0JiNUUraE11Mmc4dStvTEdoVjkxWG1PeHhSc25LR0hSRHQ0K3Q2?=
 =?utf-8?B?YUFkcDJudUp0WW40dFAyaVF6MlFxekVPNHNoeUtBZ24rWWpPbnYrSEdYTkFK?=
 =?utf-8?B?M3dSSk5JV05xTG41bnZZL0ZIZnhHUmVtS2lFbDFyVTRacjA3MzlGSWhWTHJT?=
 =?utf-8?B?a1RHblNGK1FXTitFRG1NbjhON2JMclJMdHZFVEM4R0tJdjNER1VEZWFncWJt?=
 =?utf-8?B?ZHVyVjNsUFB3a3Z1L2FNWjgxU2k0dVV6UHQwMXpGenh4aFVpNklPQlF3eS9O?=
 =?utf-8?B?VHpwWEtSVmZiTFlwOG5NcDN0b0pDeURiSTh2ZjEyTkFhSmZjb0Nmc0NwbG5C?=
 =?utf-8?B?RVNXWFl6QWtERU9FRnlTTU9KNXNPTGJsZzVUbll5cEJGUFZDWGoycW9VL0tm?=
 =?utf-8?B?VWRhOUxqK28zZysrLzNlSEhoV0hvSHg3NS9xeGo4aU1WWFc0UUNYOElpbS96?=
 =?utf-8?B?aE5MVU1idGd3SkxXdUIrQ1kveWdNL0k1b2lYaWZrN3gzN0pjaTkyUWN1d1dp?=
 =?utf-8?B?NXRGYTVFNk5ZR1hpM2pYa21hd1htZSsvYW9XaVpiVFoway9iRVh4NS84eGJl?=
 =?utf-8?B?VHVwdXA5MHo2ZEZBWi9YRW9jOXRQTDdwL1BEaUhrd3RES2M3cDAzQ1lTUk9I?=
 =?utf-8?B?Mmg4Y1AzWkdBR2RXSDNIYjUrd0dXc0RXU3hhdG8xNHJIWWxlQjQ3cTh0RHRx?=
 =?utf-8?B?dysyRUQ3YjkxbjNGUkw4SU9vS0pHZDVqazd2Umw3QXhiWTRJb2IyZElRZTVO?=
 =?utf-8?B?c0s4WllTczhYZ1dqK205MXdaT3NuaEROMjcwdzZyazh2NnJVcWk1dTlZQ1pE?=
 =?utf-8?B?Yk5KTXVDdVdQQ3NBWEV5S08xSGt1cVlsbVZIeEQ2MWY4dTloNGR6c3pLd3F3?=
 =?utf-8?B?VEk5UE9nL21OOUJMc3dsOERySlh4NzA2TjQ3UjBZazVpbFBZSjhkVWw3Ujhh?=
 =?utf-8?B?dHc3bEJjemR1SlB6NVFic0s4RGdwZjBKeDlWOVd2SFdTd3FDT2RBY1YyZjB5?=
 =?utf-8?B?WjdCdWVUS3hKd3MvSFVGSVpmM2RnblBiUlRod0lWZFFYMi9JZmE0SE9nZUFv?=
 =?utf-8?B?d1IwTWV0RlV2ZU5aVFl2NHhlN1lpMXNuRXlJS2IzUU8rS2J1b0RmRVhscXZF?=
 =?utf-8?B?T1hDMWhmbGFhSkpldjg5WExKQzlzZkdtRUJUdy9Qa2ZxSGZEVjJtUTY5V3Yr?=
 =?utf-8?B?S1VZRjRCb3BFbUVmZUJob08wK0R4VUFyRmRrM05LQmZUWWpDS3FubzI0N2cw?=
 =?utf-8?B?M3IxVUdweGxrMzN2RStvckJVTGZwZittY1hKcUhEVmJyd3ZEMlp6SGRsVkIz?=
 =?utf-8?B?TUowM0h3WTRmZlM3RmwvejVMVGt2SElkbUVHMnNXQnNsd1N4eFRuZHRCS1Bo?=
 =?utf-8?B?ZG1WR0RoVHhyUmJGRmMyOEQrSHZRVWFuUm8wY0dIODFNV0IxVmUxMXllcmxT?=
 =?utf-8?B?MG1LUjMzSkdMVzcwTVhsQjVyUTRuVFh3OGZjeFgxQk0rdERzWTVzSXR1NWUr?=
 =?utf-8?B?QzErQ0FvaVZuaS9OeklCLytHR0poU1hFUlN5azloMm1DdTFFNWxFZm9kTzFu?=
 =?utf-8?Q?V1oO8EmdGi3hsVLU=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2325f77-3050-4610-76f8-08da1d129f84
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7775.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 05:58:25.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coAGIsv0Z8gOwEChkQM5N6piVpavyFfFpVV8n7JS22mK38dnGbY8e7/ybFPQm6kOXIoUAvt4OmpO68LEZ9gDLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4120
X-Proofpoint-ORIG-GUID: EN3kkwyJz1ESFAJc76lU7kGTnGX5z1mq
X-Proofpoint-GUID: EN3kkwyJz1ESFAJc76lU7kGTnGX5z1mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=divya.garg@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/04/22 8:46 pm, Vitaly Kuznetsov wrote:
> Divya Garg <divya.garg@nutanix.com> writes:
>
>> On 12/04/22 6:18 pm, Vitaly Kuznetsov wrote:
>>> Divya Garg <divya.garg@nutanix.com> writes:
>>>
>>>> Hi Vitaly Kuznetsov !
>>>> I was working on hyperv flags and saw that we introduced new
>>>> dependencies some
>>>> time back
>>>> (https://urldefense.proofpoint.com/v2/url?u=https-3A__sourcegraph.com_github.com_qemu_qemu_-2D_commit_c686193072a47032d83cb4e131dc49ae30f9e5d7-3Fvisible-3D1&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=2QGHz-fTCVWImEBKe1ZcSe5t6UfasnhvdzD5DcixwOE&m=ln-t0rKlkFkOEKe97jJTLi2BoKK5E9lLMPHjPihl4kpdbvBStPeD0Ku9wTed7GPf&s=AtipQDs1Mi-0FQtb1AyvBpR34bpjp64troGF_nr_08E&e= ).
>>>> After these changes, if we try to live migrate a vm from older qemu to newer
>>>> one having these changes, it fails showing dependency issue.
>>>>
>>>> I was wondering if this is the expected behaviour or if there is any work
>>>> around for handing it ? Or something needs to be done to ensure backward
>>>> compatibility ?
>>> Hi Divya,
>>>
>>> configurations with 'hv-stimer' and without 'hv-synic'/'hv-time' were
>>> always incorrect as Windows can't use the feature, that's why the
>>> dependencies were added. It is true that it doesn't seem to be possible
>>> to forward-migrate such VMs to newer QEMU versions. We could've tied
>>> these new dependencies to newer machine types I guess (so old machine
>>> types would not fail to start) but we didn't do that back in 4.1 and
>>> it's been awhile since... Not sure whether it would make much sense to
>>> introduce something for pre-4.1 machine types now.
>>>
>>> Out of curiosity, why do such "incorrect" configurations exist? Can you
>>> just update them to include missing flags on older QEMU so they migrate
>>> to newer ones without issues?
>>>
>> Hi Vitaly !
>>
>> Thanks for the response. I understand that these were incorrect
>> configurations
>> and should be corrected. Only issue is, we want to avoid power cycling those
>> VMs. But yeah I think, since the configurations were wrong we should
>> update and
>> power cycle the VM.  Just for understanding purpose, is it possible to
>> disable
>> the feature by throwing out some warning message and update libvirt to
>> metigate
>> this change and handle live migration ?
>>
> I'm not exactly sure about libvirt, I was under the impression it makes
> sure that QEMU command line is the same on the destination and on the
> source. If there's a way to add something, I'd suggest you add the
> missing features (hv-time, hv-synic) on the destination rather than
> remove 'hv-stimer' as it is probably safer.
Yes libvirt makes sure that the configurations remains constant on 
source and
destination. And true that adding new features is a safer route.
>
>> Or maybe update libvirt to not to ask for this feature from qemu during live
>> migration and handle different configuration on source and destination
>> host ?
> You can also modify QEMU locally and throw away these dependencies,
> it'll allow these configurations again but generally speaking checking
> that the set of hyper-v features is exactly the same on the source and
> destination is the right thing to do: there are no guarantees that guest
> OS (Windows) will keep behaving sane when the corresponding CPUIDs
> change while it's running, all sorts of things are possible I believe.
True that. Its really difficult to predict the change in behaviour of 
guest on
changing CPUIDs especially disabling a bit. I agree best solution will be to
power cycle the VMs and update the correct CPUIDs maintaining correct
dependency. Thankyou for clearing out the doubts and helping in a better
understanding.

Regards
Divya

