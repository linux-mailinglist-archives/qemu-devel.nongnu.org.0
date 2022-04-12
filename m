Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE94FE186
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 15:06:23 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neGDu-0008EG-OF
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 09:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <divya.garg@nutanix.com>)
 id 1neGAS-0005pI-52
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:02:48 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:40040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <divya.garg@nutanix.com>)
 id 1neGAO-0003Ad-Tz
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:02:46 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23CCVmR0026206;
 Tue, 12 Apr 2022 06:02:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=L901HUyUo8UkuacDLAt39iuP6ZVJJsfrUgKAjwkYzwU=;
 b=uJJI1QrnlWG103W4Sf5lYyfsYz5przeVAeRmqfxonZxv/UDt/HQxJcvFrYV2nUz4wyT3
 QyAVQVVJH5nLz+lZTzYn1BVjFHmkiD7hAW+kZU9wYZeufEeI+xVE/w2McgdQtmznV2FT
 8CCF6nxjibyvAoYgwwWKGI1zqFnP7zbr6s1PYaJT5A93jD67Ws9bFQZ5Ofrmxiu3w99R
 tlly1BTBsaNLqR0XB+vEv9d7KLXm4YPK1j6tj3Hy6/zf0PdlHYFAKcbXD85KijFZ+cU5
 OIgxX0KYFLtENo9aNVcDdTG+cvmdeLvCu154ZdDlKb5cwAWdlBl2vANzQDL6rvevPS51 MA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3fb71kp6sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 06:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7lqGx9hGe/htraJQkEDwCipN42x+p720SINpygENnMfn5z2kW6fWUW56jSLzWrraLoh9uwgVP9nN2kgXYPezSWpsNfrKGIP5VQ8+dtc3hk7S38rI7PZuZz5mFVEVI7jgRfjZ4acSs5A5UxdYMx2014V6xwk47V6pjwmQh6ulRfXKQr6BaeBgxMRgf94GdMjbT+jxpx//33yzB6reGhy9ZpjnE2kVe73PTQ8uAhET/awoMiC7sFeonCGSkz3GenqxtaZIlviKXHeOFoXgbVpF+DKhzuwnFDUHqP3w/F2/kysmmDXpvxz1mRH5OwMTMtpVw3vwb7UDbe6Lby7jRcKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L901HUyUo8UkuacDLAt39iuP6ZVJJsfrUgKAjwkYzwU=;
 b=FceM2ZTdT4g6j4f81MvcFxPEccGcVY5FSb436WjKcGBEt/wgvuprmGH3gHesqAmVBLupifPhEm2QqxsA18/MQL0BZYUgIsDScM4DdombeB4L5C/CSktdel7UjI9Q4WnOS8BLH7X2qwJNDH/R42Cd3nSW82roIYY3pAxhUpmFkZPPSu9auG0OtYBz2ewijIgf1j2Yj81yVLr+8+19cCZ4Xn1bo432mAkFDcyfm55mqRKcvJZoXwTo15VzWCfXb4vgONVmCUqasi3BbuQMWJVmsltRNgES0l+HFvlvD2myVRcGYM3M4+nd5scszdc3Lj3zgqK1AgDvvx3rGymlMEyd3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SJ0PR02MB7775.namprd02.prod.outlook.com (2603:10b6:a03:326::12)
 by DM6PR02MB6217.namprd02.prod.outlook.com (2603:10b6:5:1d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 13:02:39 +0000
Received: from SJ0PR02MB7775.namprd02.prod.outlook.com
 ([fe80::3dbb:6b0e:599:f05c]) by SJ0PR02MB7775.namprd02.prod.outlook.com
 ([fe80::3dbb:6b0e:599:f05c%7]) with mapi id 15.20.5164.018; Tue, 12 Apr 2022
 13:02:38 +0000
Message-ID: <c9822d09-9c64-fddf-671b-389e21022e8d@nutanix.com>
Date: Tue, 12 Apr 2022 18:32:32 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [Qemu-devel] [PATCH 6/8] i386/kvm: hv-stimer requires hv-time and
 hv-synic
To: Vitaly Kuznetsov <vkuznets@redhat.com>
References: <2dde6caa-8d02-7022-d2c2-aa56c408f5f2@nutanix.com>
 <87tuay5uy3.fsf@redhat.com>
From: Divya Garg <divya.garg@nutanix.com>
In-Reply-To: <87tuay5uy3.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To SJ0PR02MB7775.namprd02.prod.outlook.com
 (2603:10b6:a03:326::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c2d7202-0dfc-49eb-074e-08da1c84b8bf
X-MS-TrafficTypeDiagnostic: DM6PR02MB6217:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB621768CE7AF97EDF69947FBF9AED9@DM6PR02MB6217.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWkBDAGNyMWoM9QneKNZSQ0YXjgKd6kv1npoZJPgsN5EQ3Yqp4CZcDrLkVaEJjnJsXPVrt7h1opCr3KvEi+9ABzNPrUcLe1rXYcN9HkmLtl4YhDucl2D84qBmxwvd+XR/SmJDm9JK3gceTy+Re8RSwvFHvLwhFmKFLEsTe5Snd/44RbPczTeExxqZMNl3qHYmPhaHrVleUNzV+13RzXeBDxkmHk3ROH4wjWC471gc7Cb1FIlrQYQisTEoF4Zl41+sl6aWiNczGA4CXb6swDDZvCHETgVRmvnAP+B527kJI4Upu2Rkzu4XrtazIHMDbe5IPd0c/HA4wveUSg/Utw7unDkAJNOSIXTMxFF3KwdcWZ+gPi6IgvOFxZpeSeByt+McKsIVZcVlZLZRBQngtTMBNC+3BPFvw9xTHq0hVvDIEIUL4BPAVGPXE925AQZM9sZCx9IWFQXjYJFJ15w+P1LR12EpG1LTIJ9jyQ+FYdNpZZOTrmRKowoDKP+aK1S7f9jaBAF7u2mXHYKEz3atvu36hVlH7h8fWlu4Lo9IsRgl7IzcEGhEWtRMDvUd9YfaI0CnHtvToHfss1n6y3o6vm/bpMZsolPn9dOUYeT6/0Tsc3dt8qZTcPOYtmP3MhXG0Xuxd3lP00APFwRLVUm6V2Cc4saxMcIUamJx0twVqys0UZSm84IqGGLtDy/Z0OrDIumRb7wQKFooKn4mbhQ2ZA3BHC1/hfHJ0mKBPgAvcWUSQjKxvgL0zaYP2Pgp9zbhVJG3TBrLZvVKxVxKC2gZLz4q7jAKXU7p8Y+g75TrmK2YcKeh0Yw2TYkoBGOiWIFDAObVINGynm8IKrJLwTzFqVG5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7775.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(2906002)(38100700002)(508600001)(6486002)(8936002)(31696002)(6506007)(5660300002)(66946007)(4326008)(316002)(8676002)(66476007)(26005)(186003)(6916009)(83380400001)(44832011)(38350700002)(66556008)(6666004)(2616005)(6512007)(53546011)(36756003)(31686004)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytBcjUxUXV5M3hzR1J2WlNQQ293UHV4K3FNc3ZKdFlsdEN2M3VLalZPaGRB?=
 =?utf-8?B?M2R2c1lwekJYUTB5eEp3SEtWZ2xuQmw5WGdkTFpIN0liN28xcWhSVDg4TCtk?=
 =?utf-8?B?SXFtWWpoMkZUMnh4UTJKY1pmQW1YRlNSbE5EUmVGdUNRMUxoMytacEU1SGEy?=
 =?utf-8?B?UDloSGFIMTBJRHhtRjNKTGdrLzk0UkN1UDUyb3NPREtNd2tZVTV1UzlINkIr?=
 =?utf-8?B?aGFwZEhiR3Ewc2czbVpJRDdXcFQ2YVVaeWdXQVVjZlZtMG4xZklvdkhoZE5i?=
 =?utf-8?B?dDZ1Z3hFL0RjU0tqTHVSbFIrWlMrLzQ4N2x2THhDVlJWd3VTa0ltMG1tMmZI?=
 =?utf-8?B?NXIxTU9LdzZrZGVKTG5wYVBxa3dOSXlyeEVnNHY1L3pqSTVTZG1kZXYyM29w?=
 =?utf-8?B?RGR2YUg1ZVlOQjVzT256VktMZHlSaENxTno3bnkrMVhDODdhN0ZwMnI4d3RV?=
 =?utf-8?B?eU5RTW5ZKzg3Y3ZOYzQrL3VyNzB5ekMxSThhdW9mZVlZaGsyZzlVR29nL3dp?=
 =?utf-8?B?TTdJODdEaXRCQ21tMmJRQ0cydS93cXpIc1RmQi9nQTBpT0k2NE1LeTYxNUZt?=
 =?utf-8?B?MDlNYWwycXZidUtEaG9SYzdObUlWbENMZmk4Z3VBOGhWa0VtMThWT1d4QXRF?=
 =?utf-8?B?T2xtcnRXblpGOTZYcU9TR1kxK3U2cDJKZzhBRlhWYW1INTd4VzVoaGYvbm5s?=
 =?utf-8?B?cW5GcC9vWWVDSGhCNmpLRmNKYXQwNEMrWlc3dFN1NE5Tc000UzllVGhqelZy?=
 =?utf-8?B?Y21RRjBWcmV2bmRJZlBvZjFnMHZjdWRHemxFbkRoMDk5aHFWd0N5ZExJQms1?=
 =?utf-8?B?QVlXVmU2d3ovN2R6MHpWSVAyeDBHV1ZCV2hpRlNBVi9ZZkNwcU14eGFiaVRi?=
 =?utf-8?B?RHh5MFQvK0RVZE1URUV1dGEzOWhwQkhjRUt4VEJCeHlFNzNGYmtZSVZRVnJD?=
 =?utf-8?B?YUVWMWNRTUY1TlU5L3dwbmRldXR6VTQ0dzB5TkdmTU81Mk5MbTBGZWtSN1ZM?=
 =?utf-8?B?ek9MdXJlaGFnMi9DZFJmd1dNMklPTzVGeHM2bSttOFhJendIUTluSm1WTkxD?=
 =?utf-8?B?UHNqRVcxYjhtMXJtUFpnSTJCSG8rd2NnK1crVXBOblJkcWdibUVIazFNclZY?=
 =?utf-8?B?UWZrU1dNYWtrOVF5ZWJwekl6T3BSWlcwTDBoYnpnaHR5dFVpTWNTWFpKMmdm?=
 =?utf-8?B?WnFQWi9KOEZNZTlVVkw0ZVMxYk5rTy9EaEhlTTRQeWVIR2VMWEhYaGo5T2tP?=
 =?utf-8?B?M1huRy9acW1wVVJOREd0dEtjRnhDb1ljaTl5UmhabWE1NHczUzZ1NHB6cG10?=
 =?utf-8?B?bFNlL2pvdUwzRExLN2MrZWZ5b1g2WjhUVjgrS1JGa0xJS3JTeEwwamg5d0l3?=
 =?utf-8?B?ajZ6c0lMM0tzOFNKdnVLSXNSQkZjRmNSZ2x5Uk9xSk1IamxVN2pST3Y2QmxW?=
 =?utf-8?B?Q3RYTVlLejZvZmRzaWtmOU5ydFVyU1lXeHlxZDF0SVdnSG9zQzhmV3BLcmZj?=
 =?utf-8?B?clBGYldMUFNoZGt6cDE5ZUlVUTVIWFdFWmJMS0R1LzNDay9TbWkzOVpYT0Rz?=
 =?utf-8?B?L21VaXB2d2dIL3I0Lzk0czNBK3BMRmNtZWpKTm9TVk1adVhub1UwTDBCUkEr?=
 =?utf-8?B?ZFA2RytQckNZdnRGdVcxZ1dpWm1hUWw2S2ZUVm9pU1RQV1F3Uk1ZSDQzQTlS?=
 =?utf-8?B?Y0hWd1VMYUpCMUdBb3ZoTGdjcVM1OE0zZDdhZ3IxQ3c3NUg1bmc0Ui84Q2Zn?=
 =?utf-8?B?OERORG5pSm44Qk1zMk1HZHpWckFFNzR1RVZYUWFjNG9aSjNYRkNvYStjUzJW?=
 =?utf-8?B?NWU1WUJDNUtqM1QwclRxNnV5Y1BpNlNUMjlzaHMwUS83R0Y2bG1NQjg5MEh0?=
 =?utf-8?B?YWtLNi94ZEtqeVhLdHFLdFRIcU44L0U0R051Y25NaTI1aW94Nkl6cXVTbk1Y?=
 =?utf-8?B?b1BZak8yYUtEdUtFcGpjMVZGSHprdjU2ZlBNUDB5NVlkODNtMGJ4Q0hrcEp6?=
 =?utf-8?B?eWx3ZTNCN1VTZWZjb3ErYUhidW8rdHlpTHNmQ1RjNWg2Y09IRG9BVTRNaTJ6?=
 =?utf-8?B?LzRmNVpOeTFZSGNsWkRCdWY1WHVQYjlXUkdNWlY1NFpEVS9zYXd5c1NFUUx1?=
 =?utf-8?B?RDdsMzUvaWwwd0FYZFVtR1k4UEd6dkxPS04vRFBjeWM1ZXNqSitSR29ySkND?=
 =?utf-8?B?S0RVQ1NQc0FYRTRIL2ZlUm9LLzExeE5uN3FLTXQwUU9WbG0ya2lyazY1ZW4y?=
 =?utf-8?B?VktoSEhrb0NrWDFQZThydTQ1S1l1VjhLMStvZFlMZDVUR3pWcUZ3RVlzdmk1?=
 =?utf-8?B?Z0Z5TE16SERVNCtmOVNPRU9JeDBFWTdZb3lmMyt5WU5xWlRDb1BPM3BaSXRQ?=
 =?utf-8?Q?oNQVfzVq0/7MJ5fg=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c2d7202-0dfc-49eb-074e-08da1c84b8bf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7775.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 13:02:38.8696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNSxitwjYY+F8WIg0O1zr1wtJZ3t8Ilh8SOaMK1yFi/KG9uyebkHcOISQGtRfDJ1sQAIt2k9fmBbQJjWGq03og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6217
X-Proofpoint-GUID: vTZ2QHFWVS2ryL_g58uQw5x2UDZJCOq4
X-Proofpoint-ORIG-GUID: vTZ2QHFWVS2ryL_g58uQw5x2UDZJCOq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_04,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=divya.garg@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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


On 12/04/22 6:18 pm, Vitaly Kuznetsov wrote:
> Divya Garg <divya.garg@nutanix.com> writes:
>
>> Hi Vitaly Kuznetsov !
>> I was working on hyperv flags and saw that we introduced new
>> dependencies some
>> time back
>> (https://urldefense.proofpoint.com/v2/url?u=https-3A__sourcegraph.com_github.com_qemu_qemu_-2D_commit_c686193072a47032d83cb4e131dc49ae30f9e5d7-3Fvisible-3D1&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=2QGHz-fTCVWImEBKe1ZcSe5t6UfasnhvdzD5DcixwOE&m=ln-t0rKlkFkOEKe97jJTLi2BoKK5E9lLMPHjPihl4kpdbvBStPeD0Ku9wTed7GPf&s=AtipQDs1Mi-0FQtb1AyvBpR34bpjp64troGF_nr_08E&e= ).
>> After these changes, if we try to live migrate a vm from older qemu to newer
>> one having these changes, it fails showing dependency issue.
>>
>> I was wondering if this is the expected behaviour or if there is any work
>> around for handing it ? Or something needs to be done to ensure backward
>> compatibility ?
> Hi Divya,
>
> configurations with 'hv-stimer' and without 'hv-synic'/'hv-time' were
> always incorrect as Windows can't use the feature, that's why the
> dependencies were added. It is true that it doesn't seem to be possible
> to forward-migrate such VMs to newer QEMU versions. We could've tied
> these new dependencies to newer machine types I guess (so old machine
> types would not fail to start) but we didn't do that back in 4.1 and
> it's been awhile since... Not sure whether it would make much sense to
> introduce something for pre-4.1 machine types now.
>
> Out of curiosity, why do such "incorrect" configurations exist? Can you
> just update them to include missing flags on older QEMU so they migrate
> to newer ones without issues?
>
Hi Vitaly !

Thanks for the response. I understand that these were incorrect 
configurations
and should be corrected. Only issue is, we want to avoid power cycling those
VMs. But yeah I think, since the configurations were wrong we should 
update and
power cycle the VM.  Just for understanding purpose, is it possible to 
disable
the feature by throwing out some warning message and update libvirt to 
metigate
this change and handle live migration ?

Or maybe update libvirt to not to ask for this feature from qemu during live
migration and handle different configuration on source and destination 
host ?

Thanks
Regards
Divya

