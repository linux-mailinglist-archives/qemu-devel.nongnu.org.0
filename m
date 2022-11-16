Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD862BC3C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 12:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovGn6-0005Q0-7t; Wed, 16 Nov 2022 06:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ovGn0-0005Pf-Tf
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:41:11 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ovGmw-0003Ur-LK
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:41:09 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AG6peO4021925; Wed, 16 Nov 2022 03:41:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=q98LjVGmBTVCF+C6NaeN4YVpE/KNFTjIc5oZ1AsXSXM=;
 b=KdDGBFE0w17dd4stYAlVDPslt7eLuHDJSfm4KrE2k/iWbConvGfonOIUXFwSTuwr+3Ox
 0FjwFQTI203m8TPZDbDOT4BLw8cnWbTtOE2NJWZhGtrZ/DX3P9lCx3bAHwdTWD3VVLOW
 8vPJoNx30Z1XHzJLoBXeOyHqrqgaWexFrpvunM5XUazeSqDuSUoOHcVstgEdD0F9QamK
 qcu4zZFShkLfgfYKa5JvS6EEzs6cgClNCT8VL5doeEnYLM6frGcUx6NPzyvDEvWLEDI1
 qFytTzb3EB/Ph2lX97qdMmcMULa2Eipgk7ldEqhiRpy0fOnQ8JjESJRAqrkAkcTLYbM6 /A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kuy8v41ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 03:41:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwGlEtvpTJipegUcSlZL5ezuCcJqrVDtrpTNIy6POyPu6v7CiyqFk571iNHtKO5W7tgPS+hRfTYPhfLnpVeR49LlG4lZbuwLWTg37ST5Kw+nneZNeepqLPEoKOR4bwoydNTOggRZHx7J1YY3//hdnSf+eqQtW+XLohrEwKFm8qXtz1nxX8UMs9qjxjJzvS8mGi+COcQ5DLPgbDV9qYmE4xMIc3dzdomdss35ytn7pg1fyQpDBh02rJA5PaLCCdXzwJclKUUY7/EASM77pnKk+KYjIRSe1qwIjHnH0e3hI7jkCQfe2tGh4pLHPgl2/IboC02OHHqWZaz0dpusv514cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q98LjVGmBTVCF+C6NaeN4YVpE/KNFTjIc5oZ1AsXSXM=;
 b=a5JYf7K1CUokr/ZOIXGVgJkGYjL0fB7NOPSUh45X+7hZP/d6dDBYVcUi9qsfhtg45ZrRsHTj51g+YLu9gPQhbljWyIGhkPCGSWU5MS2KeMdMI//s/ePe/uEyRlHyEP5qLRKV4wCtXYANuEURJA/n+rklYVFPCFGceb6w5KXondLDtG/SXG42BZukLVPUAoWeYNsHktAS5Nqb2lqid831aYISgGoYg57N/FrM0kit+PuLttt7lnq/LG0GH5VOwsC/YEaOt86KyXAw+jOg9QABZXh4Z9+y7QCQ3gdsBNDFcvaSxVVl7mh39ro2MgVb+zNjC1LPWpi8jVNqkVeZdJRk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q98LjVGmBTVCF+C6NaeN4YVpE/KNFTjIc5oZ1AsXSXM=;
 b=sK0rAE4EzZtCbNGtdX7TkFa4bsuZi5OI11/mr/Ek6JcdGnhiMfKJCFpbxYn5HhlDYsc1riOtg0QY01yvkzRxNh6plQQLHJ6BwzAlq5Pdy7naySEjk2NNMP78LmNJu1E8FbfKK62Wz2XFBeLp0Cexg8KmWze6xoc3kWXA6QjAvzRQx2qWfpMIfvjEfRtuSyOUR2Y2EEvyX+A8fI/OXFwugjFnshB2948ceIqNi2+SxxVuFcser3iG92YglHMKiC/yDpkiFg/QEGfkcRCYVeIsxlIY6toxHptnhu6ynOEaOzTf7B3b1q+VxLDzdtdGin9JIKI6Lf2cxnREMFTqiT01Eg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CH2PR02MB6616.namprd02.prod.outlook.com (2603:10b6:610:7e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 11:40:59 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 11:40:59 +0000
Message-ID: <182aea08-69ca-d89a-ee9b-d71599fba8c6@nutanix.com>
Date: Wed, 16 Nov 2022 17:10:49 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
 <Y3PWUoHxcswxTrF8@redhat.com> <Y3Pffa0WD+xgFPCI@redhat.com>
 <7a01e23c-3148-4a7d-4fa8-85ca9c0be6d3@nutanix.com>
 <Y3TJNBBCMD4lHMqa@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3TJNBBCMD4lHMqa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CH2PR02MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdc10b1-000d-4da6-f6c5-08dac7c76e8f
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xENhhgC2LdvWsKLCmWdxgQJoElNsCAb6qLHlXddWyiDsNxIkaozbkK+680FAmb2af3iGhcR0vTUZK3bT3UWN0DZjUVl+sS13LDgoDOTKZ+mUqSWsPAW8RYm7brGnSnR9XZDfLozQx/snBViUnEAKNzlYyQQs/Jj+V58XQS1Q/+/yJQ4tKvuvLcX75BWBWg1xArkExhCvavXU+kA9uWl13y4fIPgTTBKxvI+XafnMvPbWpRNVx2e1vBVBrK+42nYFV6jzTat2BZQsFm1W6bJlRvUkdgxMr4mFTczWAY1ep/w0hnXtzzjK26VhPw6REFC8gRK6ZTJH8es2ljHCbB25Kwy4rzg1SZc9vKx29nLF1Fww0guhib9OvjtXheJoXB7emGqP/KO5e5wFGyPjmRe5m1s2Vvm3sYAfJ7XlAopsWstwnIc4CWDMkT5jXg0jvr2inqzE05YKMU9UZxibIHz2BVZkrsS0ZMLf0c+ilYzc5IXqyHz/wcnjCH9FqJZLlpPA7M/XyJYRZKVyyxcuXVrr7/DjZljy4MNMQV1trhPx2EZfMrNZoaV2Aj53+q9z/Z1gs5gkhZl8Z6BA+JjjVzFOAerxlHcU2nWkQvNpU/vS46fN1Ajpu6eEGTxPY8g/j5VYyy0fuUgUJz0dmCbc7t+0QXADfZUAkJNlmiQdchmOgV6kRMRXy6xx6P71eZF3f1/2WqgUG7WqxsgFb3Yrv+6/+Oyw3QWKu7/Mh9pvyb24fUYRjs+MwnrSBcnz/v4sRD6YDimXyBru73oPKF1VD/M/iMPn6Sw9Fg7py9IxgC/Bcrs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(38100700002)(31696002)(86362001)(6506007)(6486002)(6666004)(478600001)(5660300002)(8936002)(66476007)(316002)(66946007)(4326008)(8676002)(66556008)(41300700001)(6916009)(2616005)(83380400001)(186003)(53546011)(2906002)(6512007)(26005)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTYrTVFaZ3dGYXdlNWlXbU53VEJuZFZ1b2RhaS9zbFpwYUw0M2dsbHE4K2wx?=
 =?utf-8?B?a09MTFJFYzF2RnNycGJxOW1LclN5cTd2SDA0M3phN0JUbVE0SHJNSlJxUUlt?=
 =?utf-8?B?M2pMdHk0VkI0MlpPRTNobG9yRHdkclRFbXZ6L1VHbCt3d0dNaUxlS09uVVhJ?=
 =?utf-8?B?cmtCWVk3bW5ZQi9mY2syQnNTTlN5YWVNSDFMQTRRRWlRUWEwS1EwenlPSnlF?=
 =?utf-8?B?OXVNYmN3Q3NPTUFoY2xPS0pGdms5RUJuc3FncXh3Rk1uUVRPVXQyMG1tclcz?=
 =?utf-8?B?S1VKcysycmtTMkxRVS9COTg3N0pVR2M5WXJjRTdMbnd3U2tpN084QUllYXBp?=
 =?utf-8?B?cm4vOWVEVWxIdEtKRFBIa2J6TGkzZHRrNzIzRktsc0ZITnh6TWwzekJCRTZW?=
 =?utf-8?B?MU9XdGtUM0VGKzFXMUt5L0pyTVBjTFZ1di9HVHZXRFpYQTVGMkFNWnJQOWNk?=
 =?utf-8?B?dXNnOUs1ak9MMU0vYlFBczVoNFpIVUJDSUloQ3pIYUJYSEdueU82TFBsdVM5?=
 =?utf-8?B?TDY4MGxqODZCRlN6enI4dk9mWDEzK0xLV1hTYlk2UG1RSnlNWmdVVnZZOUJh?=
 =?utf-8?B?NjI1V0NoY3BKbitvMXZyR0ZsN0dldjdVdDNYd2Q2aGNTd0loTXU5QXVJNW51?=
 =?utf-8?B?YytNTVV0eUFNM0F0dHQwZ1pKUGN6V3E3ZEpnSjhNWFpRSXJsRDVzeDVmOGNq?=
 =?utf-8?B?YjBpSklSUWJZdWxrMk9WZlBBK0w2dkdhZzZFUEt6MFJEeHIyc3l3dGlvMzhm?=
 =?utf-8?B?RVFpVVlaaHk4TlJicUo2ZUM1UllHZm5nMUlWQ0dpN0hVNXN3T3JaQkI4UWFC?=
 =?utf-8?B?SlVQb3J4MGgvS1Nab0RkaUd1enA5MGZLVGFBZEpoTTdTWmJGSUp6RGtUSjUy?=
 =?utf-8?B?UEl6ZElTK0JtUjFiMTYyWkpPellLRVo3dVFFRXNaNUUvUlpWb0IrV2hKL3M1?=
 =?utf-8?B?TjBYYjRRcnhUeVZETWFmdE9yUVBrdHdtRmRpVXI2bnVwQWdMSWh5bFFtWDF0?=
 =?utf-8?B?VG1EMjNnL29zVWdub1BLMUZHK0t3cFMxM0h4ZDZmUlhSQ1RMdXNneTA1RURj?=
 =?utf-8?B?ei9oakc1Ums5NVNPdjRKNURibzdINmZYOVJNVm1aQ2F5SXJld2k1TTcyYkJO?=
 =?utf-8?B?SWIxTktUL1hHd0tzeTE2Qi85N0YyYUZNNW5pWllaTE5KMFZZUjI5VzdZei9I?=
 =?utf-8?B?MkVRNmt2bUFWdDY4VEJyWjQxKzUzODNxcm9GRlFXUnI1U3o2RDdYZUVLelYr?=
 =?utf-8?B?MklNcXk2SEI2NU11Wi9zUkVQdWUwMkU1ZzFDOGZSU1V2RVM2R1BhUjU5dW4w?=
 =?utf-8?B?UDZodHFPcWtOUC9MNEEveS85V05wL1ZOSm1VWjRSWGpKMXlyRGxaODcyeUx2?=
 =?utf-8?B?cmNSMzNmOThLYzdHR01DS1l0MzhhclhRRFhFU0g5MHBsYTFpUndkbnRNZFUr?=
 =?utf-8?B?UTFXczFtOU5adGZwdmsrV2pERUpFN05jeXgrbFA5WTRPaGFPSC9HSVBNNE1j?=
 =?utf-8?B?Mkk4c3RRb0RVNEQwTy9CdFVlT0tqdXdvcEdncFdLK2VFZ05ycnhtVVJCWG1B?=
 =?utf-8?B?Qk5sd2VsR1plQi9LcFN0SERJcUpDSWEvWUtYZ1BweW1tQXhzcjJiV3pIZWRs?=
 =?utf-8?B?OXVrZk9LeHRhSUNtZ01idkpMMXgvR0RSWm1nL1JVMm4rVlRlNE9Hd2NkenVB?=
 =?utf-8?B?T1l6YTg3bEp1SFYrUkhzaU0yTEh0N0p2YlhOWHcyZnU5bzEzN1VqNDl2RDVT?=
 =?utf-8?B?dU10RUliMDAxR2FwWTdhYkZaOXVmWUJPclFWSERYK05MNGhtY2luWEhpSkxa?=
 =?utf-8?B?Z3VycnFaenowcFdOL08xMGpzU1BsQXJKT1RPYTc1SUxRK0VBVkhadUhaMjFs?=
 =?utf-8?B?L0tQV0lUb2FFME9qZHVtOU1hZk1OQkdRa3UxcGtlMUVPbE8wT1pkUm1zZkdx?=
 =?utf-8?B?T21qU2ZCZWhLSzY5Z2RScklZUnZUUEJhRCt2MTg1dlI4d292N01nZ3AyM05C?=
 =?utf-8?B?NGw1cDhXb0JjQnVUS05kVUY0RDRyRWxWMDczazRPWms5bHZPZDFTWkRZNjF0?=
 =?utf-8?B?TWl5M2NsWCtIQklGLzhxUVYwaW1DcjFLZWlxMFBXZmlrYnZIUjFHNjRERGpH?=
 =?utf-8?B?UUhHSFgwK0tZMjlaRU5Tem9iU2NXTHJxUGt0K251RGt3NjZzcTJGTXZtbzZ1?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdc10b1-000d-4da6-f6c5-08dac7c76e8f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 11:40:59.7443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqJ4GS965AY/qXwKY0TdFiLa1jrA4ffFA8kaWKN/4tr5sahigd/WRiRorszsb1tjpLEaT8DDY2wwVdUMVSRDWJExRALN2JCHLoTsDHXwzn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6616
X-Proofpoint-GUID: vNp_v14CvaWf-ptHBd0kGVSejpRK2SJm
X-Proofpoint-ORIG-GUID: vNp_v14CvaWf-ptHBd0kGVSejpRK2SJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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


On 16/11/22 4:57 pm, Daniel P. Berrangé wrote:
> On Wed, Nov 16, 2022 at 04:49:18PM +0530, manish.mishra wrote:
>> On 16/11/22 12:20 am, Daniel P. Berrangé wrote:
>>> On Tue, Nov 15, 2022 at 06:11:30PM +0000, Daniel P. Berrangé wrote:
>>>> On Mon, Nov 07, 2022 at 04:51:59PM +0000, manish.mishra wrote:
>>>>> Current logic assumes that channel connections on the destination side are
>>>>> always established in the same order as the source and the first one will
>>>>> always be the main channel followed by the multifid or post-copy
>>>>> preemption channel. This may not be always true, as even if a channel has a
>>>>> connection established on the source side it can be in the pending state on
>>>>> the destination side and a newer connection can be established first.
>>>>> Basically causing out of order mapping of channels on the destination side.
>>>>> Currently, all channels except post-copy preempt send a magic number, this
>>>>> patch uses that magic number to decide the type of channel. This logic is
>>>>> applicable only for precopy(multifd) live migration, as mentioned, the
>>>>> post-copy preempt channel does not send any magic number. Also, tls live
>>>>> migrations already does tls handshake before creating other channels, so
>>>>> this issue is not possible with tls, hence this logic is avoided for tls
>>>>> live migrations. This patch uses MSG_PEEK to check the magic number of
>>>>> channels so that current data/control stream management remains
>>>>> un-effected.
>>>>>
>>>>> Suggested-by: Daniel P. Berrangé<berrange@redhat.com>
>>>>> Signed-off-by: manish.mishra<manish.mishra@nutanix.com>
>>>>>
>>>>> v2:
>>>>>     TLS does not support MSG_PEEK, so V1 was broken for tls live
>>>>>     migrations. For tls live migration, while initializing main channel
>>>>>     tls handshake is done before we can create other channels, so this
>>>>>     issue is not possible for tls live migrations. In V2 added a check
>>>>>     to avoid checking magic number for tls live migration and fallback
>>>>>     to older method to decide mapping of channels on destination side.
>>>>> ---
>>>>>    include/io/channel.h     | 25 +++++++++++++++++++++++
>>>>>    io/channel-socket.c      | 27 ++++++++++++++++++++++++
>>>>>    io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
>>>>>    migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
>>>>>    migration/multifd.c      | 12 ++++-------
>>>>>    migration/multifd.h      |  2 +-
>>>>>    migration/postcopy-ram.c |  5 +----
>>>>>    migration/postcopy-ram.h |  2 +-
>>>>>    8 files changed, 130 insertions(+), 26 deletions(-)
>>>> This should be two commits, because the 'io' and 'migration'
>>>> code are two separate subsystems in QEMU.
>>>>
>>>>> diff --git a/include/io/channel.h b/include/io/channel.h
>>>>> index c680ee7480..74177aeeea 100644
>>>>> --- a/include/io/channel.h
>>>>> +++ b/include/io/channel.h
>>>>> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>>>>>                            int **fds,
>>>>>                            size_t *nfds,
>>>>>                            Error **errp);
>>>>> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
>>>>> +                            void *buf,
>>>>> +                            size_t nbytes,
>>>>> +                            Error **errp);
>>>> This API should be called "io_read_peekv" and use
>>>> "const struct iovec *iov", such that is matches the
>>>> design of 'io_readv'.
>>>>
>>>> There should also be a QIOChannelFeature flag
>>>> registered to indicate whether a given channel
>>>> impl supports peeking at data.
>>>>
>>>>
>>>>> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>>>>>                              size_t buflen,
>>>>>                              Error **errp);
>>>>> +/**
>>>>> + * qio_channel_read_peek_all:
>>>>> + * @ioc: the channel object
>>>>> + * @buf: the memory region to read in data
>>>>> + * @nbytes: the number of bytes to read
>>>>> + * @errp: pointer to a NULL-initialized error object
>>>>> + *
>>>>> + * Read given @nbytes data from peek of channel into
>>>>> + * memory region @buf.
>>>>> + *
>>>>> + * The function will be blocked until read size is
>>>>> + * equal to requested size.
>>>>> + *
>>>>> + * Returns: 1 if all bytes were read, 0 if end-of-file
>>>>> + *          occurs without data, or -1 on error
>>>>> + */
>>>>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>>>>> +                              void* buf,
>>>>> +                              size_t nbytes,
>>>>> +                              Error **errp);
>>>> There should be qio_channel_read_peek, qio_channel_read_peekv,
>>>> qio_channel_read_peek_all and qio_channel_read_peekv_all.
>>> Actually ignore that.  We should not add any new APIs at
>>> all.  Instead the io_readv callback, and the qio_channel_read*all()
>>> methods should gain a 'int flags' parameter, in the same way that
>>> the write methods have one. Then there should be as
>>> QIO_CHANNEL_READ_FLAG_PEEK constant defined.
>> Hi Daniel, As MSG_PEEK always reads from top even if there were
>> previos partial reads, so current |qio_channel_readv_all_eofmay
>> not work? I can keep things upto ||qio_channel_readv as common
>> for both with flags parameters but have separate
>> ||qio_channel_readv_peek_all_eof? Does something like that works.|||
> Simplest is probably to just not add 'flags' to the 'all' variants,
> just the non-'all' varants.


sure Daniel, will do that. Thanks.

> With regards,
> Daniel

